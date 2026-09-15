-- The projection from what the survivor has actually found to the rows a
-- reading surface shows. ONE store, ONE projection, TWO surfaces: the notebook
-- window and the organiser's screen both read this (docs/design/READING_SURFACES.md).
--
-- It lived inside Notebook.lua as a local, which made it unreachable except by
-- loading a 1700-line client module that needs the game. test/g2_smoke.lua
-- therefore tested it by SLICING IT OUT OF THE SOURCE between two literal
-- string markers and loadstring-ing the fragment against a fake environment -
-- and broke the moment the text after it changed, because the slice swallowed
-- the following line and that line touches UI.
--
-- So it is a module. The notebook and the PDA are unchanged; the difference is
-- that the thing they both depend on can now be required and tested directly,
-- which is what it deserved for being the PDA's primary data source
-- (KnoxApps FILES, NAMES and PLACES all read it).
--
-- `runtime` is injected rather than reached for: the notebook decides what
-- counts as an active generated runtime (its probe state can stand in for
-- one), and that decision stays where it is made.
local PlaceNames=require("ConspiracyFiles/Generated/PlaceNames")
local RelayMemo=require("ConspiracyFiles/Generated/RelayMemo")

local Rows={}

function Rows.build(section,runtime)
    -- No case generated yet is a normal state, not a fault: a new world spends
    -- its first half-minute indexing addresses, and the organiser's own boot
    -- screen tells the player to carry on using it while that finishes. Before
    -- this guard, doing exactly that threw "attempted index: known of
    -- non-table" on every list refresh - swallowed by the callers' pcall, so
    -- the screen merely looked empty, but filling the log with exceptions in
    -- the one place a real problem would have to be spotted.
    local rt=runtime and runtime()
    if not rt then return {} end
    local known=rt.known(); local titles,rows={},{}
    local wrapper=ModData and ModData.get and ModData.get("ConspiracyFiles.Generated.G2")
    local Cases=wrapper and require("ConspiracyFiles/Generated/SuccessiveCases")
    wrapper=Cases and Cases.current(wrapper)
    -- The week is only pointed out once the relay memo that defines it has
    -- been found (P4-R96); before that the dates are just dates.
    local memoFound=false
    for _,r in ipairs(known) do
        titles[r.id]=r.title
        if r.kind==RelayMemo.KIND then memoFound=true end
    end
    -- "Disputes delivery in" was left over from when every case was about a
    -- delivery. Plain verbs that fit any of the twenty stories.
    local meanings={corroborates="Agrees with",['disputes-delivery']="Does not match",recontextualises="Adds context to"}
    -- The kind of document a link points at, from its title alone: "Second
    -- stock list / PS-289" is a stock list, "Credit Card: Joanne Voss" a credit
    -- card. Never its text - the player has not found it.
    local function nounOf(title)
        local noun=tostring(title or "")
        noun=noun:gsub("%s*/.*$",""):gsub(":.*$","")
        noun=string.lower(noun):gsub("^second ",""):gsub("^another ","")
        return noun
    end
    local function articleFor(noun)
        local first=string.sub(noun,1,1)
        return (first=="a" or first=="e" or first=="i" or first=="o" or first=="u") and "an" or "a"
    end
    for i,r in ipairs(known) do
        local root=Cases and Cases.find(wrapper,r.id);local case=root and root.case
        local addresses=case and ConspiracyFiles.AddressMap and ConspiracyFiles.AddressMap.describe(r.body,case)
        local detail=addresses or (case and PlaceNames.render(r.body,case) or r.body)
        local markers=ConspiracyFiles.ClueMarkers
        if markers and markers.note then
            local ok,note=pcall(markers.note,r.id)
            if ok and note then detail=detail.."\n\nMAP NOTE\n"..note end
        end
        for _,link in ipairs(r.connections or {}) do
            if titles[link.target] then detail=detail.."\n\n"..(meanings[link.kind] or "Connected to")..": "..titles[link.target] end
        end
        -- The survivor wondering about a document not found yet. Owner,
        -- 2026-09-11: not "refers to a second list you have not found" but
        -- "probably refers to another list?" - "that creates tension". A
        -- question can be wrong, which is what keeps it from being a waypoint.
        for _,link in ipairs(r.unseen or {}) do
            local noun=nounOf(link.title)
            if noun~="" then
                local own=string.lower(tostring(r.title or ""))
                local lead=string.find(own,noun,1,true) and "another" or articleFor(noun)
                detail=detail.."\n\nProbably refers to "..lead.." "..noun.."?"
            end
        end
        -- A maybe, never a finding: the mod does not know the week means
        -- anything. The memo is not noted against itself.
        if memoFound and r.kind~=RelayMemo.KIND and RelayMemo.inWeek(r.body) then
            detail=detail.."\n\n"..RelayMemo.NOTE
        end
        -- No "Inspected " prefix: every journal row carried it, so it told the
        -- reader nothing and cost ten characters of a narrow column. The
        -- summary line already says the row was inspected.
        -- Several cases interleave chronologically by design; the case's own
        -- short dispatch code (already shown in document titles, e.g.
        -- "Dispatch copy / R-482") orients the reader without grouping or
        -- reordering anything. Identity and connection rows never reach this
        -- function, so no case marker is invented for them.
        local caseMarker=case and type(case.facts)=="table" and type(case.facts.code)=="string" and case.facts.code
        -- EvidenceKinds.label is a human phrase for the twelve document carriers
        -- ("Dispatch document"), but an object carrier's label is its raw
        -- catalogue id - "ClayPot" reached the notebook on 2026-09-10. An
        -- object already says what it is in its own title, so the summary says
        -- what kind of thing it is rather than repeating the id.
        local carrier=require("ConspiracyFiles/Generated/EvidenceKinds").get(r.kind) or {}
        local what=carrier.label or "Evidence"
        if carrier.capacity=="object" then what="Object found" end
        -- The subtitle is composed later, in PlaceIndex.decorate, because
        -- only there is it known whether the survivor remembers where this
        -- was found - and the place takes the slot the carrier name held.
        -- What is set here is the fallback, used verbatim when there is no
        -- place, so an unplaced row reads exactly as it always did.
        rows[i]={id=r.id,ordinal=i,title=r.title,cfCarrier=what,cfCase=caseMarker or nil,
            summary=what.." - Discovery "..i
                ..(caseMarker and " - Case "..caseMarker or ""),detailText=detail}
    end
    return rows
end

return Rows
