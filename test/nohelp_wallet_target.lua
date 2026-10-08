-- A paper clue goes INSIDE a wallet when its container holds one, and every
-- count that looks for it (placement, the cue's present() check) finds it there:
-- a clue the count cannot see would be created a second time.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local World=require("NHShared/WorldAccess")

local function list(items)
    return {size=function() return #items end,get=function(_,i) return items[i+1] end}
end
local function container(accepts)
    local c={items={}}
    function c:getItems() return list(self.items) end
    function c:AddItem(item) if accepts==false then return nil end; self.items[#self.items+1]=item; return item end
    return c
end
local function item(kind,token,paper)
    local it={kind=kind,md={cfPhysicalToken=token}}
    function it:getType() return self.kind end
    function it:getModData() return self.md end
    function it:IsLiterature() return paper end
    return it
end
local function bag(kind,inner)
    local it=item(kind,nil,false); it.bag=true
    function it:getInventory() return inner end
    return it
end
function instanceof(it,cls) return cls=="InventoryContainer" and it.bag==true end

local function count(c,token,limit)
    local n
    local step=World.count(c,token,function(v) n=v end,limit)
    local guard=0
    while not step() do guard=guard+1; assert(guard<1000,"count did not finish") end
    return n
end

-- A body's container: a wallet and a backpack, and a loose clue.
local wallet,pack=container(),container()
local body=container()
body:AddItem(bag("Wallet2",wallet)); body:AddItem(bag("Bag_Schoolbag",pack))

local paper=item("Base.Note","tok-1",true)
local added,where=World.addEvidence(body,paper)
assert(added==paper and where=="wallet","a paper goes into the wallet")
assert(#wallet.items==1 and #body.items==2,"in the wallet, not loose in the body")
assert(count(body,"tok-1",1)==1,"the count must see a clue one bag deep")
assert(count(body,"tok-none",1)==0,"and must not invent one")

-- A paper twice is still a conflict: the count sees both.
wallet:AddItem(item("Base.Note","tok-1",true))
assert(count(body,"tok-1",1)==2,"a duplicate in the wallet is counted")

-- Not paper: loose in the container, never in the wallet.
local card=item("Base.CreditCard","tok-2",false)
local _,w2=World.addEvidence(body,card)
assert(w2=="container" and #body.items==3,"a non-paper stays loose")
assert(count(body,"tok-2",1)==1,"loose items still count")

-- A backpack is not a wallet.
local pack2=container(); local body2=container(); body2:AddItem(bag("Bag_Schoolbag",pack2))
local _,w3=World.addEvidence(body2,item("Base.Note","tok-3",true))
assert(w3=="container" and #pack2.items==0,"only a wallet is used")

-- A wallet that refuses never loses the clue.
local jammed=container(false); local body3=container(); body3:AddItem(bag("Wallet",jammed))
local got,w4=World.addEvidence(body3,item("Base.Note","tok-4",true))
assert(got and w4=="container","a refusing wallet falls back to the container")
assert(count(body3,"tok-4",1)==1,"and the clue is counted there")

-- No wallet: unchanged behaviour.
local plain=container()
local _,w5=World.addEvidence(plain,item("Base.Note","tok-5",true))
assert(w5=="container" and count(plain,"tok-5",1)==1)
print("nohelp_wallet_target: ok")
