-- Negative control for tools/realengine: the hand-made fakes cannot catch a vanished
-- game method. This is the old style of fake square, and it happily accepts the
-- getDoor(true) call that the real game (42.20.4) rejects.
local fake = {getDoor = function(self, north) return nil end}
assert(fake:getDoor(true) == nil, "the fake accepts the removed call - that is the blind spot")
print("PASS negative control: a fake accepts getDoor(true)")
