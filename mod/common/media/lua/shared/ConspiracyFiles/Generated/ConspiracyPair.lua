-- The central mystery is a contest between two readings of the same facts.
-- There is deliberately no `correct`, score or winner field here.  A campaign
-- may learn local answers while this direction of travel remains absent.
local M={REVISION=1,ID="farm-zero-vs-delivered-agent"}

local PAIR={
 id=M.ID,
 title="Farm Zero / Delivered Agent",
 question="Did the infection leave the farm as a sample, or arrive at the farm as a sample?",
 theories={
  {
   id="farm-zero",title="Farm Zero",
   reading="The animal illness came first. Samples and responders moved outward after infection crossed from animals to people."
  },
  {
   id="delivered-agent",title="Delivered Agent",
   reading="Biological material arrived first. Animals and workers became secondary victims of something transported toward the farm."
  },
 },
 sharedFacts={
  "Animals at or near a farm became sick.",
  "Farm workers or their close contacts became ill.",
  "Animal-related or biological material was moved.",
  "Protective equipment was used before the full public collapse.",
  "Some schedules, labels or explanations were altered.",
 },
 missingFact="The surviving evidence does not establish the direction in which the suspicious material travelled.",
}

local function copy(v)
 if type(v)~="table" then return v end
 local out={};for k,x in pairs(v) do out[k]=copy(x) end;return out
end

function M.current() return copy(PAIR) end

function M.validate(pair)
 if type(pair)~="table" or pair.id~=M.ID or pair.title~=PAIR.title
  or pair.question~=PAIR.question or pair.missingFact~=PAIR.missingFact then return false end
 if type(pair.theories)~="table" or #pair.theories~=2
  or type(pair.sharedFacts)~="table" or #pair.sharedFacts~=#PAIR.sharedFacts then return false end
 for i,theory in ipairs(PAIR.theories) do
  local actual=pair.theories[i]
  if type(actual)~="table" or actual.id~=theory.id or actual.title~=theory.title
   or actual.reading~=theory.reading then return false end
 end
 for i,fact in ipairs(PAIR.sharedFacts) do if pair.sharedFacts[i]~=fact then return false end end
 -- Unknown fields are refused so a hand-edited save cannot smuggle in a
 -- winner while still calling itself this pair.
 local allowed={id=true,title=true,question=true,theories=true,sharedFacts=true,missingFact=true}
 for key in pairs(pair) do if not allowed[key] then return false end end
 return true
end

return M
