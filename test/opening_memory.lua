-- THE RANDOMISER REMEMBERS WHAT THIS INSTALL HAS PLAYED.
--
-- Owner, 2026-09-25: "we need to implement the randomizer that also remembers
-- per game install what initiation clues we have used in the past. Those
-- should not be prioritised." Before: (seed-1) % starts + 1, blind to earlier
-- games - nurse played 1,1,2 in three fresh saves (20260925T191517).
--
-- Held here: the chooser takes a least-used start and lets the seed decide
-- only between equals; recording is one count per family and start; the
-- line format round-trips and shrugs off rubbish; the generator accepts the
-- chosen start and refuses one the family does not have; the runtime chooses
-- before it builds and records only after the case is committed.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Memory=require("ConspiracyFiles/Generated/OpeningMemory")

-- 1. Least-used first; the seed only among equals.
local counts={}
assert(Memory.choose(counts,"nurse",3,1)==1 and Memory.choose(counts,"nurse",3,2)==2 and Memory.choose(counts,"nurse",3,3)==3,
    "an empty memory lets the seed choose, as before")
counts={nurse={[1]=2,[2]=1,[3]=0}}
for seed=1,9 do assert(Memory.choose(counts,"nurse",3,seed)==3,"the unplayed start must come first whatever the seed") end
counts={nurse={[1]=2,[2]=1,[3]=1}}
local picked={}
for seed=1,6 do picked[Memory.choose(counts,"nurse",3,seed)]=true end
assert(picked[2] and picked[3] and not picked[1],"among equals the seed decides; the most-played start is never chosen")
-- A family the memory has never seen behaves as empty.
assert(Memory.choose(counts,"tailor",3,5)==2,"an unknown family starts from an empty count")
assert(Memory.choose(counts,"nurse",0,1)==nil,"no starts, no choice")

-- 2. Playing in order never repeats a start until every start has been played
--    as often: the sequence a fresh install produces.
counts={}
local seq={}
for game=1,9 do
    local v=Memory.choose(counts,"chef",3,game*7)
    seq[#seq+1]=v; Memory.record(counts,"chef",v)
end
for round=0,2 do
    local seen={}
    for i=1,3 do seen[seq[round*3+i]]=true end
    assert(seen[1] and seen[2] and seen[3],"round "..round.." repeated a start before the others were played: "..table.concat(seq,","))
end

-- 3. The file format round-trips, sorted and stable, and ignores rubbish.
counts={nurse={[3]=1,[1]=2},chef={[2]=4},tailor={[1]=0}}
local lines=Memory.serialise(counts)
assert(#lines==2 and lines[1]=="chef\t2:4" and lines[2]=="nurse\t1:2,3:1","serialised: "..table.concat(lines," | "))
local back=Memory.parse(lines)
assert(back.nurse[1]==2 and back.nurse[3]==1 and back.chef[2]==4 and back.tailor==nil)
local rubbish=Memory.parse({"","not a line","nurse\tx:y","nurse\t2:5 trailing","nurse\t2:5","chef\t1:1,","\tnurse"})
assert(rubbish.nurse and rubbish.nurse[2]==5 and rubbish.chef[1]==1,"a readable line survives its neighbours")
assert(Memory.parse({"nurse\t2:5 trailing"}).nurse==nil,"a line with rubbish on it is skipped whole, not half-read")
assert(Memory.parse(nil).nurse==nil)

-- 4. The generator takes the chosen start, and refuses one the family lacks.
local G=require("ConspiracyFiles/Generated/Generator")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
for _,site in ipairs(catalog.locations) do site.paperStorage="indexed" end
local sites={catalog.locations[1].id,catalog.locations[2].id}
-- The Fitness family is the one routed opening (the occupation families are
-- withdrawn from routing, DR-20260925-OCCUPATION-OPENINGS-WITHDRAWN).
local base={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true,opening=true,self="Ada Whitlock",profession="fitnessinstructor"}
local function with(variant) local o={} for k,v in pairs(base) do o[k]=v end o.variant=variant return o end
local case=assert(G.generateSelected(catalog,1,with(3),sites))
assert(case.opening.variant==3,"seed 1 would have chosen start 1; the memory chose 3")
assert(G.validate(case),"a case built from a chosen start rebuilds")
assert(G.generateSelected(catalog,1,with(11),sites)==nil,"a start the family does not have is refused")
assert(G.generateSelected(catalog,1,with(2.5),sites)==nil,"a half start is refused")
local noProf={} for k,v in pairs(base) do noProf[k]=v end noProf.profession=nil noProf.variant=2
assert(G.generateSelected(catalog,1,noProf,sites)==nil,"a start without a family is refused")

-- 5. The runtime: chooses before it builds, records after the commit, and
--    never lets the memory stop a game (both under pcall).
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua","rb"))
local src=f:read("*a"); f:close()
local choose=src:find("pcall(Store.choose,profession,variants,seed)",1,true)
local build=src:find("case,err,code=firstCase(filtered,seed,options,context,house,candidates)",1,true)
local commit=src:find('swap({canonical=root,schedule={schema=1,createdHours={worldHours()}}})',1,true)
local record=src:find("pcall(Store.record,case.opening.profession,case.opening.variant)",1,true)
assert(choose and build and choose<build,"the start must be chosen before the case is built")
assert(commit and record and commit<record,"the start must be recorded only after the case is committed")
local store=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/OpeningMemoryStore.lua","rb")):read("*a")
assert(store:find("getFileReader(S.FILE,false)",1,true) and store:find("getFileWriter(S.FILE,true,false)",1,true),
    "the store reads and rewrites one file in the user folder")
assert(store:find('S.FILE="ConspiracyFiles_openings.txt"',1,true),"the file is named for the mod, beside the discovery journal")

print("PASS opening memory: least-used start first, the seed only among equals, one file per install, chosen before the build and recorded after the commit")
