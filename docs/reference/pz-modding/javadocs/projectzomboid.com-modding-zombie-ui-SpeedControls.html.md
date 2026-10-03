[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [SpeedControls](SpeedControls.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [PauseSpeed](#PauseSpeed)
   3. [PlaySpeed](#PlaySpeed)
   4. [FastForwardSpeed](#FastForwardSpeed)
   5. [FasterForwardSpeed](#FasterForwardSpeed)
   6. [WaitSpeed](#WaitSpeed)
   7. [ResumeSpeed](#ResumeSpeed)
   8. [playMultiplier](#playMultiplier)
   9. [fastForwardMultiplier](#fastForwardMultiplier)
   10. [fasterForwardMultipler](#fasterForwardMultipler)
   11. [waitMultiplier](#waitMultiplier)
   12. [currentSpeed](#currentSpeed)
   13. [speedBeforePause](#speedBeforePause)
   14. [multiBeforePause](#multiBeforePause)
   15. [doFrameStep](#doFrameStep)
   16. [frameSkipped](#frameSkipped)
   17. [mouseOver](#mouseOver)
   18. [play](#play)
   19. [pause](#pause)
   20. [fastForward](#fastForward)
   21. [fasterForward](#fasterForward)
   22. [wait](#wait)
   23. [stepForward](#stepForward)
7. [Constructor Details](#constructor-detail)
   1. [SpeedControls()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [ButtonClicked(String)](#ButtonClicked(java.lang.String))
   2. [getCurrentGameSpeed()](#getCurrentGameSpeed())
   3. [SetCorrectIconStates()](#SetCorrectIconStates())
   4. [Pause()](#Pause())
   5. [SetCurrentGameSpeed(int)](#SetCurrentGameSpeed(int))
   6. [onMouseMove(double, double)](#onMouseMove(double,double))
   7. [onMouseMoveOutside(double, double)](#onMouseMoveOutside(double,double))
   8. [render()](#render())
   9. [update()](#update())
   10. [stepForward()](#stepForward())
   11. [isPaused()](#isPaused())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SpeedControls
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.SpeedControls

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class SpeedControls
extends [UIElement](UIElement.html "class in zombie.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `SpeedControls.SCButton`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `currentSpeed`

  `private boolean`

  `doFrameStep`

  `private static zombie.ui.HUDButton`

  `fasterForward`

  `private final float`

  `fasterForwardMultipler`

  `static final int`

  `FasterForwardSpeed`

  `private static zombie.ui.HUDButton`

  `fastForward`

  `private final float`

  `fastForwardMultiplier`

  `static final int`

  `FastForwardSpeed`

  `private boolean`

  `frameSkipped`

  `static SpeedControls`

  `instance`

  `private boolean`

  `mouseOver`

  `private float`

  `multiBeforePause`

  `private static zombie.ui.HUDButton`

  `pause`

  `static final int`

  `PauseSpeed`

  `private static zombie.ui.HUDButton`

  `play`

  `private final float`

  `playMultiplier`

  `static final int`

  `PlaySpeed`

  `private static final int`

  `ResumeSpeed`

  `private int`

  `speedBeforePause`

  `private static zombie.ui.HUDButton`

  `stepForward`

  `private static zombie.ui.HUDButton`

  `wait`

  `private final float`

  `waitMultiplier`

  `static final int`

  `WaitSpeed`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SpeedControls()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `ButtonClicked(String name)`

  `int`

  `getCurrentGameSpeed()`

  `boolean`

  `isPaused()`

  `Boolean`

  `onMouseMove(double dx,
  double dy)`

  `void`

  `onMouseMoveOutside(double dx,
  double dy)`

  `void`

  `Pause()`

  `void`

  `render()`

  `void`

  `SetCorrectIconStates()`

  `void`

  `SetCurrentGameSpeed(int newSpeed)`

  `void`

  `stepForward()`

  `void`

  `update()`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDown, onMouseDownOutside, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static [SpeedControls](SpeedControls.html "class in zombie.ui") instance
  + ### PauseSpeed

    public static final int PauseSpeed

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.PauseSpeed)
  + ### PlaySpeed

    public static final int PlaySpeed

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.PlaySpeed)
  + ### FastForwardSpeed

    public static final int FastForwardSpeed

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.FastForwardSpeed)
  + ### FasterForwardSpeed

    public static final int FasterForwardSpeed

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.FasterForwardSpeed)
  + ### WaitSpeed

    public static final int WaitSpeed

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.WaitSpeed)
  + ### ResumeSpeed

    private static final int ResumeSpeed

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.ResumeSpeed)
  + ### playMultiplier

    private final float playMultiplier

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.playMultiplier)
  + ### fastForwardMultiplier

    private final float fastForwardMultiplier

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.fastForwardMultiplier)
  + ### fasterForwardMultipler

    private final float fasterForwardMultipler

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.fasterForwardMultipler)
  + ### waitMultiplier

    private final float waitMultiplier

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.SpeedControls.waitMultiplier)
  + ### currentSpeed

    private int currentSpeed
  + ### speedBeforePause

    private int speedBeforePause
  + ### multiBeforePause

    private float multiBeforePause
  + ### doFrameStep

    private boolean doFrameStep
  + ### frameSkipped

    private boolean frameSkipped
  + ### mouseOver

    private boolean mouseOver
  + ### play

    private static zombie.ui.HUDButton play
  + ### pause

    private static zombie.ui.HUDButton pause
  + ### fastForward

    private static zombie.ui.HUDButton fastForward
  + ### fasterForward

    private static zombie.ui.HUDButton fasterForward
  + ### wait

    private static zombie.ui.HUDButton wait
  + ### stepForward

    private static zombie.ui.HUDButton stepForward
* Constructor Details
  -------------------

  + ### SpeedControls

    public SpeedControls()
* Method Details
  --------------

  + ### ButtonClicked

    public void ButtonClicked([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Overrides:
    :   `ButtonClicked` in class `UIElement`
  + ### getCurrentGameSpeed

    public int getCurrentGameSpeed()
  + ### SetCorrectIconStates

    public void SetCorrectIconStates()
  + ### Pause

    public void Pause()
  + ### SetCurrentGameSpeed

    public void SetCurrentGameSpeed(int newSpeed)
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
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `update` in class `UIElement`
  + ### stepForward

    public void stepForward()
  + ### isPaused

    public boolean isPaused()