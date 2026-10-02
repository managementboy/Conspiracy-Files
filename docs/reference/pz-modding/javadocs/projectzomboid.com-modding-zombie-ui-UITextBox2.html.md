[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UITextBox2](UITextBox2.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [consoleHasFocus](#consoleHasFocus)
   2. [lines](#lines)
   3. [frame](#frame)
   4. [text](#text)
   5. [centered](#centered)
   6. [centerVertically](#centerVertically)
   7. [standardFrameColour](#standardFrameColour)
   8. [textEntryFrameColour](#textEntryFrameColour)
   9. [textEntryCursorColour](#textEntryCursorColour)
   10. [textEntryCursorColour2](#textEntryCursorColour2)
   11. [neutralColour](#neutralColour)
   12. [neutralColour2](#neutralColour2)
   13. [badColour](#badColour)
   14. [goodColour](#goodColour)
   15. [doingTextEntry](#doingTextEntry)
   16. [textEntryCursorPos](#textEntryCursorPos)
   17. [textEntryMaxLength](#textEntryMaxLength)
   18. [isEditable](#isEditable)
   19. [isSelectable](#isSelectable)
   20. [cursorLine](#cursorLine)
   21. [multipleLine](#multipleLine)
   22. [textOffsetOfLineStart](#textOffsetOfLineStart)
   23. [toSelectionIndex](#toSelectionIndex)
   24. [internalText](#internalText)
   25. [maskChr](#maskChr)
   26. [mask](#mask)
   27. [ignoreFirst](#ignoreFirst)
   28. [font](#font)
   29. [highlightLines](#highlightLines)
   30. [hasFrame](#hasFrame)
   31. [numVisibleLines](#numVisibleLines)
   32. [topLineIndex](#topLineIndex)
   33. [blinkFramesOn](#blinkFramesOn)
   34. [blinkFramesOff](#blinkFramesOff)
   35. [blinkFrame](#blinkFrame)
   36. [blinkState](#blinkState)
   37. [textColor](#textColor)
   38. [edgeSize](#edgeSize)
   39. [selectingRange](#selectingRange)
   40. [maxTextLength](#maxTextLength)
   41. [forceUpperCase](#forceUpperCase)
   42. [xOffset](#xOffset)
   43. [maxLines](#maxLines)
   44. [onlyNumbers](#onlyNumbers)
   45. [onlyText](#onlyText)
   46. [clearButtonTexture](#clearButtonTexture)
   47. [clearButtonSize](#clearButtonSize)
   48. [clearButton](#clearButton)
   49. [clearButtonTransition](#clearButtonTransition)
   50. [wrapLines](#wrapLines)
   51. [placeholderText](#placeholderText)
   52. [placeholderTextColor](#placeholderTextColor)
   53. [alwaysPaginate](#alwaysPaginate)
   54. [textChanged](#textChanged)
   55. [paginateWidth](#paginateWidth)
   56. [paginateFont](#paginateFont)
6. [Constructor Details](#constructor-detail)
   1. [UITextBox2(UIFont, int, int, int, int, String, boolean)](#%3Cinit%3E(zombie.ui.UIFont,int,int,int,int,java.lang.String,boolean))
7. [Method Details](#method-detail)
   1. [setFont(UIFont)](#setFont(zombie.ui.UIFont))
   2. [ClearHighlights()](#ClearHighlights())
   3. [setMasked(boolean)](#setMasked(boolean))
   4. [isMasked()](#isMasked())
   5. [onresize()](#onresize())
   6. [render()](#render())
   7. [getFrameAlpha()](#getFrameAlpha())
   8. [setFrameAlpha(float)](#setFrameAlpha(float))
   9. [setTextColor(ColorInfo)](#setTextColor(zombie.core.textures.ColorInfo))
   10. [setTextRGBA(float, float, float, float)](#setTextRGBA(float,float,float,float))
   11. [keepCursorVisible()](#keepCursorVisible())
   12. [getText()](#getText())
   13. [getInternalText()](#getInternalText())
   14. [update()](#update())
   15. [Paginate()](#Paginate())
   16. [getInset()](#getInset())
   17. [setEditable(boolean)](#setEditable(boolean))
   18. [isEditable()](#isEditable())
   19. [setSelectable(boolean)](#setSelectable(boolean))
   20. [isSelectable()](#isSelectable())
   21. [onMouseUp(double, double)](#onMouseUp(double,double))
   22. [onMouseUpOutside(double, double)](#onMouseUpOutside(double,double))
   23. [onMouseMove(double, double)](#onMouseMove(double,double))
   24. [onMouseMoveOutside(double, double)](#onMouseMoveOutside(double,double))
   25. [focus()](#focus())
   26. [unfocus()](#unfocus())
   27. [ignoreFirstInput()](#ignoreFirstInput())
   28. [onMouseDown(double, double)](#onMouseDown(double,double))
   29. [getCursorPosFromX(int)](#getCursorPosFromX(int))
   30. [updateText()](#updateText())
   31. [SetText(String)](#SetText(java.lang.String))
   32. [setPlaceholderText(String)](#setPlaceholderText(java.lang.String))
   33. [getPlaceholderText()](#getPlaceholderText())
   34. [setPlaceholderTextColor(ColorInfo)](#setPlaceholderTextColor(zombie.core.textures.ColorInfo))
   35. [setPlaceholderTextRGBA(float, float, float, float)](#setPlaceholderTextRGBA(float,float,float,float))
   36. [clearInput()](#clearInput())
   37. [onPressUp()](#onPressUp())
   38. [onPressDown()](#onPressDown())
   39. [onCommandEntered()](#onCommandEntered())
   40. [onTextChange()](#onTextChange())
   41. [onOtherKey(int)](#onOtherKey(int))
   42. [onLostFocus()](#onLostFocus())
   43. [getMaxTextLength()](#getMaxTextLength())
   44. [setMaxTextLength(int)](#setMaxTextLength(int))
   45. [getForceUpperCase()](#getForceUpperCase())
   46. [setForceUpperCase(boolean)](#setForceUpperCase(boolean))
   47. [getHasFrame()](#getHasFrame())
   48. [setHasFrame(boolean)](#setHasFrame(boolean))
   49. [setClearButton(boolean)](#setClearButton(boolean))
   50. [hasClearButton()](#hasClearButton())
   51. [toDisplayLine(int)](#toDisplayLine(int))
   52. [setMultipleLine(boolean)](#setMultipleLine(boolean))
   53. [isMultipleLine()](#isMultipleLine())
   54. [getCursorLine()](#getCursorLine())
   55. [setCursorLine(int)](#setCursorLine(int))
   56. [getCursorPos()](#getCursorPos())
   57. [setCursorPos(int)](#setCursorPos(int))
   58. [getMaxLines()](#getMaxLines())
   59. [setMaxLines(int)](#setMaxLines(int))
   60. [isFocused()](#isFocused())
   61. [isOnlyNumbers()](#isOnlyNumbers())
   62. [setOnlyNumbers(boolean)](#setOnlyNumbers(boolean))
   63. [isOnlyText()](#isOnlyText())
   64. [setOnlyText(boolean)](#setOnlyText(boolean))
   65. [resetBlink()](#resetBlink())
   66. [selectAll()](#selectAll())
   67. [isDoingTextEntry()](#isDoingTextEntry())
   68. [setDoingTextEntry(boolean)](#setDoingTextEntry(boolean))
   69. [getFrame()](#getFrame())
   70. [isIgnoreFirst()](#isIgnoreFirst())
   71. [setIgnoreFirst(boolean)](#setIgnoreFirst(boolean))
   72. [setSelectingRange(boolean)](#setSelectingRange(boolean))
   73. [getStandardFrameColour()](#getStandardFrameColour())
   74. [onKeyEnter()](#onKeyEnter())
   75. [onKeyHome()](#onKeyHome())
   76. [onKeyEnd()](#onKeyEnd())
   77. [onKeyUp()](#onKeyUp())
   78. [onKeyDown()](#onKeyDown())
   79. [onKeyLeft()](#onKeyLeft())
   80. [onKeyRight()](#onKeyRight())
   81. [onTextDelete()](#onTextDelete())
   82. [onKeyBack()](#onKeyBack())
   83. [onKeyDelete()](#onKeyDelete())
   84. [pasteFromClipboard()](#pasteFromClipboard())
   85. [cutToClipboard()](#cutToClipboard())
   86. [copyToClipboard()](#copyToClipboard())
   87. [isTextLimit()](#isTextLimit())
   88. [putCharacter(char)](#putCharacter(char))
   89. [setWrapLines(boolean)](#setWrapLines(boolean))
   90. [setCentreVertically(boolean)](#setCentreVertically(boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UITextBox2
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.UITextBox2

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface, zombie.ui.UITextEntryInterface`

Direct Known Subclasses:
:   `UIDebugConsole.CommandEntry`

---

public class UITextBox2
extends [UIElement](UIElement.html "class in zombie.ui")
implements zombie.ui.UITextEntryInterface

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `alwaysPaginate`

  `private final Color`

  `badColour`

  `private float`

  `blinkFrame`

  `private final int`

  `blinkFramesOff`

  `private final int`

  `blinkFramesOn`

  `private boolean`

  `blinkState`

  `private final boolean`

  `centered`

  `private boolean`

  `centerVertically`

  `private boolean`

  `clearButton`

  `private int`

  `clearButtonSize`

  `private final Texture`

  `clearButtonTexture`

  `private UITransition`

  `clearButtonTransition`

  `private static boolean`

  `consoleHasFocus`

  `private int`

  `cursorLine`

  `boolean`

  `doingTextEntry`

  `private final int`

  `edgeSize`

  `UIFont`

  `font`

  `private boolean`

  `forceUpperCase`

  `zombie.ui.UINineGrid`

  `frame`

  `private final Color`

  `goodColour`

  `private boolean`

  `hasFrame`

  `private final int[]`

  `highlightLines`

  `private boolean`

  `ignoreFirst`

  `String`

  `internalText`

  `boolean`

  `isEditable`

  `private boolean`

  `isSelectable`

  `Stack<String>`

  `lines`

  `private boolean`

  `mask`

  `private final String`

  `maskChr`

  `private int`

  `maxLines`

  `private int`

  `maxTextLength`

  `boolean`

  `multipleLine`

  `private final Color`

  `neutralColour`

  `private final Color`

  `neutralColour2`

  `int`

  `numVisibleLines`

  `private boolean`

  `onlyNumbers`

  `private boolean`

  `onlyText`

  `private UIFont`

  `paginateFont`

  `private int`

  `paginateWidth`

  `private String`

  `placeholderText`

  `private final ColorInfo`

  `placeholderTextColor`

  `private boolean`

  `selectingRange`

  `private final Color`

  `standardFrameColour`

  `String`

  `text`

  `boolean`

  `textChanged`

  `private final ColorInfo`

  `textColor`

  `private final Color`

  `textEntryCursorColour`

  `private final Color`

  `textEntryCursorColour2`

  `private int`

  `textEntryCursorPos`

  `private final Color`

  `textEntryFrameColour`

  `int`

  `textEntryMaxLength`

  `private final gnu.trove.list.array.TIntArrayList`

  `textOffsetOfLineStart`

  `int`

  `topLineIndex`

  `private int`

  `toSelectionIndex`

  `private boolean`

  `wrapLines`

  `private int`

  `xOffset`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UITextBox2(UIFont font,
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

  `ClearHighlights()`

  `void`

  `clearInput()`

  `void`

  `copyToClipboard()`

  `void`

  `cutToClipboard()`

  `void`

  `focus()`

  `int`

  `getCursorLine()`

  `int`

  `getCursorPos()`

  `private int`

  `getCursorPosFromX(int x)`

  `boolean`

  `getForceUpperCase()`

  `zombie.ui.UINineGrid`

  `getFrame()`

  `float`

  `getFrameAlpha()`

  `boolean`

  `getHasFrame()`

  `int`

  `getInset()`

  `String`

  `getInternalText()`

  `int`

  `getMaxLines()`

  `int`

  `getMaxTextLength()`

  `String`

  `getPlaceholderText()`

  `Color`

  `getStandardFrameColour()`

  `String`

  `getText()`

  `boolean`

  `hasClearButton()`

  `void`

  `ignoreFirstInput()`

  `boolean`

  `isDoingTextEntry()`

  `boolean`

  `isEditable()`

  `boolean`

  `isFocused()`

  `boolean`

  `isIgnoreFirst()`

  `boolean`

  `isMasked()`

  `boolean`

  `isMultipleLine()`

  `boolean`

  `isOnlyNumbers()`

  `boolean`

  `isOnlyText()`

  `boolean`

  `isSelectable()`

  `boolean`

  `isTextLimit()`

  `private void`

  `keepCursorVisible()`

  `void`

  `onCommandEntered()`

  `void`

  `onKeyBack()`

  `void`

  `onKeyDelete()`

  `void`

  `onKeyDown()`

  `void`

  `onKeyEnd()`

  `void`

  `onKeyEnter()`

  `void`

  `onKeyHome()`

  `void`

  `onKeyLeft()`

  `void`

  `onKeyRight()`

  `void`

  `onKeyUp()`

  `void`

  `onLostFocus()`

  `Boolean`

  `onMouseDown(double x,
  double y)`

  `Boolean`

  `onMouseMove(double dx,
  double dy)`

  `void`

  `onMouseMoveOutside(double dx,
  double dy)`

  `Boolean`

  `onMouseUp(double x,
  double y)`

  `void`

  `onMouseUpOutside(double x,
  double y)`

  `void`

  `onOtherKey(int key)`

  `void`

  `onPressDown()`

  `void`

  `onPressUp()`

  `void`

  `onresize()`

  `void`

  `onTextChange()`

  `(package private) void`

  `onTextDelete()`

  `private void`

  `Paginate()`

  `void`

  `pasteFromClipboard()`

  `void`

  `putCharacter(char eventChar)`

  `void`

  `render()`

  `void`

  `resetBlink()`

  `void`

  `selectAll()`

  `void`

  `setCentreVertically(boolean b)`

  `void`

  `setClearButton(boolean hasButton)`

  `void`

  `setCursorLine(int line)`

  `void`

  `setCursorPos(int charIndex)`

  `void`

  `setDoingTextEntry(boolean value)`

  `void`

  `setEditable(boolean b)`

  `void`

  `setFont(UIFont font)`

  `void`

  `setForceUpperCase(boolean forceUpperCase)`

  `void`

  `setFrameAlpha(float alpha)`

  `void`

  `setHasFrame(boolean hasFrame)`

  `void`

  `setIgnoreFirst(boolean value)`

  `void`

  `setMasked(boolean b)`

  `void`

  `setMaxLines(int maxLines)`

  `void`

  `setMaxTextLength(int maxTextLength)`

  `void`

  `setMultipleLine(boolean multiple)`

  `void`

  `setOnlyNumbers(boolean onlyNumbers)`

  `void`

  `setOnlyText(boolean onlyText)`

  `void`

  `setPlaceholderText(String text)`

  `void`

  `setPlaceholderTextColor(ColorInfo color)`

  `void`

  `setPlaceholderTextRGBA(float r,
  float g,
  float b,
  float a)`

  `void`

  `setSelectable(boolean b)`

  `void`

  `setSelectingRange(boolean value)`

  `void`

  `SetText(String text)`

  `void`

  `setTextColor(ColorInfo newColor)`

  `void`

  `setTextRGBA(float r,
  float g,
  float b,
  float a)`

  `void`

  `setWrapLines(boolean b)`

  `int`

  `toDisplayLine(int textOffset)`

  `void`

  `unfocus()`

  `void`

  `update()`

  `void`

  `updateText()`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDownOutside, onMouseWheel, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.ui.UITextEntryInterface

  `getUIName`

* Field Details
  -------------

  + ### consoleHasFocus

    private static boolean consoleHasFocus
  + ### lines

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> lines
  + ### frame

    public zombie.ui.UINineGrid frame
  + ### text

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text
  + ### centered

    private final boolean centered

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.UITextBox2.centered)
  + ### centerVertically

    private boolean centerVertically
  + ### standardFrameColour

    private final [Color](../core/Color.html "class in zombie.core") standardFrameColour
  + ### textEntryFrameColour

    private final [Color](../core/Color.html "class in zombie.core") textEntryFrameColour
  + ### textEntryCursorColour

    private final [Color](../core/Color.html "class in zombie.core") textEntryCursorColour
  + ### textEntryCursorColour2

    private final [Color](../core/Color.html "class in zombie.core") textEntryCursorColour2
  + ### neutralColour

    private final [Color](../core/Color.html "class in zombie.core") neutralColour
  + ### neutralColour2

    private final [Color](../core/Color.html "class in zombie.core") neutralColour2
  + ### badColour

    private final [Color](../core/Color.html "class in zombie.core") badColour
  + ### goodColour

    private final [Color](../core/Color.html "class in zombie.core") goodColour
  + ### doingTextEntry

    public boolean doingTextEntry
  + ### textEntryCursorPos

    private int textEntryCursorPos
  + ### textEntryMaxLength

    public int textEntryMaxLength
  + ### isEditable

    public boolean isEditable
  + ### isSelectable

    private boolean isSelectable
  + ### cursorLine

    private int cursorLine
  + ### multipleLine

    public boolean multipleLine
  + ### textOffsetOfLineStart

    private final gnu.trove.list.array.TIntArrayList textOffsetOfLineStart
  + ### toSelectionIndex

    private int toSelectionIndex
  + ### internalText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") internalText
  + ### maskChr

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maskChr

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.UITextBox2.maskChr)
  + ### mask

    private boolean mask
  + ### ignoreFirst

    private boolean ignoreFirst
  + ### font

    public [UIFont](UIFont.html "enum class in zombie.ui") font
  + ### highlightLines

    private final int[] highlightLines
  + ### hasFrame

    private boolean hasFrame
  + ### numVisibleLines

    public int numVisibleLines
  + ### topLineIndex

    public int topLineIndex
  + ### blinkFramesOn

    private final int blinkFramesOn

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.UITextBox2.blinkFramesOn)
  + ### blinkFramesOff

    private final int blinkFramesOff

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.UITextBox2.blinkFramesOff)
  + ### blinkFrame

    private float blinkFrame
  + ### blinkState

    private boolean blinkState
  + ### textColor

    private final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") textColor
  + ### edgeSize

    private final int edgeSize

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.UITextBox2.edgeSize)
  + ### selectingRange

    private boolean selectingRange
  + ### maxTextLength

    private int maxTextLength
  + ### forceUpperCase

    private boolean forceUpperCase
  + ### xOffset

    private int xOffset
  + ### maxLines

    private int maxLines
  + ### onlyNumbers

    private boolean onlyNumbers
  + ### onlyText

    private boolean onlyText
  + ### clearButtonTexture

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") clearButtonTexture
  + ### clearButtonSize

    private int clearButtonSize
  + ### clearButton

    private boolean clearButton
  + ### clearButtonTransition

    private [UITransition](UITransition.html "class in zombie.ui") clearButtonTransition
  + ### wrapLines

    private boolean wrapLines
  + ### placeholderText

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") placeholderText
  + ### placeholderTextColor

    private final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") placeholderTextColor
  + ### alwaysPaginate

    public boolean alwaysPaginate
  + ### textChanged

    public boolean textChanged
  + ### paginateWidth

    private int paginateWidth
  + ### paginateFont

    private [UIFont](UIFont.html "enum class in zombie.ui") paginateFont
* Constructor Details
  -------------------

  + ### UITextBox2

    public UITextBox2([UIFont](UIFont.html "enum class in zombie.ui") font,
    int x,
    int y,
    int width,
    int height,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    boolean hasFrame)
* Method Details
  --------------

  + ### setFont

    public void setFont([UIFont](UIFont.html "enum class in zombie.ui") font)
  + ### ClearHighlights

    public void ClearHighlights()
  + ### setMasked

    public void setMasked(boolean b)
  + ### isMasked

    public boolean isMasked()
  + ### onresize

    public void onresize()

    Overrides:
    :   `onresize` in class `UIElement`
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `UIElement`
  + ### getFrameAlpha

    public float getFrameAlpha()
  + ### setFrameAlpha

    public void setFrameAlpha(float alpha)
  + ### setTextColor

    public void setTextColor([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") newColor)
  + ### setTextRGBA

    public void setTextRGBA(float r,
    float g,
    float b,
    float a)
  + ### keepCursorVisible

    private void keepCursorVisible()
  + ### getText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getText()
  + ### getInternalText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInternalText()
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `update` in class `UIElement`
  + ### Paginate

    private void Paginate()
  + ### getInset

    public int getInset()
  + ### setEditable

    public void setEditable(boolean b)
  + ### isEditable

    public boolean isEditable()

    Specified by:
    :   `isEditable` in interface `zombie.ui.UITextEntryInterface`
  + ### setSelectable

    public void setSelectable(boolean b)
  + ### isSelectable

    public boolean isSelectable()
  + ### onMouseUp

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseUp(double x,
    double y)

    Overrides:
    :   `onMouseUp` in class `UIElement`
  + ### onMouseUpOutside

    public void onMouseUpOutside(double x,
    double y)

    Overrides:
    :   `onMouseUpOutside` in class `UIElement`
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
  + ### focus

    public void focus()
  + ### unfocus

    public void unfocus()
  + ### ignoreFirstInput

    public void ignoreFirstInput()
  + ### onMouseDown

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseDown(double x,
    double y)

    Overrides:
    :   `onMouseDown` in class `UIElement`
  + ### getCursorPosFromX

    private int getCursorPosFromX(int x)
  + ### updateText

    public void updateText()
  + ### SetText

    public void SetText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### setPlaceholderText

    public void setPlaceholderText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### getPlaceholderText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPlaceholderText()
  + ### setPlaceholderTextColor

    public void setPlaceholderTextColor([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") color)
  + ### setPlaceholderTextRGBA

    public void setPlaceholderTextRGBA(float r,
    float g,
    float b,
    float a)
  + ### clearInput

    public void clearInput()
  + ### onPressUp

    public void onPressUp()
  + ### onPressDown

    public void onPressDown()
  + ### onCommandEntered

    public void onCommandEntered()
  + ### onTextChange

    public void onTextChange()
  + ### onOtherKey

    public void onOtherKey(int key)

    Specified by:
    :   `onOtherKey` in interface `zombie.ui.UITextEntryInterface`
  + ### onLostFocus

    public void onLostFocus()
  + ### getMaxTextLength

    public int getMaxTextLength()
  + ### setMaxTextLength

    public void setMaxTextLength(int maxTextLength)
  + ### getForceUpperCase

    public boolean getForceUpperCase()
  + ### setForceUpperCase

    public void setForceUpperCase(boolean forceUpperCase)
  + ### getHasFrame

    public boolean getHasFrame()
  + ### setHasFrame

    public void setHasFrame(boolean hasFrame)
  + ### setClearButton

    public void setClearButton(boolean hasButton)
  + ### hasClearButton

    public boolean hasClearButton()
  + ### toDisplayLine

    public int toDisplayLine(int textOffset)
  + ### setMultipleLine

    public void setMultipleLine(boolean multiple)
  + ### isMultipleLine

    public boolean isMultipleLine()
  + ### getCursorLine

    public int getCursorLine()
  + ### setCursorLine

    public void setCursorLine(int line)
  + ### getCursorPos

    public int getCursorPos()
  + ### setCursorPos

    public void setCursorPos(int charIndex)
  + ### getMaxLines

    public int getMaxLines()
  + ### setMaxLines

    public void setMaxLines(int maxLines)
  + ### isFocused

    public boolean isFocused()
  + ### isOnlyNumbers

    public boolean isOnlyNumbers()

    Specified by:
    :   `isOnlyNumbers` in interface `zombie.ui.UITextEntryInterface`
  + ### setOnlyNumbers

    public void setOnlyNumbers(boolean onlyNumbers)
  + ### isOnlyText

    public boolean isOnlyText()

    Specified by:
    :   `isOnlyText` in interface `zombie.ui.UITextEntryInterface`
  + ### setOnlyText

    public void setOnlyText(boolean onlyText)
  + ### resetBlink

    public void resetBlink()
  + ### selectAll

    public void selectAll()

    Specified by:
    :   `selectAll` in interface `zombie.ui.UITextEntryInterface`
  + ### isDoingTextEntry

    public boolean isDoingTextEntry()

    Specified by:
    :   `isDoingTextEntry` in interface `zombie.ui.UITextEntryInterface`
  + ### setDoingTextEntry

    public void setDoingTextEntry(boolean value)

    Specified by:
    :   `setDoingTextEntry` in interface `zombie.ui.UITextEntryInterface`
  + ### getFrame

    public zombie.ui.UINineGrid getFrame()

    Specified by:
    :   `getFrame` in interface `zombie.ui.UITextEntryInterface`
  + ### isIgnoreFirst

    public boolean isIgnoreFirst()

    Specified by:
    :   `isIgnoreFirst` in interface `zombie.ui.UITextEntryInterface`
  + ### setIgnoreFirst

    public void setIgnoreFirst(boolean value)

    Specified by:
    :   `setIgnoreFirst` in interface `zombie.ui.UITextEntryInterface`
  + ### setSelectingRange

    public void setSelectingRange(boolean value)

    Specified by:
    :   `setSelectingRange` in interface `zombie.ui.UITextEntryInterface`
  + ### getStandardFrameColour

    public [Color](../core/Color.html "class in zombie.core") getStandardFrameColour()

    Specified by:
    :   `getStandardFrameColour` in interface `zombie.ui.UITextEntryInterface`
  + ### onKeyEnter

    public void onKeyEnter()

    Specified by:
    :   `onKeyEnter` in interface `zombie.ui.UITextEntryInterface`
  + ### onKeyHome

    public void onKeyHome()

    Specified by:
    :   `onKeyHome` in interface `zombie.ui.UITextEntryInterface`
  + ### onKeyEnd

    public void onKeyEnd()

    Specified by:
    :   `onKeyEnd` in interface `zombie.ui.UITextEntryInterface`
  + ### onKeyUp

    public void onKeyUp()

    Specified by:
    :   `onKeyUp` in interface `zombie.ui.UITextEntryInterface`
  + ### onKeyDown

    public void onKeyDown()

    Specified by:
    :   `onKeyDown` in interface `zombie.ui.UITextEntryInterface`
  + ### onKeyLeft

    public void onKeyLeft()

    Specified by:
    :   `onKeyLeft` in interface `zombie.ui.UITextEntryInterface`
  + ### onKeyRight

    public void onKeyRight()

    Specified by:
    :   `onKeyRight` in interface `zombie.ui.UITextEntryInterface`
  + ### onTextDelete

    void onTextDelete()
  + ### onKeyBack

    public void onKeyBack()

    Specified by:
    :   `onKeyBack` in interface `zombie.ui.UITextEntryInterface`
  + ### onKeyDelete

    public void onKeyDelete()

    Specified by:
    :   `onKeyDelete` in interface `zombie.ui.UITextEntryInterface`
  + ### pasteFromClipboard

    public void pasteFromClipboard()

    Specified by:
    :   `pasteFromClipboard` in interface `zombie.ui.UITextEntryInterface`
  + ### cutToClipboard

    public void cutToClipboard()

    Specified by:
    :   `cutToClipboard` in interface `zombie.ui.UITextEntryInterface`
  + ### copyToClipboard

    public void copyToClipboard()

    Specified by:
    :   `copyToClipboard` in interface `zombie.ui.UITextEntryInterface`
  + ### isTextLimit

    public boolean isTextLimit()

    Specified by:
    :   `isTextLimit` in interface `zombie.ui.UITextEntryInterface`
  + ### putCharacter

    public void putCharacter(char eventChar)

    Specified by:
    :   `putCharacter` in interface `zombie.ui.UITextEntryInterface`
  + ### setWrapLines

    public void setWrapLines(boolean b)
  + ### setCentreVertically

    public void setCentreVertically(boolean b)