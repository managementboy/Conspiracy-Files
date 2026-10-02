#!/usr/bin/env python3
"""The run contract: a real-engine run may never be silent, partial or stale.

  contract.py --real N --skipped N --failed N --jar-sha X --build B --jdk J --startup-ms 1200,1100 \
              --lock tools/realengine/kahlua.lock --out tools/realengine/out/contract.json [--relock] [--allow-lower]

Exit codes (the same table is in docs/management/REAL_ENGINE_TESTS.md):
  0  every real test passed on the verified game build, and enough of them ran
  1  a test or canary failed
  21 the game is not the build the lock was verified against (or there is no lock yet)
  22 fewer real tests ran than the lock demands (an all-skip run can never look green)
(20 = no game here is decided by run.sh before anything runs.)
--relock records the current game build and raises the minimum; it never lowers it unless --allow-lower.
"""
import argparse, json, os, sys


def read_lock(path):
    lock = {}
    if os.path.exists(path):
        for ln in open(path):
            if "=" in ln and not ln.lstrip().startswith("#"):
                k, _, v = ln.partition("=")
                lock[k.strip()] = v.strip()
    return lock


def main(argv=None):
    ap = argparse.ArgumentParser()
    ap.add_argument("--real", type=int, required=True)
    ap.add_argument("--skipped", type=int, default=0)
    ap.add_argument("--failed", type=int, default=0)
    ap.add_argument("--jar-sha", required=True)
    ap.add_argument("--build", default="unknown")
    ap.add_argument("--jdk", default="unknown")
    ap.add_argument("--startup-ms", default="")
    ap.add_argument("--lock", required=True)
    ap.add_argument("--out")
    ap.add_argument("--relock", action="store_true")
    ap.add_argument("--allow-lower", action="store_true")
    a = ap.parse_args(argv)

    startups = [int(x) for x in a.startup_ms.split(",") if x.strip().isdigit()]
    lock = read_lock(a.lock)
    code, notes = 0, []

    if a.relock:
        if a.failed:
            print("contract: refusing to relock while tests fail"); return 1
        old_min = int(lock.get("min_real", "0") or 0)
        new_min = a.real if a.allow_lower else max(old_min, a.real)
        os.makedirs(os.path.dirname(a.lock) or ".", exist_ok=True)
        with open(a.lock, "w") as fh:
            fh.write("# Which game build the real-engine tests were verified against. Change only with --relock.\n")
            fh.write(f"build_id={a.build}\njar_sha256={a.jar_sha}\nmin_real={new_min}\n"
                     f"startup_budget_ms={lock.get('startup_budget_ms', '15000')}\n")
        lock = read_lock(a.lock)
        notes.append(f"relocked to build {a.build}, minimum real tests {new_min}")

    if a.failed:
        code = 1; notes.append(f"{a.failed} test(s) or canary(ies) FAILED")
    elif not lock:
        code = 21; notes.append("no lock file: this game build has never been verified (review, then run with --relock)")
    elif lock.get("jar_sha256") != a.jar_sha:
        code = 21
        notes.append(f"verified against build {lock.get('build_id', '?')}, game is build {a.build}: "
                     "re-verify, then --relock")
    elif a.real < int(lock.get("min_real", "0") or 0):
        code = 22
        notes.append(f"only {a.real} real test(s) ran, the lock demands {lock['min_real']}: a skip is not a pass")
    budget = int(lock.get("startup_budget_ms", "15000") or 15000)
    slow = [s for s in startups if s > budget]
    if slow:
        notes.append(f"warning: {len(slow)} start-up(s) over the {budget} ms budget (slowest {max(slow)} ms)")

    record = {"build": a.build, "jar_sha256": a.jar_sha, "jdk": a.jdk, "real": a.real, "skipped": a.skipped,
              "failed": a.failed, "startup_ms": startups, "exit_code": code, "notes": notes,
              "lock_min_real": lock.get("min_real"), "lock_build": lock.get("build_id")}
    if a.out:
        os.makedirs(os.path.dirname(a.out) or ".", exist_ok=True)
        json.dump(record, open(a.out, "w"), indent=1)
    print(f"contract: build={a.build} jar={a.jar_sha[:12]} jdk={a.jdk} real={a.real} skipped={a.skipped} "
          f"failed={a.failed} -> exit {code}" + ("" if not notes else "\n  " + "\n  ".join(notes)))
    return code


if __name__ == "__main__":
    sys.exit(main())
