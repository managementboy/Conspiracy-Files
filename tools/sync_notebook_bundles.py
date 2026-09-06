from pathlib import Path
root = Path(__file__).resolve().parents[1]
lua = root / "mod/common/media/lua"
p = lua / "client/ConspiracyFiles/Notebook.lua"
s = p.read_text(encoding="utf-8")
def read(name): return (lua / name).read_text(encoding="utf-8")
def replace(label, body):
    global s
    a = s.index("-- BEGIN " + label + " hot-load bundle.")
    b = s.index("-- END " + label + " hot-load bundle.", a)
    s = s[:a] + "-- BEGIN " + label + " hot-load bundle.\n" + body + s[b:]
replace("address", "function UI.enableAddresses()\nlocal Core=(function()\n" + read("shared/ConspiracyFiles/Generated/AddressIndex.lua") + "\nend)()\nlocal Roads=(function()\n" + read("shared/ConspiracyFiles/Generated/AddressRoads.lua") + "\nend)()\nlocal service=(function()\n" + read("client/ConspiracyFiles/AddressMap.lua").split("\n", 2)[2] + "\nend)()\nreturn service.start()\nend\n")
replace("clue-marker", "function UI.enableClueMarkers()\nlocal markers=(function()\n" + read("client/ConspiracyFiles/ClueMarkers.lua") + "\nend)()\nreturn markers.start()\nend\n")
label="marker-colour-test"
if "-- BEGIN " + label + " hot-load bundle." not in s:
    at=s.rfind("return UI")
    assert at>=0
    s=s[:at]+"-- BEGIN " + label + " hot-load bundle.\n-- END " + label + " hot-load bundle.\n"+s[at:]
replace(label, "function UI.enableMarkerColourTest()\nlocal test=(function()\n" + read("client/ConspiracyFiles/MarkerColourTest.lua") + "\nend)()\nreturn test.start()\nend\n")
label="notebook-toolbar"
if "-- BEGIN " + label + " hot-load bundle." not in s:
    at=s.rfind("return UI")
    assert at>=0
    s=s[:at]+"-- BEGIN " + label + " hot-load bundle.\n-- END " + label + " hot-load bundle.\n"+s[at:]
toolbar=read("client/ConspiracyFiles/NotebookToolbar.lua").replace('local UI=require("ConspiracyFiles/Notebook")','local UI=ConspiracyFiles.NotebookUI')
replace(label, "function UI.enableNotebookToolbar()\nlocal toolbar=(function()\n" + toolbar + "\nend)()\nreturn toolbar.ensure()\nend\nUI.enableNotebookToolbar()\n")
p.write_text(s, encoding="utf-8")
