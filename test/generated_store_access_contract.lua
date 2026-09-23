-- A CHECK MUST NOT GUESS THE STORE'S SHAPE.
--
-- The generated store has two. The legacy shape is a bare `store.canonical`.
-- The shipped shape is `store.campaign`, a wrapper whose own `.canonical` is
-- the first case and whose `.successive.cases` holds the rest. Reading
-- `store.canonical` off the ModData table sees the first and is blind to the
-- second - it returns nil, which reads exactly like "no case has been
-- generated".
--
-- 2026-09-23: fitness_world_opening.sh reported "the first case never
-- arrived" through two full native runs, once after quitting early and once
-- after waiting the entire 2400-second budget. A case had existed since forty
-- seconds into each run. GeneratedRuntime.automaticStatus() said cases=1,
-- active=1/4 throughout, and the only deferral it reported - why=gap,
-- dueHours=26 - was about the NEXT case. Two gates were reported COULD NOT
-- RUN on the strength of a nil.
--
-- SuccessiveCases.current/sessions is the accessor the mod itself uses, and
-- checks/opening_in_play.sh already went through it. Going through it is what
-- makes a check unable to be blind to a store shape again.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local checks={
    "tools/autotest/checks/fitness_world_opening.lua",
    "tools/autotest/checks/profession_openings.lua",
}
for _,path in ipairs(checks) do
    local lua=read(path)
    assert(lua:find("ConspiracyFiles.Generated.G2",1,true),
        path.." no longer reads the generated store at all")
    assert(lua:find("SuccessiveCases",1,true),
        path..": the store must be read through SuccessiveCases, which knows both shapes")
    assert(lua:find("C.sessions(",1,true) and lua:find("C.current(",1,true),
        path..": use current() to resolve the wrapper and sessions() to list the cases")

    -- The direct read is the defect. It must not come back on the ModData
    -- table itself. (`wrapper.canonical` INSIDE SuccessiveCases is a different
    -- thing and is not what is banned here.)
    for line in lua:gmatch("[^\n]+") do
        if not line:match("^%s*%-%-") then
            assert(not line:find("w.canonical",1,true) and not line:find("store.canonical",1,true),
                path..": reading the store's canonical field directly is blind to the "
                .."shipped campaign shape: "..line)
        end
    end
end
print("PASS generated store access: the openings checks read cases through SuccessiveCases, not a guessed shape")
