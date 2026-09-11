-- Pure viewport layout for map clue labels.
local M={}

local function clamp(value,low,high)
 if high<low then return low end
 if value<low then return low end
 if value>high then return high end
 return value
end

local function trimToWidth(text,width,measure)
 if measure(text)<=width then return text end
 local ellipsis="..."
 if measure(ellipsis)>width then return "" end
 local cut=#text
 while cut>0 do
  local candidate=text:sub(1,cut)..ellipsis
  if measure(candidate)<=width then return candidate end
  cut=cut-1
  while cut>0 and text:byte(cut)>=128 and text:byte(cut)<192 do cut=cut-1 end
  if cut>0 and text:byte(cut)>=192 then cut=cut-1 end
 end
 return ellipsis
end

-- labels are ordered {number=...,title=...,floor=...}; returns visible draw entries.
-- How close two markers may land on screen before their labels share one
-- stacked list, in pixels. Vertical is roughly a label's height; horizontal is
-- wider, because a label runs to the right of its marker and a neighbour to the
-- right is what it would print over.
M.CLUSTER_X=140
M.CLUSTER_Y=24
function M.layout(labels,pointX,pointY,bounds,lineHeight,measure)
 local availableRows=math.max(0,math.floor((bounds.bottom-bounds.top)/lineHeight))
 local count=math.min(#labels,availableRows)
 local firstY=clamp(pointY-8,bounds.top,bounds.bottom-count*lineHeight)
 local requestedX=pointX+9
 local mandatory=0
 for i=1,count do
  local label=labels[i]
  local suffix=label.floor~=0 and " (floor "..label.floor..")" or ""
  mandatory=math.max(mandatory,measure("#"..label.number.." "..suffix))
 end
 -- Reserve room for the immutable identifier and a readable title before shifting left.
 local targetWidth=math.min(bounds.right-bounds.left,mandatory+120)
 local labelX=clamp(requestedX,bounds.left,bounds.right-targetWidth)
 local width=bounds.right-labelX
 local out={}
 for i=1,count do
  local label=labels[i]
  local prefix="#"..label.number.." "
  local suffix=label.floor~=0 and " (floor "..label.floor..")" or ""
  local fixed=prefix..suffix
  local text
  if measure(fixed)<=width then
   text=prefix..trimToWidth(label.title,width-measure(fixed),measure)..suffix
  else
   -- This only occurs in a viewport too narrow for the required identifiers.
   text=trimToWidth(fixed,width,measure)
  end
  out[#out+1]={text=text,x=labelX,y=firstY+(i-1)*lineHeight}
 end
 return out
end

return M
