[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [RadialProgressBar](RadialProgressBar.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [DEBUG](#DEBUG)
   2. [radialTexture](#radialTexture)
   3. [radialColor](#radialColor)
   4. [deltaValue](#deltaValue)
   5. [segments](#segments)
   6. [TWO\_PI](#TWO_PI)
   7. [PI\_OVER\_TWO](#PI_OVER_TWO)
7. [Constructor Details](#constructor-detail)
   1. [RadialProgressBar(KahluaTable, Texture)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable,zombie.core.textures.Texture))
8. [Method Details](#method-detail)
   1. [update()](#update())
   2. [render()](#render())
   3. [setValue(float)](#setValue(float))
   4. [getValue()](#getValue())
   5. [setTexture(Texture)](#setTexture(zombie.core.textures.Texture))
   6. [getTexture()](#getTexture())
   7. [setColor(ColorInfo)](#setColor(zombie.core.textures.ColorInfo))
   8. [printTexture(Texture)](#printTexture(zombie.core.textures.Texture))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RadialProgressBar
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.RadialProgressBar

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class RadialProgressBar
extends [UIElement](UIElement.html "class in zombie.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `RadialProgressBar.RadSegment`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final boolean`

  `DEBUG`

  `(package private) float`

  `deltaValue`

  `private static final float`

  `PI_OVER_TWO`

  `(package private) ColorInfo`

  `radialColor`

  `(package private) Texture`

  `radialTexture`

  `private static final RadialProgressBar.RadSegment[]`

  `segments`

  `private static final float`

  `TWO_PI`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RadialProgressBar(se.krka.kahlua.vm.KahluaTable table,
  Texture tex)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Texture`

  `getTexture()`

  `float`

  `getValue()`

  `private void`

  `printTexture(Texture t)`

  `void`

  `render()`

  `void`

  `setColor(ColorInfo color)`

  `void`

  `setTexture(Texture texture)`

  `void`

  `setValue(float delta)`

  `void`

  `update()`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDown, onMouseDownOutside, onMouseMove, onMouseMoveOutside, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### DEBUG

    private static final boolean DEBUG

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.RadialProgressBar.DEBUG)
  + ### radialTexture

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") radialTexture
  + ### radialColor

    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") radialColor
  + ### deltaValue

    float deltaValue
  + ### segments

    private static final [RadialProgressBar.RadSegment](RadialProgressBar.RadSegment.html "class in zombie.ui")[] segments
  + ### TWO\_PI

    private static final float TWO\_PI

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.RadialProgressBar.TWO_PI)
  + ### PI\_OVER\_TWO

    private static final float PI\_OVER\_TWO

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.RadialProgressBar.PI_OVER_TWO)
* Constructor Details
  -------------------

  + ### RadialProgressBar

    public RadialProgressBar(se.krka.kahlua.vm.KahluaTable table,
    [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex)
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
  + ### setValue

    public void setValue(float delta)
  + ### getValue

    public float getValue()
  + ### setTexture

    public void setTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") texture)
  + ### getTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### setColor

    public void setColor([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") color)
  + ### printTexture

    private void printTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") t)