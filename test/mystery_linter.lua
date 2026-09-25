-- A MYSTERY THAT BREAKS THE HONESTY RULES NEVER REACHES A SAVE.
--
-- docs/design/ENGINE_REDESIGN_ITERATIONS_2026-09-25.md, iteration 2's
-- regulator frame: honesty checked on RENDERED text, not the authored
-- template (a count hidden in a substitution must still be caught); a
-- dangling reference refused before ship, not discovered in play.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Linter=require("ConspiracyFiles/Mystery/Linter")
local Vocab=require("ConspiracyFiles/Mystery/Vocabulary")

local function base()
    return {
        id="test-mystery",centralAxis="movement",
        findings={
            key={where="onMe",capacity="object",kind="Key1",wear="worn",
                observation="A worn key sits in my pocket.",source="It is cut for a real lock.",
                note="Why did I have it?"},
            note={where="site",capacity="prose",kind="notepad",
                body="A note in someone's hand. It says nothing more than that."},
        },
        close={kind="all",keys={"key","note"}},
    }
end

-- 1. A well-formed mystery lints clean.
local ok,why=Linter.lint(base())
assert(ok,"a well-formed mystery must lint: "..tostring(why))

-- 2. An investigator's word, even buried in an otherwise honest sentence.
local m2=base()
m2.findings.note.body="This closes the case for good."
local ok2,why2=Linter.lint(m2)
assert(not ok2 and why2:find("investigator",1,true),"an investigator's word must be refused: "..tostring(why2))

-- 3. A count in RENDERED text - iteration 2's own example: not in the
--    template as authored, but present in what the player reads.
local m3=base()
m3.findings.note.body="I found 3 of these scattered about."
local ok3,why3=Linter.lint(m3)
assert(not ok3 and why3:find("number",1,true),"a number in rendered prose must be refused: "..tostring(why3))

-- 4. A dangling reference in a LINK.
local m4=base()
m4.links={{shape="pair",requires={"key","ghost"},text="They agree on nothing."}}
local ok4,why4=Linter.lint(m4)
assert(not ok4 and why4:find("undeclared",1,true),"a link to an undeclared finding must be refused")

-- 5. A dangling reference in CLOSE.
local m5=base()
m5.close={kind="all",keys={"key","ghost"}}
local ok5,why5=Linter.lint(m5)
assert(not ok5 and why5:find("undeclared",1,true),"close referencing an undeclared finding must be refused")

-- 6. A gate predicate naming more than one finding is invalid (design v3:
--    "gate" closes on ONE mechanic-derived finding, never a set).
local m6=base()
m6.close={kind="gate",keys={"key","note"}}
local ok6,why6=Linter.lint(m6)
assert(not ok6 and why6:find("exactly one",1,true),"a gate close must name exactly one finding")

-- 7. An object over its kind's cap.
local m7=base()
m7.findings.key.observation=string.rep("x",Vocab.MAX_CHARS.object+1)
local ok7,why7=Linter.lint(m7)
assert(not ok7 and why7:find("cap",1,true),"an object over its cap must be refused")

-- 8. An object with no wear declared (the same rule Story.lua already holds).
local m8=base()
m8.findings.key.wear=nil
local ok8,why8=Linter.lint(m8)
assert(not ok8 and why8:find("state it was found",1,true),"an object with no declared wear must be refused")

-- 9. A heard finding needs no wear and no site, and is capped on its own
--    (longer) budget.
local m9=base()
m9.findings.rumour={where="heard",capacity="heard",
    observation="",source="",note="Someone at the club said the key never worked."}
m9.close={kind="any",keys={"key","rumour"}}
local ok9,why9=Linter.lint(m9)
assert(ok9,"a heard finding with no site or wear must be accepted: "..tostring(why9))

-- 10. Missing centralAxis - the same rule Story.validate already holds
--     (DR-20260923: every scenario must say which axis it touches).
local m10=base(); m10.centralAxis=nil
local ok10,why10=Linter.lint(m10)
assert(not ok10 and why10:find("axis",1,true),"a mystery must declare its central axis")

-- 11. A mutation to an undeclared node, and an invalid transition.
local m11=base()
m11.mutations={{node="ghost",from="fresh",to="worn"}}
local ok11,why11=Linter.lint(m11)
assert(not ok11 and why11:find("undeclared",1,true))
local m12=base()
m12.mutations={{node="key",from="worn",to="worn"}}
local ok12,why12=Linter.lint(m12)
assert(not ok12 and why12:find("transition",1,true),"a transition to the same state must be refused")

print("PASS mystery linter: investigator words, rendered counts, dangling references, "
    .."over-cap prose, undeclared wear, invalid gate/mutation shapes and a missing axis "
    .."are all refused before a mystery can reach a save")
