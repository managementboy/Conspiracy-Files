[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UIDebugConsole](UIDebugConsole.html)
3. [CommandEntry](UIDebugConsole.CommandEntry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [CommandEntry(UIFont, int, int, int, int, String, boolean)](#%3Cinit%3E(zombie.ui.UIFont,int,int,int,int,java.lang.String,boolean))
6. [Method Details](#method-detail)
   1. [onPressUp()](#onPressUp())
   2. [onPressDown()](#onPressDown())
   3. [onOtherKey(int)](#onOtherKey(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UIDebugConsole.CommandEntry
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

[zombie.ui.UITextBox2](UITextBox2.html "class in zombie.ui")

zombie.ui.UIDebugConsole.CommandEntry

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface, zombie.ui.UITextEntryInterface`

Enclosing class:
:   `UIDebugConsole`

---

private class UIDebugConsole.CommandEntry
extends [UITextBox2](UITextBox2.html "class in zombie.ui")

* Field Summary
  -------------

  ### Fields inherited from class [UITextBox2](UITextBox2.html#field-summary "class in zombie.ui")

  `alwaysPaginate, doingTextEntry, font, frame, internalText, isEditable, lines, multipleLine, numVisibleLines, text, textChanged, textEntryMaxLength, topLineIndex`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CommandEntry(UIFont font,
  int x,
  int y,
  int width,
  int height,
  String text,
  boolean hasFrame)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `onOtherKey(int key)`

  `void`

  `onPressDown()`

  `void`

  `onPressUp()`

  ### Methods inherited from class [UITextBox2](UITextBox2.html#method-summary "class in zombie.ui")

  `ClearHighlights, clearInput, copyToClipboard, cutToClipboard, focus, getCursorLine, getCursorPos, getForceUpperCase, getFrame, getFrameAlpha, getHasFrame, getInset, getInternalText, getMaxLines, getMaxTextLength, getPlaceholderText, getStandardFrameColour, getText, hasClearButton, ignoreFirstInput, isDoingTextEntry, isEditable, isFocused, isIgnoreFirst, isMasked, isMultipleLine, isOnlyNumbers, isOnlyText, isSelectable, isTextLimit, onCommandEntered, onKeyBack, onKeyDelete, onKeyDown, onKeyEnd, onKeyEnter, onKeyHome, onKeyLeft, onKeyRight, onKeyUp, onLostFocus, onMouseDown, onMouseMove, onMouseMoveOutside, onMouseUp, onMouseUpOutside, onresize, onTextChange, onTextDelete, pasteFromClipboard, putCharacter, render, resetBlink, selectAll, setCentreVertically, setClearButton, setCursorLine, setCursorPos, setDoingTextEntry, setEditable, setFont, setForceUpperCase, setFrameAlpha, setHasFrame, setIgnoreFirst, setMasked, setMaxLines, setMaxTextLength, setMultipleLine, setOnlyNumbers, setOnlyText, setPlaceholderText, setPlaceholderTextColor, setPlaceholderTextRGBA, setSelectable, setSelectingRange, SetText, setTextColor, setTextRGBA, setWrapLines, toDisplayLine, unfocus, update, updateText`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDownOutside, onMouseWheel, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.ui.UITextEntryInterface

  `getUIName`

* Constructor Details
  -------------------

  + ### CommandEntry

    public CommandEntry([UIFont](UIFont.html "enum class in zombie.ui") font,
    int x,
    int y,
    int width,
    int height,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    boolean hasFrame)
* Method Details
  --------------

  + ### onPressUp

    public void onPressUp()

    Overrides:
    :   `onPressUp` in class `UITextBox2`
  + ### onPressDown

    public void onPressDown()

    Overrides:
    :   `onPressDown` in class `UITextBox2`
  + ### onOtherKey

    public void onOtherKey(int key)

    Specified by:
    :   `onOtherKey` in interface `zombie.ui.UITextEntryInterface`

    Overrides:
    :   `onOtherKey` in class `UITextBox2`