# Spike T9 — vanilla Lua network egress

- **Status:** Proven negative for general-purpose egress
- **Project Zomboid build tested:** Stable `42.20.4 b0bbce05d5`; revision `b0bbce05d5`; `pzbullet=1.0.0.28`; Steam build ID `24909800`
- **Platform:** Windows 11 Pro `10.0.26200` build 26200; Intel Core i9-13900H; 34,070,192,128 bytes RAM; direct 64-bit client; single-player; `-nosteam`
- **Probe path/commit:** `dev/t9-network-egress/`; tested source SHA-256 `1B4CD444254987E40951B680A682E2FE73527EAF831AEF14DE6280F4FD7830A7`
- **API/event/classes used:** `Events.OnGameStart`, `Events.OnTick`, `getHostByName`, `openUrl`, `getPublicServersList`, `getFileReader`, `getActivatedMods`, `getSteamModeActive`

## Question

Can an ordinary Workshop-style Build 42 Lua mod make arbitrary HTTP or HTTPS requests, including GET or POST, with usable response, timeout and asynchronous behavior, or does optional runtime AI require a Java/ZombieBuddy or external transport boundary?

## Method

The disposable probe was installed as the only active mod in a copied `T9_network` single-player save. It ran only when the save name began `T9_`. Test inputs were controlled constants: `example.com`, a `.invalid` DNS name, a non-allowlisted `https://example.com` browser target, one known sentinel in PZ's Lua cache, and the engine's own fixed public-server-list operation. It did not read or transmit saves, credentials, logs, gameplay data, host identity, network interfaces or response bodies.

The run used `-nosteam` so `getPublicServersList()` selected the game's fixed web path instead of Steam's server browser. The request was invoked synchronously from `OnTick`; the probe measured call duration and the next-tick gap. A separate Windows sampler recorded the process `Responding` flag approximately every 100 ms. The included JNI gate helper only released the final loading gate after the engine set `GameLoadingState.done`; it did not modify Lua, networking, saves or measurements.

Reproduction:

1. Install `dev/t9-network-egress` as `ConspiracyFiles_T9_Probe` and enable it alone in a disposable save named `T9_*`.
2. Put `CF-T9-SENTINEL` in `Zomboid/Lua/ConspiracyFiles_T9_Sentinel.txt`.
3. Launch the 64-bit client with `-nosteam`; for an unattended direct launch, compile and load the included gate helper as described in the probe README.
4. Preserve only `[CF-T9]` and `[CF-T9-AGENT]` lines plus an external responsiveness summary. Do not publish the raw console.

The filtered run transcript is preserved at [`../../dev/t9-network-egress/evidence/nosteam-run.txt`](../../dev/t9-network-egress/evidence/nosteam-run.txt).

## Documentation and installed-code claims

These are not live observations. They are claims checked against the exact installed `projectzomboid.jar` and official Build 42 Lua-facing Javadocs:

- `LuaManager.GlobalObject` documents/exposes `getHostByName`, `openUrl` and `getPublicServersList`; the actual 42.20.4 class has no `getUrlInputStream` method.
- `getHostByName` delegates to Java name resolution and converts an unknown-host failure to `null`.
- `openUrl` is an allowlisted external-browser launcher for official Steam/Indie Stone/PZ Wiki HTTPS destinations, not an HTTP response API.
- In `-nosteam`, `getPublicServersList` synchronously opens the fixed HTTPS URL `https://www.projectzomboid.com/server_browser/servers.xml`, sets 10,000 ms connect and read timeouts, reads the whole text response with the platform-default `InputStreamReader`, parses XML, and returns a Lua table. Its inner connection failure path silently returns `null`.
- In Steam mode, that same Lua function uses the Steam server-browser implementation instead of HTTP.
- The engine contains internal asynchronous Java networking, including `PublicServerUtil.callPostJson`, but `PublicServerUtil`, `java.net.URL`, HTTP clients, `Thread`, `Runnable` and `luajava` are not in the Lua exposure whitelist. Their presence in the JAR is not Lua capability.
- `getFileReader` is rooted in the PZ Lua cache and rejects parent traversal; the corresponding writer permits only a restricted extension set.

## Observed behaviour

The following facts came from the live controlled run:

