# Initialization

**Status:** v0.1 deliberately avoids full map-wide initialization.

For v0.1:
- use two hand-curated/hardcoded story locations from the built-in fixture;
- load the built-in authored thread;
- validate IDs/references;
- prepare one anchor + one fallback opportunity;
- place content through the exact-once mechanism proven by T4;
- do not scan/categorise the full map;
- do not support retrofit, migration, external packs or multiplayer.

Future map-wide Location Registry work is constrained by T2/T3. Curated building and non-building arrival uses T8's bounded/debounced exact predicates. Retrofit remains post-v1 and would require T6.
