-- Notices when a live, uninspected generated-case evidence item settles into
-- the player's inventory and asks PlayerVoice to deliver Set D (see
-- docs/design/UI_POLISH_PROPOSALS.md #8 and docs/design/PLAYER_VOICE.md).
-- This module owns none of the voice logic itself -- rotation, the
-- once-per-item guard and the cooldown all live in PlayerVoice.onEvidenceFound
-- -- it only decides *whether* that call is warranted.
--
-- Hooks the same entry points ClueMarkers and LocalPersonHooks already wrap
-- to notice an item arriving in the player's inventory, rather than inventing
-- a new one: ISTransferAction.transferItem and ISGrabItemAction.transferItem
-- (both wrapped by ClueMarkers for pickup-location bookkeeping) and
-- ISInventoryTransferAction.perform (wrapped by LocalPersonHooks for identity
-- observation). Each wrap here is independent and cooperative -- it calls
-- through to whatever was previously assigned, exactly like those two
-- modules do for each other -- so install order does not matter.
--
-- Every engine call uses colon syntax on an explicit receiver (AGENTS.md's
-- engine call form rule: `pcall(obj.method, obj, ...)` silently does nothing
-- on a Kahlua engine object). Every wrap and every lookup is pcall-guarded so
-- a missing vanilla method, a GeneratedRuntime that never started, or a
-- PlayerVoice that failed to load degrades to silence, never a throw that
-- could break the underlying pickup/transfer action.
ConspiracyFiles=ConspiracyFiles or {}
local E=ConspiracyFiles.EvidencePickupHint or {}
ConspiracyFiles.EvidencePickupHint=E
local CFLog=require("ConspiracyFiles/Log")
local function log(message) CFLog.message("hint","hint",message) end
local function safe(fn,...)
    local ok,result=pcall(fn,...)
    if not ok then log("Skipped: "..tostring(result)) end
    return result
end

-- True only once the item has actually come to rest in the player's own
-- inventory (not a corpse, not a crate, not mid-drag). Mirrors the check
-- ClueMarkers.after makes for the same reason.
local function inPlayerInventory(character,item)
    if not character or not item then return false end
    local ok,p=pcall(getPlayer)
    if not ok or character~=p then return false end
    local ok2,container=pcall(function() return item:getOutermostContainer() end)
    if not ok2 or not container then return false end
    local ok3,inv=pcall(function() return character:getInventory() end)
    return ok3 and container==inv
end

-- Guarded independently of inPlayerInventory so a missing GeneratedRuntime or
-- PlayerVoice (module load order, or the generated case never started) is
-- indistinguishable from "nothing to say" rather than a thrown error that
-- could interrupt the transfer/pickup action calling this.
function E.consider(character,item)
    if not inPlayerInventory(character,item) then return end
    local R=ConspiracyFiles.GeneratedRuntime
    local V=ConspiracyFiles.PlayerVoice
    if not R or not R.subject or not R.isInspected or not V or not V.onEvidenceFound then return end
    local ok,subject=pcall(R.subject,item)
    if not ok or not subject then return end
    local ok2,inspected=pcall(R.isInspected,item)
    if not ok2 or inspected then return end
    safe(V.onEvidenceFound,item)
end

