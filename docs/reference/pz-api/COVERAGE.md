# Coverage and validation

## Captured scope

All **134** `.rst` documents from upstream commit `effa0bc0f07b2be60da80a3bc374132b95d3118c`, whose `project.json` identifies Build **42.20.4**.

| Category | Documents |
| --- | ---: |
| Script definitions, components, root files | 109 |
| Mapping and distributions | 6 |
| Java data references | 6 |
| XML | 5 |
| Translations | 2 |
| Overview and category indexes | 6 |
| **Total** | **134** |

The converted corpus contains **800 attribute entries**, **156 code examples**, **2,785 populated tables**, and **62,111 table rows including headers**. It retains **5,522 source-rendered anchors** and resolves **16,856 link occurrences** into this collection or the local PZwiki library.

## Validation

- Every committed source document has a corresponding Markdown document.
- All 156 code examples were compared against the original RST after the documented whitespace normalization. Code language tags are retained.
- All 800 Sphinx attribute definitions were accounted for.
- All 2,785 populated source tables were accounted for. The source has one additional empty table, represented by an explicit notice rather than invented data.
- Every rewritten local link and explicit section fragment was checked for an existing destination.
- The normalized RST build completed without warnings after the formatting repairs described in [ATTRIBUTION.md](ATTRIBUTION.md).
- Per-document source/output hashes and code hashes are recorded in `manifest.json`.

These are documentation integrity checks. No runtime behavior or example was tested in Project Zomboid as part of this import.

## Not captured

The separate full JavaDocs and LuaDocs sites are outside this repository snapshot. The six Java pages included here describe selected data values/enumerations, not the full Java class/method API. Game files, external tools, forum discussions, images, and source-generator submodules were not imported.

`backlog.json` records **3,382 unique unresolved destinations**, including gameplay item links and references to separate documentation sites. Their labels remain readable in the articles. This count is not a count of missing API pages: all committed RST documents in the selected source were converted.

The snapshot reflects committed upstream documentation at the recorded revision. The live documentation and its source datasets can change independently afterward. Retained "Unknown", missing-description notices, and estimated distribution chances remain source limitations, not verified project facts.
