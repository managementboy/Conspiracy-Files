# HANDHELD PDA — rectangle-built PDA design package

## A. Design description

A straight-on, orthographic 400 × 620 charcoal organizer. The exact 320 × 422 green-gray LCD begins at (40, 50), occupying 80% of the device width and approximately 68% of its height. An eight-pixel recessed surround encloses it without entering its usable pixels. The remaining 148 pixels below the LCD provide the broad PalmPilot-inspired chin: a plain charcoal face above a recessed bank of four application keys surrounding an up/down rocker. The top casing is unbranded and carries only a small power indicator.

Flat, solid strips imply shallow plastic depth. Highlights sit primarily above and left; shadows sit below and right. Stepped housing and key corners use axis-aligned rectangles. The LCD is evenly filled with no gradient, texture, blur, procedural noise, or imported visual asset. Six optional scuff rectangles add restrained wear. The default assembled image includes them; clean-housing omits them.

Coordinates start at the top-left, increase right/down, and describe half-open rectangles as x, y, width, height. Every device geometry coordinate is an integer. The seventeen layers draw in ascending order from C01 to C19; C06 and C07 are retired following removal of the screen content and handwriting panel. All have parent `device`; parentage is organizational, and no additional parent transform is implied beyond the device origin. C05 is the blank LCD; no screen-content layer is included. All other layers are hardware and remain outside the usable LCD.

Text uses ordinary system Arial/Arial Bold for reference PNGs and Arial, sans-serif in SVG; no font file is distributed or required by the game. UI Small/Medium are intended built-in game categories, not a promise that their metrics match this reference. Text coordinates specify baseline anchors. Center/right alignment is resolved with measured reference-font widths, then the left position is rounded to the nearest integer pixel (ties to even) for both SVG and PNG. All authored anchors and rectangle geometry are integer. The reference raster uses one-bit glyph coverage, maintaining the eleven-color palette. SVG viewers may antialias text differently.

Palette values below are **R, G, B, A**, each in [0,1]. They do not specify any Lua API argument order. Alpha is 1 for every primitive; empty layer space has alpha 0. All shapes are fills; rectangular borders are explicitly expanded to four strips with thickness encoded by their dimensions. Primitive border_thickness is therefore 0.

| Color | HEX | Normalized RGBA |
|---|---|---|
| edge | #171C1D | 0.090196, 0.109804, 0.113725, 1.000000 |
| shadow | #282E2F | 0.156863, 0.180392, 0.184314, 1.000000 |
| body | #3B4243 | 0.231373, 0.258824, 0.262745, 1.000000 |
| face | #4B5353 | 0.294118, 0.325490, 0.325490, 1.000000 |
| highlight | #707A77 | 0.439216, 0.478431, 0.466667, 1.000000 |
| key | #596260 | 0.349020, 0.384314, 0.376471, 1.000000 |
| legend | #B3BCAC | 0.701961, 0.737255, 0.674510, 1.000000 |
| lcd | #A7B394 | 0.654902, 0.701961, 0.580392, 1.000000 |
| ink | #303C30 | 0.188235, 0.235294, 0.188235, 1.000000 |
| lcd_mid | #7F8F73 | 0.498039, 0.560784, 0.450980, 1.000000 |
| lcd_light | #BDCAAC | 0.741176, 0.792157, 0.674510, 1.000000 |

## B. Exact component and shape manifest

`manifest.json` is authoritative. `render.py` reads it to generate every device view and every isolated layer. `make_manifest.py` is the initial authoring utility and should only be run if intentionally resetting the design. Edit manifest.json to revise the design, then run render.py.

Below, rectangles are component-local x,y,w,h. Text uses local x,baseline_y; alignment, weight, pixel size and UI category are explicit. Each table is the actual primitive drawing order. Every row has alpha 1 and border thickness 0. Repeated shapes are expanded into individual instances, so no hidden recipe is required. Strip frames follow top, bottom, left, right order; all resulting strips appear below. Rectangle symbols are individual primitives as well.

### C01 — Housing silhouette

