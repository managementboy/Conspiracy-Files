[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.ui](package-summary.html)
2. [XuiReference](XuiReference.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [layout](#layout)
   2. [dynamic](#dynamic)
   3. [referenceScript](#referenceScript)
7. [Constructor Details](#constructor-detail)
   1. [XuiReference(String, boolean)](#%3Cinit%3E(java.lang.String,boolean))
8. [Method Details](#method-detail)
   1. [getReferenceLayout()](#getReferenceLayout())
   2. [getLayout()](#getLayout())
   3. [getDynamic()](#getDynamic())
   4. [Load(ScriptParser.Block)](#Load(zombie.scripting.ScriptParser.Block))
   5. [setStyle(XuiScript)](#setStyle(zombie.scripting.ui.XuiScript))
   6. [setDefaultStyle(XuiScript)](#setDefaultStyle(zombie.scripting.ui.XuiScript))
   7. [addChild(XuiScript)](#addChild(zombie.scripting.ui.XuiScript))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiReference
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiScript](XuiScript.html "class in zombie.scripting.ui")

zombie.scripting.ui.XuiReference

---

public class XuiReference
extends [XuiScript](XuiScript.html "class in zombie.scripting.ui")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [XuiScript](XuiScript.html#nested-class-summary "class in zombie.scripting.ui")

  `XuiScript.XuiBoolean, XuiScript.XuiColor, XuiScript.XuiDouble, XuiScript.XuiFloat, XuiScript.XuiFontType, XuiScript.XuiFunction, XuiScript.XuiInteger, XuiScript.XuiSpacing, XuiScript.XuiString, XuiScript.XuiStringList, XuiScript.XuiTextAlign, XuiScript.XuiTexture, XuiScript.XuiTranslateString, XuiScript.XuiUnit, XuiScript.XuiVar<T,C>, XuiScript.XuiVector, XuiScript.XuiVectorPosAlign`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final XuiScript.XuiBoolean`

  `dynamic`

  `final XuiScript.XuiString`

  `layout`

  `private XuiScript`

  `referenceScript`

  ### Fields inherited from class [XuiScript](XuiScript.html#field-summary "class in zombie.scripting.ui")

  `allowDropAlways, anchorBottom, anchorLeft, anchorRight, anchorTop, animationList, animationTime, backDropTexCol, background, backgroundColor, backgroundColorHl, backgroundColorHlInv, backgroundColorHlVal, backgroundColorMouseOver, backgroundEmpty, backgroundHover, borderColor, borderColorHl, borderColorHlInv, borderColorHlVal, borderInput, borderInvalid, borderLocked, borderOutput, borderValid, children, choicesColor, displayBackground, doBackDropTex, doBorderLocked, doHighlight, doInvalidHighlight, doToolTip, doValidHighlight, drawBackground, drawBorder, drawGrid, enableHeader, font, font2, font3, gridColor, height, hsbFactor, icon, iconHeight, iconVector, iconWidth, iconX, iconY, image, imageHeight, imageVector, imageWidth, imageX, imageY, margin, marginBottom, marginLeft, marginRight, marginTop, maximumHeight, maximumWidth, minimumHeight, minimumWidth, mouseEnabled, mouseOver, mouseOverText, moveWithMouse, name, padding, paddingBottom, paddingLeft, paddingRight, paddingTop, pin, posAlign, readAltKeys, resizable, scaledHeight, scaledWidth, scriptType, storeItem, textAlign, textColor, texture, textureBackground, textureColor, textureOverride, tickTexture, title, tooltip, toolTipTextItem, toolTipTextLocked, vars, varsMap, vector, width, x, xuiCustomDebug, xuiKey, xuiLayoutName, xuiLuaClass, xuiSkin, xuiStyle, xuiUuid, y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiReference(String xuiLayoutName,
  boolean readAltKeys)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addChild(XuiScript child)`

  `XuiScript.XuiBoolean`

  `getDynamic()`

  `XuiScript.XuiString`

  `getLayout()`

  `XuiScript`

  `getReferenceLayout()`

  `void`

  `Load(zombie.scripting.ScriptParser.Block block)`

  `void`

  `setDefaultStyle(XuiScript defaultStyle)`

  `void`

  `setStyle(XuiScript style)`

  ### Methods inherited from class [XuiScript](XuiScript.html#method-summary "class in zombie.scripting.ui")

  `addVar, CreateScriptForClass, errorWithInfo, getAllowDropAlways, getAnchorBottom, getAnchorLeft, getAnchorRight, getAnchorTop, getAnimationList, getAnimationTime, getBackDropTexCol, getBackground, getBackgroundColor, getBackgroundColorHL, getBackgroundColorHLInv, getBackgroundColorHLVal, getBackgroundColorMouseOver, getBackgroundEmpty, getBackgroundHover, getBorderColor, getBorderColorHL, getBorderColorHLInv, getBorderColorHLVal, getBorderInput, getBorderInvalid, getBorderLocked, getBorderOutput, getBorderValid, getChildren, getChoicesColor, getDefaultStyle, getDisplayBackground, getDoBackDropTex, getDoBorderLocked, getDoHighlight, getDoInvalidHighlight, getDoToolTip, getDoValidHighlight, getDrawBackground, getDrawBorder, getDrawGrid, getFont, getFont2, getFont3, getGridColor, getHsbFactor, getIcon, getIconVector, getMargin, getMinimumHeight, getMinimumWidth, getMouseEnabled, getMouseOverText, getMoveWithMouse, getName, getPadding, getPosAlign, getScriptType, getStoreItem, getStyle, getTextAlign, getTextColor, getTexture, getTextureBackground, getTextureColor, getTextureOverride, getTickTexture, getTitle, getTooltip, getToolTipTextItem, getToolTipTextLocked, getVar, getVars, getVector, getXuiCustomDebug, getXuiKey, getXuiLayoutName, getXuiLuaClass, getXuiStyle, getXuiUUID, isAnyStyle, isDefaultStyle, isLayout, isStyle, loadVar, loadVar, logWithInfo, postLoad, ReadLuaClassValue, setXuiKey, setXuiLuaClass, setXuiStyle, toString, tryToSetDefaultStyle, warnWithInfo`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### layout

    public final [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") layout
  + ### dynamic

    public final [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") dynamic
  + ### referenceScript

    private [XuiScript](XuiScript.html "class in zombie.scripting.ui") referenceScript
* Constructor Details
  -------------------

  + ### XuiReference

    public XuiReference([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLayoutName,
    boolean readAltKeys)
* Method Details
  --------------

  + ### getReferenceLayout

    public [XuiScript](XuiScript.html "class in zombie.scripting.ui") getReferenceLayout()
  + ### getLayout

    public [XuiScript.XuiString](XuiScript.XuiString.html "class in zombie.scripting.ui") getLayout()
  + ### getDynamic

    public [XuiScript.XuiBoolean](XuiScript.XuiBoolean.html "class in zombie.scripting.ui") getDynamic()
  + ### Load

    public void Load(zombie.scripting.ScriptParser.Block block)

    Overrides:
    :   `Load` in class `XuiScript`
  + ### setStyle

    public void setStyle([XuiScript](XuiScript.html "class in zombie.scripting.ui") style)

    Overrides:
    :   `setStyle` in class `XuiScript`
  + ### setDefaultStyle

    public void setDefaultStyle([XuiScript](XuiScript.html "class in zombie.scripting.ui") defaultStyle)

    Overrides:
    :   `setDefaultStyle` in class `XuiScript`
  + ### addChild

    public void addChild([XuiScript](XuiScript.html "class in zombie.scripting.ui") child)

    Overrides:
    :   `addChild` in class `XuiScript`