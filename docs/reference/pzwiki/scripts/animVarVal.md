---
title: "animVarVal"
source: "https://pzwiki.net/wiki/AnimVarVal"
source_revision: "https://pzwiki.net/w/index.php?title=AnimVarVal&oldid=1251453"
source_last_edited: "Last modified\n\t\t         This page was last edited on 24 October 2025, at 00:20."
retrieved: "2026-09-15T11:42:23.740Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 3
source_tables: 0
---

# animVarVal

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.8.1).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](animVarVal.md) (Create account)

This parameter should be used alongside [animVarKey](animVarKey.md).

Main article: [timedAction (scripts)](timedAction_scripts.md)

The`animVarVal` parameter is used to define a specific [AnimNode](../assets-and-animation/AnimNode.md)`m_Conditions` variable value to use a specific action animation variant. To use an animation variable value in a timed action, use the following format:



```text
animVarVal = <value>,
```



<a id="Example"></a>

## Example



```text
actionAnim      = Loot,
animVarKey      = LootPosition,
animVarVal      = Low,
```



For the following [AnimNode](../assets-and-animation/AnimNode.md):



```text
<?xml version="1.0" encoding="utf-8"?>
<animNode x_extends="Loot.xml">
	<m_Name>LootHigh</m_Name>
	<m_AnimName>Bob_IdleLooting_High</m_AnimName>
	<m_Conditions />
	<m_Conditions />
	<m_Conditions>
		<m_Name>LootPosition</m_Name>
		<m_Type>STRING</m_Type>
		<m_StringValue>High</m_StringValue>
	</m_Conditions>
</animNode>
```



Retrieved from "[https://pzwiki.net/w/index.php?title=AnimVarVal&oldid=1251453](animVarVal.md)"
