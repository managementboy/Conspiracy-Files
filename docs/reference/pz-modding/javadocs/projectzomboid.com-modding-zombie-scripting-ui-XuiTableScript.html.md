[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.ui](package-summary.html)
2. [XuiTableScript](XuiTableScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [columns](#columns)
   2. [rows](#rows)
   3. [cells](#cells)
   4. [xuiCellStyle](#xuiCellStyle)
   5. [xuiRowStyle](#xuiRowStyle)
   6. [xuiColumnStyle](#xuiColumnStyle)
7. [Constructor Details](#constructor-detail)
   1. [XuiTableScript(String, boolean, XuiScriptType)](#%3Cinit%3E(java.lang.String,boolean,zombie.scripting.ui.XuiScriptType))
8. [Method Details](#method-detail)
   1. [getCellStyle()](#getCellStyle())
   2. [getRowStyle()](#getRowStyle())
   3. [getColumnStyle()](#getColumnStyle())
   4. [getColumnCount()](#getColumnCount())
   5. [getRowCount()](#getRowCount())
   6. [getColumn(int)](#getColumn(int))
   7. [getRow(int)](#getRow(int))
   8. [getCell(int, int)](#getCell(int,int))
   9. [readCellIndex(String, int)](#readCellIndex(java.lang.String,int))
   10. [countRowsOrColumns(ScriptParser.Block)](#countRowsOrColumns(zombie.scripting.ScriptParser.Block))
   11. [LoadColumnsRows(ScriptParser.Block, ArrayList)](#LoadColumnsRows(zombie.scripting.ScriptParser.Block,java.util.ArrayList))
   12. [getPostIndexKey(String)](#getPostIndexKey(java.lang.String))
   13. [getIndex(String)](#getIndex(java.lang.String))
   14. [Load(ScriptParser.Block)](#Load(zombie.scripting.ScriptParser.Block))
   15. [postLoad()](#postLoad())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiTableScript
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiScript](XuiScript.html "class in zombie.scripting.ui")

zombie.scripting.ui.XuiTableScript

---

public class XuiTableScript
extends [XuiScript](XuiScript.html "class in zombie.scripting.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `XuiTableScript.XuiTableCellScript`

  `static class`

  `XuiTableScript.XuiTableColumnScript`

  `static class`

  `XuiTableScript.XuiTableRowScript`

  ### Nested classes/interfaces inherited from class [XuiScript](XuiScript.html#nested-class-summary "class in zombie.scripting.ui")

  `XuiScript.XuiBoolean, XuiScript.XuiColor, XuiScript.XuiDouble, XuiScript.XuiFloat, XuiScript.XuiFontType, XuiScript.XuiFunction, XuiScript.XuiInteger, XuiScript.XuiSpacing, XuiScript.XuiString, XuiScript.XuiStringList, XuiScript.XuiTextAlign, XuiScript.XuiTexture, XuiScript.XuiTranslateString, XuiScript.XuiUnit, XuiScript.XuiVar<T,C>, XuiScript.XuiVector, XuiScript.XuiVectorPosAlign`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<XuiTableScript.XuiTableCellScript>`

  `cells`

  `private final ArrayList<XuiTableScript.XuiTableColumnScript>`

  `columns`

  `private final ArrayList<XuiTableScript.XuiTableRowScript>`

  `rows`

  `private final XuiScript.XuiString`

  `xuiCellStyle`

  `private final XuiScript.XuiString`

  `xuiColumnStyle`

  `private final XuiScript.XuiString`

  `xuiRowStyle`

  ### Fields inherited from class [XuiScript](XuiScript.html#field-summary "class in zombie.scripting.ui")

  `allowDropAlways, anchorBottom, anchorLeft, anchorRight, anchorTop, animationList, animationTime, backDropTexCol, background, backgroundColor, backgroundColorHl, backgroundColorHlInv, backgroundColorHlVal, backgroundColorMouseOver, backgroundEmpty, backgroundHover, borderColor, borderColorHl, borderColorHlInv, borderColorHlVal, borderInput, borderInvalid, borderLocked, borderOutput, borderValid, children, choicesColor, displayBackground, doBackDropTex, doBorderLocked, doHighlight, doInvalidHighlight, doToolTip, doValidHighlight, drawBackground, drawBorder, drawGrid, enableHeader, font, font2, font3, gridColor, height, hsbFactor, icon, iconHeight, iconVector, iconWidth, iconX, iconY, image, imageHeight, imageVector, imageWidth, imageX, imageY, margin, marginBottom, marginLeft, marginRight, marginTop, maximumHeight, maximumWidth, minimumHeight, minimumWidth, mouseEnabled, mouseOver, mouseOverText, moveWithMouse, name, padding, paddingBottom, paddingLeft, paddingRight, paddingTop, pin, posAlign, readAltKeys, resizable, scaledHeight, scaledWidth, scriptType, storeItem, textAlign, textColor, texture, textureBackground, textureColor, textureOverride, tickTexture, title, tooltip, toolTipTextItem, toolTipTextLocked, vars, varsMap, vector, width, x, xuiCustomDebug, xuiKey, xuiLayoutName, xuiLuaClass, xuiSkin, xuiStyle, xuiUuid, y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiTableScript(String xuiLayoutName,
  boolean readAltKeys,
  XuiScriptType type)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private int`

  `countRowsOrColumns(zombie.scripting.ScriptParser.Block block)`

  `XuiScript`

  `getCell(int column,
  int row)`

  `XuiScript.XuiString`

  `getCellStyle()`

  `XuiScript`

  `getColumn(int index)`

  `int`

  `getColumnCount()`

  `XuiScript.XuiString`

  `getColumnStyle()`

  `private int`

  `getIndex(String s)`

  `private String`

  `getPostIndexKey(String s)`

  `XuiScript`

  `getRow(int index)`

  `int`

  `getRowCount()`

  `XuiScript.XuiString`

  `getRowStyle()`

  `void`

  `Load(zombie.scripting.ScriptParser.Block block)`

  `<T extends XuiScript>  
  void`

  `LoadColumnsRows(zombie.scripting.ScriptParser.Block block,
  ArrayList<T> list)`

  `protected void`

  `postLoad()`

  `private int`

  `readCellIndex(String s,
  int columnCount)`

  ### Methods inherited from class [XuiScript](XuiScript.html#method-summary "class in zombie.scripting.ui")

  `addChild, addVar, CreateScriptForClass, errorWithInfo, getAllowDropAlways, getAnchorBottom, getAnchorLeft, getAnchorRight, getAnchorTop, getAnimationList, getAnimationTime, getBackDropTexCol, getBackground, getBackgroundColor, getBackgroundColorHL, getBackgroundColorHLInv, getBackgroundColorHLVal, getBackgroundColorMouseOver, getBackgroundEmpty, getBackgroundHover, getBorderColor, getBorderColorHL, getBorderColorHLInv, getBorderColorHLVal, getBorderInput, getBorderInvalid, getBorderLocked, getBorderOutput, getBorderValid, getChildren, getChoicesColor, getDefaultStyle, getDisplayBackground, getDoBackDropTex, getDoBorderLocked, getDoHighlight, getDoInvalidHighlight, getDoToolTip, getDoValidHighlight, getDrawBackground, getDrawBorder, getDrawGrid, getFont, getFont2, getFont3, getGridColor, getHsbFactor, getIcon, getIconVector, getMargin, getMinimumHeight, getMinimumWidth, getMouseEnabled, getMouseOverText, getMoveWithMouse, getName, getPadding, getPosAlign, getScriptType, getStoreItem, getStyle, getTextAlign, getTextColor, getTexture, getTextureBackground, getTextureColor, getTextureOverride, getTickTexture, getTitle, getTooltip, getToolTipTextItem, getToolTipTextLocked, getVar, getVars, getVector, getXuiCustomDebug, getXuiKey, getXuiLayoutName, getXuiLuaClass, getXuiStyle, getXuiUUID, isAnyStyle, isDefaultStyle, isLayout, isStyle, loadVar, loadVar, logWithInfo, ReadLuaClassValue, setDefaultStyle, setStyle, setXuiKey, setXuiLuaClass, setXuiStyle, toString, tryToSetDefaultStyle, warnWithInfo`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### columns

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiTableScript.XuiTableColumnScript](XuiTableScript.XuiTableColumnScript.html "class in zombie.scripting.ui")> columns
  + ### rows

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiTableScript.XuiTableRowScript](XuiTableScript.XuiTableRowScript.html "class in zombie.scripting.ui")> rows
  + ### cells

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiTableScript.XuiTableCellScript](XuiTableScript.XuiTableCellScript.html "class in zombie.scripting.ui")> cells
  + ### xuiCellStyle

    private final [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") xuiCellStyle
  + ### xuiRowStyle

    private final [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") xuiRowStyle
  + ### xuiColumnStyle

    private final [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") xuiColumnStyle
* Constructor Details
  -------------------

  + ### XuiTableScript

    public XuiTableScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLayoutName,
    boolean readAltKeys,
    [XuiScriptType](XuiScriptType.html "enum class in zombie.scripting.ui") type)
* Method Details
  --------------

  + ### getCellStyle

    public [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") getCellStyle()
  + ### getRowStyle

    public [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") getRowStyle()
  + ### getColumnStyle

    public [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") getColumnStyle()
  + ### getColumnCount

    public int getColumnCount()
  + ### getRowCount

    public int getRowCount()
  + ### getColumn

    public [XuiScript](XuiScript.html "class in zombie.scripting.ui") getColumn(int index)
  + ### getRow

    public [XuiScript](XuiScript.html "class in zombie.scripting.ui") getRow(int index)
  + ### getCell

    public [XuiScript](XuiScript.html "class in zombie.scripting.ui") getCell(int column,
    int row)
  + ### readCellIndex

    private int readCellIndex([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    int columnCount)
  + ### countRowsOrColumns

    private int countRowsOrColumns(zombie.scripting.ScriptParser.Block block)
  + ### LoadColumnsRows

    public <T extends [XuiScript](XuiScript.html "class in zombie.scripting.ui")> void LoadColumnsRows(zombie.scripting.ScriptParser.Block block,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<T> list)
  + ### getPostIndexKey

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPostIndexKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getIndex

    private int getIndex([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### Load

    public void Load(zombie.scripting.ScriptParser.Block block)

    Overrides:
    :   `Load` in class `XuiScript`
  + ### postLoad

    protected void postLoad()

    Overrides:
    :   `postLoad` in class `XuiScript`