Order 1; parent `device`; device bounds `[0, 0, 400, 620]`; role `hardware`; optional: False. Stepped charcoal shell; a real rectangular opening reserves every LCD pixel.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C01.01 | rect: [12, 0, 376, 4] | edge | — |
| C01.02 | rect: [6, 4, 388, 4] | edge | — |
| C01.03 | rect: [2, 8, 396, 4] | edge | — |
| C01.04 | rect: [0, 12, 400, 38] | edge | — |
| C01.05 | rect: [0, 50, 40, 422] | edge | — |
| C01.06 | rect: [360, 50, 40, 422] | edge | — |
| C01.07 | rect: [0, 472, 400, 136] | edge | — |
| C01.08 | rect: [2, 608, 396, 4] | edge | — |
| C01.09 | rect: [6, 612, 388, 4] | edge | — |
| C01.10 | rect: [12, 616, 376, 4] | edge | — |
### C02 — Housing face and edge bevels

Order 2; parent `device`; device bounds `[2, 2, 396, 616]`; role `hardware`; optional: False. Flat top-left highlights and bottom-right shadows soften stepped corners.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C02.01 | rect: [10, 0, 376, 4] | body | — |
| C02.02 | rect: [4, 4, 388, 4] | body | — |
| C02.03 | rect: [0, 8, 396, 40] | body | — |
| C02.04 | rect: [0, 48, 38, 422] | body | — |
| C02.05 | rect: [358, 48, 38, 422] | body | — |
| C02.06 | rect: [0, 470, 396, 132] | body | — |
| C02.07 | rect: [4, 602, 388, 8] | body | — |
| C02.08 | rect: [10, 610, 376, 4] | body | — |
| C02.09 | rect: [10, 4, 374, 2] | highlight | — |
| C02.10 | rect: [4, 8, 2, 38] | highlight | — |
| C02.11 | rect: [2, 46, 2, 552] | highlight | — |
| C02.12 | rect: [6, 598, 2, 8] | highlight | — |
| C02.13 | rect: [390, 10, 4, 590] | shadow | — |
| C02.14 | rect: [8, 606, 380, 4] | shadow | — |
| C02.15 | rect: [12, 610, 372, 2] | shadow | — |
| C02.16 | rect: [12, 10, 370, 32] | face | — |
| C02.17 | rect: [12, 42, 18, 438] | face | — |
| C02.18 | rect: [366, 42, 16, 438] | face | — |
| C02.19 | rect: [12, 480, 370, 116] | face | — |
### C03 — Power indicator

Order 3; parent `device`; device bounds `[40, 17, 320, 23]`; role `hardware`; optional: False. Passive rectangular status lamp on an unbranded top casing.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C03.01 | rect: [306, 5, 14, 8] | edge | — |
| C03.02 | rect: [308, 7, 10, 4] | lcd_mid | — |
| C03.03 | rect: [308, 7, 10, 1] | lcd_light | — |
### C04 — Recessed screen surround

Order 4; parent `device`; device bounds `[32, 42, 336, 438]`; role `hardware`; optional: False. Eight-pixel inset built solely from strips around the exact LCD aperture.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C04.01 | rect: [0, 0, 336, 2] | highlight | — |
| C04.02 | rect: [0, 436, 336, 2] | highlight | — |
| C04.03 | rect: [0, 2, 2, 434] | highlight | — |
| C04.04 | rect: [334, 2, 2, 434] | highlight | — |
| C04.05 | rect: [2, 2, 332, 4] | edge | — |
| C04.06 | rect: [2, 432, 332, 4] | edge | — |
| C04.07 | rect: [2, 6, 4, 426] | edge | — |
| C04.08 | rect: [330, 6, 4, 426] | edge | — |
| C04.09 | rect: [6, 6, 324, 2] | shadow | — |
| C04.10 | rect: [6, 8, 2, 422] | shadow | — |
| C04.11 | rect: [328, 8, 2, 422] | lcd_mid | — |
| C04.12 | rect: [6, 430, 324, 2] | lcd_mid | — |
### C05 — LCD background

