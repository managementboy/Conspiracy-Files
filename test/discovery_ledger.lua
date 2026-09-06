package.path="mod/common/media/lua/shared/?.lua;"..package.path
local L=require("ConspiracyFiles/DiscoveryLedger")
local function clone(t) local o={};for k,v in pairs(t) do o[k]=type(v)=='table' and clone(v) or v end;return o end

local e=L.empty()
assert(L.validate(e) and e.nextSeq==1 and #e.events==0)

-- Records append with stable, strictly increasing sequence numbers.
local a=assert(L.record(e,"evidence","doc-1",10))
local b,changed=assert(L.record(a,"identity","identity:Base.IDcard:7",10))
assert(changed and b.events[1].seq==1 and b.events[2].seq==2 and b.nextSeq==3)
assert(b.events[1].at==10 and b.events[2].at==10,"same game hour keeps distinct sequence")
assert(#e.events==0 and #a.events==1,"record never mutates its input")

-- Duplicate references are a no-op, not a rewrite.
local same,again=L.record(b,"identity","identity:Base.IDcard:7",99)
assert(same and not again and #same.events==2 and same.events[2].at==10)

-- Invalid input is refused.
for _,bad in ipairs({{"guess","doc-2",1},{"evidence","",1},{"evidence","doc-2",-1},{"evidence","doc-2",0/0},{"evidence",{},1}}) do
    assert(not L.record(b,bad[1],bad[2],bad[3]))
end
assert(not L.validate(setmetatable(L.empty(),{})))
local extra=clone(e);extra.unknown=true;assert(not L.validate(extra))
local sparse=clone(b);sparse.events[4]=clone(b.events[1]);assert(not L.validate(sparse))
local dup=clone(b);dup.events[2].ref=dup.events[1].ref;assert(not L.validate(dup))
local back=clone(b);back.events[2].seq=1;assert(not L.validate(back))
local behind=clone(b);behind.nextSeq=2;assert(not L.validate(behind))

-- The reported player order: cover letter, notebook, ID card, file review.
local ledger=L.empty()
for _,step in ipairs({{"evidence","doc-cover",4},{"evidence","doc-shift",5},
    {"identity","identity:Base.IDcard:7",5},{"evidence","doc-review",9}}) do
    ledger=assert(L.record(ledger,step[1],step[2],step[3]))
end
-- Sources still hand the notebook their own grouped rows.
local rows={{id="doc-cover"},{id="doc-shift"},{id="doc-review"},{id="identity:Base.IDcard:7"}}
local ordered=L.order(ledger,rows)
local ids={}
for i,row in ipairs(ordered) do ids[i]=row.id; assert(row.ordinal==i,"ordinal must follow display order") end
assert(table.concat(ids,",")=="doc-cover,doc-shift,identity:Base.IDcard:7,doc-review",table.concat(ids,","))

-- Unledgered rows keep their incoming relative order and follow recorded ones.
local mixed=L.order(ledger,{{id="unknown-a"},{id="doc-review"},{id="unknown-b"},{id="doc-cover"}})
assert(mixed[1].id=="doc-cover" and mixed[2].id=="doc-review" and mixed[3].id=="unknown-a" and mixed[4].id=="unknown-b")
assert(L.order(L.empty(),{{id="x"},{id="y"}})[1].id=="x")

local positions=L.positions(ledger)
assert(positions["identity:Base.IDcard:7"]==3 and positions["doc-review"]==4)
assert(#L.events(ledger)==4)

-- Capacity is bounded.
local full=L.empty()
for i=1,L.MAX do full=assert(L.record(full,"evidence","doc-"..i,i)) end
local capped,added,why=L.record(full,"evidence","doc-overflow",1)
assert(not added and why=="ledger capacity exceeded" and #capped.events==L.MAX)

print("discovery ledger: ok")
