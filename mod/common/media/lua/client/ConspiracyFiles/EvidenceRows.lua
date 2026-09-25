-- The projection from what the survivor has actually found to the rows the
-- organiser shows. ONE store, ONE projection: FILES, NAMES, DATES and PLACES all
-- read this (docs/design/READING_SURFACES.md).
--
-- It is a module rather than a local inside a screen, so the thing every app
-- depends on can be required and tested directly (test/evidence_rows.lua).
--
-- Rows.build is the evidence alone, in the order the runtime knows it.
-- Rows.list is what a screen reads: those rows plus the survivor's other
-- findings, in true discovery order, with where each was found (P4-R128).
-- The old evidence window used to do that second half for itself, so the
-- organiser never received it; it moved here when the window was removed.
local PlaceNames=require("ConspiracyFiles/Generated/PlaceNames")
local RelayMemo=require("ConspiracyFiles/Generated/RelayMemo")
local PlaceIndex=require("ConspiracyFiles/PlaceIndex")
local Headings=require("ConspiracyFiles/Headings")

local Rows={}

-- The generated runtime, once it has a case. `runtime` arguments below are
-- functions returning one, so a test can stand in for it.
function Rows.live()
    local rt=ConspiracyFiles and ConspiracyFiles.GeneratedRuntime
    if rt and rt.metrics and rt.metrics() then return rt end
end

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
    for i,r in ipairs(known) do
        local root=Cases and Cases.find(wrapper,r.id)
        -- Retired evidence keeps its original places and reference. Resolving
        -- a readable address must not stop working when placement work ends.
        local case=root and (root.case or (root.locations and
            {locations=root.locations,facts={code=root.reference},followsFrom=root.followsFrom}))
        -- THE TWO WRITERS OF A PLACE, in order, not one or the other.
        -- AddressMap names the sites the shipped book has a number for
        -- (P4-R129); PlaceNames then reads whatever place words are LEFT the
        -- way it always did - "the receiving building near Schoolhouse St" for
        -- a site the book does not number, and nothing at all for a case it
        -- cannot speak for. This used to be an either/or, and because describe
        -- refused a whole case when one of its sites was unnumbered, a case
        -- like that showed no address for any of its clues
        -- (20260918T230942-travel.txt; about one case in five).
        -- A fully numbered case is unaffected: describe has already replaced
        -- every mention of both site names, so PlaceNames finds nothing to
        -- replace and adds no location guide, exactly as before.
        if case and Cases and Cases.sessions then case=PlaceNames.context(case,Cases.sessions(wrapper)) end
        local detail=r.body
        if case then
            local map=ConspiracyFiles.AddressMap
            -- `map.describe and` because a live reload replaces the module: for
            -- one refresh ConspiracyFiles.AddressMap can be a table with
            -- nothing in it yet, and a row must not throw over that.
            detail=(map and map.describe and map.describe(detail,case)) or detail
            detail=PlaceNames.render(detail,case,r.body,map and map.describe)
        end
        local markers=ConspiracyFiles.ClueMarkers
        if markers and markers.note then
            local ok,note=pcall(markers.note,r.id)
            if ok and note then detail=detail.."\n\n"..Headings.MARKED.."\n"..note end
        end
        for _,link in ipairs(r.connections or {}) do
            if titles[link.target] then detail=detail.."\n\n"..(meanings[link.kind] or "Connected to")..": "..titles[link.target] end
        end
        -- Unknown source titles cannot become hints through a backend link.
        -- Authored questions already live in the discovered source's own note.
        -- A maybe, never a finding: the mod does not know the week means
        -- anything. The memo is not noted against itself.
        if memoFound and r.kind~=RelayMemo.KIND and RelayMemo.inWeek(r.body) then
            detail=detail.."\n\n"..RelayMemo.NOTE
        end
        -- Several cases interleave chronologically by design; the case's own
        -- short dispatch code (already shown in document titles, e.g.
        -- "Dispatch copy / R-482") orients the reader without grouping or
        -- reordering anything. Identity and connection rows never reach this
        -- function, so no case marker is invented for them.
        local caseMarker=case and type(case.facts)=="table" and type(case.facts.code)=="string" and case.facts.code
        -- EvidenceKinds.label is a human phrase for the twelve document carriers
        -- ("Dispatch document"), but an object carrier's label is its raw
        -- catalogue id - "ClayPot" reached the screen on 2026-09-10. An
        -- object already says what it is in its own title, so the summary says
        -- what kind of thing it is rather than repeating the id.
        local carrier=require("ConspiracyFiles/Generated/EvidenceKinds").get(r.kind) or {}
        local what=carrier.label or "Evidence"
        if carrier.capacity=="object" then
            -- A real starting-house key has a precise ordinary name. Calling it
            -- merely "an object" made the opening read like engine telemetry.
            what=r.kind=="Key1" and "Brass key" or "Object found"
        end
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

