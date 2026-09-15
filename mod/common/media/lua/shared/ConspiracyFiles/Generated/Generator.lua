-- G1: offline generation and save-shaped restoration. Never loaded by the mod.
local Catalog=require("ConspiracyFiles/Generated/Catalog")
local V=require("ConspiracyFiles/Validator")
local Memo=require("ConspiracyFiles/Generated/RelayMemo")
local K=require("ConspiracyFiles/Generated/EvidenceKinds")
local Roles=require("ConspiracyFiles/Generated/EvidenceRoles")
local Premises=require("ConspiracyFiles/Generated/Premises")
local ObjectRoles=require("ConspiracyFiles/Generated/ObjectRules")
local Catalogue=require("ConspiracyFiles/Generated/ObjectCatalogue")
local Calendar=require("ConspiracyFiles/Calendar")
-- Schema two deliberately refuses the earlier fixed-seven case shape.  Before
-- 1.0 callers must use a fresh save rather than reinterpret an existing case.
-- MIN_EVIDENCE is two, not three: a claim and a record contradicting it is a
-- whole case. See the review note in build().
-- g13: case dates drawn across May-July 1993 and the story defects fixed
-- (owner decisions P4-R107, P4-R108, 2026-09-15). Every g12 case is refused;
-- that is a new game (P4-R77).
local G={REVISION="g13-true-stories-1",SCHEMA=2,MIN_EVIDENCE=2,MAX_EVIDENCE=7}
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
local FIELDS={"CODE","ORG","P1","P2","A","B","DATE0","DATE1","DATE2","DATE3","DATE1CAPS","DATE2CAPS",
    "DAYS12","PRIORMONTH","SINCE11","SUBJECT","UNKNOWN"}
local function fill(text,map)
    for _,key in ipairs(FIELDS) do text=subst(text,key,map[key]) end
    return text
end
-- A case reference exists so that three pieces of paper look like one file,
-- which is how paperwork works. It is drawn independently of the premise: the
-- links between documents already carry the connection and the notebook sorts
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
-- Naive plural, and deliberately so: these labels come from catalogue ids, so
-- "clay pot" and "credit card" are the shape of nearly all of them. A word
-- already ending in s, x, ch or sh is left alone rather than guessed at, which
-- is wrong less often than "boxs" is.
local function plural(label)
    local tail=string.sub(label,-1)
    local two=string.sub(label,-2)
    if tail=="s" or tail=="x" or two=="ch" or two=="sh" then return label end
    return label.."s"
end
-- "A idcard" is the kind of thing a player notices and we do not. The rule is
-- the sound of the first letter, which is right far more often than it is
-- wrong for the words a catalogue id produces.
local function article(label)
    local first=string.lower(string.sub(label,1,1))
    if first=="a" or first=="e" or first=="i" or first=="o" or first=="u" then return "an" end
    return "a"
end
-- THE CASE CALENDAR (P4-R108, owner 2026-09-15). Every case used to be dated
-- July 2-6 1993, so every paper sat inside the relay memo's nine days (30 June
-- - 8 July) and the memo's DATE NOTE was true of everything, which is a note
-- saying nothing. Now the claim falls between 1 May and 28 June, the response
-- and the review follow it by one to nine days each, and nothing is dated after
-- 8 July (the outbreak begins after). Two cases in five have their response
-- and review inside the memo's week, which leaves about a third of all cases
-- with a dated paper there once optional papers and undated responses are
-- counted (measured over 400 seeds, test/premise_consistency.lua); the rest
-- end by 29 June, so a note on a paper is a signal again. Drawn from the seed alone - never the world clock - or a
-- case could not rebuild byte for byte (Generator.validate).
--
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
-- One anchor document, rendered. Every anchor is assembled in the same three
-- parts, because Generated/DocumentPages.lua reads them: the physical
-- description is dropped from the readable pages, the document's own words
-- become the pages, and everything from WHAT IT MIGHT MEAN stays in the
-- notebook. A premise that reordered these would put an interpretation on a
-- page the survivor is supposed to have found already written.
--
-- Exposed so test/premise_consistency.lua renders every premise both ways
-- through the same assembly build() uses.
function G.renderAnchor(doc,useBranch,agreeing,map)
    local text=doc.text
    local meaning=doc.meaning
    if useBranch then
        text=text.."\n"..(agreeing and doc.agree or doc.dispute)
        -- A response or review written for the version where the records
        -- conflict would, reused where they agree, put a suspicion on the page
        -- the paperwork does not support. Every response now carries its own
        -- meaningAgree (P4-R107, 2026-09-15).
        if agreeing and doc.meaningAgree then meaning=doc.meaningAgree end
    end
    return fill("WHAT YOU FOUND\n"..doc.found.."\n\n"..text.."\n\nWHAT IT MIGHT MEAN\n"..meaning,map)
