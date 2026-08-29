# Tools

Future repository tooling lives here.

Planned responsibilities after the relevant schemas exist:
- validate built-in content IDs/references;
- validate canonical fixtures before packaging;
- run content/schema checks in CI;
- assist deterministic development-time content generation without putting runtime AI into the core game;
- secret-scan provider profiles/API keys.

Do not build a generic external content-pack validator before a second real content set exists. The first schema should be extracted from working built-in content, not invented in advance.
