---
title: "SkillRequired"
source: "https://pzwiki.net/wiki/SkillRequired"
source_revision: "https://pzwiki.net/w/index.php?title=SkillRequired&oldid=1254477"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 01:16."
retrieved: "2026-09-15T11:39:54.770Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 0
---

# SkillRequired

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.5.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](SkillRequired.md) (Create account)

Main article: [craftRecipe](craftRecipe.md)

The`SkillRequired` parameter specifies the skill required to craft the recipe. The parameter should be formated this way:



```text
-- a single skill
skillRequired = <skill name>:<level>,

-- multiple skills
skillRequired = <skill1 name>:<level>;<skill2 name>:<level>,
```



For the list of skills used in vanilla crafts, see [Available skills](craftRecipe.md#Available_skills)

<a id="Example"></a>

## Example



```text
skillRequired = Blacksmith:3;Tailoring:2,
```



Retrieved from "[https://pzwiki.net/w/index.php?title=SkillRequired&oldid=1254477](SkillRequired.md)"
