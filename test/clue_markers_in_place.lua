-- WHERE IT LAY (owner, 2026-09-18: "I have a pen and found a clue. are we not
-- writing them to the map anymore?").
--
-- Until P4-R132 every clue was picked up, and the marker module learned every
-- finding location from its wraps of the transfer actions. Since then a clue
-- can be recognised by searching and noted where it lies, and that way of
-- playing recorded no location at all: nothing for the pen to write, and the
-- record's MAP NOTE line said so.
--
-- These are the four squares that must be taken, and the one that must not:
-- the drawer across the room, the body on the floor, the pickup that happened
-- before anyone recognised anything - and never the survivor's own.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
require("ConspiracyFiles/Generated/SuccessiveCases").current=function(store) return store end

Events={OnTick={Add=function() end,Remove=function() end},OnGameStart={Add=function() end}}
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
local data,pen={},false
local inv={containsTypeRecurse=function(_,s) return pen and s=="Pen" end,containsTagRecurse=function() return false end}
local player={getInventory=function() return inv end,getModData=function() return data end}
getPlayer=function() return player end
ItemTag={get=function(s) return s end};ResourceLocation={of=function(s) return s end}
getWorld=function() return {getMap=function() return "Muldraugh, KY" end} end
local clock=0;getTimeInMillis=function() clock=clock+1;return clock end
instanceof=function() return false end

local root={known={},recognised={},
 assignments={drawer={physicalToken="t:drawer",status="placed"},body={physicalToken="t:body",status="placed"},
  hand={physicalToken="t:hand",status="placed"},early={physicalToken="t:early",status="placed"},
  old={physicalToken="t:old",status="placed"}},
 case={documents={{id="drawer",title="Dispatch copy"},{id="body",title="Folded note"},
  {id="hand",title="Receipt"},{id="early",title="Ledger page"},{id="old",title="Historical"}}}}
ModData={get=function(k) if k=="ConspiracyFiles.Generated.G2" then return {canonical=root} end end}

local function square(x,y,z) return {getX=function() return x end,getY=function() return y end,getZ=function() return z or 0 end} end
-- Where the survivor is standing. Nothing here may ever read it.
local standing=square(5,5,0)
-- A drawer two tiles away, seen through an open loot window: it answers with
-- its own grid square, as every static container does.
local drawer=square(120,230,0)
local drawerContainer={getSourceGrid=function() return drawer end,getParent=function() return nil end,
 isInCharacterInventory=function() return false end}
-- A body on the floor. Its container is reached through getContainer() and has
-- no grid square of its own (P4-R134); the body it hangs off does.
local bodySquare=square(300,400,0)
local corpse={getSquare=function() return bodySquare end}
local bodyContainer={getSourceGrid=function() return nil end,getParent=function() return corpse end,
 isInCharacterInventory=function() return false end}

local function clue(id,container)
 local item={md={cfGeneratedId=id,cfPhysicalToken="t:"..id},outer=container,container=container}
 item.getModData=function(self) return self.md end
 item.getWorldItem=function() return nil end
 item.getContainer=function(self) return self.container end
 item.getOutermostContainer=function(self) return self.outer end
 return item
end
for _,name in ipairs({'TimedActions/ISTransferAction','TimedActions/ISGrabItemAction','ISUI/Maps/ISWorldMap'}) do package.preload[name]=function() return {} end end
ISTransferAction={transferItem=function() end};ISGrabItemAction={transferItem=function() end};ISWorldMap={render=function() end}
local M=require("ConspiracyFiles/ClueMarkers");assert(M.start())
local function records() return data["ConspiracyFiles.ClueMarkers"].records end

-- (1) NOTED WHERE IT LIES: the drawer's square, never the survivor's.
assert(M.foundHere(clue("drawer",drawerContainer))==true,"noting a clue where it lies records its finding location")
local mark=records().drawer
assert(mark and mark.x==120 and mark.y==230 and mark.z==0,"the clue's own square, not the survivor's: "..tostring(mark and mark.x))
assert(mark.x~=standing:getX(),"the survivor's position is never the finding location")
assert(mark.written==false,"a mark waits for a writing tool, as a pickup's does")
root.known={"drawer"}
assert(M.note("drawer")=="Finding location remembered. Map marking waits for a pen or pencil.")
M.update();assert(records().drawer.written==false,"no pen, no mark")
pen=true;M.update()
assert(records().drawer.written==true and records().drawer.ink=="Pen","the mark catches up when a pen is found")
assert(M.note("drawer")=="Finding location marked on your world map.","the record's MAP NOTE line says the mark is there")
pen=false

-- (2) A CLUE IN THE POCKETS is refused: the pickup recorded where it came
-- from, and where the survivor stands now is not it.
local carried=clue("hand",inv);carried.outer=inv
assert(M.foundHere(carried)==false,"a carried clue records nothing here")
assert(records().hand==nil,"nothing fabricated at the survivor's feet")

-- (3) A CLUE ON A BODY is marked where the body is.
assert(M.foundHere(clue("body",bodyContainer))==true)
assert(records().body.x==300 and records().body.y==400,"the body's square")
-- And the same square when the clue is taken OFF the body instead: the
-- pickup path asked the container for a grid square it does not have.
local taken=clue("early",bodyContainer)
local dest={isInCharacterInventory=function(_,p) return p==player end}
local candidate=M.before(player,taken,bodyContainer,dest)
assert(candidate and candidate.x==300 and candidate.y==400,"a clue taken off a body knows where the body was")

-- (4) PICKED UP BEFORE ANYONE RECOGNISED IT ("Look it over" afterwards): the
-- finding location is taken at the pickup and kept. Nothing about recognition
-- may become a condition of recording it.
assert(#root.recognised==0,"nobody has recognised anything")
taken.outer=inv;M.after(candidate,taken)
assert(records().early.x==300,"an unrecognised clue's pickup still records where it came from")
-- Noting it later must not move the mark to wherever it is being read.
assert(M.foundHere(taken)==false)
assert(records().early.x==300,"the pickup's square survives the note")

-- (5) A HISTORICAL clue, already known before any of this, is not invented.
root.known={"drawer","old"}
assert(M.foundHere(clue("old",drawerContainer))==false,"a clue already known gains no fabricated location")
assert(records().old==nil)
local _,_,missing=M.status();assert(missing==1,"and is reported as missing, not marked")

-- (6) The guards a pickup has, a note in place has too.
local wrong=clue("drawer",drawerContainer);wrong.md.cfPhysicalToken="no"
assert(M.foundHere(wrong)==false,"a physical token that does not match is refused")
root.assignments.body.status="conflict"
local conflicted=clue("body",drawerContainer)
assert(M.foundHere(conflicted)==false,"a conflicted clue records nothing")
assert(M.foundHere(clue("nothing",drawerContainer))==false,"an item of no case records nothing")
local nowhere=clue("hand",{getSourceGrid=function() return nil end,getParent=function() return nil end})
assert(M.foundHere(nowhere)==false,"a container with no square anywhere records nothing")

print("PASS noted where it lay: the drawer's square, the body's square, never the survivor's, the pickup's square kept, historical and conflicted clues refused")
