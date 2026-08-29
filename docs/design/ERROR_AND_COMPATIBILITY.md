# Error Containment and Mod Compatibility

## Error boundaries
- Every Project Zomboid event adapter executes project logic behind `pcall`.
- Canonical state changes should be staged so a thrown error does not leave half-applied multi-step changes.
- Repeated failures in one subsystem auto-disable that subsystem for the session after a bounded threshold (exact N to be selected during implementation) and emit one concise notification/log record instead of continuous spam.

## Mod compatibility rules
- Never replace vanilla Lua files.
- Use one project namespace: `ConspiracyFiles`.
- Never assume an event/context-menu hook is exclusively ours.
- Add menu entries cooperatively; do not replace vanilla handlers.
- Avoid mutating unrelated ModData or item fields.
- Detect multiplayer and disable cleanly until an MP architecture exists.
