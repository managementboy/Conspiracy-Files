# Conspiracy-Files — Glossary

Terms are deliberately separated so content, domain model and UI do not use the same word for different things.

- **Asset** — authored world content or an item/content definition available to be placed or resolved (letter, key, photo, memo, etc.).
- **Evidence** — the player's recorded encounter with an asset/object/fact in a specific context. Evidence facts are immutable; interpretation may change.
- **Clue** — product/content-authoring term for an asset, fact, or context intentionally designed to contribute to the conspiracy. In implementation, model it as Asset/Evidence/Relationship rather than a generic `Clue` entity unless a later ADR says otherwise.
- **Lead** — player-facing indication that existing evidence suggests something worth investigating next. A lead is not a quest objective.
- **Narrative thread** — an authored cluster of conspiracy content/causality. Avoid using plain “thread” for this in code/docs.
- **Player thread** — a lightweight player-created name/grouping for evidence/nodes.
- **Theory** — player-authored hypothesis built from evidence; never authoritative world truth.
- **Identity** — one encountered name/role/cover identity. Different identities may later be linked `SAME_PERSON` but remain separate records to preserve encounter history.
- **Organisation** — one organisation entity whose label may refine from generic to specific when corroborated.
- **Location candidate** — a real PZ place that could satisfy a story location requirement.
- **Story location requirement** — authored need such as “police station” or an exact location.
- **Anchor** — a required discovery path into/through a narrative thread.
- **Fallback** — alternate placement/opportunity used if the anchor cannot safely materialise. It is not a meaningless false lead.
- **Interpretation** — current meaning assigned to immutable evidence facts.
- **Provenance** — internal origin of a statement/link (game fact, authored content, player note, system inference, runtime AI).
- **Runtime AI** — optional player-invoked external model functionality; never required for core play.
- **Development-time AI** — authoring assistant used before shipping; output requires human approval.
