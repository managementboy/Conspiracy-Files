-- Authoritative generated-evidence carrier whitelist.  Build 42.20.4 source:
-- media/scripts/generated/items/key.txt and literature.txt.  This is metadata
-- only: a key remains decorative evidence until a later adapter proves access.
local M={}
local kinds={
 dispatch={fullType="Base.Note",label="Dispatch document",short="Dispatch"},
 receipt={fullType="Base.Receipt",label="Receiving receipt",short="Receipt"},
 letter={fullType="Base.LetterHandwritten",label="Handwritten cover letter",short="Letter"},
 notepad={fullType="Base.Notepad",label="Review notepad",short="Review"},
 key={fullType="Base.Key1",label="Brass key",short="Key"},
 diary={fullType="Base.Diary1",label="Personal diary",short="Diary"},
 notebook={fullType="Base.Notebook",label="Field notebook",short="Notebook"},
 clipping={fullType="Base.Newspaper",label="Newspaper clipping",short="Clipping"},
}
local function copy(v) return {kind=v.kind,fullType=v.fullType,label=v.label,short=v.short} end
function M.get(kind)
 local v=type(kind)=="string" and kinds[kind];if not v then return nil,"unknown generated evidence kind" end
 return copy({kind=kind,fullType=v.fullType,label=v.label,short=v.short})
end
function M.validate(kind)
 local v,why=M.get(kind);if not v then return false,why end;return true,v
end
return M
