[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [RadialMenu](RadialMenu.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [outerRadius](#outerRadius)
   2. [innerRadius](#innerRadius)
   3. [slices](#slices)
   4. [highlight](#highlight)
   5. [joypad](#joypad)
   6. [transition](#transition)
   7. [select](#select)
   8. [deselect](#deselect)
   9. [selectIndex](#selectIndex)
   10. [deselectIndex](#deselectIndex)
7. [Constructor Details](#constructor-detail)
   1. [RadialMenu(int, int, int, int)](#%3Cinit%3E(int,int,int,int))
8. [Method Details](#method-detail)
   1. [update()](#update())
   2. [render()](#render())
   3. [formatTextInsideCircle(String)](#formatTextInsideCircle(java.lang.String))
   4. [drawTextWithBackground(AngelCodeFont, String, float, float, float, float, float, float, int, int)](#drawTextWithBackground(zombie.core.fonts.AngelCodeFont,java.lang.String,float,float,float,float,float,float,int,int))
   5. [clear()](#clear())
   6. [addSlice(String, Texture)](#addSlice(java.lang.String,zombie.core.textures.Texture))
   7. [getSlice(int)](#getSlice(int))
   8. [setSliceText(int, String)](#setSliceText(int,java.lang.String))
   9. [setSliceTexture(int, Texture)](#setSliceTexture(int,zombie.core.textures.Texture))
   10. [getStartAngle()](#getStartAngle())
   11. [getSliceIndexFromMouse(int, int)](#getSliceIndexFromMouse(int,int))
   12. [getSliceIndexFromJoypad(int)](#getSliceIndexFromJoypad(int))
   13. [setJoypad(int)](#setJoypad(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RadialMenu
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.RadialMenu

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class RadialMenu
extends [UIElement](UIElement.html "class in zombie.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `protected static class`

  `RadialMenu.Slice`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected UITransition`

  `deselect`

  `protected int`

  `deselectIndex`

  `protected int`

  `highlight`

  `protected int`

  `innerRadius`

  `protected int`

  `joypad`

  `protected int`

  `outerRadius`

  `protected UITransition`

  `select`

  `protected int`

  `selectIndex`

  `protected ArrayList<RadialMenu.Slice>`

  `slices`

  `protected UITransition`

  `transition`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RadialMenu(int x,
  int y,
  int innerRadius,
  int outerRadius)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addSlice(String text,
  Texture texture)`

  `void`

  `clear()`

  `private void`

  `drawTextWithBackground(AngelCodeFont fontObj,
  String text,
  float x,
  float y,
  float r,
  float g,
  float b,
  float a,
  int startIndex,
  int endIndex)`

  `private void`

  `formatTextInsideCircle(String text)`

  `private RadialMenu.Slice`

  `getSlice(int sliceIndex)`

  `int`

  `getSliceIndexFromJoypad(int joypad)`

  `int`

  `getSliceIndexFromMouse(int mx,
  int my)`

  `private float`

  `getStartAngle()`

  `void`

  `render()`

  `void`

  `setJoypad(int joypad)`

  `void`

  `setSliceText(int sliceIndex,
  String text)`

  `void`

  `setSliceTexture(int sliceIndex,
  Texture texture)`

  `void`

  `update()`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDown, onMouseDownOutside, onMouseMove, onMouseMoveOutside, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### outerRadius

    protected int outerRadius
  + ### innerRadius

    protected int innerRadius
  + ### slices

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadialMenu.Slice](RadialMenu.Slice.html "class in zombie.ui")> slices
  + ### highlight

    protected int highlight
  + ### joypad

    protected int joypad
  + ### transition

    protected [UITransition](UITransition.html "class in zombie.ui") transition
  + ### select

    protected [UITransition](UITransition.html "class in zombie.ui") select
  + ### deselect

    protected [UITransition](UITransition.html "class in zombie.ui") deselect
  + ### selectIndex

    protected int selectIndex
  + ### deselectIndex

    protected int deselectIndex
* Constructor Details
  -------------------

  + ### RadialMenu

    public RadialMenu(int x,
    int y,
    int innerRadius,
    int outerRadius)
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
  + ### formatTextInsideCircle

    private void formatTextInsideCircle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### drawTextWithBackground

    private void drawTextWithBackground([AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") fontObj,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    float x,
    float y,
    float r,
    float g,
    float b,
    float a,
    int startIndex,
    int endIndex)
  + ### clear

    public void clear()
  + ### addSlice

    public void addSlice([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture)
  + ### getSlice

    private [RadialMenu.Slice](RadialMenu.Slice.html "class in zombie.ui") getSlice(int sliceIndex)
  + ### setSliceText

    public void setSliceText(int sliceIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### setSliceTexture

    public void setSliceTexture(int sliceIndex,
    [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture)
  + ### getStartAngle

    private float getStartAngle()
  + ### getSliceIndexFromMouse

    public int getSliceIndexFromMouse(int mx,
    int my)
  + ### getSliceIndexFromJoypad

    public int getSliceIndexFromJoypad(int joypad)
  + ### setJoypad

    public void setJoypad(int joypad)