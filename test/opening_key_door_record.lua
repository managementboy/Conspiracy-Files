-- USING THE OPENING KEY ON THE DOOR IT FITS MUST LEAVE A RECORD.
--
-- Windows playtest, 2026-09-24: the survivor's opening key opened the starting
-- house and nothing was recorded. Two separate reasons, both fixed here.
--
--  1. LocalPersonIntegration.heldKey returns only keys carrying
--     cfLocalPersonCase. The generated opening key carries cfGeneratedId, so
--     heldKey resolved to nil, observeDoor took the corpse-key lead branch, and
--     the successful use left no trace. The session console has no
--     keyDoorMatch line at all.
--
--  2. Even once the fact is stored, KeyConnection only yields a row when a
--     named document, a key source, a door match AND an anonymous clue all line
--     up (KeyConnection.lua:13). A lone match produced a stored fact and
--     nothing the player could see.
--
-- What the record may say is bounded by what a lock can witness. It fits, or it
-- does not. Ownership, who left the key, and why the survivor had it are not
-- observable through a door, and the earlier Linux report's contradiction -
-- two sampled keys opening none of the tested doors - is a reason to verify in
-- game rather than to assert anything stronger here.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local stores={}
ModData={
    get=function(tag) return stores[tag] end,
    getOrCreate=function(tag) stores[tag]=stores[tag] or {}; return stores[tag] end,
}
package.loaded["ConspiracyFiles/SaveBudget"]={check=function() return true,"budget" end}
ConspiracyFiles={GeneratedRuntime={known=function() return {} end}}
local J=require("ConspiracyFiles/KeyJournal")

-- A lone door match: the survivor tried their own key and the lock turned.
local match={kind="keyDoorMatch",id="opening:generated:1:1915:14380:0:2",
    keyToken="generated:1",keyId=4242,doorId="1915:14380:0:2",buildingId="201-n-carl"}
local ok,why=J.observe(match)
assert(ok,"a lone key-door match must be accepted: "..tostring(why))

-- 1. IT IS VISIBLE. This is the assertion the playtest would have failed.
local rows=J.rows()
assert(#rows==1,"a lone match produced "..#rows.." rows; the player sees nothing")
local row=rows[1]
assert(row.id:find("keydoor:",1,true),"the row must be identifiable as a key-door observation")
assert(type(row.detailText)=="string" and #row.detailText>0,"the row has no text")

-- 2. IT SAYS ONLY THAT THE KEY FITS.
local text=row.detailText:lower()
assert(text:find("cut for this door",1,true) or text:find("fits",1,true),
    "the record must state the one thing the lock witnessed: "..row.detailText)
for _,claim in ipairs({"my house","my home","belonged to","i own","my key was","the owner",
                       "lived here","i lived","this is mine"}) do
    assert(not text:find(claim,1,true),
        "the record infers ownership from a lock ("..claim.."): "..row.detailText)
end

-- 3. TRYING IT AGAIN RECORDS ONCE. Same key, same door, same fact id.
J.observe(match)
assert(#J.rows()==1,"a second use of the same key on the same door added a second row")

-- 4. A DIFFERENT DOOR IS A DIFFERENT OBSERVATION.
assert(J.observe({kind="keyDoorMatch",id="opening:generated:1:1920:14390:0:3",
    keyToken="generated:1",keyId=4242,doorId="1920:14390:0:3",buildingId="201-n-carl"}))
assert(#J.rows()==2,"a match on another door must be its own observation")

-- 5. IT SURVIVES A RELOAD. The store is the save; rebuilding the module from
--    the same ModData must show the same rows.
local reloaded={}
for tag,value in pairs(stores) do reloaded[tag]=value end
package.loaded["ConspiracyFiles/KeyJournal"]=nil
stores=reloaded
ModData={get=function(tag) return stores[tag] end,
         getOrCreate=function(tag) stores[tag]=stores[tag] or {}; return stores[tag] end}
local J2=require("ConspiracyFiles/KeyJournal")
assert(#J2.rows()==2,"the observations did not survive a reload")

-- 6. A MATCH THAT COMPLETES A FULL CONNECTION IS NOT ALSO SHOWN AS A BARE ONE,
--    or the player would read the same door twice under two headings.
package.loaded["ConspiracyFiles/KeyJournal"]=nil
stores={}
ConspiracyFiles={GeneratedRuntime={known=function() return {{id="clue",title="An unsigned letter"}} end}}
local J3=require("ConspiracyFiles/KeyJournal")
for _,fact in ipairs({
    {kind="anonymousClue",id="clue",buildingId="house"},
    {kind="nameDocument",id="card",sourceToken="body",name="Dana"},
    {kind="keySource",id="key",sourceToken="body",keyToken="item",keyId=7},
    {kind="keyDoorMatch",id="door",keyToken="item",keyId=7,doorId="front",buildingId="house"},
}) do assert(J3.observe(fact)) end
local full=J3.rows()
local bare,connected=0,0
for _,r in ipairs(full) do
    if r.id:find("keydoor:",1,true) then bare=bare+1 end
    if r.id:find("connection:",1,true) then connected=connected+1 end
end
assert(connected>=1,"the completed chain must still produce its connection row")
assert(bare==0,"a match inside a completed connection was also shown as a bare observation")

print("PASS opening key door: a lone match is recorded once, stays visible after a "
    .."reload, says only that the key fits, and is not repeated once it completes a connection")

-- 7. THE ROW HAS A PLACE AND A WORD IS SAID, ONCE (Windows, 2026-09-25: the
--    lock turned, FILES gained the row reading "I didn't note where I was",
--    and nothing was said above the survivor). Read as source: the opening
--    door path needs a live door. What is held is that the accepted-and-
--    recorded branch, and only it, records the discovery under the row's own
--    id and calls the voice.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/LocalPersonIntegration.lua","rb"))
local src=f:read("*a"); f:close()
local body=assert(src:match("local function observeOpeningKeyDoor%(.-\nend\n"),"observeOpeningKeyDoor must exist")
assert(body:find('if accepted and reason=="recorded" then',1,true),"the place and the voice must follow the journal's own 'recorded' answer, so a second try says nothing")
assert(body:find('logger.record,"connection","keydoor:"..tostring(fact.id)',1,true),
    "the discovery must be recorded under the row's id (keydoor:<fact>), or FOUND has no place")
assert(body:find("voice.onOpeningKeyDoor",1,true),"nothing is said when the lock turns")
local v=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua","rb")); local voice=v:read("*a"); v:close()
local line=assert(voice:match('function V%.onOpeningKeyDoor%(%).-speak%(p,"([^"]+)"'),"PlayerVoice.onOpeningKeyDoor must speak")
assert(line:lower():find("written",1,true) or line:lower():find("note",1,true),"the line must say it is written down: "..line)
for _,claim in ipairs({"my house","my home","belong","owner","lived"}) do
    assert(not line:lower():find(claim,1,true),"the line infers ownership from a lock: "..line)
end
-- And the row id the ledger is keyed by is the id KeyJournal gives the row.
assert(rows[1].id=="keydoor:"..match.id,"KeyJournal's row id and the ledger key must agree: "..rows[1].id)
print("PASS opening key door: the row has a place and the survivor says the lock turned, once")
