#!/usr/bin/env python3
"""Prove each real-game check catches the bug it was written for.

    tools/autotest/prove.py [--worktree DIR] [--only NAME ...] [--list]

A passing check only says the code is right today. It does not say the check
would notice if it were wrong - and a check that cannot fail is decoration.
Two of this project's checks were proven by hand on 2026-09-14 (the SETUP
machine-size crash and the outward drag); the owner asked for the rest to be
brought up to that standard ("can we upgrade them to good?").

For every entry in MUTATIONS this puts ONE deliberate bug back into a spare git
worktree, runs the check named for it there, and requires the check to FAIL
with the expected message - then restores the file. It never touches the main
checkout, and it refuses to start if the worktree has uncommitted changes, so
a mutation can never be committed or left behind.

Each run launches the real game, so this takes several minutes per mutation.
Results go to docs/management/evidence/linux-autotest/<stamp>-prove.txt.
"""
import argparse
import datetime
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(os.path.dirname(HERE))
DEFAULT_WORKTREE = os.path.expanduser("~/cf-wp345")
C = "mod/common/media/lua/client/ConspiracyFiles/"

# name, check, file, the code that makes it right, the bug put back, the FAIL text expected.
MUTATIONS = [
    ("list-refresh", "pdagame", C + "DiscoveryLog.lua",
     "if screen and screen.window then screen.window.cachedList=nil end",
     "-- mutation: the open list is no longer refreshed",
     "did not refresh the open program's list"),
    ("dates-hour", "pdagame", C + "KnoxApps.lua",
     "hour=math.floor(found)}",
     "hour=math.floor(atHours%24)}",
     "did not show the clock's hour"),
    ("dates-entry-tap", "pdagame", C + "OrganiserScreen.lua",
     'l.index and "ENTRY" or nil',
     "nil",
     "drew no tappable entry"),
    ("dates-week-strip", "pdagame", C + "KnoxUI.lua",
     'hit(c,"WEEKDAY",x,0,cw,line,cell.day)',
     "-- mutation: the week strip is not tappable",
     "tapping another day in the week did not open that day"),
    ("left-hand", "pdagame", C + "Organiser.lua",
     "or (secondary~=nil and safe(secondary.getFullType,secondary)==O.TYPE)",
     "",
     "the organiser in the left hand did not open Knox.OS"),
    ("clock-needs-watch", "hardware", C + "OrganiserScreen.lua",
     "    if not timed then return nil end\n",
     "",
     "showed the time with no watch or clock carried"),
    ("setup-text-list", "hardware", C + "OrganiserScreen.lua",
     'self:openPopup("Text size",labels,self.fontSize or S.fontSize or S.FONT_DEFAULT,S.setFont)',
     "S.stepFont(1)",
     "tapping a line in the Text list did not choose that size"),
    ("machine-fits-more", "hardware", C + "OrganiserScreen.lua",
     "w=math.floor(Case.glass.w*s/t),h=math.floor(Case.glass.h*s/t),t=t,face=f.face}",
     "w=math.floor(Case.glass.w/t),h=math.floor(Case.glass.h/t),t=t,face=f.face}",
     "a bigger machine did not fit more text"),
    ("body-searched", "case_body", C + "CasePerson.lua",
     "pcall(function() container:setExplored(true) end)",
     "-- mutation: the body is not marked searched",
     "the body is not marked searched"),
    ("body-one-card", "case_body", C + "CasePerson.lua",
     'card=read(container,"AddItem",P.CARD)',
     "card=nil",
     "ID cards, not exactly one"),
    ("dates-real-paper", "core_loop", C + "OrganiserScreen.lua",
     'l.index and "ENTRY" or nil',
     "nil",
     "the day view drew no entry for"),
    ("last-seen", "core_loop", C + "GeneratedRuntime.lua",
     'if type(row.lastSeen)=="string" then return "lastseen",row.lastSeen end',
     "-- mutation: a finished case's papers say nothing",
     "documents say where they were last seen"),
    ("sex-match", "case_body", C + "CasePerson.lua",
     "local r=rank(zombie,female,nil)",
     "local r=0",
     "the case person picker chose a zombie that is not"),
    ("date-note", "core_loop", C + "EvidenceRows.lua",
     'detail=detail.."\\n\\n"..RelayMemo.NOTE',
     "detail=detail",
     "carry the date note"),
]


def run(cmd, cwd, timeout=None):
    return subprocess.run(cmd, cwd=cwd, shell=True, capture_output=True, text=True, timeout=timeout)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--worktree", default=DEFAULT_WORKTREE)
    ap.add_argument("--only", nargs="*")
    ap.add_argument("--list", action="store_true")
    args = ap.parse_args()
    chosen = [m for m in MUTATIONS if not args.only or m[0] in args.only]
    if args.list:
        for m in chosen:
            print("%-20s %-10s %s" % (m[0], m[1], m[2]))
        return 0
    wt = args.worktree
    dirty = run("git status --porcelain --untracked-files=no", wt).stdout.strip()
    if dirty:
        sys.exit("worktree %s has uncommitted changes; refusing to mutate it:\n%s" % (wt, dirty))
    head = run("git log --oneline -1", wt).stdout.strip()
    stamp = datetime.datetime.now().strftime("%Y%m%dT%H%M%S")
    lines = ["Linux mutation proof %s" % stamp, "worktree: %s at %s" % (wt, head), ""]
    caught = 0
    for name, check, path, good, bad, expect in chosen:
        full = os.path.join(wt, path)
        text = open(full, newline="").read()
        count = text.count(good)
        if count != 1:
            lines.append("SKIP %s: the good code occurs %d times in %s (the mutation is out of date)" % (name, count, path))
            print(lines[-1], flush=True)
            continue
        open(full, "w", newline="").write(text.replace(good, bad))
        try:
            print("mutation %s -> %s ..." % (name, check), flush=True)
            result = run("timeout 1500 tools/autotest/checks/%s.sh" % check, wt, timeout=1600)
            out = result.stdout + result.stderr
            failed = result.returncode != 0
            matched = expect in out
            verdict = "CAUGHT" if failed and matched else ("FAILED, BUT NOT FOR THIS" if failed else "MISSED")
            if verdict == "CAUGHT":
                caught += 1
            why = [l.strip() for l in out.splitlines() if "FAIL:" in l][:3]
            lines.append("%s %s (%s): %s" % (verdict, name, check, " | ".join(why) or "no FAIL line"))
            print(lines[-1], flush=True)
        finally:
            run("git checkout -- %s" % path, wt)
    left = run("git status --porcelain --untracked-files=no", wt).stdout.strip()
    lines += ["", "caught %d of %d" % (caught, len(chosen)), "worktree clean afterwards: %s" % ("yes" if not left else "NO: " + left)]
    report = os.path.join(REPO, "docs/management/evidence/linux-autotest", stamp + "-prove.txt")
    os.makedirs(os.path.dirname(report), exist_ok=True)
    open(report, "w").write("\n".join(lines) + "\n")
    print("\n".join(lines[-3:]))
    return 0 if caught == len(chosen) else 1


if __name__ == "__main__":
    sys.exit(main())
