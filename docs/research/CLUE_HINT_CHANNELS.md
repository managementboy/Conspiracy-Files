# Clue hint announcement channels — Build 42.20.4

Verified against the installed game (`42.20.4`, revision `b0bbce05d5`) on
2026-09-06, not assumed.

## Halo text

`HaloTextHelper.addText(character, text)` is live in Build 42 vanilla, e.g.
`media/lua/client/Foraging/forageClient.lua:73`. Variants `addBadText` and
`addGoodText` also exist and are used by `ISInventoryPage` and
`ISWorldObjectContextMenu`. Conspiracy-Files calls it through `pcall` behind an
existence check, so a future signature change degrades to the speech bubble
rather than breaking the hint.

## Sound

`getSoundManager():playUISound(name)` is the UI channel. It is used throughout
vanilla UI code (`ISRecipeScrollingListBox`, `ISTiledIconListBox`,
`ISWidgetAutoToggle`). It does **not** reach the world sound manager, so it
cannot attract zombies — unlike `character:playSound(...)`,
`character:getEmitter():playSound(...)` or `addSound(...)`, none of which this
mod calls.

UI sound events are declared in
`media/scripts/generated/sounds/sounds_ui.txt`. Available names:

    UIAchievement, UIActivateButton, UIActivateMainMenuItem,
    UIActivatePlayButton, UIActivateTab, UIClickToStart,
    UIHighlightMainMenuItem, UIObjectMenuEnter, UIObjectMenuObjectPickup,
    UIObjectMenuObjectPlace, UIObjectMenuObjectRotate,
    UIObjectMenuObjectRotateOutline, UIPauseMenuEnter, UIPauseMenuExit,
    UISelectListItem, UIToggleComboBox, UIToggleTickBox,
    UIVehicleMenuClose, UIVehicleMenuOpen

**Chosen: `UIObjectMenuEnter`.** Quiet, and rare in normal play (build-mode
object menu only), so it is not confused with routine UI feedback.

**Rejected: `UIAchievement`.** It resolves to the FMOD event `Game/LevelUp`
(`sounds_ui.txt:165-172`), so a player would read it as a skill level-up.

**Rejected: `UISelectListItem`.** Fires constantly in menus; it would not
register as meaningful.

The name is the single constant `HINT_SOUND` in `ClueHints.lua`.
