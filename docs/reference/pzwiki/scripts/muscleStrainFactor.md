---
title: "muscleStrainFactor"
source: "https://pzwiki.net/wiki/MuscleStrainFactor"
source_revision: "https://pzwiki.net/w/index.php?title=MuscleStrainFactor&oldid=1252983"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 00:51."
retrieved: "2026-09-15T11:42:24.455Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 0
---

# muscleStrainFactor

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.8.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](muscleStrainFactor.md) (Create account)

This parameter should be used alongside [muscleStrainSkill](muscleStrainSkill.md) and [muscleStrainParts](muscleStrainParts.md).

This article may have claims which require verification.

Editors should verify the article's current content and, while adding content, check new information. [Edit](muscleStrainFactor.md) (Create account)

Main article: [timedAction (scripts)](timedAction_scripts.md)

The`muscleStrainFactor` parameter is used to define the muscle strain generated during a timed action. It is defined by a number that represents the muscle strain amount added at the end of the action. To use a muscle strain factor in a timed action, use the following format:



```text
muscleStrainFactor = <number>,
```



This is unverified but the number likely needs to be between 0 and 1, where 0 is no strain and 1 is maximum strain.

<a id="Example"></a>

## Example



```text
muscleStrainFactor = 0.1,
```



Retrieved from "[https://pzwiki.net/w/index.php?title=MuscleStrainFactor&oldid=1252983](muscleStrainFactor.md)"
