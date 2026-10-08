# Of Interest: publish checklist (phase 8)

Status 2026-10-08: everything below the line "Owner gates" is prepared; NOTHING has been uploaded. The upload
is blocked by `tools/workshop-ofinterest/APPROVED_BY_OWNER`, which only the owner creates.

## Prepared (done, by Claude)

- Page text: `tools/workshop-ofinterest/description.txt` (required mods with links, 42.21 warning, credit,
  AI-text note, save safety, compatibility; no note content).
- In-game notice when the scene detector is inactive (once per save, neutral halo text, one log line).
- Real-game proof that the mod still works with the detector off: `tools/autotest/checks/oi_nodetector.sh`.
- Approval gate in `tools/publish_workshop.sh`: a real upload for `--mod ofinterest` is refused unless
  `tools/workshop-ofinterest/APPROVED_BY_OWNER` exists and its first line contains the sha256 of
  `description.txt`. Any later text change makes the approval stale.
- Post-upload page check: `python3 tools/ofinterest/verify_workshop_page.py` (one HTTP request).
- Dependency terms snapshot: `docs/management/evidence/of-interest-dependency-terms-2026-10-08.md`.

## Owner gates (only the owner can pass these)

1. [ ] Refresh the Steam login yourself, interactively: `/usr/games/steamcmd +login managementboy`
       (password and Steam Guard typed by you; nobody else handles them).
2. [ ] Playtest on Windows with the fixed ZombieBuddy (see `tools/zombiebuddy-42.21/README.md`):
       at least 50 scenes across several towns, using the Shift+L-style debug if it is available and the
       debug-log helpers. Check: the objects look ordinary, the note is there, one find per scene, no red
       error box, no second notice while the detector is live.
3. [ ] Also play once WITHOUT the ZombieBuddy fix: the one-time notice should appear after about 45 seconds and
       the mod should still place its own scenes.
4. [ ] Read the dependency terms snapshot (`docs/management/evidence/of-interest-dependency-terms-2026-10-08.md`):
       the dependency states no licence and no permission either way. Decide whether publishing without asking is
       acceptable. (Prepared fact: we ship ids only and copy no note text.)
5. [ ] Optional, your call, later: contact the dependency's authors (amurin and the other creators on its page)
       before or after publishing. Nothing here contacts anyone.
6. [ ] Read `tools/workshop-ofinterest/description.txt` once and approve it. Then create the approval file with the
       current hash on its first line:
       `sha256sum tools/workshop-ofinterest/description.txt | cut -d' ' -f1 > tools/workshop-ofinterest/APPROVED_BY_OWNER`
       (If the text is changed later the dry run says `approval: stale` and the upload is refused.)
7. [ ] Dry run: `bash tools/publish_workshop.sh --mod ofinterest --dry-run` must say `approval: ok`.
8. [ ] Upload UNLISTED (the default visibility is unlisted, 3):
       `bash tools/publish_workshop.sh --mod ofinterest --owner-override-boot-check "owner approved, <date>" --changenote "..."`
9. [ ] Post-upload verification: record the new item id (the script writes `tools/workshop-ofinterest/published_file_id`;
       COMMIT IT), then `python3 tools/ofinterest/verify_workshop_page.py` and compare. Subscribe on the play
       machine, start a new game, check the mod list shows both required mods. Only then consider public (`--visibility 0`).

## Rollback

- Hide it at once: `bash tools/publish_workshop.sh --mod ofinterest --visibility 2 --owner-override-boot-check "rollback"`
  (private). Needs a current approval file.
- Re-upload the previous good build: check out the earlier commit, run the same publish command (same item id,
  Steam keeps the item, subscribers receive the older files as a new update).
- Last resort: delete the item on its Workshop page (Delete this item). The id file must then be removed so the next
  publish creates a new item.

## Known risks

- ZombieBuddy on Build 42.21: the official release loads no Java mods (upstream issue #53, fix PR #56 unmerged). Players
  without a fixed build lose the scene detector: only 3 of 125 kinds of the game's own scenes (and one hand-checked
  scene) can still be recognised. The mod's own ~250 scenes still work. The page and the in-game notice say so.
- The dependency can update at any time (ids, keys, places). The drift gate keeps saves safe (levels 0 to 3, see the
  page), but the shipped id tables need a recheck after each of its releases.
- AI-written text (survivor lines, object scenes) sits next to hand-written notes. The page says so. Keep it out of the
  dependency's notes.
- No licence is stated by the dependency (see the snapshot). Permission has not been asked.
- Early build: version number is 0.0.1-dev; no preview image yet.

## Dry-run record (2026-10-08, commit shown by the version)

See the end of this file.

```
workshop payload: Conspiracy Files: Of Interest
  version     0.0.1-dev+69574fdc
  lua files   138
  visibility  unlisted (3)
  account     managementboy
  item        NEW - will be created
  changenote  0.0.1-dev+69574fdc
  description sha256 d9461ee17af92fba7a3d18c02167e90611770c2811b0a6733a7ab3c68bbdfe15
  approval: missing
  preview     none (Workshop page will have no image)
  vdf         /home/elkin/Conspiracy-Files/dist/workshop-ofinterest/item.vdf
  boot gate   none automated for No Help / Of Interest: --owner-override-boot-check required

dry run: nothing uploaded.
```

Real-game fallback proof: docs/management/evidence/linux-autotest/20261008T021341-oi-nodetector.txt (PASS: one notice after 45 s with shown=1, 250 scenes decided in 14 towns, story/building/vehicle scenes arrived with forced notes and one find each, no mod errors). Note: the run used the notice tag name OIShared_detector_notice; it was renamed to OIShared.detectorNotice afterwards (a world-tag naming rule), no other change.
