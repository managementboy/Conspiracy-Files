package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Layout=require("ConspiracyFiles/MarkerLayout")
local function measure(text) return #text*8 end
local bounds={left=16,top=60,right=176,bottom=160}
local labels={{number=7,title="A deliberately very long clue title",floor=2},{number=8,title="Second",floor=2}}
local out=Layout.layout(labels,170,150,bounds,20,measure)
assert(#out==2)
assert(out[1].x>=bounds.left and out[1].x+measure(out[1].text)<=bounds.right,'right edge is bounded')
assert(out[1].y>=bounds.top and out[2].y+20<=bounds.bottom,'bottom edge is bounded')
assert(out[1].text:find('#7 ',1,true) and out[1].text:find(' (floor 2)',1,true),'number and floor survive truncation')
assert(out[1].text:find('...',1,true),'long title is truncated')
assert(out[2].text:find('#8 ',1,true) and out[2].text:find(' (floor 2)',1,true),'collocated labels retain identity')
local top=Layout.layout({{number=1,title="Top",floor=0}},30,10,bounds,20,measure)
assert(top[1].y==bounds.top,'top edge is bounded')
local crowded={}
for i=1,10 do crowded[i]={number=i,title="Clue",floor=0} end
assert(#Layout.layout(crowded,30,100,bounds,20,measure)==5,'visible rows are bounded by viewport')
local utf=Layout.layout({{number=9,title="åååååååååååååååååååå",floor=3}},170,100,bounds,20,measure)[1].text
assert(utf:find('#9 ',1,true) and utf:find(' (floor 3)',1,true),'UTF-8 truncation retains required fields')
local retained=assert(utf:match('^#9 (.-)%.%.%. %(floor 3%)$'))
assert(#retained%2==0 and retained==string.rep('å',#retained/2),'UTF-8 title contains only complete codepoints before ellipsis')
print('PASS marker layout: bounded labels, truncation, collocated rows')
