-- THE RETIRED-PREMISE TRIPWIRE (content-writer handoff, sections 2 and 7).
--
-- An earlier premise pair was retired by the owner
-- (docs/design/NO_HELP_CONSPIRACY_DESIGN_2026-09-26.md, section 1a). Its key
-- terms, and the obvious two-word ways of rebuilding it, are kept here ONLY as
-- salted hashes (Mystery/ClueGates.hash(salt, lowercase word or "word word"))
-- so that no new file spells them out. The converter hands this table to
-- ClueGates.configure; a clue any of whose words or two-word runs hashes to
-- one of these is returned as RETIRED_PREMISE.
--
-- To add a term: compute ClueGates.hash(salt, term) in a throwaway shell and
-- add the result; never write the term into the repository.
return {salt="nohelp-retired-7f3a-2026-09-27",hashes={
    ["1081266944-2143062812"]=true,
    ["1399599363-1982782433"]=true,
    ["1488891342-1574719983"]=true,
    ["1527705477-795779262"]=true,
    ["1582656429-124947249"]=true,
    ["1584380521-1683411435"]=true,
    ["1591723925-604008837"]=true,
    ["257157117-489974725"]=true,
    ["49245450-1428123211"]=true,
    ["620672846-1669406940"]=true,
    ["659980049-1950744666"]=true,
    ["697621718-1000088870"]=true,
    ["772272999-897816655"]=true,
    ["796917480-857090715"]=true,
}}
