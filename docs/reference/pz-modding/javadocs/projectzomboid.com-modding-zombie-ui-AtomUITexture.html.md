[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [AtomUITexture](AtomUITexture.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [tex](#tex)
   2. [sliceLeft](#sliceLeft)
   3. [sliceTop](#sliceTop)
   4. [sliceRight](#sliceRight)
   5. [sliceDown](#sliceDown)
   6. [animDelay](#animDelay)
   7. [animFrameNum](#animFrameNum)
   8. [animFrameRows](#animFrameRows)
   9. [animFrameColumns](#animFrameColumns)
   10. [textureIsReady](#textureIsReady)
   11. [isSlice9](#isSlice9)
   12. [slices](#slices)
   13. [isAnim](#isAnim)
   14. [frameIndex](#frameIndex)
   15. [frameTimer](#frameTimer)
   16. [beforeTime](#beforeTime)
   17. [isAnimPlay](#isAnimPlay)
7. [Constructor Details](#constructor-detail)
   1. [AtomUITexture(KahluaTable)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable))
8. [Method Details](#method-detail)
   1. [render()](#render())
   2. [animPlay()](#animPlay())
   3. [animStop()](#animStop())
   4. [animPause()](#animPause())
   5. [drawTextureAnim()](#drawTextureAnim())
   6. [drawTexture()](#drawTexture())
   7. [drawTextureSlice9()](#drawTextureSlice9())
   8. [init()](#init())
   9. [loadFromTable()](#loadFromTable())
   10. [updateInternalValues()](#updateInternalValues())
   11. [updateSlices()](#updateSlices())
   12. [updateSlicesAnim()](#updateSlicesAnim())
   13. [updateSlices9()](#updateSlices9())
   14. [setTexture(Texture)](#setTexture(zombie.core.textures.Texture))
   15. [setSlice9(double, double, double, double)](#setSlice9(double,double,double,double))
   16. [setAnimValues(double, double, double, double)](#setAnimValues(double,double,double,double))
   17. [tryGetTexture(String)](#tryGetTexture(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class AtomUITexture
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.AtomUI](AtomUI.html "class in zombie.ui")

zombie.ui.AtomUITexture

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public class AtomUITexture
extends [AtomUI](AtomUI.html "class in zombie.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static class`

  `AtomUITexture.Slice`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) double`

  `animDelay`

  `(package private) int`

  `animFrameColumns`

  `(package private) int`

  `animFrameNum`

  `(package private) int`

  `animFrameRows`

  `(package private) long`

  `beforeTime`

  `(package private) int`

  `frameIndex`

  `(package private) long`

  `frameTimer`

  `(package private) boolean`

  `isAnim`

  `(package private) boolean`

  `isAnimPlay`

  `(package private) boolean`

  `isSlice9`

  `(package private) double`

  `sliceDown`

  `(package private) double`

  `sliceLeft`

  `(package private) double`

  `sliceRight`

  `(package private) final ArrayList<AtomUITexture.Slice>`

  `slices`

  `(package private) double`

  `sliceTop`

  `(package private) Texture`

  `tex`

  `(package private) boolean`

  `textureIsReady`

  ### Fields inherited from class [AtomUI](AtomUI.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorDown, anchorLeft, anchorRight, anchorTop, angle, colorA, colorB, colorG, colorR, cosA, downSide, enabled, height, leftSide, luaKeyPress, luaKeyRelease, luaKeyRepeat, luaMouseButtonDown, luaMouseButtonDownOutside, luaMouseButtonUp, luaMouseButtonUpOutside, luaMouseMove, luaMouseMoveOutside, luaMouseWheel, luaRenderUpdate, luaResize, luaUpdate, nodes, parentNode, pivotX, pivotY, rightSide, scaleX, scaleY, sinA, stencil, stencilLevel, stencilNode, table, topSide, uiname, visible, width, x, y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AtomUITexture(se.krka.kahlua.vm.KahluaTable table)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `animPause()`

  `void`

  `animPlay()`

  `void`

  `animStop()`

  `(package private) void`

  `drawTexture()`

  `(package private) void`

  `drawTextureAnim()`

  `(package private) void`

  `drawTextureSlice9()`

  `void`

  `init()`

  `(package private) void`

  `loadFromTable()`

  `void`

  `render()`

  `void`

  `setAnimValues(double animDelay,
  double animFrameNum,
  double animFrameRows,
  double animFrameColumns)`

  `void`

  `setSlice9(double left,
  double right,
  double top,
  double down)`

  `void`

  `setTexture(Texture tex)`

  `(package private) Texture`

  `tryGetTexture(String key)`

  `(package private) void`

  `updateInternalValues()`

  `private void`

  `updateSlices()`

  `private void`

  `updateSlices9()`

  `private void`

  `updateSlicesAnim()`

  ### Methods inherited from class [AtomUI](AtomUI.html#method-summary "class in zombie.ui")

  `addNode, bringToTop, clearStencilRect, getAbsolutePosition, getAngle, getColor, getHeight, getLocalPosition, getLuaAbsolutePosition, getLuaLocalPosition, getLuaParentPosition, getMaxDrawHeight, getNodes, getParent, getParentNode, getPivotX, getPivotY, getRenderThisPlayerOnly, getScaleX, getScaleY, getTable, getUIName, getWidth, getX, getY, isAlwaysOnTop, isBackMost, isCapture, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isModalVisible, isMouseOver, isOverElement, isOverElementLocal, isPointOver, isVisible, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onMouseButtonDownOutside, onMouseButtonUpOutside, onResize, removeNode, repaintStencilRect, setAlwaysOnTop, setAngle, setBackMost, setColor, setEnabled, setHeight, setHeightSilent, setParentNode, setPivotX, setPivotY, setScaleX, setScaleY, setStencilRect, setUIName, setVisible, setWidth, setWidthSilent, setX, setY, toLocalCoordinates, tryGetBoolean, tryGetClosure, tryGetDouble, tryGetString, update, updateSize`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex
  + ### sliceLeft

    double sliceLeft
  + ### sliceTop

    double sliceTop
  + ### sliceRight

    double sliceRight
  + ### sliceDown

    double sliceDown
  + ### animDelay

    double animDelay
  + ### animFrameNum

    int animFrameNum
  + ### animFrameRows

    int animFrameRows
  + ### animFrameColumns

    int animFrameColumns
  + ### textureIsReady

    boolean textureIsReady
  + ### isSlice9

    boolean isSlice9
  + ### slices

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AtomUITexture.Slice](AtomUITexture.Slice.html "class in zombie.ui")> slices
  + ### isAnim

    boolean isAnim
  + ### frameIndex

    int frameIndex
  + ### frameTimer

    long frameTimer
  + ### beforeTime

    long beforeTime
  + ### isAnimPlay

    boolean isAnimPlay
* Constructor Details
  -------------------

  + ### AtomUITexture

    public AtomUITexture(se.krka.kahlua.vm.KahluaTable table)
* Method Details
  --------------

  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `AtomUI`
  + ### animPlay

    public void animPlay()
  + ### animStop

    public void animStop()
  + ### animPause

    public void animPause()
  + ### drawTextureAnim

    void drawTextureAnim()
  + ### drawTexture

    void drawTexture()
  + ### drawTextureSlice9

    void drawTextureSlice9()
  + ### init

    public void init()

    Overrides:
    :   `init` in class `AtomUI`
  + ### loadFromTable

    void loadFromTable()

    Overrides:
    :   `loadFromTable` in class `AtomUI`
  + ### updateInternalValues

    void updateInternalValues()

    Overrides:
    :   `updateInternalValues` in class `AtomUI`
  + ### updateSlices

    private void updateSlices()
  + ### updateSlicesAnim

    private void updateSlicesAnim()
  + ### updateSlices9

    private void updateSlices9()
  + ### setTexture

    public void setTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex)
  + ### setSlice9

    public void setSlice9(double left,
    double right,
    double top,
    double down)
  + ### setAnimValues

    public void setAnimValues(double animDelay,
    double animFrameNum,
    double animFrameRows,
    double animFrameColumns)
  + ### tryGetTexture

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") tryGetTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)