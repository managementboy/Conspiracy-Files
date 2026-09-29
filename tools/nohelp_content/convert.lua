-- THE NO HELP CONTENT CONVERTER (content-writer handoff, sections 6, 7 and 9).
-- Plain Lua 5.1, offline, no dependencies beyond this folder's json.lua.
--
--   lua5.1 tools/nohelp_content/convert.lua            convert every ticket in
--                                                     content/nohelp/incoming/
--   lua5.1 tools/nohelp_content/convert.lua --rebuild  only rewrite the derived
--                                                     clue file from accepted/
--   lua5.1 tools/nohelp_content/convert.lua --check    validate incoming/ against
--                                                     accepted/ and write nothing;
--                                                     exits 1 if a row would be
--                                                     returned or the derived
--                                                     clue file is out of date
--
-- Tickets are opaque serials (T0001...; content/nohelp/TICKETS.md). A serial's
-- type (PLACE, PERSON, MAP, SCENE, UNIQUE, STAGE0) comes from the writer-only
-- registry docs/writer-only/nohelp-tickets.tsv; a name like PLACE-farm still
-- carries its type in its prefix. A STAGE0 delivery is not clue rows: it is
-- left in incoming/ for Claude to sign off (content/nohelp/approved/).
--
-- For each content/nohelp/incoming/<ticket>.json (an array of rows, or
-- {"status": "CLASSIFIER_STOP", "rows": [...]}) it:
--   1. checks every row on its own: the delivery schema (section 6), then
--      Manifest.validClue with the row's authoring fields still on it, which
--      runs the clue-list rules, the anchor check and the authoring gates
--      (Mystery/ClueGates: provenance, rival reading, gloss, axioms, density,
--      emphasis, citations, reserved names, the retired premise);
--   2. checks the rows that passed against everything already accepted from
--      OTHER tickets (Manifest.lint on the merged list). A ticket whose rows
--      pass alone but break the merged list is returned as a whole, each row
--      marked merged=true with the list's reason;
--   3. writes accepted rows' game fields to accepted/<ticket>.json, their
--      authoring fields (rival_reading, gloss, axioms, cites, prov) to
--      accepted/sidecar/<ticket>.json, returned rows with reason codes to
--      rejected/<ticket>.json, and removes the incoming file;
--   4. rewrites the derived clue file the game loads (Manifest.clues):
--      mod-nohelp/.../NHShared/Mystery/Content/Clues.lua, from every accepted
--      ticket, tickets in name order, rows in delivery order.
-- A ticket delivered again replaces its earlier accepted rows only if some of
-- the new rows are accepted.
--
-- RECALLS (owner, 2026-09-29; content/nohelp/recalls.json): a quality problem
-- becomes a named recall with a rule and a list of clue ids. A delivery whose
-- rows carry recalled ids replaces just those clues: the ticket's other rows
-- stay, the old clue stays in the game until its replacement passes, and the
-- old clue goes to retired/<ticket>.json with its recall. A replacement keeps
-- the old clue's form, uses none of the recall's banned pieces and, when the
-- recall sets "rare", a set uses at least one piece fewer than that many other
-- clues use. A recalled id is done once retired/ holds it.
--
-- Ticket-level rules on top of the clue-list rules:
--   * a row id is unique, at most 60 characters, and starts with the ticket
--     name in lower case and a dash (ticket PLACE-farm: "place-farm-03");
--   * MAP-, SCENE- and UNIQUE- tickets: every row has an anchor;
--   * PERSON- tickets are accepted or returned whole;
--   * a scene anchor, while Generated/VanillaScenes.lua does not exist, is
--     checked against the writer-only scene list and draft table: the kind
--     must be one of the vanilla scene kinds, not one the owner left alone,
--     and on the draft table's anchor spot when it names one. Such rows are
--     reported as "scene anchor unverified" until the shipped table exists.
--
-- Output on the terminal is counts, row ids and reason codes only - never
-- clue text (the owner plays blind).
package.path="mod-nohelp/common/media/lua/shared/?.lua;tools/nohelp_content/?.lua;"..package.path
local J=require("json")
local Manifest=require("NHShared/Mystery/Manifest")
local Gates=require("NHShared/Mystery/ClueGates")
local M={}
M.ROOT="content/nohelp"
M.OUT="mod-nohelp/common/media/lua/shared/NHShared/Mystery/Content/Clues.lua"
M.RETIRED="tools/cluegates/retired_hashes.lua"
M.SCENE_KINDS="docs/writer-only/nohelp-adhd-inputs/vanilla-scene-kinds.txt"
M.SCENE_DRAFT="docs/writer-only/nohelp-adhd-inputs/vanilla-scene-table-draft.json"
M.SPOILERS="docs/writer-only/NOHELP_SPOILERS.md"
M.REGISTRY="docs/writer-only/nohelp-tickets.tsv"

