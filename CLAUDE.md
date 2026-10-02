## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

Rules:
- For codebase questions, first run `graphify query "<question>"` when graphify-out/graph.json exists. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `tools/docscrape/graph_refresh.sh` (not plain `graphify update .`) to keep the graph current (AST-only, no API cost). Plain `graphify update .` drops the Project Zomboid Javadoc nodes; the script re-merges them.
- For Project Zomboid Java API lookups (classes, methods, inheritance), `graphify query "<question>" --graph graphify-out/pz-javadocs-graph.json` always works, even if the combined graph lost the Javadoc nodes. Rebuild that file with `python3 tools/docscrape/pz_javadocs_to_graph.py`.

## Coding guidelines (Karpathy guidelines)

Adapted from [multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills) (MIT), derived from Andrej Karpathy's
observations on LLM coding pitfalls. They bias toward caution over speed; for trivial tasks use judgment. Where they conflict with an
owner decision or a rule above, the owner decision wins.

1. **Think before coding.** State assumptions; if uncertain, ask. If several interpretations exist, present them rather than picking silently.
   If a simpler approach exists, say so. If something is unclear, stop and name what is confusing.
2. **Simplicity first.** The minimum code that solves the problem. No features beyond what was asked, no abstractions for single-use code, no
   unrequested configurability, no error handling for impossible cases. If 200 lines could be 50, rewrite.
3. **Surgical changes.** Touch only what the request needs. Don't improve adjacent code, comments or formatting; match existing style; don't refactor
   what isn't broken. Mention unrelated dead code instead of deleting it. Remove only the orphans your own change created. Every changed line must trace
   to the request.
4. **Goal-driven execution.** Turn the task into a verifiable goal ("fix the bug" -> a test that reproduces it, then passes; "refactor" -> tests pass
   before and after). For multi-step work, state a short plan with a check per step, and loop until the checks pass.
