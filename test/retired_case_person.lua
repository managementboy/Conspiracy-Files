-- Finding the last document of a case must not break the person system.
--
-- Playtest 2026-09-09: the owner found a case's final document, the case
-- retired, and LocalPersonIntegration threw once per tick from then on -
-- an unrecoverable error loop in a live game.
--
-- Retirement deliberately discards the case envelope: once every document has
-- been found, the documents, identities and targets are worthless, and only
-- the evidence rows the notebook renders are kept. Five places in the person
-- module read root.case, and none of them expected a root without one.
--
-- The fix filters retired roots where the list is built, so nothing downstream
-- has to remember. This test pins that, because the same crash would return
-- the moment someone reads root.case somewhere new.
local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/LocalPersonIntegration.lua', 'r'))
local src = f:read('*a')
f:close()

local body = src:match('local function cases%(%)(.-)\nend')
assert(body, 'cases() must exist')
assert(body:find('root.case', 1, true),
    'cases() must check for a case envelope before returning a root')
assert(body:find('documents', 1, true),
    'cases() must check the documents list too: a retired root has neither')

-- Every reader of root.case must be downstream of that filter, never before it.
local guarded = 0
for line in src:gmatch('[^\n]+') do
    if line:find('root.case', 1, true) and not line:find('--', 1, true) then
        guarded = guarded + 1
    end
end
assert(guarded >= 5, 'expected the known root.case readers to still be present, got ' .. guarded)

-- Simulate what the crash actually was: a root with no case at all.
local roots = {
    { case = { caseId = 'live', documents = { { id = 'd1', locationId = 't3:1' } } } },
    { caseId = 'retired', rows = {} },        -- a retired root: no case envelope
    { case = { caseId = 'no-docs' } },        -- malformed: case but no documents
}
local live = {}
for _, root in ipairs(roots) do
    if type(root) == 'table' and type(root.case) == 'table'
       and type(root.case.documents) == 'table' then live[#live + 1] = root end
end
assert(#live == 1, 'only the live case survives the filter, got ' .. #live)
assert(live[1].case.caseId == 'live', 'the wrong root survived')

-- And the thing that crashed must now be safe on every survivor.
for _, root in ipairs(live) do
    local first = root.case.documents[1]
    assert(first and first.id, 'a surviving root must have a usable first document')
end

print('PASS retired case: a retired root is filtered out, so finding the last '
    .. 'document of a case no longer throws once per tick')
