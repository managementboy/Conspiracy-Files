-- Opening the shipped fixed-container index does not read the whole map
-- (first visible playtest, 2026-09-27). The first open - the first area
-- decision of every session - counted the separators in all 3.4 MB of encoded
-- rows, one scheduler step that stuttered the game for 640-715 ms. Now only
-- the header and the small name lists are checked on open; each building's
-- entry, and each of its rows, is checked when that building is first decoded.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local F=require("OIShared/Generated/FixedContainerIndex")
local bundle=require("OIShared/Generated/FixedContainerIndexData")
local D=bundle[1]

-- Count the bytes the string library scans while the index opens.
local scanned=0
local real={gsub=string.gsub,gmatch=string.gmatch,find=string.find,match=string.match}
for name,fn in pairs(real) do
    string[name]=function(s,...) if type(s)=="string" then scanned=scanned+#s end return fn(s,...) end
end
local registry=assert(F.open(bundle,D.map,D.build),"the shipped index opens")
for name,fn in pairs(real) do string[name]=fn end
local total=0
for _,e in pairs(D.buildings) do total=total+#e[3] end
assert(total>1000000,"the shipped index is the whole map")
assert(scanned<total/100,"opening scanned "..scanned.." of "..total.." encoded bytes")

-- Still correct: a real building decodes to rows.
local someId
for id in pairs(D.buildings) do someId=id; break end
local rows=registry.candidates("t3:"..someId)
assert(#rows>=1 and rows[1].sprite and rows[1].containerType,"a shipped building decodes to rows")

-- A malformed building is refused when it is decoded, not silently used; the
-- rest of the index still works.
local bad={schema=D.schema,map="Test, KY",build="t",count=1,sprites={"s"},types={"t"},rooms={"r"},
    buildings={good={10,20,"0,0,0,1,1,0"},broken={10,20,""},junk={10,20,"zz"}}}
local reg=assert(F.open({bad},"Test, KY","t"),"the header is fine, so it opens")
local good=reg.candidates("t3:good")
assert(#good==1 and good[1].x==10 and good[1].y==20 and good[1].sprite=="s","the good building decodes")
assert(not pcall(reg.candidates,"t3:broken"),"an empty building entry is refused on decode")
assert(not pcall(reg.candidates,"t3:junk"),"a malformed row is refused on decode")
assert(#reg.candidates("t3:missing")==0,"an unknown building has no rows")
-- A broken header is still refused on open.
assert(not F.open({{schema=D.schema,map="Test, KY",build="t",count=1,sprites={"s"},types={"t"},rooms={"r"},buildings="x"}},
    "Test, KY","t"),"a broken header is refused")
print("nohelp fixed index open: opening reads the header only; each building is checked when decoded")
