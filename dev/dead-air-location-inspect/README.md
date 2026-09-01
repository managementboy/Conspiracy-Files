# Dead Air live location inspection

Disposable pure-Lua/manual inspection aid for provisional Dead Air candidates
R2 and P2. It is not production Conspiracy-Files code and makes no story
selection automatically.

The aid activates only when it is the sole enabled mod and the disposable save
name begins `CF_dead_air_location_live`. Every engine fact is printed with the
`[CF-DA-LOC]` prefix. Human observations and screenshots remain the authority
for signage, access, furnishing character and story plausibility.

## Owner controls

Right-click any item in the player inventory to use four clearly prefixed
actions:

- `Dead Air: Go to R2`
- `Dead Air: Go to P2`
- `Dead Air: Record Room`
- `Dead Air: Scan Building`

The two movement actions occur only after the owner selects them.
They are convenience teleports, not route evidence. Regional route plausibility
must be judged separately from the in-game map and ordinary visible roads.
The guarded disposable save continually heals the test character and removes
zombies within 120 tiles using the installed game's ordinary Lua object-removal
surface. It explicitly leaves ghost/no-clip mode off so doors, stairs and
obstruction remain meaningful access evidence. Zombie presence or absence is
not part of this location review.
The guarded save also creates and equips one probe-marked disposable crowbar so
the owner can use ordinary forced-entry actions without bare-handed glass risk.
No keyboard shortcut is registered; the probe therefore cannot collide with
vanilla letter-key panels.

## Safety boundary

- Use only the prepared disposable save and this one mod.
- Use ordinary manual keyboard/mouse input only.
- Do not use debug mode, external helpers, injected agents, macros, synthetic
  input, computer control, security changes, exclusions or bypasses.
- If any security alert appears, close Project Zomboid immediately and stop.
- Do not infer visual story character from logged room names or container types.
- After evidence capture, archive rather than delete the disposable save, mod,
  log and screenshots; restore all control files byte-for-byte and leave PZ
  closed.
