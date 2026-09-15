---
title: "xpAwards"
source: "https://pzwiki.net/wiki/XpAward"
source_revision: "https://pzwiki.net/w/index.php?title=XpAward&oldid=1254855"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 01:25."
retrieved: "2026-09-15T11:39:54.387Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 0
---

# xpAwards

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.5.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](xpAwards.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

The`xpAward` specificies the experience points awarded for crafting the recipe for one or more skills. The parameter should be formated this way:



```text
-- a single skill
xpAward = <skill name>:<xp amount>,

-- multiple skills
xpAward = <skill1 name>:<xp amount>;<skill2 name>:<xp amount>,format
```



For the list of skills used in vanilla crafts, see [Available skills](craftRecipe.md#Available_skills).

<a id="Example"></a>

## Example



```text
xpAward = Blacksmith:10;Tailoring:5,
```



Retrieved from "[https://pzwiki.net/w/index.php?title=XpAward&oldid=1254855](xpAwards.md)"