-- Where a piece of evidence physically is, as the survivor would put it, or
-- nil when nothing is known. Knowledge, never fate: the scan only sees a small
-- area, so no state may claim a document was lost or destroyed.
Rows.WHEREABOUTS={
    -- The fallback stays deliberately plain for the rare case where the item
    -- was seen but its surroundings could not be read.
    accounted="Last accounted for close by.",
    uncertain="Not seen recently. Its whereabouts are uncertain.",
    conflict="More than one copy has been seen. Which is the original is uncertain.",
    -- THE PDA IS AN IN-WORLD TOOL. Owner, 2026-09-24: "Why are we talking to
    -- the player about saves? The PDA is an immersive tool." This state means
    -- there has been no sighting since the session began, which the survivor
    -- experiences simply as not having checked. Say that, and say the
    -- uncertainty it leaves, without naming a save or a load.
    unchecked="I have not checked on it. Where it is now, I would be guessing.",
    -- A finished case: where its evidence was last seen, kept in the save
    -- (P4-R104; owner, 2026-09-14: "I lost my files somewhere?"). Only shown
    -- with a place; never a claim of loss.
    lastseen="Last seen: ",
}
function Rows.where(id)
    local rt=ConspiracyFiles and ConspiracyFiles.GeneratedRuntime
    if not rt or not rt.whereabouts then return nil end
    local ok,state,place=pcall(rt.whereabouts,id)
    if not ok then return nil end
    place=type(place)=="string" and place~="" and place or nil
    -- Say where it is when we saw it, rather than describing everywhere it
    -- might be. Vagueness is for what we cannot know.
    if state=="accounted" then return place or Rows.WHEREABOUTS.accounted end
    if state=="uncertain" then return Rows.WHEREABOUTS.uncertain..(place and (" Last seen: "..place) or "") end
    if state=="lastseen" then return place and (Rows.WHEREABOUTS.lastseen..place) or nil end
    return Rows.WHEREABOUTS[state]
end

-- The survivor's findings that are not evidence items: what a key fits, keys
-- off a body, key leads - and, for PLACES, the identity cards NAMES also lists.
local function otherRows(withIdentity)
    local out={}
    local CF=ConspiracyFiles or {}
    -- Names, not a list of modules: a module that is absent would leave a hole
    -- and ipairs stops at the first one, silently dropping every source after it.
    local names={"KeyJournal","ObservedKeyLeads","KeyObserver"}
    if withIdentity then table.insert(names,1,"IdentityObserver") end
    for _,name in ipairs(names) do
        local source=CF[name]
        if source and source.rows then
            local ok,rows=pcall(source.rows)
            if ok and type(rows)=="table" then for _,row in ipairs(rows) do out[#out+1]=row end end
        end
    end
    return out
end

-- What a screen reads. `section` is:
--   "evidence" - the evidence items only (NAMES, DATES)
--   "files"    - evidence plus the key findings (FILES)
--   "places"   - every finding, with a heading over a place the survivor has
--                come back to (PLACES, P4-R81); the heading rows carry cfHeading.
-- Every section is in true discovery order, numbered by it, and carries where
-- each row was found as a FOUND block.
function Rows.list(section,runtime)
    local rows=Rows.build(section,runtime or Rows.live)
    local maps=ConspiracyFiles and ConspiracyFiles.MapMediaRuntime
    if maps then for _,row in ipairs(maps.rows()) do rows[#rows+1]=row end end
    if section=="files" or section=="places" then
        for _,row in ipairs(otherRows(section=="places")) do rows[#rows+1]=row end
    end
    -- One shared ledger decides order and numbering for every source, so the
    -- list reflects real discovery order rather than source groups.
    local log=ConspiracyFiles and ConspiracyFiles.DiscoveryLog
    if log and log.order then rows=log.order(rows) else for index,row in ipairs(rows) do row.ordinal=index end end
    local placeOf={}
    if log and log.places then
        local ok,found=pcall(log.places)
        if ok and type(found)=="table" then placeOf=found end
    end
    PlaceIndex.decorate(rows,placeOf)
    if section~="places" then return rows end
    -- The same rows in the same order, with a heading laid over the runs that
    -- earned one. Deliberately not sorted: bucketing by address would turn the
    -- record into a checklist to sweep.
    local visits=ConspiracyFiles and ConspiracyFiles.PlaceVisitLog
    local counts={}
    if visits and visits.counts then
        local ok,found=pcall(visits.counts)
        if ok and type(found)=="table" then counts=found end
    end
    local out,any={},false
    for _,entry in ipairs(PlaceIndex.index(rows,PlaceIndex.headings(counts))) do
        if entry.heading then
            any=true
            out[#out+1]={cfHeading=true,title=entry.heading,
                detailText=entry.crossesCases and "This place touches more than one case." or nil}
        else
            out[#out+1]=entry.row
        end
    end
    -- Flat is the correct and expected state for the first hour of a save. Say
    -- why, in the survivor's voice, so it does not read as a failed panel.
    if not any and #rows>0 then table.insert(out,1,{cfHeading=true,title=PlaceIndex.EMPTY,detailText=PlaceIndex.EMPTY}) end
    return out
end

return Rows
