-- What a notebook row says about WHERE, and how rows read when they are
-- grouped by place instead of by case. Pure domain: no PZ runtime, no UI, so
-- every rule below is testable in plain Lua 5.1.
--
-- The store is the discovery ledger and only the ledger (DiscoveryLedger
-- carries `place` and `placeId` per event, stamped once at discovery). This
-- module is a projection over it: it never decides what happened, only what a
-- surface may say about it.
--
-- Three rules run through the whole file and are the reason it exists:
--
--   1. A missing place is a real answer. It is nil, never "Unknown" and never
--      "", so it can neither earn a heading nor herd unrelated entries under
--      one fake one.
--   2. A heading is earned, never printed. See M.headings: a place gets a
--      name only once the player has come back to it having learned something
--      since (P4-R81).
--   3. Nothing regresses. A row the ledger has no place for keeps exactly the
--      summary its source gave it.
local M={}

-- "the same place" means THE BUILDING. Not the room, not the container, not
-- the tile. Four papers in one desk, and a fifth in the wardrobe upstairs,
-- were all found at 109 Walker Road; a player who searched that house
-- remembers the house. The building id travels beside the label in the
-- ledger, so this grain can be narrowed or widened later without rewriting a
-- single stored event.
M.GRAIN="building"

local function text(v) return type(v)=="string" and v~="" and v or nil end

-- WP1. Fold the place into rows that have one, and say so plainly on the rows
-- that do not. `places` is DiscoveryLedger.places(): row id -> label, sparse.
--
-- Two summary shapes, because the sources do not agree on one. A generated
-- evidence row hands us its parts (cfCarrier, cfCase) and gets its subtitle
-- composed here, so the place can take the slot the carrier item's name used
-- to hold - that slot was the whole complaint, three different documents all
-- reading "Handwritten cover letter". Every other source (identity, keys,
-- connections) already writes a subtitle that distinguishes its rows, so the
-- place is prefixed rather than substituted.
--
-- The carrier name is not lost, only demoted: it moves into the FOUND block,
-- and it is still the subtitle whenever there is no place to show instead.
function M.decorate(rows,places)
    places=type(places)=="table" and places or {}
    for _,row in ipairs(rows or {}) do
        local where=text(places[row.id])
        row.place=where
        local carrier=text(row.cfCarrier)
        if carrier then
            local head=where or carrier
            row.summary=head.." - Discovery "..tostring(row.ordinal or "?")
                ..(text(row.cfCase) and (" - Case "..row.cfCase) or "")
        elseif where then
            row.summary=where.." - "..tostring(row.summary or "")
        end
        row.detailText=(row.detailText or "").."\n\nFOUND\n"..M.foundLine(where,carrier)
    end
    return rows
end

-- The FOUND block's text. Placeless is not an error state and must not read
-- like one: the survivor simply did not note it, which is an ordinary thing
-- for someone to not do.
function M.foundLine(where,carrier)
    local tail=carrier and (" It was "..carrier:lower()..".") or ""
    if where then return where..tail end
    return "I didn't note where I was."..tail
end

-- WP2/WP6. Which places have earned a heading, given how often the player has
-- come back to each of them having learned something in between.
--
-- `visits` is PlaceVisits.counts(): label -> number of EARNED visits, where
-- pacing a doorway earns nothing (PlaceVisits does that filtering; this only
-- reads the number). One is not a return. Two is.
function M.headings(visits)
    local out={}
    for label,n in pairs(type(visits)=="table" and visits or {}) do
        if text(label) and type(n)=="number" and n>=2 then out[label]=n end
    end
    return out
end

-- What a heading says. The address is withheld until the third visit: by then
-- the player has shown they care which house it is, and before then the bare
-- fact of returning is the whole of what we know.
function M.headingText(label,n)
    if not text(label) or type(n)~="number" then return nil end
    if n<2 then return nil end
    if n==2 then return "Back again" end
    if n==3 then return "Third time now - "..label end
    return "Been back here "..n.." times - "..label
end

-- The place view: the SAME rows as the case view, in the same discovery
-- order, with a heading inserted wherever an earned place's run begins.
--
-- Deliberately not a sort. Sorting by place would turn the notebook into an
-- address checklist to sweep, which is the failure this whole index was
-- supposed to avoid; discovery order is still the true order, and a heading
-- is a marker laid over it rather than a bucket rows are poured into.
--
-- Returns a flat list of entries: {heading=...,crossesCases=bool} or
-- {row=...}. Callers render headings however their surface can.
function M.index(rows,headings)
    headings=type(headings)=="table" and headings or {}
    local entries,open={},nil
    for _,row in ipairs(rows or {}) do
        local where=text(row.place)
        if where and headings[where] and where~=open then
            entries[#entries+1]={heading=M.headingText(where,headings[where]),
                place=where,crossesCases=M.crossesCases(rows,where)}
            open=where
        elseif not where or not headings[where] then
            open=nil
        end
        entries[#entries+1]={row=row}
    end
    return entries
end

-- Does one place hold rows from more than one case? That is a real finding -
-- this desk touches two cases - and it is the reason grouping by place is
-- worth having alongside grouping by case, rather than instead of it.
function M.crossesCases(rows,where)
    local seen,n=nil,0
    for _,row in ipairs(rows or {}) do
        if text(row.place)==where and text(row.cfCase) then
            if seen==nil then seen=row.cfCase; n=1
            elseif row.cfCase~=seen then n=2; break end
        end
    end
    return n>1
end

-- What the place view says when nothing has earned a heading yet - the whole
-- of the first hour of every save. It must read as a state of the world, not
-- as a broken panel, because that is exactly what it is.
M.EMPTY="Nothing here has been worth going back to yet. When I return somewhere "
    .."and find I've learned something since, I'll start keeping the place together."

return M
