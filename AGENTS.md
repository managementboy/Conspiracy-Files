# Conspiracy-Files — Agent / Codex Instructions

## Token budget — owner instruction, 2026-09-05

Conserve the shared weekly Codex allowance. Apply this to project management and implementation, not just response length.

**Current reserve, owner updated 2026-09-06:** checkpoint and stop development at **5% weekly allowance remaining** (95% used). This supersedes the earlier 25%, 30% and 35% stop thresholds and 38% start gate in historical overnight plans and task handoffs. Check actual shared usage before new segments and during substantial work; choose bounded segments that leave room to checkpoint before the reserve. Do not interpret this as permission to consume resets or resume paused automations.

- Use small, bounded work increments and concise reports. Prioritize the next delivery blocker; defer optional polish and speculative work.
- Reuse verified context and durable handoff notes. Read changed or relevant sections instead of repeatedly re-auditing unchanged material already reviewed in the same task.
- Batch independent reads, keep tool output focused, and avoid repeated polling, duplicate documentation and unnecessary agent delegation.
- Run verification appropriate to the change once; repeat only for new edits, failures or unresolved concerns. Never omit required correctness checks to save tokens.
- Before substantial work, check account usage limits when available. Consider both weekly and short-window headroom; no project-specific share has been specified. If remaining allowance is tight, checkpoint completed work and surface the constraint before starting optional or large new work.
- Do not purchase credits, redeem resets, schedule background work or change models without applicable authorization. Account limits are shared; do not promise that this project can prevent consumption by other tasks.

## Economical development strategy — owner approved, 2026-09-05

- Keep this primary task responsible for project management, integration and final review.
- Owner reaffirmed on 2026-09-06: subcontract bounded development to a separate visible Codex task/thread, following the earlier workflow. Prefer this over implementing an entire development segment in the PM conversation. Use one Terra Low development task at a time with a compact handoff; reuse a suitable existing development task where possible. Primary reviews results, integrates, deploys and guides live tests. This is the workflow for future concrete development segments, not a request to create an empty task now.
- Delegate routine, independent implementation to one focused worker at a time. Default to GPT-5.6 Terra with low reasoning; use Luna only for clearly simple edits/extraction. Owner authorizes these worker model choices. Do not create multiple concurrent workers by default.
- Give workers a compact handoff: concrete outcome, allowed files, invariants, test command and stopping point. Do not fork the full conversation. Separate tasks still share the account allowance; no guaranteed saving is claimed.
- Workers implement and test their bounded scope; the primary agent reviews the diff and integrates. Avoid duplicate investigations, repeated full-suite runs and repeated progress polling.
- Reserve higher-effort Astra work for difficult integration, architecture, persistence and recovery. Astra Low is an approved preference for routine primary work when the task's model setting can be changed explicitly; never claim a setting changed merely from a prompt. Current task settings remain app-controlled.
- Scoped workers may rely on the primary's current handoff for settled project context and account-usage checks, reading only relevant project sections. They must inspect relevant implementation and instructions, and report contradictions. No full-history re-audit is required for each worker.
- No live game interaction while the owner is away; mock/source checks do not count as native acceptance. Deployment remains with the primary agent under existing authorization.

Before making any design or code change:

1. Read `/PROJECT_STATE.md`.
2. Read `/ROADMAP.md`.
3. Read `/DECISIONS.md` — current authoritative decisions.
4. Use `/DECISIONS_BASELINE.md` only for historical discovery context.
5. Read `/DECISIONS_SUPERSESSIONS_2026-08-30.md` for the review correction trail.
6. Read `/docs/architecture/ARCHITECTURE_V0.2.md`.
7. Check `/docs/research/` before assuming a Project Zomboid Build 42 hook/capability exists.

## Project rules

- **P4-R63, owner decision 2026-09-06:** before mod version 1.0, old-save backwards compatibility is not required. Breaking changes may require fresh saves; do not spend effort on legacy readers/migrations/fallbacks solely for older versions. Announce fresh-save requirements. Keep current-build save integrity and never silently reset/delete saves. This overrides older cross-version compatibility handoffs.

- Target Project Zomboid Build 42; exact supported minor line must follow verified research.
- Vanilla Lua first. Add ZombieBuddy/Java only for missing API access, measured performance, or persistence/data-processing complexity.
- The domain core must have zero PZ runtime dependencies and be testable in plain Lua 5.1. All engine contact belongs behind integration adapters.
- The central conspiracy model is authoritative; UI is a derived view.
- Immutable evidence facts, mutable interpretation.
- No-AI is the primary supported experience. Runtime AI is optional and may never create authoritative world facts.
- Preserve PZ's normal survival loop; do not turn Conspiracy-Files into a linear quest framework.
- Prefer native PZ behavior, but use a custom reader/Inspect surface if T7 proves runtime story text cannot use native readers safely.
- No vanilla Lua file replacement; no global namespace pollution beyond one `ConspiracyFiles` table; hooks must be cooperative.
- Detect multiplayer and disable cleanly until MP support is explicitly designed.
- Full hidden-state diagnostics are debug/development only.
- Outside initialization, target ≤2 ms/frame and use bounded queued work rather than unbounded loops.
- Completed T1 makes ≤500 KB/save the hard v0.1 canonical-state budget under P4-R17, with mandatory staged recursive validation before canonical ModData replacement under P4-R32.

## Engine call form — hard rule, learned live 2026-09-07

**Call PZ engine (Java-backed) methods with colon syntax. Never extract the
method first.**

    GOOD   square:HasStairs()            player:setHaloNote(t,255,255,255,900)
    GOOD   pcall(function() manager:playUISound(name) end)
    BAD    square.HasStairs()             -- throws
    BAD    pcall(player.setHaloNote, player, ...)   -- may silently do nothing

Kahlua does not treat an extracted method as a real method call. This failed
twice in one day, in two different ways:

- `ReachabilityRequest` called every engine method without a receiver. It threw
  on the first real square in game and killed case preparation (77d46ef).
- `PlayerVoice` and `ClueHints` used `pcall(obj.method, obj, ...)` for
  `setHaloNote` and `playUISound`. Those did **nothing at all** while `pcall`
  returned true, so the code logged success and the player saw and heard
  nothing (d747a25 and follow-up).

The silent variant is the dangerous one: tests pass, logs claim success, and
the feature is simply absent in play. Wrapping in `pcall` hides it further.

This applies only to engine objects. `pcall(ourTable.ourFunction, ...)` on our
own plain Lua is fine and is used widely.

Plain-table test doubles accept both call forms, so they cannot catch this.
Where it matters, make the double demand a receiver - see the mock in
`test/reachability_gate.lua`.

## Decision integrity

- No implementation should silently contradict an existing decision.
- **If a spike disproves a decision, supersede it in `DECISIONS.md`, link the spike/issue/result, and record the replacement. Technical reality wins.**
- New technical decisions with lasting consequences go in `docs/decisions/`.
- New Build 42 API assumptions must be verified and recorded in `docs/research/`.

## Current delivery scope

Follow the active sequence in `ROADMAP.md` and P4-R53: the next bounded implementation target is G1 in `docs/design/GENERATED_INVESTIGATION_PROTOTYPE.md`. Dead Air is a retained fixed regression fixture, not the final product. Do not require owner approval of individual locations. Keep graph, runtime AI, external content packs, retrofit, migration and multiplayer outside this prototype.
