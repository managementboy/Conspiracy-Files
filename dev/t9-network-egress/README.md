# Spike T9 — vanilla Lua network-egress probe

This is disposable Project Zomboid Build 42 test code for GitHub Issue #2. It is not production Conspiracy-Files code and does not implement runtime AI.

## Safety

The probe uses only controlled constants and records only capability, timing, type and count data. It never reads or transmits saves, credentials, logs, gameplay state, hostnames, local paths, network-interface data or other machine data.

The only outbound operations it can trigger are:

- DNS resolution of `example.com` and a guaranteed-nonexistent `.invalid` name;
- Project Zomboid's own fixed-purpose public-server-list request when `getPublicServersList()` is available;
- a call to `openUrl("https://example.com")`, which Build 42's URL allowlist is expected to reject before launching a browser.

No POST is attempted unless a general-purpose callable HTTP API is discovered. The shipped probe contains no POST payload or provider endpoint.

## Install

Copy this directory as a local mod so Project Zomboid sees:

```text
ConspiracyFiles_T9_Probe/
├── common/media/lua/shared/ConspiracyFilesT9Probe.lua
└── 42/mod.info
```

Enable only `ConspiracyFiles_T9_Probe` in a disposable single-player save whose folder name begins `T9_`. Place a UTF-8 file named `ConspiracyFiles_T9_Sentinel.txt` containing exactly `CF-T9-SENTINEL` in the PZ `Lua` cache directory to exercise the constrained file bridge check.

Run once normally and once with `-nosteam`. The latter selects the game's fixed HTTPS `servers.xml` implementation instead of Steam's server browser. After 120 ticks the probe executes once, waits long enough to record the post-call tick gap, and requests a normal quit to desktop.

For an unattended direct-executable run, compile `tools/ConspiracyFilesT9GateAgent.cpp` as a launch-only JNI agent and set `JAVA_TOOL_OPTIONS=-agentpath:<absolute-dll-path>`. The helper changes no Lua, save, networking or measurement state: it waits for the engine's own `GameLoadingState.done` flag and then releases the raw-input loading gate that an automated direct launch cannot satisfy. Its source is included so this test-harness intervention is auditable and reproducible; it is not part of the mod.

## Output

Structured records use the prefix `[CF-T9]`. Preserve only those filtered records and an external process-responsiveness sample; the full PZ console/log files may contain local paths or unrelated mod data and must not be committed.

The important record groups are:

- `ENVIRONMENT` and `ACTIVE_MODS`;
- `API_CANDIDATE` and `API_MATCH`;
- `DNS`;
- `OPEN_URL_REJECTED`;
- `FILE_SANDBOX`;
- `SERVER_LIST_START`, `SERVER_LIST_RETURN`, and `POST_CALL_TICK`;
- `GENERAL_HTTP_SURFACE` and `ASYNC_SURFACE`.

An elapsed synchronous call from `OnTick`, followed by a matching tick gap, is evidence that the direct Lua call occupied the game event thread for that interval. It is not a claim about every internal engine networking subsystem.
