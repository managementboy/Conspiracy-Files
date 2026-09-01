# T10 live-run security stop

- **Observed:** 2026-09-01, Windows 11, during an attempted exact-version Project Zomboid relaunch.
- **Notification text shown:** `Bedrohung gesichert`; `Wir haben runner.exe in die Quarantäne verschoben, da es mit Win64:MalwareX-gen [Cryp] infiziert war`.
- **Concurrent game state:** the selected Project Zomboid window reported `Fatal Error`; the attempted run did not reach `OnGameStart` or emit any T10 matrix/action evidence.
- **Response:** stopped the run; did not scan from the prompt, open further options, alter antivirus settings, add exclusions, restore quarantine, rebuild/relaunch the helper, or try another injection route.
- **Provenance:** unknown. `runner.exe` was not present in the Project Zomboid installation, was not found through `where.exe` or a read-only recursive search of the user temp directory after the alert, and no matching Windows Defender detection was returned. This does not identify the protection product, original path, or relationship to Project Zomboid, Codex computer control, or the JNI gate helper.
- **Preserved evidence:** the visible notification remains in the task transcript; `live-run-security-stop.txt` preserves the final game console log; all disposable artifacts were moved to `C:\Users\elkin.fricke\Zomboid\_pzstory_backups\T10_cooperative_inspect_security_stop_20260901_0315`.
- **Restoration verification:** Project Zomboid process count `0`; active probe mod/save/helper paths absent; `latestSave.ini`, `mods/default.txt`, `options.ini`, and `debuglog.ini` restored to their pre-run SHA-256 hashes.

This incident blocks live T10 activation evidence. It is not evidence that the
probe, helper, game, or computer-control runtime was malicious, and it must not
be bypassed without a separate user/security review.
