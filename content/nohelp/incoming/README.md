# incoming/

Drop one `<ticket-id>.json` per ticket here: an array of rows (handoff
section 6), or `{"status": "CLASSIFIER_STOP", "rows": [...]}` when generation
stopped partway. The converter removes each file once it has sorted its rows
into `accepted/` and `rejected/`.

`T0000.json` (stage 0) is the exception: one object with the two axiom lists
and the story glosses (writer handoff section 5). The converter leaves it here
for Claude's sign-off.
