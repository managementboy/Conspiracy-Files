-- The survivor reports their own discovery in first person. A carrier takes
-- an article, capitals survive ("an ID card"), the generic object is just an
-- object, and the fallback ("Evidence") is not a thing anyone would name.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local P=require("ConspiracyFiles/PlaceIndex")

assert(P.foundLine("236 Perrine St","Office memo")=="I found an office memo at 236 Perrine St.")
assert(P.foundLine("109 Walker Road","ID card")=="I found an ID card at 109 Walker Road.")
assert(P.foundLine("109 Walker Road","Handwritten cover letter")=="I found a handwritten cover letter at 109 Walker Road.")
assert(P.foundLine(nil,"Object found")=="I found an object, but I didn't note where I was.")
assert(P.foundLine("109 Walker Road","Evidence")=="I found it at 109 Walker Road.","the fallback label names nothing")
assert(P.foundLine(nil,nil)=="I didn't note where I was.","no carrier, no sentence")
print("PASS found line wording: first-person discovery, articles, capitals, and unnamed fallback")
