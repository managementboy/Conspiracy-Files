[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [AtomUI](AtomUI.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [stencilLevel](#stencilLevel)
   2. [stencil](#stencil)
   3. [stencilNode](#stencilNode)
   4. [table](#table)
   5. [uiname](#uiname)
   6. [nodes](#nodes)
   7. [parentNode](#parentNode)
   8. [visible](#visible)
   9. [enabled](#enabled)
   10. [alwaysOnTop](#alwaysOnTop)
   11. [alwaysBack](#alwaysBack)
   12. [anchorLeft](#anchorLeft)
   13. [anchorRight](#anchorRight)
   14. [anchorTop](#anchorTop)
   15. [anchorDown](#anchorDown)
   16. [x](#x)
   17. [y](#y)
   18. [width](#width)
   19. [height](#height)
   20. [pivotX](#pivotX)
   21. [pivotY](#pivotY)
   22. [angle](#angle)
   23. [scaleX](#scaleX)
   24. [scaleY](#scaleY)
   25. [colorR](#colorR)
   26. [colorG](#colorG)
   27. [colorB](#colorB)
   28. [colorA](#colorA)
   29. [sinA](#sinA)
   30. [cosA](#cosA)
   31. [leftSide](#leftSide)
   32. [rightSide](#rightSide)
   33. [topSide](#topSide)
   34. [downSide](#downSide)
   35. [luaMouseButtonDown](#luaMouseButtonDown)
   36. [luaMouseButtonUp](#luaMouseButtonUp)
   37. [luaMouseButtonDownOutside](#luaMouseButtonDownOutside)
   38. [luaMouseButtonUpOutside](#luaMouseButtonUpOutside)
   39. [luaMouseWheel](#luaMouseWheel)
   40. [luaMouseMove](#luaMouseMove)
   41. [luaMouseMoveOutside](#luaMouseMoveOutside)
   42. [luaUpdate](#luaUpdate)
   43. [luaRenderUpdate](#luaRenderUpdate)
   44. [luaKeyPress](#luaKeyPress)
   45. [luaKeyRepeat](#luaKeyRepeat)
   46. [luaKeyRelease](#luaKeyRelease)
   47. [luaResize](#luaResize)
6. [Constructor Details](#constructor-detail)
   1. [AtomUI(KahluaTable)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable))
7. [Method Details](#method-detail)
   1. [init()](#init())
   2. [isIgnoreLossControl()](#isIgnoreLossControl())
   3. [isFollowGameWorld()](#isFollowGameWorld())
   4. [isDefaultDraw()](#isDefaultDraw())
   5. [render()](#render())
   6. [checkStencilCollision()](#checkStencilCollision())
   7. [isVisible()](#isVisible())
   8. [setVisible(boolean)](#setVisible(boolean))
   9. [isCapture()](#isCapture())
   10. [isModalVisible()](#isModalVisible())
   11. [getMaxDrawHeight()](#getMaxDrawHeight())
   12. [getX()](#getX())
   13. [setX(double)](#setX(double))
   14. [getY()](#getY())
   15. [setY(double)](#setY(double))
   16. [getWidth()](#getWidth())
   17. [setWidth(double)](#setWidth(double))
   18. [setWidthSilent(double)](#setWidthSilent(double))
   19. [getHeight()](#getHeight())
   20. [setHeight(double)](#setHeight(double))
   21. [setHeightSilent(double)](#setHeightSilent(double))
   22. [bringToTop()](#bringToTop())
   23. [isOverElement(double, double)](#isOverElement(double,double))
   24. [getParent()](#getParent())
   25. [onConsumeMouseButtonDown(int, double, double)](#onConsumeMouseButtonDown(int,double,double))
   26. [onConsumeMouseButtonUp(int, double, double)](#onConsumeMouseButtonUp(int,double,double))
   27. [onMouseButtonDownOutside(int, double, double)](#onMouseButtonDownOutside(int,double,double))
   28. [onMouseButtonUpOutside(int, double, double)](#onMouseButtonUpOutside(int,double,double))
   29. [onConsumeMouseWheel(double, double, double)](#onConsumeMouseWheel(double,double,double))
   30. [isPointOver(double, double)](#isPointOver(double,double))
   31. [onConsumeMouseMove(double, double, double, double)](#onConsumeMouseMove(double,double,double,double))
   32. [onExtendMouseMoveOutside(double, double, double, double)](#onExtendMouseMoveOutside(double,double,double,double))
   33. [update()](#update())
   34. [isMouseOver()](#isMouseOver())
   35. [isWantKeyEvents()](#isWantKeyEvents())
   36. [getRenderThisPlayerOnly()](#getRenderThisPlayerOnly())
   37. [onConsumeKeyPress(int)](#onConsumeKeyPress(int))
   38. [onConsumeKeyRepeat(int)](#onConsumeKeyRepeat(int))
   39. [onConsumeKeyRelease(int)](#onConsumeKeyRelease(int))
   40. [isForceCursorVisible()](#isForceCursorVisible())
   41. [getLuaLocalPosition(double, double)](#getLuaLocalPosition(double,double))
   42. [getLuaAbsolutePosition(double, double)](#getLuaAbsolutePosition(double,double))
   43. [getLuaParentPosition(double, double)](#getLuaParentPosition(double,double))
   44. [getParentNode()](#getParentNode())
   45. [setParentNode(AtomUI)](#setParentNode(zombie.ui.AtomUI))
   46. [addNode(AtomUI)](#addNode(zombie.ui.AtomUI))
   47. [removeNode(AtomUI)](#removeNode(zombie.ui.AtomUI))
   48. [getNodes()](#getNodes())
   49. [setPivotX(double)](#setPivotX(double))
   50. [getPivotX()](#getPivotX())
   51. [setPivotY(double)](#setPivotY(double))
   52. [getPivotY()](#getPivotY())
   53. [setAngle(double)](#setAngle(double))
   54. [getAngle()](#getAngle())
   55. [setScaleX(double)](#setScaleX(double))
   56. [getScaleX()](#getScaleX())
   57. [setScaleY(double)](#setScaleY(double))
   58. [getScaleY()](#getScaleY())
   59. [setColor(double, double, double, double)](#setColor(double,double,double,double))
   60. [getColor()](#getColor())
   61. [getTable()](#getTable())
   62. [isEnabled()](#isEnabled())
   63. [setEnabled(boolean)](#setEnabled(boolean))
   64. [setAlwaysOnTop(boolean)](#setAlwaysOnTop(boolean))
   65. [isAlwaysOnTop()](#isAlwaysOnTop())
   66. [setBackMost(boolean)](#setBackMost(boolean))
   67. [isBackMost()](#isBackMost())
   68. [getUIName()](#getUIName())
   69. [setUIName(String)](#setUIName(java.lang.String))
   70. [loadFromTable()](#loadFromTable())
   71. [updateInternalValues()](#updateInternalValues())
   72. [toLocalCoordinates(double, double)](#toLocalCoordinates(double,double))
   73. [getLocalPosition(double, double)](#getLocalPosition(double,double))
   74. [getAbsolutePosition(double, double)](#getAbsolutePosition(double,double))
   75. [isOverElementLocal(double, double)](#isOverElementLocal(double,double))
   76. [updateSize()](#updateSize())
   77. [onResize()](#onResize())
   78. [setStencilRect()](#setStencilRect())
   79. [clearStencilRect()](#clearStencilRect())
   80. [repaintStencilRect()](#repaintStencilRect())
   81. [tryGetDouble(String, double)](#tryGetDouble(java.lang.String,double))
   82. [tryGetBoolean(String, boolean)](#tryGetBoolean(java.lang.String,boolean))
   83. [tryGetClosure(String)](#tryGetClosure(java.lang.String))
   84. [tryGetString(String, String)](#tryGetString(java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class AtomUI
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.AtomUI

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

Direct Known Subclasses:
:   `AtomUIMap, AtomUIText, AtomUITextEntry, AtomUITexture`

---

public class AtomUI
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.ui.UIElementInterface

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) boolean`

  `alwaysBack`

  `(package private) boolean`

  `alwaysOnTop`

  `(package private) Double`

  `anchorDown`

  `(package private) Double`

  `anchorLeft`

  `(package private) Double`

  `anchorRight`

  `(package private) Double`

  `anchorTop`

  `(package private) double`

  `angle`

  `(package private) float`

  `colorA`

  `(package private) float`

  `colorB`

  `(package private) float`

  `colorG`

  `(package private) float`

  `colorR`

  `(package private) double`

  `cosA`

  `(package private) double`

  `downSide`

  `(package private) boolean`

  `enabled`

  `(package private) double`

  `height`

  `(package private) double`

  `leftSide`

  `(package private) Object`

  `luaKeyPress`

  `(package private) Object`

  `luaKeyRelease`

  `(package private) Object`

  `luaKeyRepeat`

  `(package private) Object`

  `luaMouseButtonDown`

  `(package private) Object`

  `luaMouseButtonDownOutside`

  `(package private) Object`

  `luaMouseButtonUp`

  `(package private) Object`

  `luaMouseButtonUpOutside`

  `(package private) Object`

  `luaMouseMove`

  `(package private) Object`

  `luaMouseMoveOutside`

  `(package private) Object`

  `luaMouseWheel`

  `(package private) Object`

  `luaRenderUpdate`

  `(package private) Object`

  `luaResize`

  `(package private) Object`

  `luaUpdate`

  `(package private) final ArrayList<AtomUI>`

  `nodes`

  `(package private) AtomUI`

  `parentNode`

  `(package private) double`

  `pivotX`

  `(package private) double`

  `pivotY`

  `(package private) double`

  `rightSide`

  `(package private) double`

  `scaleX`

  `(package private) double`

  `scaleY`

  `(package private) double`

  `sinA`

  `(package private) boolean`

  `stencil`

  `(package private) static int`

  `stencilLevel`

  `(package private) AtomUI`

  `stencilNode`

  `(package private) se.krka.kahlua.vm.KahluaTable`

  `table`

  `(package private) double`

  `topSide`

  `(package private) String`

  `uiname`

  `(package private) boolean`

  `visible`

  `(package private) double`

  `width`

  `(package private) double`

  `x`

  `(package private) double`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AtomUI(se.krka.kahlua.vm.KahluaTable table)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addNode(AtomUI el)`

  `void`

  `bringToTop()`

  `private boolean`

  `checkStencilCollision()`

  `void`

  `clearStencilRect()`

  `(package private) double[]`

  `getAbsolutePosition(double localX,
  double localY)`

  `Double`

  `getAngle()`

  `se.krka.kahlua.vm.KahluaTable`

  `getColor()`

  `Double`

  `getHeight()`

  `(package private) double[]`

  `getLocalPosition(double absoluteX,
  double absoluteY)`

  `se.krka.kahlua.vm.KahluaTable`

  `getLuaAbsolutePosition(double x,
  double y)`

  `se.krka.kahlua.vm.KahluaTable`

  `getLuaLocalPosition(double x,
  double y)`

  `se.krka.kahlua.vm.KahluaTable`

  `getLuaParentPosition(double x,
  double y)`

  `Double`

  `getMaxDrawHeight()`

  `ArrayList<AtomUI>`

  `getNodes()`

  `zombie.ui.UIElementInterface`

  `getParent()`

  `AtomUI`

  `getParentNode()`

  `Double`

  `getPivotX()`

  `Double`

  `getPivotY()`

  `int`

  `getRenderThisPlayerOnly()`

  `Double`

  `getScaleX()`

  `Double`

  `getScaleY()`

  `se.krka.kahlua.vm.KahluaTable`

  `getTable()`

  `String`

  `getUIName()`

  `Double`

  `getWidth()`

  `Double`

  `getX()`

  `Double`

  `getY()`

  `void`

  `init()`

  `boolean`

  `isAlwaysOnTop()`

  `boolean`

  `isBackMost()`

  `Boolean`

  `isCapture()`

  `Boolean`

  `isDefaultDraw()`

  `Boolean`

  `isEnabled()`

  `Boolean`

  `isFollowGameWorld()`

  `boolean`

  `isForceCursorVisible()`

  `Boolean`

  `isIgnoreLossControl()`

  `boolean`

  `isModalVisible()`

  `Boolean`

  `isMouseOver()`

  `boolean`

  `isOverElement(double mx,
  double my)`

  `(package private) boolean`

  `isOverElementLocal(double x,
  double y)`

  `Boolean`

  `isPointOver(double screenX,
  double screenY)`

  `Boolean`

  `isVisible()`

  `boolean`

  `isWantKeyEvents()`

  `(package private) void`

  `loadFromTable()`

  `boolean`

  `onConsumeKeyPress(int key)`

  `boolean`

  `onConsumeKeyRelease(int key)`

  `boolean`

  `onConsumeKeyRepeat(int key)`

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

  `Boolean`

  `onConsumeMouseWheel(double del,
  double x,
  double y)`

  `void`

  `onExtendMouseMoveOutside(double dx,
  double dy,
  double x,
  double y)`

  `void`

  `onMouseButtonDownOutside(int btn,
  double x,
  double y)`

  `void`

  `onMouseButtonUpOutside(int btn,
  double x,
  double y)`

  `(package private) void`

  `onResize()`

  `void`

  `removeNode(AtomUI el)`

  `void`

  `render()`

  `void`

  `repaintStencilRect()`

  `void`

  `setAlwaysOnTop(boolean value)`

  `void`

  `setAngle(double angle)`

  `void`

  `setBackMost(boolean value)`

  `void`

  `setColor(double r,
  double g,
  double b,
  double a)`

  `void`

  `setEnabled(boolean enabled)`

  `void`

  `setHeight(double value)`

  `void`

  `setHeightSilent(double value)`

  `void`

  `setParentNode(AtomUI parent)`

  `void`

  `setPivotX(double x)`

  `void`

  `setPivotY(double y)`

  `void`

  `setScaleX(double x)`

  `void`

  `setScaleY(double y)`

  `void`

  `setStencilRect()`

  `void`

  `setUIName(String name)`

  `void`

  `setVisible(boolean value)`

  `void`

  `setWidth(double value)`

  `void`

  `setWidthSilent(double value)`

  `void`

  `setX(double value)`

  `void`

  `setY(double value)`

  `(package private) double[]`

  `toLocalCoordinates(double x,
  double y)`

  `(package private) boolean`

  `tryGetBoolean(String key,
  boolean defaultValue)`

  `(package private) se.krka.kahlua.vm.LuaClosure`

  `tryGetClosure(String key)`

  `(package private) double`

  `tryGetDouble(String key,
  double defaultValue)`

  `(package private) String`

  `tryGetString(String key,
  String defaultValue)`

  `void`

  `update()`

  `(package private) void`

  `updateInternalValues()`

  `(package private) void`

  `updateSize()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### stencilLevel

    static int stencilLevel
  + ### stencil

    boolean stencil
  + ### stencilNode

    [AtomUI](AtomUI.html "class in zombie.ui") stencilNode
  + ### table

    se.krka.kahlua.vm.KahluaTable table
  + ### uiname

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") uiname
  + ### nodes

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AtomUI](AtomUI.html "class in zombie.ui")> nodes
  + ### parentNode

    [AtomUI](AtomUI.html "class in zombie.ui") parentNode
  + ### visible

    boolean visible
  + ### enabled

    boolean enabled
  + ### alwaysOnTop

    boolean alwaysOnTop
  + ### alwaysBack

    boolean alwaysBack
  + ### anchorLeft

    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") anchorLeft
  + ### anchorRight

    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") anchorRight
  + ### anchorTop

    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") anchorTop
  + ### anchorDown

    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") anchorDown
  + ### x

    double x
  + ### y

    double y
  + ### width

    double width
  + ### height

    double height
  + ### pivotX

    double pivotX
  + ### pivotY

    double pivotY
  + ### angle

    double angle
  + ### scaleX

    double scaleX
  + ### scaleY

    double scaleY
  + ### colorR

    float colorR
  + ### colorG

    float colorG
  + ### colorB

    float colorB
  + ### colorA

    float colorA
  + ### sinA

    double sinA
  + ### cosA

    double cosA
  + ### leftSide

    double leftSide
  + ### rightSide

    double rightSide
  + ### topSide

    double topSide
  + ### downSide

    double downSide
  + ### luaMouseButtonDown

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaMouseButtonDown
  + ### luaMouseButtonUp

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaMouseButtonUp
  + ### luaMouseButtonDownOutside

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaMouseButtonDownOutside
  + ### luaMouseButtonUpOutside

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaMouseButtonUpOutside
  + ### luaMouseWheel

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaMouseWheel
  + ### luaMouseMove

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaMouseMove
  + ### luaMouseMoveOutside

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaMouseMoveOutside
  + ### luaUpdate

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaUpdate
  + ### luaRenderUpdate

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaRenderUpdate
  + ### luaKeyPress

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaKeyPress
  + ### luaKeyRepeat

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaKeyRepeat
  + ### luaKeyRelease

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaKeyRelease
  + ### luaResize

    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaResize
* Constructor Details
  -------------------

  + ### AtomUI

    public AtomUI(se.krka.kahlua.vm.KahluaTable table)
* Method Details
  --------------

  + ### init

    public void init()
  + ### isIgnoreLossControl

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isIgnoreLossControl()

    Specified by:
    :   `isIgnoreLossControl` in interface `zombie.ui.UIElementInterface`
  + ### isFollowGameWorld

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isFollowGameWorld()

    Specified by:
    :   `isFollowGameWorld` in interface `zombie.ui.UIElementInterface`
  + ### isDefaultDraw

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isDefaultDraw()

    Specified by:
    :   `isDefaultDraw` in interface `zombie.ui.UIElementInterface`
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`
  + ### checkStencilCollision

    private boolean checkStencilCollision()
  + ### isVisible

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isVisible()

    Specified by:
    :   `isVisible` in interface `zombie.ui.UIElementInterface`
  + ### setVisible

    public void setVisible(boolean value)
  + ### isCapture

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isCapture()

    Specified by:
    :   `isCapture` in interface `zombie.ui.UIElementInterface`
  + ### isModalVisible

    public boolean isModalVisible()

    Specified by:
    :   `isModalVisible` in interface `zombie.ui.UIElementInterface`
  + ### getMaxDrawHeight

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getMaxDrawHeight()

    Specified by:
    :   `getMaxDrawHeight` in interface `zombie.ui.UIElementInterface`
  + ### getX

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getX()

    Specified by:
    :   `getX` in interface `zombie.ui.UIElementInterface`
  + ### setX

    public void setX(double value)
  + ### getY

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getY()

    Specified by:
    :   `getY` in interface `zombie.ui.UIElementInterface`
  + ### setY

    public void setY(double value)
  + ### getWidth

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getWidth()

    Specified by:
    :   `getWidth` in interface `zombie.ui.UIElementInterface`
  + ### setWidth

    public void setWidth(double value)
  + ### setWidthSilent

    public void setWidthSilent(double value)
  + ### getHeight

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getHeight()

    Specified by:
    :   `getHeight` in interface `zombie.ui.UIElementInterface`
  + ### setHeight

    public void setHeight(double value)
  + ### setHeightSilent

    public void setHeightSilent(double value)
  + ### bringToTop

    public void bringToTop()
  + ### isOverElement

    public boolean isOverElement(double mx,
    double my)

    Specified by:
    :   `isOverElement` in interface `zombie.ui.UIElementInterface`
  + ### getParent

    public zombie.ui.UIElementInterface getParent()

    Specified by:
    :   `getParent` in interface `zombie.ui.UIElementInterface`
  + ### onConsumeMouseButtonDown

    public boolean onConsumeMouseButtonDown(int btn,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseButtonDown` in interface `zombie.ui.UIElementInterface`
  + ### onConsumeMouseButtonUp

    public boolean onConsumeMouseButtonUp(int btn,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseButtonUp` in interface `zombie.ui.UIElementInterface`
  + ### onMouseButtonDownOutside

    public void onMouseButtonDownOutside(int btn,
    double x,
    double y)

    Specified by:
    :   `onMouseButtonDownOutside` in interface `zombie.ui.UIElementInterface`
  + ### onMouseButtonUpOutside

    public void onMouseButtonUpOutside(int btn,
    double x,
    double y)

    Specified by:
    :   `onMouseButtonUpOutside` in interface `zombie.ui.UIElementInterface`
  + ### onConsumeMouseWheel

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onConsumeMouseWheel(double del,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseWheel` in interface `zombie.ui.UIElementInterface`
  + ### isPointOver

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isPointOver(double screenX,
    double screenY)

    Specified by:
    :   `isPointOver` in interface `zombie.ui.UIElementInterface`
  + ### onConsumeMouseMove

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onConsumeMouseMove(double dx,
    double dy,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseMove` in interface `zombie.ui.UIElementInterface`
  + ### onExtendMouseMoveOutside

    public void onExtendMouseMoveOutside(double dx,
    double dy,
    double x,
    double y)

    Specified by:
    :   `onExtendMouseMoveOutside` in interface `zombie.ui.UIElementInterface`
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`
  + ### isMouseOver

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isMouseOver()

    Specified by:
    :   `isMouseOver` in interface `zombie.ui.UIElementInterface`
  + ### isWantKeyEvents

    public boolean isWantKeyEvents()

    Specified by:
    :   `isWantKeyEvents` in interface `zombie.ui.UIElementInterface`
  + ### getRenderThisPlayerOnly

    public int getRenderThisPlayerOnly()

    Specified by:
    :   `getRenderThisPlayerOnly` in interface `zombie.ui.UIElementInterface`
  + ### onConsumeKeyPress

    public boolean onConsumeKeyPress(int key)

    Specified by:
    :   `onConsumeKeyPress` in interface `zombie.ui.UIElementInterface`
  + ### onConsumeKeyRepeat

    public boolean onConsumeKeyRepeat(int key)

    Specified by:
    :   `onConsumeKeyRepeat` in interface `zombie.ui.UIElementInterface`
  + ### onConsumeKeyRelease

    public boolean onConsumeKeyRelease(int key)

    Specified by:
    :   `onConsumeKeyRelease` in interface `zombie.ui.UIElementInterface`
  + ### isForceCursorVisible

    public boolean isForceCursorVisible()

    Specified by:
    :   `isForceCursorVisible` in interface `zombie.ui.UIElementInterface`
  + ### getLuaLocalPosition

    public se.krka.kahlua.vm.KahluaTable getLuaLocalPosition(double x,
    double y)
  + ### getLuaAbsolutePosition

    public se.krka.kahlua.vm.KahluaTable getLuaAbsolutePosition(double x,
    double y)
  + ### getLuaParentPosition

    public se.krka.kahlua.vm.KahluaTable getLuaParentPosition(double x,
    double y)
  + ### getParentNode

    public [AtomUI](AtomUI.html "class in zombie.ui") getParentNode()
  + ### setParentNode

    public void setParentNode([AtomUI](AtomUI.html "class in zombie.ui") parent)
  + ### addNode

    public void addNode([AtomUI](AtomUI.html "class in zombie.ui") el)
  + ### removeNode

    public void removeNode([AtomUI](AtomUI.html "class in zombie.ui") el)
  + ### getNodes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AtomUI](AtomUI.html "class in zombie.ui")> getNodes()
  + ### setPivotX

    public void setPivotX(double x)
  + ### getPivotX

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getPivotX()
  + ### setPivotY

    public void setPivotY(double y)
  + ### getPivotY

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getPivotY()
  + ### setAngle

    public void setAngle(double angle)
  + ### getAngle

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getAngle()
  + ### setScaleX

    public void setScaleX(double x)
  + ### getScaleX

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getScaleX()
  + ### setScaleY

    public void setScaleY(double y)
  + ### getScaleY

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getScaleY()
  + ### setColor

    public void setColor(double r,
    double g,
    double b,
    double a)
  + ### getColor

    public se.krka.kahlua.vm.KahluaTable getColor()
  + ### getTable

    public se.krka.kahlua.vm.KahluaTable getTable()
  + ### isEnabled

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isEnabled()
  + ### setEnabled

    public void setEnabled(boolean enabled)
  + ### setAlwaysOnTop

    public void setAlwaysOnTop(boolean value)
  + ### isAlwaysOnTop

    public boolean isAlwaysOnTop()

    Specified by:
    :   `isAlwaysOnTop` in interface `zombie.ui.UIElementInterface`
  + ### setBackMost

    public void setBackMost(boolean value)
  + ### isBackMost

    public boolean isBackMost()

    Specified by:
    :   `isBackMost` in interface `zombie.ui.UIElementInterface`
  + ### getUIName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUIName()
  + ### setUIName

    public void setUIName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### loadFromTable

    void loadFromTable()
  + ### updateInternalValues

    void updateInternalValues()
  + ### toLocalCoordinates

    double[] toLocalCoordinates(double x,
    double y)
  + ### getLocalPosition

    double[] getLocalPosition(double absoluteX,
    double absoluteY)
  + ### getAbsolutePosition

    double[] getAbsolutePosition(double localX,
    double localY)
  + ### isOverElementLocal

    boolean isOverElementLocal(double x,
    double y)
  + ### updateSize

    void updateSize()
  + ### onResize

    void onResize()
  + ### setStencilRect

    public void setStencilRect()
  + ### clearStencilRect

    public void clearStencilRect()
  + ### repaintStencilRect

    public void repaintStencilRect()
  + ### tryGetDouble

    double tryGetDouble([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    double defaultValue)
  + ### tryGetBoolean

    boolean tryGetBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    boolean defaultValue)
  + ### tryGetClosure

    se.krka.kahlua.vm.LuaClosure tryGetClosure([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### tryGetString

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tryGetString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue)