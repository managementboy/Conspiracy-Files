-- Bounded, kind-diverse storage candidates. No engine calls or loot inspection.
local M={MAX_KINDS=8,PER_KIND=8,MAX_SITE_TYPES=9}
-- 'none' is an untyped inventory (including bodies), not an identified piece
-- of furniture. Vehicles and marked carriers keep their own placement paths.
local reserved={floor=true,none=true,vehicle=true,carrier=true}
function M.fixedKind(kind)
 return type(kind)=="string" and #kind<=80 and kind:find("%S")~=nil
     and not kind:find("%c") and not reserved[kind]
end
function M.siteKind(kind) return kind=="vehicle" or M.fixedKind(kind) end
local function key(t)
 return table.concat({t.x,t.y,t.z,t.objectIndex,t.containerIndex,t.vehiclePart or "-"},":")
end
function M.new() return {groups={},order={},seen={}} end
function M.offer(pool,target,room,occupied)
 local kind=target.containerType
 if not M.fixedKind(kind) or pool.seen[key(target)] then return false end
 local group=pool.groups[kind]
 if not group then
  if #pool.order>=M.MAX_KINDS then return false end
  group={};pool.groups[kind]=group;pool.order[#pool.order+1]=kind
 end
 if #group>=M.PER_KIND then return false end
 group[#group+1]={target=target,room=room,occupied=occupied==true}
 pool.seen[key(target)]=true
 return true
end
function M.finish(pool)
 local candidates,rooms,occupied={},{},{}
 -- One of each kind before second choices. Eight counters cannot hide the
 -- later bedroom drawer, and an all-crate warehouse still has eight targets.
 for round=1,M.PER_KIND do
  for _,kind in ipairs(pool.order) do
   local item=pool.groups[kind][round]
   if item then
    local i=#candidates+1;candidates[i]=item.target;rooms[i]=item.room;occupied[i]=item.occupied
   end
  end
 end
 return candidates,rooms,occupied
end
local function hash(value)
 local n=7
 for i=1,#value do n=(n*131+string.byte(value,i))%2147483647 end
 return n
end
-- Keep authored room/occupancy preferences, then prefer kinds not already
-- used in this case. Each kind gets one tie-break value regardless of how many
-- containers it has; a populous kitchen gets no extra votes. Seeded ties also
-- stop the first scanned room winning every otherwise equal choice.
function M.choose(list,salt,usable,rank,usedKinds)
 local best,bestRank,bestUse,bestKind,bestTarget
 for i,t in ipairs(list or {}) do
  if usable(i) then
   local r=rank and rank(i) or 0
   local uses=usedKinds and usedKinds[t.containerType] or 0
   uses=uses or 0
   local k=hash(t.containerType..":"..tostring(salt))
   local p=hash(key(t)..":"..tostring(salt))
   if not best or r<bestRank or (r==bestRank and (uses<bestUse
      or (uses==bestUse and (k<bestKind or (k==bestKind and p<bestTarget))))) then
    best,bestRank,bestUse,bestKind,bestTarget=i,r,uses,k,p
   end
  end
 end
 return best
end
return M
