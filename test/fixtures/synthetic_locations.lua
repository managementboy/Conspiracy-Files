-- Invented coordinates and names for offline tests. Never vanilla map data.
local c={revision="synthetic-catalog-1",locations={}}
for i=1,12 do
    c.locations[i]={id="synthetic-site-"..string.format("%02d",i),name="Synthetic storage site "..i,areaId="synthetic-area-"..i,
        mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",bounds={x1=i*100,y1=0,x2=i*100+8,y2=8,z=0},
        source={kind="synthetic",reference="Invented offline fixture; not a Muldraugh location"},paperStorage="observed",containerTypes={"shelves"},excluded=false}
end
return c
