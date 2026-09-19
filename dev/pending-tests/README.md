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
| `retire_after_final_drop.lua` | `Session.completion`, then `R.retireIfAccounted` missing | re-checking `Session.accounted` from both drop paths, so a case completed by a drop frees its active slot |

Each was verified to fail for the intended reason — a missing API, with its
dependencies asserted up front so it fails with a sentence rather than crashing
on a nil call — and not for any other.

**A red test proves nothing about its later assertions.** Everything after the
first failing line is unexercised, so passing the green suite says nothing about
these files. They only become evidence once their fix lands and they run to the
end.
