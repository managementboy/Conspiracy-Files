-- Authoritative generated-evidence carrier whitelist.  Build 42.20.4 source:
-- media/scripts/generated/items/key.txt, literature.txt and normal.txt.  This
-- is metadata only: a key remains decorative evidence until a later adapter
-- proves access.
--
-- idcard/creditcard/businesscard/ticket carry fullTypes that
-- mod/common/media/lua/client/OIShared/IdentityObserver.lua also
-- watches for identity observations. IdentityObserver skips any item whose
-- ModData carries oiGeneratedId (stamped by GeneratedRuntime for these
-- documents) so a generated evidence item is never double-recorded as an
-- identity observation. See IdentityObserver.lua and
-- mod/common/media/lua/shared/OIShared/IdentityObservations.lua.
-- Label/short text below must stay a lead, never an identity/ownership claim.
--
-- `capacity` records what T7 (docs/research/T7_RUNTIME_ITEM_TEXT.md) proved a
-- carrier can actually hold at runtime: "prose" carriers get the multi-
-- paragraph "WHAT I THINK I FOUND" narrative body via a locked custom page; "short"
-- carriers (the four card/ticket kinds) get only a persistent custom name
-- plus a few words of ModData/locked-page text, never a page of prose. See
-- EvidenceRoles.lua, which is the only place that reads this field to choose
-- a carrier for a role, and Generator.lua, which enforces the resulting cap.
local M={}
M.SHORT_MAX_CHARS=280
local kinds={
 dispatch={fullType="Base.Note",label="Note",short="Note",capacity="prose"},
 receipt={fullType="Base.Receipt",label="Receipt",short="Receipt",capacity="prose"},
 letter={fullType="Base.LetterHandwritten",label="Handwritten letter",short="Letter",capacity="prose"},
 -- A real photograph (vanilla Base.Photo, literature, ReadType photo). The staff
 -- photograph premise borrowed `letter`, so a photograph was listed as a
 -- "Handwritten cover letter" and lay in the world as a letter (2026-09-11).
 -- Linux probe the same day: Base.Photo keeps a custom name, pages and ModData
 -- across a save/reload, so it carries prose like the proven carriers.
 photograph={fullType="Base.Photo",label="Photograph",short="Photo",capacity="prose"},
 notepad={fullType="Base.Notepad",label="Notepad",short="Notepad",capacity="prose"},
 key={fullType="Base.Key1",label="Brass key",short="Key",capacity="prose"},
 diary={fullType="Base.Diary1",label="Personal diary",short="Diary",capacity="prose"},
 notebook={fullType="Base.Notebook",label="Notebook",short="Notebook",capacity="prose"},
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
 -- Never chosen by a story role: only the relay memo is written on it
 -- (Generated/RelayMemo.lua, P4-R96).
 memo={fullType="Base.Note",label="Office memo",short="Memo",capacity="prose"},
 -- Never chosen by a story role either: only the radio call-in transcript is
 -- written on it, in a case steered to "Listen for it" (P4-R123). A typed page
 -- on the same proven carrier as the memo.
 transcript={fullType="Base.Note",label="Radio transcript",short="Transcript",capacity="prose"},
}
local function copy(v) return {kind=v.kind,fullType=v.fullType,label=v.label,short=v.short,capacity=v.capacity} end
-- A third capacity, added 2026-09-09: "object". Every carrier above is
-- something the survivor READS. An object is not - a bloodied hammer says what
-- it says by being a bloodied hammer in a bedroom drawer - so it holds a name
-- and nothing else, and its meaning lives in the record rather than on the
-- item. Object kinds are not listed here: they come from
-- Generated/ObjectCatalogue.lua, which is derived from the game's own item
-- scripts, because a hand-written list of objects is the bottleneck this was
-- built to remove. See ObjectRules.lua.
local Objects=require("OIShared/Generated/ObjectCatalogue")
M.OBJECT_MAX_CHARS=240
function M.get(kind)
 local v=type(kind)=="string" and kinds[kind]
 if v then return copy({kind=kind,fullType=v.fullType,label=v.label,short=v.short,capacity=v.capacity}) end
 local object=type(kind)=="string" and Objects.get(kind)
 if object then
  return {kind=kind,fullType=object.fullType,label=object.id,short=object.id,capacity="object"}
 end
 return nil,"unknown generated evidence kind"
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
 -- An object carries no readable text at all: nothing is written on a hammer.
 -- Its record is the sight and what the survivor made of it, so the cap is
 -- about what belongs in a row of noted evidence, not what fits on the item - a
 -- page of prose about an object would be the mod explaining the object,
 -- which is the one thing it must not do. The source
 -- sentence (what is visibly true of the object) does not count against the
 -- cap (owner decision 2026-10-02): the Mystery linter counts only the
 -- observation and the note, so `body` here is that rest.
 if v.capacity=="object" then return #body<=M.OBJECT_MAX_CHARS end
 return true
end
-- A CARD READS LIKE A VANILLA CARD UNTIL IT IS RECOGNISED (owner, 2026-09-27;
-- P4-R132: a clue is a plain item until then). The game names its own cards
-- with InventoryItem.nameAfterDescriptor: the item's translated name, ": ",
-- forename, " ", surname, set with setName alone (projectzomboid.jar, Build
-- 42, read 2026-09-27) - "ID Card: Paris Stover", which is also the shape the
-- identity observer reads a name from. So an authored card clue's title is
-- the name on the card, and the card shows exactly that: no Evidence
-- category, no stamp. A card whose title is only the kind's own default label
-- (a placeholder with no name) keeps the game's plain name.
M.CARD_KINDS={idcard=true,businesscard=true}
-- The plain name, or nil when the card should keep the game's own. Pure.
-- `vanillaName` is the item's own display name before any rename; the kind's
-- short name stands in for it when it cannot be read.
function M.plainCardName(kind,title,vanillaName)
 local v=M.CARD_KINDS[kind] and M.get(kind)
 if not v or type(title)~="string" then return nil end
 title=title:gsub("^%s+",""):gsub("%s+$","")
 if title=="" or title==v.label or title:find("[%c]") then return nil end
 local base=(type(vanillaName)=="string" and vanillaName:find("%S") and not vanillaName:find(": ",1,true)) and vanillaName or v.short
 if title:sub(1,#base+2)==base..": " then return title end
 return base..": "..title
end
-- Name one placed card the vanilla way. The only engine calls are the item's
-- own getDisplayName and setName, each in a pcall; true when renamed.
function M.nameAsVanillaCard(item,doc)
 if not item or type(doc)~="table" or doc.members~=nil then return false end
 if not M.CARD_KINDS[doc.kind] then return false end
 local okName,current=pcall(function() return item:getDisplayName() end)
 local name=M.plainCardName(doc.kind,doc.title,okName and current or nil)
 if not name then return false end
 local ok=pcall(function() item:setName(name) end)
 return ok
end
return M