Order 5; parent `device`; device bounds `[40, 50, 320, 422]`; role `lcd`; optional: False. Continuous exact 320 x 422 blank LCD.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C05.01 | rect: [0, 0, 320, 422] | lcd | — |
### C08 — Lower control recess

Order 6; parent `device`; device bounds `[24, 551, 352, 55]`; role `hardware`; optional: False. Shallow stepped pocket beneath the plain lower housing face.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C08.01 | rect: [4, 0, 344, 2] | shadow | — |
| C08.02 | rect: [0, 2, 352, 49] | shadow | — |
| C08.03 | rect: [4, 51, 344, 4] | highlight | — |
| C08.04 | rect: [2, 4, 348, 47] | edge | — |
| C08.05 | rect: [6, 51, 340, 2] | body | — |
### C09 — Notes button

Order 7; parent `device`; device bounds `[34, 559, 62, 36]`; role `hardware`; optional: False. Independent stepped physical application key with a rectangular hitbox.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C09.01 | rect: [3, 0, 56, 2] | shadow | — |
| C09.02 | rect: [0, 2, 62, 32] | shadow | — |
| C09.03 | rect: [3, 34, 56, 2] | shadow | — |
| C09.04 | rect: [3, 2, 56, 31] | key | Pressed fill: body |
| C09.05 | rect: [3, 2, 56, 2] | highlight | Pressed fill: shadow |
| C09.06 | rect: [1, 4, 2, 27] | highlight | Pressed fill: shadow |
| C09.07 | rect: [3, 31, 56, 2] | body | Pressed fill: highlight |
| C09.08 | rect: [59, 4, 2, 27] | body | Pressed fill: highlight |
### C10 — Tasks button

Order 8; parent `device`; device bounds `[104, 559, 62, 36]`; role `hardware`; optional: False. Independent stepped physical application key with a rectangular hitbox.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C10.01 | rect: [3, 0, 56, 2] | shadow | — |
| C10.02 | rect: [0, 2, 62, 32] | shadow | — |
| C10.03 | rect: [3, 34, 56, 2] | shadow | — |
| C10.04 | rect: [3, 2, 56, 31] | key | Pressed fill: body |
| C10.05 | rect: [3, 2, 56, 2] | highlight | Pressed fill: shadow |
| C10.06 | rect: [1, 4, 2, 27] | highlight | Pressed fill: shadow |
| C10.07 | rect: [3, 31, 56, 2] | body | Pressed fill: highlight |
| C10.08 | rect: [59, 4, 2, 27] | body | Pressed fill: highlight |
### C11 — Contacts button

Order 9; parent `device`; device bounds `[234, 559, 62, 36]`; role `hardware`; optional: False. Independent stepped physical application key with a rectangular hitbox.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C11.01 | rect: [3, 0, 56, 2] | shadow | — |
| C11.02 | rect: [0, 2, 62, 32] | shadow | — |
| C11.03 | rect: [3, 34, 56, 2] | shadow | — |
| C11.04 | rect: [3, 2, 56, 31] | key | Pressed fill: body |
| C11.05 | rect: [3, 2, 56, 2] | highlight | Pressed fill: shadow |
| C11.06 | rect: [1, 4, 2, 27] | highlight | Pressed fill: shadow |
| C11.07 | rect: [3, 31, 56, 2] | body | Pressed fill: highlight |
| C11.08 | rect: [59, 4, 2, 27] | body | Pressed fill: highlight |
### C12 — Search button

Order 10; parent `device`; device bounds `[304, 559, 62, 36]`; role `hardware`; optional: False. Independent stepped physical application key with a rectangular hitbox.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C12.01 | rect: [3, 0, 56, 2] | shadow | — |
| C12.02 | rect: [0, 2, 62, 32] | shadow | — |
| C12.03 | rect: [3, 34, 56, 2] | shadow | — |
| C12.04 | rect: [3, 2, 56, 31] | key | Pressed fill: body |
| C12.05 | rect: [3, 2, 56, 2] | highlight | Pressed fill: shadow |
| C12.06 | rect: [1, 4, 2, 27] | highlight | Pressed fill: shadow |
| C12.07 | rect: [3, 31, 56, 2] | body | Pressed fill: highlight |
| C12.08 | rect: [59, 4, 2, 27] | body | Pressed fill: highlight |
### C13 — Central up/down rocker

