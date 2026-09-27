# incoming/

Drop one `<ticket-id>.json` per ticket here: an array of rows (handoff
section 6), or `{"status": "CLASSIFIER_STOP", "rows": [...]}` when generation
stopped partway. The converter removes each file once it has sorted its rows
into `accepted/` and `rejected/`.
