-- THREADS GROUPS WHAT THE SURVIVOR IS CARRYING. IT DOES NOT SCORE IT.
--
-- Owner, Windows playtest 2026-09-25: "PDA app that tracks 'cases' (should be
-- called differently, as we are not an investigator, we are a survivor).
-- Currently we only have an ever longer list of files."
--
-- Three things this holds, and they are the three that can quietly go wrong:
--
--  1. THE WORD. Not "case", not "investigation" - the owner's whole aside. No
--     string the player can read on this screen may use an investigator's
--     vocabulary (DR-20260925-THREADS).
--  2. NO TOTAL. DR-20260920-NO-CONCLUSION bans anything implying one. An
--     open/put-down grouping is allowed; "2 of 5" is not, and "put down" must
--     never read as "solved". A number on this screen is the bug this test
--     exists to catch.
--  3. FILES IS NOT REORDERED. Chronological order and numbering in the
--     notebook are load-bearing and are never regrouped or renumbered. THREADS
--     is a second view: the rows arrive numbered and keep their numbers, in
--     the order they were discovered.
--
-- Asserted through the pure grouping AND through the real program, because a
-- module nothing requires may never load (lesson 3 in the PM handoff).
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local T=require("ConspiracyFiles/Threads")

-- Words that belong to an investigator, or to a score.
local FOREIGN={"case","cases","investigation","investigator","detective",
               "solved","solve","unsolved","closed","complete","completed",
               "finished","resolved","total","progress","score","remaining"}
local function foreign(text)
    local lower=" "..tostring(text):lower():gsub("[^%a]+"," ").." "
    for _,word in ipairs(FOREIGN) do
        if lower:find(" "..word.." ",1,true) then return word end
    end
end
-- Any number at all on this screen would be a count of something.
local function counts(text) return tostring(text):find("%d") end

