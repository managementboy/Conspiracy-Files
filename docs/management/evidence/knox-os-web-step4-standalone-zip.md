# Step 4 findings: the standalone zip, verified — GitHub Pages publish held back

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

## What was not done, on purpose: publishing to GitHub Pages

The plan's step 4 also names an actual GitHub Pages publish. That means
making this tool reachable at a public URL, which is not a reversible,
purely-local action — it's the kind of action this project's own working
agreement holds back for the owner to decide, not something to do
unilaterally while "building the plan." Two decisions belong to the owner
before that happens:

- Whether this repository (or a mirror of just this folder) should have a
  publicly-reachable `gh-pages` branch or Pages-enabled `docs/` folder at
  all, given the repository's own visibility settings.
- Whether "runs right out of GitHub" means a public Pages URL specifically,
  or whether the verified standalone zip already satisfies that half of
  the original ask on its own, without needing a public URL at all.

The zip path is real, tested, and ready. The Pages path is one command
away (`git subtree push` or a small Actions workflow, either standard) but
is not run without that go-ahead.
