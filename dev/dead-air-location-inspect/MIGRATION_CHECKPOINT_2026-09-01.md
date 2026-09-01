# Dead Air location review — x380 migration checkpoint

## Repository state

- Repository: `Conspiracy-Files`
- Branch: `design/dead-air-location-binding-live`
- Started from main commit: `1be30c45da8f8b481d508c4f7f1acead2ff6c778`
- No push, PR, merge or issue closure was performed.

## Completed

- Reviewed the authoritative Dead Air fixture/model/acceptance contract,
  T2/T3/T4/T5/T8 evidence, candidate dossier commit `b6af34c`, and the independent
  review.
- Built and live-ran the guarded pure-Lua/manual inspection aid.
- Captured exact building/room/container facts and owner screenshots for R2 and
  P2.
- P2 and R2 both have provisional pass recommendations; P2 does not currently
  require the headquarters fallback.
- Archived the interrupted disposable save/mod/logs and restored the source PC
  profile byte-for-byte. Project Zomboid is closed.

## Not completed

- Regional road-route review: the visited world map exposed only P2's local
  area.
- Candidate-specific adjacent/wrong-room/wrong-floor T8 negative checks.
- Final authoritative fixture/design/acceptance/project-state/decision updates.
- Final production bindings, adapter work, vertical-slice work, commit review
  and publication.

## Resume on x380

1. Transfer this repository with local branch
   `design/dead-air-location-binding-live` and its checkpoint commit.
2. Also transfer the external audit directory if the raw disposable save/log
   archive is required:
   `C:\Users\elkin.fricke\Zomboid\_pzstory_backups\DeadAir_location_live_20260901`.
3. Verify the x380 Project Zomboid build and profile independently before any
   setup; do not assume source-PC paths or hashes apply there.
4. Resume only when the PM authorizes it. Run the smallest map-only corridor
   reveal/route review, then candidate-specific arrival negatives.
5. Bind P2/R2 only if those remaining checks pass; otherwise document the exact
   failure and smallest fallback inspection.
