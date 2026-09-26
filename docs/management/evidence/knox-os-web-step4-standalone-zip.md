# Step 4 findings: standalone zip and GitHub Pages, both live and verified

docs/design/KNOX_OS_WEB_PDA_PLAN_2026-09-26.md §7 step 4.

## What was built and verified

`git archive --format=zip HEAD:web/knox-os-pda` — the exact mechanism the
plan calls for (§3: "built by `git archive` of the exact commit tagged as
deployed to Pages, never a hand-copied artifact") — produces a 211 KB zip
containing `index.html`, `lua/`, `content/`, `assets/`, and the `spikes/`
fixtures. Extracted to a plain folder and opened `index.html` directly by
file path, with no server, no build step, and no network access beyond the
CDN-loaded Lua VM: the real playthrough tool renders correctly — real
mystery content, real engine state, real text. This is the literal
"download a zip, unzip it, open it" path the original ask named, and it
now has a real, verified pass, not an assumption.

## GitHub Pages: held for confirmation, then published

The owner clarified the actual goal directly: *"the goal was to be able to
open it directly from github"* — meaning the Pages publish was the point,
not an optional extra alongside the zip. Confirmed explicitly before
acting (the repo is public; publishing makes the tool itself live and
clickable, not just browsable as source), then done:

1. A `gh-pages` branch, built as an orphan branch (no history from `main`)
   containing only `web/knox-os-pda`'s own contents at its root — not the
   whole repo, and specifically not colliding with the `docs/` folder this
   repo already uses for design and management documentation, which stays
   exactly what it is.
2. Pushed to `origin` (`github.com/managementboy/Conspiracy-Files`).
3. Pages enabled against that branch via the GitHub API
   (`source.branch=gh-pages`, `source.path=/`).

**Live at <https://managementboy.github.io/Conspiracy-Files/>.** Verified
from the real public URL, not just assumed from a successful API call: all
three mysteries load, and tapping a clue calls the real
`Ledger.markKnown` and updates the on-screen record exactly as the local
copy does.
