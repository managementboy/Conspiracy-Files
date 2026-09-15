# Coverage and limitations

- Captured article conversions: **246**.
- Category inventories: **9**.
- Preserved source code blocks: **649**.
- Preserved tables: **84**, totaling **2939** source rows including headers.
- Local wiki image files: **118**.
- Unique unresolved wiki article targets: **454**.

## What “complete” means

Each collected article contains its technical body, tables and code rather than a summary. This is a substantial first library release, not a claim to mirror every descendant of every PZwiki category. Category and article links can lead to hundreds of individual properties, gameplay entries and further subcategories. Exact unresolved targets are recorded in backlog.json; they are not silently treated as collected.

## Category counts

| Category | Files |
| --- | --- |
| assets-and-animation | 17 |
| categories | 9 |
| foundations | 29 |
| java | 2 |
| lua-api | 117 |
| mapping | 33 |
| scripts | 46 |
| translations | 2 |

## Known source gaps

Some attempted titles have no article text and are excluded from the reference count. They appear below and in backlog.json. Source entries explicitly marked incomplete remain incomplete in the local files. External API sites, GitHub, forums, Discord, videos and downloads were not crawled. No external-only documentation is claimed as available.

- `Console.txt` — missing source page.
- `ModData` — missing source page.
- `ModData (Lua)` — missing source page.
- `BlendWhiteList (scripts)` — missing source page.
- `Categories (scripts)` — missing source page.
- `Character (scripts)` — missing source page.
- `Option (scripts)` — missing source page.
- `Properties (scripts)` — missing source page.
- `Timed actions (scripts)` — missing source page.

## Verification performed

All captured code blocks were compared against the generated Markdown. Counts and content hashes are recorded in manifest.json. Local document/image targets and explicit heading anchors are checked during assembly. The checks cover extraction and navigation, not game execution or technical accuracy.

## Next collection passes

Use backlog.json to select further technical dependencies. Prioritize documentation referenced by the mod being implemented, then remaining script properties, Lua event/object members, UI methods and specialist subcategories. Exclude unrelated gameplay material unless a concrete programming task needs it. Re-check revisions and version banners rather than assuming recently edited pages target the current build.
