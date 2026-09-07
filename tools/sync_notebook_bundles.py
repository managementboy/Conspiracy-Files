import io
from pathlib import Path
root = Path(__file__).resolve().parents[1]
lua = root / "mod/common/media/lua"
p = lua / "client/ConspiracyFiles/Notebook.lua"
# Read and write with newline="" so line endings survive. Path.read_text /
# write_text translate newlines, which silently rewrote the whole of
# Notebook.lua from LF to CRLF on Windows and produced a full-file diff even
# when no bundle content had changed.
def slurp(path): 
    with io.open(path, "r", encoding="utf-8", newline="") as handle: return handle.read()
def spit(path, text):
    with io.open(path, "w", encoding="utf-8", newline="") as handle: handle.write(text)
s = slurp(p)
# Bundled sources are LF while Notebook.lua is CRLF. Embedding raw LF text into
# a CRLF host produced a mixed file, which is why this script rewrote every line
# even when no bundle content had changed. Normalise to the host file's endings.
HOST_NL = chr(13) + chr(10) if (chr(13) + chr(10)) in s else chr(10)
def read(name):
    text = slurp(lua / name).replace(chr(13) + chr(10), chr(10))
    return text.replace(chr(10), HOST_NL)

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
spit(p, s)
