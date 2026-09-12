local f=assert(io.open('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua','r'));local src=f:read('*a');f:close()
local a=assert(src:find('function UI.rememberWindow(',1,true));local b=assert(src:find('function Window:close()',a,true))
local md={};local ready=false;local opens=0;local removed=0;local UI={}
local env={UI=UI,type=type,SECTIONS={journal=true,evidence=true,places=true},getPlayer=function() return {getModData=function() return md end} end,state=function() return ready and {} end}
local chunk=assert(loadstring(src:sub(a,b-1)));setfenv(chunk,env);chunk()
UI.open=function(section) opens=opens+1;UI.notebook={section=section,removeFromUIManager=function() removed=removed+1 end} end
local w={x=50,y=70,width=750,height=600,section='evidence'}
UI.rememberWindow(w,true);assert(md.ConspiracyFilesUI.isOpen and md.ConspiracyFilesUI.x==50)
local original=md.ConspiracyFilesUI;UI.rememberWindow(w,true);assert(md.ConspiracyFilesUI==original,'unchanged frames do not rewrite preferences')
w.x=90;UI.rememberWindow(w,true);assert(md.ConspiracyFilesUI.x==90 and original.x==50)
UI.resetWindowRestore();UI.restoreWindow();assert(opens==0 and UI.restorePending)
ready=true;UI.restoreWindow();assert(opens==1 and UI.notebook.section=='evidence' and not UI.restorePending)
UI.restoreWindow();assert(opens==1)
UI.rememberWindow(w,false);UI.resetWindowRestore();UI.restoreWindow();assert(opens==1 and not md.ConspiracyFilesUI.isOpen and removed==1)
-- Switching to another save does not reuse the previous window geometry.
md={};UI.resetWindowRestore();UI.restoreWindow();assert(UI.geometry==nil and opens==1)
UI.probeState={};UI.rememberWindow(w,true);assert(md.ConspiracyFilesUI==nil)
-- The third index has to survive a reload like the other two. Remembering it
-- as "journal" would quietly drop the player back into a view they left.
w.section='places';UI.probeState=nil;md={};UI.rememberWindow(w,true)
assert(md.ConspiracyFilesUI.section=='places',tostring(md.ConspiracyFilesUI.section))
UI.resetWindowRestore();UI.restoreWindow();assert(UI.notebook.section=='places')
w.section='nonsense';UI.rememberWindow(w,true);assert(md.ConspiracyFilesUI.section=='journal')
print('PASS notebook memory: move while open, stable frames, deferred restore once, closed preference, cross-save isolation, probe exclusion')