end
local function build(seed,revision,sites,cast,relayMemo)
    local random=rng(seed)
    -- The premise is drawn first, so it is the seed's most significant choice:
    -- what the case is ABOUT, before who is in it or how it resolves. See
    -- ConspiracyFiles/Generated/Premises.lua and docs/design/PREMISES.md.
    local premise=Premises.choose(random)
    local outline=random(2)==1 and "corroboration" or "conflicting-account"
    -- Full names, not initials. Owner, 2026-09-10: a nearby body is going to
    -- be given this name and an ID to match, and "M. Ellis" on a corpse is not
    -- something a player can connect to a letter signed "M. Ellis" - it is the
    -- same abbreviation twice. A full name is a person.
    local invented={"Marion Ellis","Delia Mercer","Roy Hale","Joanne Voss",
                    "Curtis Vance","Adele Prosser","Warren Nagy","Ines Kubiak"}
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
    local prefix="generated:"..seed..":"
    local a,b=sites[1],sites[2]
    -- An organisation may name one of the two sites ("{A} Site Office"), so it
    -- is resolved before it becomes {ORG} for everything else.
    local organisation=subst(subst(premise.orgs[random(#premise.orgs)],"A",a.name),"B",b.name)
    local code=REFERENCE[random(#REFERENCE)].."-"..(100+random(899))
    local cal=G.calendar(random)
    local facts={sender=names[first],recipient=names[second],organisation=organisation,code=code,
        claimDate=cal.claimDate,responseDate=cal.responseDate,reviewDate=cal.reviewDate,
        premise=premise.id,subject=premise.subject,unknown=premise.unknown}
    local map=G.dateFields(cal)
    map.CODE=code; map.ORG=organisation; map.P1=facts.sender; map.P2=facts.recipient
    map.A=a.name; map.B=b.name; map.SUBJECT=premise.subject; map.UNKNOWN=premise.unknown
    local function wasMet(name) for _,m in ipairs(met) do if m==name then return true end end return false end
    -- `met` marks a person whose body the player has already searched, so
    -- CasePerson does not name a SECOND zombie after someone already dead.
    local people={{id=prefix.."person-1",name=facts.sender,met=wasMet(facts.sender) or nil},
                  {id=prefix.."person-2",name=facts.recipient,met=wasMet(facts.recipient) or nil}}
    local org={id=prefix.."organisation",name=facts.organisation}
    local documents={}
    local function document(n,title,location,body,refs,links,leads,kind)
        documents[n]={id=prefix.."document-"..n,kind=kind or "dispatch",title=title,locationId=location.id,body=body,
            references=refs,links=links or {},leads=leads or {}}
    end
    -- Anchors are assembled by G.renderAnchor, above.
    local agreeing=outline=="corroboration"
    local function anchor(doc,useBranch) return G.renderAnchor(doc,useBranch,agreeing,map) end
    -- 1. The claim: a record that asserts something, found at the first site,
    --    and the only document that leads anywhere - to the second site.
    document(1,fill(premise.claim.title,map),a,anchor(premise.claim,false),
        {people[1].id,people[2].id,org.id,a.id,b.id},{},{b.id},premise.claim.kind)
    -- 2. The response: a second record that either agrees with the claim or
    --    contradicts it. This is the case's outline, made physical.
    document(2,fill(premise.response.title,map),b,anchor(premise.response,true),
        {people[1].id,people[2].id,a.id,b.id},
        {{target=documents[1].id,kind=agreeing and "corroborates" or "disputes-delivery"}},nil,premise.response.kind)
    -- 3. The review: somebody inside the organisation looking at the pair and
    --    writing down what they are going to do about it, which is usually
    --    less than the reader would like.
    --
    -- Not always present. Owner, 2026-09-10, on whether cases are still built
    -- to a set shape: for thirteen of the twenty premises the claim and the
    -- response already hold the whole disagreement, and the review is worth
    -- having without being load-bearing. Those cases may end on the
    -- contradiction itself, which is a different kind of case to read - it
    -- stops where the paperwork stops, with nobody having reacted at all.
    --
    -- The draw happens here, in a fixed place in the sequence, whether or not
    -- it can be used: a case must rebuild identically from its seed, and a
    -- conditional draw would shift every choice after it.
    local reviewRoll=random(2)
    local mandatory=3
    if premise.reviewOptional and reviewRoll==1 then
        mandatory=2
    else
        document(3,fill(premise.review.title,map),b,anchor(premise.review,true),
            {org.id,b.id},{{target=documents[2].id,kind="recontextualises"}},nil,premise.review.kind)
    end
    -- Optional roles pick their carrier through EvidenceRoles instead of a
    -- literal kind string. `key`/`diary`/`notebook`/`clipping` each still
    -- resolve to their one prose-capable carrier (a role's carrier list of
    -- one is a genuine, if narrow, selection -- not a hardcoded string in
    -- Generator itself); `affiliationLead`/`itineraryLead` genuinely choose
    -- between two card/ticket carriers whose short capacity fits a named
    -- identifier, which is what makes idcard/creditcard/businesscard/ticket
    -- reachable at all. See docs/design/EVIDENCE_ROLE_SCHEMA.md.
    --
    -- Their prose stays premise-independent by talking about {SUBJECT} - the
    -- premise's own noun for the matter - and {UNKNOWN}, the thing the
    -- paperwork cannot settle.
    --
    -- Where an object sits BESIDE a file, it names the file by its reference
    -- rather than by the subject. Owner, 2026-09-10, reading "with the file on
    -- the extension among it" while looking at ten clay pots: "what is this
    -- file on the extension that is mentioned here?" The subject nouns are
    -- written for the premise's own documents and go opaque when quoted next to
    -- something unrelated; a record number is a thing the player can go and
    -- match. A diary kept by someone under pressure reads
    -- the same whether the pressure was about a sealed case or a night shift;
    -- writing twenty diaries would have bought nothing but twenty chances to
    -- contradict the premise they sit inside.
    local function carrierFor(roleId,body)
        local kind=assert(Roles.choose(random,roleId))
        assert(Roles.fits(roleId,kind,body))
        return kind
    end
    -- "The initials {P1}" printed a full name after the word initials (P4-R107,
    -- 2026-09-15); the tag now says what it carries.
    local accessBody=fill("WHAT YOU FOUND\nA small worn key on a wire loop, with a card tag tied through its bow. The tag carries {CODE} and a name, {P1}. There is no address or lock number. The metal is polished around the grip but dull between the teeth.\n\nON THE TAG\n'Return separately. Do not leave with the driver.' On the reverse, in smaller writing: 'Ask before making another copy.' A crossed-out word is too smeared to read reliably.\n\nWHAT IT MIGHT MEAN\nThe matching reference links this key to the paperwork about {SUBJECT}, but does not identify what it opens. It could belong to an ordinary cupboard, equipment box or unrelated office lock. Keeping it separate suggests someone controlled access; it is not proof that this key secured anything in the file. You have no confirmed matching lock.",map)
    document(4,fill("Tagged key / {CODE}",map),a,accessBody,
        {people[1].id,a.id},{{target=documents[1].id,kind="recontextualises"}},nil,carrierFor("access",accessBody))
    local diaryBody=fill("WHAT YOU FOUND\nA small diary with a soft cover and a broken elastic band. Most entries concern shopping, shifts and missed sleep. One page has been folded down beside a reference you recognise: {CODE}.\n\n{DATE2CAPS}\n'{P1} called again. Wanted to know whether I had signed. I asked why the signature mattered more than the answer. There was a long silence, then something about everyone being tired and the office needing to close the file. I told them my copy would say only what I could stand behind.'\n\n'Perhaps I made too much of it. People have been short with each other all week. Still, I kept the carbon instead of putting it with the rubbish.'\n\nWHAT IT MIGHT MEAN\nThis is a private account of pressure to sign, not an independent record of the call. It adds a human reason for the careful wording, while leaving room for exhaustion, misunderstanding or deliberate pressure. Nothing here establishes {UNKNOWN}.",map)
    document(5,fill("Private diary / {CODE}",map),b,diaryBody,
        {people[1].id,people[2].id,b.id},{{target=documents[2].id,kind="recontextualises"}},nil,carrierFor("diaryContext",diaryBody))
    local notebookBody=fill("WHAT YOU FOUND\nA ruled pocket notebook with oil-darkened page edges. Routine meter readings share space with tea orders and a sketch of a loading bay. A short entry uses the same reference, {CODE}.\n\n{DATE1CAPS}\n'Asked about {SUBJECT}. No normal stores entry. Office supplied the reference and said the description would follow. Asked twice. Leave space below.'\n\nThe next three ruled lines are empty. Beneath them: 'If anyone asks, send them to {ORG}. I can account for the time on this page, not for anything that was settled before my shift.' No name identifies the writer.\n\nWHAT IT MIGHT MEAN\nThe writer separated what they witnessed from what they were told. The blank lines could be a forgotten update or a deliberately avoided description. This supports asking how the matter was recorded; it cannot establish {UNKNOWN}.",map)
    document(6,fill("Shift notebook / {CODE}",map),a,notebookBody,
        {org.id,a.id},{{target=documents[1].id,kind="recontextualises"}},nil,carrierFor("notebookContext",notebookBody))
    local clippingBody=fill("WHAT YOU FOUND\nA newspaper folded around a narrow cut-out from its local news column. Someone has underlined the words 'routine maintenance' and pencilled {CODE} in the margin. The article itself does not use that reference.\n\nLOCAL SERVICES NOTICE - {DATE1CAPS}\nResidents were advised that service vehicles might visit local facilities outside ordinary hours while scheduled maintenance was completed. A spokesperson described the work as routine and asked that access routes be kept clear. The notice supplied no list of deliveries and no explanation of what equipment would be moved.\n\nWHAT IT MIGHT MEAN\nSomeone associated this public notice with the private reference, but the pencil annotation is their interpretation. Routine maintenance could explain unusual hours around {SUBJECT}. It could also offer a convenient explanation for unrelated activity. The clipping cannot tell you which, and its unnamed annotator may have been guessing too.",map)
    document(7,fill("Press clipping / {CODE}",map),b,clippingBody,
        {b.id},{{target=documents[1].id,kind="recontextualises"}},nil,carrierFor("clippingContext",clippingBody))
    -- The extra documents name the case's own matter as well as its number.
    -- Owner, 2026-09-11, holding four documents of one case: "I cant figure out
    -- why they are all part of one case". They were written to fit any of the
    -- twenty stories, so the only thread was the reference number - which he
    -- had asked to be less prominent. Naming {SUBJECT} ("the inventory", "the
    -- night shift") makes each point at the same THING, not just the same
    -- filing code.
    --
    -- Two short-text roles genuinely choose between the four card/ticket
    -- carriers added 2026-09-06 (EvidenceKinds). Their bodies are a named
    -- identifier and a line or two of context -- never the "WHAT YOU FOUND"
    -- essay above -- because a card cannot hold that (T7).
    local affiliationBody=fill("Ref {CODE} - {SUBJECT}\n{P1}\n{ORG}",map)
    local affiliationKind=carrierFor("affiliationLead",affiliationBody)
    -- A card is named the way the game names its own: "Credit Card: Genevieve
    -- Ricks", not "Credit Card / PS-289". Owner, 2026-09-11, holding one of
    -- ours: "we did not add a name to it. would have been cool". A reference
    -- number is a filing label; a name on a card is a person.
    document(8,K.get(affiliationKind).short..": "..facts.sender,a,affiliationBody,
        {people[1].id,org.id,a.id},{{target=documents[1].id,kind="recontextualises"}},nil,affiliationKind)
    local itineraryBody=fill("Ref {CODE} - {SUBJECT}\n{P2} - {B}\n{DATE2}",map)
    local itineraryKind=carrierFor("itineraryLead",itineraryBody)
    document(9,K.get(itineraryKind).short..": "..facts.recipient,b,itineraryBody,
        {people[2].id,b.id},{{target=documents[2].id,kind="recontextualises"}},nil,itineraryKind)
    -- Phase 3 roles. These are the optional documents that can DISAGREE with
    -- what came before: every other one connects with "recontextualises", so
    -- without them only the mandatory response could ever contradict anything.
    --
    -- A payment dated before the record it settles. That is a fact about
    -- paperwork order, not proof of anything, and the wording keeps it that
    -- way.
    --
    -- "One day before the entry it settles" was printed whatever the entry
    -- said, and some claims carry no date at all (P4-R107, 2026-09-15). It is
    -- now said only where the claim is dated {DATE1}, and the slip is dated
    -- {DATE0}, the day before - true by construction.
    local raised=string.find(premise.claim.text,"{DATE1}",1,true)
        and "Raised {DATE0} - the day before the entry it settles." or "Raised {DATE0}."
    local paymentBody=fill("WHAT YOU FOUND\nA carbon payment slip with a smudged duplicate line, kept in a wallet fold rather than filed.\n\n{ORG}\nPayment against {SUBJECT}, record {CODE}\n"..raised.."\nAuthorised by: {P1}\nCounter-signature: none.",map)
    local paymentKind=carrierFor("paymentRecord",paymentBody)
    -- Titled by what it IS, not by the paper it is written on: a payment slip
    -- on a notepad used to be called "Review", and the owner found himself
    -- holding two reviews of which only one reviewed anything.
    document(10,"Payment slip / "..facts.code,a,paymentBody,
        {people[1].id,org.id,a.id},{{target=documents[1].id,kind="disputes-delivery"}},nil,paymentKind)
    -- A stub placing the second person elsewhere on the day of the response.
    -- It never shares a case with the duty log or the itinerary, which put
    -- the same person at the other site on the same day: see the selection
    -- below.
    local timingBody=fill("Ref {CODE} - {SUBJECT}\n{P2}\n{DATE2} - {A}",map)
    local timingKind=carrierFor("timingDispute",timingBody)
    document(11,K.get(timingKind).short..": "..facts.recipient,a,timingBody,
        {people[2].id,a.id},{{target=documents[2].id,kind="disputes-delivery"}},nil,timingKind)
    -- And one that agrees. A case where everything disagrees is as flat as one
    -- where nothing does.
    local presenceBody=fill("WHAT YOU FOUND\nA duty log with a soft cover, the current week held open by a bent paperclip.\n\n{DATE2} - {B}\n{P2} signed in at the gate and again at the store.\nNo vehicle number recorded.\nEntry against {SUBJECT}, record {CODE}, initialled twice.",map)
    local presenceKind=carrierFor("presenceNote",presenceBody)
    document(12,"Duty log / "..facts.code,b,presenceBody,
        {people[2].id,b.id},{{target=documents[2].id,kind="corroborates"}},nil,presenceKind)
    -- Object evidence (2026-09-09). These carry no readable text at all: a
    -- worn hammer stored with a case file says what it says by being there.
    -- Their carrier is not a name written here but whatever ObjectRules
    -- answers from the catalogue derived from the game's own item scripts, so
    -- these three roles reach several hundred objects between them rather than
    -- the handful a person would have listed.
    --
    -- The notebook sentence records that the thing was found with the papers
    -- and stops. It must not say what the object means, because the object is
    -- the one piece of evidence the player can interpret entirely without us.
    -- How a person's name ends up on a thing, by what kind of thing it is. A
    -- name tape is sewn into a coat, not a hammer.
    local function markOn(category)
        if category=="Clothing" or category=="Accessory" or category=="ProtectiveGear" then
            return "A name tape is sewn inside: {P1}."
        elseif category=="Tool" or category=="ToolWeapon" or category=="GardeningWeapon"
            or category=="Gardening" or category=="Weapon" or category=="SportsWeapon" then
            return "A name is scratched into the handle: {P1}."
        elseif category=="Household" or category=="Cooking" or category=="CookingWeapon"
            or category=="Container" or category=="Junk" then
            return "A strip of tape on it has a name written in pen: {P1}."
        end
        return "It is marked with a name: {P1}."
    end
    -- A single object belongs to SOMEBODY. Owner, 2026-09-11, on a worn fancy
    -- pen that meant nothing: "why is this evidence relevant? the text gives no
    -- interesting mystery", and then "if we linked it to a person, then it
    -- would be perfect. a pen could be marked with the name."
    --
    -- It was right: a random object next to paperwork is the least surprising
    -- thing in the world, and the text had to insist it mattered. Marked with
    -- the case person's name - the same person CasePerson gives a body and an
    -- ID card near the first clue - it is a thread the player can pull.
    --
    -- The mark is the one thing asserted: a name is on the object. The text
    -- says nothing about whether it was theirs, or whether they left it here.
    local function objectDocument(n,roleId,site,sentence,references,link,marked)
        local kind=assert(Roles.choose(random,roleId))
        local label=words(kind)
        local item=Catalogue.get(kind)
        if marked then sentence=sentence.." "..markOn(item and item.category) end
        local body=fill(sentence,map)
        body=subst(subst(body,"ARTICLE",article(label)),"LABEL",label)
        body=string.upper(string.sub(body,1,1))..string.sub(body,2)
        assert(Roles.fits(roleId,kind,body))
        local wear=assert(ObjectRoles.describe(assert(Roles.ruleOf(roleId)))).wear
        -- The item's own name: "Fancy pen, marked Ines Kubiak". No leading
        -- article - "A pen fancy" read oddly in an inventory list.
        local title=string.upper(string.sub(label,1,1))..string.sub(label,2)
        if marked then title=title..", marked "..facts.sender end
        document(n,title,site,body,references,{link},nil,kind)
        documents[n].wear=wear
    end
    objectDocument(13,"physicalTrace",a,
        "{ARTICLE} {LABEL}, badly worn, stored with the file marked {CODE}.",
        {people[1].id,a.id},{target=documents[1].id,kind="recontextualises"},true)
    objectDocument(14,"bearsName",b,
        "{ARTICLE} {LABEL} carrying a name, filed with the papers marked {CODE}. Nothing here says the name is the owner's, or that the owner left it.",
        {b.id},{target=documents[2].id,kind="recontextualises"})
    objectDocument(15,"outOfPlace",a,
        "{ARTICLE} {LABEL}, worn, kept with the file marked {CODE} - not the kind of thing anyone files with records.",
        {people[1].id,a.id},{target=documents[1].id,kind="recontextualises"},true)
    -- Quantity as evidence. Owner, 2026-09-09: "one of something is no misery
    -- but a house full of bleach is a mystery", and then the two shapes that
    -- makes: "100 eggs in the fridge? 50 bricks in the bedroom".
    --
    -- They are different anomalies. The eggs are in exactly the right place
    -- and there are far too many; the bricks would be unremarkable on a
    -- building site and are in a bedroom. So one document asks placement for
    -- the room the item belongs in, and the other for a room it does not.
    --
    -- Nothing is written on any of them and they are all identical, which is
    -- the point: the only fact is the count, and the count is the one thing
    -- the mod states plainly and then declines to explain.
    local function pile(n,roleId,site,sentences,link)
        local kind=assert(Roles.choose(random,roleId))
        -- The count depends on what the thing weighs and is worth, so the
        -- catalogue row is needed, not just the id.
        local item=assert(Catalogue.get(kind))
        local count=assert(ObjectRoles.quantity(random,roleId,item))
        local label=words(kind)
        -- One of several phrasings, by seed. The draw happens whether or not
        -- this document is selected, so the sequence a case rebuilds from
        -- cannot shift.
        local sentence=sentences[random(#sentences)]
        local body=fill(sentence,map)
        body=subst(subst(body,"LABELS",plural(label)),"LABEL",label)
        body=subst(body,"COUNT",numeral(count))
        body=string.upper(string.sub(body,1,1))..string.sub(body,2)
        assert(Roles.fits(roleId,kind,body))
        -- The notebook row names the pile; each physical copy is numbered by
        -- the runtime (owner, 2026-09-10: "1 of x should be counted on each
        -- item"), which needs the bare label rather than the row's wording.
        -- "six lunchboxes", not "lunchbox, six of them".
        document(n,numeral(count).." "..plural(label),site,body,{site.id},{link},nil,kind)
        documents[n].label=label
        documents[n].wear=assert(ObjectRoles.describe(roleId)).wear
        -- The count is a fact about the world, so it has to reach placement:
        -- the runtime creates exactly this many and treats any more as a
        -- conflict. The room intent has to reach it too, or the bricks end up
        -- in the garage where nobody would look twice at them.
        documents[n].quantity=count
        documents[n].roomIntent=assert(ObjectRoles.roomIntent(roleId))
        documents[n].label=label
        -- How many the PAPERWORK says there are. Fewer than are actually
        -- there, and the player does the arithmetic: the file says eight, the
        -- cupboard holds ten. Neither document states the disagreement - that
        -- is the player's to notice, which is the whole discipline here.
        --
        -- Drawn in a fixed place whether or not this document is selected, so
        -- the sequence a case rebuilds from cannot shift.
        local short=random(3)
        documents[n].onPaper=math.max(1,count-short)
    end
    -- Owner, 2026-09-10: "x of the same thing is a very repetitive way of
    -- writing it and sounds like a robot." It was one sentence per rule, so
    -- every pile in every case read identically. Four ways to say each, chosen
    -- by the case seed, and none of them counting for the player.
    pile(16,"accumulation",b,{
        "{COUNT} {LABELS}, kept where such a thing is kept. One would be ordinary. This many is not.",
        "Somebody put {COUNT} {LABELS} in here, tidily, in the place they belong. Nobody needs {COUNT}.",
        "{COUNT} {LABELS}, in the right cupboard and the wrong number.",
        "A shelf of {LABELS} - {COUNT} of them, where one or two would be unremarkable. The file marked {CODE} sits beside them.",
    })
    pile(17,"misplacedBulk",a,{
        "{COUNT} {LABELS}, in a room with no use for any of them. Somewhere else this would not be worth writing down.",
        "{COUNT} {LABELS}, stacked in a room that has nothing to do with them.",
        "Somebody carried {COUNT} {LABELS} into this room and left them. There is nothing here they belong to.",
        "{COUNT} {LABELS} where there is no reason for even one. The file marked {CODE} is among them.",
    })
    pile(18,"medicalHoard",b,{
        "{COUNT} {LABELS}, every one already used, bagged together in a room that is not for them. One household does not get through this much.",
        "Somebody kept {COUNT} used {LABELS}. Not clean ones. Used.",
        "{COUNT} {LABELS}, spent and stacked, nowhere near a bathroom. The file marked {CODE} is with them.",
        "A bag of {LABELS} - {COUNT}, every one of them already used. Nobody keeps this.",
    })
    pile(19,"vehicleBulk",a,{
        "{COUNT} {LABELS}, loaded together as cargo. Nothing records where they were going.",
        "{COUNT} {LABELS}, roped together like freight, with the file marked {CODE} among it.",
        "Somebody loaded {COUNT} {LABELS} for a journey. There is no manifest and no destination written anywhere.",
        "{COUNT} {LABELS}, packed as though they were going somewhere.",
    })
    -- The first three roles are the coherent minimum: a route lead,
    -- an independently attributable response, and a review of that response.
    -- Optional roles are shuffled and bounded, so neither their count nor their
    -- carrier checklist is fixed, while every selected fact still resolves.
    -- The pool now spans six roles/carriers (up from four) so the two new
    -- short-text roles -- and therefore all four card/ticket carriers -- are
    -- genuinely reachable, while MIN/MAX_EVIDENCE and their selection range
    -- (0..4 optional slots on top of the 3 mandatory roles) stay unchanged.
    local optional={documents[4],documents[5],documents[6],documents[7],documents[8],documents[9],
                    documents[10],documents[11],documents[12],
                    documents[13],documents[14],documents[15],documents[16],documents[17],documents[18],documents[19]}
    local optionalCapacity=G.MAX_EVIDENCE-mandatory
    local optionalCount=random(optionalCapacity+1)-1
    for i=#optional,2,-1 do local j=random(i); optional[i],optional[j]=optional[j],optional[i] end
    -- Papers that must not share a case (P4-R107, 2026-09-15). The timing
    -- stub puts the second person at the first site on the response's day;
    -- the duty log and the itinerary put them at the second site that same
    -- day. And no two papers in a case may carry one title: paid-before-ordered's
    -- own response is "Payment slip / {CODE}", the same as document 10, and
    -- two object piles can draw the same item.
    local timing,itinerary,presence=documents[11],documents[9],documents[12]
    while #documents>mandatory do documents[#documents]=nil end
    local titles,chosen={},{}
    for _,d in ipairs(documents) do titles[d.title]=true end
    for i=1,#optional do
        if #documents>=mandatory+optionalCount then break end
        local d=optional[i]
        local clash=(d==timing and (chosen[itinerary] or chosen[presence]))
            or ((d==itinerary or d==presence) and chosen[timing])
        if not titles[d.title] and not clash then
            d.id=prefix.."document-"..(#documents+1)
            documents[#documents+1]=d
            titles[d.title]=true; chosen[d]=true
        end
    end
    -- Now that the case knows what is actually in it, the paperwork can refer
    -- to it. Owner, 2026-09-10, on finding ten clay pots beside a file that
    -- never mentioned them: "if we have 10 clay pots, do we reference them in
    -- any of our files we find?" We did not, and a pile nobody wrote down is
    -- atmosphere rather than evidence.
    --
    -- The claim gains a stores line giving the count ON PAPER. It is lower than
    -- the count in the cupboard, and nothing anywhere says so: the player
    -- counts the pots and notices, or does not.
    -- EVERY pile, not just the first: a case can hold two, and an unmentioned
    -- one is back to being atmosphere. Found while previewing the change.
    local stores={}
    for _,d in ipairs(documents) do
        if d.quantity and d.label and d.onPaper then
            stores[#stores+1]=numeral(d.onPaper).." "..plural(d.label)
                .." received. Signed for; no order number given."
            -- The pile answers the claim, and disagrees with it.
            d.links={{target=documents[1].id,kind="disputes-delivery"}}
        end
    end
    if #stores>0 then
        local line="\n\nATTACHED\nStores notes against this record:\n"..table.concat(stores,"\n")
        local at=string.find(documents[1].body,"\n\nWHAT IT MIGHT MEAN",1,true)
        if at then
            documents[1].body=string.sub(documents[1].body,1,at-1)..line
                ..string.sub(documents[1].body,at)
        else
            documents[1].body=documents[1].body..line
        end
    end
    -- The first case of a game carries the relay memo (P4-R96): one more
    -- paper, last, at the second site, after every draw above so no story
    -- document changes. It takes no role and links to nothing.
    if relayMemo then
        documents[#documents+1]={id=prefix.."document-"..(#documents+1),kind=Memo.KIND,title=Memo.TITLE,
            locationId=b.id,body=Memo.body(),references={b.id},links={},leads={}}
    end
    return {schemaVersion=G.SCHEMA,generatorRevision=G.REVISION,catalogRevision=revision,seed=seed,
        caseId=prefix.."case",outline=outline,premiseId=premise.id,contentStatus="development-draft-unapproved",
        locations=copy(sites),cast=#met>0 and copy(met) or nil,facts=facts,identities=people,
        organisation=org,documents=documents,relayMemo=relayMemo and true or nil}
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
    for key in pairs(options) do if key~="mapId" and key~="buildLine" and key~="allowSynthetic" and key~="names" and key~="relayMemo" then return nil,"unknown generator option" end end
    if type(options.mapId)~="string" or type(options.buildLine)~="string" then return nil,"map and build are required" end
    if options.relayMemo~=nil and type(options.relayMemo)~="boolean" then return nil,"invalid relay memo option" end
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
    local result=build(seed,catalog.revision,selected,G.castFrom(options.names),options.relayMemo==true)
    local valid,err=G.validate(result); if not valid then return nil,err end
    return copy(result)
end
-- Offline flow helper: preserves caller-selected introductory ordering without seed retries.
function G.generateSelected(catalog,seed,options,orderedSiteIds)
    local safe=V.validateStructure({options=options,orderedSiteIds=orderedSiteIds})
    if not safe or type(options)~="table" or type(orderedSiteIds)~="table" then return nil,"invalid selected-generation input" end
    for key in pairs(options) do
        if key~="mapId" and key~="buildLine" and key~="allowSynthetic" and key~="names" and key~="relayMemo" then return nil,"unknown generator option" end
    end
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
    local result=build(seed,catalog.revision,{a,b},G.castFrom(options.names),options.relayMemo==true); local valid,err=G.validate(result); if not valid then return nil,err end
    return copy(result)
end
-- Gameplay-facing creation entry point. Legacy generate remains an offline fixture API.
-- Caller supplies the generation anchor; restoration does not reapply this filter.
function G.generateNew(catalog,seed,options,context)
    local Reach=require("ConspiracyFiles/Reach")
    if type(context)~="table" or not Reach.validAnchor(context.anchor) then return nil,"generation anchor required" end
    local radius,why=Reach.radius(context.hoursSurvived)
    if not radius then return nil,why end
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
    if not seedOK(case.seed) or V.estimateEncodedBytes(case)>500000 then return false,"invalid seed/size" end
    local valid,err=Catalog.validate({revision=case.catalogRevision,locations=case.locations})
    if not valid then return false,err end
    if #case.locations~=2 then return false,"expected two locations" end
    if case.relayMemo~=nil and case.relayMemo~=true then return false,"invalid relay memo flag" end
    -- The relay memo takes no story role, so it is not counted against the
    -- role bounds; the rebuild below still proves it is exactly the one paper.
    local roleCount=#case.documents-(case.relayMemo and 1 or 0)
    if roleCount<G.MIN_EVIDENCE or roleCount>G.MAX_EVIDENCE then return false,"invalid evidence role count" end
    local a,b=case.locations[1],case.locations[2]
    if not Catalog.distinct(a,b) or a.mapId~=b.mapId or a.buildLine~=b.buildLine then return false,"incompatible saved locations" end
    for _,site in ipairs(case.locations) do if site.excluded or site.paperStorage~="observed" then return false,"ineligible saved location" end end
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
    if not same(case,build(case.seed,case.catalogRevision,case.locations,case.cast,case.relayMemo)) then return false,"case facts, text or structure do not match recorded revision" end
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
        local doc=byId[id]; local links={}
        -- Links to documents NOT yet found are reported as `unseen`, by the
        -- kind of document only - never its text. The notebook turns them into
        -- the survivor wondering aloud: "Probably refers to another stock
        -- list?" (owner, 2026-09-11: "that creates tension"). A question can be
        -- wrong, which is exactly what keeps it from being a quest marker.
        local unseen={}
        for _,link in ipairs(doc.links) do
            if known[link.target] then links[#links+1]=copy(link)
            elseif byId[link.target] then unseen[#unseen+1]={kind=link.kind,title=byId[link.target].title} end
        end
        rows[i]={id=id,kind=doc.kind,title=doc.title,body=doc.body,locationId=doc.locationId,leads=copy(doc.leads),
            connections=links,unseen=#unseen>0 and unseen or nil}
    end
    return rows
end
return G
