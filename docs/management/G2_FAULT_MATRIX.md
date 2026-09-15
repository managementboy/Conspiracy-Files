# G2 interrupted-placement fault matrix

This matrix records the mock regression boundary for the generated-investigation adapter. A physical token is evidence of an item identity; scans are deliberately incomplete and a zero result is never proof of destruction.

| Fault / observation | Expected persisted state | Replacement policy | Harness coverage |
| --- | --- | --- | --- |
| Before placement intent | `pending`, then `placing` before creation | Normal first placement only | Fresh generated case reaches one `placed` token |
| Saved `placing`, target loaded, zero matching tokens | `unknown` | Never create a replacement | `g2_faults.lua`: interrupted intent |
| Saved `placing`, exactly one matching token found | `placed` | No duplicate | `g2_faults.lua`: positive-token acknowledgement |
| Target container/square unloaded | retain `pending` | Defer until a future loaded resolution | `g2_faults.lua`: unloaded container |
| Token moved beyond identity scan coverage | retain prior `placed` state | No replacement from zero observations | `g2_faults.lua`: out-of-scan token |
| Two matching token observations | `conflict` (sticky) | No guess or automatic repair | `g2_faults.lua`: duplicate conflict |
| Owned, positively validated token inspected | append document ID to `known` | Discovery persists across reload | `g2_faults.lua`: saved known evidence |

The harness is offline Lua 5.1 only. It verifies adapter decisions against mocked loaded containers and periodic identity scanning. It cannot establish Project Zomboid engine timing, save interruption at an individual bytecode instruction, inventory-event ordering, or actual map streaming behavior. Those remain native acceptance checks when the owner returns.
