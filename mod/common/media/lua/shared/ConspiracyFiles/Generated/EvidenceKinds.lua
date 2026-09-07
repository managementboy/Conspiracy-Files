-- Authoritative generated-evidence carrier whitelist.  Build 42.20.4 source:
-- media/scripts/generated/items/key.txt, literature.txt and normal.txt.  This
-- is metadata only: a key remains decorative evidence until a later adapter
-- proves access.
--
-- idcard/creditcard/businesscard/ticket carry fullTypes that
-- mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua also
-- watches for identity observations. IdentityObserver skips any item whose
-- ModData carries cfGeneratedId (stamped by GeneratedRuntime for these
-- documents) so a generated evidence item is never double-recorded as an
-- identity observation. See IdentityObserver.lua and
-- mod/common/media/lua/shared/ConspiracyFiles/IdentityObservations.lua.
-- Label/short text below must stay a lead, never an identity/ownership claim.
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
 -- literature.txt: item IDcard (module Base)
 idcard={fullType="Base.IDcard",label="Identification card",short="ID Card"},
 -- normal.txt: item CreditCard (module Base)
 creditcard={fullType="Base.CreditCard",label="Credit card",short="Credit Card"},
 -- literature.txt: item BusinessCard (module Base)
 businesscard={fullType="Base.BusinessCard",label="Business card",short="Business Card"},
 -- literature.txt: item ParkingTicket (module Base); SpeedingTicket also
 -- exists in literature.txt but only one carrier per category is listed here.
 ticket={fullType="Base.ParkingTicket",label="Parking ticket",short="Ticket"},
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
