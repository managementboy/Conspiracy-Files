local f=assert(io.open('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua','r'));local src=f:read('*a');f:close()
local a=assert(src:find('function Window:layout()',1,true));local b=assert(src:find('function Window:prerender()',a,true))
local env={Window={},math=math,ipairs=ipairs,UIFont={Small=1},getTextManager=function() return {getFontHeight=function() return 16 end} end}
local chunk=assert(loadstring(src:sub(a,b-1)));setfenv(chunk,env);chunk()
local function control()
 local o={};o.setVisible=function(self,v) assert(type(v)=='boolean','native visibility must receive boolean');self.visible=v end
 for _,name in ipairs({'setX','setY','setWidth','setHeight','paginate'}) do o[name]=function() end end;return o
end
local w={width=650,height=600,titleBarHeight=function() return 20 end,resizeWidgetHeight=function() return 12 end}
for _,name in ipairs({'list','back','header','document','journal','evidence','help','contrast','closeButton'}) do w[name]=control() end
env.Window.layout(w);assert(w.list.visible and not w.back.visible and not w.document.visible)
w.detailOnly=true;env.Window.layout(w);assert(not w.list.visible and w.back.visible and w.document.visible)
w.width=1000;w.detailOnly=nil;env.Window.layout(w);assert(w.list.visible and not w.back.visible and w.document.visible)
print('PASS empty notebook layout: narrow nil selection, selected detail, wide view all pass native booleans')
