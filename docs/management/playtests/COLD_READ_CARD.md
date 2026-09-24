# Cold read card

Fill this in **while playing**, not after. Copy it to
`docs/management/playtests/<date>-<seed>.md` and commit it with the session's
log.

Playing is currently the only method with a real hit rate. Every player-facing
bug in the 2026-09-24 sessions was found this way; none was found by the 197
offline tests. This card exists so those findings survive as evidence instead
of as a memory of an afternoon.

Keep it to one page. A card that takes half an hour stops being filled in.

---

## Before launching

**Seed / save:** 
**Build (git sha):** 
**One prediction — how do you expect this to fall short?**

> Written before play, sealed. A session that confirms a prediction is weak
> evidence; a session that surprises you is strong. Without this, every
> session confirms whatever you already believed.

---

## Beat log

One line whenever your *intention* changes. Timestamps matter more than prose —
they overlay onto `console.txt`'s `ev=` lines afterwards.

| time | what I just learned | what I intend to do next |
|---|---|---|
|  |  |  |

---

## The two numbers

- **First genuine lead at:** 
- **Last genuine lead at:** 
- **Dead ends that produced no next action:** 

---

## Both readings

Before opening any debug output, argue **both** central theories from evidence
you physically picked up. Two short paragraphs, two named findings each.

> If you cannot write both, the case failed its central requirement — and that
> is a finding, not a failure of the exercise.

**A:**

**B:**

---

## Verdict

`SHIPPABLE` / `BORING` / `INCOHERENT` / `UNSOLVABLE`

**Where I lost interest, and what was on screen at that moment:**

---

## Anything the mod did that you did not ask for

The 2026-09-24 session filled the PDA with identical "A key" rows while the
survivor picked up nothing. That class — the mod acting unbidden — is worth
its own line, because it is invisible to every test that checks whether a
thing is *well formed*.

---

## If something did not happen

Before reporting "nothing happened", ask the mod why. Each subsystem keeps the
reason for its last refusal, even when silent:

```lua
ConspiracyFiles.Log.lastDecline()            -- every module's last reason
ConspiracyFiles.Log.lastDecline("cluesearch")
ConspiracyFiles.verbose.cluesearch = true    -- print them from now on
```

Modules wired so far: `keys`, `keydoor`, `cluesearch`.
