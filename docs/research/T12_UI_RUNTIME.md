# Spike T12 — Build 42 ISUI notebook runtime feasibility

- **Status:** Planned
- **Project Zomboid build tested:** Not yet tested; final run must verify the installed build independently
- **Platform:** Windows, manual GUI route
- **Probe path/commit:** `dev/t12-ui-runtime/`
- **GitHub issue:** [#25](https://github.com/managementboy/Conspiracy-Files/issues/25)
- **API/event/classes used:** Candidate APIs must be confirmed against the installed build and listed in the final report

## Question

Can Build 42 ISUI implement the approved minimum Inspect and survivor-notebook interaction model without fragile global overrides, inaccessible focus behavior or resolution/font-scaling failures?

## Method

Build a disposable UI-only mod using synthetic known-state data. Validate each capability independently before composing the full probe window. Use native classes and cooperative hooks only; do not replace vanilla Lua files or redistribute extracted PZ assets.

The minimum matrix is:

1. movable and resizable notebook window with enforced minimum usable dimensions;
2. master-detail layout at wide width and list-then-detail compact behavior after resize;
3. right-edge Journal/Evidence controls with visible labels and stable active state;
4. independently scrolling long-document body while title/actions remain fixed;
5. separate Help utility window, Escape closing the topmost mod window and best-effort focus restoration;
6. PZ font-size changes and common resolutions without clipped essential text or horizontal document scrolling;
7. keyboard navigation and visible focus through tabs, list, detail actions, Help and Close;
8. controller discovery, activation and return path, recording an explicit unsupported verdict if no cooperative route exists;
9. repeated open/close/resize cycles, remembered geometry where supported, and coexistence with vanilla and one additive foreign UI/context-menu listener;
10. high-contrast presentation with state labels and geometry remaining understandable without color.

## Observed behaviour

Not run.

## Measurements

Record tested resolutions, font settings, minimum dimensions, layout breakpoint, scroll behavior, focus route, controller route, open/relayout timing and any retained geometry fields.

## Limitations

Browser prototype behavior is design evidence only. Static inspection of installed Lua files is API-discovery evidence only. Neither can prove rendering, focus, controller or coexistence behavior in a live save.

## Verdict

Pending live run. Production notebook Lua remains blocked until this report has an evidence-backed verdict and the UI specification incorporates any limitations.

## Decision links

P1-Q9, P2-Q20/P4-R05, P2-Q62/Q63/P4-R46, P2-Q142/P4-R29/P4-R46, P4-R16, P4-R21, P4-R38 and P4-R45.
