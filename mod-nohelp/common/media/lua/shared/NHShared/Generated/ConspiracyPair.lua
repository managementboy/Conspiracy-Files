-- The central mystery is a contest between two readings of the same facts.
-- There is deliberately no `correct`, score or winner field here.  A campaign
-- may learn local answers while this direction of travel remains absent.
--
-- MORE THAN ONE PAIR, AND WHICH ONE IS LIVE IS HIDDEN (2026-09-23).
--
-- Until now there was exactly one pair, hardcoded: `M.current()` returned it
-- and `M.validate` refused every other id, so no save could differ from any
-- other and nothing was hidden, because nothing was ever chosen. A campaign's
-- central question is now drawn from this registry by the save's own seed and
-- never announced; the player meets it only through what the evidence touches.
--
-- A pair may be added here without touching a scenario, because scenarios do
-- not name a pair. They name an AXIS - the kind of fact their evidence bears
-- on - and each pair says how that axis reads under its own question. That is
-- what binds every mystery to the live conspiracy rather than stamping cases
-- with a constant they never mention.
local M={REVISION=2}

-- The axes a scenario's evidence can touch. A CLOSED list: an unknown axis is
-- refused at validation rather than silently unbound, because "bound to the
-- central conspiracy" has to be a property the generator can check.
M.AXES={"movement","records","access","protection","absence"}
local AXIS={} for _,a in ipairs(M.AXES) do AXIS[a]=true end

-- Legacy id, kept first so saves written before the registry existed still
-- validate and still rebuild byte for byte.
M.ID="farm-zero-vs-delivered-agent"

local PAIRS={
 {
  id="farm-zero-vs-delivered-agent",
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
  -- How each axis bears on THIS question. One sentence, no verdict: each says
  -- what the local finding could mean under either reading, never which.
  axes={
   movement="Something was carried between these places, and nothing here says which end it started from.",
   records="A record was altered around these dates, which would serve either an outward trail or an inward one.",
   access="Somebody had access they are not accounted for, which both readings need and neither explains.",
   protection="Protection was used here before it was public, which fits a response and fits a precaution.",
   absence="Someone who should appear in these papers does not, and their absence argues for no single direction.",
  },
 },
 {
  id="failed-cordon-vs-drawn-boundary",
  title="Failed Cordon / Drawn Boundary",
  question="Was the cordon a containment that was overwhelmed, or a line drawn to hold people inside a zone already written off?",
  theories={
   {
    id="failed-cordon",title="Failed Cordon",
    reading="The checkpoints and notices were a real attempt to stop the spread, mounted late and overrun before it could work."
   },
   {
    id="drawn-boundary",title="Drawn Boundary",
    reading="The line was placed to keep a population inside a district that had already been given up, and the notices were written to look like protection."
   },
  },
  sharedFacts={
   "Checkpoints and roadblocks were established on some routes and not others.",
   "Evacuation notices were issued, then revised or withdrawn.",
   "Some districts were closed earlier than the public timeline states.",
   "Supplies and vehicles continued to move outward after movement inward stopped.",
   "The sequence in which those decisions were recorded was altered afterwards.",
  },
  missingFact="The surviving evidence does not establish whether the line was drawn to protect those outside it or to contain those inside it.",
  axes={
   movement="Something crossed the line in one direction while people could not, and nothing here says that was decided rather than merely happening.",
   records="The order of these entries was changed after the fact, which would tidy an honest failure and would also hide a decision.",
   access="Somebody passed a boundary others could not, which a rescue would explain and so would a quiet withdrawal.",
   protection="Protection was issued here to some and not others, which fits triage and fits abandonment.",
   absence="A name that should be on this list is missing, and nothing says whether they were evacuated or left.",
  },
 },
}

local byId={} for _,p in ipairs(PAIRS) do byId[p.id]=p end

local function copy(v)
 if type(v)~="table" then return v end
 local out={};for k,x in pairs(v) do out[k]=copy(x) end;return out
end

function M.count() return #PAIRS end
function M.list()
 local out={};for i,p in ipairs(PAIRS) do out[i]=p.id end;return out
end
-- The original single pair. Kept because saves and fixtures written before the
-- registry name it, and because `select` must be able to return it unchanged.
function M.current() return copy(PAIRS[1]) end
function M.byId(id)
 local p=id~=nil and byId[id] or nil
 if not p then return nil,"unknown conspiracy pair" end
 return copy(p)
end
-- WHICH PAIR IS LIVE IS A PROPERTY OF THE SAVE, NOT OF THE BUILD, and it is
-- drawn from the seed so a campaign is stable across reloads and rebuilds.
-- Nothing announces it; the player meets it only through the axis lines the
-- evidence carries.
function M.select(seed)
 if type(seed)~="number" or seed~=seed or seed%1~=0 then return nil,"a seed selects the central pair" end
 return copy(PAIRS[(math.abs(seed)%#PAIRS)+1])
end
-- The line this pair offers for an axis, or nil for an axis it does not carry.
--
-- Resolved from the REGISTRY by id, never from the passed table. The axis
-- lines are build content, not save content: carrying five sentences inside
-- every case's copy of the pair cost 13,128 bytes of campaign state and broke
-- the whole-catalogue headroom assertion (test/map_feature_budget.lua) the
-- first time it was tried. Accepts a pair table or a bare id.
function M.axisLine(pair,axis)
 local id=type(pair)=="table" and pair.id or pair
 local canon=type(id)=="string" and byId[id] or nil
 if not canon then return nil end
 if type(axis)~="string" or not AXIS[axis] then return nil end
 return canon.axes[axis]
end
-- What a save should hold: everything that identifies the pair, without the
-- axis lines the registry can supply again on load.
function M.saved(pair)
 if type(pair)~="table" then return nil end
 local out=copy(pair); out.axes=nil; return out
end
function M.isAxis(axis) return type(axis)=="string" and AXIS[axis]==true end

function M.validate(pair)
 if type(pair)~="table" then return false end
 local canon=pair.id~=nil and byId[pair.id] or nil
 if not canon then return false end
 if pair.title~=canon.title or pair.question~=canon.question
  or pair.missingFact~=canon.missingFact then return false end
 if type(pair.theories)~="table" or #pair.theories~=2
  or type(pair.sharedFacts)~="table" or #pair.sharedFacts~=#canon.sharedFacts then return false end
 for i,theory in ipairs(canon.theories) do
  local actual=pair.theories[i]
  if type(actual)~="table" or actual.id~=theory.id or actual.title~=theory.title
   or actual.reading~=theory.reading then return false end
 end
 for i,fact in ipairs(canon.sharedFacts) do if pair.sharedFacts[i]~=fact then return false end end
 -- The axis lines are part of what a save carries, so a hand-edited one must
 -- not be able to rewrite what a finding is allowed to suggest.
 if pair.axes~=nil then
  if type(pair.axes)~="table" then return false end
  for axis,line in pairs(pair.axes) do
   if not AXIS[axis] or canon.axes[axis]~=line then return false end
  end
  for axis,line in pairs(canon.axes) do if pair.axes[axis]~=line then return false end end
 end
 -- Unknown fields are refused so a hand-edited save cannot smuggle in a
 -- winner while still calling itself this pair.
 local allowed={id=true,title=true,question=true,theories=true,sharedFacts=true,
  missingFact=true,axes=true}
 for key in pairs(pair) do if not allowed[key] then return false end end
 return true
end

return M
