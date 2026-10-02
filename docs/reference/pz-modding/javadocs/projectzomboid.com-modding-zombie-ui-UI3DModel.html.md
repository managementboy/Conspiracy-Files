[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UI3DModel](UI3DModel.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [animatedModel](#animatedModel)
   2. [dir](#dir)
   3. [doExt](#doExt)
   4. [nextExt](#nextExt)
   5. [drawers](#drawers)
   6. [zoom](#zoom)
   7. [yOffset](#yOffset)
   8. [xOffset](#xOffset)
7. [Constructor Details](#constructor-detail)
   1. [UI3DModel(KahluaTable)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable))
8. [Method Details](#method-detail)
   1. [render()](#render())
   2. [setDirection(IsoDirections)](#setDirection(zombie.iso.IsoDirections))
   3. [getDirection()](#getDirection())
   4. [setAnimate(boolean)](#setAnimate(boolean))
   5. [setAnimSetName(String)](#setAnimSetName(java.lang.String))
   6. [setDoRandomExtAnimations(boolean)](#setDoRandomExtAnimations(boolean))
   7. [setIsometric(boolean)](#setIsometric(boolean))
   8. [setOutfitName(String, boolean, boolean)](#setOutfitName(java.lang.String,boolean,boolean))
   9. [setCharacter(IsoGameCharacter)](#setCharacter(zombie.characters.IsoGameCharacter))
   10. [getCharacter()](#getCharacter())
   11. [setSurvivorDesc(SurvivorDesc)](#setSurvivorDesc(zombie.characters.SurvivorDesc))
   12. [setState(String)](#setState(java.lang.String))
   13. [getState()](#getState())
   14. [setVariable(String, String)](#setVariable(java.lang.String,java.lang.String))
   15. [setVariable(String, boolean)](#setVariable(java.lang.String,boolean))
   16. [getVariable(String)](#getVariable(java.lang.String))
   17. [setVariable(String, float)](#setVariable(java.lang.String,float))
   18. [clearVariable(String)](#clearVariable(java.lang.String))
   19. [clearVariables()](#clearVariables())
   20. [reportEvent(String)](#reportEvent(java.lang.String))
   21. [clothingItemChanged(String)](#clothingItemChanged(java.lang.String))
   22. [setZoom(float)](#setZoom(float))
   23. [setYOffset(float)](#setYOffset(float))
   24. [setXOffset(float)](#setXOffset(float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DModel
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.UI3DModel

All Implemented Interfaces:
:   `zombie.core.skinnedmodel.population.IClothingItemListener, zombie.ui.UIElementInterface`

---

public final class UI3DModel
extends [UIElement](UIElement.html "class in zombie.ui")
implements zombie.core.skinnedmodel.population.IClothingItemListener

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private final class`

  `UI3DModel.Drawer`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.core.skinnedmodel.advancedanimation.AnimatedModel`

  `animatedModel`

  `private IsoDirections`

  `dir`

  `private boolean`

  `doExt`

  `private final UI3DModel.Drawer[]`

  `drawers`

  `private long`

  `nextExt`

  `private float`

  `xOffset`

  `private float`

  `yOffset`

  `private float`

  `zoom`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UI3DModel(se.krka.kahlua.vm.KahluaTable table)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `clearVariable(String key)`

  `void`

  `clearVariables()`

  `void`

  `clothingItemChanged(String itemGuid)`

  `IsoGameCharacter`

  `getCharacter()`

  `IsoDirections`

  `getDirection()`

  `String`

  `getState()`

  `Object`

  `getVariable(String key)`

  `void`

  `render()`

  `void`

  `reportEvent(String event)`

  `void`

  `setAnimate(boolean animate)`

  `void`

  `setAnimSetName(String name)`

  `void`

  `setCharacter(IsoGameCharacter character)`

  `void`

  `setDirection(IsoDirections dir)`

  `void`

  `setDoRandomExtAnimations(boolean doExt)`

  `void`

  `setIsometric(boolean iso)`

  `void`

  `setOutfitName(String outfitName,
  boolean female,
  boolean zombie)`

  `void`

  `setState(String state)`

  `void`

  `setSurvivorDesc(SurvivorDesc survivorDesc)`

  `void`

  `setVariable(String key,
  boolean value)`

  `void`

  `setVariable(String key,
  float value)`

  `void`

  `setVariable(String key,
  String value)`

  `void`

  `setXOffset(float newXOffset)`

  `void`

  `setYOffset(float newYOffset)`

  `void`

  `setZoom(float newZoom)`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDown, onMouseDownOutside, onMouseMove, onMouseMoveOutside, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue, update`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### animatedModel

    private final zombie.core.skinnedmodel.advancedanimation.AnimatedModel animatedModel
  + ### dir

    private [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir
  + ### doExt

    private boolean doExt
  + ### nextExt

    private long nextExt
  + ### drawers

    private final [UI3DModel.Drawer](UI3DModel.Drawer.html "class in zombie.ui")[] drawers
  + ### zoom

    private float zoom
  + ### yOffset

    private float yOffset
  + ### xOffset

    private float xOffset
* Constructor Details
  -------------------

  + ### UI3DModel

    public UI3DModel(se.krka.kahlua.vm.KahluaTable table)
* Method Details
  --------------

  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `UIElement`
  + ### setDirection

    public void setDirection([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### getDirection

    public [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") getDirection()
  + ### setAnimate

    public void setAnimate(boolean animate)
  + ### setAnimSetName

    public void setAnimSetName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setDoRandomExtAnimations

    public void setDoRandomExtAnimations(boolean doExt)
  + ### setIsometric

    public void setIsometric(boolean iso)
  + ### setOutfitName

    public void setOutfitName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName,
    boolean female,
    boolean zombie)
  + ### setCharacter

    public void setCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getCharacter

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getCharacter()
  + ### setSurvivorDesc

    public void setSurvivorDesc([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") survivorDesc)
  + ### setState

    public void setState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") state)
  + ### getState

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getState()
  + ### setVariable

    public void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### setVariable

    public void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    boolean value)
  + ### getVariable

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### setVariable

    public void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    float value)
  + ### clearVariable

    public void clearVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### clearVariables

    public void clearVariables()
  + ### reportEvent

    public void reportEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event)
  + ### clothingItemChanged

    public void clothingItemChanged([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemGuid)

    Specified by:
    :   `clothingItemChanged` in interface `zombie.core.skinnedmodel.population.IClothingItemListener`
  + ### setZoom

    public void setZoom(float newZoom)
  + ### setYOffset

    public void setYOffset(float newYOffset)
  + ### setXOffset

    public void setXOffset(float newXOffset)