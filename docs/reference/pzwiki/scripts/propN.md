---
title: "propN"
source: "https://pzwiki.net/wiki/PropN"
source_revision: "https://pzwiki.net/w/index.php?title=PropN&oldid=1253969"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 01:08."
retrieved: "2026-09-15T11:42:25.677Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 4
source_tables: 0
---

# propN

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.8.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](propN.md) (Create account)

Main article: [timedAction (scripts)](timedAction_scripts.md)

The`prop1` and`prop2` parameters are respectively used to define the items held in the character's main and secondary hands during a timed action. By not giving the parameter, the character will not hold an item in the hand associated with the parameter. A [script item full ID](item_scripts.md), also known as the full type, is used to set the item held in the hand.

To use a prop in a timed action, use the following format:



```text
prop1 = <item name>,
prop2 = <item name>,
```



<a id="Example"></a>

## Example



```text
prop1 = Base.Hammer,
prop2 = Base.Nails,
```





```text
prop1 = Base.BaseballBat,
```





```text
prop2 = Base.RadioBlack,
```



Retrieved from "[https://pzwiki.net/w/index.php?title=PropN&oldid=1253969](propN.md)"
