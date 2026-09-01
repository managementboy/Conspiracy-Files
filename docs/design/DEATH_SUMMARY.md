# Death Summary Behaviour

The death recap is an optional base-v0.1 emotional payoff, not a
network-dependent transaction. P4-R47 implements canonical death/reload safety
without implementing a recap.

## Required path if implemented
- Build a deterministic summary from canonical journal/evidence state with no AI dependency.
- Persist enough summary input/state before or as death handling begins that an interrupted UI/network step cannot erase the recap.
- Runtime AI, if configured, may later rewrite/enhance the deterministic recap but never reveal hidden truth.

## Failure/edge cases
- **AI pending/fails:** show deterministic recap.
- **No network/API key:** show deterministic recap.
- **Alt-F4 during death flow:** on next valid load, use only the last valid canonical state if the game/save semantics allow it; the E10 live matrix must pass before any durability claim.
- **Save-scumming:** no special anti-save-scum mechanism is planned; canonical state follows the actual loaded save.
