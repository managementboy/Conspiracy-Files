-- The No Help authoring gates (Mystery/ClueGates, content-writer handoff
-- sections 7 and 9): one placeholder fixture per gate, and a clean pass.
-- PLACEHOLDERS ONLY: no clue here says anything, and no reserved name, vanilla
-- quote or retired term is written in this file - the fixtures use tokens the
-- test configures itself, and vanilla text is read at run time.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local Manifest=require("NHShared/Mystery/Manifest")
local Gates=require("NHShared/Mystery/ClueGates")
local Cat=require("NHShared/MapMediaCatalogue")

local TEST_SALT="test-salt"
local function configure(extra)
    local cfg={reserved={names={"zzqname","qwvbrt"}},
        retired={salt=TEST_SALT,hashes={[Gates.hash(TEST_SALT,"zzretired")]=true,[Gates.hash(TEST_SALT,"zzalpha zzbeta")]=true}}}
    for k,v in pairs(extra or {}) do cfg[k]=v end
    Gates.configure(cfg)
end
configure()

local function clean()
    return {id="gate-01",kind="set",pieces={"Twine","Tarp"},
        where={{place="farm",spot="ground",lean="containment",rival="agricultural"}},
        title="Placeholder title",body="Placeholder body token one. Placeholder body token two.",
        rival_reading="placeholder rival reading",gloss="placeholder gloss",
        axioms={containment={"ax-a1"},agricultural={"ax-b1"}},
        prov={writer="placeholder-model",handoff="2026-09-27",batch="GATE"}}
end
local function expect(code,mutate,label)
    local c=clean(); mutate(c)
    local ok,why,got=Manifest.validClue(c)
    assert(not ok and got==code,(label or code)..": expected "..code..", got "..tostring(got).." ("..tostring(why)..")")
end

-- A clean placeholder passes every gate.
assert(Manifest.validClue(clean()),"a clean placeholder passes")
assert(Gates.carries(clean()) and not Gates.carries({id="x"}),"only rows with authoring fields meet the gates")
-- A clue as the game loads it (no authoring fields) never meets them.
local plain=clean(); for _,k in ipairs({"rival_reading","gloss","axioms","prov"}) do plain[k]=nil end
plain.body="ZZZZZZ!!"
assert(Manifest.validClue(plain),"the derived clue list is not re-gated in play")

-- Provenance, rival reading, gloss.
expect("NO_PROV",function(c) c.prov=nil end)
expect("NO_PROV",function(c) c.prov.batch="" end,"provenance needs its batch")
expect("NO_RIVAL",function(c) c.rival_reading=" " end)
expect("NO_GLOSS",function(c) c.gloss=nil end)

-- Axioms: both conspiracies, by shape until an approved list exists.
expect("AXIOM_UNKNOWN",function(c) c.axioms={containment={"ax-a1"}} end,"one side only")
expect("AXIOM_UNKNOWN",function(c) c.axioms={"ax-a1"} end,"a flat list of one")
expect("AXIOM_UNKNOWN",function(c) c.axioms={other={"ax-a1"},agricultural={"ax-b1"}} end,"a third side")
assert(Manifest.validClue((function() local c=clean(); c.axioms={"ax-a1","ax-b1"}; return c end)()),
    "a flat list naming two passes by shape")
configure{axioms={containment={["ax-a1"]=true},agricultural={["ax-b1"]=true}}}
assert(Manifest.validClue(clean()),"approved ids pass")
expect("AXIOM_UNKNOWN",function(c) c.axioms={containment={"ax-a9"},agricultural={"ax-b1"}} end,"an unapproved id")
expect("AXIOM_UNKNOWN",function(c) c.axioms={"ax-a1","ax-a1"} end,"a flat list resolving to one side")
assert(Manifest.validClue((function() local c=clean(); c.axioms={"ax-b1","ax-a1"}; return c end)()),
    "a flat list resolved against the approved list")
configure()

-- Density.
expect("DENSITY",function(c) c.body="Placeholder with Qa and Qb and Qc and Qd and Qe here." end,"proper nouns")
assert(Manifest.validClue((function() local c=clean(); c.body="Placeholder with Qa and Qb and Qc and Qd here."; return c end)()),
    "four proper nouns is the cap")
expect("DENSITY",function(c) c.body="Placeholder q1 and q2 and q3." end,"code-like tokens")
expect("DENSITY",function(c) c.title="Placeholder QQA"; c.body="Placeholder QQB and QQC here." end,"acronyms count as codes")

