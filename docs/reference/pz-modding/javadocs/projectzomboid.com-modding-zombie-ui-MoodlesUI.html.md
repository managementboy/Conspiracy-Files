[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [MoodlesUI](MoodlesUI.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [moodleUiState](#moodleUiState)
   2. [MaxMouseOverSlot](#MaxMouseOverSlot)
   3. [DefaultMoodleDistY](#DefaultMoodleDistY)
   4. [DistFromRightEdge](#DistFromRightEdge)
   5. [OFFSCREEN\_Y](#OFFSCREEN_Y)
   6. [OscillatorDecelerator](#OscillatorDecelerator)
   7. [OscillatorRate](#OscillatorRate)
   8. [OscillatorScalar](#OscillatorScalar)
   9. [OscillatorStartLevel](#OscillatorStartLevel)
   10. [clientH](#clientH)
   11. [clientW](#clientW)
   12. [instance](#instance)
   13. [alpha](#alpha)
   14. [textureSizes](#textureSizes)
   15. [textureSets](#textureSets)
   16. [currentTextureSet](#currentTextureSet)
   17. [moodleDistY](#moodleDistY)
   18. [mouseOver](#mouseOver)
   19. [mouseOverSlot](#mouseOverSlot)
   20. [numUsedSlots](#numUsedSlots)
   21. [debugKeyDelay](#debugKeyDelay)
   22. [oscillatorStep](#oscillatorStep)
   23. [isoGameCharacter](#isoGameCharacter)
   24. [alphaIncrease](#alphaIncrease)
   25. [backgroundColour](#backgroundColour)
7. [Constructor Details](#constructor-detail)
   1. [MoodlesUI()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getTextureSizeForOption()](#getTextureSizeForOption())
   2. [getTextureSetIndexForSize(int)](#getTextureSetIndexForSize(int))
   3. [isCurrentlyAnimating()](#isCurrentlyAnimating())
   4. [isPercentageBackground(MoodleType)](#isPercentageBackground(zombie.scripting.objects.MoodleType))
   5. [getBackgroundPercentage(MoodleType)](#getBackgroundPercentage(zombie.scripting.objects.MoodleType))
   6. [drawPercentageBackground(MoodleType, float)](#drawPercentageBackground(zombie.scripting.objects.MoodleType,float))
   7. [drawBackgroundPulse(MoodleType, float)](#drawBackgroundPulse(zombie.scripting.objects.MoodleType,float))
   8. [onMouseMove(double, double)](#onMouseMove(double,double))
   9. [onMouseMoveOutside(double, double)](#onMouseMoveOutside(double,double))
   10. [render()](#render())
   11. [wiggle(MoodleType)](#wiggle(zombie.scripting.objects.MoodleType))
   12. [update()](#update())
   13. [setCharacter(IsoGameCharacter)](#setCharacter(zombie.characters.IsoGameCharacter))
   14. [getInstance()](#getInstance())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MoodlesUI
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.MoodlesUI

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class MoodlesUI
extends [UIElement](UIElement.html "class in zombie.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `MoodlesUI.MoodleUIData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `alpha`

  `private boolean`

  `alphaIncrease`

  `private final Color`

  `backgroundColour`

  `float`

  `clientH`

  `float`

  `clientW`

  `private zombie.ui.MoodleTextureSet`

  `currentTextureSet`

  `private int`

  `debugKeyDelay`

  `private static final float`

  `DefaultMoodleDistY`

  `private static final int`

  `DistFromRightEdge`

  `private static MoodlesUI`

  `instance`

  `private IsoGameCharacter`

  `isoGameCharacter`

  `private static final int`

  `MaxMouseOverSlot`

  `private float`

  `moodleDistY`

  `private final Map<MoodleType, MoodlesUI.MoodleUIData>`

  `moodleUiState`

  `private boolean`

  `mouseOver`

  `private int`

  `mouseOverSlot`

  `private int`

  `numUsedSlots`

  `private static final float`

  `OFFSCREEN_Y`

  `private static final float`

  `OscillatorDecelerator`

  `private static final float`

  `OscillatorRate`

  `private static final float`

  `OscillatorScalar`

  `private static final float`

  `OscillatorStartLevel`

  `private float`

  `oscillatorStep`

  `private final zombie.ui.MoodleTextureSet[]`

  `textureSets`

  `private final int[]`

  `textureSizes`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MoodlesUI()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `drawBackgroundPulse(MoodleType moodleType,
  float wiggleOffset)`

  `private void`

  `drawPercentageBackground(MoodleType moodleType,
  float wiggleOffset)`

  `private float`

  `getBackgroundPercentage(MoodleType moodleType)`

  `static MoodlesUI`

  `getInstance()`

  `private int`

  `getTextureSetIndexForSize(int size)`

  `private int`

  `getTextureSizeForOption()`

  `private boolean`

  `isCurrentlyAnimating()`

  `private boolean`

  `isPercentageBackground(MoodleType moodleType)`

  `Boolean`

  `onMouseMove(double dx,
  double dy)`

  `void`

  `onMouseMoveOutside(double dx,
  double dy)`

  `void`

  `render()`

  `void`

  `setCharacter(IsoGameCharacter chr)`

  `void`

  `update()`

  `void`

  `wiggle(MoodleType moodleType)`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDown, onMouseDownOutside, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### moodleUiState

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[MoodleType](../scripting/objects/MoodleType.html "class in zombie.scripting.objects"), [MoodlesUI.MoodleUIData](MoodlesUI.MoodleUIData.html "class in zombie.ui")> moodleUiState
  + ### MaxMouseOverSlot

    private static final int MaxMouseOverSlot

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.MoodlesUI.MaxMouseOverSlot)
  + ### DefaultMoodleDistY

    private static final float DefaultMoodleDistY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.MoodlesUI.DefaultMoodleDistY)
  + ### DistFromRightEdge

    private static final int DistFromRightEdge

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.MoodlesUI.DistFromRightEdge)
  + ### OFFSCREEN\_Y

    private static final float OFFSCREEN\_Y

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.MoodlesUI.OFFSCREEN_Y)
  + ### OscillatorDecelerator

    private static final float OscillatorDecelerator

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.MoodlesUI.OscillatorDecelerator)
  + ### OscillatorRate

    private static final float OscillatorRate

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.MoodlesUI.OscillatorRate)
  + ### OscillatorScalar

    private static final float OscillatorScalar

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.MoodlesUI.OscillatorScalar)
  + ### OscillatorStartLevel

    private static final float OscillatorStartLevel

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.MoodlesUI.OscillatorStartLevel)
  + ### clientH

    public float clientH
  + ### clientW

    public float clientW
  + ### instance

    private static [MoodlesUI](MoodlesUI.html "class in zombie.ui") instance
  + ### alpha

    private float alpha
  + ### textureSizes

    private final int[] textureSizes
  + ### textureSets

    private final zombie.ui.MoodleTextureSet[] textureSets
  + ### currentTextureSet

    private zombie.ui.MoodleTextureSet currentTextureSet
  + ### moodleDistY

    private float moodleDistY
  + ### mouseOver

    private boolean mouseOver
  + ### mouseOverSlot

    private int mouseOverSlot
  + ### numUsedSlots

    private int numUsedSlots
  + ### debugKeyDelay

    private int debugKeyDelay
  + ### oscillatorStep

    private float oscillatorStep
  + ### isoGameCharacter

    private [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter
  + ### alphaIncrease

    private boolean alphaIncrease
  + ### backgroundColour

    private final [Color](../core/Color.html "class in zombie.core") backgroundColour
* Constructor Details
  -------------------

  + ### MoodlesUI

    public MoodlesUI()
* Method Details
  --------------

  + ### getTextureSizeForOption

    private int getTextureSizeForOption()
  + ### getTextureSetIndexForSize

    private int getTextureSetIndexForSize(int size)
  + ### isCurrentlyAnimating

    private boolean isCurrentlyAnimating()
  + ### isPercentageBackground

    private boolean isPercentageBackground([MoodleType](../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
  + ### getBackgroundPercentage

    private float getBackgroundPercentage([MoodleType](../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
  + ### drawPercentageBackground

    private void drawPercentageBackground([MoodleType](../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType,
    float wiggleOffset)
  + ### drawBackgroundPulse

    private void drawBackgroundPulse([MoodleType](../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType,
    float wiggleOffset)
  + ### onMouseMove

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseMove(double dx,
    double dy)

    Overrides:
    :   `onMouseMove` in class `UIElement`
  + ### onMouseMoveOutside

    public void onMouseMoveOutside(double dx,
    double dy)

    Overrides:
    :   `onMouseMoveOutside` in class `UIElement`
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `UIElement`
  + ### wiggle

    public void wiggle([MoodleType](../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `update` in class `UIElement`
  + ### setCharacter

    public void setCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getInstance

    public static [MoodlesUI](MoodlesUI.html "class in zombie.ui") getInstance()