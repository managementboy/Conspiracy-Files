---
title: "OnInitModdedWeatherStage"
source: "https://pzwiki.net/wiki/OnInitModdedWeatherStage"
source_revision: "https://pzwiki.net/w/index.php?title=OnInitModdedWeatherStage&oldid=1391553"
source_last_edited: "Last modified\n\t\t         This page was last edited on 23 May 2026, at 03:30."
retrieved: "2026-09-15T11:42:34.240Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 1
source_tables: 0
---

# OnInitModdedWeatherStage

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page was last updated for an older version of the current build (42.0.2).

The current stable version is 42.20.4, so information on this page may be inaccurate.

Help get this page updated by adding any missing content. [Edit](OnInitModdedWeatherStage.md) (Create account)

<a id="Event"></a>

## Event

OnInitModdedWeatherStage

<a id="Description"></a>

## Description

Fires when a modded weather period is created.

<a id="Parameters"></a>

## Parameters

- weatherPeriod: WeatherPeriod (JavaDoc) - The weather period that was created.
- weatherStage: WeatherPeriod.WeatherStage (JavaDoc) - The weather stage that was created.
- strength: number - TODO

<a id="Examples"></a>

## Examples



```text
local function OnInitModdedWeatherStage(weatherPeriod, weatherStage, strength)
    -- your code here
end

Events.OnInitModdedWeatherStage.Add(OnInitModdedWeatherStage)
```



Retrieved from "[https://pzwiki.net/w/index.php?title=OnInitModdedWeatherStage&oldid=1391553](OnInitModdedWeatherStage.md)"
