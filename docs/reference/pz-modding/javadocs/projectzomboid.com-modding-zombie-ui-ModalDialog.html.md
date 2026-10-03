[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [ModalDialog](ModalDialog.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [yes](#yes)
   2. [name](#name)
   3. [handler](#handler)
   4. [clicked](#clicked)
6. [Constructor Details](#constructor-detail)
   1. [ModalDialog(String, String, boolean)](#%3Cinit%3E(java.lang.String,java.lang.String,boolean))
7. [Method Details](#method-detail)
   1. [ButtonClicked(String)](#ButtonClicked(java.lang.String))
   2. [Clicked(String)](#Clicked(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ModalDialog
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.NewWindow

zombie.ui.ModalDialog

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class ModalDialog
extends zombie.ui.NewWindow

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `clicked`

  `(package private) zombie.ui.UIEventHandler`

  `handler`

  `String`

  `name`

  `boolean`

  `yes`

  ### Fields inherited from class zombie.ui.NewWindow

  `alpha, clickX, clickY, clientH, clientW, closeButton, dialogBottomLeft, dialogBottomMiddle, dialogBottomRight, dialogLeft, dialogMiddle, dialogRight, movable, moving, ncclientH, ncclientW, nestedItems, resizeToFitY, titleCloseIcon, titleLeft, titleMiddle, titleRight`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ModalDialog(String name,
  String help,
  boolean bYesNo)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `ButtonClicked(String name)`

  `void`

  `Clicked(String name)`

  ### Methods inherited from class zombie.ui.NewWindow

  `Nest, onMouseDown, onMouseMove, onMouseMoveOutside, onMouseUp, render, setMovable, update`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDownOutside, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### yes

    public boolean yes
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### handler

    zombie.ui.UIEventHandler handler
  + ### clicked

    public boolean clicked
* Constructor Details
  -------------------

  + ### ModalDialog

    public ModalDialog([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") help,
    boolean bYesNo)
* Method Details
  --------------

  + ### ButtonClicked

    public void ButtonClicked([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Overrides:
    :   `ButtonClicked` in class `zombie.ui.NewWindow`
  + ### Clicked

    public void Clicked([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)