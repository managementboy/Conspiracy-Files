[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [AtomUIMap](AtomUIMap.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [map](#map)
6. [Constructor Details](#constructor-detail)
   1. [AtomUIMap(KahluaTable)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable))
7. [Method Details](#method-detail)
   1. [render()](#render())
   2. [init()](#init())
   3. [getMapUI()](#getMapUI())
   4. [revealOnMap()](#revealOnMap())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class AtomUIMap
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.AtomUI](AtomUI.html "class in zombie.ui")

zombie.ui.AtomUIMap

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public class AtomUIMap
extends [AtomUI](AtomUI.html "class in zombie.ui")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) zombie.worldMap.UIWorldMap`

  `map`

  ### Fields inherited from class [AtomUI](AtomUI.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorDown, anchorLeft, anchorRight, anchorTop, angle, colorA, colorB, colorG, colorR, cosA, downSide, enabled, height, leftSide, luaKeyPress, luaKeyRelease, luaKeyRepeat, luaMouseButtonDown, luaMouseButtonDownOutside, luaMouseButtonUp, luaMouseButtonUpOutside, luaMouseMove, luaMouseMoveOutside, luaMouseWheel, luaRenderUpdate, luaResize, luaUpdate, nodes, parentNode, pivotX, pivotY, rightSide, scaleX, scaleY, sinA, stencil, stencilLevel, stencilNode, table, topSide, uiname, visible, width, x, y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AtomUIMap(se.krka.kahlua.vm.KahluaTable table)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.worldMap.UIWorldMap`

  `getMapUI()`

  `void`

  `init()`

  `void`

  `render()`

  `void`

  `revealOnMap()`

  ### Methods inherited from class [AtomUI](AtomUI.html#method-summary "class in zombie.ui")

  `addNode, bringToTop, clearStencilRect, getAbsolutePosition, getAngle, getColor, getHeight, getLocalPosition, getLuaAbsolutePosition, getLuaLocalPosition, getLuaParentPosition, getMaxDrawHeight, getNodes, getParent, getParentNode, getPivotX, getPivotY, getRenderThisPlayerOnly, getScaleX, getScaleY, getTable, getUIName, getWidth, getX, getY, isAlwaysOnTop, isBackMost, isCapture, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isModalVisible, isMouseOver, isOverElement, isOverElementLocal, isPointOver, isVisible, isWantKeyEvents, loadFromTable, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onMouseButtonDownOutside, onMouseButtonUpOutside, onResize, removeNode, repaintStencilRect, setAlwaysOnTop, setAngle, setBackMost, setColor, setEnabled, setHeight, setHeightSilent, setParentNode, setPivotX, setPivotY, setScaleX, setScaleY, setStencilRect, setUIName, setVisible, setWidth, setWidthSilent, setX, setY, toLocalCoordinates, tryGetBoolean, tryGetClosure, tryGetDouble, tryGetString, update, updateInternalValues, updateSize`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### map

    zombie.worldMap.UIWorldMap map
* Constructor Details
  -------------------

  + ### AtomUIMap

    public AtomUIMap(se.krka.kahlua.vm.KahluaTable table)
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
  + ### getMapUI

    public zombie.worldMap.UIWorldMap getMapUI()
  + ### revealOnMap

    public void revealOnMap()