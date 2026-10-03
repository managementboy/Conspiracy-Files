[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.population](package-summary.html)
2. [ClothingItem](ClothingItem.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [guid](#guid)
   2. [maleModel](#maleModel)
   3. [femaleModel](#femaleModel)
   4. [altMaleModel](#altMaleModel)
   5. [altFemaleModel](#altFemaleModel)
   6. [isStatic](#isStatic)
   7. [baseTextures](#baseTextures)
   8. [attachBone](#attachBone)
   9. [masks](#masks)
   10. [masksFolder](#masksFolder)
   11. [underlayMasksFolder](#underlayMasksFolder)
   12. [textureChoices](#textureChoices)
   13. [allowRandomHue](#allowRandomHue)
   14. [allowRandomTint](#allowRandomTint)
   15. [decalGroup](#decalGroup)
   16. [shader](#shader)
   17. [hatCategory](#hatCategory)
   18. [spawnWith](#spawnWith)
   19. [s\_masksFolderDefault](#s_masksFolderDefault)
   20. [mame](#mame)
   21. [ASSET\_TYPE](#ASSET_TYPE)
7. [Constructor Details](#constructor-detail)
   1. [ClothingItem(AssetPath, AssetManager)](#%3Cinit%3E(zombie.asset.AssetPath,zombie.asset.AssetManager))
8. [Method Details](#method-detail)
   1. [getBaseTextures()](#getBaseTextures())
   2. [getTextureChoices()](#getTextureChoices())
   3. [GetATexture()](#GetATexture())
   4. [getSpawnWith()](#getSpawnWith())
   5. [getAllowRandomHue()](#getAllowRandomHue())
   6. [getAllowRandomTint()](#getAllowRandomTint())
   7. [getDecalGroup()](#getDecalGroup())
   8. [isHat()](#isHat())
   9. [isMask()](#isMask())
   10. [getCombinedMask(CharacterMask)](#getCombinedMask(zombie.core.skinnedmodel.model.CharacterMask))
   11. [hasModel()](#hasModel())
   12. [getModel(boolean)](#getModel(boolean))
   13. [getAltModel(boolean)](#getAltModel(boolean))
   14. [getFemaleModel()](#getFemaleModel())
   15. [getMaleModel()](#getMaleModel())
   16. [getAltFemaleModel()](#getAltFemaleModel())
   17. [getAltMaleModel()](#getAltMaleModel())
   18. [toString()](#toString())
   19. [tryGetCombinedMask(ClothingItemReference, CharacterMask)](#tryGetCombinedMask(zombie.core.skinnedmodel.population.ClothingItemReference,zombie.core.skinnedmodel.model.CharacterMask))
   20. [tryGetCombinedMask(ClothingItem, CharacterMask)](#tryGetCombinedMask(zombie.core.skinnedmodel.population.ClothingItem,zombie.core.skinnedmodel.model.CharacterMask))
   21. [getType()](#getType())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class ClothingItem
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.asset.Asset

zombie.core.skinnedmodel.population.ClothingItem

---

public final class ClothingItem
extends zombie.asset.Asset

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class zombie.asset.Asset

  `zombie.asset.Asset.ObserverCallback, zombie.asset.Asset.State`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `allowRandomHue`

  `boolean`

  `allowRandomTint`

  `String`

  `altFemaleModel`

  `String`

  `altMaleModel`

  `static final zombie.asset.AssetType`

  `ASSET_TYPE`

  `String`

  `attachBone`

  `ArrayList<String>`

  `baseTextures`

  `String`

  `decalGroup`

  `String`

  `femaleModel`

  `String`

  `guid`

  `String`

  `hatCategory`

  `boolean`

  `isStatic`

  `String`

  `maleModel`

  `String`

  `mame`

  `ArrayList<Integer>`

  `masks`

  `String`

  `masksFolder`

  `static final String`

  `s_masksFolderDefault`

  `String`

  `shader`

  `ArrayList<String>`

  `spawnWith`

  `ArrayList<String>`

  `textureChoices`

  `String`

  `underlayMasksFolder`

  ### Fields inherited from class zombie.asset.Asset

  `assetManager, isDefered`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClothingItem(zombie.asset.AssetPath path,
  zombie.asset.AssetManager assetManager)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `getAllowRandomHue()`

  `boolean`

  `getAllowRandomTint()`

  `String`

  `getAltFemaleModel()`

  `String`

  `getAltMaleModel()`

  `String`

  `getAltModel(boolean female)`

  `String`

  `GetATexture()`

  `ArrayList<String>`

  `getBaseTextures()`

  `void`

  `getCombinedMask(zombie.core.skinnedmodel.model.CharacterMask mask)`

  `String`

  `getDecalGroup()`

  `String`

  `getFemaleModel()`

  `String`

  `getMaleModel()`

  `String`

  `getModel(boolean female)`

  `ArrayList<String>`

  `getSpawnWith()`

  `ArrayList<String>`

  `getTextureChoices()`

  `zombie.asset.AssetType`

  `getType()`

  `boolean`

  `hasModel()`

  `boolean`

  `isHat()`

  `boolean`

  `isMask()`

  `String`

  `toString()`

  `static void`

  `tryGetCombinedMask(zombie.core.skinnedmodel.population.ClothingItemReference itemRef,
  zombie.core.skinnedmodel.model.CharacterMask mask)`

  `static void`

  `tryGetCombinedMask(ClothingItem item,
  zombie.core.skinnedmodel.model.CharacterMask mask)`

  ### Methods inherited from class zombie.asset.Asset

  `addDependency, getAssetManager, getObserverCb, getPath, getRefCount, getState, isEmpty, isFailure, isReady, onBeforeEmpty, onBeforeReady, onCreated, removeDependency, setAssetParams`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### guid

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid
  + ### maleModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maleModel
  + ### femaleModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") femaleModel
  + ### altMaleModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") altMaleModel
  + ### altFemaleModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") altFemaleModel
  + ### isStatic

    public boolean isStatic
  + ### baseTextures

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> baseTextures
  + ### attachBone

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachBone
  + ### masks

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> masks
  + ### masksFolder

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") masksFolder
  + ### underlayMasksFolder

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") underlayMasksFolder
  + ### textureChoices

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> textureChoices
  + ### allowRandomHue

    public boolean allowRandomHue
  + ### allowRandomTint

    public boolean allowRandomTint
  + ### decalGroup

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") decalGroup
  + ### shader

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") shader
  + ### hatCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hatCategory
  + ### spawnWith

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> spawnWith
  + ### s\_masksFolderDefault

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s\_masksFolderDefault

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.core.skinnedmodel.population.ClothingItem.s_masksFolderDefault)
  + ### mame

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mame
  + ### ASSET\_TYPE

    public static final zombie.asset.AssetType ASSET\_TYPE
* Constructor Details
  -------------------

  + ### ClothingItem

    public ClothingItem(zombie.asset.AssetPath path,
    zombie.asset.AssetManager assetManager)
* Method Details
  --------------

  + ### getBaseTextures

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getBaseTextures()
  + ### getTextureChoices

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTextureChoices()
  + ### GetATexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetATexture()
  + ### getSpawnWith

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSpawnWith()
  + ### getAllowRandomHue

    public boolean getAllowRandomHue()
  + ### getAllowRandomTint

    public boolean getAllowRandomTint()
  + ### getDecalGroup

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDecalGroup()
  + ### isHat

    public boolean isHat()
  + ### isMask

    public boolean isMask()
  + ### getCombinedMask

    public void getCombinedMask(zombie.core.skinnedmodel.model.CharacterMask mask)
  + ### hasModel

    public boolean hasModel()
  + ### getModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModel(boolean female)
  + ### getAltModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAltModel(boolean female)
  + ### getFemaleModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFemaleModel()
  + ### getMaleModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMaleModel()
  + ### getAltFemaleModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAltFemaleModel()
  + ### getAltMaleModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAltMaleModel()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### tryGetCombinedMask

    public static void tryGetCombinedMask(zombie.core.skinnedmodel.population.ClothingItemReference itemRef,
    zombie.core.skinnedmodel.model.CharacterMask mask)
  + ### tryGetCombinedMask

    public static void tryGetCombinedMask([ClothingItem](ClothingItem.html "class in zombie.core.skinnedmodel.population") item,
    zombie.core.skinnedmodel.model.CharacterMask mask)
  + ### getType

    public zombie.asset.AssetType getType()

    Specified by:
    :   `getType` in class `zombie.asset.Asset`