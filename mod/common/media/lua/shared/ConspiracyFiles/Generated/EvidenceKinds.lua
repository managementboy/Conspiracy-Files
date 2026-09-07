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
--
-- `capacity` records what T7 (docs/research/T7_RUNTIME_ITEM_TEXT.md) proved a
-- carrier can actually hold at runtime: "prose" carriers get the multi-
-- paragraph "WHAT YOU FOUND" narrative body via a locked custom page; "short"
-- carriers (the four card/ticket kinds) get only a persistent custom name
-- plus a few words of ModData/locked-page text, never a page of prose. See
-- EvidenceRoles.lua, which is the only place that reads this field to choose
-- a carrier for a role, and Generator.lua, which enforces the resulting cap.
local M={}
M.SHORT_MAX_CHARS=280
local kinds={
 dispatch={fullType="Base.Note",label="Dispatch document",short="Dispatch",capacity="prose"},
 receipt={fullType="Base.Receipt",label="Receiving receipt",short="Receipt",capacity="prose"},
 letter={fullType="Base.LetterHandwritten",label="Handwritten cover letter",short="Letter",capacity="prose"},
 notepad={fullType="Base.Notepad",label="Review notepad",short="Review",capacity="prose"},
 key={fullType="Base.Key1",label="Brass key",short="Key",capacity="prose"},
 diary={fullType="Base.Diary1",label="Personal diary",short="Diary",capacity="prose"},
 notebook={fullType="Base.Notebook",label="Field notebook",short="Notebook",capacity="prose"},
 clipping={fullType="Base.Newspaper",label="Newspaper clipping",short="Clipping",capacity="prose"},
 -- literature.txt: item IDcard (module Base)
 idcard={fullType="Base.IDcard",label="Identification card",short="ID Card",capacity="short"},
 -- normal.txt: item CreditCard (module Base)
 creditcard={fullType="Base.CreditCard",label="Credit card",short="Credit Card",capacity="short"},
 -- literature.txt: item BusinessCard (module Base)
 businesscard={fullType="Base.BusinessCard",label="Business card",short="Business Card",capacity="short"},
 -- literature.txt: item ParkingTicket (module Base); SpeedingTicket also
 -- exists in literature.txt but only one carrier per category is listed here.
 ticket={fullType="Base.ParkingTicket",label="Parking ticket",short="Ticket",capacity="short"},
}
local function copy(v) return {kind=v.kind,fullType=v.fullType,label=v.label,short=v.short,capacity=v.capacity} end
function M.get(kind)
 local v=type(kind)=="string" and kinds[kind];if not v then return nil,"unknown generated evidence kind" end
 return copy({kind=kind,fullType=v.fullType,label=v.label,short=v.short,capacity=v.capacity})
end
function M.validate(kind)
 local v,why=M.get(kind);if not v then return false,why end;return true,v
end
-- Hard text-capability constraint (docs/design/EVIDENCE_ROLE_SCHEMA.md): a
-- "short" carrier may only ever hold a brief named identifier, never a body
-- of prose. `body` is the exact text the generator intends to place on the
-- item; this returns false the instant that would overrun a card's capacity,
-- regardless of which role produced it.
function M.fits(kind,body)
 local v=M.get(kind); if not v or type(body)~="string" then return false end
 if v.capacity=="short" then return #body<=M.SHORT_MAX_CHARS end
 return true
end
return M
