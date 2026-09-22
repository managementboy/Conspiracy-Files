# Fixed vanilla container index

This directory rebuilds the compact fixed-container catalogue used by generated
case placement. It is an offline build tool: it reads the installed vanilla map
and tile definitions and never opens or changes a save.

The checked-in Build 42.20 payload contains 240,059 container signatures for
8,908 buildings and is 3,836,309 bytes. Each signature contains only building
ID, coordinate, sprite, container type and room. Object and container indexes
are intentionally absent because those are live-world facts.

## Inputs and provenance

- Project Zomboid's installed `media/maps/Muldraugh, KY` POT aggregate;
- the installed `media/*.tiles.txt` definitions, used to identify container
  sprites and their container types;
- `dev/addresses/world1.tsv`, the repository's full 9,978-building census used
  to retain the same stable BuildingDef IDs as nearby-location discovery.

`42.20` is deliberate. It is the version string returned by the Build 42.20.4
map API and recorded in `world1.tsv`; runtime matching is exact. A different
reported map/build pair does not use this payload.

The exporter indexes containers inside rooms and fixed postboxes within the
same 12-tile building band used by runtime placement. Vehicles, bodies, zombies
and arbitrary outdoor objects are not static index data.

## Rebuild on Windows

The commands below assume the same local tool locations used for the current
export. Substitute another JDK 25+, Python 3, or PZ install path as needed.

```powershell
$pz = 'C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid'
$jdk = 'C:\Users\elkin.fricke\AppData\Local\Programs\Zulu\zulu25.36.205-ca-jdk25.0.4.1-win_x64'
$work = Join-Path $env:TEMP 'cf-fixed-containers-42.20.tsv'

New-Item -ItemType Directory -Force tools\fixed-containers\.build | Out-Null
& "$jdk\bin\javac.exe" -cp "$pz\projectzomboid.jar" -d tools\fixed-containers\.build tools\fixed-containers\Export.java
& "$jdk\bin\java.exe" -cp "tools\fixed-containers\.build;$pz\projectzomboid.jar" Export `
  "$pz\media" "$pz\media\maps\Muldraugh, KY" 'Muldraugh, KY' '42.20' `
  dev\addresses\world1.tsv $work
python tools\fixed-containers\build.py --input $work `
  --output mod\common\media\lua\shared\ConspiracyFiles\Generated\FixedContainerIndexData.lua
```

The TSV has a row count and SHA-256 footer. `build.py` refuses incomplete or
changed input, sorts dictionaries/buildings/rows deterministically, and writes
the hash into the derived Lua file. Repeating the commands against unchanged
inputs must produce an identical payload.

After rebuilding, run:

```powershell
lua5.1 test\fixed_container_index.lua
lua5.1 test\fixed_container_data.lua
bash tools/kahlua/run.sh --parse-all
```

Then perform native acceptance in a fresh game: confirm an indexed target waits
while unloaded, resolves to the exact live furniture when loaded, and refuses a
container already searched or currently open in the loot UI.
