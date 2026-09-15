-- A stable fingerprint of a generated case: every key sorted, every value
-- written out, then hashed. Used to prove a case is byte-for-byte what an
-- earlier generator built (test/case_steer.lua). Plain Lua 5.1.
local M={}
local function ser(v,out)
    local t=type(v)
    if t=="table" then
        local keys={}
        for k in pairs(v) do keys[#keys+1]=k end
        table.sort(keys,function(a,b)
            local ta,tb=type(a),type(b)
            if ta~=tb then return ta<tb end
            return a<b
        end)
        out[#out+1]="{"
        for _,k in ipairs(keys) do ser(k,out); out[#out+1]="="; ser(v[k],out); out[#out+1]=";" end
        out[#out+1]="}"
    elseif t=="string" then out[#out+1]=string.format("%q",v)
    else out[#out+1]=tostring(v) end
end
function M.serialize(v) local out={}; ser(v,out); return table.concat(out) end
-- djb2 over the serialized text, kept exact in doubles (mod 2^32), plus length.
function M.digest(v)
    local s=M.serialize(v)
    local h=5381
    for i=1,#s do h=(h*33+string.byte(s,i))%4294967296 end
    return string.format("%08x:%d",h,#s)
end
return M
