from pathlib import Path
root = Path(__file__).resolve().parents[1]
source = (root / "mod/common/media/lua/shared/ConspiracyFiles/Generated/PlaceNames.lua").read_text(encoding="utf-8")
path = root / "mod/common/media/lua/client/ConspiracyFiles/Notebook.lua"
text = path.read_text(encoding="utf-8")
start = text.index("local PlaceNames=(function()")
end = text.index("-- END generated PlaceNames hot-load copy.", start)
text = text[:start] + "local PlaceNames=(function()\n" + source + "end)()\n" + text[end:]
path.write_text(text, encoding="utf-8")
