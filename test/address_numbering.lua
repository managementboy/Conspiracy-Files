-- Whole-map house numbers, offline tool (AD-10 steps B and C):
-- tools/addresses/lib.lua and build.lua on small synthetic streets, regions and
-- exports. Run from the repo root: lua5.1 test/address_numbering.lua
local L=dofile("tools/addresses/lib.lua")

local function street(name,width,pts)
    local out={'  <street name="'..name..'" width="'..width..'">\n    <points>\n'}
    for _,p in ipairs(pts) do out[#out+1]='      <point x="'..p[1]..'" y="'..p[2]..'"/>\n' end
    out[#out+1]="    </points>\n  </street>\n"
    return table.concat(out)
end
local function xml(list) return '<streets version="1">\n'..table.concat(list)..'</streets>\n' end
local function regionsText(list)
    local out={"regions = {\n"}
    for _,r in ipairs(list) do
        out[#out+1]=string.format('  { name = "%s", type = "%s", x = %d, y = %d, z = 0, width = %d, height = %d, },\n',
            r[1],r.type or "Region",r[2],r[3],r[4],r[5])
    end
    out[#out+1]='--  { name = "Ghost", type = "Region", x = 0, y = 0, z = 0, width = 99999, height = 99999, },\n}\n'
    return table.concat(out)
end
local nextId=1000000000000000   -- stays below 2^53, so "%d" is exact
local function house(cx,cy,opts)
    opts=opts or {}
    nextId=nextId+1
    local id=opts.id or string.format("%d",nextId)
    return {id=id,x=cx-2,y=cy-2,x2=cx+3,y2=cy+3,basement=opts.basement or false,
        roomCount=opts.roomCount or 2,rooms=opts.rooms or {"bedroom","kitchen"}}
end
local function run(streetList,regionList,buildings)
    local result=L.number(L.parseStreets(xml(streetList)),L.parseRegions(regionsText(regionList)),buildings)
    local byId={}
    for _,a in ipairs(result.areas) do
        for _,r in ipairs(a.records) do byId[r.id]={label=r.label,area=a,number=r.number} end
    end
    return result,byId
end
local function areaNamed(result,name)
    for _,a in ipairs(result.areas) do if a.name==name then return a end end
end

-- 1. Parity on horizontal, vertical, curved and reversed roads -----------------
do
    local b={
        hn=house(100,-10), hs=house(100,10),
        rn=house(100,990), rs=house(100,1010),
        ve=house(1010,100), vw=house(990,100),
        re=house(2010,100), rw=house(1990,100),
        cn=house(3050,-5), ce=house(3120,60), cw=house(3095,60),
    }
    local list={}
    for _,v in pairs(b) do list[#list+1]=v end
    local _,byId=run({
        street("H St",6,{{0,0},{200,0}}),
        street("HR St",6,{{200,1000},{0,1000}}),
        street("V St",6,{{1000,0},{1000,200}}),
        street("VR St",6,{{2000,200},{2000,0}}),
        street("Curve St",6,{{3000,0},{3100,10},{3110,110}}),
    },{{"P",-5000,-5000,20000,20000}},list)
    local function odd(k) local r=assert(byId[b[k].id],k.." numbered"); return r.number%2==1,r.label end
    for k,want in pairs({hn=true,hs=false,rn=true,rs=false,ve=true,vw=false,re=true,rw=false,cn=true,ce=true,cw=false}) do
        local got,label=odd(k)
        assert(got==want,"parity "..k..": "..label)
    end
    assert(byId[b.hn.id].label:find(" H St$") and byId[b.rn.id].label:find(" HR St$"))
    assert(byId[b.ce.id].label:find(" Curve St$") and byId[b.cn.id].label:find(" Curve St$"))
end

-- 2. Matching and parity are AddressIndex.lua's, unchanged ---------------------
do
    package.path="mod/common/media/lua/shared/?.lua;"..package.path
    local Core=require("ConspiracyFiles/Generated/AddressIndex")
    local roads=assert(loadfile("mod/common/media/lua/shared/ConspiracyFiles/Generated/AddressRoads.lua"))()
    local pieces={}
    for _,r in ipairs(roads) do
        pieces[#pieces+1]={poly={name=r.street,index=1},piece=r.block,segments=r.segments}
    end
    local nearby=L.segmentIndex(pieces)
    local seed,buildings=12345,{}
    local function rnd(n) seed=(seed*1103515245+12345)%2147483648; return seed%n end
    for i=1,400 do
        local x,y=10000+rnd(1500),9000+rnd(2000)
        buildings[#buildings+1]={id=string.format("b%04d",i),x=x,y=y,x2=x+1+rnd(12),y2=y+1+rnd(12)}
    end
    local old
    local step=Core.build(buildings,roads,function(r) old=r end)
    while not step() do end
    local oldById={}
    for _,r in ipairs(old) do oldById[r.id]=r end
    local compared=0
    for _,b in ipairs(buildings) do
        local m=L.match(nearby,b)
        local o=oldById[b.id]
        assert((m~=nil)==(o~=nil),"same buildings matched as AddressIndex: "..b.id)
        if m then
            local n,name=o.label:match("^(%d+) (.+)$")
            n=tonumber(n)
            assert(name==m.piece.poly.name,"same street as AddressIndex for "..b.id)
            assert(math.floor(n/100)==m.piece.piece,"same block as AddressIndex for "..b.id)
            assert((n%2==1)==m.odd,"same side as AddressIndex for "..b.id)
            compared=compared+1
        end
    end
    assert(compared>100,"enough trial matches compared: "..compared)
end

-- 3. Towns: blocks, numbering away from the baseline, same name in two towns ---
local function town(dx,dy,reverseOak)
    local oak={{500+dx,500+dy},{500+dx,100+dy}}
    if reverseOak then oak={oak[2],oak[1]} end
    return {
        street("Main St",8,{{100+dx,500+dy},{900+dx,500+dy}}),
        street("Oak St",6,oak),
        street("Elm St",6,{{400+dx,300+dy},{600+dx,300+dy}}),
    }
end
local function townHouses(dx,dy)
    return {
        oak1=house(510+dx,450+dy), oak2=house(510+dx,350+dy), oak3=house(510+dx,250+dy), oakW=house(490+dx,450+dy),
        mainW=house(300+dx,490+dy), mainE=house(700+dx,510+dy),
    }
end
do
    local A,B=townHouses(0,0),townHouses(2000,0)
    local list={}
    for _,t in ipairs({A,B}) do for _,v in pairs(t) do list[#list+1]=v end end
    local streets={}
    for _,s in ipairs(town(0,0,false)) do streets[#streets+1]=s end
    for _,s in ipairs(town(2000,0,true)) do streets[#streets+1]=s end
    local result,byId=run(streets,{{"Alpha",0,0,1000,1000},{"Beta",2000,0,1000,1000}},list)
    for _,t in ipairs({A,B}) do
        local function lab(k) return assert(byId[t[k].id],k).label end
        assert(lab("oak1")=="101 Oak St","nearest the baseline first: "..lab("oak1"))
        assert(lab("oak2")=="103 Oak St",lab("oak2"))
        assert(lab("oak3")=="201 Oak St","block 2 past Elm St: "..lab("oak3"))
        assert(lab("oakW")=="102 Oak St",lab("oakW"))
        assert(lab("mainW")=="101 Main St","Main St cut at Oak St, block 1 west: "..lab("mainW"))
        assert(lab("mainE")=="202 Main St",lab("mainE"))
    end
    -- same labels in two towns, kept apart by area
    local alpha,beta=areaNamed(result,"Alpha"),areaNamed(result,"Beta")
    assert(byId[A.oak1.id].area==alpha and byId[B.oak1.id].area==beta and alpha~=beta)
    assert(alpha.town==1 and beta.town==1)
    assert(alpha.baselineNames[1]=="Main St" and alpha.rule=="Main St rule")
    assert(next(result.stats.filtered)==nil and result.stats.considered==12)
end

-- 4. T junction: a side street ending short of the centre line still cuts ------
do
    local h1,h2=house(150,90),house(250,90)
    local _,byId=run({
        street("Through Rd",8,{{0,100},{400,100}}),
        street("Side Rd",6,{{200,105},{200,300}}),   -- ends 5 tiles off: width/2+3=7
        street("Far Rd",6,{{300,120},{300,300}}),    -- ends 20 tiles off: no cut
    },{{"T",0,0,1000,1000}},{h1,h2})
    assert(byId[h1.id].label=="101 Through Rd",byId[h1.id].label)
    assert(byId[h2.id].label=="201 Through Rd","cut at the T junction: "..byId[h2.id].label)
end

-- 5. Baseline choice ------------------------------------------------------------
do
    assert(L.isMainSt("Main St") and L.isMainSt("N Main St") and L.isMainSt("South Main St") and L.isMainSt("W Main St"))
    assert(not L.isMainSt("Mainslick Road") and not L.isMainSt("Main Street") and not L.isMainSt("Old Main St"))
    assert(L.isFirstSt("1st St") and L.isFirstSt("S 1st St") and L.isFirstSt("First St"))
    assert(not L.isFirstSt("1st Ave") and not L.isFirstSt("First Class St"))
    assert(L.isHighway("KY-79") and L.isHighway("Dixie Highway (Route 31W)") and L.isHighway("Brandenburg Bypass"))
    assert(not L.isHighway("Parkway Ave") and not L.isHighway("Pike St"))
    assert(L.isRailway("Indiana Railroad (Brandenburg - Indiana)") and L.isRailway("Old Muldraugh Station Branch Line"))
    assert(not L.isRailway("Railway St") and not L.isRailway("Back Rail Lane"))
    local result=run({
        -- Gamma: 1st St beats a longer ordinary street and a highway
        street("1st St",6,{{100,2500},{300,2500}}),
        street("Long Road",6,{{100,2600},{900,2600}}),
        street("KY-79",10,{{0,2800},{999,2800}}),
        -- Delta: longest ordinary street; highway and railway are longer
        street("KY-60",10,{{2000,2950},{2999,2950}}),
        street("Indiana Railroad (A - B)",4,{{2000,2050},{2999,2050}}),
        street("Short Lane",6,{{2100,2500},{2200,2500}}),
        street("Mainslick Road",6,{{2100,2300},{2900,2300}}),
        -- Epsilon: highways only
        street("KY-61",10,{{4000,500},{4999,500}}),
        -- Zeta: Main St beats 1st St and a longer street
        street("W Main St",6,{{6100,500},{6200,500}}),
        street("1st St",6,{{6100,700},{6300,700}}),
        street("Very Long Road",6,{{6000,900},{6999,900}}),
    },{{"Gamma",0,2000,1000,1000},{"Delta",2000,2000,1000,1000},{"Epsilon",4000,0,1000,1000},{"Zeta",6000,0,1000,1000}},{})
    local g,d,e,z=areaNamed(result,"Gamma"),areaNamed(result,"Delta"),areaNamed(result,"Epsilon"),areaNamed(result,"Zeta")
    assert(g.baselineNames[1]=="1st St" and #g.baselineNames==1 and g.rule=="1st St rule",g.rule)
    assert(d.baselineNames[1]=="Mainslick Road" and d.rule:find("^longest street"),d.rule)
    assert(#e.baselineNames==0,"a highway is never a baseline")
    assert(z.baselineNames[1]=="W Main St" and z.rule=="Main St rule")
end

-- 6. Overlapping area boxes: the smaller total area wins ------------------------
do
    local areas=L.parseRegions(regionsText({
        {"Big",0,0,600,600},{"Big",600,0,600,600},
        {"Small",500,0,200,200},{"Small",500,0,200,200},   -- duplicate box counts once
        {"Shop",510,10,5,5,type="BuildingName"},
        {"Twin1",3000,0,100,100},{"Twin2",3050,0,100,100},
    }))
    local function name(x,y) local i=L.areaAt(areas,x,y); return i and areas[i].name end
    assert(#areas==4,"BuildingName entries and comments are not areas")
    for _,a in ipairs(areas) do if a.name=="Small" then assert(a.area==40000,"union area "..a.area) end end
    assert(name(550,100)=="Small" and name(100,100)=="Big" and name(650,300)=="Big")
    assert(name(3060,50)=="Twin1","equal areas: name order")
    assert(name(1200,0)==nil,"boxes are half-open")
end

-- 7. Filters, overflow, string ids ---------------------------------------------
do
    local b={
        basement=house(100,-10,{basement=true}),
        shed=house(110,-10,{rooms={"shed"}}),
        garage=house(120,-10,{rooms={"garage","garagestorage"}}),
        unnamed=house(130,-10,{rooms={}}),
        empty=house(140,-10,{roomCount=0,rooms={}}),
        mixed=house(150,-10,{rooms={"garage","kitchen"}}),
        big1=house(160,-10,{id="9007319513825330"}),
        big2=house(170,-10,{id="9007319513825331"}),
    }
    local list={}
    for _,v in pairs(b) do list[#list+1]=v end
    for i=1,60 do list[#list+1]=house(30*i,4990) end
    local result,byId=run({street("H St",6,{{0,0},{200,0}}),street("Row St",6,{{0,5000},{2000,5000}})},
        {{"P",-5000,-5000,20000,20000}},list)
    for _,k in ipairs({"basement","shed","garage","unnamed","empty"}) do assert(not byId[b[k].id],k.." gets no number") end
    assert(byId[b.mixed.id],"a garage with a kitchen is a building")
    assert(byId["9007319513825330"] and byId["9007319513825331"],"16-digit ids stay distinct strings")
    local s=result.stats.filtered
    assert(s.basement==1 and s["garage/shed only"]==3 and s["no rooms"]==1)
    local p=areaNamed(result,"P")
    assert(p.overflow==11,"overflow past 49 reported: "..p.overflow)
    local labels,rows={},0
    for _,r in ipairs(p.records) do
        assert(type(r.id)=="string")
        assert(not labels[r.label],"duplicate "..r.label); labels[r.label]=true
        if r.street=="Row St" then rows=rows+1; assert(r.number>=101 and r.number<=197) end
    end
    assert(rows==49)
    -- ids survive the export parser as strings, beyond 2^53
    local header,parsed=L.parseExport("# game 42.20.4\n# map Muldraugh, KY\n# count 2\n# columns id x y x2 y2 basement roomCount roomNames\n"
        .."9007319513825330\t10\t20\t15\t25\t0\t2\tbedroom,kitchen\n9007319513825331\t10\t20\t15\t25\t1\t0\t\n")
    assert(header.game=="42.20.4" and header.map=="Muldraugh, KY" and header.count=="2")
    assert(parsed[1].id=="9007319513825330" and parsed[2].id=="9007319513825331" and type(parsed[1].id)=="string")
    assert(parsed[1].rooms[2]=="kitchen" and parsed[2].basement and #parsed[2].rooms==0)
end

-- 8. Outside the named areas: networks, highways, no town name ------------------
do
    local farm,barn,hwy,lake,lost=house(5100,-10),house(5510,300),house(5200,-30),house(5500,5010),house(9000,9000)
    local inTown=house(500,490)
    local result,byId=run({
        street("Town Rd",6,{{100,500},{900,500}}),
        street("Farm Rd",6,{{5000,0},{6000,0}}),
        street("Barn Ln",6,{{5500,0},{5500,500}}),
        street("KY-1",10,{{5000,-40},{6000,-40}}),
        street("Lake Rd",6,{{5000,5000},{6000,5000}}),
    },{{"Town",0,0,1000,1000}},{farm,barn,hwy,lake,lost,inTown})
    local a1,a2,a3=byId[farm.id].area,byId[hwy.id].area,byId[lake.id].area
    assert(byId[inTown.id].area.town==1)
    assert(a1.town==0 and a1.name=="" and a3.town==0,"unnamed areas carry no town name")
    assert(a1==byId[barn.id].area,"connected streets: one area")
    assert(a1==a2,"a highway house joins the nearest ordinary network")
    assert(byId[hwy.id].label:find(" KY%-1$"),"but keeps its highway address")
    assert(a1~=a3,"separate networks: separate areas")
    assert(a1.baselineNames[1]=="Farm Rd" and a1.near=="Town")
    assert(result.stats.outsideNoStreet==1 and not byId[lost.id])
end

-- 9. Output: loads, unique per area, deterministic, CLI byte-identical ---------
do
    local A,B=townHouses(0,0),townHouses(2000,0)
    local list={}
    for _,t in ipairs({A,B}) do for _,v in pairs(t) do list[#list+1]=v end end
    list[#list+1]=house(5100,-10,{id="9007319513825330"})
    local streets={street("Farm Rd",6,{{5000,0},{6000,0}})}
    for _,s in ipairs(town(0,0,false)) do streets[#streets+1]=s end
    for _,s in ipairs(town(2000,0,false)) do streets[#streets+1]=s end
    local regions={{"Alpha",0,0,1000,1000},{"Beta",2000,0,1000,1000}}
    local meta={game="42.20.4",map="Muldraugh, KY",streetsSha="s",regionsSha="r",exportSha="e"}
    local text=L.render(select(1,run(streets,regions,list)),meta)
    -- shuffled input, same output
    local shuffled={}
    for i=#list,1,-1 do shuffled[#shuffled+1]=list[i] end
    assert(L.render(select(1,run(streets,regions,shuffled)),meta)==text,"input order does not matter")
    assert(text:find("-- numbering revision: whole-map-1",1,true) and text:find("-- game: 42.20.4",1,true)
        and text:find("-- map: Muldraugh, KY",1,true) and text:find("-- export sha256: e",1,true))
    local book=assert(loadstring(text))()
    assert(book.revision=="whole-map-1" and book.game=="42.20.4" and book.map=="Muldraugh, KY")
    assert(book.count==13 and #book.rows==13)
    local perArea,ids,labelsSeen={},{},{}
    for _,row in ipairs(book.rows) do
        assert(type(row)=="string")
        local r=L.unpackRow(book,row)
        assert(type(r.id)=="string" and not ids[r.id]); ids[r.id]=true
        assert(r.x2>r.x and r.y2>r.y)
        perArea[r.area]=perArea[r.area] or {}
        assert(not perArea[r.area][r.label],"label unique per area"); perArea[r.area][r.label]=true
        labelsSeen[r.label]=(labelsSeen[r.label] or 0)+1
    end
    assert(ids["9007319513825330"])
    assert(labelsSeen["101 Oak St"]==2,"same label in two towns")
    local unnamed
    for _,a in ipairs(book.areas) do if a.town==0 then unnamed=a end end
    assert(unnamed and unnamed.name=="" and unnamed.near=="Beta" and unnamed.baseline[1]=="Farm Rd")
    -- chunked rows: more than CHUNK rows still load as one flat list
    local chunk=L.CHUNK; L.CHUNK=5
    local small=assert(loadstring(L.render(select(1,run(streets,regions,list)),meta)))()
    L.CHUNK=chunk
    assert(#small.rows==13 and small.rows[13]==book.rows[13])

    -- command line, twice, byte-identical
    local function tmp(content)
        local p=os.tmpname(); local f=assert(io.open(p,"wb")); f:write(content); f:close(); return p
    end
    local rows={}
    for _,b in ipairs(list) do
        rows[#rows+1]=table.concat({b.id,b.x,b.y,b.x2,b.y2,b.basement and 1 or 0,b.roomCount,table.concat(b.rooms,",")},"\t")
    end
    rows[#rows+1]="9007000000000001\t5200\t-12\t5205\t-7\t0\t1\tshed"
    local exportPath=tmp("# game 42.20.4\n# map Muldraugh, KY\n# count "..#rows.."\n# columns id x y x2 y2 basement roomCount roomNames\n"..table.concat(rows,"\n").."\n")
    local streetsPath,regionsPath=tmp(xml(streets)),tmp(regionsText(regions))
    local outs={}
    for i=1,2 do
        local out,rep=os.tmpname(),os.tmpname()
        local p=io.popen("lua5.1 tools/addresses/build.lua --export "..exportPath.." --streets "..streetsPath
            .." --regions "..regionsPath.." --out "..out.." --report "..rep.." 2>&1")
        local said=p:read("*a"); p:close()
        assert(said:find("13 numbered",1,true),said)
        outs[i]={L.readAll(out),L.readAll(rep)}
        os.remove(out); os.remove(rep)
    end
    assert(outs[1][1]==outs[2][1] and outs[1][2]==outs[2][2],"byte-identical output")
    local cliBook=assert(loadstring(outs[1][1]))()
    assert(cliBook.count==13 and cliBook.streetsSha256:match("^%x+$") and #cliBook.streetsSha256==64)
    assert(outs[1][2]:find("| Alpha | Main St | Main St rule | 6 | 6 | 0 | 0 |",1,true),outs[1][2])
    assert(outs[1][2]:find("unnamed area 1 near Beta | Farm Rd",1,true))
    assert(outs[1][2]:find("garage/shed only: 1",1,true))
    os.remove(exportPath); os.remove(streetsPath); os.remove(regionsPath)
end

print("address_numbering: ok")
