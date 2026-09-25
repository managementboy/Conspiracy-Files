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
local copy={T.LOOSE_LABEL,T.LOOSE_NOTE,T.STILL,T.SET_ASIDE,T.RAN_OUT}
for _,c in ipairs(T.CATEGORIES) do copy[#copy+1]=c end
for _,c in ipairs(T.CLOSING) do copy[#copy+1]=c end
assert(#copy>=11,"the screen's copy moved; this sweep is reading nothing")
for _,line in ipairs(copy) do
    assert(type(line)=="string" and line~="","a line of copy with no text")
    local word=foreign(line)
    assert(not word,"THREADS speaks as an investigator ('"..tostring(word).."'): "..line)
    assert(not counts(line),"THREADS puts a number on the screen: "..line)
end
assert(T.PUT_DOWN=="Put down","the survivor puts a thread down: "..T.PUT_DOWN)
assert(#T.CATEGORIES==3,"three categories, as the redesign says")

-- ---------------------------------------------------------------------------
-- 2. The grouping ------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- Four findings across two threads and one that belongs to neither, in the
-- order they were discovered and numbered by FILES.
local rows={
  {id="d1",title="Brass key",ordinal=1,detailText="WHAT I THINK I FOUND\nA key.",place="201 N Carl St"},
  {id="d2",title="Appointment card",ordinal=2,detailText="WHAT I THINK I FOUND\nA card."},
  {id="m1",title="A marked map I have not followed",ordinal=3,detailText="A map."},
  {id="d3",title="Closing note",ordinal=4,detailText="WHAT I THINK I FOUND\nA note."},
  {id="e1",title="Refund register",ordinal=5,detailText="WHAT I THINK I FOUND\nA register.",place="304 Wood St"},
}
-- d1,d2 are the opening; d3 is the FOLLOW-UP, a different root that follows it,
-- and it must sit under the same thread rather than start a second one. e1 is
-- a separate thread; m1 belongs to none.
local of={d1={key="C1",question="Why was I expected at this address?"},
          d2={key="C1",question="Why was I expected at this address?"},
          d3={key="C1",spent=true},
          e1={key="C2",question="Who paid for it?"}}
local function reader(row) return of[row.id] end

local threads=T.threads(rows,reader,{})
assert(#threads==3,"two threads and the loose bucket, not "..#threads)
local one=threads[1]
assert(one.key=="C1" and one.state=="following","the first thread is the live opening: "..tostring(one.state))
assert(#one.rows==3,"the follow-up must sit with the finding it followed, got "..#one.rows)
assert(one.spent==false,"a thread with a live root is not spent")
assert(one.label=="Brass key","a thread remembers the finding that started it: "..one.label)
local expect={1,2,4}
for i,row in ipairs(one.rows) do
    assert(row.ordinal==expect[i],"THREADS renumbered the notebook: "..tostring(row.ordinal))
end
assert(threads[2].state=="loose" and threads[2].key==nil,"the loose finding lost its place")
assert(threads[3].key=="C2","the second thread is missing")

-- The categories: Following carries the live threads AND the things not yet
-- placed; Put down carries what was set aside or ran out; All carries all.
assert(#T.filter(threads,T.FOLLOWING)==3,"Following must show live threads and the unplaced things")
assert(#T.filter(threads,T.PUT_DOWN)==0,"nothing has been put down yet")
assert(#T.filter(threads,T.ALL)==3)

-- ---------------------------------------------------------------------------
-- 3. Putting one down, and picking it back up --------------------------------
-- ---------------------------------------------------------------------------
local aside=T.threads(rows,reader,{C1=true})
local down=T.filter(aside,T.PUT_DOWN)
assert(#down==1 and down[1].key=="C1","the thread was not put down")
assert(#T.filter(aside,T.FOLLOWING)==2,"the other thread and the loose things stay")
assert(T.stateLine(down[1])==T.SET_ASIDE,"a thread put down does not say the survivor chose it")
-- The closing note is the survivor's words, from the flag, stable per thread,
-- and not the same sentence for every thread put down.
local closing=T.closingLine(down[1])
assert(type(closing)=="string" and closing~="","a thread put down has no closing note")
assert(T.closingLine(down[1])==closing,"the closing note must not change between draws")
assert(T.closingLine(threads[1])==nil,"a thread still followed has no closing note")
local other=T.threads(rows,reader,{C1=true,C2=true})
local seenClosing={}
for _,t in ipairs(T.filter(other,T.PUT_DOWN)) do seenClosing[T.closingLine(t)]=true end
local distinct=0; for _ in pairs(seenClosing) do distinct=distinct+1 end
assert(distinct==2,"two threads put down carry the same closing sentence")
-- And back: putting one down is never a one-way door.
assert(#T.filter(T.threads(rows,reader,{}),T.PUT_DOWN)==0,"a thread put down cannot be picked back up again")

-- A thread nothing more has come of sits with the put-down ones and says so
-- in its own words - it is not "closed" and it is certainly not "solved".
local spent=T.threads({rows[5]},function() return {key="C2",spent=true} end,{})
assert(spent[1].state=="putdown" and T.stateLine(spent[1])==T.RAN_OUT,"a spent thread does not say so")
assert(T.closingLine(spent[1])==nil,"a thread that ran out was not put down by the survivor; no closing note")

-- A RETIRED OPENING WITH A LIVE FOLLOW-UP IS STILL LIVE.
local mixed=T.threads({rows[1],rows[4]},function(row)
    if row.id=="d1" then return {key="C1",spent=true} end
    return {key="C1",spent=false}
end,{})
assert(mixed[1].state=="following","a thread whose follow-up is live was filed as put down")

-- ---------------------------------------------------------------------------
-- 4. The row handle (redesign note, remedy A) --------------------------------
-- ---------------------------------------------------------------------------
-- A question that fits is the row. One that does not is front-loaded where
-- the words are written, so the thing that tells two threads apart leads.
assert(T.handle({key="C2",question="Who paid for it?"})=="Who paid for it?")
assert(T.handle({key="C1",question="Why was I expected at this address?"})=="Expected at this address - why me?",
    "the frame must move to the end: "..T.handle({key="C1",question="Why was I expected at this address?"}))
assert(T.handle({key="C3",label="Brass key"})=="Brass key","a retired thread is named by its first finding")
assert(T.handle({key="C4",question="Why is there a passenger-booking deposit receipt in my name?"})
    :find("^A passenger%-booking deposit receipt"),"a 'Why is there' question must lead with the thing (knox 20260925T143407)")
assert(T.handle({key="C5",question="Why did the radio fail after its battery issue was signed complete?"})
    :find("^Why did the radio"),"a frame whose remainder would not read as a sentence stays as written")
assert(T.handle({key=nil})==T.LOOSE_LABEL)
-- Two that still read alike are told apart by where their first finding was.
local alike=T.handles({
    {key="A",question="Why was I expected at this address for the visit?",rows={{place="201 N Carl St"}}},
    {key="B",question="Why was I expected at this address for the review?",rows={{place="304 Wood St"}}},
})
assert(alike[1]:sub(1,T.ROW)~=alike[2]:sub(1,T.ROW),"two look-alike rows were not told apart: "..alike[2])
assert(alike[2]:find("304 Wood St",1,true),"the second row should lead with its place: "..alike[2])

-- EVERY SHIPPED QUESTION, as a row. Measured 2026-09-25: 74 of 75 differ
-- inside a row and the five openings that begin "Why was I" are the ones
-- that collide - the first thing every game shows. With the handle, every
-- opening must be distinct from every other, and the whole set may keep at
-- most the one authored pair that already reads alike (named here, so a new
-- collision fails and the old one does not hide it).
local function source(path) local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s end
local files={"Generated/FitnessOpeningScenarios","Generated/PersonalScenarios","Generated/PersonalContinuation",
             "Generated/AdministrativeScenarios","Generated/CorrespondenceScenarios","Generated/InventoryScenarios",
             "MapMediaCivicStories","MapMediaPlaceStories","MapMediaServiceStories"}
local shipped,openings={},{}
for _,name in ipairs(files) do
    local text=source("mod/common/media/lua/shared/ConspiracyFiles/"..name..".lua")
    for q in text:gmatch('question="([^"]+)"') do
        shipped[#shipped+1]=q
        if name:find("FitnessOpening",1,true) then openings[#openings+1]=q end
    end
end
assert(#shipped>=70,"only "..#shipped.." shipped questions found; the sweep is reading the wrong files")
assert(#openings>=10,"only "..#openings.." openings found")
local seen,collisions={},{}
for _,q in ipairs(shipped) do
    local h=T.handle({key="k",question=q}):sub(1,T.ROW)
    if seen[h] then collisions[#collisions+1]=h end
    seen[h]=true
end
assert(#collisions<=1,"shipped questions collide inside a row: "..table.concat(collisions," | "))
if collisions[1] then
    assert(collisions[1]:find("who submitted the named collect",1,true),
        "a NEW collision among shipped questions: "..collisions[1])
end
local seenOpening={}
for _,q in ipairs(openings) do
    local h=T.handle({key="k",question=q}):sub(1,T.ROW)
    assert(not seenOpening[h],"two openings still read alike on the row: "..h)
    seenOpening[h]=true
    assert(not h:find("^Why was I"),"an opening still leads with its frame: "..h)
end

-- ---------------------------------------------------------------------------
-- 5. Nothing anywhere in the output counts or concludes ----------------------
-- ---------------------------------------------------------------------------
local swept=0
for _,built in ipairs({threads,aside,spent,other}) do
    for _,t in ipairs(built) do
        swept=swept+1
        for _,line in ipairs({T.handle(t),T.stateLine(t),T.closingLine(t) or ""}) do
            local word=foreign(line)
            assert(not word,"a thread reads as an investigator's ('"..tostring(word).."'): "..line)
            assert(not counts(line),"THREADS counts something: "..line)
        end
    end
end
assert(swept>=10,"only "..swept.." threads swept; the sweep is too thin")

-- ---------------------------------------------------------------------------
-- 6. Through the real program ------------------------------------------------
-- ---------------------------------------------------------------------------
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
local Q1,Q2="Why was I expected at this address?","Who paid for it?"
package.preload["ConspiracyFiles/Generated/SuccessiveCases"]=function()
    return {
      current=function(w) return w end,
      sessions=function() return {
        {caseId="C1",case={caseId="C1",story={question=Q1},facts={code="R-482"}}},
        {caseId="C2",case={caseId="C2",story={question=Q2},facts={code="Q-118"}}}} end,
      find=function(_,id)
        local r=rootOf[id]; if not r then return nil end
        return {caseId=r.caseId,case={caseId=r.caseId,
                story={question=r.caseId=="C1" and Q1 or Q2},facts={code="X"}}}
      end,
    }
end
local A=require("ConspiracyFiles/KnoxApps")
assert(A.threads and A.threads.id=="THREADS","the program is not there")
local listed=false
for _,program in ipairs(A.programs) do if program==A.threads then listed=true end end
assert(listed,"THREADS is not on the launcher, so it can never be opened")
assert(A.threads.filters and #A.threads.filters()==3,"THREADS has no category picker")

-- ONE ROW PER THREAD, and the fault that started the redesign: no row may
-- read the same as the row beneath it, and no row is a section heading.
local out=A.threads.list(T.FOLLOWING)
assert(#out==2,"two threads following, one row each, got "..#out)
for i,row in ipairs(out) do
    assert(not row.heading,"THREADS still prints headings into the list: "..tostring(row.label))
    assert(not row.label:find("^%s*%-"),"a row still carries the old dash indent: "..row.label)
    if out[i+1] then assert(row.label~=out[i+1].label,"two rows read the same: "..row.label) end
    local word=foreign(row.label)
    assert(not word,"a row on the screen speaks as an investigator ('"..tostring(word).."'): "..row.label)
    assert(#row.label<=T.ROW+8,"a row label is far longer than the row: "..row.label)
end
assert(out[1].label=="Expected at this address - why me?","the opening's row is not front-loaded: "..out[1].label)
-- Tapping a row opens the thread: the state as a field, the findings as
-- entries that name the FILES record they open.
assert(out[1].thread=="C1" and out[1].fields[1].label=="STATE" and out[1].fields[1].value==T.STILL)
assert(#out[1].entries==2 and out[1].entries[1].ref=="d1" and out[1].entries[2].ref=="d2",
    "the thread's findings are not its entries")
assert(out[1].entries[1].text=="1. Brass key","an entry keeps the notebook's number: "..out[1].entries[1].text)
-- Putting one down through the program: the record keeps it, the row moves
-- to Put down, its record gains the survivor's closing note, and back again.
assert(A.setAside("C1"),"putting a thread down was refused")
assert(A.isPutDown("C1"),"the record did not keep it")
assert(roots["ConspiracyFiles.Threads"].putDown["C1"],"it was not written to its own root")
local following=A.threads.list(T.FOLLOWING)
assert(#following==1 and following[1].thread=="C2","the thread put down still shows under Following")
local putDown=A.threads.list(T.PUT_DOWN)
assert(#putDown==1 and putDown[1].thread=="C1" and putDown[1].putDown==true,"the thread did not move to Put down")
assert(putDown[1].fields[1].value==T.SET_ASIDE)
local last=putDown[1].entries[#putDown[1].entries]
assert(last.ref==nil and last.text==T.closingLine({key="C1",putDown=true}),"the closing note is not the last entry")
assert(#A.threads.list(T.ALL)==2,"All does not show both")
assert(A.setAside("C1") and not A.isPutDown("C1"),"a thread cannot be picked back up")

-- And the store it writes to is not one the machine clears when its cell dies.
local organiser=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/Organiser.lua","rb"))
local text=organiser:read("*a"); organiser:close()
assert(not text:find("ConspiracyFiles.Threads",1,true),
    "a flat cell would take the survivor's threads with it")

print("PASS threads: one row per thread under a category picker, opened as a record of its findings; "
    ..#shipped.." shipped questions read apart on the row; put down and picked back up; "
    .."no count and no investigator's word anywhere")