-- ---------------------------------------------------------------------------
-- 1. The copy itself ---------------------------------------------------------
-- ---------------------------------------------------------------------------
local copy={T.FOLLOWING,T.PUT_DOWN,T.LOOSE,T.LOOSE_NOTE,T.STILL,T.SET_ASIDE,T.RAN_OUT}
assert(#copy==7,"the screen's copy moved; this sweep is reading nothing")
for _,line in ipairs(copy) do
    assert(type(line)=="string" and line~="","a line of copy with no text")
    local word=foreign(line)
    assert(not word,"THREADS speaks as an investigator ('"..tostring(word).."'): "..line)
    assert(not counts(line),"THREADS puts a number on the screen: "..line)
end
assert(T.PUT_DOWN=="PUT DOWN","the survivor puts a thread down: "..T.PUT_DOWN)

-- ---------------------------------------------------------------------------
-- 2. The grouping ------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- Four findings across two threads and one that belongs to neither, in the
-- order they were discovered and numbered by FILES.
local rows={
  {id="d1",title="Brass key",ordinal=1,detailText="WHAT I THINK I FOUND\nA key."},
  {id="d2",title="Appointment card",ordinal=2,detailText="WHAT I THINK I FOUND\nA card."},
  {id="m1",title="A marked map I have not followed",ordinal=3,detailText="A map."},
  {id="d3",title="Closing note",ordinal=4,detailText="WHAT I THINK I FOUND\nA note."},
  {id="e1",title="Refund register",ordinal=5,detailText="WHAT I THINK I FOUND\nA register."},
}
-- d1,d2 are the opening; d3 is the FOLLOW-UP, a different root that follows it,
-- and it must sit under the same heading rather than start a second one. e1 is
-- a separate thread; m1 belongs to none.
local of={d1={key="C1",question="Why was I expected here?"},
          d2={key="C1",question="Why was I expected here?"},
          d3={key="C1",spent=true},
          e1={key="C2",question="Who paid for it?"}}
local function reader(row) return of[row.id] end

local sections=T.build(rows,reader,{})
local byTitle={}
for _,section in ipairs(sections) do byTitle[section.title]=section end
assert(byTitle[T.FOLLOWING],"nothing is being followed")
assert(#byTitle[T.FOLLOWING].threads==2,
    "two threads, not "..#byTitle[T.FOLLOWING].threads)
assert(byTitle[T.LOOSE] and #byTitle[T.LOOSE].threads==1,"the loose finding lost its place")
assert(not byTitle[T.PUT_DOWN],"nothing has been put down yet")

local one=byTitle[T.FOLLOWING].threads[1]
assert(one.key=="C1","the first thread is the opening: "..tostring(one.key))
assert(#one.rows==3,"the follow-up must sit with the finding it followed, got "..#one.rows)
-- One live root keeps the thread live even though the follow-up's root is spent.
assert(one.spent==false,"a thread with a live root is not spent")
assert(one.label=="Brass key","a thread is named by the finding that started it: "..one.label)
-- Numbering and order come from FILES and are untouched.
local expect={1,2,4}
for i,row in ipairs(one.rows) do
    assert(row.ordinal==expect[i],"THREADS renumbered the notebook: "..tostring(row.ordinal))
end

-- ---------------------------------------------------------------------------
-- 3. Putting one down, and picking it back up --------------------------------
-- ---------------------------------------------------------------------------
local aside=T.build(rows,reader,{C1=true})
byTitle={}
for _,section in ipairs(aside) do byTitle[section.title]=section end
assert(byTitle[T.PUT_DOWN] and #byTitle[T.PUT_DOWN].threads==1,"the thread was not put down")
assert(byTitle[T.PUT_DOWN].threads[1].key=="C1","the wrong thread was put down")
assert(byTitle[T.FOLLOWING] and #byTitle[T.FOLLOWING].threads==1,"the other thread moved too")
assert(byTitle[T.PUT_DOWN].threads[1].detail:find(T.SET_ASIDE,1,true),
    "a thread put down does not say the survivor chose it")
-- And back: putting one down is never a one-way door.
local back=T.build(rows,reader,{})
assert(#back[1].threads==2,"a thread put down cannot be picked back up again")

-- A thread nothing more has come of sits with the put-down ones and says so
-- in its own words - it is not "closed" and it is certainly not "solved".
local spent=T.build({rows[5]},function() return {key="C2",spent=true} end,{})
assert(spent[1].title==T.PUT_DOWN,"a spent thread is still listed as followed")
assert(spent[1].threads[1].detail:find(T.RAN_OUT,1,true),"a spent thread does not say so")

-- A RETIRED OPENING WITH A LIVE FOLLOW-UP IS STILL LIVE. The opening pair
-- retires its first half while the second is still running, and reading the
-- state off whichever root happened to be seen first would file the whole
-- thread under PUT DOWN while the survivor is still walking it.
local mixed=T.build({rows[1],rows[4]},function(row)
    if row.id=="d1" then return {key="C1",spent=true} end
    return {key="C1",spent=false}
end,{})
assert(mixed[1].title==T.FOLLOWING,
    "a thread whose follow-up is live was filed as put down: "..mixed[1].title)
assert(mixed[1].threads[1].spent==false,"one live root must keep the thread live")

-- ---------------------------------------------------------------------------
-- 4. Nothing anywhere in the output counts or concludes ----------------------
-- ---------------------------------------------------------------------------
local swept=0
for _,built in ipairs({sections,aside,spent}) do
    for _,section in ipairs(built) do
        swept=swept+1
        assert(not foreign(section.title),"section heading is an investigator's: "..section.title)
        assert(not counts(section.title),"section heading counts: "..section.title)
        for _,group in ipairs(section.threads) do
            swept=swept+1
            local word=foreign(group.detail)
            assert(not word,"a thread reads as an investigator's ('"..tostring(word).."'): "..group.detail)
            -- The thread's own label is a finding's title, which the writing
            -- owns; only the lines THREADS adds are swept for a number.
            for line in group.detail:gmatch("[^\n]+") do
                assert(not (counts(line) and line~="It started with: "..group.label.."."),
                    "THREADS counts something: "..line)
            end
        end
    end
end
assert(swept>=10,"only "..swept.." groups swept; the sweep is too thin")

-- ---------------------------------------------------------------------------
-- 5. Through the real program ------------------------------------------------
-- ---------------------------------------------------------------------------
-- A module nothing requires may never load, and a screen nothing lists can
-- never be opened. This drives KnoxApps the way the device does.
package.preload["ConspiracyFiles/Generated/PlaceNames"]=function()
    return {render=function(text) return text end,context=function(case) return case end}
end
local roots={}
ModData={get=function(tag) return roots[tag] end,
         getOrCreate=function(tag) roots[tag]=roots[tag] or {}; return roots[tag] end}
getTexture=function(path) return {path=path} end
ConspiracyFiles={}
local known={
 {id="d1",title="Brass key",kind="Key1",body="A brass key."},
 {id="d2",title="Appointment card",kind="receipt",body="WHAT I THINK I FOUND\nA card.\n\nRef R-482"},
 {id="e1",title="Refund register",kind="dispatch",body="WHAT I THINK I FOUND\nA register.\n\nRef Q-118"},
}
ConspiracyFiles.GeneratedRuntime={metrics=function() return {} end,known=function() return known end}
roots["ConspiracyFiles.Generated.G2"]={canonical=true}
local rootOf={d1={caseId="C1"},d2={caseId="C1"},e1={caseId="C2"}}
package.preload["ConspiracyFiles/Generated/SuccessiveCases"]=function()
    return {
      current=function(w) return w end,
      sessions=function() return {
        {caseId="C1",case={caseId="C1",story={question="Why was I expected here?"},facts={code="R-482"}}},
        {caseId="C2",case={caseId="C2",story={question="Who paid for it?"},facts={code="Q-118"}}}} end,
      find=function(_,id)
        local r=rootOf[id]; if not r then return nil end
        return {caseId=r.caseId,case={caseId=r.caseId,
                story={question=r.caseId=="C1" and "Why was I expected here?" or "Who paid for it?"},
                facts={code="X"}}}
      end,
    }
end
local A=require("ConspiracyFiles/KnoxApps")
assert(A.threads and A.threads.id=="THREADS","the program is not there")
local listed=false
for _,program in ipairs(A.programs) do if program==A.threads then listed=true end end
assert(listed,"THREADS is not on the launcher, so it can never be opened")
assert(A.threads.title=="THREADS" and not foreign(A.threads.title),
    "the program's own name is an investigator's: "..tostring(A.threads.title))

local out=A.threads.list()
assert(#out>=5,"the program listed "..#out.." rows")
local headings,threadRows=0,0
for _,row in ipairs(out) do
    if row.heading then headings=headings+1 end
    if row.thread then threadRows=threadRows+1 end
    local word=foreign(row.label)
    assert(not word,"a row on the screen speaks as an investigator ('"..tostring(word).."'): "..row.label)
end
assert(threadRows==2,"two threads should be offerable, got "..threadRows)
assert(headings>=3,"the sections and threads lost their headings")

-- Putting one down through the program writes it to the record and moves it.
local key
for _,row in ipairs(out) do if row.thread then key=row.thread; break end end
assert(key,"no thread could be put down")
assert(A.setAside(key),"putting a thread down was refused")
assert(A.isPutDown(key),"the record did not keep it")
assert(roots["ConspiracyFiles.Threads"].putDown[key],"it was not written to its own root")
local after=A.threads.list()
local sawPutDown=false
for _,row in ipairs(after) do if row.label==T.PUT_DOWN then sawPutDown=true end end
assert(sawPutDown,"the thread did not move to "..T.PUT_DOWN)
assert(A.setAside(key) and not A.isPutDown(key),"a thread cannot be picked back up")

-- And the store it writes to is not one the machine clears when its cell dies:
-- what the survivor is carrying is not a note they typed into a device.
local organiser=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/Organiser.lua","rb"))
local text=organiser:read("*a"); organiser:close()
assert(not text:find("ConspiracyFiles.Threads",1,true),
    "a flat cell would take the survivor's threads with it")

print("PASS threads: "..swept.." groups and "..#out.." rows, grouped by thread, "
    .."numbered as FILES numbered them, put down and picked back up, "
    .."no count and no investigator's word anywhere")
