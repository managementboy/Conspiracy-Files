-- A tiny JSON reader and writer for the No Help content tools. Plain Lua 5.1,
-- no dependencies. Enough for the ticket rows of the content-writer handoff:
-- objects, arrays, strings (with \uXXXX escapes as UTF-8), numbers, true,
-- false and null (read as nil inside objects, as J.null inside arrays).
--
-- encode() writes objects with their keys sorted, so the same data always
-- gives the same bytes (sidecars and rejected files diff cleanly). A table is
-- written as an array when it is a non-empty sequence, or when it is empty and
-- marked with J.array({}).
local J={}
J.null=setmetatable({},{__tostring=function() return "null" end})
local ARRAY=setmetatable({},{__mode="k"})
function J.array(t) ARRAY[t]=true; return t end

local function utf8(cp)
    if cp<0x80 then return string.char(cp) end
    if cp<0x800 then return string.char(0xC0+math.floor(cp/64),0x80+cp%64) end
    if cp<0x10000 then
        return string.char(0xE0+math.floor(cp/4096),0x80+math.floor(cp/64)%64,0x80+cp%64)
    end
    return string.char(0xF0+math.floor(cp/262144),0x80+math.floor(cp/4096)%64,0x80+math.floor(cp/64)%64,0x80+cp%64)
end

function J.decode(s)
    local pos=1
    local function fail(msg) error("json: "..msg.." at byte "..pos,0) end
    local function ws() pos=s:find("[^ \t\r\n]",pos) or #s+1 end
    local value
    local function str()
        pos=pos+1
        local out={}
        while true do
            local c=s:sub(pos,pos)
            if c=="" then fail("unterminated string") end
            if c=='"' then pos=pos+1; break end
            if c=="\\" then
                local e=s:sub(pos+1,pos+1)
                local map={['"']='"',["\\"]="\\",["/"]="/",b="\b",f="\f",n="\n",r="\r",t="\t"}
                if map[e] then out[#out+1]=map[e]; pos=pos+2
                elseif e=="u" then
                    local hex=s:sub(pos+2,pos+5)
                    if not hex:find("^%x%x%x%x$") then fail("bad \\u escape") end
                    local cp=tonumber(hex,16); pos=pos+6
                    if cp>=0xD800 and cp<=0xDBFF and s:sub(pos,pos+1)=="\\u" then
                        local lo=tonumber(s:sub(pos+2,pos+5),16)
                        if lo and lo>=0xDC00 and lo<=0xDFFF then
                            cp=0x10000+(cp-0xD800)*1024+(lo-0xDC00); pos=pos+6
                        end
                    end
                    out[#out+1]=utf8(cp)
                else fail("bad escape") end
            else
                if c:byte()<32 then fail("control character in string") end
                out[#out+1]=c; pos=pos+1
            end
        end
        return table.concat(out)
    end
    function value()
        ws()
        local c=s:sub(pos,pos)
        if c=="{" then
            pos=pos+1; local t={}
            ws()
            if s:sub(pos,pos)=="}" then pos=pos+1; return t end
            while true do
                ws()
                if s:sub(pos,pos)~='"' then fail("expected a key") end
                local k=str()
                ws()
                if s:sub(pos,pos)~=":" then fail("expected ':'") end
                pos=pos+1
                local v=value()
                if v~=J.null then t[k]=v end
                ws()
                local d=s:sub(pos,pos); pos=pos+1
                if d=="}" then return t end
                if d~="," then fail("expected ',' or '}'") end
            end
        elseif c=="[" then
            pos=pos+1; local t=J.array({})
            ws()
            if s:sub(pos,pos)=="]" then pos=pos+1; return t end
            while true do
                t[#t+1]=value()
                ws()
                local d=s:sub(pos,pos); pos=pos+1
                if d=="]" then return t end
                if d~="," then fail("expected ',' or ']'") end
            end
        elseif c=='"' then return str()
        elseif s:sub(pos,pos+3)=="true" then pos=pos+4; return true
        elseif s:sub(pos,pos+4)=="false" then pos=pos+5; return false
        elseif s:sub(pos,pos+3)=="null" then pos=pos+4; return J.null
        else
            local num=s:match("^-?%d+%.?%d*[eE]?[-+]?%d*",pos)
            if not num or num=="" then fail("unexpected character") end
            pos=pos+#num
            local n=tonumber(num)
            if not n then fail("bad number") end
            return n
        end
    end
    local ok,res=pcall(function()
        local v=value(); ws()
        if pos<=#s then fail("trailing data") end
        return v
    end)
    if not ok then return nil,res end
    return res
end

local function quote(s)
    s=s:gsub('[%c"\\]',function(c)
        local map={['"']='\\"',["\\"]="\\\\",["\n"]="\\n",["\r"]="\\r",["\t"]="\\t",["\b"]="\\b",["\f"]="\\f"}
        return map[c] or string.format("\\u%04x",c:byte())
    end)
    return '"'..s..'"'
end

local function isArray(t)
    if ARRAY[t] then return true end
    local n=0
    for _ in pairs(t) do n=n+1 end
    return n>0 and n==#t
end

function J.encode(v,indent,depth)
    indent=indent or "  "; depth=depth or 0
    local t=type(v)
    if v==nil or v==J.null then return "null" end
    if t=="boolean" then return tostring(v) end
    if t=="number" then
        if v==math.floor(v) and math.abs(v)<1e15 then return string.format("%d",v) end
        return string.format("%.14g",v)
    end
    if t=="string" then return quote(v) end
    if t~="table" then error("json: cannot encode "..t) end
    local pad=string.rep(indent,depth+1)
    local close=string.rep(indent,depth)
    if isArray(v) then
        if #v==0 then return "[]" end
        local out={}
        for i=1,#v do out[i]=pad..J.encode(v[i],indent,depth+1) end
        return "[\n"..table.concat(out,",\n").."\n"..close.."]"
    end
    local keys={}
    for k in pairs(v) do keys[#keys+1]=tostring(k) end
    table.sort(keys)
    if #keys==0 then return "{}" end
    local out={}
    for i,k in ipairs(keys) do
        local x=v[k]; if x==nil then x=v[tonumber(k)] end
        out[i]=pad..quote(k)..": "..J.encode(x,indent,depth+1)
    end
    return "{\n"..table.concat(out,",\n").."\n"..close.."}"
end

return J
