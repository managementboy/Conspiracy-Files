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
3. [XuiTableRowScript](XuiTableScript.XuiTableRowScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [XuiTableRowScript(String, boolean, XuiScript)](#%3Cinit%3E(java.lang.String,boolean,zombie.scripting.ui.XuiScript))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiTableScript.XuiTableRowScript
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.ui.XuiScript](XuiScript.html "class in zombie.scripting.ui")

zombie.scripting.ui.XuiTableScript.XuiTableRowScript

Enclosing class:
:   `XuiTableScript`

---

public static class XuiTableScript.XuiTableRowScript
extends [XuiScript](XuiScript.html "class in zombie.scripting.ui")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [XuiScript](XuiScript.html#nested-class-summary "class in zombie.scripting.ui")

  `XuiScript.XuiBoolean, XuiScript.XuiColor, XuiScript.XuiDouble, XuiScript.XuiFloat, XuiScript.XuiFontType, XuiScript.XuiFunction, XuiScript.XuiInteger, XuiScript.XuiSpacing, XuiScript.XuiString, XuiScript.XuiStringList, XuiScript.XuiTextAlign, XuiScript.XuiTexture, XuiScript.XuiTranslateString, XuiScript.XuiUnit, XuiScript.XuiVar<T,C>, XuiScript.XuiVector, XuiScript.XuiVectorPosAlign`
* Field Summary
  -------------

  ### Fields inherited from class [XuiScript](XuiScript.html#field-summary "class in zombie.scripting.ui")

  `allowDropAlways, anchorBottom, anchorLeft, anchorRight, anchorTop, animationList, animationTime, backDropTexCol, background, backgroundColor, backgroundColorHl, backgroundColorHlInv, backgroundColorHlVal, backgroundColorMouseOver, backgroundEmpty, backgroundHover, borderColor, borderColorHl, borderColorHlInv, borderColorHlVal, borderInput, borderInvalid, borderLocked, borderOutput, borderValid, children, choicesColor, displayBackground, doBackDropTex, doBorderLocked, doHighlight, doInvalidHighlight, doToolTip, doValidHighlight, drawBackground, drawBorder, drawGrid, enableHeader, font, font2, font3, gridColor, height, hsbFactor, icon, iconHeight, iconVector, iconWidth, iconX, iconY, image, imageHeight, imageVector, imageWidth, imageX, imageY, margin, marginBottom, marginLeft, marginRight, marginTop, maximumHeight, maximumWidth, minimumHeight, minimumWidth, mouseEnabled, mouseOver, mouseOverText, moveWithMouse, name, padding, paddingBottom, paddingLeft, paddingRight, paddingTop, pin, posAlign, readAltKeys, resizable, scaledHeight, scaledWidth, scriptType, storeItem, textAlign, textColor, texture, textureBackground, textureColor, textureOverride, tickTexture, title, tooltip, toolTipTextItem, toolTipTextLocked, vars, varsMap, vector, width, x, xuiCustomDebug, xuiKey, xuiLayoutName, xuiLuaClass, xuiSkin, xuiStyle, xuiUuid, y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiTableRowScript(String xuiLayoutName,
  boolean readAltKeys,
  XuiScript style)`
* Method Summary
  --------------

  ### Methods inherited from class [XuiScript](XuiScript.html#method-summary "class in zombie.scripting.ui")

  `addChild, addVar, CreateScriptForClass, errorWithInfo, getAllowDropAlways, getAnchorBottom, getAnchorLeft, getAnchorRight, getAnchorTop, getAnimationList, getAnimationTime, getBackDropTexCol, getBackground, getBackgroundColor, getBackgroundColorHL, getBackgroundColorHLInv, getBackgroundColorHLVal, getBackgroundColorMouseOver, getBackgroundEmpty, getBackgroundHover, getBorderColor, getBorderColorHL, getBorderColorHLInv, getBorderColorHLVal, getBorderInput, getBorderInvalid, getBorderLocked, getBorderOutput, getBorderValid, getChildren, getChoicesColor, getDefaultStyle, getDisplayBackground, getDoBackDropTex, getDoBorderLocked, getDoHighlight, getDoInvalidHighlight, getDoToolTip, getDoValidHighlight, getDrawBackground, getDrawBorder, getDrawGrid, getFont, getFont2, getFont3, getGridColor, getHsbFactor, getIcon, getIconVector, getMargin, getMinimumHeight, getMinimumWidth, getMouseEnabled, getMouseOverText, getMoveWithMouse, getName, getPadding, getPosAlign, getScriptType, getStoreItem, getStyle, getTextAlign, getTextColor, getTexture, getTextureBackground, getTextureColor, getTextureOverride, getTickTexture, getTitle, getTooltip, getToolTipTextItem, getToolTipTextLocked, getVar, getVars, getVector, getXuiCustomDebug, getXuiKey, getXuiLayoutName, getXuiLuaClass, getXuiStyle, getXuiUUID, isAnyStyle, isDefaultStyle, isLayout, isStyle, Load, loadVar, loadVar, logWithInfo, postLoad, ReadLuaClassValue, setDefaultStyle, setStyle, setXuiKey, setXuiLuaClass, setXuiStyle, toString, tryToSetDefaultStyle, warnWithInfo`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Constructor Details
  -------------------

  + ### XuiTableRowScript

    public XuiTableRowScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLayoutName,
    boolean readAltKeys,
    [XuiScript](XuiScript.html "class in zombie.scripting.ui") style)