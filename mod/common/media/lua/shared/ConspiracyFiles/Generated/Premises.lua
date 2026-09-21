-- Family registry only. Scenarios own events, sources and interpretations.
-- Personal openings and continuations are selected explicitly, never drawn
-- from the ordinary pool. New openings are selected deterministically from
-- their own authored pool; old saves still name the original opening with the
-- legacy boolean flag and rebuild it unchanged.
local M={}
local entries={
 {id="transfer-nobody-arranged",title="A transfer nobody arranged"},
 {id="signed-by-someone-absent",title="Signed for by someone who was not there"},
 {id="two-start-dates",title="The employee with two start dates"},
 {id="resignation-after-payslip",title="The last week of a job"},
 {id="address-that-only-receives",title="The address that receives but never sends"},
 {id="identical-inventories",title="Two buildings, one inventory"},
 {id="room-not-on-the-plan",title="The room that is not on the plan"},
 {id="lease-outlived-tenant",title="The lease that outlived the tenant"},
 {id="load-that-got-lighter",title="The load that got lighter"},
 {id="fuel-for-a-dead-truck",title="Fuel for a vehicle that was off the road"},
 {id="returned-cleaner",title="The equipment that came back cleaner"},
 {id="two-crates-one-number",title="Two crates, one number"},
 {id="paid-before-ordered",title="Paid before it was ordered"},
 {id="overtime-nobody-worked",title="The overtime nobody worked"},
 {id="closure-announced-twice",title="A closure announced twice"},
 {id="appointment-out-of-order",title="The medical appointment that came first"},
 {id="file-signed-out",title="The file that was signed out and never returned"},
 {id="missing-ledger-page",title="The page that is missing"},
 {id="photograph-without-a-name",title="The photograph with no caption"},
 {id="withdrawn-extension",title="The number that was withdrawn"},
 {id="no-contact-at-premises",title="No contact at premises",opening=true},
 {id="name-on-standby-list",title="A name promoted from standby",opening=true},
 {id="deposit-for-unknown-booking",title="A deposit for an unknown booking",opening=true},
 {id="still-filing",title="Still filing",followUp=true},
}
local byId,ordinary,openings={},{},{}
for _,entry in ipairs(entries) do
 assert(not byId[entry.id],"duplicate family id")
 byId[entry.id]=entry
 if entry.opening then openings[#openings+1]=entry
 elseif not entry.followUp then ordinary[#ordinary+1]=entry end
end
local function copy(entry)
 if not entry then return nil,"unknown premise" end
 return {id=entry.id,title=entry.title,opening=entry.opening,followUp=entry.followUp}
end
function M.get(id) return copy(byId[id]) end
function M.count() return #entries end
function M.choosableCount() return #ordinary end
function M.openingCount() return #openings end
function M.list()
 local out={};for i,entry in ipairs(entries) do out[i]=entry.id end;return out
end
function M.choose(random)
 if type(random)~="function" then return nil,"random generator required" end
 return copy(ordinary[random(#ordinary)])
end
-- `true`/nil is the legacy saved representation and always means the original
-- opening. A seed selects a new opening without consuming the generator's main
-- PRNG, so every later draw remains stable. A saved string pins the choice for
-- validation and reloads.
function M.opening(selector)
 if selector==nil or selector==true then return copy(openings[1]) end
 if type(selector)=="number" and selector==math.floor(selector) then
  return copy(openings[(selector-1)%#openings+1])
 end
 if type(selector)=="string" then
  local entry=byId[selector]
  if entry and entry.opening then return copy(entry) end
 end
 return nil,"unknown opening premise"
end
function M.followUp() return M.get("still-filing") end
return M
