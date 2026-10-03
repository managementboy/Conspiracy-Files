[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [NewHealthPanel](NewHealthPanel.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [bodyOutline](#bodyOutline)
   3. [footL](#footL)
   4. [footR](#footR)
   5. [foreArmL](#foreArmL)
   6. [foreArmR](#foreArmR)
   7. [groin](#groin)
   8. [handL](#handL)
   9. [handR](#handR)
   10. [head](#head)
   11. [lowerLegL](#lowerLegL)
   12. [lowerLegR](#lowerLegR)
   13. [neck](#neck)
   14. [torsoLower](#torsoLower)
   15. [torsoUpper](#torsoUpper)
   16. [upperArmL](#upperArmL)
   17. [upperArmR](#upperArmR)
   18. [upperLegL](#upperLegL)
   19. [upperLegR](#upperLegR)
   20. [healthBar](#healthBar)
   21. [healthBarBack](#healthBarBack)
   22. [healthIcon](#healthIcon)
   23. [UI\_BORDER\_SPACING](#UI_BORDER_SPACING)
   24. [parentChar](#parentChar)
6. [Constructor Details](#constructor-detail)
   1. [NewHealthPanel(int, int, IsoGameCharacter)](#%3Cinit%3E(int,int,zombie.characters.IsoGameCharacter))
7. [Method Details](#method-detail)
   1. [SetCharacter(IsoGameCharacter)](#SetCharacter(zombie.characters.IsoGameCharacter))
   2. [render()](#render())
   3. [update()](#update())
   4. [getDamageStatusString()](#getDamageStatusString())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class NewHealthPanel
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](UIElement.html "class in zombie.ui")

zombie.ui.NewWindow

zombie.ui.NewHealthPanel

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class NewHealthPanel
extends zombie.ui.NewWindow

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `Texture`

  `bodyOutline`

  `UI_BodyPart`

  `footL`

  `UI_BodyPart`

  `footR`

  `UI_BodyPart`

  `foreArmL`

  `UI_BodyPart`

  `foreArmR`

  `UI_BodyPart`

  `groin`

  `UI_BodyPart`

  `handL`

  `UI_BodyPart`

  `handR`

  `UI_BodyPart`

  `head`

  `Texture`

  `healthBar`

  `Texture`

  `healthBarBack`

  `Texture`

  `healthIcon`

  `static NewHealthPanel`

  `instance`

  `UI_BodyPart`

  `lowerLegL`

  `UI_BodyPart`

  `lowerLegR`

  `UI_BodyPart`

  `neck`

  `(package private) IsoGameCharacter`

  `parentChar`

  `UI_BodyPart`

  `torsoLower`

  `UI_BodyPart`

  `torsoUpper`

  `private static final int`

  `UI_BORDER_SPACING`

  `UI_BodyPart`

  `upperArmL`

  `UI_BodyPart`

  `upperArmR`

  `UI_BodyPart`

  `upperLegL`

  `UI_BodyPart`

  `upperLegR`

  ### Fields inherited from class zombie.ui.NewWindow

  `alpha, clickX, clickY, clientH, clientW, closeButton, dialogBottomLeft, dialogBottomMiddle, dialogBottomRight, dialogLeft, dialogMiddle, dialogRight, movable, moving, ncclientH, ncclientW, nestedItems, resizeToFitY, titleCloseIcon, titleLeft, titleMiddle, titleRight`

  ### Fields inherited from class [UIElement](UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, enabled, followGameWorld, height, ignoreLossControl, lastheight, lastwidth, maxDrawHeight, parent, playerContext, resizeDirty, scrollChildren, scrollHeight, scrollWithParent, stencilLevel, table, tempcol, toAdd, visible, white, width, x, xScroll, y, yScroll`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NewHealthPanel(int x,
  int y,
  IsoGameCharacter parentCharacter)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getDamageStatusString()`

  `void`

  `render()`

  `void`

  `SetCharacter(IsoGameCharacter chr)`

  `void`

  `update()`

  ### Methods inherited from class zombie.ui.NewWindow

  `ButtonClicked, Nest, onMouseDown, onMouseMove, onMouseMoveOutside, onMouseUp, setMovable`

  ### Methods inherited from class [UIElement](UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDownOutside, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseDownOutside, onRightMouseUp, onRightMouseUpOutside, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static [NewHealthPanel](NewHealthPanel.html "class in zombie.ui") instance
  + ### bodyOutline

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") bodyOutline
  + ### footL

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") footL
  + ### footR

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") footR
  + ### foreArmL

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") foreArmL
  + ### foreArmR

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") foreArmR
  + ### groin

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") groin
  + ### handL

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") handL
  + ### handR

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") handR
  + ### head

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") head
  + ### lowerLegL

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") lowerLegL
  + ### lowerLegR

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") lowerLegR
  + ### neck

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") neck
  + ### torsoLower

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") torsoLower
  + ### torsoUpper

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") torsoUpper
  + ### upperArmL

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") upperArmL
  + ### upperArmR

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") upperArmR
  + ### upperLegL

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") upperLegL
  + ### upperLegR

    public [UI\_BodyPart](UI_BodyPart.html "class in zombie.ui") upperLegR
  + ### healthBar

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") healthBar
  + ### healthBarBack

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") healthBarBack
  + ### healthIcon

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") healthIcon
  + ### UI\_BORDER\_SPACING

    private static final int UI\_BORDER\_SPACING

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.NewHealthPanel.UI_BORDER_SPACING)
  + ### parentChar

    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") parentChar
* Constructor Details
  -------------------

  + ### NewHealthPanel

    public NewHealthPanel(int x,
    int y,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") parentCharacter)
* Method Details
  --------------

  + ### SetCharacter

    public void SetCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `zombie.ui.NewWindow`
  + ### update

    public void update()

    Specified by:
    :   `update` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `update` in class `zombie.ui.NewWindow`
  + ### getDamageStatusString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDamageStatusString()