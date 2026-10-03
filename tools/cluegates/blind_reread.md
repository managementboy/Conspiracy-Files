# Blind re-read — prompt and receipts

For Claude (the engineering and review AI), when a batch of No Help clues has
been accepted by `tools/nohelp_content/convert.lua`. Writer and engineer
material: the owner plays blind and is never sent clue text or results.

## Who reads

A model **different from the writer's** (the writer is ChatGPT; use e.g. a
Gemini or Llama model, or a Claude model with no access to this repository or
conversation). The reader is given nothing but the prompt below and one clue.
No lean, no rival reading, no gloss, no axioms, no anchor, no other clue.

## Review sequence (DR-20260928-NOHELP-CLUE-CHECK)

1. Run the converter check and the test suite.
2. Read the whole batch once for repeated wording, near-duplicates and
   consistency across clues.
3. One blind read per clue: could a believer of A use it? could a believer of
   B use it? The result is A, B, both or none.
4. A or B: the clue goes into the game as written. **Both is a return (owner,
   2026-10-02):** every clue must read clearly for exactly one conspiracy, so a
   clue whose receipt is "both" is rewritten in place (same id, slot, place,
   kind, pieces and lean; only title, body, gloss and the rival-reading line,
   which becomes "None: one-sided on purpose") until a fresh read says A or B.
   Remove the rival hooks (closures and evacuations from a farm-side clue,
   crops, spray and residue from an official-side clue) rather than adding a
   statement of the side. None: drop it and
   the writer writes a new one (`FITS_NEITHER`). No second reads, no returns
   for "wrong side".

## Scripted (use this)

    tools/cluegates/blind_reread.sh                  # each clue without a current receipt
    tools/cluegates/blind_reread.sh --rows <ticket>  # draft rows, before converting

Haiku through the `claude` CLI, from an empty folder, no tools, no settings,
a fresh session for each read. Receipt `tools/cluegates/receipts/<id>.json`:

    {"clue": "<id>", "sha256": "<render hash>", "model": "<reader>",
     "date": "YYYY-MM-DD", "votes": {"A": 0, "B": 0, "both": 0, "none": 0}}

exactly one read. Editing a clue's title, body, pieces or places voids its
receipt.

## The prompt (copy exactly; replace the last block)

```
You are reading one item found in a video game set during a zombie outbreak
in rural Kentucky. Two rival explanations of the outbreak exist in this game:

A. Containment Cover-up: officials or the military mismanaged the evacuation
   or containment response, and covered up the failure.
B. Agricultural Program Malfunction: an experimental pesticide or
   agricultural program malfunctioned.

Below is the item exactly as the player finds it: its title, its text, the
objects that make it up, and the kind of place and spot where it lies.
Nothing else is known about it.

Could a person who already believes A point to this item as support for A?
Could a person who already believes B point to it as support for B? Judge
each separately and honestly: "YES" only if you can say what in the item they
would point to. Answer in exactly this form:

A: YES or NO - one sentence naming what they would point to, or why not
B: YES or NO - one sentence naming what they would point to, or why not

---
<paste the rendered clue text here>
---
```

## Rewriting "both" clues in place

    # list them: ids whose receipt's top vote is "both"
    python3 -c "import json,glob;[print(d['clue']) for d in map(lambda f:json.load(open(f)),sorted(glob.glob('tools/cluegates/receipts/*.json'))) if max(d['votes'],key=d['votes'].get)=='both']"
    python3 tools/nohelp_content/redeliver.py edits.json   # edits.json = {id: {title, body, rival_reading, gloss}}
    lua5.1 tools/nohelp_content/convert.lua --check && lua5.1 tools/nohelp_content/convert.lua
    tools/cluegates/blind_reread.sh <ids>                  # the old receipt is stale by hash

At most three rewrites per clue; the receipt must come back A or B.
