-- THE GUARD MUST ACCEPT VARIETY AND REFUSE REPETITION - PROVEN BOTH WAYS.
--
-- docs/design/ENGINE_REDESIGN_ITERATIONS_2026-09-25.md, build plan step 3:
-- "run once over the legacy roster as a calibration: it must NOT refuse the
-- 20 ordinary premises (already varied by hand)... and it SHOULD have
-- refused the withdrawn 24 occupation families if pointed at them - that is
-- the guard's own test."
--
-- This does the second half directly against real content: it takes the
-- ten Fitness starts (varied questions and objects, same shape) and shows
-- the guard flags them on quota grounds even today, then builds a
-- hand-varied roster the guard accepts. A full LegacyAdapter (build plan
-- file layout) is later work; this test translates just enough of the
-- existing scenario shape to prove the guard's calibration honestly.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Guard=require("ConspiracyFiles/Mystery/DiversityGuard")
local FitnessOpenings=require("ConspiracyFiles/Generated/FitnessOpeningScenarios")

-- Minimal, honest translation of an authored Story scenario's anchors into
-- the Vocabulary shape - only what ShapeCard reads (findings' `where`,
-- links, gates, close). Not the full adapter; enough to compute a real card.
local function toMystery(id,scenario)
    local findings={
        claim={where="onMe",capacity="object",kind=scenario.anchors.claim.kind,wear=scenario.anchors.claim.wear or "worn",
            observation=scenario.anchors.claim.observation,source=scenario.anchors.claim.source,note=scenario.anchors.claim.note},
        response={where="site",capacity="object",kind=scenario.anchors.response.kind,wear=scenario.anchors.response.wear or "poor",
            observation=scenario.anchors.response.observation,source=scenario.anchors.response.source,note=scenario.anchors.response.note},
    }
    return {id=id,centralAxis=scenario.centralAxis,findings=findings,
        gates={{kind="door",produces="claim"}},
        close={kind="all",keys={"claim","response"}}}
end

-- The Fitness ten, as they actually ship: same anchor kinds (Key1 /
-- AnimalFeedBag) and the same "all-of" ending, every one of them.
local fitnessRoster={}
for i=1,10 do fitnessRoster[i]=toMystery("fitness-"..i,FitnessOpenings[i]) end
local ok,why=Guard.check(fitnessRoster)
assert(not ok,"the guard must flag ten mysteries sharing one shape, exactly as the Fitness ten do")
assert(why:find("mechanic",1,true) or why:find("shape",1,true),
    "the refusal must name a shape or mechanic collision, got: "..tostring(why))

-- A hand-varied roster: different sites, different mechanics, different
-- endings, different link shapes - the minimum an author must vary for the
-- guard to accept the set.
local function varied(id,gateKind,closeKind,linkShape,where,prose)
    local findings={
        a={where=where,capacity="object",kind="Screwdriver",wear="poor",
            observation=prose.observation,source=prose.source,note=prose.note},
        b={where="carrier",capacity="prose",kind="notepad",body=prose.body},
    }
    local links
    if linkShape then links={{shape=linkShape,requires={"a","b"},text=prose.link}} end
    return {id=id,centralAxis="access",findings=findings,links=links,
        gates=gateKind and {{kind=gateKind,produces="a"}} or nil,
        close={kind=closeKind,keys={"a"}}}
end
local mixedRoster={
    varied("m1","door","completed","pair","onMe",{
        observation="A tool that does not belong to me.",source="It is real, and used.",
        note="Why do I have it?",body="Something written that I did not write.",
        link="They do not agree."}),
    varied("m2","tool","carried","contradiction","site",{
        observation="Cold metal, heavier than I expected, pressed into my hand by nobody I remember.",
        source="Ordinary, and ordinary things do not usually end up here.",
        note="Somebody meant for me to find this. Or nobody did.",
        body="A page torn out, half burnt, the rest of the sentence gone with it.",
        link="One says early. The other says late. Both cannot be right."}),
    varied("m3","skill","completed","threeWay","vehicle",{
        observation="Rust along one edge, fresh oil along the other.",
        source="Somebody kept this working long after they should have stopped.",
        note="A survivor does not carry a spare without a reason.",
        body="Names, crossed out one after another, until only mine is left.",
        link="Three stories, and each one blames a different hour of the same day."}),
}
mixedRoster[3].close={kind="any",keys={"a"}}
local ok2,why2=Guard.check(mixedRoster)
assert(ok2,"a hand-varied roster must be accepted: "..tostring(why2))

print("PASS diversity guard: refuses the Fitness ten's real, shared shape; "
    .."accepts a roster an author actually varied")
