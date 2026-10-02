[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.ui](package-summary.html)
2. [XuiScript](XuiScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [xui\_prefix](#xui_prefix)
   2. [varsMap](#varsMap)
   3. [vars](#vars)
   4. [children](#children)
   5. [xuiSkin](#xuiSkin)
   6. [readAltKeys](#readAltKeys)
   7. [scriptType](#scriptType)
   8. [xuiLayoutName](#xuiLayoutName)
   9. [defaultStyle](#defaultStyle)
   10. [style](#style)
   11. [xuiUuid](#xuiUuid)
   12. [xuiKey](#xuiKey)
   13. [xuiLuaClass](#xuiLuaClass)
   14. [xuiStyle](#xuiStyle)
   15. [xuiCustomDebug](#xuiCustomDebug)
   16. [x](#x)
   17. [y](#y)
   18. [width](#width)
   19. [height](#height)
   20. [vector](#vector)
   21. [posAlign](#posAlign)
   22. [minimumWidth](#minimumWidth)
   23. [minimumHeight](#minimumHeight)
   24. [maximumWidth](#maximumWidth)
   25. [maximumHeight](#maximumHeight)
   26. [paddingTop](#paddingTop)
   27. [paddingRight](#paddingRight)
   28. [paddingBottom](#paddingBottom)
   29. [paddingLeft](#paddingLeft)
   30. [padding](#padding)
   31. [marginTop](#marginTop)
   32. [marginRight](#marginRight)
   33. [marginBottom](#marginBottom)
   34. [marginLeft](#marginLeft)
   35. [margin](#margin)
   36. [title](#title)
   37. [name](#name)
   38. [font](#font)
   39. [font2](#font2)
   40. [font3](#font3)
   41. [icon](#icon)
   42. [iconX](#iconX)
   43. [iconY](#iconY)
   44. [iconWidth](#iconWidth)
   45. [iconHeight](#iconHeight)
   46. [iconVector](#iconVector)
   47. [image](#image)
   48. [imageX](#imageX)
   49. [imageY](#imageY)
   50. [imageWidth](#imageWidth)
   51. [imageHeight](#imageHeight)
   52. [imageVector](#imageVector)
   53. [anchorLeft](#anchorLeft)
   54. [anchorRight](#anchorRight)
   55. [anchorTop](#anchorTop)
   56. [anchorBottom](#anchorBottom)
   57. [animationList](#animationList)
   58. [animationTime](#animationTime)
   59. [textureBackground](#textureBackground)
   60. [texture](#texture)
   61. [textureOverride](#textureOverride)
   62. [tickTexture](#tickTexture)
   63. [textColor](#textColor)
   64. [backgroundColor](#backgroundColor)
   65. [backgroundColorMouseOver](#backgroundColorMouseOver)
   66. [borderColor](#borderColor)
   67. [textureColor](#textureColor)
   68. [choicesColor](#choicesColor)
   69. [gridColor](#gridColor)
   70. [displayBackground](#displayBackground)
   71. [background](#background)
   72. [drawGrid](#drawGrid)
   73. [drawBackground](#drawBackground)
   74. [drawBorder](#drawBorder)
   75. [tooltip](#tooltip)
   76. [hsbFactor](#hsbFactor)
   77. [moveWithMouse](#moveWithMouse)
   78. [mouseOver](#mouseOver)
   79. [mouseOverText](#mouseOverText)
   80. [textAlign](#textAlign)
   81. [doHighlight](#doHighlight)
   82. [backgroundColorHl](#backgroundColorHl)
   83. [borderColorHl](#borderColorHl)
   84. [doValidHighlight](#doValidHighlight)
   85. [backgroundColorHlVal](#backgroundColorHlVal)
   86. [borderColorHlVal](#borderColorHlVal)
   87. [doInvalidHighlight](#doInvalidHighlight)
   88. [backgroundColorHlInv](#backgroundColorHlInv)
   89. [borderColorHlInv](#borderColorHlInv)
   90. [storeItem](#storeItem)
   91. [doBackDropTex](#doBackDropTex)
   92. [backDropTexCol](#backDropTexCol)
   93. [doToolTip](#doToolTip)
   94. [mouseEnabled](#mouseEnabled)
   95. [allowDropAlways](#allowDropAlways)
   96. [toolTipTextItem](#toolTipTextItem)
   97. [toolTipTextLocked](#toolTipTextLocked)
   98. [backgroundEmpty](#backgroundEmpty)
   99. [backgroundHover](#backgroundHover)
   100. [borderInput](#borderInput)
   101. [borderOutput](#borderOutput)
   102. [borderValid](#borderValid)
   103. [borderInvalid](#borderInvalid)
   104. [borderLocked](#borderLocked)
   105. [doBorderLocked](#doBorderLocked)
   106. [pin](#pin)
   107. [resizable](#resizable)
   108. [enableHeader](#enableHeader)
   109. [scaledWidth](#scaledWidth)
   110. [scaledHeight](#scaledHeight)
7. [Constructor Details](#constructor-detail)
   1. [XuiScript(String, boolean, String)](#%3Cinit%3E(java.lang.String,boolean,java.lang.String))
   2. [XuiScript(String, boolean, String, XuiScriptType)](#%3Cinit%3E(java.lang.String,boolean,java.lang.String,zombie.scripting.ui.XuiScriptType))
8. [Method Details](#method-detail)
   1. [getXuiUUID()](#getXuiUUID())
   2. [getXuiKey()](#getXuiKey())
   3. [setXuiKey(String)](#setXuiKey(java.lang.String))
   4. [getXuiLuaClass()](#getXuiLuaClass())
   5. [setXuiLuaClass(String)](#setXuiLuaClass(java.lang.String))
   6. [getXuiStyle()](#getXuiStyle())
   7. [setXuiStyle(String)](#setXuiStyle(java.lang.String))
   8. [getXuiCustomDebug()](#getXuiCustomDebug())
   9. [getVector()](#getVector())
   10. [getPadding()](#getPadding())
   11. [getMargin()](#getMargin())
   12. [getPosAlign()](#getPosAlign())
   13. [getMinimumWidth()](#getMinimumWidth())
   14. [getMinimumHeight()](#getMinimumHeight())
   15. [getTitle()](#getTitle())
   16. [getName()](#getName())
   17. [getFont()](#getFont())
   18. [getFont2()](#getFont2())
   19. [getFont3()](#getFont3())
   20. [getIcon()](#getIcon())
   21. [getIconVector()](#getIconVector())
   22. [getAnchorLeft()](#getAnchorLeft())
   23. [getAnchorRight()](#getAnchorRight())
   24. [getAnchorTop()](#getAnchorTop())
   25. [getAnchorBottom()](#getAnchorBottom())
   26. [getAnimationList()](#getAnimationList())
   27. [getAnimationTime()](#getAnimationTime())
   28. [getTextureBackground()](#getTextureBackground())
   29. [getTexture()](#getTexture())
   30. [getTextureOverride()](#getTextureOverride())
   31. [getTickTexture()](#getTickTexture())
   32. [getTextColor()](#getTextColor())
   33. [getBackgroundColor()](#getBackgroundColor())
   34. [getBackgroundColorMouseOver()](#getBackgroundColorMouseOver())
   35. [getBorderColor()](#getBorderColor())
   36. [getTextureColor()](#getTextureColor())
   37. [getChoicesColor()](#getChoicesColor())
   38. [getGridColor()](#getGridColor())
   39. [getDisplayBackground()](#getDisplayBackground())
   40. [getBackground()](#getBackground())
   41. [getDrawGrid()](#getDrawGrid())
   42. [getDrawBackground()](#getDrawBackground())
   43. [getDrawBorder()](#getDrawBorder())
   44. [getTooltip()](#getTooltip())
   45. [getMouseOverText()](#getMouseOverText())
   46. [getHsbFactor()](#getHsbFactor())
   47. [getMoveWithMouse()](#getMoveWithMouse())
   48. [getTextAlign()](#getTextAlign())
   49. [getDoHighlight()](#getDoHighlight())
   50. [getBackgroundColorHL()](#getBackgroundColorHL())
   51. [getBorderColorHL()](#getBorderColorHL())
   52. [getDoValidHighlight()](#getDoValidHighlight())
   53. [getBackgroundColorHLVal()](#getBackgroundColorHLVal())
   54. [getBorderColorHLVal()](#getBorderColorHLVal())
   55. [getDoInvalidHighlight()](#getDoInvalidHighlight())
   56. [getBackgroundColorHLInv()](#getBackgroundColorHLInv())
   57. [getBorderColorHLInv()](#getBorderColorHLInv())
   58. [getStoreItem()](#getStoreItem())
   59. [getDoBackDropTex()](#getDoBackDropTex())
   60. [getBackDropTexCol()](#getBackDropTexCol())
   61. [getDoToolTip()](#getDoToolTip())
   62. [getMouseEnabled()](#getMouseEnabled())
   63. [getAllowDropAlways()](#getAllowDropAlways())
   64. [getToolTipTextItem()](#getToolTipTextItem())
   65. [getToolTipTextLocked()](#getToolTipTextLocked())
   66. [getBackgroundEmpty()](#getBackgroundEmpty())
   67. [getBackgroundHover()](#getBackgroundHover())
   68. [getBorderInput()](#getBorderInput())
   69. [getBorderOutput()](#getBorderOutput())
   70. [getBorderValid()](#getBorderValid())
   71. [getBorderInvalid()](#getBorderInvalid())
   72. [getBorderLocked()](#getBorderLocked())
   73. [getDoBorderLocked()](#getDoBorderLocked())
   74. [getXuiLayoutName()](#getXuiLayoutName())
   75. [toString()](#toString())
   76. [logWithInfo(String)](#logWithInfo(java.lang.String))
   77. [warnWithInfo(String)](#warnWithInfo(java.lang.String))
   78. [errorWithInfo(String)](#errorWithInfo(java.lang.String))
   79. [logInfo()](#logInfo())
   80. [getStyle()](#getStyle())
   81. [setStyle(XuiScript)](#setStyle(zombie.scripting.ui.XuiScript))
   82. [getDefaultStyle()](#getDefaultStyle())
   83. [setDefaultStyle(XuiScript)](#setDefaultStyle(zombie.scripting.ui.XuiScript))
   84. [isLayout()](#isLayout())
   85. [isAnyStyle()](#isAnyStyle())
   86. [isStyle()](#isStyle())
   87. [isDefaultStyle()](#isDefaultStyle())
   88. [getScriptType()](#getScriptType())
   89. [addVar(T)](#addVar(T))
   90. [getVar(String)](#getVar(java.lang.String))
   91. [getVars()](#getVars())
   92. [addChild(XuiScript)](#addChild(zombie.scripting.ui.XuiScript))
   93. [getChildren()](#getChildren())
   94. [ReadLuaClassValue(ScriptParser.Block)](#ReadLuaClassValue(zombie.scripting.ScriptParser.Block))
   95. [CreateScriptForClass(String, String, boolean, XuiScriptType)](#CreateScriptForClass(java.lang.String,java.lang.String,boolean,zombie.scripting.ui.XuiScriptType))
   96. [Load(ScriptParser.Block)](#Load(zombie.scripting.ScriptParser.Block))
   97. [loadVar(String, String)](#loadVar(java.lang.String,java.lang.String))
   98. [loadVar(String, String, boolean)](#loadVar(java.lang.String,java.lang.String,boolean))
   99. [tryToSetDefaultStyle()](#tryToSetDefaultStyle())
   100. [postLoad()](#postLoad())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiScript
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ui.XuiScript

Direct Known Subclasses:
:   `XuiReference, XuiTableScript, XuiTableScript.XuiTableCellScript, XuiTableScript.XuiTableColumnScript, XuiTableScript.XuiTableRowScript`

---

public class XuiScript
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `XuiScript.XuiBoolean`

  `static class`

  `XuiScript.XuiColor`

  `static class`

  `XuiScript.XuiDouble`

  `static class`

  `XuiScript.XuiFloat`

  `static class`

  `XuiScript.XuiFontType`

  `static class`

  `XuiScript.XuiFunction`

  `static class`

  `XuiScript.XuiInteger`

  `static class`

  `XuiScript.XuiSpacing`

  `static class`

  `XuiScript.XuiString`

  `static class`

  `XuiScript.XuiStringList`

  `static class`

  `XuiScript.XuiTextAlign`

  `static class`

  `XuiScript.XuiTexture`

  `static class`

  `XuiScript.XuiTranslateString`

  `static class`

  `XuiScript.XuiUnit`

  `static class`

  `XuiScript.XuiVar<T, C extends XuiScript.XuiVar<?,?>>`

  `static class`

  `XuiScript.XuiVector`

  `static class`

  `XuiScript.XuiVectorPosAlign`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final XuiScript.XuiBoolean`

  `allowDropAlways`

  `final XuiScript.XuiBoolean`

  `anchorBottom`

  `final XuiScript.XuiBoolean`

  `anchorLeft`

  `final XuiScript.XuiBoolean`

  `anchorRight`

  `final XuiScript.XuiBoolean`

  `anchorTop`

  `final XuiScript.XuiStringList`

  `animationList`

  `final XuiScript.XuiFloat`

  `animationTime`

  `final XuiScript.XuiColor`

  `backDropTexCol`

  `final XuiScript.XuiBoolean`

  `background`

  `final XuiScript.XuiColor`

  `backgroundColor`

  `final XuiScript.XuiColor`

  `backgroundColorHl`

  `final XuiScript.XuiColor`

  `backgroundColorHlInv`

  `final XuiScript.XuiColor`

  `backgroundColorHlVal`

  `final XuiScript.XuiColor`

  `backgroundColorMouseOver`

  `final XuiScript.XuiColor`

  `backgroundEmpty`

  `final XuiScript.XuiColor`

  `backgroundHover`

  `final XuiScript.XuiColor`

  `borderColor`

  `final XuiScript.XuiColor`

  `borderColorHl`

  `final XuiScript.XuiColor`

  `borderColorHlInv`

  `final XuiScript.XuiColor`

  `borderColorHlVal`

  `final XuiScript.XuiColor`

  `borderInput`

  `final XuiScript.XuiColor`

  `borderInvalid`

  `final XuiScript.XuiColor`

  `borderLocked`

  `final XuiScript.XuiColor`

  `borderOutput`

  `final XuiScript.XuiColor`

  `borderValid`

  `protected final ArrayList<XuiScript>`

  `children`

  `final XuiScript.XuiColor`

  `choicesColor`

  `private XuiScript`

  `defaultStyle`

  `final XuiScript.XuiBoolean`

  `displayBackground`

  `final XuiScript.XuiBoolean`

  `doBackDropTex`

  `final XuiScript.XuiBoolean`

  `doBorderLocked`

  `final XuiScript.XuiBoolean`

  `doHighlight`

  `final XuiScript.XuiBoolean`

  `doInvalidHighlight`

  `final XuiScript.XuiBoolean`

  `doToolTip`

  `final XuiScript.XuiBoolean`

  `doValidHighlight`

  `final XuiScript.XuiBoolean`

  `drawBackground`

  `final XuiScript.XuiBoolean`

  `drawBorder`

  `final XuiScript.XuiBoolean`

  `drawGrid`

  `final XuiScript.XuiBoolean`

  `enableHeader`

  `final XuiScript.XuiFontType`

  `font`

  `final XuiScript.XuiFontType`

  `font2`

  `final XuiScript.XuiFontType`

  `font3`

  `final XuiScript.XuiColor`

  `gridColor`

  `final XuiScript.XuiUnit`

  `height`

  `final XuiScript.XuiColor`

  `hsbFactor`

  `final XuiScript.XuiTexture`

  `icon`

  `final XuiScript.XuiUnit`

  `iconHeight`

  `final XuiScript.XuiVector`

  `iconVector`

  `final XuiScript.XuiUnit`

  `iconWidth`

  `final XuiScript.XuiUnit`

  `iconX`

  `final XuiScript.XuiUnit`

  `iconY`

  `final XuiScript.XuiTexture`

  `image`

  `final XuiScript.XuiUnit`

  `imageHeight`

  `final XuiScript.XuiVector`

  `imageVector`

  `final XuiScript.XuiUnit`

  `imageWidth`

  `final XuiScript.XuiUnit`

  `imageX`

  `final XuiScript.XuiUnit`

  `imageY`

  `final XuiScript.XuiSpacing`

  `margin`

  `final XuiScript.XuiUnit`

  `marginBottom`

  `final XuiScript.XuiUnit`

  `marginLeft`

  `final XuiScript.XuiUnit`

  `marginRight`

  `final XuiScript.XuiUnit`

  `marginTop`

  `final XuiScript.XuiFloat`

  `maximumHeight`

  `final XuiScript.XuiFloat`

  `maximumWidth`

  `final XuiScript.XuiFloat`

  `minimumHeight`

  `final XuiScript.XuiFloat`

  `minimumWidth`

  `final XuiScript.XuiBoolean`

  `mouseEnabled`

  `final XuiScript.XuiBoolean`

  `mouseOver`

  `final XuiScript.XuiTranslateString`

  `mouseOverText`

  `final XuiScript.XuiBoolean`

  `moveWithMouse`

  `final XuiScript.XuiTranslateString`

  `name`

  `final XuiScript.XuiSpacing`

  `padding`

  `final XuiScript.XuiUnit`

  `paddingBottom`

  `final XuiScript.XuiUnit`

  `paddingLeft`

  `final XuiScript.XuiUnit`

  `paddingRight`

  `final XuiScript.XuiUnit`

  `paddingTop`

  `final XuiScript.XuiBoolean`

  `pin`

  `final XuiScript.XuiVectorPosAlign`

  `posAlign`

  `protected final boolean`

  `readAltKeys`

  `final XuiScript.XuiBoolean`

  `resizable`

  `final XuiScript.XuiFloat`

  `scaledHeight`

  `final XuiScript.XuiFloat`

  `scaledWidth`

  `protected final XuiScriptType`

  `scriptType`

  `final XuiScript.XuiBoolean`

  `storeItem`

  `private XuiScript`

  `style`

  `final XuiScript.XuiTextAlign`

  `textAlign`

  `final XuiScript.XuiColor`

  `textColor`

  `final XuiScript.XuiTexture`

  `texture`

  `final XuiScript.XuiTexture`

  `textureBackground`

  `final XuiScript.XuiColor`

  `textureColor`

  `final XuiScript.XuiTexture`

  `textureOverride`

  `final XuiScript.XuiTexture`

  `tickTexture`

  `final XuiScript.XuiTranslateString`

  `title`

  `final XuiScript.XuiTranslateString`

  `tooltip`

  `final XuiScript.XuiTranslateString`

  `toolTipTextItem`

  `final XuiScript.XuiTranslateString`

  `toolTipTextLocked`

  `protected ArrayList<XuiScript.XuiVar<?,?>>`

  `vars`

  `protected HashMap<String, XuiScript.XuiVar<?,?>>`

  `varsMap`

  `final XuiScript.XuiVector`

  `vector`

  `final XuiScript.XuiUnit`

  `width`

  `final XuiScript.XuiUnit`

  `x`

  `private static final String`

  `xui_prefix`

  `final XuiScript.XuiString`

  `xuiCustomDebug`

  `final XuiScript.XuiString`

  `xuiKey`

  `protected final String`

  `xuiLayoutName`

  `final XuiScript.XuiString`

  `xuiLuaClass`

  `protected XuiSkin`

  `xuiSkin`

  `final XuiScript.XuiString`

  `xuiStyle`

  `final String`

  `xuiUuid`

  `final XuiScript.XuiUnit`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiScript(String xuiLayoutName,
  boolean readAltKeys,
  String xuiLuaClass)`

  XuiScript can be integrated with other scripts or used as standalone script
  to provide scripted uielement info.

  `XuiScript(String xuiLayoutName,
  boolean readAltKeys,
  String xuiLuaClass,
  XuiScriptType type)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addChild(XuiScript child)`

  `protected <T extends XuiScript.XuiVar<?,?>>  
  T`

  `addVar(T var)`

  `static XuiScript`

  `CreateScriptForClass(String xuiLayoutName,
  String luaClass,
  boolean readAltKeys,
  XuiScriptType scriptType)`

  `protected void`

  `errorWithInfo(String s)`

  `XuiScript.XuiBoolean`

  `getAllowDropAlways()`

  `XuiScript.XuiBoolean`

  `getAnchorBottom()`

  `XuiScript.XuiBoolean`

  `getAnchorLeft()`

  `XuiScript.XuiBoolean`

  `getAnchorRight()`

  `XuiScript.XuiBoolean`

  `getAnchorTop()`

  `XuiScript.XuiStringList`

  `getAnimationList()`

  `XuiScript.XuiFloat`

  `getAnimationTime()`

  `XuiScript.XuiColor`

  `getBackDropTexCol()`

  `XuiScript.XuiBoolean`

  `getBackground()`

  `XuiScript.XuiColor`

  `getBackgroundColor()`

  `XuiScript.XuiColor`

  `getBackgroundColorHL()`

  `XuiScript.XuiColor`

  `getBackgroundColorHLInv()`

  `XuiScript.XuiColor`

  `getBackgroundColorHLVal()`

  `XuiScript.XuiColor`

  `getBackgroundColorMouseOver()`

  `XuiScript.XuiColor`

  `getBackgroundEmpty()`

  `XuiScript.XuiColor`

  `getBackgroundHover()`

  `XuiScript.XuiColor`

  `getBorderColor()`

  `XuiScript.XuiColor`

  `getBorderColorHL()`

  `XuiScript.XuiColor`

  `getBorderColorHLInv()`

  `XuiScript.XuiColor`

  `getBorderColorHLVal()`

  `XuiScript.XuiColor`

  `getBorderInput()`

  `XuiScript.XuiColor`

  `getBorderInvalid()`

  `XuiScript.XuiColor`

  `getBorderLocked()`

  `XuiScript.XuiColor`

  `getBorderOutput()`

  `XuiScript.XuiColor`

  `getBorderValid()`

  `ArrayList<XuiScript>`

  `getChildren()`

  `XuiScript.XuiColor`

  `getChoicesColor()`

  `XuiScript`

  `getDefaultStyle()`

  `XuiScript.XuiBoolean`

  `getDisplayBackground()`

  `XuiScript.XuiBoolean`

  `getDoBackDropTex()`

  `XuiScript.XuiBoolean`

  `getDoBorderLocked()`

  `XuiScript.XuiBoolean`

  `getDoHighlight()`

  `XuiScript.XuiBoolean`

  `getDoInvalidHighlight()`

  `XuiScript.XuiBoolean`

  `getDoToolTip()`

  `XuiScript.XuiBoolean`

  `getDoValidHighlight()`

  `XuiScript.XuiBoolean`

  `getDrawBackground()`

  `XuiScript.XuiBoolean`

  `getDrawBorder()`

  `XuiScript.XuiBoolean`

  `getDrawGrid()`

  `XuiScript.XuiFontType`

  `getFont()`

  `XuiScript.XuiFontType`

  `getFont2()`

  `XuiScript.XuiFontType`

  `getFont3()`

  `XuiScript.XuiColor`

  `getGridColor()`

  `XuiScript.XuiColor`

  `getHsbFactor()`

  `XuiScript.XuiTexture`

  `getIcon()`

  `XuiScript.XuiVector`

  `getIconVector()`

  `XuiScript.XuiSpacing`

  `getMargin()`

  `XuiScript.XuiFloat`

  `getMinimumHeight()`

  `XuiScript.XuiFloat`

  `getMinimumWidth()`

  `XuiScript.XuiBoolean`

  `getMouseEnabled()`

  `XuiScript.XuiTranslateString`

  `getMouseOverText()`

  `XuiScript.XuiBoolean`

  `getMoveWithMouse()`

  `XuiScript.XuiTranslateString`

  `getName()`

  `XuiScript.XuiSpacing`

  `getPadding()`

  `XuiScript.XuiVectorPosAlign`

  `getPosAlign()`

  `XuiScriptType`

  `getScriptType()`

  `XuiScript.XuiBoolean`

  `getStoreItem()`

  `XuiScript`

  `getStyle()`

  `XuiScript.XuiTextAlign`

  `getTextAlign()`

  `XuiScript.XuiColor`

  `getTextColor()`

  `XuiScript.XuiTexture`

  `getTexture()`

  `XuiScript.XuiTexture`

  `getTextureBackground()`

  `XuiScript.XuiColor`

  `getTextureColor()`

  `XuiScript.XuiTexture`

  `getTextureOverride()`

  `XuiScript.XuiTexture`

  `getTickTexture()`

  `XuiScript.XuiTranslateString`

  `getTitle()`

  `XuiScript.XuiTranslateString`

  `getTooltip()`

  `XuiScript.XuiTranslateString`

  `getToolTipTextItem()`

  `XuiScript.XuiTranslateString`

  `getToolTipTextLocked()`

  `XuiScript.XuiVar<?,?>`

  `getVar(String key)`

  `ArrayList<XuiScript.XuiVar<?,?>>`

  `getVars()`

  `XuiScript.XuiVector`

  `getVector()`

  `String`

  `getXuiCustomDebug()`

  `String`

  `getXuiKey()`

  `String`

  `getXuiLayoutName()`

  `String`

  `getXuiLuaClass()`

  `String`

  `getXuiStyle()`

  `String`

  `getXuiUUID()`

  `boolean`

  `isAnyStyle()`

  `boolean`

  `isDefaultStyle()`

  `boolean`

  `isLayout()`

  `boolean`

  `isStyle()`

  `void`

  `Load(zombie.scripting.ScriptParser.Block block)`

  `boolean`

  `loadVar(String key,
  String val)`

  `boolean`

  `loadVar(String key,
  String val,
  boolean allowNull)`

  `private void`

  `logInfo()`

  `protected void`

  `logWithInfo(String s)`

  `protected void`

  `postLoad()`

  `static String`

  `ReadLuaClassValue(zombie.scripting.ScriptParser.Block block)`

  `void`

  `setDefaultStyle(XuiScript defaultStyle)`

  `void`

  `setStyle(XuiScript style)`

  `XuiScript`

  `setXuiKey(String xuiKey)`

  `XuiScript`

  `setXuiLuaClass(String xuiLuaClass)`

  `XuiScript`

  `setXuiStyle(String xuiStyle)`

  `String`

  `toString()`

  `protected void`

  `tryToSetDefaultStyle()`

  `protected void`

  `warnWithInfo(String s)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### xui\_prefix

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xui\_prefix

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.ui.XuiScript.xui_prefix)
  + ### varsMap

    protected [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<?,?>> varsMap
  + ### vars

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<?,?>> vars
  + ### children

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> children
  + ### xuiSkin

    protected [XuiSkin](XuiSkin.html "class in zombie.scripting.ui") xuiSkin
  + ### readAltKeys

    protected final boolean readAltKeys
  + ### scriptType

    protected final [XuiScriptType](XuiScriptType.html "enum class in zombie.scripting.ui") scriptType
  + ### xuiLayoutName

    protected final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLayoutName
  + ### defaultStyle

    private [XuiScript](XuiScript.html "class in zombie.scripting.ui") defaultStyle
  + ### style

    private [XuiScript](XuiScript.html "class in zombie.scripting.ui") style
  + ### xuiUuid

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiUuid
  + ### xuiKey

    public final [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") xuiKey
  + ### xuiLuaClass

    public final [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") xuiLuaClass
  + ### xuiStyle

    public final [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") xuiStyle
  + ### xuiCustomDebug

    public final [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") xuiCustomDebug
  + ### x

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") x
  + ### y

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") y
  + ### width

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") width
  + ### height

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") height
  + ### vector

    public final [XuiScript.XuiVector](XuiScript.XuiVector.html "class in zombie.scripting.ui") vector
  + ### posAlign

    public final [XuiScript.XuiVectorPosAlign](XuiScript.XuiVectorPosAlign.html "class in zombie.scripting.ui") posAlign
  + ### minimumWidth

    public final [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") minimumWidth
  + ### minimumHeight

    public final [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") minimumHeight
  + ### maximumWidth

    public final [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") maximumWidth
  + ### maximumHeight

    public final [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") maximumHeight
  + ### paddingTop

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") paddingTop
  + ### paddingRight

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") paddingRight
  + ### paddingBottom

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") paddingBottom
  + ### paddingLeft

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") paddingLeft
  + ### padding

    public final [XuiScript.XuiSpacing](XuiScript.XuiSpacing.html "class in zombie.scripting.ui") padding
  + ### marginTop

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") marginTop
  + ### marginRight

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") marginRight
  + ### marginBottom

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") marginBottom
  + ### marginLeft

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") marginLeft
  + ### margin

    public final [XuiScript.XuiSpacing](XuiScript.XuiSpacing.html "class in zombie.scripting.ui") margin
  + ### title

    public final [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") title
  + ### name

    public final [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") name
  + ### font

    public final [XuiScript.XuiFontType](XuiScript.XuiFontType.html "class in zombie.scripting.ui") font
  + ### font2

    public final [XuiScript.XuiFontType](XuiScript.XuiFontType.html "class in zombie.scripting.ui") font2
  + ### font3

    public final [XuiScript.XuiFontType](XuiScript.XuiFontType.html "class in zombie.scripting.ui") font3
  + ### icon

    public final [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") icon
  + ### iconX

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") iconX
  + ### iconY

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") iconY
  + ### iconWidth

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") iconWidth
  + ### iconHeight

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") iconHeight
  + ### iconVector

    public final [XuiScript.XuiVector](XuiScript.XuiVector.html "class in zombie.scripting.ui") iconVector
  + ### image

    public final [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") image
  + ### imageX

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") imageX
  + ### imageY

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") imageY
  + ### imageWidth

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") imageWidth
  + ### imageHeight

    public final [XuiScript.XuiUnit](XuiScript.XuiUnit.html "class in zombie.scripting.ui") imageHeight
  + ### imageVector

    public final [XuiScript.XuiVector](XuiScript.XuiVector.html "class in zombie.scripting.ui") imageVector
  + ### anchorLeft

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") anchorLeft
  + ### anchorRight

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") anchorRight
  + ### anchorTop

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") anchorTop
  + ### anchorBottom

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") anchorBottom
  + ### animationList

    public final [XuiScript.XuiStringList](XuiScript.XuiStringList.html "class in zombie.scripting.ui") animationList
  + ### animationTime

    public final [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") animationTime
  + ### textureBackground

    public final [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") textureBackground
  + ### texture

    public final [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") texture
  + ### textureOverride

    public final [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") textureOverride
  + ### tickTexture

    public final [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") tickTexture
  + ### textColor

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") textColor
  + ### backgroundColor

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") backgroundColor
  + ### backgroundColorMouseOver

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") backgroundColorMouseOver
  + ### borderColor

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") borderColor
  + ### textureColor

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") textureColor
  + ### choicesColor

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") choicesColor
  + ### gridColor

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") gridColor
  + ### displayBackground

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") displayBackground
  + ### background

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") background
  + ### drawGrid

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") drawGrid
  + ### drawBackground

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") drawBackground
  + ### drawBorder

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") drawBorder
  + ### tooltip

    public final [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") tooltip
  + ### hsbFactor

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") hsbFactor
  + ### moveWithMouse

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") moveWithMouse
  + ### mouseOver

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") mouseOver
  + ### mouseOverText

    public final [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") mouseOverText
  + ### textAlign

    public final [XuiScript.XuiTextAlign](XuiScript.XuiTextAlign.html "class in zombie.scripting.ui") textAlign
  + ### doHighlight

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") doHighlight
  + ### backgroundColorHl

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") backgroundColorHl
  + ### borderColorHl

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") borderColorHl
  + ### doValidHighlight

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") doValidHighlight
  + ### backgroundColorHlVal

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") backgroundColorHlVal
  + ### borderColorHlVal

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") borderColorHlVal
  + ### doInvalidHighlight

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") doInvalidHighlight
  + ### backgroundColorHlInv

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") backgroundColorHlInv
  + ### borderColorHlInv

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") borderColorHlInv
  + ### storeItem

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") storeItem
  + ### doBackDropTex

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") doBackDropTex
  + ### backDropTexCol

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") backDropTexCol
  + ### doToolTip

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") doToolTip
  + ### mouseEnabled

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") mouseEnabled
  + ### allowDropAlways

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") allowDropAlways
  + ### toolTipTextItem

    public final [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") toolTipTextItem
  + ### toolTipTextLocked

    public final [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") toolTipTextLocked
  + ### backgroundEmpty

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") backgroundEmpty
  + ### backgroundHover

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") backgroundHover
  + ### borderInput

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") borderInput
  + ### borderOutput

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") borderOutput
  + ### borderValid

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") borderValid
  + ### borderInvalid

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") borderInvalid
  + ### borderLocked

    public final [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") borderLocked
  + ### doBorderLocked

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") doBorderLocked
  + ### pin

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") pin
  + ### resizable

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") resizable
  + ### enableHeader

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") enableHeader
  + ### scaledWidth

    public final [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") scaledWidth
  + ### scaledHeight

    public final [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") scaledHeight
* Constructor Details
  -------------------

  + ### XuiScript

    public XuiScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLayoutName,
    boolean readAltKeys,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLuaClass)

    XuiScript can be integrated with other scripts or used as standalone script
    to provide scripted uielement info.
    The XuiScripts can be passed to XuiBuilder.lua to automatically build
    elements or a hierarchy of elements.
    Or used with a custom code handling them somewhere.
    When using the XuiBuilder to automatically build UI elements from the script
    a valid luaClass must be set such as 'ISButton'.
    Optionally also set the 'key'.
    When auto building, children elements are stored in their parent elements if they a key is defined
    in a special table "\_\_xui".
    See XuiVar below.
  + ### XuiScript

    public XuiScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLayoutName,
    boolean readAltKeys,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLuaClass,
    [XuiScriptType](XuiScriptType.html "enum class in zombie.scripting.ui") type)
* Method Details
  --------------

  + ### getXuiUUID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiUUID()
  + ### getXuiKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiKey()
  + ### setXuiKey

    public [XuiScript](XuiScript.html "class in zombie.scripting.ui") setXuiKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiKey)
  + ### getXuiLuaClass

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiLuaClass()
  + ### setXuiLuaClass

    public [XuiScript](XuiScript.html "class in zombie.scripting.ui") setXuiLuaClass([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLuaClass)
  + ### getXuiStyle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiStyle()
  + ### setXuiStyle

    public [XuiScript](XuiScript.html "class in zombie.scripting.ui") setXuiStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiStyle)
  + ### getXuiCustomDebug

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiCustomDebug()
  + ### getVector

    public [XuiScript.XuiVector](XuiScript.XuiVector.html "class in zombie.scripting.ui") getVector()
  + ### getPadding

    public [XuiScript.XuiSpacing](XuiScript.XuiSpacing.html "class in zombie.scripting.ui") getPadding()
  + ### getMargin

    public [XuiScript.XuiSpacing](XuiScript.XuiSpacing.html "class in zombie.scripting.ui") getMargin()
  + ### getPosAlign

    public [XuiScript.XuiVectorPosAlign](XuiScript.XuiVectorPosAlign.html "class in zombie.scripting.ui") getPosAlign()
  + ### getMinimumWidth

    public [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") getMinimumWidth()
  + ### getMinimumHeight

    public [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") getMinimumHeight()
  + ### getTitle

    public [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") getTitle()
  + ### getName

    public [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") getName()
  + ### getFont

    public [XuiScript.XuiFontType](XuiScript.XuiFontType.html "class in zombie.scripting.ui") getFont()
  + ### getFont2

    public [XuiScript.XuiFontType](XuiScript.XuiFontType.html "class in zombie.scripting.ui") getFont2()
  + ### getFont3

    public [XuiScript.XuiFontType](XuiScript.XuiFontType.html "class in zombie.scripting.ui") getFont3()
  + ### getIcon

    public [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") getIcon()
  + ### getIconVector

    public [XuiScript.XuiVector](XuiScript.XuiVector.html "class in zombie.scripting.ui") getIconVector()
  + ### getAnchorLeft

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getAnchorLeft()
  + ### getAnchorRight

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getAnchorRight()
  + ### getAnchorTop

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getAnchorTop()
  + ### getAnchorBottom

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getAnchorBottom()
  + ### getAnimationList

    public [XuiScript.XuiStringList](XuiScript.XuiStringList.html "class in zombie.scripting.ui") getAnimationList()
  + ### getAnimationTime

    public [XuiScript.XuiFloat](XuiScript.XuiFloat.html "class in zombie.scripting.ui") getAnimationTime()
  + ### getTextureBackground

    public [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") getTextureBackground()
  + ### getTexture

    public [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") getTexture()
  + ### getTextureOverride

    public [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") getTextureOverride()
  + ### getTickTexture

    public [XuiScript.XuiTexture](XuiScript.XuiTexture.html "class in zombie.scripting.ui") getTickTexture()
  + ### getTextColor

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getTextColor()
  + ### getBackgroundColor

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBackgroundColor()
  + ### getBackgroundColorMouseOver

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBackgroundColorMouseOver()
  + ### getBorderColor

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBorderColor()
  + ### getTextureColor

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getTextureColor()
  + ### getChoicesColor

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getChoicesColor()
  + ### getGridColor

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getGridColor()
  + ### getDisplayBackground

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDisplayBackground()
  + ### getBackground

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getBackground()
  + ### getDrawGrid

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDrawGrid()
  + ### getDrawBackground

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDrawBackground()
  + ### getDrawBorder

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDrawBorder()
  + ### getTooltip

    public [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") getTooltip()
  + ### getMouseOverText

    public [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") getMouseOverText()
  + ### getHsbFactor

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getHsbFactor()
  + ### getMoveWithMouse

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getMoveWithMouse()
  + ### getTextAlign

    public [XuiScript.XuiTextAlign](XuiScript.XuiTextAlign.html "class in zombie.scripting.ui") getTextAlign()
  + ### getDoHighlight

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDoHighlight()
  + ### getBackgroundColorHL

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBackgroundColorHL()
  + ### getBorderColorHL

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBorderColorHL()
  + ### getDoValidHighlight

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDoValidHighlight()
  + ### getBackgroundColorHLVal

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBackgroundColorHLVal()
  + ### getBorderColorHLVal

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBorderColorHLVal()
  + ### getDoInvalidHighlight

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDoInvalidHighlight()
  + ### getBackgroundColorHLInv

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBackgroundColorHLInv()
  + ### getBorderColorHLInv

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBorderColorHLInv()
  + ### getStoreItem

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getStoreItem()
  + ### getDoBackDropTex

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDoBackDropTex()
  + ### getBackDropTexCol

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBackDropTexCol()
  + ### getDoToolTip

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDoToolTip()
  + ### getMouseEnabled

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getMouseEnabled()
  + ### getAllowDropAlways

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getAllowDropAlways()
  + ### getToolTipTextItem

    public [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") getToolTipTextItem()
  + ### getToolTipTextLocked

    public [XuiScript.XuiTranslateString](XuiScript.XuiTranslateString.html "class in zombie.scripting.ui") getToolTipTextLocked()
  + ### getBackgroundEmpty

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBackgroundEmpty()
  + ### getBackgroundHover

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBackgroundHover()
  + ### getBorderInput

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBorderInput()
  + ### getBorderOutput

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBorderOutput()
  + ### getBorderValid

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBorderValid()
  + ### getBorderInvalid

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBorderInvalid()
  + ### getBorderLocked

    public [XuiScript.XuiColor](XuiScript.XuiColor.html "class in zombie.scripting.ui") getBorderLocked()
  + ### getDoBorderLocked

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDoBorderLocked()
  + ### getXuiLayoutName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiLayoutName()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### logWithInfo

    protected void logWithInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### warnWithInfo

    protected void warnWithInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### errorWithInfo

    protected void errorWithInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### logInfo

    private void logInfo()
  + ### getStyle

    public [XuiScript](XuiScript.html "class in zombie.scripting.ui") getStyle()
  + ### setStyle

    public void setStyle([XuiScript](XuiScript.html "class in zombie.scripting.ui") style)
  + ### getDefaultStyle

    public [XuiScript](XuiScript.html "class in zombie.scripting.ui") getDefaultStyle()
  + ### setDefaultStyle

    public void setDefaultStyle([XuiScript](XuiScript.html "class in zombie.scripting.ui") defaultStyle)
  + ### isLayout

    public boolean isLayout()
  + ### isAnyStyle

    public boolean isAnyStyle()
  + ### isStyle

    public boolean isStyle()
  + ### isDefaultStyle

    public boolean isDefaultStyle()
  + ### getScriptType

    public [XuiScriptType](XuiScriptType.html "enum class in zombie.scripting.ui") getScriptType()
  + ### addVar

    protected <T extends [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<?,?>> T addVar(T var)
  + ### getVar

    public [XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<?,?> getVar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### getVars

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript.XuiVar](XuiScript.XuiVar.html "class in zombie.scripting.ui")<?,?>> getVars()
  + ### addChild

    public void addChild([XuiScript](XuiScript.html "class in zombie.scripting.ui") child)
  + ### getChildren

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> getChildren()
  + ### ReadLuaClassValue

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ReadLuaClassValue(zombie.scripting.ScriptParser.Block block)
  + ### CreateScriptForClass

    public static [XuiScript](XuiScript.html "class in zombie.scripting.ui") CreateScriptForClass([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLayoutName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaClass,
    boolean readAltKeys,
    [XuiScriptType](XuiScriptType.html "enum class in zombie.scripting.ui") scriptType)
  + ### Load

    public void Load(zombie.scripting.ScriptParser.Block block)
  + ### loadVar

    public boolean loadVar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### loadVar

    public boolean loadVar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val,
    boolean allowNull)
  + ### tryToSetDefaultStyle

    protected void tryToSetDefaultStyle()
  + ### postLoad

    protected void postLoad()