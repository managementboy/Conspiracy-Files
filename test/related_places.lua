-- A follow-up must not leak the raw coordinate name of its earlier file.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Places=require("ConspiracyFiles/Generated/PlaceNames")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local function site(id,x)
 return {id=id,name="Building at "..x..", 9696",mapId="Muldraugh, KY",buildLine="42.20",
  bounds={x1=x,y1=9696,x2=x+8,y2=9709,z=0}}
end
local earlier={caseId="old",reference="OLD-104",locations={site("a",10964),site("b",10994)},
 known={"old-review"},thread={document="old-review"}}
local current={locations={site("c",10870),site("d",10910)},follows={fromCase="old",document="old-review"}}
local body="Original file: "..earlier.locations[2].name..". Reference OLD-104."
local context=Places.context(current,{earlier})
assert(context~=current and current.sourcePlaces==nil,"display context must not mutate canonical case")
local function describe(text,c)
 if c.locations==earlier.locations then return (text:gsub("Building at 10994, 9696","201 Named Road")) end
 return text
end
local rendered=Pages.resolve(body,context,describe)
assert(rendered:find("201 Named Road",1,true) and not rendered:find("Building at",1,true))
local fallback=Pages.resolve(body,context)
assert(not fallback:find("Building at",1,true) and fallback:find("file OLD-104",1,true))
local retired={locations=current.locations,followsFrom="old"}
assert(Pages.resolve(body,Places.context(retired,{earlier}),describe)==rendered)
earlier.known={}
assert(Places.context(current,{earlier})==current,"unknown historical sources cannot add a place")
print("PASS inherited locations retain known source context on native pages and retired journal views")
