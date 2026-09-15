-- A pane the player dragged from once must not be abandoned forever.
--
-- ISInventoryPane.dragStarted does not mean "a drag is happening". Vanilla sets
-- it when a drag exceeds four pixels (ISInventoryPane.lua:399, :802) and clears
-- it in exactly one place, onMouseDown (:1705). It is never initialised. So
-- after any drag it stays true until the player next clicks that pane.
--
-- Testing it alone made the identity observer skip that pane permanently. That
-- is the wallet defect of 2026-09-08: an open wallet recorded nothing until a
-- row was selected, because selecting is a mouse-down, and a mouse-down is what
-- cleared the flag. The player had no way to know that reading required
-- clicking first.
--
-- dragging is the live state: set on mouse-down (:1702), cleared on mouse-up
-- (:887, :1252, :1727, :1940). A real drag is both together.
local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua', 'r'))
local src = f:read('*a')
f:close()

assert(src:find('if pane.dragging and pane.dragStarted then', 1, true),
    'the drag gate must require BOTH flags; dragStarted alone is a stale flag')
assert(not src:find('if pane.dragStarted then return', 1, true),
    'the old dragStarted-only gate must be gone')

-- The four states, and what each must do.
local cases = {
    { dragging = nil,  dragStarted = nil,  observe = true,  why = 'untouched pane' },
    { dragging = nil,  dragStarted = true, observe = true,  why = 'dragged earlier, no click since - the wallet case' },
    { dragging = true, dragStarted = nil,  observe = true,  why = 'mouse held, not yet moved 4px' },
    { dragging = true, dragStarted = true, observe = false, why = 'a real drag in progress' },
}
for _, c in ipairs(cases) do
    local skipped = (c.dragging and c.dragStarted) and true or false
    assert(skipped ~= c.observe, c.why .. ': expected observe=' .. tostring(c.observe))
end

-- The stale-flag state is the whole point of this test, so assert it by name.
local stale = { dragging = nil, dragStarted = true }
assert(not (stale.dragging and stale.dragStarted),
    'a pane dragged from earlier must still be observable')

print('PASS pane drag gate: a stale dragStarted no longer abandons a pane; '
    .. 'only a live drag (dragging AND dragStarted) is skipped')
