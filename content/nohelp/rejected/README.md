# rejected/

Written by `tools/nohelp_content/convert.lua`. `<ticket-id>.json` lists each
returned row with its reason codes (handoff section 7, plus DUPLICATE,
ONE_SIDED, NO_PROV, NO_GLOSS, DENSITY, EMPHASIS, CITE_NOT_VANILLA and
RESERVED_NAME). `merged: true` marks rows that passed on their own but broke
the list merged with everything accepted so far. Fix the pattern, not just
the row, and deliver the ticket again through `incoming/`.
