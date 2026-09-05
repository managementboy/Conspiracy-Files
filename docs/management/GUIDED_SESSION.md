# Guided development session — GUIDE-0.1 / DEV-0.6

The guide reuses the candidate UI and adapters. It is debug-only and disabled in multiplayer. It does not change gameplay state, teleport, perform Inspect, save, change wrappers or mark gates accepted.

## Install and open

1. Back up any existing local ConspiracyFiles mod folders before installation. Extract the bundle's three mod folders into your Project Zomboid user mods folder. Each folder contains common/ and 42/. Avoid duplicate copies of the same mod ID.
2. Launch PZ in debug mode. Enable **ConspiracyFiles + ConspiracyFiles_T12_Probe** only, using a disposable save. Keep T11 disabled.
3. In an inventory-pane context menu choose **CF Debug: Guided session**. Alternatively enter **ConspiracyFiles.SessionGuide.open()** in the ordinary debug console.
4. Confirm **GUIDE-0.1 / candidate DEV-0.6**, then follow the numbered checks. **Open test UI** opens the shared synthetic notebook in T12. The guide remains a separate window.

## One guided session, separate test phases

- Steps 1–2: readability, scrolling, navigation and scale. A reproduced failure gets one focused correction before a full rerun.
- Steps 3–4: manually travel to the Muldraugh relay/electronics and police candidates. Snapshot useful container squares and boundary negatives. T12 keeps story placement inactive during this inspection.
- Step 5: leave the save, disable T12 and enable T11 alongside ConspiracyFiles. Use a fresh disposable schema-2 save, then reopen the guide and select step 5. Never enable both wrappers. If PZ requires a restart to apply changed mods, follow that requirement; no hot wrapper swap is supported.
- Steps 6–8: one real D1, manual Inspect, genuine save/reload, movement and the documented fault matrix. Final acceptance requires an observed binding patch; provisional location diagnostics cannot substitute for it.

## Evidence and limits

Pass/Fail/Not tested are your observations. They do not change canonical state, set Bindings.accepted, or close issues. Pass/Fail require the matching wrapper; T11 also requires an active runtime. Controller behavior is outside the keyboard/mouse verdict and must be recorded separately as unsupported/unavailable unless observed.

Snapshot reads current coordinates, provisional predicate matches, up to eight objects/four containers each on the player's square, D1 state and queue timing. It does not scan the map, establish complete identity coverage or measure the whole frame. Standing beside a container may require a separate snapshot on its actual square using normal debug movement.

Use **ConspiracyFiles.SessionGuide.note('observation')** for a short console note. Results stay in memory and emit **[CF-GUIDE]** console lines; they are not persisted to a save. After reload, select the next step manually. Archive console.txt before restarting the game because the next process may replace it. Include exact build/revision, save identity and bundle/deployed hashes with observations.

All GUI input remains manual under P4-R44. The package has only Lua, mod metadata and documentation: no injected helper or automated input. The guide itself has offline mock/syntax verification, not live visual acceptance.
