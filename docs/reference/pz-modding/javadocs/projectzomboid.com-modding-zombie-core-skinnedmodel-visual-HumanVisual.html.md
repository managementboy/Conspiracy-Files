[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.visual](package-summary.html)
2. [HumanVisual](HumanVisual.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [owner](#owner)
   2. [skinColor](#skinColor)
   3. [skinTexture](#skinTexture)
   4. [skinTextureName](#skinTextureName)
   5. [zombieRotStage](#zombieRotStage)
   6. [hairColor](#hairColor)
   7. [beardColor](#beardColor)
   8. [naturalHairColor](#naturalHairColor)
   9. [naturalBeardColor](#naturalBeardColor)
   10. [hairModel](#hairModel)
   11. [beardModel](#beardModel)
   12. [bodyHair](#bodyHair)
   13. [blood](#blood)
   14. [dirt](#dirt)
   15. [holes](#holes)
   16. [bodyVisuals](#bodyVisuals)
   17. [outfit](#outfit)
   18. [nonAttachedHair](#nonAttachedHair)
   19. [forceModel](#forceModel)
   20. [forceModelScript](#forceModelScript)
   21. [itemVisualLocations](#itemVisualLocations)
   22. [LASTSTAND\_VERSION1](#LASTSTAND_VERSION1)
   23. [LASTSTAND\_VERSION](#LASTSTAND_VERSION)
6. [Constructor Details](#constructor-detail)
   1. [HumanVisual(IHumanVisual)](#%3Cinit%3E(zombie.core.skinnedmodel.visual.IHumanVisual))
7. [Method Details](#method-detail)
   1. [isFemale()](#isFemale())
   2. [isZombie()](#isZombie())
   3. [isSkeleton()](#isSkeleton())
   4. [setSkinColor(ImmutableColor)](#setSkinColor(zombie.core.ImmutableColor))
   5. [getSkinColor()](#getSkinColor())
   6. [setBodyHairIndex(int)](#setBodyHairIndex(int))
   7. [getBodyHairIndex()](#getBodyHairIndex())
   8. [setSkinTextureIndex(int)](#setSkinTextureIndex(int))
   9. [getSkinTextureIndex()](#getSkinTextureIndex())
   10. [setSkinTextureName(String)](#setSkinTextureName(java.lang.String))
   11. [lerp(float, float, float)](#lerp(float,float,float))
   12. [pickRandomZombieRotStage()](#pickRandomZombieRotStage())
   13. [getSkinTexture()](#getSkinTexture())
   14. [setHairColor(ImmutableColor)](#setHairColor(zombie.core.ImmutableColor))
   15. [getHairColor()](#getHairColor())
   16. [setBeardColor(ImmutableColor)](#setBeardColor(zombie.core.ImmutableColor))
   17. [getBeardColor()](#getBeardColor())
   18. [setNaturalHairColor(ImmutableColor)](#setNaturalHairColor(zombie.core.ImmutableColor))
   19. [getNaturalHairColor()](#getNaturalHairColor())
   20. [setNaturalBeardColor(ImmutableColor)](#setNaturalBeardColor(zombie.core.ImmutableColor))
   21. [getNaturalBeardColor()](#getNaturalBeardColor())
   22. [setHairModel(String)](#setHairModel(java.lang.String))
   23. [getHairModel()](#getHairModel())
   24. [setBeardModel(String)](#setBeardModel(java.lang.String))
   25. [getBeardModel()](#getBeardModel())
   26. [setBlood(BloodBodyPartType, float)](#setBlood(zombie.characterTextures.BloodBodyPartType,float))
   27. [getBlood(BloodBodyPartType)](#getBlood(zombie.characterTextures.BloodBodyPartType))
   28. [setDirt(BloodBodyPartType, float)](#setDirt(zombie.characterTextures.BloodBodyPartType,float))
   29. [getDirt(BloodBodyPartType)](#getDirt(zombie.characterTextures.BloodBodyPartType))
   30. [setHole(BloodBodyPartType)](#setHole(zombie.characterTextures.BloodBodyPartType))
   31. [getHole(BloodBodyPartType)](#getHole(zombie.characterTextures.BloodBodyPartType))
   32. [removeBlood()](#removeBlood())
   33. [removeDirt()](#removeDirt())
   34. [randomBlood()](#randomBlood())
   35. [randomDirt()](#randomDirt())
   36. [getTotalBlood()](#getTotalBlood())
   37. [clear()](#clear())
   38. [copyFrom(BaseVisual)](#copyFrom(zombie.core.skinnedmodel.visual.BaseVisual))
   39. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   40. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   41. [getModel()](#getModel())
   42. [getModelScript()](#getModelScript())
   43. [GetMask(ItemVisuals)](#GetMask(zombie.core.skinnedmodel.visual.ItemVisuals))
   44. [synchWithOutfit(Outfit)](#synchWithOutfit(zombie.core.skinnedmodel.population.Outfit))
   45. [dressInNamedOutfit(String, ItemVisuals)](#dressInNamedOutfit(java.lang.String,zombie.core.skinnedmodel.visual.ItemVisuals))
   46. [dressInNamedOutfit(String, ItemVisuals, boolean)](#dressInNamedOutfit(java.lang.String,zombie.core.skinnedmodel.visual.ItemVisuals,boolean))
   47. [dressInClothingItem(String, ItemVisuals)](#dressInClothingItem(java.lang.String,zombie.core.skinnedmodel.visual.ItemVisuals))
   48. [dressInClothingItem(String, ItemVisuals, boolean)](#dressInClothingItem(java.lang.String,zombie.core.skinnedmodel.visual.ItemVisuals,boolean))
   49. [dressInOutfit(Outfit, ItemVisuals)](#dressInOutfit(zombie.core.skinnedmodel.population.Outfit,zombie.core.skinnedmodel.visual.ItemVisuals))
   50. [getBodyVisuals()](#getBodyVisuals())
   51. [addBodyVisual(String)](#addBodyVisual(java.lang.String))
   52. [addBodyVisualFromItemType(String)](#addBodyVisualFromItemType(java.lang.String))
   53. [addBodyVisualFromClothingItemName(String)](#addBodyVisualFromClothingItemName(java.lang.String))
   54. [removeBodyVisualFromItemType(String)](#removeBodyVisualFromItemType(java.lang.String))
   55. [hasBodyVisualFromItemType(String)](#hasBodyVisualFromItemType(java.lang.String))
   56. [getItemVisualLocations(ItemVisuals, List)](#getItemVisualLocations(zombie.core.skinnedmodel.visual.ItemVisuals,java.util.List))
   57. [addClothingItem(ItemVisuals, Item)](#addClothingItem(zombie.core.skinnedmodel.visual.ItemVisuals,zombie.scripting.objects.Item))
   58. [addClothingItem(ItemVisuals, ClothingItem)](#addClothingItem(zombie.core.skinnedmodel.visual.ItemVisuals,zombie.core.skinnedmodel.population.ClothingItem))
   59. [addClothingItem(ItemVisuals, List, String, ClothingItemReference)](#addClothingItem(zombie.core.skinnedmodel.visual.ItemVisuals,java.util.List,java.lang.String,zombie.core.skinnedmodel.population.ClothingItemReference))
   60. [getOutfit()](#getOutfit())
   61. [setOutfit(Outfit)](#setOutfit(zombie.core.skinnedmodel.population.Outfit))
   62. [getNonAttachedHair()](#getNonAttachedHair())
   63. [setNonAttachedHair(String)](#setNonAttachedHair(java.lang.String))
   64. [setForceModel(Model)](#setForceModel(zombie.core.skinnedmodel.model.Model))
   65. [setForceModelScript(String)](#setForceModelScript(java.lang.String))
   66. [toString(ImmutableColor, StringBuilder)](#toString(zombie.core.ImmutableColor,java.lang.StringBuilder))
   67. [colorFromString(String)](#colorFromString(java.lang.String))
   68. [getLastStandString()](#getLastStandString())
   69. [loadLastStandString(String)](#loadLastStandString(java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class HumanVisual
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.visual.BaseVisual

zombie.core.skinnedmodel.visual.HumanVisual

---

public class HumanVisual
extends zombie.core.skinnedmodel.visual.BaseVisual

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ImmutableColor`

  `beardColor`

  `private String`

  `beardModel`

  `private final byte[]`

  `blood`

  `private int`

  `bodyHair`

  `private final ItemVisuals`

  `bodyVisuals`

  `private final byte[]`

  `dirt`

  `private zombie.core.skinnedmodel.model.Model`

  `forceModel`

  `private String`

  `forceModelScript`

  `private ImmutableColor`

  `hairColor`

  `private String`

  `hairModel`

  `private final byte[]`

  `holes`

  `private static final List<ItemBodyLocation>`

  `itemVisualLocations`

  `private static final int`

  `LASTSTAND_VERSION`

  `private static final int`

  `LASTSTAND_VERSION1`

  `private ImmutableColor`

  `naturalBeardColor`

  `private ImmutableColor`

  `naturalHairColor`

  `private String`

  `nonAttachedHair`

  `private zombie.core.skinnedmodel.population.Outfit`

  `outfit`

  `private final IHumanVisual`

  `owner`

  `private ImmutableColor`

  `skinColor`

  `private int`

  `skinTexture`

  `protected String`

  `skinTextureName`

  `int`

  `zombieRotStage`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `HumanVisual(IHumanVisual owner)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ItemVisual`

  `addBodyVisual(String clothingItemName)`

  `ItemVisual`

  `addBodyVisualFromClothingItemName(String clothingItemName)`

  `ItemVisual`

  `addBodyVisualFromItemType(String itemType)`

  `private ItemVisual`

  `addClothingItem(ItemVisuals itemVisuals,
  List<ItemBodyLocation> itemVisualLocations,
  String clothingName,
  zombie.core.skinnedmodel.population.ClothingItemReference itemRef)`

  `ItemVisual`

  `addClothingItem(ItemVisuals itemVisuals,
  ClothingItem clothingItem)`

  `ItemVisual`

  `addClothingItem(ItemVisuals itemVisuals,
  Item scriptItem)`

  `void`

  `clear()`

  `private static ImmutableColor`

  `colorFromString(String str)`

  `void`

  `copyFrom(zombie.core.skinnedmodel.visual.BaseVisual baseVisual)`

  `void`

  `dressInClothingItem(String itemGUID,
  ItemVisuals itemVisuals)`

  `void`

  `dressInClothingItem(String itemGUID,
  ItemVisuals itemVisuals,
  boolean clearCurrentVisuals)`

  `void`

  `dressInNamedOutfit(String outfitName,
  ItemVisuals itemVisuals)`

  `void`

  `dressInNamedOutfit(String outfitName,
  ItemVisuals itemVisuals,
  boolean clear)`

  `private void`

  `dressInOutfit(zombie.core.skinnedmodel.population.Outfit outfit,
  ItemVisuals itemVisuals)`

  `ImmutableColor`

  `getBeardColor()`

  `String`

  `getBeardModel()`

  `float`

  `getBlood(BloodBodyPartType bodyPartType)`

  `int`

  `getBodyHairIndex()`

  `ItemVisuals`

  `getBodyVisuals()`

  `float`

  `getDirt(BloodBodyPartType bodyPartType)`

  `ImmutableColor`

  `getHairColor()`

  `String`

  `getHairModel()`

  `float`

  `getHole(BloodBodyPartType bodyPartType)`

  `private void`

  `getItemVisualLocations(ItemVisuals itemVisuals,
  List<ItemBodyLocation> itemVisualLocations)`

  `String`

  `getLastStandString()`

  `static zombie.core.skinnedmodel.model.CharacterMask`

  `GetMask(ItemVisuals itemVisuals)`

  `zombie.core.skinnedmodel.model.Model`

  `getModel()`

  `ModelScript`

  `getModelScript()`

  `ImmutableColor`

  `getNaturalBeardColor()`

  `ImmutableColor`

  `getNaturalHairColor()`

  `String`

  `getNonAttachedHair()`

  `zombie.core.skinnedmodel.population.Outfit`

  `getOutfit()`

  `ImmutableColor`

  `getSkinColor()`

  `String`

  `getSkinTexture()`

  `int`

  `getSkinTextureIndex()`

  `float`

  `getTotalBlood()`

  `boolean`

  `hasBodyVisualFromItemType(String itemType)`

  `boolean`

  `isFemale()`

  `boolean`

  `isSkeleton()`

  `boolean`

  `isZombie()`

  `float`

  `lerp(float start,
  float end,
  float delta)`

  `void`

  `load(ByteBuffer input,
  int worldversion)`

  `boolean`

  `loadLastStandString(String saveStr)`

  `int`

  `pickRandomZombieRotStage()`

  `void`

  `randomBlood()`

  `void`

  `randomDirt()`

  `void`

  `removeBlood()`

  `ItemVisual`

  `removeBodyVisualFromItemType(String itemType)`

  `void`

  `removeDirt()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setBeardColor(ImmutableColor color)`

  `void`

  `setBeardModel(String model)`

  `void`

  `setBlood(BloodBodyPartType bodyPartType,
  float amount)`

  `void`

  `setBodyHairIndex(int index)`

  `void`

  `setDirt(BloodBodyPartType bodyPartType,
  float amount)`

  `void`

  `setForceModel(zombie.core.skinnedmodel.model.Model model)`

  `void`

  `setForceModelScript(String modelScript)`

  `void`

  `setHairColor(ImmutableColor color)`

  `void`

  `setHairModel(String model)`

  `void`

  `setHole(BloodBodyPartType bodyPartType)`

  `void`

  `setNaturalBeardColor(ImmutableColor color)`

  `void`

  `setNaturalHairColor(ImmutableColor color)`

  `void`

  `setNonAttachedHair(String nonAttachedHair)`

  `void`

  `setOutfit(zombie.core.skinnedmodel.population.Outfit outfit)`

  `void`

  `setSkinColor(ImmutableColor color)`

  `void`

  `setSkinTextureIndex(int index)`

  `void`

  `setSkinTextureName(String textureName)`

  `void`

  `synchWithOutfit(zombie.core.skinnedmodel.population.Outfit outfit)`

  `private static StringBuilder`

  `toString(ImmutableColor color,
  StringBuilder sb)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### owner

    private final [IHumanVisual](IHumanVisual.html "interface in zombie.core.skinnedmodel.visual") owner
  + ### skinColor

    private [ImmutableColor](../../ImmutableColor.html "class in zombie.core") skinColor
  + ### skinTexture

    private int skinTexture
  + ### skinTextureName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") skinTextureName
  + ### zombieRotStage

    public int zombieRotStage
  + ### hairColor

    private [ImmutableColor](../../ImmutableColor.html "class in zombie.core") hairColor
  + ### beardColor

    private [ImmutableColor](../../ImmutableColor.html "class in zombie.core") beardColor
  + ### naturalHairColor

    private [ImmutableColor](../../ImmutableColor.html "class in zombie.core") naturalHairColor
  + ### naturalBeardColor

    private [ImmutableColor](../../ImmutableColor.html "class in zombie.core") naturalBeardColor
  + ### hairModel

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hairModel
  + ### beardModel

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") beardModel
  + ### bodyHair

    private int bodyHair
  + ### blood

    private final byte[] blood
  + ### dirt

    private final byte[] dirt
  + ### holes

    private final byte[] holes
  + ### bodyVisuals

    private final [ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") bodyVisuals
  + ### outfit

    private zombie.core.skinnedmodel.population.Outfit outfit
  + ### nonAttachedHair

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nonAttachedHair
  + ### forceModel

    private zombie.core.skinnedmodel.model.Model forceModel
  + ### forceModelScript

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") forceModelScript
  + ### itemVisualLocations

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[ItemBodyLocation](../../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects")> itemVisualLocations
  + ### LASTSTAND\_VERSION1

    private static final int LASTSTAND\_VERSION1

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.core.skinnedmodel.visual.HumanVisual.LASTSTAND_VERSION1)
  + ### LASTSTAND\_VERSION

    private static final int LASTSTAND\_VERSION

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.core.skinnedmodel.visual.HumanVisual.LASTSTAND_VERSION)
* Constructor Details
  -------------------

  + ### HumanVisual

    public HumanVisual([IHumanVisual](IHumanVisual.html "interface in zombie.core.skinnedmodel.visual") owner)
* Method Details
  --------------

  + ### isFemale

    public boolean isFemale()
  + ### isZombie

    public boolean isZombie()
  + ### isSkeleton

    public boolean isSkeleton()
  + ### setSkinColor

    public void setSkinColor([ImmutableColor](../../ImmutableColor.html "class in zombie.core") color)
  + ### getSkinColor

    public [ImmutableColor](../../ImmutableColor.html "class in zombie.core") getSkinColor()
  + ### setBodyHairIndex

    public void setBodyHairIndex(int index)
  + ### getBodyHairIndex

    public int getBodyHairIndex()
  + ### setSkinTextureIndex

    public void setSkinTextureIndex(int index)
  + ### getSkinTextureIndex

    public int getSkinTextureIndex()
  + ### setSkinTextureName

    public void setSkinTextureName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName)
  + ### lerp

    public float lerp(float start,
    float end,
    float delta)
  + ### pickRandomZombieRotStage

    public int pickRandomZombieRotStage()
  + ### getSkinTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSkinTexture()
  + ### setHairColor

    public void setHairColor([ImmutableColor](../../ImmutableColor.html "class in zombie.core") color)
  + ### getHairColor

    public [ImmutableColor](../../ImmutableColor.html "class in zombie.core") getHairColor()
  + ### setBeardColor

    public void setBeardColor([ImmutableColor](../../ImmutableColor.html "class in zombie.core") color)
  + ### getBeardColor

    public [ImmutableColor](../../ImmutableColor.html "class in zombie.core") getBeardColor()
  + ### setNaturalHairColor

    public void setNaturalHairColor([ImmutableColor](../../ImmutableColor.html "class in zombie.core") color)
  + ### getNaturalHairColor

    public [ImmutableColor](../../ImmutableColor.html "class in zombie.core") getNaturalHairColor()
  + ### setNaturalBeardColor

    public void setNaturalBeardColor([ImmutableColor](../../ImmutableColor.html "class in zombie.core") color)
  + ### getNaturalBeardColor

    public [ImmutableColor](../../ImmutableColor.html "class in zombie.core") getNaturalBeardColor()
  + ### setHairModel

    public void setHairModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") model)
  + ### getHairModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHairModel()
  + ### setBeardModel

    public void setBeardModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") model)
  + ### getBeardModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBeardModel()
  + ### setBlood

    public void setBlood([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType,
    float amount)
  + ### getBlood

    public float getBlood([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### setDirt

    public void setDirt([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType,
    float amount)
  + ### getDirt

    public float getDirt([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### setHole

    public void setHole([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### getHole

    public float getHole([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### removeBlood

    public void removeBlood()
  + ### removeDirt

    public void removeDirt()
  + ### randomBlood

    public void randomBlood()
  + ### randomDirt

    public void randomDirt()
  + ### getTotalBlood

    public float getTotalBlood()
  + ### clear

    public void clear()

    Specified by:
    :   `clear` in class `zombie.core.skinnedmodel.visual.BaseVisual`
  + ### copyFrom

    public void copyFrom(zombie.core.skinnedmodel.visual.BaseVisual baseVisual)

    Specified by:
    :   `copyFrom` in class `zombie.core.skinnedmodel.visual.BaseVisual`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `save` in class `zombie.core.skinnedmodel.visual.BaseVisual`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldversion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `load` in class `zombie.core.skinnedmodel.visual.BaseVisual`

    Throws:
    :   `IOException`
  + ### getModel

    public zombie.core.skinnedmodel.model.Model getModel()

    Specified by:
    :   `getModel` in class `zombie.core.skinnedmodel.visual.BaseVisual`
  + ### getModelScript

    public [ModelScript](../../../scripting/objects/ModelScript.html "class in zombie.scripting.objects") getModelScript()

    Specified by:
    :   `getModelScript` in class `zombie.core.skinnedmodel.visual.BaseVisual`
  + ### GetMask

    public static zombie.core.skinnedmodel.model.CharacterMask GetMask([ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)
  + ### synchWithOutfit

    public void synchWithOutfit(zombie.core.skinnedmodel.population.Outfit outfit)
  + ### dressInNamedOutfit

    public void dressInNamedOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName,
    [ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)

    Specified by:
    :   `dressInNamedOutfit` in class `zombie.core.skinnedmodel.visual.BaseVisual`
  + ### dressInNamedOutfit

    public void dressInNamedOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName,
    [ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals,
    boolean clear)
  + ### dressInClothingItem

    public void dressInClothingItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemGUID,
    [ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)
  + ### dressInClothingItem

    public void dressInClothingItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemGUID,
    [ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals,
    boolean clearCurrentVisuals)
  + ### dressInOutfit

    private void dressInOutfit(zombie.core.skinnedmodel.population.Outfit outfit,
    [ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)
  + ### getBodyVisuals

    public [ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") getBodyVisuals()
  + ### addBodyVisual

    public [ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") addBodyVisual([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clothingItemName)
  + ### addBodyVisualFromItemType

    public [ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") addBodyVisualFromItemType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### addBodyVisualFromClothingItemName

    public [ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") addBodyVisualFromClothingItemName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clothingItemName)
  + ### removeBodyVisualFromItemType

    public [ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") removeBodyVisualFromItemType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### hasBodyVisualFromItemType

    public boolean hasBodyVisualFromItemType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### getItemVisualLocations

    private void getItemVisualLocations([ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[ItemBodyLocation](../../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects")> itemVisualLocations)
  + ### addClothingItem

    public [ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") addClothingItem([ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals,
    [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") scriptItem)
  + ### addClothingItem

    public [ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") addClothingItem([ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals,
    [ClothingItem](../population/ClothingItem.html "class in zombie.core.skinnedmodel.population") clothingItem)
  + ### addClothingItem

    private [ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") addClothingItem([ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[ItemBodyLocation](../../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects")> itemVisualLocations,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clothingName,
    zombie.core.skinnedmodel.population.ClothingItemReference itemRef)
  + ### getOutfit

    public zombie.core.skinnedmodel.population.Outfit getOutfit()
  + ### setOutfit

    public void setOutfit(zombie.core.skinnedmodel.population.Outfit outfit)
  + ### getNonAttachedHair

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNonAttachedHair()
  + ### setNonAttachedHair

    public void setNonAttachedHair([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nonAttachedHair)
  + ### setForceModel

    public void setForceModel(zombie.core.skinnedmodel.model.Model model)
  + ### setForceModelScript

    public void setForceModelScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modelScript)
  + ### toString

    private static [StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") toString([ImmutableColor](../../ImmutableColor.html "class in zombie.core") color,
    [StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") sb)
  + ### colorFromString

    private static [ImmutableColor](../../ImmutableColor.html "class in zombie.core") colorFromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getLastStandString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastStandString()
  + ### loadLastStandString

    public boolean loadLastStandString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveStr)