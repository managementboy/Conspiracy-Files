-- Family registry only. Scenarios own events, sources and interpretations.
-- Personal openings and continuations are selected explicitly, never drawn.
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
 {id="still-filing",title="Still filing",followUp=true},
}
local byId,ordinary={},{}
for _,entry in ipairs(entries) do
 assert(not byId[entry.id],"duplicate family id")
 byId[entry.id]=entry
 if not entry.opening and not entry.followUp then ordinary[#ordinary+1]=entry end
end
local function copy(entry)
 if not entry then return nil,"unknown premise" end
 return {id=entry.id,title=entry.title,opening=entry.opening,followUp=entry.followUp}
end
function M.get(id) return copy(byId[id]) end
function M.count() return #entries end
function M.choosableCount() return #ordinary end
function M.list()
 local out={};for i,entry in ipairs(entries) do out[i]=entry.id end;return out
end
function M.choose(random)
 if type(random)~="function" then return nil,"random generator required" end
 return copy(ordinary[random(#ordinary)])
end
function M.opening() return M.get("no-contact-at-premises") end
function M.followUp() return M.get("still-filing") end
return M
