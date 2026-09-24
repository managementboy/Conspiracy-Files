-- A KEY SEEN BEFORE ITS BODY IS STAMPED MUST NOT STAY ANONYMOUS.
--
-- Playtest, 2026-09-24. The survivor stood among several corpses, picked up
-- nothing, and watched the PDA fill with identical rows:
--
--   3. A key
--   4. A key
--   5. A key
--
-- A corpse's provenance token is written by a queued observation on a 30-tick
-- cycle, so a key drawn in a pane before its body is stamped arrives with
-- token=nil. KeyObservations.observe then returned early for any id it already
-- held, so the first tokenless record won permanently: the key never gained
-- its body, stayed in its own "loose" group, and rendered as a bare "A key"
-- with no name and no carrier - one per key, indistinguishable, and caused by
-- looking rather than by doing anything.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local M=require("ConspiracyFiles/KeyObservations")

local function record(id,token)
    return {id=id,keyId=100+tonumber(id),token=token,carrier=token and "Mai Gray" or nil,
        building=nil,label=nil,x=10,y=20,z=0,observedAt=5}
end

-- 1. A KEY ADOPTS THE TOKEN IT WAS SEEN WITHOUT.
local root=M.empty()
local staged,changed=M.observe(root,record("1",nil))
assert(changed,"the first sighting must record")
assert(staged.keys["1"].token==nil,"this sighting genuinely had no token")
local adopted,changed2=M.observe(staged,record("1","corpse-item:77"))
assert(changed2,"the key must adopt the provenance it was seen without")
assert(adopted.keys["1"].token=="corpse-item:77","the token was not adopted")
assert(adopted.keys["1"].carrier=="Mai Gray","the carrier was not adopted with it")

-- 2. ADOPTION ONLY EVER IMPROVES WHAT IS KNOWN. A key that already has a body
--    must never be moved to another one.
local moved,changed3=M.observe(adopted,record("1","corpse-item:99"))
assert(changed3==false,"a key with a body must not be reassigned to another")
assert(moved.keys["1"].token=="corpse-item:77","the original body was overwritten")

-- 3. THE ROWS GROUP BY BODY ONCE ADOPTED, instead of one anonymous row each.
local many=M.empty()
for _,id in ipairs({"1","2"}) do many=(M.observe(many,record(id,nil))) end
local loose=M.rows(many)
assert(#loose==2,"two tokenless keys should be two loose rows, got "..#loose)
for _,row in ipairs(loose) do
    assert(row.title=="A key",'an unattached key reads as "A key": '..row.title)
end
for _,id in ipairs({"1","2"}) do many=(M.observe(many,record(id,"corpse-item:77"))) end
local grouped=M.rows(many)
assert(#grouped==1,"two keys from one body must read as one entry, got "..#grouped)
assert(grouped[1].title:find("on a body",1,true) or grouped[1].title:find("keys",1,true),
    "the grouped row does not say the keys came off a body: "..grouped[1].title)

-- 4. THE CLAIM STAYS AT THE STRENGTH A KEY SUPPORTS.
assert(grouped[1].detailText:find("does not say whose it was",1,true),
    "the row must refuse to infer ownership from a key")

print("PASS key provenance: a key seen before its body is stamped adopts that body, "
    .."never changes body, and stops reading as an anonymous \"A key\"")