Order 11; parent `device`; device bounds `[176, 555, 48, 45]`; role `hardware`; optional: False. Split rectangular rocker with independent upper and lower hit regions.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C13.01 | rect: [4, 0, 40, 2] | shadow | — |
| C13.02 | rect: [0, 2, 48, 41] | shadow | — |
| C13.03 | rect: [4, 43, 40, 2] | shadow | — |
| C13.04 | rect: [3, 2, 42, 19] | key | — |
| C13.05 | rect: [3, 23, 42, 19] | key | — |
| C13.06 | rect: [3, 2, 42, 2] | highlight | — |
| C13.07 | rect: [1, 4, 2, 16] | highlight | — |
| C13.08 | rect: [3, 40, 42, 2] | body | — |
| C13.09 | rect: [45, 24, 2, 16] | body | — |
| C13.10 | rect: [3, 21, 42, 2] | edge | — |

Rocker pressed overrides: `{"up": {"C13.04": "body", "C13.06": "shadow", "C13.07": "shadow"}, "down": {"C13.05": "body", "C13.08": "highlight", "C13.09": "highlight"}}`. All omitted primitives retain normal color.
### C14 — Notes symbol and label

Order 12; parent `device`; device bounds `[34, 559, 62, 36]`; role `hardware`; optional: False. Small rectangle-built icon and ordinary UI label.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C14.01 | rect: [25, 5, 12, 1] | legend | — |
| C14.02 | rect: [25, 16, 12, 1] | legend | — |
| C14.03 | rect: [25, 6, 1, 10] | legend | — |
| C14.04 | rect: [36, 6, 1, 10] | legend | — |
| C14.05 | rect: [28, 8, 6, 1] | legend | — |
| C14.06 | rect: [28, 11, 6, 1] | legend | — |
| C14.07 | rect: [28, 14, 6, 1] | legend | — |
| C14.08 | text: x=31, baseline=29 | legend | NOTE; center; 9 px; normal; UI Small |
### C15 — Tasks symbol and label

Order 13; parent `device`; device bounds `[104, 559, 62, 36]`; role `hardware`; optional: False. Small rectangle-built icon and ordinary UI label.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C15.01 | rect: [22, 5, 3, 1] | legend | — |
| C15.02 | rect: [22, 7, 3, 1] | legend | — |
| C15.03 | rect: [22, 6, 1, 1] | legend | — |
| C15.04 | rect: [24, 6, 1, 1] | legend | — |
| C15.05 | rect: [28, 6, 12, 1] | legend | — |
| C15.06 | rect: [22, 10, 3, 1] | legend | — |
| C15.07 | rect: [22, 12, 3, 1] | legend | — |
| C15.08 | rect: [22, 11, 1, 1] | legend | — |
| C15.09 | rect: [24, 11, 1, 1] | legend | — |
| C15.10 | rect: [28, 11, 12, 1] | legend | — |
| C15.11 | rect: [22, 15, 3, 1] | legend | — |
| C15.12 | rect: [22, 17, 3, 1] | legend | — |
| C15.13 | rect: [22, 16, 1, 1] | legend | — |
| C15.14 | rect: [24, 16, 1, 1] | legend | — |
| C15.15 | rect: [28, 16, 12, 1] | legend | — |
| C15.16 | text: x=31, baseline=29 | legend | TASK; center; 9 px; normal; UI Small |
### C16 — Contacts symbol and label

Order 14; parent `device`; device bounds `[234, 559, 62, 36]`; role `hardware`; optional: False. Small rectangle-built icon and ordinary UI label.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C16.01 | rect: [28, 5, 6, 5] | legend | — |
| C16.02 | rect: [25, 12, 12, 5] | legend | — |
| C16.03 | rect: [27, 10, 8, 2] | legend | — |
| C16.04 | text: x=31, baseline=29 | legend | ADDR; center; 9 px; normal; UI Small |
### C17 — Search symbol and label

