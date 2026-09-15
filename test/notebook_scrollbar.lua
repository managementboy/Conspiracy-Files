-- The notebook list's scroll bar must follow the window, not keep its
-- creation-time size. ISScrollingListBox:setHeight does not do this.
local f=assert(io.open('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua','r'))
local src=f:read('*a'); f:close()
assert(src:find("local bar=self.list.vscroll",1,true),"layout must reach for the list's scroll bar")
local a=assert(src:find("self.list:setHeight(height)",1,true))
local b=assert(src:find("bar:setHeight(height)",1,true))
assert(b>a,"the bar is resized after the list, in the same layout pass")
assert(src:find("bar:setX(listWidth-bar.width)",1,true),"the bar must follow the list's width too")
-- Guarded, so a mocked or future list without a vscroll cannot crash layout.
assert(src:find("if bar then",1,true),"scroll bar access must be guarded")
assert(src:find("if bar.setHeight then",1,true),"method presence must be checked")
print("PASS notebook scrollbar: resized and repositioned with the window, guarded")
