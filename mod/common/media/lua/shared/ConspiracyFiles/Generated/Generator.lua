-- Deterministic event generation and save-shaped restoration. No engine calls.
local Catalog=require("ConspiracyFiles/Generated/Catalog")
local V=require("ConspiracyFiles/Validator")
local Memo=require("ConspiracyFiles/Generated/RelayMemo")
local K=require("ConspiracyFiles/Generated/EvidenceKinds")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Calendar=require("ConspiracyFiles/Calendar")
local Story=require("ConspiracyFiles/Generated/Story")
local PersonalScenarios=require("ConspiracyFiles/Generated/PersonalScenarios")
local OrdinaryScenarios=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local ConspiracyPair=require("ConspiracyFiles/Generated/ConspiracyPair")
-- Fresh saves only: each family now supplies a whole authored event. There
-- is no generic paperwork fallback and no optional omission of its answer.
local G={REVISION="g18-first-person-functional-key",SCHEMA=3,MIN_EVIDENCE=3,MAX_EVIDENCE=7}
local function copy(v) if type(v)~="table" then return v end; local out={}; for k,c in pairs(v) do out[k]=copy(c) end; return out end
local function same(a,b)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    for k,v in pairs(a) do if not same(v,b[k]) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end; return true
end
local function seedOK(n) return type(n)=="number" and n==math.floor(n) and n>=1 and n<2147483647 end
local function rng(seed)
    return function(n) seed=(seed*48271)%2147483647; return seed%n+1 end
end
-- Placeholder substitution. Plain find/concatenation rather than string.gsub
-- with a pattern: a premise's own words are data, and a '%' or a '-' in an
-- organisation name must never be read as a pattern. Kahlua's string library
-- is incomplete, and this stays inside the part of it the engine implements.
local function subst(text,key,value)
    local token="{"..key.."}"
    -- NO VALUE, NO SUBSTITUTION. A nil value used to be concatenated and threw
    -- (Generator.lua:40) the moment SELF joined FIELDS, because a caller that
    -- builds its own map - test/premise_consistency.lua does - has no SELF in
    -- it. Leaving the text alone is the safe answer: the only premise that
    -- mentions {SELF} is the opening, and the generator already refuses to build
    -- an opening without a name, so a placeholder can never reach a document
    -- through this path. test/opening_premise.lua asserts that directly.
    if value==nil then return text end
    local out,at=nil,1
    while true do
        local s,e=string.find(text,token,at,true)
        if not s then break end
        out=(out or "")..string.sub(text,at,s-1)..value
        at=e+1
    end
    if not out then return text end
    return out..string.sub(text,at)
end
-- The date fields are whole phrases ("June 14, 1993"), never a bare day spliced
-- into "July {D1}, 1993": once cases cross a month end (P4-R108) only the
-- calendar knows which month a day is in.
-- SELF is the survivor's own name and is LAST, so the ordinary keys resolve
-- exactly as they did. Only the opening premise mentions it; for every other
-- case map.SELF is nil and subst leaves the text untouched. fill walks this
-- list rather than the map's keys, which is why adding map.SELF alone rendered
-- nothing - the placeholder stayed literal in the slip.
local FIELDS={"CODE","ORG","P1","P2","A","B","DATE0","DATE1","DATE2","DATE3","DATE1CAPS","DATE2CAPS",
    "DAYS12","PRIORMONTH","SINCE11","SELF","FROMPOINT","FROMREF"}
local function fill(text,map)
    for _,key in ipairs(FIELDS) do text=subst(text,key,map[key]) end
    return text
end
-- A case reference exists so that three documents look like one file,
-- which is how paperwork works. It is drawn independently of the premise: the
-- links between documents already carry the connection and the record sorts
-- on them, so a reference that encoded the premise would only announce which
-- story the player had drawn before they had read a word of it.
local REFERENCE={"R","RC","GT","PS","WB","HK","MC","BF","LD","TN","AV","QS"}
-- A catalogue id is a script name: KitchenKnife, Necklace_DogTag. The survivor
-- writes in words, so the id is broken back into them. This is deliberately
-- dumb - it cannot know that "Necklace_DogTag" is a set of dog tags - which is
-- why nothing built on it may claim to know what the object IS beyond its
-- name.
-- Engine slot prefixes. "Hat_SurgicalMask" is a surgical mask; the "Hat" is
-- the game telling itself which body slot to use, and a survivor writing
-- "hat surgical mask" would be transcribing our plumbing.
local SLOT_PREFIXES={"Hat_","Necklace_","Vest_","Shirt_","Trousers_","Jacket_",
                     "Mov_","Bag_","Shoes_","Gloves_"}
-- Trailing qualifiers. "CreditCard_Stolen" is a stolen credit card, not a
-- "credit card stolen" - seen in play 2026-09-10, eleven of them in one drawer.
-- A closed list, because only some trailing words are adjectives: Bag_DuffelBag
-- is a duffel bag and must not become "duffelbag bag".
local QUALIFIERS={Stolen=true,Old=true,Used=true,Dirty=true,Broken=true,
    Empty=true,Full=true,Burnt=true,Rusty=true,Worn=true,Fresh=true,Wet=true,
    Fancy=true,Forged=true,Crude=true,Cheap=true,Small=true,Large=true,
    -- Materials read backwards the same way: Fork_Bone is a bone fork and
    -- BaseballBat_Crafted a crafted baseball bat.
    Crafted=true,Bone=true,Stone=true,Wood=true,Wooden=true,Metal=true,Leather=true}