| Capability | Live observation | Result |
|---|---|---|
| DNS success | `getHostByName("example.com")` returned an IPv4-shaped result in 13 ms; the address itself was not logged. | Available, synchronous |
| DNS failure | A guaranteed-invalid `.invalid` name returned nil in 5 ms without a Lua exception. | Failure is collapsed to nil |
| General HTTP API | `getUrlInputStream`, `getURLInputStream`, `URL`, `URLConnection`, `HttpURLConnection`, `HttpClient`, `OkHttpClient`, `Request` and `Socket` were nil. | Unavailable |
| HTTPS GET | The only callable HTTP-like operation was the engine's fixed `getPublicServersList`; it returned nil after 312 ms and exposed no status, headers, body or error. | Fixed-purpose path exists; no usable response in this run |
| Plain HTTP GET | No arbitrary URL/request surface was callable. | Unavailable / not safely testable |
| POST | No callable POST surface was exposed. | Unavailable / not testable |
| TLS | The fixed HTTPS call returned nil and swallowed its inner connection error, so Lua exposed no certificate, protocol, verification or failure detail. | No diagnosable TLS surface |
| Browser launch | `openUrl("https://example.com")` returned nil in under 1 ms and did not launch a browser, consistent with the installed allowlist. | Not a request/response API |
| Async | `Thread`, `Runnable`, `luajava` and internal `PublicServerUtil` were nil; no callback/future HTTP API was found. | Unavailable to vanilla Lua |
| File bridge | The controlled Lua-cache sentinel was readable; `../options.ini` yielded no reader. | Cannot use the exposed file bridge to escape to a helper protocol |
| ZombieBuddy | Exactly one mod was active and ZombieBuddy was absent. | Findings are vanilla Lua findings |

An outside-Lua metadata-only control immediately afterward reached the same hard-coded HTTPS endpoint, verified TLS, received HTTP 200 `application/xml` with `Content-Length: 38380`, and downloaded 38,380 bytes in 114 ms. This control shows the host/endpoint were reachable at test time; it does not establish why the engine call returned nil, because the engine intentionally suppressed that exception.

## Measurements

- Fixed HTTPS server-list call: 312 ms from entry to return on the `OnTick` event thread.
- First tick after return: 14 ms later; therefore the 312 ms was spent inside the synchronous event callback, not deferred to an exposed Lua async job.
- Windows responsiveness: 388 samples over 49,688 ms, zero `Responding=false` samples. The window remained responsive by Windows' coarse criterion, but the game event thread still could not advance during the 312 ms call.
- DNS: 13 ms success, 5 ms controlled failure.
- Fixed endpoint installed-code timeout: 10 seconds each for connect and read. The live run did not force either timeout, and arbitrary timeout configuration is not exposed.
- Response size/encoding: Lua received neither raw response nor parsed table in this run. Installed code reads the entire fixed response into memory using the platform-default character decoder before XML parsing; no configurable maximum or charset is exposed. Arbitrary response-size and encoding behavior therefore remains untestable from vanilla Lua.

## Limitations

- The general HTTP result is negative, so arbitrary HTTP/HTTPS endpoints, methods, headers, request bodies, status codes, encodings, response sizes and timeout endpoints could not be exercised without adding the very Java/external capability under evaluation.
- The fixed HTTPS call's nil result cannot be attributed specifically to DNS, TCP, TLS, HTTP or XML parsing because its connection catch returns nil without diagnostics.
- Steam mode was not used for HTTP evidence because installed code routes that mode to Steam's server browser. It cannot add arbitrary web egress.
- `_G` name discovery is suggestive, not sufficient by itself; the conclusion also relies on candidate calls, exact installed-class inspection and the Lua exposer's whitelist.
- Windows' `Responding` flag is much coarser than frame timing. The paired `OnTick` measurements are the evidence for game-thread blocking.

## Environment restoration and audit trail

After the successful run, the disposable `T9_network` save, installed T9 mod, Lua-cache sentinel and temporary gate-helper DLL were removed. The original `mods/default.txt`, `latestSave.ini`, `options.ini` and `debuglog.ini` were restored byte-for-byte; their SHA-256 hashes all matched the pre-run baseline. No Project Zomboid process remained. No release JAR, original save or unrelated mod was changed.

The repository preserves the reproducible probe, gate-helper source and filtered non-sensitive transcript. A git-ignored local audit directory preserves the pre-run manifest and hashes, original control-file copies, raw redirected stdout/stderr, the 100 ms responsiveness CSV, tested helper binary and build inputs. Those raw files are intentionally excluded from version control because ordinary PZ output contains local paths and unrelated environment details.

## Verdict

Vanilla Build 42.20.4 Lua does **not** provide general-purpose HTTP or HTTPS request/response egress. It exposes synchronous DNS, an allowlisted browser launcher, Steam/server-browser helpers, and one fixed synchronous HTTPS server-list fetch whose error detail and raw response are hidden. There is no callable arbitrary GET, POST, TLS control, timeout control or asynchronous HTTP execution surface.

An in-process optional runtime-AI transport therefore requires a Java-capable dependency such as ZombieBuddy; an out-of-process companion is another possible boundary. Neither belongs in v0.1, and no production networking or runtime AI was implemented by this spike. The primary no-AI experience and deterministic fallbacks remain unchanged, so this negative result does not block v0.1.

## Decision links

- **P2-Q54 / P4-R03:** retained — no-AI remains primary.
- **P3-Q1 / ADR-0001:** retained — vanilla Lua first for core gameplay.
- **P3-Q2:** threshold met only for any future general network transport: missing Lua API access is now observed.
- **P4-R33:** added — optional runtime-AI transport must cross a Java/ZombieBuddy or external-companion boundary; it stays outside v0.1.
- **ADR-0002:** updated with the measured transport boundary; its no-AI decision is unchanged.