-- Emphasis.
expect("EMPHASIS",function(c) c.body="Placeholder QWERTY token." end,"a word in capitals")
expect("EMPHASIS",function(c) c.body="Placeholder QA QB token." end,"capitals in a row")
expect("EMPHASIS",function(c) c.body="Placeholder!! token." end,"double bang")
expect("EMPHASIS",function(c) c.body="Placeholder token...? more." end,"reveal marker")
expect("EMPHASIS",function(c) c.body="Placeholder *token* here." end,"marked-up stress")
expect("EMPHASIS",function(c) c.body="Placeholder token..." end,"a trailing ellipsis")
expect("EMPHASIS",function(c) c.body="Placeholder token!" end,"a trailing bang")

-- Citations: a literal substring of the vanilla text, read at run time.
local printId=Cat.printList[1]
local text=Cat.print(printId).text
local quote=text:sub(1,12)
assert(Manifest.validClue((function() local c=clean(); c.cites={source="print:"..printId,quote=quote}; return c end)()),
    "a literal flyer quote passes")
local mapId=Cat.list[1]
local mapQuote=Cat.get(mapId).sourceText:sub(1,5)
assert(Manifest.validClue((function() local c=clean(); c.cites={{source="map:"..mapId,quote=mapQuote}}; return c end)()),
    "a literal map annotation quote passes, and cites may be a list")
expect("CITE_NOT_VANILLA",function(c) c.cites={source="print:"..printId,quote=quote.."zzq"} end,"a quote not in the text")
expect("CITE_NOT_VANILLA",function(c) c.cites={source="print:zz-no-such",quote="x"} end,"an unknown source")
expect("CITE_NOT_VANILLA",function(c) c.cites={source="scene:zz",quote="x"} end,"scene text is not catalogued")

-- Reserved names: exact, one letter away, sound-alike; and the person id.
expect("RESERVED_NAME",function(c) c.body="Zzqname placeholder token." end,"exact, even starting a sentence")
expect("RESERVED_NAME",function(c) c.body="Placeholder from Zzqnamo here." end,"one letter away")
expect("RESERVED_NAME",function(c) c.body="Placeholder from Qevbrd here." end,"sound-alike")
expect("RESERVED_NAME",function(c) c.person="zzqnam" end,"a person id echoing a name")
assert(Manifest.validClue((function() local c=clean(); c.body="Qevbrd placeholder token."; return c end)()),
    "a sound-alike starting a sentence is grammar, not a name")
-- The shipped list loads (its contents are writer/engineer only: not printed).
Gates.configure{}
local okR,R=pcall(require,"NHShared/Generated/ReservedNames")
assert(okR and type(R.names)=="table" and #R.names>0,"the reserved-name list is built")
for _,n in ipairs(R.names) do assert(n==n:lower() and n:find("^%a+$"),"reserved names are plain lower-case words") end
local build=dofile("tools/cluegates/build_reserved.lua")
local f=io.open(build.OUT,"rb"); local shipped=f:read("*a"); f:close()
assert(build.render(build.collect())==shipped,"ReservedNames.lua is current (lua5.1 tools/cluegates/build_reserved.lua)")
assert(Manifest.validClue(clean()),"a clean placeholder passes the shipped reserved list")
configure()

-- The retired premise: a word, or a two-word run, hashing to a stored term.
expect("RETIRED_PREMISE",function(c) c.body="Placeholder zzretired token." end,"a word")
expect("RETIRED_PREMISE",function(c) c.gloss="placeholder zzalpha zzbeta gloss" end,"a two-word run, in any field")
assert(Manifest.validClue((function() local c=clean(); c.body="Placeholder zzalpha token zzbeta."; return c end)()),
    "the two words apart are not the run")
local retired=dofile("tools/cluegates/retired_hashes.lua")
local n=0; for h in pairs(retired.hashes) do n=n+1; assert(h:find("^%d+%-%d+$"),"stored as hashes only") end
assert(type(retired.salt)=="string" and retired.salt~="" and n>0,"the retired terms are stored salted")
Gates.configure{retired=retired,reserved={names={}}}
assert(Manifest.validClue(clean()),"a clean placeholder passes the real tripwire")

-- A set's text holds at most OBJECT_MAX_CHARS (240), which validClue checks
-- for every clue, gated or not.
local long=clean(); long.body=string.rep("a",241)
local ok,_,code=Manifest.validClue(long)
assert(not ok and code=="TOO_LONG","a set's text over 240 characters is refused")
long.body=string.rep("a",240); Gates.configure{}
assert(Manifest.validClue((function() local c=clean(); c.body=string.rep("a ",120):sub(1,239).."."; return c end)()),
    "240 characters fit")

print("nohelp_clue_gates: ok")
