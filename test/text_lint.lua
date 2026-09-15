-- Text lint over generated cases: what a player reads must have no leftover
-- placeholders, no "%" (Kahlua treats runtime text as a format string: T7-04),
-- no doubled words or punctuation, no "a apple". 2,000 seeds were clean on
-- 2026-09-11 (generator g12); all 2,000 run in about 4 s.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local checks={
 {"placeholder","[{}]"},{"percent","%%"},{"double space","%S  %S"},{"space before punctuation"," [,%.;:!?]"},
 {"double punctuation","[,%.][,%.]"},{"repeated word","%f[%a](%a+) %1%f[%A]"},{"nil/table","%f[%a]nil%f[%A]"},{"table:","table: "},
 {"a before vowel","%f[%a][Aa] [aeiAEI]%a"},{"an before consonant","%f[%a][Aa]n [bcdfgjklmnpqrstvwxyzBCDFGJKLMNPQRSTVWXYZ]%a"},
 {"lowercase after full stop","%. [a-z]"},
}
local found,ex={}, {}
local cases=0
for seed=1,2000 do
  local ok,case=pcall(G.generate,catalog,seed,opts)
  if ok and case then cases=cases+1
    for _,d in ipairs(case.documents or {}) do
      for _,field in ipairs({"title","body"}) do
        local t=d[field]
        if type(t)=="string" then
          for _,c in ipairs(checks) do
            local s=t:match("()"..c[2])
            if s then found[c[1]]=(found[c[1]] or 0)+1
              if not ex[c[1]] or #ex[c[1]]<4 then ex[c[1]]=ex[c[1]] or {}; table.insert(ex[c[1]],("%s: …%s…"):format(field,t:sub(math.max(1,s-40),s+40):gsub("\n"," / "))) end
            end
          end
        end
      end
    end
  end
end
assert(cases>=1800, "most seeds must generate a case: "..cases)
local problems={}
for _,c in ipairs(checks) do if found[c[1]] then problems[#problems+1]=c[1]..": "..found[c[1]].." e.g. "..ex[c[1]][1] end end
assert(#problems==0, "generated text problems:\n"..table.concat(problems,"\n"))
print("PASS text lint: "..cases.." generated cases read cleanly")
