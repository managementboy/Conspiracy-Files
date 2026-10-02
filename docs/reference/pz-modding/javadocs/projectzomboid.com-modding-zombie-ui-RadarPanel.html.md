[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [RadarPanel](RadarPanel.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [playerIndex](#playerIndex)
   2. [xPos](#xPos)
   3. [yPos](#yPos)
   4. [offx](#offx)
   5. [offy](#offy)
   6. [zoom](#zoom)
   7. [draww](#draww)
   8. [drawh](#drawh)
   9. [mask](#mask)
   10. [border](#border)
   11. [zombiePos](#zombiePos)
   12. [zombiePosPool](#zombiePosPool)
   13. [zombiePosFrameCount](#zombiePosFrameCount)
   14. [zombiePosOccupied](#zombiePosOccupied)
7. [Constructor Details](#constructor-detail)
   1. [RadarPanel(int)](#%3Cinit%3E(int))
8. [Method Details](#method-detail)
   1. [update()](#update())
   2. [render()](#render())
   3. [stencilOn()](#stencilOn())
   4. [stencilOff()](#stencilOff())
   5. [renderBuildings()](#renderBuildings())
   6. [renderZombies()](#renderZombies())
   7. [worldToScreenX(float)](#worldToScreenX(float))
   8. [worldToScreenY(float)](#worldToScreenY(float))
   9. [renderRect(float, float, float, float, float, float, float, float)](#renderRect(float,float,float,float,float,float,float,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RadarPanel
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.RadarPanel

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class RadarPanel
extends [UIElement](UIElement.html "class in zombie.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `RadarPanel.ZombiePos`

  `private static class`

  `RadarPanel.ZombiePosPool`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Texture`

  `border`

  `private float`

  `drawh`

  `private float`

  `draww`

  `private final Texture`

  `mask`

  `private float`

  `offx`

  `private float`

  `offy`

  `private final int`

  `playerIndex`

  `private float`

  `xPos`

  `private float`

  `yPos`

  `private final ArrayList<RadarPanel.ZombiePos>`

  `zombiePos`

  `private int`

  `zombiePosFrameCount`

  `private final boolean[]`

  `zombiePosOccupied`

  `private final RadarPanel.ZombiePosPool`

  `zombiePosPool`

  `private float`

  `zoom`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RadarPanel(int playerIndex)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `render()`

  `private void`

  `renderBuildings()`

  `private void`

  `renderRect(float x,
  float y,
  float w,
  float h,
  float r,
  float g,
  float b,
  float a)`

  `private void`

  `renderZombies()`

  `private void`

  `stencilOff()`

  `private void`

  `stencilOn()`

  `void`

  `update()`

  `private float`

  `worldToScreenX(float x)`

  `private float`

  `worldToScreenY(float y)`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDown, onMouseDownOutside, onMouseMove, onMouseMoveOutside, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### playerIndex

    private final int playerIndex
  + ### xPos

    private float xPos
  + ### yPos

    private float yPos
  + ### offx

    private float offx
  + ### offy

    private float offy
  + ### zoom

    private float zoom
  + ### draww

    private float draww
  + ### drawh

    private float drawh
  + ### mask

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") mask
  + ### border

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") border
  + ### zombiePos

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadarPanel.ZombiePos](RadarPanel.ZombiePos.html "class in zombie.ui")> zombiePos
  + ### zombiePosPool

    private final [RadarPanel.ZombiePosPool](RadarPanel.ZombiePosPool.html "class in zombie.ui") zombiePosPool
  + ### zombiePosFrameCount

    private int zombiePosFrameCount
  + ### zombiePosOccupied

    private final boolean[] zombiePosOccupied
* Constructor Details
  -------------------

  + ### RadarPanel

    public RadarPanel(int playerIndex)
* Method Details
  --------------

  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `update` in class `UIElement`
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `UIElement`
  + ### stencilOn

    private void stencilOn()
  + ### stencilOff

    private void stencilOff()
  + ### renderBuildings

    private void renderBuildings()
  + ### renderZombies

    private void renderZombies()
  + ### worldToScreenX

    private float worldToScreenX(float x)
  + ### worldToScreenY

    private float worldToScreenY(float y)
  + ### renderRect

    private void renderRect(float x,
    float y,
    float w,
    float h,
    float r,
    float g,
    float b,
    float a)