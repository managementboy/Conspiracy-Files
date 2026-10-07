-- NOTE SCENES, the pure side: a scene row (Generated/Scenes) becomes an engine set clue whose FIRST
-- piece is the forced note and whose other 1-3 pieces are ordinary objects. Also: forcing the note onto
-- its fresh item (with silent degrade) and the once-per-scene nudge line. No engine calls; the engine
-- and dependency handles come in through `deps`. Never reads, copies or logs note text (the owner plays
-- blind): ids, codes and counts only.
local Forcer=require("OIShared/NoteForcer")
local Objects=require("OIShared/Generated/ObjectCatalogue")
local Pick=require("OIShared/Generated/Pick")
local S={}
-- What the Inspect caption says: only that things lie together; nothing about the note.
S.CAPTION="A few things, kept together."
S.TITLE="Things left together"
S.KIND={note="Note",letter="LetterHandwritten"}
S.MAX_OBJECTS=3

-- A row is usable when its note id parses, the object ids are real catalogue items and the place is a
-- plausible code. Returns true | false, reason. (Whether the dependency still has the note is the
-- forcer's handshake at placement time, not this check.)
function S.check(row)
    if type(row)~="table" or type(row.id)~="string" or not row.id:match("^ns%d%d%d$") then return false,"bad-id" end
    if not Forcer.parse(row.noteId) then return false,"bad-note" end
    if row.place~=nil and (type(row.place)~="number" or row.place~=math.floor(row.place) or row.place<1) then return false,"bad-place" end
    if type(row.objects)~="table" or #row.objects<1 or #row.objects>S.MAX_OBJECTS then return false,"bad-objects" end
    local seen={}
    for _,o in ipairs(row.objects) do
        if type(o)~="string" or not Objects.get(o) or seen[o] then return false,"bad-object" end
        seen[o]=true
    end
    local w=row.where
    if type(w)~="table" or (w.kind~="ground" and w.kind~="furniture") then return false,"bad-where" end
    if w.containers~=nil and (w.kind~="furniture" or type(w.containers)~="table" or #w.containers<1 or #w.containers>6) then return false,"bad-containers" end
    return true
end

-- The engine's set members: the note piece FIRST (kind Note or LetterHandwritten per the id's pool,
-- carrying noteId / place / fallback), then the ordinary objects. `fallback` is the stand-in object used
-- when the note cannot be forced, so the scene keeps its piece count (the clue is counted by pieces).
function S.members(row)
    local p=Forcer.parse(row.noteId)
    local out={{kind=p.kind=="letter" and S.KIND.letter or S.KIND.note,quantity=1,noteId=row.noteId,
        place=row.place,fallback=row.objects[1]}}
    for _,o in ipairs(row.objects) do out[#out+1]={kind=o,quantity=1} end
    return out
end

function S.noteMember(doc)
    local m=type(doc)=="table" and type(doc.members)=="table" and doc.members[1]
    if type(m)=="table" and type(m.noteId)=="string" then return m end
    return nil
end
function S.isScene(doc) return S.noteMember(doc)~=nil end

-- The area/site id and document id of a scene.
function S.areaId(row) return "note:"..row.id end

-- Force the note onto its fresh item (before the item enters the world). The token is the clue's stable
-- physical token, so relocation re-forces the replacement under the same token and id.
-- Returns true, or false and a reason. Never throws; on failure the item and the world are untouched and
-- one log line was written (by the forcer, or here for an error).
function S.forcePiece(item,member,token,deps)
    if type(member)~="table" or type(member.noteId)~="string" then return false,"not-a-note-piece" end
    local ok,res,why=pcall(Forcer.force,item,{noteId=member.noteId,token=token,place=member.place},deps)
    if not ok then
        if type(deps)=="table" and deps.log then pcall(deps.log,"w",{op="force",ok=0,why="error",note=member.noteId}) end
        return false,"error"
    end
    if res~=true then return false,why or "refused" end
    return true
end

-- The kind a failed note piece becomes: an ordinary object (its fallback), or nil.
function S.standIn(member)
    local k=type(member)=="table" and member.fallback
    if type(k)=="string" and Objects.get(k) then return k end
    return nil
end

-- THE NUDGE: one short neutral line per scene, chosen by the scene's clue id alone, so a reload says the
-- same line. `lines` is OIShared/SceneNudgeLines.
function S.nudgeLine(lines,docId)
    if type(lines)~="table" or #lines==0 then return nil end
    return lines[1+Pick.hash(Pick.key({"nudge",tostring(docId)}))%#lines]
end

return S
