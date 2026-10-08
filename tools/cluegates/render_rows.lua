-- Render delivery rows exactly as the blind reader will see them once
-- accepted (check_receipts.render), straight from a ticket file, so a writer
-- can blind-read a draft without converting it first.
--   lua5.1 tools/cluegates/render_rows.lua <ticket.json> <out dir>
-- Writes <out dir>/<id>.render and <id>.sha per row; prints the ids.
package.path="mod-nohelp/common/media/lua/shared/?.lua;tools/nohelp_content/?.lua;tools/cluegates/?.lua;"..package.path
local J=require("json")
local R=dofile("tools/cluegates/check_receipts.lua")
local path,out=arg[1],arg[2]
local f=assert(io.open(path,"rb")); local data=J.decode(f:read("*a")); f:close()
local rows=data.rows or data
for _,row in ipairs(rows) do
    local c={id=row.id,title=row.title,body=row.body,pieces=row.pieces,where=row.where}
    local w=assert(io.open(out.."/"..row.id..".render","wb")); w:write(R.render(c)); w:close()
    local s=assert(io.open(out.."/"..row.id..".sha","wb")); s:write(R.sha(c).."\n"); s:close()
    print(row.id)
end