Order 15; parent `device`; device bounds `[304, 559, 62, 36]`; role `hardware`; optional: False. Small rectangle-built icon and ordinary UI label.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C17.01 | rect: [23, 4, 11, 2] | legend | — |
| C17.02 | rect: [23, 12, 11, 2] | legend | — |
| C17.03 | rect: [23, 6, 2, 6] | legend | — |
| C17.04 | rect: [32, 6, 2, 6] | legend | — |
| C17.05 | rect: [33, 12, 3, 3] | legend | — |
| C17.06 | rect: [35, 15, 3, 3] | legend | — |
| C17.07 | text: x=31, baseline=29 | legend | FIND; center; 9 px; normal; UI Small |
### C18 — Rocker symbols

Order 16; parent `device`; device bounds `[176, 555, 48, 45]`; role `hardware`; optional: False. Up and down direction symbols formed from centered rectangle steps.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C18.01 | rect: [23, 7, 2, 2] | legend | — |
| C18.02 | rect: [21, 9, 6, 2] | legend | — |
| C18.03 | rect: [19, 11, 10, 2] | legend | — |
| C18.04 | rect: [19, 30, 10, 2] | legend | — |
| C18.05 | rect: [21, 32, 6, 2] | legend | — |
| C18.06 | rect: [23, 34, 2, 2] | legend | — |
### C19 — Optional wear overlay

Order 17; parent `device`; device bounds `[0, 0, 400, 620]`; role `hardware`; optional: True. Six sparse fixed scuffs on exposed housing; omit for a pristine device.

| Primitive | Type / local geometry | Color | Text or state detail |
|---|---|---|---|
| C19.01 | rect: [16, 29, 8, 1] | highlight | — |
| C19.02 | rect: [19, 31, 4, 1] | body | — |
| C19.03 | rect: [376, 167, 1, 11] | highlight | — |
| C19.04 | rect: [19, 456, 1, 7] | shadow | — |
| C19.05 | rect: [61, 609, 12, 1] | highlight | — |
| C19.06 | rect: [333, 608, 7, 1] | shadow | — |

### Physical controls

All hitboxes are device-local, rectangular and half-open. Application keys change bevel and face palette colors when pressed; symbols and labels do not shift. The rocker changes only the pressed half, as listed above. Release restores normal colors. There is no geometric movement. The indicator is passive.

| Control | Hitbox x,y,w,h | Intended action |
|---|---|---|
| C09 | [34, 559, 62, 36] | notes |
| C10 | [104, 559, 62, 36] | tasks |
| C11 | [234, 559, 62, 36] | contacts |
| C12 | [304, 559, 62, 36] | search |
| rocker_up | [176, 555, 48, 22] | scroll_up |
| rocker_down | [176, 578, 48, 22] | scroll_down |

The rocker divider occupies device y=576–577 visually; the half-open hit regions are y=[555,577) and [578,600). Row y=577 is intentionally inactive. Key hitboxes include the small transparent stepped corners for easier input. No button dispatch is wired to game actions.

## C. Assembled mockups

![Native 400 × 620](exports/assembled.png)

![Exact 2× nearest-neighbor preview](exports/assembled-2x.png)

![Dimensions outside the device](exports/dimensioned.png)

Dimension ticks denote exact coordinate edges; the LCD is x=[40,360), y=[50,472), with local x=0–319, y=0–421. The dimension drawing translates the device to (100,100); subtract that presentation offset to recover device coordinates. Labels and measurement lines do not enter the device artwork.

## D. Separate components and assembly

![Parts sheet, every layer at the same native scale](exports/parts-sheet.png)

![Flat exploded stack, translation only](exports/exploded.png)

`exports/layers/C01.svg` through `C19.svg` (excluding retired C06 and C07), and matching PNGs, each preserve a transparent 400 × 620 canvas and the original device origin. There are no baked backgrounds, labels, automatic crops or repositioned parts. The parts sheet and exploded diagram have presentation backgrounds, frames and labels only in those separate diagram files. The exploded stack uses front views translated by (24+22i,80+28i), for zero-based index i; it introduces no perspective or rotation. Earlier layers are partly occluded in this stacking diagram; use the unobstructed parts sheet to inspect every layer.

