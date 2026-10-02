[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UIElement](UIElement.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tempcol](#tempcol)
   2. [toAdd](#toAdd)
   3. [white](#white)
   4. [stencilLevel](#stencilLevel)
   5. [capture](#capture)
   6. [ignoreLossControl](#ignoreLossControl)
   7. [clickedValue](#clickedValue)
   8. [controls](#controls)
   9. [defaultDraw](#defaultDraw)
   10. [followGameWorld](#followGameWorld)
   11. [renderThisPlayerOnly](#renderThisPlayerOnly)
   12. [height](#height)
   13. [parent](#parent)
   14. [visible](#visible)
   15. [width](#width)
   16. [x](#x)
   17. [y](#y)
   18. [table](#table)
   19. [alwaysBack](#alwaysBack)
   20. [scrollChildren](#scrollChildren)
   21. [scrollWithParent](#scrollWithParent)
   22. [renderClippedChildren](#renderClippedChildren)
   23. [anchorTop](#anchorTop)
   24. [anchorLeft](#anchorLeft)
   25. [anchorRight](#anchorRight)
   26. [anchorBottom](#anchorBottom)
   27. [playerContext](#playerContext)
   28. [alwaysOnTop](#alwaysOnTop)
   29. [maxDrawHeight](#maxDrawHeight)
   30. [yScroll](#yScroll)
   31. [xScroll](#xScroll)
   32. [scrollHeight](#scrollHeight)
   33. [lastheight](#lastheight)
   34. [lastwidth](#lastwidth)
   35. [resizeDirty](#resizeDirty)
   36. [enabled](#enabled)
   37. [toTop](#toTop)
   38. [consumeMouseEvents](#consumeMouseEvents)
   39. [leftDownTime](#leftDownTime)
   40. [clicked](#clicked)
   41. [clickX](#clickX)
   42. [clickY](#clickY)
   43. [uiname](#uiname)
   44. [wantKeyEvents](#wantKeyEvents)
   45. [wantExtraMouseEvents](#wantExtraMouseEvents)
   46. [forceCursorVisible](#forceCursorVisible)
   47. [circleTexture](#circleTexture)
   48. [shaderStarted](#shaderStarted)
6. [Constructor Details](#constructor-detail)
   1. [UIElement()](#%3Cinit%3E())
   2. [UIElement(KahluaTable)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable))
7. [Method Details](#method-detail)
   1. [getMaxDrawHeight()](#getMaxDrawHeight())
   2. [setMaxDrawHeight(double)](#setMaxDrawHeight(double))
   3. [clearMaxDrawHeight()](#clearMaxDrawHeight())
   4. [getXScroll()](#getXScroll())
   5. [setXScroll(double)](#setXScroll(double))
   6. [getYScroll()](#getYScroll())
   7. [setYScroll(double)](#setYScroll(double))
   8. [invokeOnScrollPosChanged()](#invokeOnScrollPosChanged())
   9. [setAlwaysOnTop(boolean)](#setAlwaysOnTop(boolean))
   10. [isAlwaysOnTop()](#isAlwaysOnTop())
   11. [backMost()](#backMost())
   12. [isBackMost()](#isBackMost())
   13. [AddChild(UIElement)](#AddChild(zombie.ui.UIElement))
   14. [RemoveChild(UIElement)](#RemoveChild(zombie.ui.UIElement))
   15. [getScrollHeight()](#getScrollHeight())
   16. [setScrollHeight(double)](#setScrollHeight(double))
   17. [isConsumeMouseEvents()](#isConsumeMouseEvents())
   18. [setConsumeMouseEvents(boolean)](#setConsumeMouseEvents(boolean))
   19. [ClearChildren()](#ClearChildren())
   20. [ButtonClicked(String)](#ButtonClicked(java.lang.String))
   21. [DrawText(UIFont, String, double, double, double, double, double, double, double)](#DrawText(zombie.ui.UIFont,java.lang.String,double,double,double,double,double,double,double))
   22. [DrawText(String, double, double, double, double, double, double)](#DrawText(java.lang.String,double,double,double,double,double,double))
   23. [DrawText(String, double, double, double, double, double, double, double, double)](#DrawText(java.lang.String,double,double,double,double,double,double,double,double))
   24. [DrawText(UIFont, String, double, double, double, double, double, double)](#DrawText(zombie.ui.UIFont,java.lang.String,double,double,double,double,double,double))
   25. [DrawTextUntrimmed(UIFont, String, double, double, double, double, double, double)](#DrawTextUntrimmed(zombie.ui.UIFont,java.lang.String,double,double,double,double,double,double))
   26. [DrawTextCentre(String, double, double, double, double, double, double)](#DrawTextCentre(java.lang.String,double,double,double,double,double,double))
   27. [DrawTextCentre(UIFont, String, double, double, double, double, double, double)](#DrawTextCentre(zombie.ui.UIFont,java.lang.String,double,double,double,double,double,double))
   28. [DrawTextRight(String, double, double, double, double, double, double)](#DrawTextRight(java.lang.String,double,double,double,double,double,double))
   29. [DrawTextRight(UIFont, String, double, double, double, double, double, double)](#DrawTextRight(zombie.ui.UIFont,java.lang.String,double,double,double,double,double,double))
   30. [drawTextWithBackground(UIFont, String, double, double, double, double, double, double, double, double, double, double, double, double)](#drawTextWithBackground(zombie.ui.UIFont,java.lang.String,double,double,double,double,double,double,double,double,double,double,double,double))
   31. [DrawTextureAngle(Texture, double, double, double, double, double, double, double)](#DrawTextureAngle(zombie.core.textures.Texture,double,double,double,double,double,double,double))
   32. [DrawTextureAngle(Texture, double, double, double)](#DrawTextureAngle(zombie.core.textures.Texture,double,double,double))
   33. [DrawTexture(Texture, double, double, double, double, double, double, double, double, double, double, double, double)](#DrawTexture(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,double,double,double,double))
   34. [DrawTexture(Texture, double, double, double)](#DrawTexture(zombie.core.textures.Texture,double,double,double))
   35. [DrawTextureCol(Texture, double, double, Color)](#DrawTextureCol(zombie.core.textures.Texture,double,double,zombie.core.Color))
   36. [DrawTextureScaled(Texture, double, double, double, double, double)](#DrawTextureScaled(zombie.core.textures.Texture,double,double,double,double,double))
   37. [DrawTextureScaledUniform(Texture, double, double, double, double, double, double, double)](#DrawTextureScaledUniform(zombie.core.textures.Texture,double,double,double,double,double,double,double))
   38. [DrawTextureScaledAspect(Texture, double, double, double, double, double, double, double, double)](#DrawTextureScaledAspect(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   39. [DrawTextureScaledAspect2(Texture, double, double, double, double, double, double, double, double)](#DrawTextureScaledAspect2(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   40. [DrawTextureScaledAspect3(Texture, double, double, double, double, double, double, double, double)](#DrawTextureScaledAspect3(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   41. [DrawTextureScaledCol(Texture, double, double, double, double, double, double, double, double)](#DrawTextureScaledCol(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   42. [DrawTextureScaledCol(Texture, double, double, double, double, Color)](#DrawTextureScaledCol(zombie.core.textures.Texture,double,double,double,double,zombie.core.Color))
   43. [DrawTextureScaledColor(Texture, Double, Double, Double, Double, Double, Double, Double, Double)](#DrawTextureScaledColor(zombie.core.textures.Texture,java.lang.Double,java.lang.Double,java.lang.Double,java.lang.Double,java.lang.Double,java.lang.Double,java.lang.Double,java.lang.Double))
   44. [DrawTextureColor(Texture, double, double, double, double, double, double)](#DrawTextureColor(zombie.core.textures.Texture,double,double,double,double,double,double))
   45. [DrawLine(Texture, double, double, double, double, float, double, double, double, double)](#DrawLine(zombie.core.textures.Texture,double,double,double,double,float,double,double,double,double))
   46. [DrawPolygon(Texture, double, double, double, double, double, double, double, double, double, double, double, double)](#DrawPolygon(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,double,double,double,double))
   47. [DrawItemIcon(InventoryItem, double, double, double, double, double)](#DrawItemIcon(zombie.inventory.InventoryItem,double,double,double,double,double))
   48. [DrawScriptItemIcon(Item, double, double, double, double, double)](#DrawScriptItemIcon(zombie.scripting.objects.Item,double,double,double,double,double))
   49. [DrawTextureIcon(Texture, double, double, double, double, double, double, double, double)](#DrawTextureIcon(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   50. [DrawTextureIconMask(Texture, double, double, double, double, double, double, double, double, double)](#DrawTextureIconMask(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,double))
   51. [DrawTexturePercentage(Texture, double, double, double, double, double, double, double, double, double)](#DrawTexturePercentage(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,double))
   52. [DrawTexturePercentageBottomUp(Texture, double, double, double, double, double, double, double, double, double)](#DrawTexturePercentageBottomUp(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,double))
   53. [DrawSubTextureRGBA(Texture, double, double, double, double, double, double, double, double, double, double, double, double)](#DrawSubTextureRGBA(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,double,double,double,double))
   54. [DrawTextureTiled(Texture, double, double, double, double, double, double, double, double)](#DrawTextureTiled(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   55. [DrawTextureTiledX(Texture, double, double, double, double, double, double, double, double)](#DrawTextureTiledX(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   56. [DrawTextureTiledY(Texture, double, double, double, double, double, double, double, double)](#DrawTextureTiledY(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   57. [DrawTextureTiledYOffset(Texture, double, double, double, double, double, double, double, double)](#DrawTextureTiledYOffset(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   58. [DrawTextureIgnoreOffset(Texture, double, double, int, int, Color)](#DrawTextureIgnoreOffset(zombie.core.textures.Texture,double,double,int,int,zombie.core.Color))
   59. [DrawTexture\_FlippedX(Texture, double, double, int, int, Color)](#DrawTexture_FlippedX(zombie.core.textures.Texture,double,double,int,int,zombie.core.Color))
   60. [DrawTexture\_FlippedXIgnoreOffset(Texture, double, double, int, int, Color)](#DrawTexture_FlippedXIgnoreOffset(zombie.core.textures.Texture,double,double,int,int,zombie.core.Color))
   61. [DrawUVSliceTexture(Texture, double, double, double, double, Color, double, double, double, double)](#DrawUVSliceTexture(zombie.core.textures.Texture,double,double,double,double,zombie.core.Color,double,double,double,double))
   62. [getScrollChildren()](#getScrollChildren())
   63. [setScrollChildren(boolean)](#setScrollChildren(boolean))
   64. [getScrollWithParent()](#getScrollWithParent())
   65. [setScrollWithParent(boolean)](#setScrollWithParent(boolean))
   66. [setRenderClippedChildren(boolean)](#setRenderClippedChildren(boolean))
   67. [getAbsoluteX()](#getAbsoluteX())
   68. [getAbsoluteY()](#getAbsoluteY())
   69. [getClickedValue()](#getClickedValue())
   70. [setClickedValue(String)](#setClickedValue(java.lang.String))
   71. [bringToTop()](#bringToTop())
   72. [onRightMouseUpOutside(double, double)](#onRightMouseUpOutside(double,double))
   73. [onRightMouseDownOutside(double, double)](#onRightMouseDownOutside(double,double))
   74. [onMouseUpOutside(double, double)](#onMouseUpOutside(double,double))
   75. [onMouseDownOutside(double, double)](#onMouseDownOutside(double,double))
   76. [onMouseDown(double, double)](#onMouseDown(double,double))
   77. [onMouseDoubleClick(double, double)](#onMouseDoubleClick(double,double))
   78. [onConsumeMouseWheel(double, double, double)](#onConsumeMouseWheel(double,double,double))
   79. [onMouseWheel(double)](#onMouseWheel(double))
   80. [onConsumeMouseMove(double, double, double, double)](#onConsumeMouseMove(double,double,double,double))
   81. [onMouseMove(double, double)](#onMouseMove(double,double))
   82. [toString()](#toString())
   83. [onExtendMouseMoveOutside(double, double, double, double)](#onExtendMouseMoveOutside(double,double,double,double))
   84. [onMouseMoveOutside(double, double)](#onMouseMoveOutside(double,double))
   85. [onMouseUp(double, double)](#onMouseUp(double,double))
   86. [onMouseButtonDown(int, double, double)](#onMouseButtonDown(int,double,double))
   87. [onConsumeMouseButtonDown(int, double, double)](#onConsumeMouseButtonDown(int,double,double))
   88. [onMouseButtonDownOutside(int, double, double)](#onMouseButtonDownOutside(int,double,double))
   89. [onConsumeMouseButtonUp(int, double, double)](#onConsumeMouseButtonUp(int,double,double))
   90. [onMouseButtonUpOutside(int, double, double)](#onMouseButtonUpOutside(int,double,double))
   91. [onresize()](#onresize())
   92. [onResize()](#onResize())
   93. [onRightMouseDown(double, double)](#onRightMouseDown(double,double))
   94. [onRightMouseUp(double, double)](#onRightMouseUp(double,double))
   95. [RemoveControl(UIElement)](#RemoveControl(zombie.ui.UIElement))
   96. [render()](#render())
   97. [update()](#update())
   98. [BringToTop(UIElement)](#BringToTop(zombie.ui.UIElement))
   99. [isCapture()](#isCapture())
   100. [setCapture(boolean)](#setCapture(boolean))
   101. [isModalVisible()](#isModalVisible())
   102. [isIgnoreLossControl()](#isIgnoreLossControl())
   103. [setIgnoreLossControl(boolean)](#setIgnoreLossControl(boolean))
   104. [getControls()](#getControls())
   105. [setControls(Vector)](#setControls(java.util.Vector))
   106. [isDefaultDraw()](#isDefaultDraw())
   107. [setDefaultDraw(boolean)](#setDefaultDraw(boolean))
   108. [isFollowGameWorld()](#isFollowGameWorld())
   109. [setFollowGameWorld(boolean)](#setFollowGameWorld(boolean))
   110. [getRenderThisPlayerOnly()](#getRenderThisPlayerOnly())
   111. [setRenderThisPlayerOnly(int)](#setRenderThisPlayerOnly(int))
   112. [getHeight()](#getHeight())
   113. [setHeight(double)](#setHeight(double))
   114. [getParent()](#getParent())
   115. [setParent(UIElement)](#setParent(zombie.ui.UIElement))
   116. [isVisible()](#isVisible())
   117. [setVisible(boolean)](#setVisible(boolean))
   118. [isReallyVisible()](#isReallyVisible())
   119. [getWidth()](#getWidth())
   120. [setWidth(double)](#setWidth(double))
   121. [getX()](#getX())
   122. [setX(double)](#setX(double))
   123. [getXScrolled(UIElement)](#getXScrolled(zombie.ui.UIElement))
   124. [getYScrolled(UIElement)](#getYScrolled(zombie.ui.UIElement))
   125. [isEnabled()](#isEnabled())
   126. [setEnabled(boolean)](#setEnabled(boolean))
   127. [getY()](#getY())
   128. [setY(double)](#setY(double))
   129. [isOverElement(double, double)](#isOverElement(double,double))
   130. [suspendStencil()](#suspendStencil())
   131. [resumeStencil()](#resumeStencil())
   132. [setStencilRect(double, double, double, double)](#setStencilRect(double,double,double,double))
   133. [setStencilCircle(double, double, double, double)](#setStencilCircle(double,double,double,double))
   134. [clearStencilRect()](#clearStencilRect())
   135. [repaintStencilRect(double, double, double, double)](#repaintStencilRect(double,double,double,double))
   136. [getTable()](#getTable())
   137. [setTable(KahluaTable)](#setTable(se.krka.kahlua.vm.KahluaTable))
   138. [setHeightSilent(double)](#setHeightSilent(double))
   139. [setWidthSilent(double)](#setWidthSilent(double))
   140. [setHeightOnly(double)](#setHeightOnly(double))
   141. [setWidthOnly(double)](#setWidthOnly(double))
   142. [isAnchorTop()](#isAnchorTop())
   143. [setAnchorTop(boolean)](#setAnchorTop(boolean))
   144. [ignoreWidthChange()](#ignoreWidthChange())
   145. [ignoreHeightChange()](#ignoreHeightChange())
   146. [isAnchorLeft()](#isAnchorLeft())
   147. [setAnchorLeft(boolean)](#setAnchorLeft(boolean))
   148. [isAnchorRight()](#isAnchorRight())
   149. [setAnchorRight(boolean)](#setAnchorRight(boolean))
   150. [isAnchorBottom()](#isAnchorBottom())
   151. [setAnchorBottom(boolean)](#setAnchorBottom(boolean))
   152. [addBringToTop(UIElement)](#addBringToTop(zombie.ui.UIElement))
   153. [getPlayerContext()](#getPlayerContext())
   154. [setPlayerContext(int)](#setPlayerContext(int))
   155. [getUIName()](#getUIName())
   156. [setUIName(String)](#setUIName(java.lang.String))
   157. [clampToParentX(double)](#clampToParentX(double))
   158. [clampToParentY(double)](#clampToParentY(double))
   159. [isPointOver(double, double)](#isPointOver(double,double))
   160. [isMouseOver()](#isMouseOver())
   161. [tryGetTableValue(String)](#tryGetTableValue(java.lang.String))
   162. [setWantKeyEvents(boolean)](#setWantKeyEvents(boolean))
   163. [isWantKeyEvents()](#isWantKeyEvents())
   164. [setWantExtraMouseEvents(boolean)](#setWantExtraMouseEvents(boolean))
   165. [isWantExtraMouseEvents()](#isWantExtraMouseEvents())
   166. [isKeyConsumed(int)](#isKeyConsumed(int))
   167. [onConsumeKeyPress(int)](#onConsumeKeyPress(int))
   168. [onKeyPress(int)](#onKeyPress(int))
   169. [onConsumeKeyRepeat(int)](#onConsumeKeyRepeat(int))
   170. [onKeyRepeat(int)](#onKeyRepeat(int))
   171. [onConsumeKeyRelease(int)](#onConsumeKeyRelease(int))
   172. [onKeyRelease(int)](#onKeyRelease(int))
   173. [isForceCursorVisible()](#isForceCursorVisible())
   174. [setForceCursorVisible(boolean)](#setForceCursorVisible(boolean))
   175. [StartOutline(Texture, float, float, float, float, float)](#StartOutline(zombie.core.textures.Texture,float,float,float,float,float))
   176. [EndOutline()](#EndOutline())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UIElement
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.UIElement

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

Direct Known Subclasses:
:   `ActionProgressBar, Clock, zombie.ui.HUDButton, MoodlesUI, zombie.ui.NewWindow, ObjectTooltip, RadarPanel, RadialMenu, RadialProgressBar, SpeedControls, UI_BodyPart, UI3DModel, UI3DScene, UITextBox2, VehicleGauge`

---

public class UIElement
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.ui.UIElementInterface

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `alwaysBack`

  `boolean`

  `alwaysOnTop`

  `boolean`

  `anchorBottom`

  `boolean`

  `anchorLeft`

  `boolean`

  `anchorRight`

  `boolean`

  `anchorTop`

  `boolean`

  `capture`

  `private static Texture`

  `circleTexture`

  `private boolean`

  `clicked`

  `String`

  `clickedValue`

  `private double`

  `clickX`

  `private double`

  `clickY`

  `private boolean`

  `consumeMouseEvents`

  `final ArrayList<UIElement>`

  `controls`

  `boolean`

  `defaultDraw`

  `(package private) boolean`

  `enabled`

  `boolean`

  `followGameWorld`

  `private boolean`

  `forceCursorVisible`

  `float`

  `height`

  `boolean`

  `ignoreLossControl`

  `(package private) double`

  `lastheight`

  `(package private) double`

  `lastwidth`

  `private long`

  `leftDownTime`

  `int`

  `maxDrawHeight`

  `UIElement`

  `parent`

  `int`

  `playerContext`

  `private boolean`

  `renderClippedChildren`

  `private int`

  `renderThisPlayerOnly`

  `(package private) boolean`

  `resizeDirty`

  `boolean`

  `scrollChildren`

  `(package private) int`

  `scrollHeight`

  `boolean`

  `scrollWithParent`

  `private boolean`

  `shaderStarted`

  `(package private) static int`

  `stencilLevel`

  `se.krka.kahlua.vm.KahluaTable`

  `table`

  `(package private) static final Color`

  `tempcol`

  `(package private) static final ArrayList<UIElement>`

  `toAdd`

  `private final ArrayList<UIElement>`

  `toTop`

  `private String`

  `uiname`

  `boolean`

  `visible`

  `private boolean`

  `wantExtraMouseEvents`

  `private boolean`

  `wantKeyEvents`

  `(package private) static Texture`

  `white`

  `float`

  `width`

  `double`

  `x`

  `(package private) Double`

  `xScroll`

  `double`

  `y`

  `(package private) Double`

  `yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UIElement()`

  `UIElement(se.krka.kahlua.vm.KahluaTable table)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addBringToTop(UIElement aThis)`

  `void`

  `AddChild(UIElement el)`

  `void`

  `backMost()`

  `void`

  `bringToTop()`

  `void`

  `BringToTop(UIElement el)`

  `void`

  `ButtonClicked(String name)`

  `Double`

  `clampToParentX(double x)`

  `Double`

  `clampToParentY(double y)`

  `void`

  `ClearChildren()`

  `void`

  `clearMaxDrawHeight()`

  `void`

  `clearStencilRect()`

  `void`

  `DrawItemIcon(InventoryItem item,
  double x,
  double y,
  double alpha,
  double width,
  double height)`

  `void`

  `DrawLine(Texture tex,
  double x1,
  double y1,
  double x2,
  double y2,
  float thickness,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawPolygon(Texture tex,
  double x1,
  double y1,
  double x2,
  double y2,
  double x3,
  double y3,
  double x4,
  double y4,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawScriptItemIcon(Item scriptItem,
  double x,
  double y,
  double alpha,
  double width,
  double height)`

  `void`

  `DrawSubTextureRGBA(Texture tex,
  double subX,
  double subY,
  double subW,
  double subH,
  double x,
  double y,
  double w,
  double h,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawText(String text,
  double x,
  double y,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawText(String text,
  double x,
  double y,
  double width,
  double height,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawText(UIFont font,
  String text,
  double x,
  double y,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawText(UIFont font,
  String text,
  double x,
  double y,
  double zoom,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextCentre(String text,
  double x,
  double y,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextCentre(UIFont font,
  String text,
  double x,
  double y,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextRight(String text,
  double x,
  double y,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextRight(UIFont font,
  String text,
  double x,
  double y,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextUntrimmed(UIFont font,
  String text,
  double x,
  double y,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTexture(Texture tex,
  double x,
  double y,
  double alpha)`

  `void`

  `DrawTexture(Texture tex,
  double tlx,
  double tly,
  double trx,
  double try2,
  double brx,
  double bry,
  double blx,
  double bly,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawTexture_FlippedX(Texture tex,
  double x,
  double y,
  int width,
  int height,
  Color col)`

  `void`

  `DrawTexture_FlippedXIgnoreOffset(Texture tex,
  double x,
  double y,
  int width,
  int height,
  Color col)`

  `void`

  `DrawTextureAngle(Texture tex,
  double centerX,
  double centerY,
  double angle)`

  `void`

  `DrawTextureAngle(Texture tex,
  double centerX,
  double centerY,
  double angle,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawTextureCol(Texture tex,
  double x,
  double y,
  Color col)`

  `void`

  `DrawTextureColor(Texture tex,
  double x,
  double y,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawTextureIcon(Texture tex,
  double x,
  double y,
  double width,
  double height,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextureIconMask(Texture tex,
  double yRatio,
  double x,
  double y,
  double width,
  double height,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextureIgnoreOffset(Texture tex,
  double x,
  double y,
  int width,
  int height,
  Color col)`

  `void`

  `DrawTexturePercentage(Texture tex,
  double yRatio,
  double x,
  double y,
  double width,
  double height,
  double r,
  double g,
  double b,
  double alpha)`

  Draws a texture starting at the left up until a percentage, defined by 'yRatio', of the total width.

  `void`

  `DrawTexturePercentageBottomUp(Texture tex,
  double yRatio,
  double x,
  double y,
  double width,
  double height,
  double r,
  double g,
  double b,
  double alpha)`

  Draws a texture starting at the bottom up until a percentage, defined by 'yRatio', of the total height.

  `void`

  `DrawTextureScaled(Texture tex,
  double x,
  double y,
  double width,
  double height,
  double alpha)`

  `void`

  `DrawTextureScaledAspect(Texture tex,
  double x,
  double y,
  double width,
  double height,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextureScaledAspect2(Texture tex,
  double x,
  double y,
  double width,
  double height,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextureScaledAspect3(Texture tex,
  double x,
  double y,
  double width,
  double height,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextureScaledCol(Texture tex,
  double x,
  double y,
  double width,
  double height,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawTextureScaledCol(Texture tex,
  double x,
  double y,
  double width,
  double height,
  Color col)`

  `void`

  `DrawTextureScaledColor(Texture tex,
  Double x,
  Double y,
  Double width,
  Double height,
  Double r,
  Double g,
  Double b,
  Double a)`

  `void`

  `DrawTextureScaledUniform(Texture tex,
  double x,
  double y,
  double scale,
  double r,
  double g,
  double b,
  double alpha)`

  `void`

  `DrawTextureTiled(Texture tex,
  double x,
  double y,
  double w,
  double h,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawTextureTiledX(Texture tex,
  double x,
  double y,
  double w,
  double h,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawTextureTiledY(Texture tex,
  double x,
  double y,
  double w,
  double h,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawTextureTiledYOffset(Texture tex,
  double x,
  double y,
  double w,
  double h,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `drawTextWithBackground(UIFont font,
  String text,
  double x,
  double y,
  double r,
  double g,
  double b,
  double a,
  double padX,
  double padY,
  double bgR,
  double bgG,
  double bgB,
  double bgA)`

  `void`

  `DrawUVSliceTexture(Texture tex,
  double x,
  double y,
  double width,
  double height,
  Color col,
  double xStart,
  double yStart,
  double xEnd,
  double yEnd)`

  `void`

  `EndOutline()`

  `Double`

  `getAbsoluteX()`

  `Double`

  `getAbsoluteY()`

  `String`

  `getClickedValue()`

  `ArrayList<UIElement>`

  `getControls()`

  `Double`

  `getHeight()`

  `Double`

  `getMaxDrawHeight()`

  `UIElement`

  `getParent()`

  `int`

  `getPlayerContext()`

  `int`

  `getRenderThisPlayerOnly()`

  `Boolean`

  `getScrollChildren()`

  `Double`

  `getScrollHeight()`

  `Boolean`

  `getScrollWithParent()`

  `se.krka.kahlua.vm.KahluaTable`

  `getTable()`

  `String`

  `getUIName()`

  `Double`

  `getWidth()`

  `Double`

  `getX()`

  `Double`

  `getXScroll()`

  `Double`

  `getXScrolled(UIElement parent)`

  `Double`

  `getY()`

  `Double`

  `getYScroll()`

  `Double`

  `getYScrolled(UIElement parent)`

  `void`

  `ignoreHeightChange()`

  `void`

  `ignoreWidthChange()`

  `private void`

  `invokeOnScrollPosChanged()`

  `boolean`

  `isAlwaysOnTop()`

  `Boolean`

  `isAnchorBottom()`

  `Boolean`

  `isAnchorLeft()`

  `Boolean`

  `isAnchorRight()`

  `boolean`

  `isAnchorTop()`

  `boolean`

  `isBackMost()`

  `Boolean`

  `isCapture()`

  `boolean`

  `isConsumeMouseEvents()`

  `Boolean`

  `isDefaultDraw()`

  `boolean`

  `isEnabled()`

  `Boolean`

  `isFollowGameWorld()`

  `boolean`

  `isForceCursorVisible()`

  `Boolean`

  `isIgnoreLossControl()`

  `boolean`

  `isKeyConsumed(int key)`

  `boolean`

  `isModalVisible()`

  `Boolean`

  `isMouseOver()`

  `boolean`

  `isOverElement(double mx,
  double my)`

  `Boolean`

  `isPointOver(double screenX,
  double screenY)`

  `boolean`

  `isReallyVisible()`

  `Boolean`

  `isVisible()`

  `boolean`

  `isWantExtraMouseEvents()`

  `boolean`

  `isWantKeyEvents()`

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

  `onKeyPress(int key)`

  `void`

  `onKeyRelease(int key)`

  `void`

  `onKeyRepeat(int key)`

  `void`

  `onMouseButtonDown(int btn,
  double x,
  double y)`

  Sends all mouse clicks on an element (not triggered when clicking on child controls)
  If bWantExtraMouseEvents is true, then any mouse clicks on this element will trigger the onMouseButtonDown lua
  method (if it exists).

  `void`

  `onMouseButtonDownOutside(int btn,
  double x,
  double y)`

  `void`

  `onMouseButtonUpOutside(int btn,
  double x,
  double y)`

  `private Boolean`

  `onMouseDoubleClick(double x2,
  double y2)`

  `Boolean`

  `onMouseDown(double x,
  double y)`

  `(package private) void`

  `onMouseDownOutside(double x,
  double y)`

  `Boolean`

  `onMouseMove(double dx,
  double dy)`

  `void`

  `onMouseMoveOutside(double dx,
  double dy)`

  `Boolean`

  `onMouseUp(double x,
  double y)`

  `void`

  `onMouseUpOutside(double x,
  double y)`

  `Boolean`

  `onMouseWheel(double del)`

  `void`

  `onresize()`

  `void`

  `onResize()`

  `Boolean`

  `onRightMouseDown(double x,
  double y)`

  `(package private) void`

  `onRightMouseDownOutside(double x,
  double y)`

  `Boolean`

  `onRightMouseUp(double x,
  double y)`

  `(package private) void`

  `onRightMouseUpOutside(double x,
  double y)`

  `void`

  `RemoveChild(UIElement el)`

  `void`

  `RemoveControl(UIElement el)`

  `void`

  `render()`

  `void`

  `repaintStencilRect(double x,
  double y,
  double width,
  double height)`

  `void`

  `resumeStencil()`

  `void`

  `setAlwaysOnTop(boolean b)`

  `void`

  `setAnchorBottom(boolean anchorBottom)`

  `void`

  `setAnchorLeft(boolean anchorLeft)`

  `void`

  `setAnchorRight(boolean anchorRight)`

  `void`

  `setAnchorTop(boolean anchorTop)`

  `void`

  `setCapture(boolean capture)`

  `void`

  `setClickedValue(String clickedValue)`

  `void`

  `setConsumeMouseEvents(boolean bConsume)`

  `void`

  `setControls(Vector<UIElement> controls)`

  `void`

  `setDefaultDraw(boolean defaultDraw)`

  `void`

  `setEnabled(boolean en)`

  `void`

  `setFollowGameWorld(boolean followGameWorld)`

  `void`

  `setForceCursorVisible(boolean force)`

  `void`

  `setHeight(double height)`

  `void`

  `setHeightOnly(double height)`

  `void`

  `setHeightSilent(double height)`

  `void`

  `setIgnoreLossControl(boolean ignoreLossControl)`

  `void`

  `setMaxDrawHeight(double height)`

  `void`

  `setParent(UIElement parent)`

  `void`

  `setPlayerContext(int nPlayer)`

  `void`

  `setRenderClippedChildren(boolean b)`

  `void`

  `setRenderThisPlayerOnly(int playerIndex)`

  `void`

  `setScrollChildren(boolean bScroll)`

  `void`

  `setScrollHeight(double h)`

  `void`

  `setScrollWithParent(boolean bScroll)`

  `void`

  `setStencilCircle(double x,
  double y,
  double width,
  double height)`

  `void`

  `setStencilRect(double x,
  double y,
  double width,
  double height)`

  `void`

  `setTable(se.krka.kahlua.vm.KahluaTable table)`

  `void`

  `setUIName(String name)`

  `void`

  `setVisible(boolean visible)`

  `void`

  `setWantExtraMouseEvents(boolean want)`

  `void`

  `setWantKeyEvents(boolean want)`

  `void`

  `setWidth(double width)`

  `void`

  `setWidthOnly(double width)`

  `void`

  `setWidthSilent(double width)`

  `void`

  `setX(double x)`

  `void`

  `setXScroll(double x)`

  `void`

  `setY(double y)`

  `void`

  `setYScroll(double y)`

  `void`

  `StartOutline(Texture tex,
  float outlineThickness,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `suspendStencil()`

  `String`

  `toString()`

  `protected Object`

  `tryGetTableValue(String key)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### tempcol

    static final [Color](../core/Color.html "class in zombie.core") tempcol
  + ### toAdd

    static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UIElement](UIElement.html "class in zombie.ui")> toAdd
  + ### white

    static [Texture](../core/textures/Texture.html "class in zombie.core.textures") white
  + ### stencilLevel

    static int stencilLevel
  + ### capture

    public boolean capture
  + ### ignoreLossControl

    public boolean ignoreLossControl
  + ### clickedValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clickedValue
  + ### controls

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UIElement](UIElement.html "class in zombie.ui")> controls
  + ### defaultDraw

    public boolean defaultDraw
  + ### followGameWorld

    public boolean followGameWorld
  + ### renderThisPlayerOnly

    private int renderThisPlayerOnly
  + ### height

    public float height
  + ### parent

    public [UIElement](UIElement.html "class in zombie.ui") parent
  + ### visible

    public boolean visible
  + ### width

    public float width
  + ### x

    public double x
  + ### y

    public double y
  + ### table

    public se.krka.kahlua.vm.KahluaTable table
  + ### alwaysBack

    public boolean alwaysBack
  + ### scrollChildren

    public boolean scrollChildren
  + ### scrollWithParent

    public boolean scrollWithParent
  + ### renderClippedChildren

    private boolean renderClippedChildren
  + ### anchorTop

    public boolean anchorTop
  + ### anchorLeft

    public boolean anchorLeft
  + ### anchorRight

    public boolean anchorRight
  + ### anchorBottom

    public boolean anchorBottom
  + ### playerContext

    public int playerContext
  + ### alwaysOnTop

    public boolean alwaysOnTop
  + ### maxDrawHeight

    public int maxDrawHeight
  + ### yScroll

    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") yScroll
  + ### xScroll

    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") xScroll
  + ### scrollHeight

    int scrollHeight
  + ### lastheight

    double lastheight
  + ### lastwidth

    double lastwidth
  + ### resizeDirty

    boolean resizeDirty
  + ### enabled

    boolean enabled
  + ### toTop

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UIElement](UIElement.html "class in zombie.ui")> toTop
  + ### consumeMouseEvents

    private boolean consumeMouseEvents
  + ### leftDownTime

    private long leftDownTime
  + ### clicked

    private boolean clicked
  + ### clickX

    private double clickX
  + ### clickY

    private double clickY
  + ### uiname

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") uiname
  + ### wantKeyEvents

    private boolean wantKeyEvents
  + ### wantExtraMouseEvents

    private boolean wantExtraMouseEvents
  + ### forceCursorVisible

    private boolean forceCursorVisible
  + ### circleTexture

    private static [Texture](../core/textures/Texture.html "class in zombie.core.textures") circleTexture
  + ### shaderStarted

    private boolean shaderStarted
* Constructor Details
  -------------------

  + ### UIElement

    public UIElement()
  + ### UIElement

    public UIElement(se.krka.kahlua.vm.KahluaTable table)
* Method Details
  --------------

  + ### getMaxDrawHeight

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getMaxDrawHeight()

    Specified by:
    :   `getMaxDrawHeight` in interface `zombie.ui.UIElementInterface`
  + ### setMaxDrawHeight

    public void setMaxDrawHeight(double height)
  + ### clearMaxDrawHeight

    public void clearMaxDrawHeight()
  + ### getXScroll

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getXScroll()
  + ### setXScroll

    public void setXScroll(double x)
  + ### getYScroll

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getYScroll()
  + ### setYScroll

    public void setYScroll(double y)
  + ### invokeOnScrollPosChanged

    private void invokeOnScrollPosChanged()
  + ### setAlwaysOnTop

    public void setAlwaysOnTop(boolean b)
  + ### isAlwaysOnTop

    public boolean isAlwaysOnTop()

    Specified by:
    :   `isAlwaysOnTop` in interface `zombie.ui.UIElementInterface`
  + ### backMost

    public void backMost()
  + ### isBackMost

    public boolean isBackMost()

    Specified by:
    :   `isBackMost` in interface `zombie.ui.UIElementInterface`
  + ### AddChild

    public void AddChild([UIElement](UIElement.html "class in zombie.ui") el)
  + ### RemoveChild

    public void RemoveChild([UIElement](UIElement.html "class in zombie.ui") el)
  + ### getScrollHeight

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getScrollHeight()
  + ### setScrollHeight

    public void setScrollHeight(double h)
  + ### isConsumeMouseEvents

    public boolean isConsumeMouseEvents()
  + ### setConsumeMouseEvents

    public void setConsumeMouseEvents(boolean bConsume)
  + ### ClearChildren

    public void ClearChildren()
  + ### ButtonClicked

    public void ButtonClicked([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### DrawText

    public void DrawText([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double zoom,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawText

    public void DrawText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawText

    public void DrawText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double width,
    double height,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawText

    public void DrawText([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextUntrimmed

    public void DrawTextUntrimmed([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextCentre

    public void DrawTextCentre([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextCentre

    public void DrawTextCentre([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextRight

    public void DrawTextRight([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextRight

    public void DrawTextRight([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)
  + ### drawTextWithBackground

    public void drawTextWithBackground([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double a,
    double padX,
    double padY,
    double bgR,
    double bgG,
    double bgB,
    double bgA)
  + ### DrawTextureAngle

    public void DrawTextureAngle([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double centerX,
    double centerY,
    double angle,
    double r,
    double g,
    double b,
    double a)
  + ### DrawTextureAngle

    public void DrawTextureAngle([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double centerX,
    double centerY,
    double angle)
  + ### DrawTexture

    public void DrawTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double tlx,
    double tly,
    double trx,
    double try2,
    double brx,
    double bry,
    double blx,
    double bly,
    double r,
    double g,
    double b,
    double a)
  + ### DrawTexture

    public void DrawTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double alpha)
  + ### DrawTextureCol

    public void DrawTextureCol([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    [Color](../core/Color.html "class in zombie.core") col)
  + ### DrawTextureScaled

    public void DrawTextureScaled([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    double alpha)
  + ### DrawTextureScaledUniform

    public void DrawTextureScaledUniform([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double scale,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextureScaledAspect

    public void DrawTextureScaledAspect([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextureScaledAspect2

    public void DrawTextureScaledAspect2([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextureScaledAspect3

    public void DrawTextureScaledAspect3([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextureScaledCol

    public void DrawTextureScaledCol([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    double r,
    double g,
    double b,
    double a)
  + ### DrawTextureScaledCol

    public void DrawTextureScaledCol([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    [Color](../core/Color.html "class in zombie.core") col)
  + ### DrawTextureScaledColor

    public void DrawTextureScaledColor([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") x,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") y,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") width,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") height,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") r,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") g,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") b,
    [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") a)
  + ### DrawTextureColor

    public void DrawTextureColor([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double r,
    double g,
    double b,
    double a)
  + ### DrawLine

    public void DrawLine([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x1,
    double y1,
    double x2,
    double y2,
    float thickness,
    double r,
    double g,
    double b,
    double a)
  + ### DrawPolygon

    public void DrawPolygon([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
    double x4,
    double y4,
    double r,
    double g,
    double b,
    double a)
  + ### DrawItemIcon

    public void DrawItemIcon([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    double x,
    double y,
    double alpha,
    double width,
    double height)
  + ### DrawScriptItemIcon

    public void DrawScriptItemIcon([Item](../scripting/objects/Item.html "class in zombie.scripting.objects") scriptItem,
    double x,
    double y,
    double alpha,
    double width,
    double height)
  + ### DrawTextureIcon

    public void DrawTextureIcon([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTextureIconMask

    public void DrawTextureIconMask([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double yRatio,
    double x,
    double y,
    double width,
    double height,
    double r,
    double g,
    double b,
    double alpha)
  + ### DrawTexturePercentage

    public void DrawTexturePercentage([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double yRatio,
    double x,
    double y,
    double width,
    double height,
    double r,
    double g,
    double b,
    double alpha)

    Draws a texture starting at the left up until a percentage, defined by 'yRatio', of the total width.
  + ### DrawTexturePercentageBottomUp

    public void DrawTexturePercentageBottomUp([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double yRatio,
    double x,
    double y,
    double width,
    double height,
    double r,
    double g,
    double b,
    double alpha)

    Draws a texture starting at the bottom up until a percentage, defined by 'yRatio', of the total height.
  + ### DrawSubTextureRGBA

    public void DrawSubTextureRGBA([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double subX,
    double subY,
    double subW,
    double subH,
    double x,
    double y,
    double w,
    double h,
    double r,
    double g,
    double b,
    double a)
  + ### DrawTextureTiled

    public void DrawTextureTiled([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double w,
    double h,
    double r,
    double g,
    double b,
    double a)
  + ### DrawTextureTiledX

    public void DrawTextureTiledX([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double w,
    double h,
    double r,
    double g,
    double b,
    double a)
  + ### DrawTextureTiledY

    public void DrawTextureTiledY([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double w,
    double h,
    double r,
    double g,
    double b,
    double a)
  + ### DrawTextureTiledYOffset

    public void DrawTextureTiledYOffset([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double w,
    double h,
    double r,
    double g,
    double b,
    double a)
  + ### DrawTextureIgnoreOffset

    public void DrawTextureIgnoreOffset([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    int width,
    int height,
    [Color](../core/Color.html "class in zombie.core") col)
  + ### DrawTexture\_FlippedX

    public void DrawTexture\_FlippedX([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    int width,
    int height,
    [Color](../core/Color.html "class in zombie.core") col)
  + ### DrawTexture\_FlippedXIgnoreOffset

    public void DrawTexture\_FlippedXIgnoreOffset([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    int width,
    int height,
    [Color](../core/Color.html "class in zombie.core") col)
  + ### DrawUVSliceTexture

    public void DrawUVSliceTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    [Color](../core/Color.html "class in zombie.core") col,
    double xStart,
    double yStart,
    double xEnd,
    double yEnd)
  + ### getScrollChildren

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") getScrollChildren()
  + ### setScrollChildren

    public void setScrollChildren(boolean bScroll)
  + ### getScrollWithParent

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") getScrollWithParent()
  + ### setScrollWithParent

    public void setScrollWithParent(boolean bScroll)
  + ### setRenderClippedChildren

    public void setRenderClippedChildren(boolean b)
  + ### getAbsoluteX

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getAbsoluteX()
  + ### getAbsoluteY

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getAbsoluteY()
  + ### getClickedValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClickedValue()
  + ### setClickedValue

    public void setClickedValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clickedValue)

    Parameters:
    :   `clickedValue` - the clickedValue to set
  + ### bringToTop

    public void bringToTop()
  + ### onRightMouseUpOutside

    void onRightMouseUpOutside(double x,
    double y)
  + ### onRightMouseDownOutside

    void onRightMouseDownOutside(double x,
    double y)
  + ### onMouseUpOutside

    public void onMouseUpOutside(double x,
    double y)
  + ### onMouseDownOutside

    void onMouseDownOutside(double x,
    double y)
  + ### onMouseDown

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseDown(double x,
    double y)
  + ### onMouseDoubleClick

    private [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseDoubleClick(double x2,
    double y2)
  + ### onConsumeMouseWheel

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onConsumeMouseWheel(double del,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseWheel` in interface `zombie.ui.UIElementInterface`
  + ### onMouseWheel

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseWheel(double del)
  + ### onConsumeMouseMove

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onConsumeMouseMove(double dx,
    double dy,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseMove` in interface `zombie.ui.UIElementInterface`
  + ### onMouseMove

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseMove(double dx,
    double dy)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### onExtendMouseMoveOutside

    public void onExtendMouseMoveOutside(double dx,
    double dy,
    double x,
    double y)

    Specified by:
    :   `onExtendMouseMoveOutside` in interface `zombie.ui.UIElementInterface`
  + ### onMouseMoveOutside

    public void onMouseMoveOutside(double dx,
    double dy)
  + ### onMouseUp

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseUp(double x,
    double y)
  + ### onMouseButtonDown

    public void onMouseButtonDown(int btn,
    double x,
    double y)

    Sends all mouse clicks on an element (not triggered when clicking on child controls)
    If bWantExtraMouseEvents is true, then any mouse clicks on this element will trigger the onMouseButtonDown lua
    method (if it exists). This is primarily required to detect all mouse buttons when rebinding inputs.

    Parameters:
    :   `btn` - the button index
    :   `x` - the x position of the mouse over the element
    :   `y` - the y position of the mouse over the element
  + ### onConsumeMouseButtonDown

    public boolean onConsumeMouseButtonDown(int btn,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseButtonDown` in interface `zombie.ui.UIElementInterface`
  + ### onMouseButtonDownOutside

    public void onMouseButtonDownOutside(int btn,
    double x,
    double y)

    Specified by:
    :   `onMouseButtonDownOutside` in interface `zombie.ui.UIElementInterface`
  + ### onConsumeMouseButtonUp

    public boolean onConsumeMouseButtonUp(int btn,
    double x,
    double y)

    Specified by:
    :   `onConsumeMouseButtonUp` in interface `zombie.ui.UIElementInterface`
  + ### onMouseButtonUpOutside

    public void onMouseButtonUpOutside(int btn,
    double x,
    double y)

    Specified by:
    :   `onMouseButtonUpOutside` in interface `zombie.ui.UIElementInterface`
  + ### onresize

    public void onresize()
  + ### onResize

    public void onResize()
  + ### onRightMouseDown

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onRightMouseDown(double x,
    double y)
  + ### onRightMouseUp

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onRightMouseUp(double x,
    double y)
  + ### RemoveControl

    public void RemoveControl([UIElement](UIElement.html "class in zombie.ui") el)
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`
  + ### BringToTop

    public void BringToTop([UIElement](UIElement.html "class in zombie.ui") el)
  + ### isCapture

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isCapture()

    Specified by:
    :   `isCapture` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the capture
  + ### setCapture

    public void setCapture(boolean capture)

    Parameters:
    :   `capture` - the capture to set
  + ### isModalVisible

    public boolean isModalVisible()

    Specified by:
    :   `isModalVisible` in interface `zombie.ui.UIElementInterface`
  + ### isIgnoreLossControl

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isIgnoreLossControl()

    Specified by:
    :   `isIgnoreLossControl` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the IgnoreLossControl
  + ### setIgnoreLossControl

    public void setIgnoreLossControl(boolean ignoreLossControl)

    Parameters:
    :   `ignoreLossControl` - the IgnoreLossControl to set
  + ### getControls

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UIElement](UIElement.html "class in zombie.ui")> getControls()

    Returns:
    :   the Controls
  + ### setControls

    public void setControls([Vector](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Vector.html "class or interface in java.util")<[UIElement](UIElement.html "class in zombie.ui")> controls)

    Parameters:
    :   `controls` - the Controls to set
  + ### isDefaultDraw

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isDefaultDraw()

    Specified by:
    :   `isDefaultDraw` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the defaultDraw
  + ### setDefaultDraw

    public void setDefaultDraw(boolean defaultDraw)

    Parameters:
    :   `defaultDraw` - the defaultDraw to set
  + ### isFollowGameWorld

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isFollowGameWorld()

    Specified by:
    :   `isFollowGameWorld` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the followGameWorld
  + ### setFollowGameWorld

    public void setFollowGameWorld(boolean followGameWorld)

    Parameters:
    :   `followGameWorld` - the followGameWorld to set
  + ### getRenderThisPlayerOnly

    public int getRenderThisPlayerOnly()

    Specified by:
    :   `getRenderThisPlayerOnly` in interface `zombie.ui.UIElementInterface`
  + ### setRenderThisPlayerOnly

    public void setRenderThisPlayerOnly(int playerIndex)
  + ### getHeight

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getHeight()

    Specified by:
    :   `getHeight` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the height
  + ### setHeight

    public void setHeight(double height)

    Parameters:
    :   `height` - the height to set
  + ### getParent

    public [UIElement](UIElement.html "class in zombie.ui") getParent()

    Specified by:
    :   `getParent` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the Parent
  + ### setParent

    public void setParent([UIElement](UIElement.html "class in zombie.ui") parent)

    Parameters:
    :   `parent` - the Parent to set
  + ### isVisible

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isVisible()

    Specified by:
    :   `isVisible` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the visible
  + ### setVisible

    public void setVisible(boolean visible)

    Parameters:
    :   `visible` - the visible to set
  + ### isReallyVisible

    public boolean isReallyVisible()
  + ### getWidth

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getWidth()

    Specified by:
    :   `getWidth` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the width
  + ### setWidth

    public void setWidth(double width)

    Parameters:
    :   `width` - the width to set
  + ### getX

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getX()

    Specified by:
    :   `getX` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the x
  + ### setX

    public void setX(double x)

    Parameters:
    :   `x` - the x to set
  + ### getXScrolled

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getXScrolled([UIElement](UIElement.html "class in zombie.ui") parent)
  + ### getYScrolled

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getYScrolled([UIElement](UIElement.html "class in zombie.ui") parent)
  + ### isEnabled

    public boolean isEnabled()
  + ### setEnabled

    public void setEnabled(boolean en)
  + ### getY

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getY()

    Specified by:
    :   `getY` in interface `zombie.ui.UIElementInterface`

    Returns:
    :   the y
  + ### setY

    public void setY(double y)

    Parameters:
    :   `y` - the y to set
  + ### isOverElement

    public boolean isOverElement(double mx,
    double my)

    Specified by:
    :   `isOverElement` in interface `zombie.ui.UIElementInterface`
  + ### suspendStencil

    public void suspendStencil()
  + ### resumeStencil

    public void resumeStencil()
  + ### setStencilRect

    public void setStencilRect(double x,
    double y,
    double width,
    double height)
  + ### setStencilCircle

    public void setStencilCircle(double x,
    double y,
    double width,
    double height)
  + ### clearStencilRect

    public void clearStencilRect()
  + ### repaintStencilRect

    public void repaintStencilRect(double x,
    double y,
    double width,
    double height)
  + ### getTable

    public se.krka.kahlua.vm.KahluaTable getTable()

    Returns:
    :   the table
  + ### setTable

    public void setTable(se.krka.kahlua.vm.KahluaTable table)

    Parameters:
    :   `table` - the table to set
  + ### setHeightSilent

    public void setHeightSilent(double height)
  + ### setWidthSilent

    public void setWidthSilent(double width)
  + ### setHeightOnly

    public void setHeightOnly(double height)
  + ### setWidthOnly

    public void setWidthOnly(double width)
  + ### isAnchorTop

    public boolean isAnchorTop()

    Returns:
    :   the anchorTop
  + ### setAnchorTop

    public void setAnchorTop(boolean anchorTop)

    Parameters:
    :   `anchorTop` - the anchorTop to set
  + ### ignoreWidthChange

    public void ignoreWidthChange()
  + ### ignoreHeightChange

    public void ignoreHeightChange()
  + ### isAnchorLeft

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isAnchorLeft()

    Returns:
    :   the anchorLeft
  + ### setAnchorLeft

    public void setAnchorLeft(boolean anchorLeft)

    Parameters:
    :   `anchorLeft` - the anchorLeft to set
  + ### isAnchorRight

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isAnchorRight()

    Returns:
    :   the anchorRight
  + ### setAnchorRight

    public void setAnchorRight(boolean anchorRight)

    Parameters:
    :   `anchorRight` - the anchorRight to set
  + ### isAnchorBottom

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isAnchorBottom()

    Returns:
    :   the anchorBottom
  + ### setAnchorBottom

    public void setAnchorBottom(boolean anchorBottom)

    Parameters:
    :   `anchorBottom` - the anchorBottom to set
  + ### addBringToTop

    private void addBringToTop([UIElement](UIElement.html "class in zombie.ui") aThis)
  + ### getPlayerContext

    public int getPlayerContext()
  + ### setPlayerContext

    public void setPlayerContext(int nPlayer)
  + ### getUIName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUIName()
  + ### setUIName

    public void setUIName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### clampToParentX

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") clampToParentX(double x)
  + ### clampToParentY

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") clampToParentY(double y)
  + ### isPointOver

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isPointOver(double screenX,
    double screenY)

    Specified by:
    :   `isPointOver` in interface `zombie.ui.UIElementInterface`
  + ### isMouseOver

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isMouseOver()

    Specified by:
    :   `isMouseOver` in interface `zombie.ui.UIElementInterface`
  + ### tryGetTableValue

    protected [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") tryGetTableValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### setWantKeyEvents

    public void setWantKeyEvents(boolean want)
  + ### isWantKeyEvents

    public boolean isWantKeyEvents()

    Specified by:
    :   `isWantKeyEvents` in interface `zombie.ui.UIElementInterface`
  + ### setWantExtraMouseEvents

    public void setWantExtraMouseEvents(boolean want)
  + ### isWantExtraMouseEvents

    public boolean isWantExtraMouseEvents()
  + ### isKeyConsumed

    public boolean isKeyConsumed(int key)
  + ### onConsumeKeyPress

    public boolean onConsumeKeyPress(int key)

    Specified by:
    :   `onConsumeKeyPress` in interface `zombie.ui.UIElementInterface`
  + ### onKeyPress

    public void onKeyPress(int key)
  + ### onConsumeKeyRepeat

    public boolean onConsumeKeyRepeat(int key)

    Specified by:
    :   `onConsumeKeyRepeat` in interface `zombie.ui.UIElementInterface`
  + ### onKeyRepeat

    public void onKeyRepeat(int key)
  + ### onConsumeKeyRelease

    public boolean onConsumeKeyRelease(int key)

    Specified by:
    :   `onConsumeKeyRelease` in interface `zombie.ui.UIElementInterface`
  + ### onKeyRelease

    public void onKeyRelease(int key)
  + ### isForceCursorVisible

    public boolean isForceCursorVisible()

    Specified by:
    :   `isForceCursorVisible` in interface `zombie.ui.UIElementInterface`
  + ### setForceCursorVisible

    public void setForceCursorVisible(boolean force)
  + ### StartOutline

    public void StartOutline([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    float outlineThickness,
    float r,
    float g,
    float b,
    float a)
  + ### EndOutline

    public void EndOutline()