[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.visual](package-summary.html)
2. [ItemVisual](ItemVisual.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fullType](#fullType)
   2. [clothingItemName](#clothingItemName)
   3. [alternateModelName](#alternateModelName)
   4. [NULL\_HUE](#NULL_HUE)
   5. [hue](#hue)
   6. [tint](#tint)
   7. [baseTexture](#baseTexture)
   8. [textureChoice](#textureChoice)
   9. [decal](#decal)
   10. [blood](#blood)
   11. [dirt](#dirt)
   12. [holes](#holes)
   13. [basicPatches](#basicPatches)
   14. [denimPatches](#denimPatches)
   15. [leatherPatches](#leatherPatches)
   16. [inventoryItem](#inventoryItem)
   17. [LASTSTAND\_VERSION1](#LASTSTAND_VERSION1)
   18. [LASTSTAND\_VERSION](#LASTSTAND_VERSION)
6. [Constructor Details](#constructor-detail)
   1. [ItemVisual()](#%3Cinit%3E())
   2. [ItemVisual(ItemVisual)](#%3Cinit%3E(zombie.core.skinnedmodel.visual.ItemVisual))
7. [Method Details](#method-detail)
   1. [setItemType(String)](#setItemType(java.lang.String))
   2. [getItemType()](#getItemType())
   3. [setAlternateModelName(String)](#setAlternateModelName(java.lang.String))
   4. [getAlternateModelName()](#getAlternateModelName())
   5. [toString()](#toString())
   6. [getClothingItemName()](#getClothingItemName())
   7. [setClothingItemName(String)](#setClothingItemName(java.lang.String))
   8. [getScriptItem()](#getScriptItem())
   9. [getClothingItem()](#getClothingItem())
   10. [getClothingItemCombinedMask(CharacterMask)](#getClothingItemCombinedMask(zombie.core.skinnedmodel.model.CharacterMask))
   11. [copyVisualFrom(ItemVisual)](#copyVisualFrom(zombie.core.skinnedmodel.visual.ItemVisual))
   12. [setHue(float)](#setHue(float))
   13. [getHue()](#getHue())
   14. [getHue(ClothingItem)](#getHue(zombie.core.skinnedmodel.population.ClothingItem))
   15. [setTint(ImmutableColor)](#setTint(zombie.core.ImmutableColor))
   16. [getTint(ClothingItem)](#getTint(zombie.core.skinnedmodel.population.ClothingItem))
   17. [getTint()](#getTint())
   18. [getBaseTexture(ClothingItem)](#getBaseTexture(zombie.core.skinnedmodel.population.ClothingItem))
   19. [getTextureChoice(ClothingItem)](#getTextureChoice(zombie.core.skinnedmodel.population.ClothingItem))
   20. [setDecal(String)](#setDecal(java.lang.String))
   21. [getDecal(ClothingItem)](#getDecal(zombie.core.skinnedmodel.population.ClothingItem))
   22. [pickUninitializedValues(ClothingItem)](#pickUninitializedValues(zombie.core.skinnedmodel.population.ClothingItem))
   23. [synchWithOutfit(ClothingItemReference)](#synchWithOutfit(zombie.core.skinnedmodel.population.ClothingItemReference))
   24. [clear()](#clear())
   25. [copyFrom(ItemVisual)](#copyFrom(zombie.core.skinnedmodel.visual.ItemVisual))
   26. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   27. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   28. [setDenimPatch(BloodBodyPartType)](#setDenimPatch(zombie.characterTextures.BloodBodyPartType))
   29. [getDenimPatch(BloodBodyPartType)](#getDenimPatch(zombie.characterTextures.BloodBodyPartType))
   30. [setLeatherPatch(BloodBodyPartType)](#setLeatherPatch(zombie.characterTextures.BloodBodyPartType))
   31. [getLeatherPatch(BloodBodyPartType)](#getLeatherPatch(zombie.characterTextures.BloodBodyPartType))
   32. [setBasicPatch(BloodBodyPartType)](#setBasicPatch(zombie.characterTextures.BloodBodyPartType))
   33. [getBasicPatch(BloodBodyPartType)](#getBasicPatch(zombie.characterTextures.BloodBodyPartType))
   34. [getBasicPatchesNumber()](#getBasicPatchesNumber())
   35. [setHole(BloodBodyPartType)](#setHole(zombie.characterTextures.BloodBodyPartType))
   36. [getHole(BloodBodyPartType)](#getHole(zombie.characterTextures.BloodBodyPartType))
   37. [getHolesNumber()](#getHolesNumber())
   38. [setBlood(BloodBodyPartType, float)](#setBlood(zombie.characterTextures.BloodBodyPartType,float))
   39. [getBlood(BloodBodyPartType)](#getBlood(zombie.characterTextures.BloodBodyPartType))
   40. [getDirt(BloodBodyPartType)](#getDirt(zombie.characterTextures.BloodBodyPartType))
   41. [setDirt(BloodBodyPartType, float)](#setDirt(zombie.characterTextures.BloodBodyPartType,float))
   42. [copyBlood(ItemVisual)](#copyBlood(zombie.core.skinnedmodel.visual.ItemVisual))
   43. [copyDirt(ItemVisual)](#copyDirt(zombie.core.skinnedmodel.visual.ItemVisual))
   44. [copyHoles(ItemVisual)](#copyHoles(zombie.core.skinnedmodel.visual.ItemVisual))
   45. [copyPatches(ItemVisual)](#copyPatches(zombie.core.skinnedmodel.visual.ItemVisual))
   46. [removeHole(int)](#removeHole(int))
   47. [removePatch(int)](#removePatch(int))
   48. [removeBlood()](#removeBlood())
   49. [removeDirt()](#removeDirt())
   50. [getTotalBlood()](#getTotalBlood())
   51. [getInventoryItem()](#getInventoryItem())
   52. [setInventoryItem(InventoryItem)](#setInventoryItem(zombie.inventory.InventoryItem))
   53. [setBaseTexture(int)](#setBaseTexture(int))
   54. [getBaseTexture()](#getBaseTexture())
   55. [setTextureChoice(int)](#setTextureChoice(int))
   56. [getTextureChoice()](#getTextureChoice())
   57. [toString(ImmutableColor, StringBuilder)](#toString(zombie.core.ImmutableColor,java.lang.StringBuilder))
   58. [colorFromString(String)](#colorFromString(java.lang.String))
   59. [getLastStandString()](#getLastStandString())
   60. [createLastStandItem(String)](#createLastStandItem(java.lang.String))
   61. [getDescription()](#getDescription())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class ItemVisual
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.visual.ItemVisual

---

public final class ItemVisual
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `alternateModelName`

  `int`

  `baseTexture`

  `private byte[]`

  `basicPatches`

  `private byte[]`

  `blood`

  `private String`

  `clothingItemName`

  `String`

  `decal`

  `private byte[]`

  `denimPatches`

  `private byte[]`

  `dirt`

  `private String`

  `fullType`

  `private byte[]`

  `holes`

  `float`

  `hue`

  `private InventoryItem`

  `inventoryItem`

  `private static final int`

  `LASTSTAND_VERSION`

  `private static final int`

  `LASTSTAND_VERSION1`

  `private byte[]`

  `leatherPatches`

  `static final float`

  `NULL_HUE`

  `int`

  `textureChoice`

  `ImmutableColor`

  `tint`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemVisual()`

  `ItemVisual(ItemVisual other)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `clear()`

  `private static ImmutableColor`

  `colorFromString(String str)`

  `void`

  `copyBlood(ItemVisual other)`

  `void`

  `copyDirt(ItemVisual other)`

  `void`

  `copyFrom(ItemVisual other)`

  `void`

  `copyHoles(ItemVisual other)`

  `void`

  `copyPatches(ItemVisual other)`

  `void`

  `copyVisualFrom(ItemVisual visual)`

  `static InventoryItem`

  `createLastStandItem(String saveStr)`

  `String`

  `getAlternateModelName()`

  `int`

  `getBaseTexture()`

  `String`

  `getBaseTexture(ClothingItem clothingItem)`

  `float`

  `getBasicPatch(BloodBodyPartType bodyPartType)`

  `int`

  `getBasicPatchesNumber()`

  `float`

  `getBlood(BloodBodyPartType bodyPartType)`

  `ClothingItem`

  `getClothingItem()`

  `void`

  `getClothingItemCombinedMask(zombie.core.skinnedmodel.model.CharacterMask mask)`

  `String`

  `getClothingItemName()`

  `String`

  `getDecal(ClothingItem clothingItem)`

  `float`

  `getDenimPatch(BloodBodyPartType bodyPartType)`

  `String`

  `getDescription()`

  `float`

  `getDirt(BloodBodyPartType bodyPartType)`

  `float`

  `getHole(BloodBodyPartType bodyPartType)`

  `int`

  `getHolesNumber()`

  `float`

  `getHue()`

  `float`

  `getHue(ClothingItem clothingItem)`

  `InventoryItem`

  `getInventoryItem()`

  `String`

  `getItemType()`

  `String`

  `getLastStandString()`

  `float`

  `getLeatherPatch(BloodBodyPartType bodyPartType)`

  `Item`

  `getScriptItem()`

  `int`

  `getTextureChoice()`

  `String`

  `getTextureChoice(ClothingItem clothingItem)`

  `ImmutableColor`

  `getTint()`

  `ImmutableColor`

  `getTint(ClothingItem clothingItem)`

  `float`

  `getTotalBlood()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `pickUninitializedValues(ClothingItem clothingItem)`

  `void`

  `removeBlood()`

  `void`

  `removeDirt()`

  `void`

  `removeHole(int bodyPartIndex)`

  `void`

  `removePatch(int bodyPartIndex)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setAlternateModelName(String name)`

  `void`

  `setBaseTexture(int baseTexture)`

  `void`

  `setBasicPatch(BloodBodyPartType bodyPartType)`

  `void`

  `setBlood(BloodBodyPartType bodyPartType,
  float amount)`

  `void`

  `setClothingItemName(String name)`

  `void`

  `setDecal(String decalName)`

  `void`

  `setDenimPatch(BloodBodyPartType bodyPartType)`

  `void`

  `setDirt(BloodBodyPartType bodyPartType,
  float amount)`

  `void`

  `setHole(BloodBodyPartType bodyPartType)`

  `void`

  `setHue(float hue)`

  `void`

  `setInventoryItem(InventoryItem inventoryItem)`

  `void`

  `setItemType(String fullType)`

  `void`

  `setLeatherPatch(BloodBodyPartType bodyPartType)`

  `void`

  `setTextureChoice(int textureChoice)`

  `void`

  `setTint(ImmutableColor tint)`

  `void`

  `synchWithOutfit(zombie.core.skinnedmodel.population.ClothingItemReference itemRef)`

  `String`

  `toString()`

  `private static StringBuilder`

  `toString(ImmutableColor color,
  StringBuilder sb)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### fullType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType
  + ### clothingItemName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clothingItemName
  + ### alternateModelName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alternateModelName
  + ### NULL\_HUE

    public static final float NULL\_HUE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.core.skinnedmodel.visual.ItemVisual.NULL_HUE)
  + ### hue

    public float hue
  + ### tint

    public [ImmutableColor](../../ImmutableColor.html "class in zombie.core") tint
  + ### baseTexture

    public int baseTexture
  + ### textureChoice

    public int textureChoice
  + ### decal

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") decal
  + ### blood

    private byte[] blood
  + ### dirt

    private byte[] dirt
  + ### holes

    private byte[] holes
  + ### basicPatches

    private byte[] basicPatches
  + ### denimPatches

    private byte[] denimPatches
  + ### leatherPatches

    private byte[] leatherPatches
  + ### inventoryItem

    private [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem
  + ### LASTSTAND\_VERSION1

    private static final int LASTSTAND\_VERSION1

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.core.skinnedmodel.visual.ItemVisual.LASTSTAND_VERSION1)
  + ### LASTSTAND\_VERSION

    private static final int LASTSTAND\_VERSION

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.core.skinnedmodel.visual.ItemVisual.LASTSTAND_VERSION)
* Constructor Details
  -------------------

  + ### ItemVisual

    public ItemVisual()
  + ### ItemVisual

    public ItemVisual([ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") other)
* Method Details
  --------------

  + ### setItemType

    public void setItemType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType)
  + ### getItemType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemType()
  + ### setAlternateModelName

    public void setAlternateModelName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAlternateModelName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAlternateModelName()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getClothingItemName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClothingItemName()
  + ### setClothingItemName

    public void setClothingItemName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getScriptItem

    public [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") getScriptItem()
  + ### getClothingItem

    public [ClothingItem](../population/ClothingItem.html "class in zombie.core.skinnedmodel.population") getClothingItem()
  + ### getClothingItemCombinedMask

    public void getClothingItemCombinedMask(zombie.core.skinnedmodel.model.CharacterMask mask)
  + ### copyVisualFrom

    public void copyVisualFrom([ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") visual)
  + ### setHue

    public void setHue(float hue)
  + ### getHue

    public float getHue()
  + ### getHue

    public float getHue([ClothingItem](../population/ClothingItem.html "class in zombie.core.skinnedmodel.population") clothingItem)
  + ### setTint

    public void setTint([ImmutableColor](../../ImmutableColor.html "class in zombie.core") tint)
  + ### getTint

    public [ImmutableColor](../../ImmutableColor.html "class in zombie.core") getTint([ClothingItem](../population/ClothingItem.html "class in zombie.core.skinnedmodel.population") clothingItem)
  + ### getTint

    public [ImmutableColor](../../ImmutableColor.html "class in zombie.core") getTint()
  + ### getBaseTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBaseTexture([ClothingItem](../population/ClothingItem.html "class in zombie.core.skinnedmodel.population") clothingItem)
  + ### getTextureChoice

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextureChoice([ClothingItem](../population/ClothingItem.html "class in zombie.core.skinnedmodel.population") clothingItem)
  + ### setDecal

    public void setDecal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") decalName)
  + ### getDecal

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDecal([ClothingItem](../population/ClothingItem.html "class in zombie.core.skinnedmodel.population") clothingItem)
  + ### pickUninitializedValues

    public void pickUninitializedValues([ClothingItem](../population/ClothingItem.html "class in zombie.core.skinnedmodel.population") clothingItem)
  + ### synchWithOutfit

    public void synchWithOutfit(zombie.core.skinnedmodel.population.ClothingItemReference itemRef)
  + ### clear

    public void clear()
  + ### copyFrom

    public void copyFrom([ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") other)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### setDenimPatch

    public void setDenimPatch([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### getDenimPatch

    public float getDenimPatch([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### setLeatherPatch

    public void setLeatherPatch([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### getLeatherPatch

    public float getLeatherPatch([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### setBasicPatch

    public void setBasicPatch([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### getBasicPatch

    public float getBasicPatch([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### getBasicPatchesNumber

    public int getBasicPatchesNumber()
  + ### setHole

    public void setHole([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### getHole

    public float getHole([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### getHolesNumber

    public int getHolesNumber()
  + ### setBlood

    public void setBlood([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType,
    float amount)
  + ### getBlood

    public float getBlood([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### getDirt

    public float getDirt([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType)
  + ### setDirt

    public void setDirt([BloodBodyPartType](../../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bodyPartType,
    float amount)
  + ### copyBlood

    public void copyBlood([ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") other)
  + ### copyDirt

    public void copyDirt([ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") other)
  + ### copyHoles

    public void copyHoles([ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") other)
  + ### copyPatches

    public void copyPatches([ItemVisual](ItemVisual.html "class in zombie.core.skinnedmodel.visual") other)
  + ### removeHole

    public void removeHole(int bodyPartIndex)
  + ### removePatch

    public void removePatch(int bodyPartIndex)
  + ### removeBlood

    public void removeBlood()
  + ### removeDirt

    public void removeDirt()
  + ### getTotalBlood

    public float getTotalBlood()
  + ### getInventoryItem

    public [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") getInventoryItem()
  + ### setInventoryItem

    public void setInventoryItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### setBaseTexture

    public void setBaseTexture(int baseTexture)
  + ### getBaseTexture

    public int getBaseTexture()
  + ### setTextureChoice

    public void setTextureChoice(int textureChoice)
  + ### getTextureChoice

    public int getTextureChoice()
  + ### toString

    private static [StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") toString([ImmutableColor](../../ImmutableColor.html "class in zombie.core") color,
    [StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") sb)
  + ### colorFromString

    private static [ImmutableColor](../../ImmutableColor.html "class in zombie.core") colorFromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getLastStandString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastStandString()
  + ### createLastStandItem

    public static [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") createLastStandItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveStr)
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()