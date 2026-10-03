[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [ObjectTooltip](ObjectTooltip.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [alphaStep](#alphaStep)
   2. [isItem](#isItem)
   3. [item](#item)
   4. [object](#object)
   5. [alpha](#alpha)
   6. [showDelay](#showDelay)
   7. [targetAlpha](#targetAlpha)
   8. [texture](#texture)
   9. [padLeft](#padLeft)
   10. [padTop](#padTop)
   11. [padRight](#padRight)
   12. [padBottom](#padBottom)
   13. [character](#character)
   14. [measureOnly](#measureOnly)
   15. [weightOfStack](#weightOfStack)
   16. [lineSpacing](#lineSpacing)
   17. [staticPadLeft](#staticPadLeft)
   18. [staticPadRight](#staticPadRight)
   19. [staticPadTop](#staticPadTop)
   20. [staticPadBottom](#staticPadBottom)
   21. [fontSize](#fontSize)
   22. [font](#font)
   23. [freeLayouts](#freeLayouts)
7. [Constructor Details](#constructor-detail)
   1. [ObjectTooltip()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [checkFont()](#checkFont())
   2. [getFont()](#getFont())
   3. [getLineSpacing()](#getLineSpacing())
   4. [DrawText(UIFont, String, double, double, double, double, double, double)](#DrawText(zombie.ui.UIFont,java.lang.String,double,double,double,double,double,double))
   5. [DrawTextCentre(UIFont, String, double, double, double, double, double, double)](#DrawTextCentre(zombie.ui.UIFont,java.lang.String,double,double,double,double,double,double))
   6. [DrawTextRight(UIFont, String, double, double, double, double, double, double)](#DrawTextRight(zombie.ui.UIFont,java.lang.String,double,double,double,double,double,double))
   7. [DrawValueRight(int, int, int, boolean)](#DrawValueRight(int,int,int,boolean))
   8. [DrawValueRightNoPlus(int, int, int)](#DrawValueRightNoPlus(int,int,int))
   9. [DrawValueRightNoPlus(float, int, int)](#DrawValueRightNoPlus(float,int,int))
   10. [DrawTextureScaled(Texture, double, double, double, double, double)](#DrawTextureScaled(zombie.core.textures.Texture,double,double,double,double,double))
   11. [DrawTextureScaledAspect(Texture, double, double, double, double, double, double, double, double)](#DrawTextureScaledAspect(zombie.core.textures.Texture,double,double,double,double,double,double,double,double))
   12. [DrawProgressBar(int, int, int, int, float, double, double, double, double)](#DrawProgressBar(int,int,int,int,float,double,double,double,double))
   13. [onMouseMove(double, double)](#onMouseMove(double,double))
   14. [onMouseMoveOutside(double, double)](#onMouseMoveOutside(double,double))
   15. [render()](#render())
   16. [show(IsoObject, double, double)](#show(zombie.iso.IsoObject,double,double))
   17. [hide()](#hide())
   18. [update()](#update())
   19. [show(InventoryItem, int, int)](#show(zombie.inventory.InventoryItem,int,int))
   20. [adjustWidth(int, String)](#adjustWidth(int,java.lang.String))
   21. [beginLayout()](#beginLayout())
   22. [endLayout(ObjectTooltip.Layout)](#endLayout(zombie.ui.ObjectTooltip.Layout))
   23. [getTexture()](#getTexture())
   24. [setCharacter(IsoGameCharacter)](#setCharacter(zombie.characters.IsoGameCharacter))
   25. [getCharacter()](#getCharacter())
   26. [setMeasureOnly(boolean)](#setMeasureOnly(boolean))
   27. [isMeasureOnly()](#isMeasureOnly())
   28. [getWeightOfStack()](#getWeightOfStack())
   29. [setWeightOfStack(float)](#setWeightOfStack(float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ObjectTooltip
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.ObjectTooltip

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class ObjectTooltip
extends [UIElement](UIElement.html "class in zombie.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `ObjectTooltip.Layout`

  `static class`

  `ObjectTooltip.LayoutItem`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `alpha`

  `static float`

  `alphaStep`

  `private IsoGameCharacter`

  `character`

  `private static UIFont`

  `font`

  `private static String`

  `fontSize`

  `private static final Stack<ObjectTooltip.Layout>`

  `freeLayouts`

  `boolean`

  `isItem`

  `InventoryItem`

  `item`

  `private static int`

  `lineSpacing`

  `private boolean`

  `measureOnly`

  `IsoObject`

  `object`

  `int`

  `padBottom`

  `int`

  `padLeft`

  `int`

  `padRight`

  `int`

  `padTop`

  `(package private) int`

  `showDelay`

  `private static int`

  `staticPadBottom`

  `private static int`

  `staticPadLeft`

  `private static int`

  `staticPadRight`

  `private static int`

  `staticPadTop`

  `(package private) float`

  `targetAlpha`

  `(package private) Texture`

  `texture`

  `private float`

  `weightOfStack`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ObjectTooltip()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `adjustWidth(int textX,
  String text)`

  `ObjectTooltip.Layout`

  `beginLayout()`

  `static void`

  `checkFont()`

  `void`

  `DrawProgressBar(int x,
  int y,
  int w,
  int h,
  float f,
  double r,
  double g,
  double b,
  double a)`

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

  `DrawTextCentre(UIFont font,
  String text,
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

  `DrawValueRight(int value,
  int x,
  int y,
  boolean highGood)`

  `void`

  `DrawValueRightNoPlus(float value,
  int x,
  int y)`

  `void`

  `DrawValueRightNoPlus(int value,
  int x,
  int y)`

  `void`

  `endLayout(ObjectTooltip.Layout layout)`

  `IsoGameCharacter`

  `getCharacter()`

  `UIFont`

  `getFont()`

  `int`

  `getLineSpacing()`

  `Texture`

  `getTexture()`

  `float`

  `getWeightOfStack()`

  `void`

  `hide()`

  `boolean`

  `isMeasureOnly()`

  `Boolean`

  `onMouseMove(double dx,
  double dy)`

  `void`

  `onMouseMoveOutside(double dx,
  double dy)`

  `void`

  `render()`

  `void`

  `setCharacter(IsoGameCharacter chr)`

  `void`

  `setMeasureOnly(boolean b)`

  `void`

  `setWeightOfStack(float weight)`

  `(package private) void`

  `show(InventoryItem info,
  int i,
  int i0)`

  `void`

  `show(IsoObject obj,
  double x,
  double y)`

  `void`

  `update()`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDown, onMouseDownOutside, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### alphaStep

    public static float alphaStep
  + ### isItem

    public boolean isItem
  + ### item

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item
  + ### object

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") object
  + ### alpha

    float alpha
  + ### showDelay

    int showDelay
  + ### targetAlpha

    float targetAlpha
  + ### texture

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### padLeft

    public int padLeft
  + ### padTop

    public int padTop
  + ### padRight

    public int padRight
  + ### padBottom

    public int padBottom
  + ### character

    private [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character
  + ### measureOnly

    private boolean measureOnly
  + ### weightOfStack

    private float weightOfStack
  + ### lineSpacing

    private static int lineSpacing
  + ### staticPadLeft

    private static int staticPadLeft
  + ### staticPadRight

    private static int staticPadRight
  + ### staticPadTop

    private static int staticPadTop
  + ### staticPadBottom

    private static int staticPadBottom
  + ### fontSize

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fontSize
  + ### font

    private static [UIFont](UIFont.html "enum class in zombie.ui") font
  + ### freeLayouts

    private static final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[ObjectTooltip.Layout](ObjectTooltip.Layout.html "class in zombie.ui")> freeLayouts
* Constructor Details
  -------------------

  + ### ObjectTooltip

    public ObjectTooltip()
* Method Details
  --------------

  + ### checkFont

    public static void checkFont()
  + ### getFont

    public [UIFont](UIFont.html "enum class in zombie.ui") getFont()
  + ### getLineSpacing

    public int getLineSpacing()
  + ### DrawText

    public void DrawText([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)

    Overrides:
    :   `DrawText` in class `UIElement`
  + ### DrawTextCentre

    public void DrawTextCentre([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)

    Overrides:
    :   `DrawTextCentre` in class `UIElement`
  + ### DrawTextRight

    public void DrawTextRight([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    double x,
    double y,
    double r,
    double g,
    double b,
    double alpha)

    Overrides:
    :   `DrawTextRight` in class `UIElement`
  + ### DrawValueRight

    public void DrawValueRight(int value,
    int x,
    int y,
    boolean highGood)
  + ### DrawValueRightNoPlus

    public void DrawValueRightNoPlus(int value,
    int x,
    int y)
  + ### DrawValueRightNoPlus

    public void DrawValueRightNoPlus(float value,
    int x,
    int y)
  + ### DrawTextureScaled

    public void DrawTextureScaled([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    double alpha)

    Overrides:
    :   `DrawTextureScaled` in class `UIElement`
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

    Overrides:
    :   `DrawTextureScaledAspect` in class `UIElement`
  + ### DrawProgressBar

    public void DrawProgressBar(int x,
    int y,
    int w,
    int h,
    float f,
    double r,
    double g,
    double b,
    double a)
  + ### onMouseMove

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") onMouseMove(double dx,
    double dy)

    Overrides:
    :   `onMouseMove` in class `UIElement`
  + ### onMouseMoveOutside

    public void onMouseMoveOutside(double dx,
    double dy)

    Overrides:
    :   `onMouseMoveOutside` in class `UIElement`
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `UIElement`
  + ### show

    public void show([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj,
    double x,
    double y)
  + ### hide

    public void hide()
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `update` in class `UIElement`
  + ### show

    void show([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") info,
    int i,
    int i0)
  + ### adjustWidth

    public void adjustWidth(int textX,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### beginLayout

    public [ObjectTooltip.Layout](ObjectTooltip.Layout.html "class in zombie.ui") beginLayout()
  + ### endLayout

    public void endLayout([ObjectTooltip.Layout](ObjectTooltip.Layout.html "class in zombie.ui") layout)
  + ### getTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### setCharacter

    public void setCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getCharacter

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getCharacter()
  + ### setMeasureOnly

    public void setMeasureOnly(boolean b)
  + ### isMeasureOnly

    public boolean isMeasureOnly()
  + ### getWeightOfStack

    public float getWeightOfStack()
  + ### setWeightOfStack

    public void setWeightOfStack(float weight)