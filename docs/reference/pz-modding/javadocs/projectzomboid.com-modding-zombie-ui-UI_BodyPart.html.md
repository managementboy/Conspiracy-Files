[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UI\_BodyPart](UI_BodyPart.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [alpha](#alpha)
   2. [color](#color)
   3. [bodyPartType](#bodyPartType)
   4. [isFlipped](#isFlipped)
   5. [maxOscilatorRate](#maxOscilatorRate)
   6. [minOscilatorRate](#minOscilatorRate)
   7. [oscilator](#oscilator)
   8. [oscilatorRate](#oscilatorRate)
   9. [oscilatorStep](#oscilatorStep)
   10. [chr](#chr)
   11. [mouseOver](#mouseOver)
   12. [scratchTex](#scratchTex)
   13. [bandageTex](#bandageTex)
   14. [dirtyBandageTex](#dirtyBandageTex)
   15. [infectionTex](#infectionTex)
   16. [deepWoundTex](#deepWoundTex)
   17. [stitchTex](#stitchTex)
   18. [biteTex](#biteTex)
   19. [glassTex](#glassTex)
   20. [boneTex](#boneTex)
   21. [splintTex](#splintTex)
   22. [burnTex](#burnTex)
   23. [bulletTex](#bulletTex)
6. [Constructor Details](#constructor-detail)
   1. [UI\_BodyPart(BodyPartType, int, int, String, IsoGameCharacter, boolean)](#%3Cinit%3E(zombie.characters.BodyDamage.BodyPartType,int,int,java.lang.String,zombie.characters.IsoGameCharacter,boolean))
7. [Method Details](#method-detail)
   1. [onMouseMoveOutside(double, double)](#onMouseMoveOutside(double,double))
   2. [render()](#render())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI\_BodyPart
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.UI\_BodyPart

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class UI\_BodyPart
extends [UIElement](UIElement.html "class in zombie.ui")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `alpha`

  `(package private) Texture`

  `bandageTex`

  `(package private) Texture`

  `biteTex`

  `BodyPartType`

  `bodyPartType`

  `(package private) Texture`

  `boneTex`

  `(package private) Texture`

  `bulletTex`

  `(package private) Texture`

  `burnTex`

  `(package private) IsoGameCharacter`

  `chr`

  `final Color`

  `color`

  `(package private) Texture`

  `deepWoundTex`

  `(package private) Texture`

  `dirtyBandageTex`

  `(package private) Texture`

  `glassTex`

  `(package private) Texture`

  `infectionTex`

  `boolean`

  `isFlipped`

  `float`

  `maxOscilatorRate`

  `float`

  `minOscilatorRate`

  `(package private) boolean`

  `mouseOver`

  `float`

  `oscilator`

  `float`

  `oscilatorRate`

  `float`

  `oscilatorStep`

  `(package private) Texture`

  `scratchTex`

  `(package private) Texture`

  `splintTex`

  `(package private) Texture`

  `stitchTex`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UI_BodyPart(BodyPartType type,
  int x,
  int y,
  String part,
  IsoGameCharacter character,
  boolean renderFlipped)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `onMouseMoveOutside(double dx,
  double dy)`

  `void`

  `render()`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDown, onMouseDownOutside, onMouseMove, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue, update`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### alpha

    public float alpha
  + ### color

    public final [Color](../core/Color.html "class in zombie.core") color
  + ### bodyPartType

    public [BodyPartType](../characters/BodyDamage/BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPartType
  + ### isFlipped

    public boolean isFlipped
  + ### maxOscilatorRate

    public float maxOscilatorRate
  + ### minOscilatorRate

    public float minOscilatorRate
  + ### oscilator

    public float oscilator
  + ### oscilatorRate

    public float oscilatorRate
  + ### oscilatorStep

    public float oscilatorStep
  + ### chr

    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr
  + ### mouseOver

    boolean mouseOver
  + ### scratchTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") scratchTex
  + ### bandageTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") bandageTex
  + ### dirtyBandageTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") dirtyBandageTex
  + ### infectionTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") infectionTex
  + ### deepWoundTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") deepWoundTex
  + ### stitchTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") stitchTex
  + ### biteTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") biteTex
  + ### glassTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") glassTex
  + ### boneTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") boneTex
  + ### splintTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") splintTex
  + ### burnTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") burnTex
  + ### bulletTex

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") bulletTex
* Constructor Details
  -------------------

  + ### UI\_BodyPart

    public UI\_BodyPart([BodyPartType](../characters/BodyDamage/BodyPartType.html "enum class in zombie.characters.BodyDamage") type,
    int x,
    int y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") part,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean renderFlipped)
* Method Details
  --------------

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