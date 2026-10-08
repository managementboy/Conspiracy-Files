[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.debug.options](package-summary.html)
2. [IsoSprite](IsoSprite.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [renderSprites](#renderSprites)
   2. [renderModels](#renderModels)
   3. [movingObjectEdges](#movingObjectEdges)
   4. [dropShadowEdges](#dropShadowEdges)
   5. [nearestMagFilterAtMinZoom](#nearestMagFilterAtMinZoom)
   6. [itemHeight](#itemHeight)
   7. [surface](#surface)
   8. [textureWrapClampToEdge](#textureWrapClampToEdge)
   9. [textureWrapRepeat](#textureWrapRepeat)
   10. [forceLinearMagFilter](#forceLinearMagFilter)
   11. [forceNearestMagFilter](#forceNearestMagFilter)
   12. [forceNearestMipMapping](#forceNearestMipMapping)
   13. [characterMipmapColors](#characterMipmapColors)
   14. [worldMipmapColors](#worldMipmapColors)
6. [Constructor Details](#constructor-detail)
   1. [IsoSprite()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoSprite
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.debug.options.OptionGroup

zombie.debug.options.IsoSprite

All Implemented Interfaces:
:   `zombie.debug.options.IDebugOption, zombie.debug.options.IDebugOptionGroup`

---

public final class IsoSprite
extends zombie.debug.options.OptionGroup

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final BooleanDebugOption`

  `characterMipmapColors`

  `final BooleanDebugOption`

  `dropShadowEdges`

  `final BooleanDebugOption`

  `forceLinearMagFilter`

  `final BooleanDebugOption`

  `forceNearestMagFilter`

  `final BooleanDebugOption`

  `forceNearestMipMapping`

  `final BooleanDebugOption`

  `itemHeight`

  `final BooleanDebugOption`

  `movingObjectEdges`

  `final BooleanDebugOption`

  `nearestMagFilterAtMinZoom`

  `final BooleanDebugOption`

  `renderModels`

  `final BooleanDebugOption`

  `renderSprites`

  `final BooleanDebugOption`

  `surface`

  `final BooleanDebugOption`

  `textureWrapClampToEdge`

  `final BooleanDebugOption`

  `textureWrapRepeat`

  `final BooleanDebugOption`

  `worldMipmapColors`

  ### Fields inherited from class zombie.debug.options.OptionGroup

  `group`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoSprite()`
* Method Summary
  --------------

  ### Methods inherited from class zombie.debug.options.OptionGroup

  `addChild, getChildren, getCombinedName, getGroupName, getName, getParent, onChildAdded, onDescendantAdded, onFullPathChanged, removeChild, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.debug.options.IDebugOptionGroup

  `getCombinedName, newDebugOnlyOption, newOption, newOptionGroup`

* Field Details
  -------------

  + ### renderSprites

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") renderSprites
  + ### renderModels

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") renderModels
  + ### movingObjectEdges

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") movingObjectEdges
  + ### dropShadowEdges

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") dropShadowEdges
  + ### nearestMagFilterAtMinZoom

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") nearestMagFilterAtMinZoom
  + ### itemHeight

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") itemHeight
  + ### surface

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") surface
  + ### textureWrapClampToEdge

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") textureWrapClampToEdge
  + ### textureWrapRepeat

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") textureWrapRepeat
  + ### forceLinearMagFilter

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") forceLinearMagFilter
  + ### forceNearestMagFilter

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") forceNearestMagFilter
  + ### forceNearestMipMapping

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") forceNearestMipMapping
  + ### characterMipmapColors

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") characterMipmapColors
  + ### worldMipmapColors

    public final [BooleanDebugOption](../BooleanDebugOption.html "class in zombie.debug") worldMipmapColors
* Constructor Details
  -------------------

  + ### IsoSprite

    public IsoSprite()