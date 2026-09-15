# PZwiki offline modding reference

A wiki-only reference library for AI-assisted Project Zomboid mod development, collected starting at the PZwiki Modding article. **246 complete article conversions**, 9 category inventories, 84 tables, and 649 source code blocks are stored locally. There are 118 locally saved wiki images.

## Start here

1. Read [AI_READING_GUIDE.md](AI_READING_GUIDE.md) for choosing the right documentation and handling version differences.
2. Use [INDEX.md](INDEX.md) or the category indexes to find references.
3. Read [COVERAGE.md](COVERAGE.md) for collection boundaries, source gaps, and pending dependencies.
4. Consult [ATTRIBUTION.md](ATTRIBUTION.md) for the source license and modifications.

## Relationship to this project

This library provides external documentation context. It does not change Conspiracy-Files architecture, scope, or accepted APIs. Repository instructions, decisions, and [verified research](../../research/README.md) retain their existing authority. In particular, collecting networking documentation does not authorize multiplayer implementation, and collecting Java documentation does not change the project's vanilla-Lua-first direction.

## Offline behavior

Article text, tables, code, and saved images are present in this directory. Links to collected pages use relative local paths. Uncollected wiki dependencies are recorded in `backlog.json`; their labels remain plain text instead of silently requiring a website visit. External destinations were not crawled and are omitted from navigation. Source URLs remain in metadata for provenance. Literal URLs inside source code are preserved as part of the example, not followed.

Some articles discuss tools, tutorials, or API resources hosted elsewhere. Their external content is not included. An offline copy of a page containing an external pointer does not provide the external reference itself.

## Refresh and verification

`manifest.json` records canonical sources, revisions, dates, content hashes, table counts, and code-block hashes. A future refresh should fetch changed source revisions, compare the full tables and code, rebuild local links, and update the coverage report. No recurring downloads are configured.

These checks establish faithful document extraction, not correctness of the wiki or compatibility of its examples with the installed game. Use the source's build warnings and project research before implementation.