## E. Reproducible source

Run `python render.py --font-dir C:/Windows/Fonts` in this folder with Pillow installed. Only manifest.json supplies device shapes. SVGs contain rectangles and ordinary text, without images, paths, circles, gradients, masks or simulated holes. PNGs are generated directly from the same operations, not screenshot approximations. Native, blank-screen, pristine-housing, six pressed-state views and seventeen transparent parts are exported in SVG and PNG. The 2× PNG uses nearest-neighbor scaling. Font file hashes and Pillow version are recorded in validation.json; use those exact font files/version for raster reproducibility across computers. No external texture is necessary.

## F. Lua-oriented implementation handoff — PSEUDOCODE ONLY

This is deliberately not executable Project Zomboid code. Build 42.20 API signatures, rendering lifecycle and font metrics have not been checked. RECT, TEXT_BASELINE and MEASURE_TEXT are adapter concepts, not claimed game API names. Translate them into verified ISPanel/ISUIElement calls during integration. Palette RGBA order must be adapted to the actual call signature.

```text
deviceOrigin = (originX, originY)  // position in the owning panel
lcdLocal = (40, 50, 320, 422)

drawComponent(component, pressedControl):
    componentOrigin = deviceOrigin + component.bounds.xy
    for primitive in component.primitives, in listed order:
        choose normal color, pressed_color, or rocker state_overrides
        if rect:
            RECT(componentOrigin + primitive.rect.xy,
                 primitive.rect.wh, chosenColor)
        if text:
            width = MEASURE_TEXT(builtInFont, primitive.text)
            x = componentOrigin.x + primitive.x
            subtract width/2 for center alignment; width for right alignment
            round x to the nearest integer pixel
            baseline = componentOrigin.y + primitive.baseline_y
            TEXT_BASELINE(text, x, baseline, builtInFont, chosenColor)
            // If the real API positions text by its top, subtract font ascent.

drawDevice(showContent, showWear, pressedControl):
    for component in manifest.components, sorted by order:
        if component.role == content and not showContent: continue
        if component.optional and not showWear: continue
        drawComponent(component, pressedControl)
    // A future content layer can use a separate screen renderer,
    // placed after C05 with origin=(originX+40, originY+50).
    // LCD C05 always remains; content never draws hardware.

onPointer(pointerInOwningPanel):
    p = pointerInOwningPanel - deviceOrigin
    for control in controls:
        x,y,w,h = control.hitbox
        if x <= p.x < x+w and y <= p.y < y+h:
            track pressed control; dispatch intended action on valid release
```

Keep in-game text within the exact LCD by measuring built-in fonts and clipping or shortening content as needed. No screen text, icons, lines, or content panels are included in this design. A Lua rectangle implementation can reproduce all hardware geometry without SVG or PNG assets. In-game text will require a visual check using the chosen built-in fonts.

### Validation actually performed

493 automated checks passed. Full per-primitive results are in `exports/validation.json`.

- Usable LCD is exactly 320 × 422 at (40,50); blank-screen export is uniformly filled throughout it.
- Every hardware primitive and actual hardware layer pixel avoids the usable LCD.
- All component bounds, rectangles, reference-font text bounds and control hitboxes fit the 400 × 620 device.
- Every visible artwork operation comes from the manifest; rectangle coordinates are positive-size integers, and the native result uses only the eleven palette colors plus transparency.
- All seventeen exported layers have the same 400 × 620 size and origin with genuine alpha transparency.
- Reading and compositing the exported PNG layers in order reproduces every assembled RGBA byte.
- The 2× image is exactly nearest-neighbor replication of the native export.
- Source requires only rectangles and ordinary UI text; no texture is necessary.

**Unverified:** live Build 42.20 drawing/input integration, exact Lua API signatures, and game font metrics. Cross-viewer SVG text rasterization is not asserted identical to the PNG reference; SVG geometry is exact. Reference-font text and geometry were checked programmatically; see the accompanying visual review note for inspected images.
