---
title: "muscleStrainParts"
source: "https://pzwiki.net/wiki/MuscleStrainParts"
source_revision: "https://pzwiki.net/w/index.php?title=MuscleStrainParts&oldid=1252987"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 00:51."
retrieved: "2026-09-15T11:42:24.813Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 2
source_tables: 0
---

# muscleStrainParts

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.8.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](muscleStrainParts.md) (Create account)

This parameter should be used alongside [muscleStrainFactor](muscleStrainFactor.md) and [muscleStrainSkill](muscleStrainSkill.md).

Main article: [timedAction (scripts)](timedAction_scripts.md)

The`muscleStrainParts` parameter is used to define the body parts that are affected by muscle strain during a timed action. It is defined by a list of body part names. To use muscle strain parts in a timed action, use the following format:



```text
muscleStrainParts = <part1>;<part2>;<part3>,
```



The body parts used are the ones defined in the enumeration of BodyPartType.

<a id="Example"></a>

## Example



```text
muscleStrainParts = Hand_R;ForeArm_R;UpperArm_R,
```



Retrieved from "[https://pzwiki.net/w/index.php?title=MuscleStrainParts&oldid=1252987](muscleStrainParts.md)"
