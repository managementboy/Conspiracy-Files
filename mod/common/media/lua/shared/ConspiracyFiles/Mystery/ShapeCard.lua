-- THE SHAPE CARD: COMPUTED, NEVER DECLARED.
--
-- Design v3, iteration 2's deepened diversity-guard branch: "the shape card
-- is computed, not declared, by running a pure extractor over each
-- mystery's data file... no author self-report to drift." An author cannot
-- claim variety; the card is read off what the mystery actually is.
local Vocab=require("ConspiracyFiles/Mystery/Vocabulary")
local M={}

-- Bucket a finding count so near-identical sizes collide (3 and 4 are the
-- same bucket; 3 and 7 are not).
local function countBucket(n)
    if n<=2 then return "1-2" end
    if n<=4 then return "3-4" end
    if n<=6 then return "5-6" end
    return "7+"
end

-- Which single `where` a mystery leans on most, and how many distinct
-- `where`s it uses - "site pattern" in the plan's language.
local function sitePattern(findings)
    local counts,distinct={},0
    for _,f in ipairs(findings) do
        counts[f.where]=(counts[f.where] or 0)+1
    end
    local dominant,most
    for where,n in pairs(counts) do
        distinct=distinct+1
        if not most or n>most then dominant,most=where,n end
    end
    return dominant.."x"..distinct
end

-- The dominant GATE kind, or "none" for a mystery with no mechanic at all.
local function dominantGate(gates)
    local counts={}
    for _,g in ipairs(gates or {}) do counts[g.kind]=(counts[g.kind] or 0)+1 end
    local dominant,most="none",0
    for kind,n in pairs(counts) do if n>most then dominant,most=kind,n end end
    return dominant
end

-- The multiset of LINK shapes used, as a stable sorted string.
local function linkShapeSet(links)
    local seen={}
    for _,l in ipairs(links or {}) do seen[l.shape]=true end
    local out={}
    for shape in pairs(seen) do out[#out+1]=shape end
    table.sort(out)
    return #out>0 and table.concat(out,",") or "none"
end

-- Occupations a mystery has an authored reading for, read off any finding
-- or reveal that carries an `occupation` or `occupations` field.
local function occupationsOf(mystery)
    local seen={}
    local function scan(list)
        for _,item in ipairs(list or {}) do
            if item.occupation then seen[item.occupation]=true end
            for _,o in ipairs(item.occupations or {}) do seen[o]=true end
        end
    end
    for _,f in pairs(mystery.findings or {}) do
        if f.occupation then seen[f.occupation]=true end
        for _,o in ipairs(f.occupations or {}) do seen[o]=true end
    end
    scan(mystery.reveals); scan(mystery.gates)
    local out={}
    for o in pairs(seen) do out[#out+1]=o end
    table.sort(out)
    return out
end

-- Cheap stylometry over a mystery's own prose: average sentence length and
-- the fraction of hedge words ("could", "may", "seems", "might", "perhaps").
-- Not a real NLP pipeline - a stable, cheap signal the fuzzy pass can diff.
local HEDGES={["could"]=true,["may"]=true,["seems"]=true,["might"]=true,
    ["perhaps"]=true,["maybe"]=true,["possibly"]=true}
local function voiceProfile(mystery)
    local words,hedges,sentences=0,0,0
    local function scan(text)
        if type(text)~="string" or text=="" then return end
        sentences=sentences+(select(2,text:gsub("[%.%?!]","")))
        for w in text:lower():gmatch("%a+") do
            words=words+1
            if HEDGES[w] then hedges=hedges+1 end
        end
    end
    for _,f in pairs(mystery.findings or {}) do
        scan(f.observation); scan(f.source); scan(f.note); scan(f.body)
    end
    for _,r in ipairs(mystery.reveals or {}) do scan(r.text) end
    if sentences==0 then sentences=1 end
    if words==0 then words=1 end
    return {avgSentenceLen=words/sentences,hedgeRate=hedges/words}
end

-- The full card. Pure; no PZ dependency; takes only the mystery table.
function M.compute(mystery)
    local findings={}
    for _,f in pairs(mystery.findings or {}) do findings[#findings+1]=f end
    return {
        id=mystery.id,
        sitePattern=sitePattern(findings),
        countBucket=countBucket(#findings),
        dominantGate=dominantGate(mystery.gates),
        linkShapes=linkShapeSet(mystery.links),
        closeKind=mystery.close and mystery.close.kind or "carried",
        occupations=occupationsOf(mystery),
        voice=voiceProfile(mystery),
    }
end

-- The exact-match key: two mysteries sharing every structural field.
function M.tupleKey(card)
    return table.concat({card.sitePattern,card.countBucket,card.dominantGate,
        card.linkShapes,card.closeKind},"|")
end

-- Similarity between two voice profiles, 1.0 identical, falling off with
-- distance. Cosine similarity was tried first and rejected: both features
-- are always non-negative, so two prose samples of very different rhythm
-- (short punchy sentences vs long hedged ones) still point in nearly the
-- same direction in the positive quadrant and score near 1.0 regardless -
-- a metric that cannot discriminate is worse than none, so this measures
-- relative distance per feature instead, each capped at 1.0 so one wildly
-- different feature cannot be washed out by the other agreeing.
function M.voiceSimilarity(a,b)
    local function closeness(x,y)
        local hi=math.max(x,y)
        if hi==0 then return 1 end
        return 1-math.min(1,math.abs(x-y)/hi)
    end
    local sentence=closeness(a.avgSentenceLen,b.avgSentenceLen)
    local hedge=closeness(a.hedgeRate,b.hedgeRate)
    return math.min(sentence,hedge)
end

return M
