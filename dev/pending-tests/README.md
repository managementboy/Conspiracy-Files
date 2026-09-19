# Pending regression cases

Written before their fix so the fix is reviewable the moment it lands. They are
**red on purpose** and live here rather than in `test/`, because
`tools/autotest/unit.sh` runs every `test/*.lua` and the suite must stay a green
gate while the fix is still queued behind a running game check.

Move each into `test/` in the same commit as its fix.

| file | fails on | fixed by |
|---|---|---|
| `carrier_timer.lua` | `Session.missingMark` missing | the unreachable-branch fix in the carrier watcher (`found and nil or hours`) |
| `case_completion_state.lua` | `Session.completion` / `Session.retiredGapFields` missing | sound gap reporting across the four completion states, and carrying gap state through retirement |

Both were verified to fail for the intended reason — a missing API, not a
syntax error — and not to fail for any other.
