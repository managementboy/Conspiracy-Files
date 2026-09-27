-- THE NO HELP CONTENT CONVERTER (content-writer handoff, sections 6, 7 and 9).
-- Plain Lua 5.1, offline, no dependencies beyond this folder's json.lua.
--
--   lua5.1 tools/nohelp_content/convert.lua            convert every ticket in
--                                                     content/nohelp/incoming/
--   lua5.1 tools/nohelp_content/convert.lua --rebuild  only rewrite the derived
--                                                     clue file from accepted/
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

-- THE CONTEXT the checks need: the gates' configuration and the scene lists.
function M.context(opts)
    opts=opts or {}
    local ctx={root=opts.root or M.ROOT}
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
function M.schema(row,ticket,seen)
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
    local t=ticket:upper()
    if (t:find("^MAP%-") or t:find("^SCENE%-") or t:find("^UNIQUE%-")) and row.anchor==nil then
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

-- One ticket. accepted: {ticket = {game rows}} of every ticket accepted so
-- far. Returns {accepted = game rows, sidecar = {id = fields}, rejected =
-- {{row, reasons}}, unverified = {ids}}.
function M.convertTicket(ticket,rows,accepted,ctx,status)
    local out={accepted={},sidecar={},rejected={},unverified={}}
    if status=="CLASSIFIER_STOP" then
        for _,row in ipairs(rows) do
            out.rejected[#out.rejected+1]={row=row,reasons={reason("CLASSIFIER_STOP","generation stopped; ticket comes back smaller")}}
        end
        return out
    end
    local good,seen={}, {}
    for _,row in ipairs(rows) do
        local r=M.schema(row,ticket,seen)
        if type(row)=="table" and type(row.id)=="string" then seen[row.id]=true end
        if not r then
            local ok,why,code=Manifest.validClue(row)
            if not ok then r=reason(code or "SCHEMA",why) end
        end
        if not r then r=M.sceneCheck(row,ctx) end
        if r then out.rejected[#out.rejected+1]={row=row,reasons={r}}
        else good[#good+1]=row end
    end
    -- A person ticket is accepted or returned whole.
    if ticket:upper():find("^PERSON%-") and #out.rejected>0 then
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

-- The whole run. opts: root, out, rebuild (skip incoming), and M.context's.
-- Returns the report lines.
function M.run(opts)
    opts=opts or {}
    local ctx=M.context(opts)
    local root,report=ctx.root,{}
    local accepted=M.loadAccepted(root)
    if not opts.rebuild then
        for _,ticket in ipairs(listJson(root.."/incoming")) do
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
                res=M.convertTicket(ticket,rows,accepted,ctx,status)
            end
            if #res.accepted>0 then
                accepted[ticket]=res.accepted
                writeFile(root.."/accepted/"..ticket..".json",J.encode(J.array(res.accepted)).."\n")
                os.execute('mkdir -p "'..root..'/accepted/sidecar"')
                writeFile(root.."/accepted/sidecar/"..ticket..".json",J.encode(res.sidecar).."\n")
            end
            if #res.rejected>0 then
                writeFile(root.."/rejected/"..ticket..".json",J.encode(J.array(res.rejected)).."\n")
            end
            os.remove(path)
            local codes={}
            for _,r in ipairs(res.rejected) do
                local id=type(r.row)=="table" and type(r.row.id)=="string" and r.row.id or "?"
                codes[#codes+1]=id.." "..r.reasons[1].code..(r.merged and " (merged)" or "")
            end
            report[#report+1]=ticket..": accepted "..#res.accepted..", returned "..#res.rejected
            for _,c in ipairs(codes) do report[#report+1]="    returned "..c end
            for _,id in ipairs(res.unverified) do report[#report+1]="    "..id..": scene anchor unverified (no Generated/VanillaScenes.lua yet)" end
        end
    end
    local text=M.renderClues(accepted)
    writeFile(opts.out or M.OUT,text)
    local n=0; for _,rows in pairs(accepted) do n=n+#rows end
    report[#report+1]="clue list: "..n.." accepted clues -> "..(opts.out or M.OUT)
    if not ctx.axiomsApproved then report[#report+1]="axioms: no approved list yet (content/nohelp/approved/axioms.json); shape checked only" end
    return report
end

if arg and arg[0] and arg[0]:find("nohelp_content[/\\]convert%.lua$") then
    local rebuild=false
    for _,a in ipairs(arg) do if a=="--rebuild" then rebuild=true end end
    for _,line in ipairs(M.run{rebuild=rebuild}) do print(line) end
end
return M