-- Which side of a pair a thing is does not matter to an investigation, and
-- "ten elbow pad rights" is not English. Dropped from the display name only.
local SIDES={Left=true,Right=true,L=true,R=true,Male=true,Female=true}
-- Acronyms that open an item id, kept in capitals. Letter case alone cannot
-- tell "TV|Dinner" from "CD|player": the old rule made "CDplayer" "c dplayer"
-- and "IDcard" "i dcard" (Linux run, 2026-09-11: "C dplayer, marked Curtis
-- Vance"). Longest first. Weapon model codes are deliberately not here.
local ACRONYMS={"SCBA","BBQ","RPG","VHS","CD","ID","TV","BS"}
local function words(id)
    -- Both spellings: CreditCard_Stolen and BandageDirty. The second is why
    -- the underscore cannot be required - the test caught "bandage dirty"
    -- immediately after the first version fixed "credit card stolen".
    -- Sides and qualifiers, in whatever order they come. "ElbowPad_Right" is
    -- an elbow pad; "Kneepad_Right_Leather" is a leather kneepad, and peeling
    -- only the last word left "right" behind (caught by test, 2026-09-11).
    local qualifier
    for _=1,4 do
        local body,tail=string.match(id,"^(.-)_?([A-Z][a-z]*)$")
        if not body or body=="" then break end
        if SIDES[tail] then
            id=body
        elseif QUALIFIERS[tail] and not qualifier then
            qualifier=string.lower(tail)
            id=body
        else
            break
        end
    end
    for _,prefix in ipairs(SLOT_PREFIXES) do
        if string.sub(id,1,#prefix)==prefix then id=string.sub(id,#prefix+1) end
    end
    -- A trailing variant digit is not a word. Diary1 is a diary.
    while #id>0 do
        local ch=string.sub(id,#id,#id)
        if ch>="0" and ch<="9" then id=string.sub(id,1,#id-1) else break end
    end
    local acronym
    for _,a in ipairs(ACRONYMS) do
        if string.sub(id,1,#a)==a then acronym=a; id=string.sub(id,#a+1); break end
    end
    local out=""
    local previousLower=false
    for i=1,#id do
        local ch=string.sub(id,i,i)
        local upper=(ch>="A" and ch<="Z")
        local digit=(ch>="0" and ch<="9")
        if ch=="_" then
            out=out.." "
            previousLower=false
        else
            if (upper or digit) and previousLower then out=out.." " end
            -- A run of capitals followed by a lower-case letter is an acronym
            -- meeting a word: IDcard is an ID card, not an idcard.
            if upper then
                local nextCh=string.sub(id,i+1,i+1)
                local previousCh=string.sub(id,i-1,i-1)
                if previousCh>="A" and previousCh<="Z" and nextCh>="a" and nextCh<="z" then out=out.." " end
            end
            out=out..string.lower(ch)
            previousLower=not upper and not digit
        end
    end
    -- Collapse any double spacing an underscore beside a capital produced.
    local collapsed,at="",1
    while true do
        local s2,e2=string.find(out,"  ",at,true)
        if not s2 then break end
        collapsed=collapsed..string.sub(out,at,s2-1).." "
        at=e2+1
    end
    local text=collapsed..string.sub(out,at)
    text=string.match(text,"^%s*(.-)%s*$")
    if acronym then text=text=="" and acronym or acronym.." "..text end
    -- An acronym later in the id, whole word: "PressID" is a press ID, not a
    -- "press id"; "LighterBBQ" a lighter for a BBQ.
    local known={};for _,a in ipairs(ACRONYMS) do known[string.lower(a)]=a end
    text=string.gsub(text,"%a+",function(word) return known[word] or word end)
    if qualifier then text=qualifier.." "..text end
    return text
end
-- Exposed for tests: the words an item id becomes in player-facing text.
G.words=words
-- A survivor writes "fourteen", not "14". The range is the one
-- ObjectRules.accumulation can produce; anything outside it is a mistake
-- upstream and should look like one rather than being silently rendered.
local NUMERALS={"one","two","three","four","five","six","seven","eight","nine","ten",
                "eleven","twelve","thirteen","fourteen","fifteen","sixteen"}
local function numeral(n) return NUMERALS[n] or tostring(n) end
-- Seeded 1993 source dates: claim May 1-June 28, later entries one to nine
-- days apart, never after July 8. A separate branch can place later entries in
-- the relay memo's week. The current story pool's actual distribution belongs
-- in Claude's verification; older prose-pool measurements do not establish it.
-- Restoration uses saved inputs, never the current world clock.
-- Dates are day-of-year ordinals in 1993 (1 = 1 January; not a leap year).
local MAY_1,JUNE_28,JUNE_29,JUNE_30,JULY_8=121,179,180,181,189
local MONTH_NAMES={"January","February","March","April","May","June","July",
                   "August","September","October","November","December"}
local function monthOf(ordinal)
    local month=1
    while ordinal>Calendar.monthLength(month,1993) do
        ordinal=ordinal-Calendar.monthLength(month,1993); month=month+1
    end
    return month,ordinal
end
local function dateText(ordinal)
    local month,day=monthOf(ordinal)
    return MONTH_NAMES[month].." "..day..", 1993"
end
-- Four draws, always, in this order: whether the case reaches the memo's
-- week, then the three numbers that place its dates.
function G.calendar(random)
    local near=random(5)<=2
    local x,g1,g2=random(58),random(9),random(9)
    local claim,response,review
    if near then
        -- The response in 30 June - 7 July, so the review after it still
        -- fits by 8 July; the claim no more than nine days before, and never
        -- after 28 June.
        response=JUNE_30+(x-1)%8
        claim=response-math.max(g1,response-JUNE_28)
        review=response+(g2-1)%(JULY_8-response)+1
    else
        claim=MAY_1+x-1
        response=claim+(g1-1)%math.min(9,JUNE_28-claim)+1
        review=response+(g2-1)%math.min(9,JUNE_29-response)+1
    end
    return {claimDate=claim,responseDate=response,reviewDate=review}
end
-- The placeholders a calendar supplies. Relative phrases are rendered from
-- the same numbers as the dates they relate, so "one day before" or "for
-- four days" is true by construction rather than by a writer's arithmetic
-- (P4-R107: "differ by eight months" was four; "eight days later" landed
-- after the review).
function G.dateFields(cal)
    local gap=cal.responseDate-cal.claimDate
    local month=monthOf(cal.claimDate)
    local sinceMonth,sinceYear=month-11,1993
    if sinceMonth<1 then sinceMonth=sinceMonth+12; sinceYear=1992 end
    return {
        DATE0=dateText(cal.claimDate-1),DATE1=dateText(cal.claimDate),
        DATE2=dateText(cal.responseDate),DATE3=dateText(cal.reviewDate),
        DATE1CAPS=string.upper(dateText(cal.claimDate)),DATE2CAPS=string.upper(dateText(cal.responseDate)),
        DAYS12=numeral(gap)..(gap==1 and " day" or " days"),
        -- The month before the claim's: always 1993, since the claim is May or June.
        PRIORMONTH=MONTH_NAMES[month-1],
        SINCE11=MONTH_NAMES[sinceMonth].." "..sinceYear,
    }
end
-- Full names, not initials. Owner, 2026-09-10: a nearby body is going to be
-- given this name and an ID to match, and "M. Ellis" on a corpse is not
-- something a player can connect to a letter signed "M. Ellis" - it is the
-- same abbreviation twice. A full name is a person. Exposed so the organiser's
-- NAMES can find these names on the evidence the player has read; never edit it
-- in place - a case rebuilds from it (Generator.validate).
G.INVENTED_NAMES={"Marion Ellis","Delia Mercer","Roy Hale","Joanne Voss",
                  "Curtis Vance","Adele Prosser","Warren Nagy","Ines Kubiak"}
-- Survivor choices may influence people and compatible optional contributions;
-- they never determine what really happened. Saved inputs rebuild exactly.
local function build(seed,revision,sites,cast,relayMemo,steer,opening,follows)
    local random=rng(seed)
    -- The premise is drawn first, so it is the seed's most significant choice:
    -- what the case is ABOUT, before who is in it or how it resolves. See
    -- ConspiracyFiles/Generated/Premises.lua and docs/design/PREMISES.md.
    local premise
    if opening and opening.premise then
        local selector=opening.premise=="auto" and seed or opening.premise
        local why
        if opening.premise=="auto" and opening.profession then
            premise=Premises.forProfession(opening.profession)
        end
        if not premise then premise,why=Premises.opening(selector) end
        if not premise then return nil,why or "no opening premise" end
    elseif follows then
        local why; premise,why=Premises.followUp()
        if not premise then return nil,why or "no follow-up premise" end
    else
        premise=Premises.choose(random)
    end
    if not premise then return nil,"no eligible story family" end
    local outline=random(2)==1 and "corroboration" or "conflicting-account"
    -- This draw selects a whole authored event, not a mandatory innocent /
    -- sinister interpretation of interchangeable paperwork. The old outline
    -- field remains a deterministic variant selector during the rebuild.
    local variant=outline=="corroboration" and 1 or 2
    if opening and premise.profession then
        local variants=Premises.openingVariants(premise.id)
        variant=opening.variant or ((seed-1)%variants+1)
    end
    if steer and steer.organisation and not opening and not follows then
        -- Return to an actual authored business event. Replacing letterheads
        -- would make a motel operate a sawmill; ignoring the choice is no better.
        local compatible={}
        for _,id in ipairs(Premises.list()) do
            local meta=Premises.get(id)
            if not meta.opening and not meta.followUp then
                for v=1,2 do
                    local candidate=OrdinaryScenarios.get(id,v)
                    if candidate and candidate.organisation==steer.organisation then
                        compatible[#compatible+1]={premise=meta,variant=v}
                    end
                end
            end
        end
        if #compatible==0 then return nil,"no authored event for returning organisation" end
        local selected=compatible[random(#compatible)]
        premise,variant=selected.premise,selected.variant
        outline=variant==1 and "corroboration" or "conflicting-account"
    end
    local scenario=PersonalScenarios.get(premise.id,variant) or OrdinaryScenarios.get(premise.id,variant)
    if not scenario then return nil,"missing authored scenario for "..premise.id end
    local invented=G.INVENTED_NAMES
    -- People the player has ALREADY MET, if there are any. Owner, 2026-09-11:
    -- "do we track the names of corpses so we can fill out other evidence with
    -- it?" We did, and every case still drew from eight invented names.
    --
    -- `cast` is the names read off identity documents on bodies the player has
    -- looted, handed in at case creation and SAVED IN THE CASE - exactly as the
    -- two buildings are. That is what keeps a case rebuildable from its seed:
    -- the world-derived facts are inputs recorded alongside it, never read
    -- again from the world at load time.
    --
    -- With two or more met names the case uses only those; with one, it is
    -- mixed into the invented list; with none, nothing changes. The draws
    -- happen in the same two places whatever the pool, so the sequence after
    -- them cannot shift.
    local met={}
    if type(cast)=="table" then for _,n in ipairs(cast) do met[#met+1]=n end end
    local names
    if #met>=2 then
        names=met
    else
        names={}
        for _,n in ipairs(met) do names[#names+1]=n end
        for _,n in ipairs(invented) do
            local dup=false
            for _,m in ipairs(met) do if m==n then dup=true end end
            if not dup then names[#names+1]=n end
        end
    end
    local first=random(#names); local second=(first+random(#names-1)-1)%#names+1
    -- A returning person takes the first person's place, after the draw. If the
    -- draw had already given that name to the second person, the second person
    -- moves on to the next name in the pool.
    local sender,recipient=names[first],names[second]
    if steer and steer.person then
        sender=steer.person
        local step=0
        while recipient==sender and step<#names do step=step+1; recipient=names[(second-1+step)%#names+1] end
    end
    if follows and follows.person then
        recipient=follows.person
        local step=0
        while sender==recipient and step<#names do step=step+1; sender=names[(first-1+step)%#names+1] end
    end
    local prefix="generated:"..seed..":"
    local a,b=sites[1],sites[2]
    -- The company's actual activity is part of the event, not a replaceable
    -- letterhead. The continuation preserves its original company's identity.
    local organisation=scenario.organisation
    if follows and follows.organisation~=organisation then return nil,"continuation company mismatch" end
    local code=REFERENCE[random(#REFERENCE)].."-"..(100+random(899))
    local cal=G.calendar(random)
    if follows and follows.afterDate then
        -- The follow-up reconstructs the source file's closing-day paperwork,
        -- not a newly dated event drawn independently of the original run.
        cal={claimDate=follows.afterDate,responseDate=follows.afterDate,reviewDate=follows.afterDate}
    end
    local facts={sender=sender,recipient=recipient,organisation=organisation,code=code,
        claimDate=cal.claimDate,responseDate=cal.responseDate,reviewDate=cal.reviewDate,
        premise=premise.id}
    local map=G.dateFields(cal)
    map.CODE=code; map.ORG=organisation; map.P1=facts.sender; map.P2=facts.recipient
    map.A=a.name; map.B=b.name
    -- The survivor's own name. Only the opening uses it; an ordinary premise
    -- never mentions {SELF}, so the key is harmless when absent and a missing
    -- one could not silently blank a document.
    map.SELF=(opening and opening.self) or (follows and follows.survivor) or nil
    -- Inherited from the finished case's thread: the point its register routed
    -- to, and its own reference. Both appear in the follow-up's documents, so
    -- the connection is on the paper the player reads.
    map.FROMPOINT=follows and follows.point or nil
    map.FROMREF=follows and follows.reference or nil
    local function wasMet(name) for _,m in ipairs(met) do if m==name then return true end end return false end
    -- `met` marks a person whose body the player has already searched, so
    -- CasePerson does not name a SECOND zombie after someone already dead.
    -- A returning person never gets a second body (P4-R121): she is carried by
    -- the evidence only, exactly as someone already met is.
    local people={{id=prefix.."person-1",name=facts.sender,met=(wasMet(facts.sender) or (steer~=nil and steer.person==facts.sender)) or nil},
                  {id=prefix.."person-2",name=facts.recipient,met=wasMet(facts.recipient) or nil}}
    local org={id=prefix.."organisation",name=facts.organisation}
    facts.subject=fill(scenario.question,map)
    facts.unknown=scenario.unresolved and fill(scenario.unresolved,map) or nil
    -- WHICH CENTRAL CONSPIRACY THIS SAVE IS RUNNING. Drawn from the seed, so a
    -- campaign is stable across reloads and rebuilds and is not the same for
    -- every player. Nothing announces it: it reaches the player only as the
    -- axis line each finding carries.
    local pair,pairWhy
    if scenario.requiresPair~=nil then
        pair,pairWhy=ConspiracyPair.byId(scenario.requiresPair)
        if not pair then return nil,"scenario pins an unknown central pair: "..tostring(pairWhy) end
    else
        pair,pairWhy=ConspiracyPair.select(seed)
    end
    if not pair then return nil,"no central conspiracy pair for this seed" end
    local authored,why=Story.build(scenario,function(value) return fill(value,map) end,
        prefix,a,b,people,org,random,steer,pair)
    if not authored then return nil,why end
    if authored.thread then
        authored.thread.reference=code
        authored.thread.person=recipient; authored.thread.organisation=organisation
        authored.thread.survivor=map.SELF; authored.thread.afterDate=cal.reviewDate
    end
    -- A standalone historical memo is retained as its own source; it is
    -- not an essential clue or an explanation of this collection.
    if relayMemo then
        authored.documents[#authored.documents+1]={id=prefix.."document-"..(#authored.documents+1),
            kind=Memo.KIND,title=Memo.TITLE,locationId=b.id,body=Memo.body(),references={b.id},links={},leads={}}
    end
    -- A vehicle finding is late-bound: the catalogue may have been made while
    -- no car was loaded.  Recording `vehicle` as an allowed target kind does
    -- not invent a car; Session still requires a real live vehicle part before
    -- it can place the clue.  It only lets a later observation satisfy the
    -- already-authored intent.
    local savedLocations=copy(sites)
    for _,doc in ipairs(authored.documents) do
        if doc.placementIntent=="vehicle" then
            for _,site in ipairs(savedLocations) do
                if site.id==doc.locationId then
                    local present=false;for _,kind in ipairs(site.containerTypes) do if kind=="vehicle" then present=true end end
                    if not present then site.containerTypes[#site.containerTypes+1]="vehicle";table.sort(site.containerTypes) end
                end
            end
        end
    end
    return {schemaVersion=G.SCHEMA,generatorRevision=G.REVISION,catalogRevision=revision,seed=seed,
        caseId=prefix.."case",outline=outline,premiseId=premise.id,contentStatus="development-draft-unapproved",
        locations=savedLocations,cast=#met>0 and copy(met) or nil,facts=facts,identities=people,
        organisation=org,documents=authored.documents,story=authored.story,
        conspiracyPair=ConspiracyPair.saved(pair),
        relayMemo=relayMemo and true or nil,steer=steer and copy(steer) or nil,
        -- Preserve the legacy boolean representation when validating an old
        -- save; new cases pin the selected premise by id.
        opening=opening and {premise=opening.premise==true and true or premise.id,self=opening.self,
            profession=premise.profession,variant=premise.profession and variant or nil} or nil,
        essential=authored.essential,thread=authored.thread,follows=follows and copy(follows) or nil}
end
-- What the player has met, reduced to what a case may safely carry: plain
-- two-word-or-more names, printable, bounded, deduplicated and ORDERED, since
-- the order changes which name a seed draws.
local CAST_MAX=8
function G.castFrom(names)
    if type(names)~="table" then return nil end
    local out,seen={},{}
    for _,n in ipairs(names) do
        if type(n)=="string" and #n>=3 and #n<=60 and not n:find("[%c]")
            and n:find("%S+%s+%S+") and not seen[n] then
            seen[n]=true; out[#out+1]=n
        end
    end
    table.sort(out)
    while #out>CAST_MAX do table.remove(out) end
    if #out==0 then return nil end
    return out
end
-- The survivor's answers about an earlier case, reduced to what a case may
-- carry (P4-R113, P4-R121): the case they came from, the reading leaned on
-- ("one" ordinary, "two" the other; "can't tell" is simply no reading), the
-- way of investigating, and at most one returning name. Anything else is
-- refused, so a hand-edited save cannot steer a case the generator would not.
G.STEER_READINGS={one=true,two=true}
G.STEER_WAYS={person=true,records=true,listen=true}
G.STEER_ORG_MAX=60
local STEER_FIELDS={fromCase=true,reading=true,way=true,person=true,organisation=true}
function G.steerFrom(s)
    if type(s)~="table" then return nil,"invalid steer" end
    for k in pairs(s) do if not STEER_FIELDS[k] then return nil,"unknown steer field" end end
    -- A case id is "generated:<seed>:case", about 25 characters; 80 is the cap.
    if type(s.fromCase)~="string" or s.fromCase=="" or #s.fromCase>80 or s.fromCase:find("%c") then return nil,"steer needs the case it came from" end
    if s.reading~=nil and not G.STEER_READINGS[s.reading] then return nil,"invalid steer reading" end
    if s.way~=nil and not G.STEER_WAYS[s.way] then return nil,"invalid steer way" end
    if s.person~=nil and s.organisation~=nil then return nil,"at most one returning name" end
    if s.person~=nil then
        local cast=G.castFrom({s.person})
        if not cast or cast[1]~=s.person then return nil,"invalid returning person" end
    end
    -- An organisation's name is repeated through a case's documents, so its length
    -- is a save-budget cost. The longest the generator writes is 43 characters;
    -- a longer returning name is simply not carried over (SuccessiveCases.
    -- pendingSteer keeps the rest of the answers).
    if s.organisation~=nil and (type(s.organisation)~="string" or s.organisation=="" or #s.organisation>G.STEER_ORG_MAX
        or s.organisation:find("%c")) then return nil,"invalid returning organisation" end
    if s.reading==nil and s.way==nil and s.person==nil and s.organisation==nil then return nil,"nothing to steer" end
    return {fromCase=s.fromCase,reading=s.reading,way=s.way,person=s.person,organisation=s.organisation}
end
-- Number of actual containers a generated case needs at each selected site.
-- Session.createDistributed remains the final authority on target uniqueness.
function G.requiredContainers(case)
    local valid,why=G.validate(case); if not valid then return nil,why end
    local counts={}
    for _,doc in ipairs(case.documents) do counts[doc.locationId]=(counts[doc.locationId] or 0)+1 end
    return counts
end
function G.generate(catalog,seed,options)
    if not seedOK(seed) then return nil,"seed must be an integer from 1 through 2147483646" end
    options=options or {}
    if type(options)~="table" then return nil,"invalid generator options" end
    for key in pairs(options) do if key~="mapId" and key~="buildLine" and key~="allowSynthetic" and key~="names" and key~="relayMemo" and key~="steer" and key~="opening" and key~="self" and key~="profession" and key~="follows" then return nil,"unknown generator option" end end
    -- THE PERSONAL OPENING (DR-20260919-BUILD-PAIR). `opening` asks for the
    -- opening premise by name instead of drawing one from the seed; `self` is
    -- the survivor's own name, which the caller reads from the engine because
    -- this file has no engine access and must not acquire any.
    if options.opening~=nil and type(options.opening)~="boolean" then return nil,"invalid opening option" end
    if options.self~=nil then
        if type(options.self)~="string" or #options.self==0 or #options.self>60 then return nil,"invalid survivor name" end
    end
    if options.profession~=nil and options.profession~="fitnessinstructor" then return nil,"invalid opening profession" end
    if options.profession and not options.opening then return nil,"profession only applies to an opening" end
    -- An opening without a name would render "{SELF}" into the slip, and the
    -- slip is the case's only personal anchor - the one finding with no
    -- alternative. Refused outright rather than shipped blank.
    -- THE CONNECTED FOLLOW-UP (Phase C). `follows` is a thread a finished case
    -- left: the document the survivor actually recorded, that case's own
    -- reference, the point its register routed to, and the question it ended
    -- without settling. A sourced finding, not a repeated name
    -- (DR-20260919-CONTINUITY) - and it is what makes the follow-up the same
    -- paperwork rather than a coincidence.
    --
    -- No thread, no follow-up. Link D has no alternative on purpose: a follow-up
    -- that can stand alone proves nothing about continuity
    -- (OPENING_PAIR_COMPLETION.md), so this refuses rather than substituting.
    local follows
    if options.follows~=nil then
        if not Story.validThread(options.follows,true) then return nil,"invalid follows" end
        for key in pairs(options.follows) do
            if key~="fromCase" and key~="document" and key~="reference"
                and key~="point" and key~="question" and key~="person" and key~="organisation"
                and key~="survivor" and key~="afterDate" then return nil,"unknown follows field" end
        end
        for _,key in ipairs({"fromCase","document","reference","point","question"}) do
            local v=options.follows[key]
            if type(v)~="string" or #v==0 or #v>120 or v:find("%c") then return nil,"invalid follows "..key end
        end
        follows=copy(options.follows)
    end
    if options.opening and follows then return nil,"an opening cannot also be a follow-up" end
    if options.opening and not options.self then return nil,"the opening needs the survivor's name" end
    if type(options.mapId)~="string" or type(options.buildLine)~="string" then return nil,"map and build are required" end
    if options.relayMemo~=nil and type(options.relayMemo)~="boolean" then return nil,"invalid relay memo option" end
    local steer
    if options.steer~=nil then local bad; steer,bad=G.steerFrom(options.steer); if not steer then return nil,bad end end
    local eligible,why=Catalog.eligible(catalog,options.mapId,options.buildLine,options.allowSynthetic)
    if not eligible then return nil,why end
    local pairs={}
    for i=1,#eligible do for j=i+1,#eligible do
        if Catalog.distinct(eligible[i],eligible[j]) then pairs[#pairs+1]={eligible[i],eligible[j]} end
    end end
    if #pairs==0 then return nil,"no compatible distinct location pair; no case generated" end
    local random=rng((seed+4099)%2147483646+1)
    local selected=pairs[random(#pairs)]
    if random(2)==1 then selected={selected[2],selected[1]} end
    local result,buildWhy=build(seed,catalog.revision,selected,G.castFrom(options.names),options.relayMemo==true,steer,
        options.opening and {premise="auto",self=options.self,profession=options.profession} or nil,follows)
    if not result then return nil,buildWhy end
    local valid,err=G.validate(result); if not valid then return nil,err end
    return copy(result)
end
-- Offline flow helper: preserves caller-selected introductory ordering without seed retries.
function G.generateSelected(catalog,seed,options,orderedSiteIds)
    local safe=V.validateStructure({options=options,orderedSiteIds=orderedSiteIds})
    if not safe or type(options)~="table" or type(orderedSiteIds)~="table" then return nil,"invalid selected-generation input" end
    for key in pairs(options) do
        if key~="mapId" and key~="buildLine" and key~="allowSynthetic" and key~="names" and key~="relayMemo"
            and key~="steer" and key~="opening" and key~="self" and key~="profession" and key~="follows" then return nil,"unknown generator option" end
    end
    -- THE SAME TWO OPTIONS AS G.generate, validated the same way. This path is
    -- the one the FIRST case of a save actually takes (firstCase ->
    -- generateSelected), so without them here the opening would have been
    -- refused with "unknown generator option" - the premise built, tested and
    -- unreachable in play.
    if options.opening~=nil and type(options.opening)~="boolean" then return nil,"invalid opening option" end
    if options.self~=nil then
        if type(options.self)~="string" or #options.self==0 or #options.self>60 then return nil,"invalid survivor name" end
    end
    if options.profession~=nil and options.profession~="fitnessinstructor" then return nil,"invalid opening profession" end
    if options.profession and not options.opening then return nil,"profession only applies to an opening" end
    if options.opening and not options.self then return nil,"the opening needs the survivor's name" end
    local follows
    if options.follows~=nil then
        if not Story.validThread(options.follows,true) then return nil,"invalid follows" end
        follows=copy(options.follows)
    end
    if options.opening and follows then return nil,"an opening cannot also be a follow-up" end
    local steer
    if options.steer~=nil then local bad; steer,bad=G.steerFrom(options.steer); if not steer then return nil,bad end end
    for key in pairs(orderedSiteIds) do if key~=1 and key~=2 then return nil,"exactly two ordered site IDs required" end end
    for i=1,2 do if type(orderedSiteIds[i])~="string" or #orderedSiteIds[i]==0 or #orderedSiteIds[i]>300 then return nil,"invalid ordered site ID" end end
    if orderedSiteIds[1]==orderedSiteIds[2] then return nil,"two distinct site IDs required" end
    if not seedOK(seed) or type(options.mapId)~="string" or type(options.buildLine)~="string"
        or (options.allowSynthetic~=nil and type(options.allowSynthetic)~="boolean")
        or (options.relayMemo~=nil and type(options.relayMemo)~="boolean") then return nil,"invalid selected-generation input" end
    local eligible,why=Catalog.eligible(catalog,options.mapId,options.buildLine,options.allowSynthetic); if not eligible then return nil,why end
    local byId={}; for _,site in ipairs(eligible) do byId[site.id]=site end
    local a,b=byId[orderedSiteIds[1]],byId[orderedSiteIds[2]]
    if not a or not b or not Catalog.distinct(a,b) then return nil,"selected sites are not eligible and distinct" end
    local result,buildWhy=build(seed,catalog.revision,{a,b},G.castFrom(options.names),options.relayMemo==true,steer,
        options.opening and {premise="auto",self=options.self,profession=options.profession} or nil,follows)
    if not result then return nil,buildWhy end
    local valid,err=G.validate(result); if not valid then return nil,err end
    return copy(result)
end
-- Gameplay-facing creation entry point. Legacy generate remains an offline fixture API.
-- Caller supplies the generation anchor; restoration does not reapply this filter.
function G.generateNew(catalog,seed,options,context)
    local Reach=require("ConspiracyFiles/Reach")
    if type(context)~="table" or not Reach.validAnchor(context.anchor) then return nil,"generation anchor required" end
    local radius,why=Reach.radius(context.hoursSurvived)
    if not radius then return nil,why end
    -- One step wider, on purpose (P4-R133, the ladder's second rung). Only ever
    -- WIDER than the survival policy allows and never beyond the scan's own
    -- limit: a caller may lower the generator's standard, never its reach.
    if context.radius~=nil then
        local wider=context.radius
        if type(wider)~="number" or wider~=wider or wider<radius or wider>5000 then return nil,"invalid widened reach" end
        radius=wider
    end
    local valid,err=Catalog.validate(catalog)
    if not valid then return nil,err end
    local filtered={revision=catalog.revision,locations={}}
    for _,site in ipairs(catalog.locations) do
        if Reach.contains(site.bounds,context.anchor,radius) then filtered.locations[#filtered.locations+1]=site end
    end
    return G.generate(filtered,seed,options)
end
function G.validate(case)
    local safe,why=V.validateStructure(case); if not safe then return false,why end
    if type(case)~="table" or case.schemaVersion~=G.SCHEMA or case.generatorRevision~=G.REVISION then return false,"unsupported generated case revision" end
    if not ConspiracyPair.validate(case.conspiracyPair) then return false,"invalid central conspiracy pair" end
    if not seedOK(case.seed) or V.estimateEncodedBytes(case)>500000 then return false,"invalid seed/size" end
    local valid,err=Catalog.validate({revision=case.catalogRevision,locations=case.locations})
    if not valid then return false,err end
    if #case.locations~=2 then return false,"expected two locations" end
    if case.relayMemo~=nil and case.relayMemo~=true then return false,"invalid relay memo flag" end
    if case.follows~=nil then
        local f=case.follows
        if not Story.validThread(f,true) then return false,"invalid follows" end
        for key in pairs(f) do
            if key~="fromCase" and key~="document" and key~="reference"
                and key~="point" and key~="question" and key~="person" and key~="organisation"
                and key~="survivor" and key~="afterDate" then return false,"unknown follows field" end
        end
        for _,key in ipairs({"fromCase","document","reference","point","question"}) do
            if type(f[key])~="string" or #f[key]==0 or #f[key]>120 then return false,"invalid follows "..key end
        end
        if f.fromCase==case.caseId then return false,"a case cannot follow itself" end
    end
    if case.thread~=nil then
        local t=case.thread
        if not Story.validThread(t,false) then return false,"invalid thread" end
        for key in pairs(t) do
            if key~="document" and key~="reference" and key~="point" and key~="question"
                and key~="person" and key~="organisation" and key~="survivor" and key~="afterDate" then
                return false,"unknown thread field"
            end
        end
        local byId={}
        for _,d in ipairs(case.documents) do byId[d.id]=true end
        if type(t.document)~="string" or not byId[t.document] then
            return false,"thread names a document the case does not have"
        end
        if t.reference~=case.facts.code then return false,"thread reference is not the case's own" end
        for _,key in ipairs({"point","question"}) do
            if type(t[key])~="string" or #t[key]==0 or #t[key]>120 then return false,"invalid thread "..key end
        end
    end
    if case.essential~=nil then
        if type(case.essential)~="table" or #case.essential==0 then return false,"invalid essential list" end
        local byId={}
        for _,d in ipairs(case.documents) do byId[d.id]=true end
        local seenEssential={}
        for _,id in ipairs(case.essential) do
            if type(id)~="string" or not byId[id] then return false,"essential names a document the case does not have" end
            if seenEssential[id] then return false,"duplicate essential document" end
            seenEssential[id]=true
        end
    end
    if case.opening~=nil then
        if type(case.opening)~="table" then return false,"invalid opening flag" end
        local openingPremise=case.opening.premise
        if openingPremise~=true and (type(openingPremise)~="string" or not Premises.opening(openingPremise)) then
            return false,"invalid opening premise"
        end
        if type(case.opening.self)~="string" or #case.opening.self==0 or #case.opening.self>60 then
            return false,"invalid opening survivor name"
        end
        if case.opening.profession~=nil or case.opening.variant~=nil then
            if case.opening.profession~="fitnessinstructor"
                or case.opening.premise~="fitness-instructor-start"
                or type(case.opening.variant)~="number" or case.opening.variant~=math.floor(case.opening.variant)
                or case.opening.variant<1 or case.opening.variant>10 then
                return false,"invalid profession opening"
            end
        end
    end
    -- The relay memo takes no story role, so it is not counted against the
    -- role bounds; the rebuild below still proves it is exactly the one clue.
    if type(case.story)~="table" then return false,"missing authored event" end
    local roleCount=#case.documents-(case.relayMemo and 1 or 0)
    if roleCount<G.MIN_EVIDENCE or roleCount>G.MAX_EVIDENCE then return false,"invalid evidence role count" end
    local a,b=case.locations[1],case.locations[2]
    if not Catalog.distinct(a,b) or a.mapId~=b.mapId or a.buildLine~=b.buildLine then return false,"incompatible saved locations" end
    for _,site in ipairs(case.locations) do
        if site.excluded or (site.paperStorage~="observed" and site.paperStorage~="indexed") then
            return false,"ineligible saved location"
        end
    end
    -- Revision-pinned reconstruction verifies every fact, text and reference.
    -- It uses saved sites, never today's external catalog. Future revisions
    -- must retain a reader or refuse; they may not silently rewrite evidence.
    -- The cast is validated as strictly as any other field: it must already be
    -- in the form castFrom produces, or a hand-edited save could smuggle a name
    -- in that the generator itself would never have accepted.
    if case.cast~=nil then
        local canonical=G.castFrom(case.cast)
        if not canonical or not same(canonical,case.cast) then return false,"invalid case cast" end
    end
    -- The steer, like the cast, must already be in its canonical form.
    if case.steer~=nil then
        local canonical=G.steerFrom(case.steer)
        if not canonical or not same(canonical,case.steer) then return false,"invalid case steer" end
    end
    if not same(case,build(case.seed,case.catalogRevision,case.locations,case.cast,case.relayMemo,case.steer,case.opening,case.follows)) then return false,"case facts, text or structure do not match recorded revision" end
    return true
end
function G.restore(saved)
    local valid,why=G.validate(saved); if not valid then return nil,why end
    return copy(saved)
end
function G.project(case,discovered)
    local valid,why=G.validate(case); if not valid then return nil,why end
    local safe=V.validateStructure(discovered); if not safe or type(discovered)~="table" then return nil,"invalid discovery list" end
    local byId={}; for _,doc in ipairs(case.documents) do byId[doc.id]=doc end
    local count=0; for k in pairs(discovered) do if type(k)~="number" or k<1 or k~=math.floor(k) then return nil,"invalid discovery order" end; count=count+1 end
    if count>#case.documents then return nil,"too many discoveries" end
    local known={}
    for i=1,count do local id=discovered[i]; if not byId[id] or known[id] then return nil,"unknown/duplicate discovery" end; known[id]=true end
    local rows={}
    for i,id in ipairs(discovered) do
        local doc=byId[id]
        local body,links=Story.project(case.story,doc,known)
        -- Declared comparisons are the sole authority for connections. A title
        -- from an undiscovered source is knowledge too; don't manufacture it.
        rows[i]={id=id,kind=doc.kind,title=doc.title,body=body,locationId=doc.locationId,leads=copy(doc.leads),
            connections=links}
    end
    return rows
end
return G
