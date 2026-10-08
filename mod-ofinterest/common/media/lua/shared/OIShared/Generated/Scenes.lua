-- NOTE SCENES: one forced note of the dependency + 1-3 ordinary vanilla objects, found as ONE clue
-- (docs/design/OF_INTEREST_PLAN.md phase 4). Data only; OIShared/SceneNote.lua reads it.
-- One row per scene (phase 6 adds rows, nothing else):
--   id       "ns" + 3 digits, unique; the clue id is built from it
--   noteId   a catalogue id ("Note/0159" or "Letter/<Category>/0012"): ids only, never text
--   place    the dependency's location code (index in KNOWN_CATEGORIES) or nil: 5 = Farm
--   objects  1-3 ObjectCatalogue ids (ordinary vanilla items, chosen to suit the place)
--   where    {kind="ground"} (loose on a free square) or {kind="furniture", containers={...}}
--   caption  optional neutral caption (default SceneNote.CAPTION); never about the note
local M={}
M.rows={
    -- TEST SCENE (phase 4 real-game check): a farm-tagged standalone note with farm-ish ordinary objects.
    {id="ns001",noteId="Note/0159",place=5,objects={"BucketEmpty","Gloves_LeatherGloves","HandShovel"},where={kind="ground"}},
}
function M.get(id)
    for _,r in ipairs(M.rows) do if r.id==id then return r end end
    return nil
end
return M
