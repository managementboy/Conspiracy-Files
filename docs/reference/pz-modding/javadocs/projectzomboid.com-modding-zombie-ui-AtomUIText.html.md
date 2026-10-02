[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [AtomUIText](AtomUIText.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [fontToUse](#fontToUse)
   2. [text](#text)
   3. [textTracking](#textTracking)
   4. [textLeading](#textLeading)
   5. [autoWidth](#autoWidth)
   6. [outlineThick](#outlineThick)
   7. [outlineColorR](#outlineColorR)
   8. [outlineColorG](#outlineColorG)
   9. [outlineColorB](#outlineColorB)
   10. [outlineColorA](#outlineColorA)
   11. [shadow](#shadow)
   12. [shadowValue](#shadowValue)
   13. [charNum](#charNum)
   14. [textWidth](#textWidth)
   15. [textHeight](#textHeight)
   16. [realTextHeight](#realTextHeight)
   17. [data](#data)
   18. [textData](#textData)
7. [Constructor Details](#constructor-detail)
   1. [AtomUIText(KahluaTable)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable))
8. [Method Details](#method-detail)
   1. [render()](#render())
   2. [init()](#init())
   3. [drawText()](#drawText())
   4. [getSdfThreshold()](#getSdfThreshold())
   5. [loadFromTable()](#loadFromTable())
   6. [updateCharData(AngelCodeFont.CharDef, double, double)](#updateCharData(zombie.core.fonts.AngelCodeFont.CharDef,double,double))
   7. [updateInternalValues()](#updateInternalValues())
   8. [setFont(UIFont)](#setFont(zombie.ui.UIFont))
   9. [setText(String)](#setText(java.lang.String))
   10. [setAutoWidth(Double)](#setAutoWidth(java.lang.Double))
   11. [getTextHeight()](#getTextHeight())
   12. [getTextWidth()](#getTextWidth())
   13. [tryGetFont(String, UIFont)](#tryGetFont(java.lang.String,zombie.ui.UIFont))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class AtomUIText
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.AtomUI](AtomUI.html "class in zombie.ui")

zombie.ui.AtomUIText

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public class AtomUIText
extends [AtomUI](AtomUI.html "class in zombie.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static class`

  `AtomUIText.CharData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) int`

  `autoWidth`

  `private int`

  `charNum`

  `private static char[]`

  `data`

  `(package private) AngelCodeFont`

  `fontToUse`

  `(package private) float`

  `outlineColorA`

  `(package private) float`

  `outlineColorB`

  `(package private) float`

  `outlineColorG`

  `(package private) float`

  `outlineColorR`

  `(package private) float`

  `outlineThick`

  `private int`

  `realTextHeight`

  `(package private) boolean`

  `shadow`

  `(package private) float`

  `shadowValue`

  `(package private) String`

  `text`

  `(package private) ArrayList<AtomUIText.CharData>`

  `textData`

  `private int`

  `textHeight`

  `(package private) double`

  `textLeading`

  `(package private) double`

  `textTracking`

  `private int`

  `textWidth`

  ### Fields inherited from class [AtomUI](AtomUI.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorDown, anchorLeft, anchorRight, anchorTop, angle, colorA, colorB, colorG, colorR, cosA, downSide, enabled, height, leftSide, luaKeyPress, luaKeyRelease, luaKeyRepeat, luaMouseButtonDown, luaMouseButtonDownOutside, luaMouseButtonUp, luaMouseButtonUpOutside, luaMouseMove, luaMouseMoveOutside, luaMouseWheel, luaRenderUpdate, luaResize, luaUpdate, nodes, parentNode, pivotX, pivotY, rightSide, scaleX, scaleY, sinA, stencil, stencilLevel, stencilNode, table, topSide, uiname, visible, width, x, y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AtomUIText(se.krka.kahlua.vm.KahluaTable table)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `drawText()`

  `(package private) float`

  `getSdfThreshold()`

  `Double`

  `getTextHeight()`

  `Double`

  `getTextWidth()`

  `void`

  `init()`

  `(package private) void`

  `loadFromTable()`

  `void`

  `render()`

  `void`

  `setAutoWidth(Double width)`

  `void`

  `setFont(UIFont font)`

  `void`

  `setText(String text)`

  `(package private) UIFont`

  `tryGetFont(String key,
  UIFont defaultValue)`

  `(package private) void`

  `updateCharData(AngelCodeFont.CharDef def,
  double x,
  double y)`

  `(package private) void`

  `updateInternalValues()`

  ### Methods inherited from class [AtomUI](AtomUI.html#method-summary "class in zombie.ui")

  `addNode, bringToTop, clearStencilRect, getAbsolutePosition, getAngle, getColor, getHeight, getLocalPosition, getLuaAbsolutePosition, getLuaLocalPosition, getLuaParentPosition, getMaxDrawHeight, getNodes, getParent, getParentNode, getPivotX, getPivotY, getRenderThisPlayerOnly, getScaleX, getScaleY, getTable, getUIName, getWidth, getX, getY, isAlwaysOnTop, isBackMost, isCapture, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isModalVisible, isMouseOver, isOverElement, isOverElementLocal, isPointOver, isVisible, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onMouseButtonDownOutside, onMouseButtonUpOutside, onResize, removeNode, repaintStencilRect, setAlwaysOnTop, setAngle, setBackMost, setColor, setEnabled, setHeight, setHeightSilent, setParentNode, setPivotX, setPivotY, setScaleX, setScaleY, setStencilRect, setUIName, setVisible, setWidth, setWidthSilent, setX, setY, toLocalCoordinates, tryGetBoolean, tryGetClosure, tryGetDouble, tryGetString, update, updateSize`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fontToUse

    [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") fontToUse
  + ### text

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text
  + ### textTracking

    double textTracking
  + ### textLeading

    double textLeading
  + ### autoWidth

    int autoWidth
  + ### outlineThick

    float outlineThick
  + ### outlineColorR

    float outlineColorR
  + ### outlineColorG

    float outlineColorG
  + ### outlineColorB

    float outlineColorB
  + ### outlineColorA

    float outlineColorA
  + ### shadow

    boolean shadow
  + ### shadowValue

    float shadowValue
  + ### charNum

    private int charNum
  + ### textWidth

    private int textWidth
  + ### textHeight

    private int textHeight
  + ### realTextHeight

    private int realTextHeight
  + ### data

    private static char[] data
  + ### textData

    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AtomUIText.CharData](AtomUIText.CharData.html "class in zombie.ui")> textData
* Constructor Details
  -------------------

  + ### AtomUIText

    public AtomUIText(se.krka.kahlua.vm.KahluaTable table)
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
    double y)
  + ### updateInternalValues

    void updateInternalValues()

    Overrides:
    :   `updateInternalValues` in class `AtomUI`
  + ### setFont

    public void setFont([UIFont](UIFont.html "enum class in zombie.ui") font)
  + ### setText

    public void setText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### setAutoWidth

    public void setAutoWidth([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") width)
  + ### getTextHeight

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getTextHeight()
  + ### getTextWidth

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getTextWidth()
  + ### tryGetFont

    [UIFont](UIFont.html "enum class in zombie.ui") tryGetFont([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [UIFont](UIFont.html "enum class in zombie.ui") defaultValue)