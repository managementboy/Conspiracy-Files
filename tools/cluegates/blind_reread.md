# Blind re-read — prompt and receipts

For Claude (the engineering and review AI), when a batch of No Help clues has
been accepted by `tools/nohelp_content/convert.lua`. Writer and engineer
material: the owner plays blind and is never sent clue text or results.

## Who reads

A model **different from the writer's** (the writer is ChatGPT; use e.g. a
Gemini or Llama model, or a Claude model with no access to this repository or
conversation). The reader is given nothing but the prompt below and one clue.
No lean, no rival reading, no gloss, no axioms, no anchor, no other clue.

## Scripted (use this)

    tools/cluegates/blind_reread.sh                 # every clue without a current receipt
    tools/cluegates/blind_reread.sh --rows <ticket>  # a draft, before converting

Haiku through the `claude` CLI, from an empty folder, no tools, no settings,
a fresh session per read; 5 reads per clue; receipts written as below. The
steps that follow are what it does.

## How

1. For each clue, get the exact text the reader sees and its hash:

       lua5.1 tools/cluegates/check_receipts.lua --render <clue id>

2. Run the prompt below with that text **at least 5 times**, each in a fresh
   conversation (independent runs, no memory between them). Record only the
   first word of each answer: `A`, `B` or `NEITHER`.
3. Write the receipt `tools/cluegates/receipts/<clue id>.json`:

       {"clue": "<clue id>",
        "sha256": "<the hash printed in step 1>",
        "model": "<reader model and version>",
        "date": "YYYY-MM-DD",
        "votes": {"A": 0, "B": 0, "neither": 0}}

4. Run `lua5.1 tools/cluegates/check_receipts.lua`. It reports, per clue,
   `NO_RECEIPT`, `BAD_RECEIPT`, `STALE_RECEIPT` (the text changed after the
   receipt: re-read it), `NEVER_RIVAL` (never read as the conspiracy it cuts
   against: one-sided, return it to the writer) or `MOSTLY_NEITHER` (read as
   neither in more than half the runs: return it). A clue ships only with a
   valid receipt; the shipped test suite enforces this once the clue list is
   not empty.

Editing a clue's title, body, pieces or places changes its hash and voids its
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

Which explanation does this item, on its own, point toward? Answer with one
word first - A, B or NEITHER - then at most one sentence of reasoning.
Do not guess what the game's authors intend; read only what is here.

---
<paste the rendered clue text here>
---
```
