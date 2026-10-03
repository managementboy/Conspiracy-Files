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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [scrollBarV](#scrollBarV)
   3. [outputLog](#outputLog)
   4. [commandLine](#commandLine)
   5. [resizing](#resizing)
   6. [resizeWidth](#resizeWidth)
   7. [resizeHeight](#resizeHeight)
   8. [resizeStartX](#resizeStartX)
   9. [resizeStartY](#resizeStartY)
   10. [resizeStartWidth](#resizeStartWidth)
   11. [resizeStartHeight](#resizeStartHeight)
   12. [autosuggest](#autosuggest)
   13. [consoleVersion](#consoleVersion)
   14. [inputlength](#inputlength)
   15. [previous](#previous)
   16. [globalLuaMethods](#globalLuaMethods)
   17. [previousIndex](#previousIndex)
   18. [prevSuggestion](#prevSuggestion)
   19. [availableCommands](#availableCommands)
   20. [availableCommandsHelp](#availableCommandsHelp)
   21. [debounceUp](#debounceUp)
   22. [debounceDown](#debounceDown)
   23. [outputLock](#outputLock)
   24. [outputBB](#outputBB)
   25. [outputChanged](#outputChanged)
   26. [outputDecoder](#outputDecoder)
   27. [outputChars](#outputChars)
   28. [outputCharBuf](#outputCharBuf)
7. [Constructor Details](#constructor-detail)
   1. [UIDebugConsole(int, int)](#%3Cinit%3E(int,int))
8. [Method Details](#method-detail)
   1. [onMouseDown(double, double)](#onMouseDown(double,double))
   2. [onMouseUp(double, double)](#onMouseUp(double,double))
   3. [onMouseUpOutside(double, double)](#onMouseUpOutside(double,double))
   4. [onMouseMove(double, double)](#onMouseMove(double,double))
   5. [setNewSize(int, int)](#setNewSize(int,int))
   6. [render()](#render())
   7. [update()](#update())
   8. [ProcessCommand()](#ProcessCommand())
   9. [historyPrev()](#historyPrev())
   10. [historyNext()](#historyNext())
   11. [onOtherKey(int)](#onOtherKey(int))
   12. [ClearConsole()](#ClearConsole())
   13. [UpdateViewPos()](#UpdateViewPos())
   14. [SpoolText(String)](#SpoolText(java.lang.String))
   15. [SuggestionEngine(String)](#SuggestionEngine(java.lang.String))
   16. [SuggestionEngine(String, ArrayList)](#SuggestionEngine(java.lang.String,java.util.ArrayList))
   17. [InitSuggestionEngine()](#InitSuggestionEngine())
   18. [levenshteinDistance(CharSequence, CharSequence)](#levenshteinDistance(java.lang.CharSequence,java.lang.CharSequence))
   19. [setSuggestWidth(int)](#setSuggestWidth(int))
   20. [addOutput(byte[], int, int)](#addOutput(byte%5B%5D,int,int))
   21. [handleOutput()](#handleOutput())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UIDebugConsole
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.NewWindow

zombie.ui.UIDebugConsole

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class UIDebugConsole
extends zombie.ui.NewWindow

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private class`

  `UIDebugConsole.CommandEntry`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) UITextBox2`

  `autosuggest`

  `(package private) String[]`

  `availableCommands`

  `(package private) String[]`

  `availableCommandsHelp`

  `UITextBox2`

  `commandLine`

  `(package private) String`

  `consoleVersion`

  `boolean`

  `debounceDown`

  `boolean`

  `debounceUp`

  `private final ArrayList<Method>`

  `globalLuaMethods`

  `(package private) int`

  `inputlength`

  `static UIDebugConsole`

  `instance`

  `private static final ByteBuffer`

  `outputBB`

  `private static boolean`

  `outputChanged`

  `private static CharBuffer`

  `outputCharBuf`

  `private static char[]`

  `outputChars`

  `private static CharsetDecoder`

  `outputDecoder`

  `private static final Object`

  `outputLock`

  `(package private) UITextBox2`

  `outputLog`

  `private final ArrayList<String>`

  `previous`

  `int`

  `previousIndex`

  `(package private) Method`

  `prevSuggestion`

  `(package private) boolean`

  `resizeHeight`

  `(package private) int`

  `resizeStartHeight`

  `(package private) int`

  `resizeStartWidth`

  `(package private) int`

  `resizeStartX`

  `(package private) int`

  `resizeStartY`

  `(package private) boolean`

  `resizeWidth`

  `(package private) boolean`

  `resizing`

  `(package private) zombie.ui.ScrollBar`

  `scrollBarV`

  ### Fields inherited from class zombie.ui.NewWindow

  `alpha, clickX, clickY, clientH, clientW, closeButton, dialogBottomLeft, dialogBottomMiddle, dialogBottomRight, dialogLeft, dialogMiddle, dialogRight, movable, moving, ncclientH, ncclientW, nestedItems, resizeToFitY, titleCloseIcon, titleLeft, titleMiddle, titleRight`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UIDebugConsole(int x,
  int y)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addOutput(byte[] b,
  int off,
  int len)`

  `(package private) void`

  `ClearConsole()`

  `private void`

  `handleOutput()`

  `(package private) void`

  `historyNext()`

  `(package private) void`

  `historyPrev()`

  `(package private) void`

  `InitSuggestionEngine()`

  `int`

  `levenshteinDistance(CharSequence lhs,
  CharSequence rhs)`

  `Boolean`

  `onMouseDown(double x,
  double y)`

  `Boolean`

  `onMouseMove(double dx,
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

  `ProcessCommand()`

  `void`

  `render()`

  `private void`

  `setNewSize(int newWidth,
  int newHeight)`

  `(package private) void`

  `setSuggestWidth(int width)`

  `(package private) void`

  `SpoolText(String spoolLine)`

  `(package private) Method`

  `SuggestionEngine(String input)`

  `(package private) Method`

  `SuggestionEngine(String input,
  ArrayList<Method> methods)`

  `void`

  `update()`

  `(package private) void`

  `UpdateViewPos()`

  ### Methods inherited from class zombie.ui.NewWindow

  `ButtonClicked, Nest, onMouseMoveOutside, setMovable`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDownOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static [UIDebugConsole](UIDebugConsole.html "class in zombie.ui") instance
  + ### scrollBarV

    zombie.ui.ScrollBar scrollBarV
  + ### outputLog

    [UITextBox2](UITextBox2.html "class in zombie.ui") outputLog
  + ### commandLine

    public [UITextBox2](UITextBox2.html "class in zombie.ui") commandLine
  + ### resizing

    boolean resizing
  + ### resizeWidth

    boolean resizeWidth
  + ### resizeHeight

    boolean resizeHeight
  + ### resizeStartX

    int resizeStartX
  + ### resizeStartY

    int resizeStartY
  + ### resizeStartWidth

    int resizeStartWidth
  + ### resizeStartHeight

    int resizeStartHeight
  + ### autosuggest

    [UITextBox2](UITextBox2.html "class in zombie.ui") autosuggest
  + ### consoleVersion

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") consoleVersion
  + ### inputlength

    int inputlength
  + ### previous

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> previous
  + ### globalLuaMethods

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Method](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Method.html "class or interface in java.lang.reflect")> globalLuaMethods
  + ### previousIndex

    public int previousIndex
  + ### prevSuggestion

    [Method](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Method.html "class or interface in java.lang.reflect") prevSuggestion
  + ### availableCommands

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] availableCommands
  + ### availableCommandsHelp

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] availableCommandsHelp
  + ### debounceUp

    public boolean debounceUp
  + ### debounceDown

    public boolean debounceDown
  + ### outputLock

    private static final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") outputLock
  + ### outputBB

    private static final [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") outputBB
  + ### outputChanged

    private static boolean outputChanged
  + ### outputDecoder

    private static [CharsetDecoder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/charset/CharsetDecoder.html "class or interface in java.nio.charset") outputDecoder
  + ### outputChars

    private static char[] outputChars
  + ### outputCharBuf

    private static [CharBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/CharBuffer.html "class or interface in java.nio") outputCharBuf
* Constructor Details
  -------------------

  + ### UIDebugConsole

    public UIDebugConsole(int x,
    int y)
* Method Details
  --------------

  + ### onMouseDown

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseDown(double x,
    double y)

    Overrides:
    :   `onMouseDown` in class `zombie.ui.NewWindow`
  + ### onMouseUp

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseUp(double x,
    double y)

    Overrides:
    :   `onMouseUp` in class `zombie.ui.NewWindow`
  + ### onMouseUpOutside

    public void onMouseUpOutside(double x,
    double y)

    Overrides:
    :   `onMouseUpOutside` in class `UIElement`
  + ### onMouseMove

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseMove(double dx,
    double dy)

    Overrides:
    :   `onMouseMove` in class `zombie.ui.NewWindow`
  + ### setNewSize

    private void setNewSize(int newWidth,
    int newHeight)
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `zombie.ui.NewWindow`
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `update` in class `zombie.ui.NewWindow`
  + ### ProcessCommand

    public void ProcessCommand()
  + ### historyPrev

    void historyPrev()
  + ### historyNext

    void historyNext()
  + ### onOtherKey

    public void onOtherKey(int key)
  + ### ClearConsole

    void ClearConsole()
  + ### UpdateViewPos

    void UpdateViewPos()
  + ### SpoolText

    void SpoolText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spoolLine)
  + ### SuggestionEngine

    [Method](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Method.html "class or interface in java.lang.reflect") SuggestionEngine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input)
  + ### SuggestionEngine

    [Method](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Method.html "class or interface in java.lang.reflect") SuggestionEngine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Method](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/reflect/Method.html "class or interface in java.lang.reflect")> methods)
  + ### InitSuggestionEngine

    void InitSuggestionEngine()
  + ### levenshteinDistance

    public int levenshteinDistance([CharSequence](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/CharSequence.html "class or interface in java.lang") lhs,
    [CharSequence](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/CharSequence.html "class or interface in java.lang") rhs)
  + ### setSuggestWidth

    void setSuggestWidth(int width)
  + ### addOutput

    public void addOutput(byte[] b,
    int off,
    int len)
  + ### handleOutput

    private void handleOutput()