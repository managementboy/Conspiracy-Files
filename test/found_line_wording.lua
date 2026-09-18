-- The FOUND line names the thing properly. Owner, Windows, 2026-09-18, reading
-- "236 Perrine St It was office memo.": a carrier takes an article, capitals
-- survive ("an ID card"), the generic object is just an object, and the
-- projection's own fallback ("Evidence") is not a thing anyone would name.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local P=require("ConspiracyFiles/PlaceIndex")

assert(P.foundLine("236 Perrine St","Office memo")=="236 Perrine St It was an office memo.")
assert(P.foundLine("109 Walker Road","ID card")=="109 Walker Road It was an ID card.")
assert(P.foundLine("109 Walker Road","Handwritten cover letter")=="109 Walker Road It was a handwritten cover letter.")
assert(P.foundLine(nil,"Object found")=="I didn't note where I was. It was an object.")
assert(P.foundLine("109 Walker Road","Evidence")=="109 Walker Road","the fallback label names nothing")
assert(P.foundLine(nil,nil)=="I didn't note where I was.","no carrier, no sentence")
print("PASS found line wording: a carrier takes its article, capitals survive, the fallback says nothing")