-- Each wrapper is flagged on its own. A single `installed` flag was set even
-- when none of the action classes existed yet, so the OnGameStart retry
-- returned early and nothing was ever wrapped - the hint would simply never
-- fire if this module happened to load before the vanilla timed actions.
function E.install()
    local okT=pcall(require,"TimedActions/ISTransferAction")
    if not E.wrappedTransfer and okT and ISTransferAction and type(ISTransferAction.transferItem)=="function" then
        E.wrappedTransfer=true
        local original=ISTransferAction.transferItem
        ISTransferAction.transferItem=function(self,character,item,source,destination,...)
            local result=original(self,character,item,source,destination,...)
            safe(E.consider,character,result or item)
            return result
        end
    end
    local okG=pcall(require,"TimedActions/ISGrabItemAction")
    if not E.wrappedGrab and okG and ISGrabItemAction and type(ISGrabItemAction.transferItem)=="function" then
        E.wrappedGrab=true
        local original=ISGrabItemAction.transferItem
        ISGrabItemAction.transferItem=function(self,worldItem,...)
            local okItem,item=pcall(function() return worldItem:getItem() end)
            local result=original(self,worldItem,...)
            if okItem then safe(E.consider,self and self.character,item) end
            return result
        end
    end
    local okI=pcall(require,"TimedActions/ISInventoryTransferAction")
    if not E.wrappedInventory and okI and ISInventoryTransferAction and type(ISInventoryTransferAction.perform)=="function" then
        E.wrappedInventory=true
        local original=ISInventoryTransferAction.perform
        ISInventoryTransferAction.perform=function(action,...)
            local item=action and action.item
            local result=original(action,...)
            safe(E.consider,action and action.character,item)
            return result
        end
    end
    E.installed=E.wrappedTransfer and E.wrappedGrab and E.wrappedInventory or false
end

if Events and Events.OnGameStart and not E.startHooked then
    Events.OnGameStart.Add(function() safe(E.install) end)
    E.startHooked=true
end
E.install()


-- A REPEATING reminder while unread evidence is carried.
--
-- Owner, 2026-09-11, carrying a fancy pen for an hour without realising it was
-- evidence: "can you please add a reminder on top of player that we have not
-- done that?" The pickup line fired once, as designed, and was missed - and
-- once is all it ever says for an item.
--
-- So while anything carried is live evidence the notebook has not recorded,
-- the halo repeats every few minutes. Halo ONLY: no speech and no sound. The
-- speech line is the survivor noticing a thing once; this is a quiet mark
-- above their head, and a mod whose survivor repeats himself every three
-- minutes is a mod people uninstall.
E.REMIND_EVERY_MS=180000
E.SCAN_EVERY_MS=5000
local lastScan,lastRemind=0,0

-- Distinct unread documents carried, counting a pile once: six lunchboxes are
-- one piece of evidence. Searches the inventory and one level into containers
-- in it, which covers a bag and the survivor's own papers.
function E.unreadCarried(player)
    local runtime=ConspiracyFiles.GeneratedRuntime
    if not player or not runtime or not runtime.subject or not runtime.isInspected then return 0 end
    local seen,count={},0
    local function consider(item)
        local ok,md=pcall(function() return item:getModData() end)
        local id=ok and type(md)=="table" and md.cfGeneratedId
        if not id or seen[id] then return end
        local okS,subject=pcall(runtime.subject,item)
        local okI,read=pcall(runtime.isInspected,item)
        if okS and subject and okI and not read then seen[id]=true; count=count+1 end
    end
    local function walk(container,depth)
        local items=container and container.getItems and container:getItems()
        if not items then return end
        for i=0,items:size()-1 do
            local item=items:get(i)
            if item then
                consider(item)
                if depth<1 and item.getInventory then
                    local ok,inner=pcall(function() return item:getInventory() end)
                    if ok and inner then walk(inner,depth+1) end
                end
            end
        end
    end
    local ok,inventory=pcall(function() return player:getInventory() end)
    if ok and inventory then walk(inventory,0) end
    return count
end

function E.reminderText(count)
    if count<=0 then return nil end
    if count==1 then return "Unread evidence" end
    return count.." unread pieces of evidence"
end

function E.remindTick()
    local now=getTimeInMillis and getTimeInMillis() or 0
    if now-lastScan<E.SCAN_EVERY_MS then return end
    lastScan=now
    if now-lastRemind<E.REMIND_EVERY_MS then return end
    local player=getPlayer and getPlayer()
    local text=E.reminderText(E.unreadCarried(player))
    if not text then return end
    lastRemind=now
    pcall(function() player:setHaloNote(text,230,210,140,600) end)
    log("reminded: "..text)
end

if Events and not E.remindHandler then
    E.remindHandler=function() E.remindTick() end
    Events.OnTick.Add(E.remindHandler)
end

return E
