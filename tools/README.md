# Tools

Future repository tooling lives here.

Planned responsibilities after the relevant schemas exist:
- validate built-in content IDs/references;
- validate canonical fixtures before packaging;
- run content/schema checks in CI;
- assist deterministic development-time content generation without putting runtime AI into the core game;
- secret-scan provider profiles/API keys.

Do not build a generic external content-pack validator before a second real content set exists. The first schema should be extracted from working built-in content, not invented in advance.

## Release pipeline

`release_pipeline.py` is the offline ADR-0003 implementation. From a clean checkout, run:

```text
python3 tools/release_pipeline.py all --output dist
```

It validates and packages only the built-in production mod. It is deliberately not a generic content-pack validator and contains no upload, publication or Workshop API behavior. See `docs/design/RELEASE_AND_DISTRIBUTION.md` for the artifact contract and cross-device procedure.

`check_changed_range.py` is the fail-closed release-workflow diff gate. Push
events require a resolvable `before` commit; only GitHub's exact forty-zero
new-branch sentinel selects the empty tree. Pull requests use the supplied base,
and manual dispatch checks the event commit's parent (or the empty tree for a
root commit).
