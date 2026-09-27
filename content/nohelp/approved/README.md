# approved/

Stage-0 lists signed off by Claude. `axioms.json`:

    {"containment": [{"id": "...", "gloss": "..."}],
     "agricultural": [{"id": "...", "gloss": "..."}]}

(a plain array of ids per conspiracy also works). Until this file exists the
converter checks only the shape of a row's `axioms`; once it exists every id
must be on it and each row must name at least one per conspiracy.