M.GAME_FIELDS={"id","kind","pieces","where","person","title","body","anchor"}
M.SIDECAR_FIELDS={"rival_reading","gloss","axioms","cites","prov"}
M.REQUIRED={id="string",kind="string",pieces="table",where="table",rival_reading="string",
    gloss="string",axioms="table",prov="table"}
M.OPTIONAL={person="string",title="string",body="string",anchor="table",cites="table"}
M.WHERE_FIELDS={place=true,spot=true,lean=true,rival=true,outfit=true}
-- Draft-table anchors as spots. "carried" (a bag someone grabbed) is on a
-- body or on the ground.
M.DRAFT_SPOTS={["room-container"]={furniture=true},body={corpse=true},vehicle={vehicle=true},
    ground={ground=true},carried={corpse=true,ground=true}}

local function readFile(path)
    local f=io.open(path,"rb"); if not f then return nil end
    local s=f:read("*a"); f:close(); return s
end
local function writeFile(path,text)
    local f=assert(io.open(path,"wb")); f:write(text); f:close()
end
local function listJson(dir)
    local out={}
    local p=io.popen('ls -1 "'..dir..'" 2>/dev/null')
    if p then
        for name in p:lines() do
            local stem=name:match("^(.+)%.json$")
            if stem then out[#out+1]=stem end
        end
        p:close()
    end
    table.sort(out)
    return out
end
M.listJson=listJson

-- THE TICKET REGISTRY: {serial = {serial, type, target, status, attempts,
-- opened, closed}}, empty if the file is missing.
M.REGISTRY_FIELDS={"serial","type","target","status","attempts","opened","closed"}
function M.loadRegistry(path)
    local reg={}
    for line in (readFile(path or M.REGISTRY) or ""):gmatch("[^\r\n]+") do
        if not line:find("^#") and not line:find("^serial\t") then
            local r,i={},0
            for field in (line.."\t"):gmatch("([^\t]*)\t") do
                i=i+1; if M.REGISTRY_FIELDS[i] then r[M.REGISTRY_FIELDS[i]]=field end
            end
            if r.serial and r.serial~="" then reg[r.serial]=r end
        end
    end
    return reg
end
-- A ticket's type: the registry's for a serial, else the name's prefix.
function M.ticketType(ticket,registry)
    local r=registry and registry[ticket]
    if r then return (r.type or ""):upper() end
    return (ticket:match("^(%a+)%-") or ""):upper()
end

-- THE CONTEXT the checks need: the gates' configuration and the scene lists.
function M.context(opts)
    opts=opts or {}
    local ctx={root=opts.root or M.ROOT}
    -- Recipes (owner, 2026-09-29): per ticket, the form (written or set) and
    -- whether a key ring may appear. content/nohelp/recipes.json; a ticket
    -- without a recipe is not checked for these.
    ctx.recipes=opts.recipes
    if ctx.recipes==nil then
        local text=readFile((opts.root or M.ROOT).."/recipes.json")
        ctx.recipes=text and J.decode(text) or {}
    end
    ctx.recalls=opts.recalls
    if ctx.recalls==nil then
        local text=readFile((opts.root or M.ROOT).."/recalls.json")
        ctx.recalls=text and J.decode(text) or {}
    end
    local retired=opts.retired
    if retired==nil then
        local ok,r=pcall(dofile,opts.retiredPath or M.RETIRED)
        retired=ok and r or nil
    end
    local axioms=opts.axioms
    if axioms==nil then
        local text=readFile(ctx.root.."/approved/axioms.json")
        if text then
            local data,err=J.decode(text)
            if not data then error("approved/axioms.json: "..tostring(err)) end
            axioms={}
            for _,lean in ipairs(Manifest.LEANS) do
                axioms[lean]={}
                for _,a in ipairs(data[lean] or {}) do
                    local id=type(a)=="table" and a.id or a
                    if type(id)=="string" then axioms[lean][id]=true end
                end
            end
        end
    end
    Gates.configure{retired=retired,axioms=axioms or nil,reserved=opts.reserved}
    ctx.axiomsApproved=axioms~=nil and axioms~=false
    ctx.registry=opts.registry or M.loadRegistry(opts.registryPath)
    -- The scene lists (writer-only inputs), used while the shipped scene
    -- table does not exist.
    local okScenes=pcall(require,"NHShared/Generated/VanillaScenes")
    ctx.scenesShipped=okScenes and opts.scenesShipped~=false
    ctx.sceneKinds,ctx.sceneDraft,ctx.leftAlone=opts.sceneKinds,opts.sceneDraft,opts.leftAlone
    if not ctx.sceneKinds then
        local text=readFile(M.SCENE_KINDS)
        if text then
            ctx.sceneKinds={}
            for k in text:gmatch("%w+") do ctx.sceneKinds[k]=true end
        end
    end
    if not ctx.sceneDraft then
        local text=readFile(M.SCENE_DRAFT)
        local data=text and J.decode(text)
        ctx.sceneDraft={}
        for _,r in ipairs(data and data.rows or {}) do ctx.sceneDraft[r.id]=r end
    end
    if not ctx.leftAlone then
        ctx.leftAlone={}
        -- The spoilers file's "Left alone entirely" bullet, up to the next
        -- bullet or heading: the scene kinds in backticks.
        local on=false
        for line in (readFile(M.SPOILERS) or ""):gmatch("[^\n]+") do
            if line:find("Left alone entirely",1,true) then on=true
            elseif line:find("^%s*%- ") or line:find("^#") then on=false end
            if on then for k in line:gmatch("`(%u%w+)`") do ctx.leftAlone[k]=true end end
        end
    end
    return ctx
end

local function reason(code,why) return {code=code,why=why} end

-- The delivery schema of one row (section 6).
function M.schema(row,ticket,seen,ttype)
    if type(row)~="table" then return reason("SCHEMA","a row is an object") end
    for k,t in pairs(M.REQUIRED) do
        if type(row[k])~=t then
            if k=="rival_reading" then return reason("NO_RIVAL","no rival reading") end
            if k=="gloss" then return reason("NO_GLOSS","no gloss") end
            if k=="axioms" then return reason("AXIOM_UNKNOWN","no axioms") end
            if k=="prov" then return reason("NO_PROV","no provenance") end
            return reason("SCHEMA","field "..k.." must be a "..t)
        end
    end
    for k,v in pairs(row) do
        if not M.REQUIRED[k] then
            if not M.OPTIONAL[k] then return reason("SCHEMA","unknown field "..tostring(k)) end
            if type(v)~=M.OPTIONAL[k] then return reason("SCHEMA","field "..k.." must be a "..M.OPTIONAL[k]) end
        end
    end
    if #row.id>60 then return reason("SCHEMA","id longer than 60 characters") end
    local prefix=ticket:lower().."-"
    if row.id:sub(1,#prefix)~=prefix then return reason("SCHEMA","id does not start with "..prefix) end
    if seen[row.id] then return reason("DUPLICATE","id used twice in the ticket") end
    for i,w in ipairs(row.where) do
        if type(w)~="table" then return reason("SCHEMA","where "..i.." is not an object") end
        for k in pairs(w) do if not M.WHERE_FIELDS[k] then return reason("SCHEMA","unknown where field "..tostring(k)) end end
    end
    for _,p in ipairs(row.pieces) do if type(p)~="string" then return reason("SCHEMA","a piece is an item id") end end
    local t=ttype or M.ticketType(ticket)
    if (t=="MAP" or t=="SCENE" or t=="UNIQUE") and row.anchor==nil then
        return reason("ANCHOR_UNKNOWN","a map or scene ticket's row names its anchor")
    end
    return nil
end

-- A scene anchor against the writer-only lists, while the shipped table does
-- not exist. Returns a reason, or nil and whether it was verified.
function M.sceneCheck(row,ctx)
    local a=row.anchor
    if type(a)~="table" or a.scene==nil or ctx.scenesShipped then return nil end
    if ctx.sceneKinds and not ctx.sceneKinds[a.scene] then return reason("ANCHOR_UNKNOWN","not a vanilla scene kind") end
    if ctx.leftAlone[a.scene] then return reason("ANCHOR_UNKNOWN","the owner left this scene alone") end
    local draft=ctx.sceneDraft[a.scene]
    local spots=draft and M.DRAFT_SPOTS[draft.anchor]
    if spots then
        for _,w in ipairs(row.where) do
            if not spots[w.spot] then return reason("ANCHOR_SPOT_MISMATCH","not on the scene's anchor") end
        end
    end
    return nil
end

local function gameFields(row)
    local out={}
    for _,k in ipairs(M.GAME_FIELDS) do out[k]=row[k] end
    return out
end
local function sidecarFields(row)
    local out={}
    for _,k in ipairs(M.SIDECAR_FIELDS) do out[k]=row[k] end
    return out
end

-- THE RECIPE: the form it names, and no key ring unless it allows one.
function M.recipeCheck(row,ticket,ctx)
    local r=ctx.recipes and ctx.recipes[ticket]
    if type(r)~="table" then return nil end
    if r.form and row.kind~=r.form then return reason("RECIPE_FORM","the recipe asks for a "..tostring(r.form).." clue") end
    if not r.keyRing then
        for _,p in ipairs(row.pieces or {}) do
            if p=="KeyRing" or p=="Key1" or p=="KeyRing_Hotel" then return reason("RECIPE_KEY","the recipe allows no key ring here") end
        end
    end
    return nil
end
-- THE SAME TEXT TWICE: a clue whose title and body repeat another clue's,
-- accepted or delivered (letters and digits compared, case ignored).
function M.textKey(row)
    local t=(tostring(row.title or "").." "..tostring(row.body or "")):lower():gsub("[^%w]","")
    return t
end

-- THE RECALL CHECK for one replacement row. old: the clue it replaces;
-- counts: piece -> number of accepted clues using it, the old clue left out.
function M.recallCheck(row,old,recall,counts)
    if row.kind~=old.kind then return reason("RECALL_FORM","a replacement keeps the form: "..tostring(old.kind)) end
    local banned={}
    for _,p in ipairs(recall.ban or {}) do banned[p]=true end
    for _,p in ipairs(row.pieces or {}) do
        if banned[p] then return reason("RECALL_BAN",tostring(p).." is what this recall removes") end
    end
    if recall.rare and row.kind=="set" then
        local ok=false
        for _,p in ipairs(row.pieces or {}) do if (counts[p] or 0)<recall.rare then ok=true end end
        if not ok then return reason("RECALL_RARE","a replacement uses a piece fewer than "..recall.rare.." clues use") end
    end
    return nil
end

-- Open recalled ids: id -> {name, recall}; retired: {ticket = rows}.
function M.openRecalls(recalls,retired)
    local done={}
    for _,rows in pairs(retired or {}) do for _,r in ipairs(rows) do done[r.row.id.."|"..r.recall]=true end end
    local open={}
    for name,rc in pairs(recalls or {}) do
        if type(rc)=="table" then
            for id in pairs(rc.clues or {}) do if not done[id.."|"..name] then open[id]={name=name,recall=rc} end end
        end
    end
    return open
end

-- One ticket. accepted: {ticket = {game rows}} of every ticket accepted so
-- far. Returns {accepted = game rows, sidecar = {id = fields}, rejected =
-- {{row, reasons}}, unverified = {ids}}.
function M.convertTicket(ticket,rows,accepted,ctx,status)
    local out={accepted={},sidecar={},rejected={},unverified={}}
    if #rows==0 then
        out.rejected[1]={row=J.null,reasons={reason("EMPTY","the ticket has no clue"..(status and " ("..status..")" or ""))}}
        return out
    end
    if status=="CLASSIFIER_STOP" then
        for _,row in ipairs(rows) do
            out.rejected[#out.rejected+1]={row=row,reasons={reason("CLASSIFIER_STOP","generation stopped; ticket comes back smaller")}}
        end
        return out
    end
    local good,seen={}, {}
    local ttype=M.ticketType(ticket,ctx.registry)
    -- A recall delivery: its rows carry recalled ids of this ticket.
    local open,oldById,recallMode=ctx.open or {},{},false
    for _,c in ipairs(accepted[ticket] or {}) do oldById[c.id]=c end
    for _,row in ipairs(rows) do
        if type(row)=="table" and open[row.id] and oldById[row.id] then recallMode=true end
    end
    local counts={}
    if recallMode then
        for _,cs in pairs(accepted) do for _,c in ipairs(cs) do
            if not (open[c.id] and oldById[c.id]==c) then
                local once={}
                for _,p in ipairs(c.pieces or {}) do if not once[p] then once[p]=true; counts[p]=(counts[p] or 0)+1 end end
            end
        end end
    end
    for _,row in ipairs(rows) do
        local r=M.schema(row,ticket,seen,ttype)
        if type(row)=="table" and type(row.id)=="string" then seen[row.id]=true end
        if not r then
            local ok,why,code=Manifest.validClue(row)
            if not ok then r=reason(code or "SCHEMA",why) end
        end
        if not r then r=M.sceneCheck(row,ctx) end
        if not r then r=M.recipeCheck(row,ticket,ctx) end
        if not r and recallMode then
            if not (open[row.id] and oldById[row.id]) then r=reason("RECALL_ID","a recall delivery holds only this ticket's recalled clues")
            else r=M.recallCheck(row,oldById[row.id],open[row.id].recall,counts) end
        end
        if not r and type(row)=="table" then
            local k=M.textKey(row)
            if ctx.texts and ctx.texts[k] and ctx.texts[k]~=row.id then r=reason("TEXT_REPEAT","the same text as "..ctx.texts[k]) end
            if ctx.texts and not r then ctx.texts[k]=row.id end
        end
        if r then out.rejected[#out.rejected+1]={row=row,reasons={r}}
        else good[#good+1]=row end
    end
    -- A person ticket is accepted or returned whole.
    if ttype=="PERSON" and #out.rejected>0 then
        for _,row in ipairs(good) do
            out.rejected[#out.rejected+1]={row=row,reasons={reason("PERSON_SPLIT","returned with the rest of its person ticket")}}
        end
        good={}
    end
    -- The merged list: every other ticket's accepted rows, then these.
    if #good>0 then
        local merged={}
        local names={}
        for name in pairs(accepted) do if name~=ticket then names[#names+1]=name end end
        table.sort(names)
        for _,name in ipairs(names) do for _,c in ipairs(accepted[name]) do merged[#merged+1]=c end end
        if recallMode then
            local replaced={}
            for _,row in ipairs(good) do replaced[row.id]=true end
            for _,c in ipairs(accepted[ticket] or {}) do if not replaced[c.id] then merged[#merged+1]=c end end
        end
        for _,row in ipairs(good) do merged[#merged+1]=gameFields(row) end
        local ok,why,code=Manifest.lint(merged)
        if not ok then
            for _,row in ipairs(good) do
                out.rejected[#out.rejected+1]={row=row,merged=true,
                    reasons={reason(code or "SCHEMA","passes alone, breaks the merged list: "..tostring(why))}}
            end
            good={}
        end
    end
    for _,row in ipairs(good) do
        out.accepted[#out.accepted+1]=gameFields(row)
        out.sidecar[row.id]=sidecarFields(row)
        if Manifest.anchorStatus(row)=="unverified" then out.unverified[#out.unverified+1]=row.id end
    end
    out.count=#out.accepted
    if recallMode and #good>0 then
        -- The ticket's rows with the replacements swapped in, in their places.
        local new,whole,side={},{},ctx.oldSidecar or {}
        for _,c in ipairs(out.accepted) do new[c.id]=c end
        out.retired={}
        for _,c in ipairs(accepted[ticket]) do
            if new[c.id] then
                whole[#whole+1]=new[c.id]
                out.retired[#out.retired+1]={recall=open[c.id].name,row=c,sidecar=side[c.id] or J.null}
            else whole[#whole+1]=c; out.sidecar[c.id]=side[c.id] end
        end
        out.accepted=whole
        out.recall=true
    end
    return out
end

-- THE DERIVED FILE. Deterministic: fields in a fixed order, strings escaped
-- the same way every time, so an unchanged content set gives the same bytes.
local function luaString(s)
    return '"'..s:gsub('[%c"\\]',function(c)
        local map={['"']='\\"',["\\"]="\\\\",["\n"]="\\n",["\r"]="\\r",["\t"]="\\t"}
        return map[c] or ("\\"..string.format("%03d",c:byte()))
    end)..'"'
end
local ORDER={"id","kind","pieces","where","person","title","body","anchor",
    "place","spot","lean","rival","outfit","map","mark","note","print","scene","version"}
local function luaValue(v)
    if type(v)=="string" then return luaString(v) end
    if type(v)=="number" then return string.format("%d",v) end
    if type(v)=="boolean" then return tostring(v) end
    if type(v)=="table" then
        local parts={}
        if #v>0 then
            for i=1,#v do parts[i]=luaValue(v[i]) end
        else
            for _,k in ipairs(ORDER) do
                if v[k]~=nil then parts[#parts+1]=k.."="..luaValue(v[k]) end
            end
        end
        return "{"..table.concat(parts,",").."}"
    end
    error("cannot write "..type(v))
end
function M.renderClues(accepted)
    local names={}
    for name in pairs(accepted) do names[#names+1]=name end
    table.sort(names)
    local out={
        "-- DERIVED FILE - do not edit by hand. The No Help clue list (Manifest.clues).",
        "--   lua5.1 tools/nohelp_content/convert.lua",
        "-- from content/nohelp/accepted/*.json; authoring fields live in the sidecars",
        "-- (content/nohelp/accepted/sidecar/). Writer and engineer material: the owner",
        "-- plays blind and does not read this file.",
        "return {clues={",
    }
    for _,name in ipairs(names) do
        out[#out+1]="-- "..name
        for _,c in ipairs(accepted[name]) do out[#out+1]=luaValue(c).."," end
    end
    out[#out+1]="}}"
    return table.concat(out,"\n").."\n"
end

function M.loadAccepted(root)
    local accepted={}
    for _,name in ipairs(listJson(root.."/accepted")) do
        local data,err=J.decode(readFile(root.."/accepted/"..name..".json") or "")
        if type(data)~="table" then error("accepted/"..name..".json: "..tostring(err)) end
        accepted[name]=data
    end
    return accepted
end

-- The whole run. opts: root, out, rebuild (skip incoming), check (write
-- nothing), and M.context's. Returns the report lines and, with check, whether
-- everything passed.
function M.run(opts)
    opts=opts or {}
    local ctx=M.context(opts)
    local root,report=ctx.root,{}
    local accepted=M.loadAccepted(root)
    local check=opts.check
    local stale=false
    if check then
        stale=readFile(opts.out or M.OUT)~=M.renderClues(accepted)
    end
    local nTickets,nAccepted,nReturned,nStage0=0,0,0,0
    ctx.texts={}
    for _,rows in pairs(accepted) do for _,c in ipairs(rows) do ctx.texts[M.textKey(c)]=c.id end end
    local retired={}
    for _,name in ipairs(listJson(root.."/retired")) do
        retired[name]=J.decode(readFile(root.."/retired/"..name..".json") or "[]") or {}
    end
    ctx.open=M.openRecalls(ctx.recalls,retired)
    if not opts.rebuild then
        for _,ticket in ipairs(listJson(root.."/incoming")) do
          if M.ticketType(ticket,ctx.registry)=="STAGE0" then
            nStage0=nStage0+1
            report[#report+1]=ticket..": stage 0 delivery, left in incoming/ for sign-off"
          else
            nTickets=nTickets+1
            local path=root.."/incoming/"..ticket..".json"
            local data,err=J.decode(readFile(path) or "")
            local rows,status
            if type(data)=="table" and #data>0 then rows=data
            elseif type(data)=="table" and type(data.rows)=="table" then rows,status=data.rows,data.status end
            local res
            if not ticket:find("^[%w_%-]+$") then
                res={accepted={},sidecar={},unverified={},rejected={{row=data or J.null,reasons={reason("SCHEMA","a ticket name is letters, digits, - and _")}}}}
            elseif not rows then
                res={accepted={},sidecar={},unverified={},rejected={{row=data or J.null,reasons={reason("SCHEMA","not an array of rows: "..tostring(err or "empty"))}}}}
            else
                ctx.oldSidecar=J.decode(readFile(root.."/accepted/sidecar/"..ticket..".json") or "{}") or {}
                res=M.convertTicket(ticket,rows,accepted,ctx,status)
            end
            local nOk=res.count or #res.accepted
            nAccepted,nReturned=nAccepted+nOk,nReturned+#res.rejected
            if #res.accepted>0 then accepted[ticket]=res.accepted end
            if #res.accepted>0 and not check then
                writeFile(root.."/accepted/"..ticket..".json",J.encode(J.array(res.accepted)).."\n")
                os.execute('mkdir -p "'..root..'/accepted/sidecar"')
                writeFile(root.."/accepted/sidecar/"..ticket..".json",J.encode(res.sidecar).."\n")
                if res.retired then
                    local drawer=retired[ticket] or {}
                    for _,r in ipairs(res.retired) do drawer[#drawer+1]=r end
                    retired[ticket]=drawer
                    os.execute('mkdir -p "'..root..'/retired"')
                    writeFile(root.."/retired/"..ticket..".json",J.encode(J.array(drawer)).."\n")
                end
            end
            if #res.rejected>0 and not check then
                writeFile(root.."/rejected/"..ticket..".json",J.encode(J.array(res.rejected)).."\n")
            end
            if not check then os.remove(path) end
            local codes={}
            for _,r in ipairs(res.rejected) do
                local id=type(r.row)=="table" and type(r.row.id)=="string" and r.row.id or "?"
                codes[#codes+1]=id.." "..r.reasons[1].code..(r.merged and " (merged)" or "")
            end
            report[#report+1]=ticket..": "..(res.recall and "replaced " or "accepted ")..nOk..", returned "..#res.rejected
            for _,c in ipairs(codes) do report[#report+1]="    returned "..c end
            for _,id in ipairs(res.unverified) do report[#report+1]="    "..id..": scene anchor unverified (no Generated/VanillaScenes.lua yet)" end
          end
        end
    end
    local n=0; for _,rows in pairs(accepted) do n=n+#rows end
    -- Recall progress, counts only.
    local rnames={}
    for name,rc in pairs(ctx.recalls or {}) do if type(rc)=="table" then rnames[#rnames+1]=name end end
    table.sort(rnames)
    local open=M.openRecalls(ctx.recalls,retired)
    for _,name in ipairs(rnames) do
        local total,left=0,0
        for id in pairs(ctx.recalls[name].clues or {}) do total=total+1; if open[id] and open[id].name==name then left=left+1 end end
        report[#report+1]="recall "..name..": "..(total-left).."/"..total.." replaced"
    end
    if check then
        -- Counts only: this line goes to the CI summary.
        report[#report+1]="check: "..nTickets.." tickets, "..nAccepted.." rows pass, "..nReturned.." returned, "
            ..nStage0.." stage 0 awaiting sign-off, clue list "..(stale and "OUT OF DATE" or "current")
        return report,nReturned==0 and not stale
    end
    local text=M.renderClues(accepted)
    writeFile(opts.out or M.OUT,text)
    report[#report+1]="clue list: "..n.." accepted clues -> "..(opts.out or M.OUT)
    if not ctx.axiomsApproved then report[#report+1]="axioms: no approved list yet (content/nohelp/approved/axioms.json); shape checked only" end
    return report
end

if arg and arg[0] and arg[0]:find("nohelp_content[/\\]convert%.lua$") then
    local rebuild,check=false,false
    for _,a in ipairs(arg) do
        if a=="--rebuild" then rebuild=true elseif a=="--check" then check=true end
    end
    local report,ok=M.run{rebuild=rebuild,check=check}
    for _,line in ipairs(report) do print(line) end
    if check and not ok then os.exit(1) end
end
return M
