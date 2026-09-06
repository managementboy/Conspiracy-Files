package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local V=require('ConspiracyFiles/Validator')
local a,b={text='abc'},{text='def'}
local total=V.estimateEncodedBytes(a)+V.estimateEncodedBytes(b)
assert(V.validateCombined({a=a,b=b},total))
assert(not V.validateCombined({a=a,b=b},total-1))
local cycle={};cycle.self=cycle
assert(not V.validateCombined({peer=cycle}))
local db={['ConspiracyFiles.Generated.G2']={canonical=a},['ConspiracyFiles.AddressBook.Muldraugh']={canonical=b},['ConspiracyFiles.DeadAir']={canonical={legacy=true}}}
local md={['ConspiracyFiles.ClueMarkers']={schema=1,records={}}}
ModData={get=function(k) return db[k] end};getPlayer=function() return {getModData=function() return md end} end
local B=require('ConspiracyFiles/SaveBudget')
assert(B.check('generated',a))
local saved=db['ConspiracyFiles.Generated.G2'].canonical
-- Whichever subsystem writes, a large existing peer must count.
md['ConspiracyFiles.ClueMarkers']={payload=string.rep('x',500000)}
assert(not B.check('generated',a));assert(not B.check('addresses',b))
md['ConspiracyFiles.ClueMarkers']=nil
db['ConspiracyFiles.AddressBook.Muldraugh'].canonical={payload=string.rep('x',500000)}
assert(not B.check('markers',{schema=1,records={}}))
assert(db['ConspiracyFiles.Generated.G2'].canonical==saved,'budget guard never mutates roots')
-- Replacing the large root counts the replacement, not both versions.
assert(B.check('addresses',b))
print('PASS aggregate save budget: exact boundary, unsafe peers, all writer directions, replacement accounting, no mutations')

db['ConspiracyFiles.AddressBook.Muldraugh'].canonical=b
local oldCampaign={payload=string.rep('x',500000)}
db['ConspiracyFiles.Generated.G2']={canonical=a,campaign=oldCampaign}
assert(not B.check('markers',{}),'campaign bytes counted for other writers')
assert(B.check('generatedCampaign',{small=true}),'campaign replacement excludes old active bytes')
db['ConspiracyFiles.Generated.G2'].canonical={payload=string.rep('x',500000)}
assert(not B.check('generatedCampaign',{small=true}),'retained fallback bytes still counted')
print('PASS active campaign and retained fallback budget accounting')

db['ConspiracyFiles.Generated.G2']={canonical=a}
db['ConspiracyFiles.IdentityObservations']={canonical={payload=string.rep('x',500000)}}
assert(not B.check('generatedCampaign',{small=true}),'identity observations count for case writes')
assert(not B.check('markers',{}),'identity observations count for marker writes')
assert(B.check('identities',{canonical={schema=1,records={}}}),'identity replacement excludes old root')
print('PASS identity observations shared budget accounting')
db['ConspiracyFiles.IdentityObservations']=nil
db['ConspiracyFiles.KeyConnections']={canonical={payload=string.rep('x',500000)}}
assert(not B.check('generatedCampaign',{small=true}))
assert(not B.check('identities',{canonical={schema=1,records={}}}))
assert(B.check('keyConnections',{canonical={schema=1}}))
db['ConspiracyFiles.KeyConnections']={canonical=cycle}
assert(not B.check('markers',{}),'unsafe key observation peers reject other writes')
print('PASS key connections shared budget accounting')
