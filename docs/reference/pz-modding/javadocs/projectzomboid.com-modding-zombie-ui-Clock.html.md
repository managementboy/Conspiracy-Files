[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [Clock](Clock.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [largeTextures](#largeTextures)
   2. [background](#background)
   3. [digitsLarge](#digitsLarge)
   4. [digitsSmall](#digitsSmall)
   5. [colon](#colon)
   6. [slash](#slash)
   7. [minus](#minus)
   8. [dot](#dot)
   9. [tempC](#tempC)
   10. [tempF](#tempF)
   11. [tempE](#tempE)
   12. [texAm](#texAm)
   13. [texPm](#texPm)
   14. [alarmOn](#alarmOn)
   15. [alarmRinging](#alarmRinging)
   16. [displayColour](#displayColour)
   17. [ghostColour](#ghostColour)
   18. [uxOriginal](#uxOriginal)
   19. [uyOriginal](#uyOriginal)
   20. [largeDigitSpacing](#largeDigitSpacing)
   21. [smallDigitSpacing](#smallDigitSpacing)
   22. [colonSpacing](#colonSpacing)
   23. [ampmSpacing](#ampmSpacing)
   24. [alarmBellSpacing](#alarmBellSpacing)
   25. [decimalSpacing](#decimalSpacing)
   26. [degreeSpacing](#degreeSpacing)
   27. [slashSpacing](#slashSpacing)
   28. [tempDateSpacing](#tempDateSpacing)
   29. [dateOffset](#dateOffset)
   30. [minusOffset](#minusOffset)
   31. [amVerticalSpacing](#amVerticalSpacing)
   32. [pmVerticalSpacing](#pmVerticalSpacing)
   33. [alarmBellVerticalSpacing](#alarmBellVerticalSpacing)
   34. [displayVerticalSpacing](#displayVerticalSpacing)
   35. [decimalVerticalSpacing](#decimalVerticalSpacing)
   36. [digital](#digital)
   37. [isAlarmSet](#isAlarmSet)
   38. [isAlarmRinging](#isAlarmRinging)
   39. [clockPlayer](#clockPlayer)
   40. [instance](#instance)
6. [Constructor Details](#constructor-detail)
   1. [Clock(int, int)](#%3Cinit%3E(int,int))
7. [Method Details](#method-detail)
   1. [render()](#render())
   2. [renderDisplay(boolean, Color)](#renderDisplay(boolean,zombie.core.Color))
   3. [assignTextures(boolean)](#assignTextures(boolean))
   4. [assignSmallOffsets()](#assignSmallOffsets())
   5. [assignLargeOffsets()](#assignLargeOffsets())
   6. [timeDigits()](#timeDigits())
   7. [dateDigits()](#dateDigits())
   8. [tempDigits()](#tempDigits())
   9. [resize()](#resize())
   10. [isDateVisible()](#isDateVisible())
   11. [onMouseDown(double, double)](#onMouseDown(double,double))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Clock
===========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.Clock

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class Clock
extends [UIElement](UIElement.html "class in zombie.ui")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `alarmBellSpacing`

  `private int`

  `alarmBellVerticalSpacing`

  `private Texture`

  `alarmOn`

  `private Texture`

  `alarmRinging`

  `private int`

  `ampmSpacing`

  `private int`

  `amVerticalSpacing`

  `private Texture`

  `background`

  `private IsoPlayer`

  `clockPlayer`

  `private Texture`

  `colon`

  `private int`

  `colonSpacing`

  `private int`

  `dateOffset`

  `private int`

  `decimalSpacing`

  `private int`

  `decimalVerticalSpacing`

  `private int`

  `degreeSpacing`

  `private boolean`

  `digital`

  `private Texture[]`

  `digitsLarge`

  `private Texture[]`

  `digitsSmall`

  `private final Color`

  `displayColour`

  `private int`

  `displayVerticalSpacing`

  `private Texture`

  `dot`

  `private final Color`

  `ghostColour`

  `static Clock`

  `instance`

  `private boolean`

  `isAlarmRinging`

  `private boolean`

  `isAlarmSet`

  `private int`

  `largeDigitSpacing`

  `private boolean`

  `largeTextures`

  `private Texture`

  `minus`

  `private int`

  `minusOffset`

  `private int`

  `pmVerticalSpacing`

  `private Texture`

  `slash`

  `private int`

  `slashSpacing`

  `private int`

  `smallDigitSpacing`

  `private Texture`

  `tempC`

  `private int`

  `tempDateSpacing`

  `private Texture`

  `tempE`

  `private Texture`

  `tempF`

  `private Texture`

  `texAm`

  `private Texture`

  `texPm`

  `private int`

  `uxOriginal`

  `private int`

  `uyOriginal`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Clock(int x,
  int y)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `assignLargeOffsets()`

  `private void`

  `assignSmallOffsets()`

  `private void`

  `assignTextures(boolean largeTextures)`

  `private int[]`

  `dateDigits()`

  `boolean`

  `isDateVisible()`

  `Boolean`

  `onMouseDown(double x,
  double y)`

  `void`

  `render()`

  `private void`

  `renderDisplay(boolean ghostDisplay,
  Color color)`

  `void`

  `resize()`

  `private int[]`

  `tempDigits()`

  `private int[]`

  `timeDigits()`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDownOutside, onMouseMove, onMouseMoveOutside, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue, update`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### largeTextures

    private boolean largeTextures
  + ### background

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") background
  + ### digitsLarge

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures")[] digitsLarge
  + ### digitsSmall

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures")[] digitsSmall
  + ### colon

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") colon
  + ### slash

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") slash
  + ### minus

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") minus
  + ### dot

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") dot
  + ### tempC

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") tempC
  + ### tempF

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") tempF
  + ### tempE

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") tempE
  + ### texAm

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") texAm
  + ### texPm

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") texPm
  + ### alarmOn

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") alarmOn
  + ### alarmRinging

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") alarmRinging
  + ### displayColour

    private final [Color](../core/Color.html "class in zombie.core") displayColour
  + ### ghostColour

    private final [Color](../core/Color.html "class in zombie.core") ghostColour
  + ### uxOriginal

    private int uxOriginal
  + ### uyOriginal

    private int uyOriginal
  + ### largeDigitSpacing

    private int largeDigitSpacing
  + ### smallDigitSpacing

    private int smallDigitSpacing
  + ### colonSpacing

    private int colonSpacing
  + ### ampmSpacing

    private int ampmSpacing
  + ### alarmBellSpacing

    private int alarmBellSpacing
  + ### decimalSpacing

    private int decimalSpacing
  + ### degreeSpacing

    private int degreeSpacing
  + ### slashSpacing

    private int slashSpacing
  + ### tempDateSpacing

    private int tempDateSpacing
  + ### dateOffset

    private int dateOffset
  + ### minusOffset

    private int minusOffset
  + ### amVerticalSpacing

    private int amVerticalSpacing
  + ### pmVerticalSpacing

    private int pmVerticalSpacing
  + ### alarmBellVerticalSpacing

    private int alarmBellVerticalSpacing
  + ### displayVerticalSpacing

    private int displayVerticalSpacing
  + ### decimalVerticalSpacing

    private int decimalVerticalSpacing
  + ### digital

    private boolean digital
  + ### isAlarmSet

    private boolean isAlarmSet
  + ### isAlarmRinging

    private boolean isAlarmRinging
  + ### clockPlayer

    private [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") clockPlayer
  + ### instance

    public static [Clock](Clock.html "class in zombie.ui") instance
* Constructor Details
  -------------------

  + ### Clock

    public Clock(int x,
    int y)
* Method Details
  --------------

  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `UIElement`
  + ### renderDisplay

    private void renderDisplay(boolean ghostDisplay,
    [Color](../core/Color.html "class in zombie.core") color)
  + ### assignTextures

    private void assignTextures(boolean largeTextures)
  + ### assignSmallOffsets

    private void assignSmallOffsets()
  + ### assignLargeOffsets

    private void assignLargeOffsets()
  + ### timeDigits

    private int[] timeDigits()
  + ### dateDigits

    private int[] dateDigits()
  + ### tempDigits

    private int[] tempDigits()
  + ### resize

    public void resize()
  + ### isDateVisible

    public boolean isDateVisible()
  + ### onMouseDown

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseDown(double x,
    double y)

    Overrides:
    :   `onMouseDown` in class `UIElement`