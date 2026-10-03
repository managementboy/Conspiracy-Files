[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [AtomUITextEntry](AtomUITextEntry.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [doingTextEntry](#doingTextEntry)
   2. [textEntryCursorPos](#textEntryCursorPos)
   3. [isEditable](#isEditable)
   4. [isSelectable](#isSelectable)
   5. [toSelectionIndex](#toSelectionIndex)
   6. [mask](#mask)
   7. [blinkState](#blinkState)
   8. [blinkFramesOn](#blinkFramesOn)
   9. [blinkFramesOff](#blinkFramesOff)
   10. [blinkFrame](#blinkFrame)
   11. [selectingRange](#selectingRange)
   12. [textEntryMaxLength](#textEntryMaxLength)
   13. [onlyNumbers](#onlyNumbers)
   14. [onlyText](#onlyText)
   15. [maxTextLength](#maxTextLength)
   16. [forceUpperCase](#forceUpperCase)
   17. [multiline](#multiline)
   18. [cursorDef](#cursorDef)
   19. [maskDef](#maskDef)
   20. [fontToUse](#fontToUse)
   21. [text](#text)
   22. [textTracking](#textTracking)
   23. [textLeading](#textLeading)
   24. [charNum](#charNum)
   25. [textWidth](#textWidth)
   26. [textHeight](#textHeight)
   27. [data](#data)
   28. [textData](#textData)
   29. [luaOnTextChange](#luaOnTextChange)
7. [Constructor Details](#constructor-detail)
   1. [AtomUITextEntry(KahluaTable)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable))
8. [Method Details](#method-detail)
   1. [render()](#render())
   2. [init()](#init())
   3. [update()](#update())
   4. [drawSelection()](#drawSelection())
   5. [drawCursor()](#drawCursor())
   6. [drawText()](#drawText())
   7. [getSdfThreshold()](#getSdfThreshold())
   8. [loadFromTable()](#loadFromTable())
   9. [updateCharData(AngelCodeFont.CharDef, double, double, int)](#updateCharData(zombie.core.fonts.AngelCodeFont.CharDef,double,double,int))
   10. [updateInternalValues()](#updateInternalValues())
   11. [setFont(UIFont)](#setFont(zombie.ui.UIFont))
   12. [setText(String)](#setText(java.lang.String))
   13. [tryGetFont(String, UIFont)](#tryGetFont(java.lang.String,zombie.ui.UIFont))
   14. [setMask(boolean)](#setMask(boolean))
   15. [isMask()](#isMask())
   16. [focus()](#focus())
   17. [unfocus()](#unfocus())
   18. [onOtherKey(int)](#onOtherKey(int))
   19. [putCharacter(char)](#putCharacter(char))
   20. [getCursorPos(double, double)](#getCursorPos(double,double))
   21. [onConsumeMouseButtonDown(int, double, double)](#onConsumeMouseButtonDown(int,double,double))
   22. [onConsumeMouseMove(double, double, double, double)](#onConsumeMouseMove(double,double,double,double))
   23. [onExtendMouseMoveOutside(double, double, double, double)](#onExtendMouseMoveOutside(double,double,double,double))
   24. [onConsumeMouseButtonUp(int, double, double)](#onConsumeMouseButtonUp(int,double,double))
   25. [onMouseButtonUpOutside(int, double, double)](#onMouseButtonUpOutside(int,double,double))
   26. [isDoingTextEntry()](#isDoingTextEntry())
   27. [setDoingTextEntry(boolean)](#setDoingTextEntry(boolean))
   28. [isEditable()](#isEditable())
   29. [getFrame()](#getFrame())
   30. [isIgnoreFirst()](#isIgnoreFirst())
   31. [setIgnoreFirst(boolean)](#setIgnoreFirst(boolean))
   32. [setSelectingRange(boolean)](#setSelectingRange(boolean))
   33. [getStandardFrameColour()](#getStandardFrameColour())
   34. [onKeyEnter()](#onKeyEnter())
   35. [onKeyHome()](#onKeyHome())
   36. [onKeyEnd()](#onKeyEnd())
   37. [resetBlink()](#resetBlink())
   38. [onKeyUp()](#onKeyUp())
   39. [onKeyDown()](#onKeyDown())
   40. [onKeyLeft()](#onKeyLeft())
   41. [onKeyRight()](#onKeyRight())
   42. [onKeyDelete()](#onKeyDelete())
   43. [onTextDelete()](#onTextDelete())
   44. [onKeyBack()](#onKeyBack())
   45. [pasteFromClipboard()](#pasteFromClipboard())
   46. [copyToClipboard()](#copyToClipboard())
   47. [cutToClipboard()](#cutToClipboard())
   48. [selectAll()](#selectAll())
   49. [isTextLimit()](#isTextLimit())
   50. [isOnlyNumbers()](#isOnlyNumbers())
   51. [isOnlyText()](#isOnlyText())
   52. [setOnlyNumbers(boolean)](#setOnlyNumbers(boolean))
   53. [setOnlyText(boolean)](#setOnlyText(boolean))
   54. [getMaxTextLength()](#getMaxTextLength())
   55. [setMaxTextLength(int)](#setMaxTextLength(int))
   56. [getForceUpperCase()](#getForceUpperCase())
   57. [setForceUpperCase(boolean)](#setForceUpperCase(boolean))
   58. [isMultiline()](#isMultiline())
   59. [setMultiline(boolean)](#setMultiline(boolean))
   60. [getText()](#getText())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class AtomUITextEntry
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.AtomUI](AtomUI.html "class in zombie.ui")

zombie.ui.AtomUITextEntry

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface, zombie.ui.UITextEntryInterface`

---

public class AtomUITextEntry
extends [AtomUI](AtomUI.html "class in zombie.ui")
implements zombie.ui.UITextEntryInterface

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static class`

  `AtomUITextEntry.CharData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `blinkFrame`

  `(package private) int`

  `blinkFramesOff`

  `(package private) int`

  `blinkFramesOn`

  `(package private) boolean`

  `blinkState`

  `private int`

  `charNum`

  `(package private) AngelCodeFont.CharDef`

  `cursorDef`

  `private static char[]`

  `data`

  `(package private) boolean`

  `doingTextEntry`

  `(package private) AngelCodeFont`

  `fontToUse`

  `(package private) boolean`

  `forceUpperCase`

  `(package private) boolean`

  `isEditable`

  `(package private) boolean`

  `isSelectable`

  `(package private) Object`

  `luaOnTextChange`

  `(package private) boolean`

  `mask`

  `(package private) AngelCodeFont.CharDef`

  `maskDef`

  `(package private) int`

  `maxTextLength`

  `(package private) boolean`

  `multiline`

  `(package private) boolean`

  `onlyNumbers`

  `(package private) boolean`

  `onlyText`

  `(package private) boolean`

  `selectingRange`

  `(package private) String`

  `text`

  `(package private) ArrayList<AtomUITextEntry.CharData>`

  `textData`

  `(package private) int`

  `textEntryCursorPos`

  `(package private) int`

  `textEntryMaxLength`

  `private int`

  `textHeight`

  `(package private) double`

  `textLeading`

  `(package private) double`

  `textTracking`

  `private int`

  `textWidth`

  `(package private) int`

  `toSelectionIndex`

  ### Fields inherited from class [AtomUI](AtomUI.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorDown, anchorLeft, anchorRight, anchorTop, angle, colorA, colorB, colorG, colorR, cosA, downSide, enabled, height, leftSide, luaKeyPress, luaKeyRelease, luaKeyRepeat, luaMouseButtonDown, luaMouseButtonDownOutside, luaMouseButtonUp, luaMouseButtonUpOutside, luaMouseMove, luaMouseMoveOutside, luaMouseWheel, luaRenderUpdate, luaResize, luaUpdate, nodes, parentNode, pivotX, pivotY, rightSide, scaleX, scaleY, sinA, stencil, stencilLevel, stencilNode, table, topSide, uiname, visible, width, x, y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AtomUITextEntry(se.krka.kahlua.vm.KahluaTable table)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `copyToClipboard()`

  `void`

  `cutToClipboard()`

  `(package private) void`

  `drawCursor()`

  `(package private) void`

  `drawSelection()`

  `(package private) void`

  `drawText()`

  `void`

  `focus()`

  `(package private) int`

  `getCursorPos(double x,
  double y)`

  `boolean`

  `getForceUpperCase()`

  `zombie.ui.UINineGrid`

  `getFrame()`

  `int`

  `getMaxTextLength()`

  `(package private) float`

  `getSdfThreshold()`

  `Color`

  `getStandardFrameColour()`

  `String`

  `getText()`

  `void`

  `init()`

  `boolean`

  `isDoingTextEntry()`

  `boolean`

  `isEditable()`

  `boolean`

  `isIgnoreFirst()`

  `boolean`

  `isMask()`

  `boolean`

  `isMultiline()`

  `boolean`

  `isOnlyNumbers()`

  `boolean`

  `isOnlyText()`

  `boolean`

  `isTextLimit()`

  `(package private) void`

  `loadFromTable()`

  `boolean`

  `onConsumeMouseButtonDown(int btn,
  double x,
  double y)`

  `boolean`

  `onConsumeMouseButtonUp(int btn,
  double x,
  double y)`

  `Boolean`

  `onConsumeMouseMove(double dx,
  double dy,
  double x,
  double y)`

  `void`

  `onExtendMouseMoveOutside(double dx,
  double dy,
  double x,
  double y)`

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

  `onMouseButtonUpOutside(int btn,
  double x,
  double y)`

  `void`

  `onOtherKey(int eventKey)`

  `(package private) void`

  `onTextDelete()`

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

  `setDoingTextEntry(boolean value)`

  `void`

  `setFont(UIFont font)`

  `void`

  `setForceUpperCase(boolean forceUpperCase)`

  `void`

  `setIgnoreFirst(boolean value)`

  `void`

  `setMask(boolean b)`

  `void`

  `setMaxTextLength(int maxtextLength)`

  `void`

  `setMultiline(boolean value)`

  `void`

  `setOnlyNumbers(boolean onlyNumbers)`

  `void`

  `setOnlyText(boolean onlyText)`

  `void`

  `setSelectingRange(boolean value)`

  `void`

  `setText(String text)`

  `(package private) UIFont`

  `tryGetFont(String key,
  UIFont defaultValue)`

  `void`

  `unfocus()`

  `void`

  `update()`

  `(package private) void`

  `updateCharData(AngelCodeFont.CharDef def,
  double x,
  double y,
  int id)`

  `(package private) void`

  `updateInternalValues()`

  ### Methods inherited from class [AtomUI](AtomUI.html#method-summary "class in zombie.ui")

  `addNode, bringToTop, clearStencilRect, getAbsolutePosition, getAngle, getColor, getHeight, getLocalPosition, getLuaAbsolutePosition, getLuaLocalPosition, getLuaParentPosition, getMaxDrawHeight, getNodes, getParent, getParentNode, getPivotX, getPivotY, getRenderThisPlayerOnly, getScaleX, getScaleY, getTable, getUIName, getWidth, getX, getY, isAlwaysOnTop, isBackMost, isCapture, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isModalVisible, isMouseOver, isOverElement, isOverElementLocal, isPointOver, isVisible, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseWheel, onMouseButtonDownOutside, onResize, removeNode, repaintStencilRect, setAlwaysOnTop, setAngle, setBackMost, setColor, setEnabled, setHeight, setHeightSilent, setParentNode, setPivotX, setPivotY, setScaleX, setScaleY, setStencilRect, setUIName, setVisible, setWidth, setWidthSilent, setX, setY, toLocalCoordinates, tryGetBoolean, tryGetClosure, tryGetDouble, tryGetString, updateSize`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.ui.UITextEntryInterface

  `getUIName`

* Field Details
  -------------

  + ### doingTextEntry

    boolean doingTextEntry
  + ### textEntryCursorPos

    int textEntryCursorPos
  + ### isEditable

    boolean isEditable
  + ### isSelectable

    boolean isSelectable
  + ### toSelectionIndex

    int toSelectionIndex
  + ### mask

    boolean mask
  + ### blinkState

    boolean blinkState
  + ### blinkFramesOn

    int blinkFramesOn
  + ### blinkFramesOff

    int blinkFramesOff
  + ### blinkFrame

    float blinkFrame
  + ### selectingRange

    boolean selectingRange
  + ### textEntryMaxLength

    int textEntryMaxLength
  + ### onlyNumbers

    boolean onlyNumbers
  + ### onlyText

    boolean onlyText
  + ### maxTextLength

    int maxTextLength
  + ### forceUpperCase

    boolean forceUpperCase
  + ### multiline

    boolean multiline
  + ### cursorDef

    [AngelCodeFont.CharDef](../core/fonts/AngelCodeFont.CharDef.html "class in zombie.core.fonts") cursorDef
  + ### maskDef

    [AngelCodeFont.CharDef](../core/fonts/AngelCodeFont.CharDef.html "class in zombie.core.fonts") maskDef
  + ### fontToUse

    [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") fontToUse
  + ### text

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text
  + ### textTracking

    double textTracking
  + ### textLeading

    double textLeading
  + ### charNum

    private int charNum
  + ### textWidth

    private int textWidth
  + ### textHeight

    private int textHeight
  + ### data

    private static char[] data
  + ### textData

    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AtomUITextEntry.CharData](AtomUITextEntry.CharData.html "class in zombie.ui")> textData
  + ### luaOnTextChange

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaOnTextChange
* Constructor Details
  -------------------

  + ### AtomUITextEntry

    public AtomUITextEntry(se.krka.kahlua.vm.KahluaTable table)
* Method Details
  --------------

  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `AtomUI`
  + ### init

    public void init()

    Overrides:
    :   `init` in class `AtomUI`
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `update` in class `AtomUI`
  + ### drawSelection

    void drawSelection()
  + ### drawCursor

    void drawCursor()
  + ### drawText

    void drawText()
  + ### getSdfThreshold

    float getSdfThreshold()
  + ### loadFromTable

    void loadFromTable()

    Overrides:
    :   `loadFromTable` in class `AtomUI`
  + ### updateCharData

    void updateCharData([AngelCodeFont.CharDef](../core/fonts/AngelCodeFont.CharDef.html "class in zombie.core.fonts") def,
    double x,
    double y,
    int id)
  + ### updateInternalValues

    void updateInternalValues()

    Overrides:
    :   `updateInternalValues` in class `AtomUI`
  + ### setFont

    public void setFont([UIFont](UIFont.html "enum class in zombie.ui") font)
  + ### setText

    public void setText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### tryGetFont

    [UIFont](UIFont.html "enum class in zombie.ui") tryGetFont([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [UIFont](UIFont.html "enum class in zombie.ui") defaultValue)
  + ### setMask

    public void setMask(boolean b)
  + ### isMask

    public boolean isMask()
  + ### focus

    public void focus()
  + ### unfocus

    public void unfocus()
  + ### onOtherKey

    public void onOtherKey(int eventKey)

    Specified by:
    :   `onOtherKey` in interface `zombie.ui.UITextEntryInterface`
  + ### putCharacter

    public void putCharacter(char eventChar)

    Specified by:
    :   `putCharacter` in interface `zombie.ui.UITextEntryInterface`
  + ### getCursorPos

    int getCursorPos(double x,
    double y)
  + ### onConsumeMouseButtonDown

    public boolean onConsumeMouseButtonDown(int btn,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseButtonDown` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `onConsumeMouseButtonDown` in class `AtomUI`
  + ### onConsumeMouseMove

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onConsumeMouseMove(double dx,
    double dy,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseMove` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `onConsumeMouseMove` in class `AtomUI`
  + ### onExtendMouseMoveOutside

    public void onExtendMouseMoveOutside(double dx,
    double dy,
    double x,
    double y)

    Specified by:
    :   `onExtendMouseMoveOutside` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `onExtendMouseMoveOutside` in class `AtomUI`
  + ### onConsumeMouseButtonUp

    public boolean onConsumeMouseButtonUp(int btn,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseButtonUp` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `onConsumeMouseButtonUp` in class `AtomUI`
  + ### onMouseButtonUpOutside

    public void onMouseButtonUpOutside(int btn,
    double x,
    double y)

    Specified by:
    :   `onMouseButtonUpOutside` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `onMouseButtonUpOutside` in class `AtomUI`
  + ### isDoingTextEntry

    public boolean isDoingTextEntry()

    Specified by:
    :   `isDoingTextEntry` in interface `zombie.ui.UITextEntryInterface`
  + ### setDoingTextEntry

    public void setDoingTextEntry(boolean value)

    Specified by:
    :   `setDoingTextEntry` in interface `zombie.ui.UITextEntryInterface`
  + ### isEditable

    public boolean isEditable()

    Specified by:
    :   `isEditable` in interface `zombie.ui.UITextEntryInterface`
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
  + ### resetBlink

    public void resetBlink()
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
  + ### onKeyDelete

    public void onKeyDelete()

    Specified by:
    :   `onKeyDelete` in interface `zombie.ui.UITextEntryInterface`
  + ### onTextDelete

    void onTextDelete()
  + ### onKeyBack

    public void onKeyBack()

    Specified by:
    :   `onKeyBack` in interface `zombie.ui.UITextEntryInterface`
  + ### pasteFromClipboard

    public void pasteFromClipboard()

    Specified by:
    :   `pasteFromClipboard` in interface `zombie.ui.UITextEntryInterface`
  + ### copyToClipboard

    public void copyToClipboard()

    Specified by:
    :   `copyToClipboard` in interface `zombie.ui.UITextEntryInterface`
  + ### cutToClipboard

    public void cutToClipboard()

    Specified by:
    :   `cutToClipboard` in interface `zombie.ui.UITextEntryInterface`
  + ### selectAll

    public void selectAll()

    Specified by:
    :   `selectAll` in interface `zombie.ui.UITextEntryInterface`
  + ### isTextLimit

    public boolean isTextLimit()

    Specified by:
    :   `isTextLimit` in interface `zombie.ui.UITextEntryInterface`
  + ### isOnlyNumbers

    public boolean isOnlyNumbers()

    Specified by:
    :   `isOnlyNumbers` in interface `zombie.ui.UITextEntryInterface`
  + ### isOnlyText

    public boolean isOnlyText()

    Specified by:
    :   `isOnlyText` in interface `zombie.ui.UITextEntryInterface`
  + ### setOnlyNumbers

    public void setOnlyNumbers(boolean onlyNumbers)
  + ### setOnlyText

    public void setOnlyText(boolean onlyText)
  + ### getMaxTextLength

    public int getMaxTextLength()
  + ### setMaxTextLength

    public void setMaxTextLength(int maxtextLength)
  + ### getForceUpperCase

    public boolean getForceUpperCase()
  + ### setForceUpperCase

    public void setForceUpperCase(boolean forceUpperCase)
  + ### isMultiline

    public boolean isMultiline()
  + ### setMultiline

    public void setMultiline(boolean value)
  + ### getText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getText()