package.path="mod/common/media/lua/shared/?.lua;"..package.path
local K=require("ConspiracyFiles/Generated/EvidenceKinds")
local expected={dispatch="Base.Note",receipt="Base.Receipt",letter="Base.LetterHandwritten",notepad="Base.Notepad",key="Base.Key1",diary="Base.Diary1",notebook="Base.Notebook",clipping="Base.Newspaper"}
local seen={};for kind,fullType in pairs(expected) do local ok,v=K.validate(kind);assert(ok and v.fullType==fullType and not seen[v.fullType]);seen[v.fullType]=true;assert(v.short~="" and v.label~="") end
assert(not K.validate("Base.Key1") and not K.get("arbitrary"),"kind names, not caller full types, select carriers")
local key=assert(K.get("key"));key.label="changed";assert(assert(K.get("key")).label=="Brass key","metadata copies are immutable to callers")
print("PASS EvidenceKinds: Build 42 carrier whitelist, distinct requested types, and arbitrary-type rejection")
