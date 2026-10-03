[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [EvolvedRecipe](EvolvedRecipe.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [DECIMAL\_FORMAT](#DECIMAL_FORMAT)
   2. [name](#name)
   3. [displayName](#displayName)
   4. [originalname](#originalname)
   5. [maxItems](#maxItems)
   6. [itemsList](#itemsList)
   7. [resultItem](#resultItem)
   8. [baseItem](#baseItem)
   9. [cookable](#cookable)
   10. [addIngredientIfCooked](#addIngredientIfCooked)
   11. [canAddSpicesEmpty](#canAddSpicesEmpty)
   12. [addIngredientSound](#addIngredientSound)
   13. [hidden](#hidden)
   14. [allowFrozenItem](#allowFrozenItem)
   15. [template](#template)
   16. [minimumWater](#minimumWater)
6. [Constructor Details](#constructor-detail)
   1. [EvolvedRecipe(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   2. [Load(String, String[])](#Load(java.lang.String,java.lang.String%5B%5D))
   3. [needToBeCooked(InventoryItem)](#needToBeCooked(zombie.inventory.InventoryItem))
   4. [getItemsCanBeUse(IsoGameCharacter, InventoryItem, ArrayList)](#getItemsCanBeUse(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,java.util.ArrayList))
   5. [isItemUsableInRecipe(IsoGameCharacter, InventoryItem, Integer)](#isItemUsableInRecipe(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,java.lang.Integer))
   6. [checkItemCanBeUse(ItemContainer, String, InventoryItem, int, ArrayList, IsoGameCharacter)](#checkItemCanBeUse(zombie.inventory.ItemContainer,java.lang.String,zombie.inventory.InventoryItem,int,java.util.ArrayList,zombie.characters.IsoGameCharacter))
   7. [addItem(InventoryItem, InventoryItem, IsoGameCharacter)](#addItem(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   8. [checkUniqueRecipe(InventoryItem)](#checkUniqueRecipe(zombie.inventory.InventoryItem))
   9. [addPoison(InventoryItem, InventoryItem, IsoGameCharacter, ItemContainer)](#addPoison(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,zombie.inventory.ItemContainer))
   10. [useSpice(Food, Food, float, int, IsoGameCharacter)](#useSpice(zombie.inventory.types.Food,zombie.inventory.types.Food,float,int,zombie.characters.IsoGameCharacter))
   11. [useSpice(InventoryItem, Food, int, int, IsoGameCharacter)](#useSpice(zombie.inventory.InventoryItem,zombie.inventory.types.Food,int,int,zombie.characters.IsoGameCharacter))
   12. [getItemRecipe(InventoryItem)](#getItemRecipe(zombie.inventory.InventoryItem))
   13. [getName()](#getName())
   14. [getOriginalname()](#getOriginalname())
   15. [getUntranslatedName()](#getUntranslatedName())
   16. [getBaseItem()](#getBaseItem())
   17. [getMinimumWater()](#getMinimumWater())
   18. [hasMinimumWater(InventoryItem)](#hasMinimumWater(zombie.inventory.InventoryItem))
   19. [getItemsList()](#getItemsList())
   20. [getPossibleItems()](#getPossibleItems())
   21. [getResultItem()](#getResultItem())
   22. [getFullResultItem()](#getFullResultItem())
   23. [isCookable()](#isCookable())
   24. [getMaxItems()](#getMaxItems())
   25. [isResultItem(InventoryItem)](#isResultItem(zombie.inventory.InventoryItem))
   26. [isSpiceAdded(InventoryItem, InventoryItem)](#isSpiceAdded(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))
   27. [getAddIngredientSound()](#getAddIngredientSound())
   28. [setIsHidden(boolean)](#setIsHidden(boolean))
   29. [isHidden()](#isHidden())
   30. [isAllowFrozenItem()](#isAllowFrozenItem())
   31. [setAllowFrozenItem(boolean)](#setAllowFrozenItem(boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class EvolvedRecipe
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.EvolvedRecipe

---

public final class EvolvedRecipe
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `addIngredientIfCooked`

  `String`

  `addIngredientSound`

  `boolean`

  `allowFrozenItem`

  `String`

  `baseItem`

  `boolean`

  `canAddSpicesEmpty`

  `boolean`

  `cookable`

  `private static final DecimalFormat`

  `DECIMAL_FORMAT`

  `String`

  `displayName`

  `boolean`

  `hidden`

  `final Map<String, ItemRecipe>`

  `itemsList`

  `int`

  `maxItems`

  `Float`

  `minimumWater`

  `String`

  `name`

  `private String`

  `originalname`

  `String`

  `resultItem`

  `String`

  `template`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `EvolvedRecipe(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `InventoryItem`

  `addItem(InventoryItem baseItem,
  InventoryItem usedItem,
  IsoGameCharacter chr)`

  `private void`

  `addPoison(InventoryItem usedItem,
  InventoryItem baseItem,
  IsoGameCharacter chr,
  ItemContainer usedItemContainer)`

  `private void`

  `checkItemCanBeUse(ItemContainer itemContainer,
  String type,
  InventoryItem baseItem,
  int cookingLvl,
  ArrayList<InventoryItem> result,
  IsoGameCharacter chr)`

  `private void`

  `checkUniqueRecipe(InventoryItem baseItem)`

  `String`

  `getAddIngredientSound()`

  `String`

  `getBaseItem()`

  `String`

  `getFullResultItem()`

  `ItemRecipe`

  `getItemRecipe(InventoryItem usedItem)`

  `ArrayList<InventoryItem>`

  `getItemsCanBeUse(IsoGameCharacter chr,
  InventoryItem baseItem,
  ArrayList<ItemContainer> containers)`

  `Map<String, ItemRecipe>`

  `getItemsList()`

  `int`

  `getMaxItems()`

  `float`

  `getMinimumWater()`

  `String`

  `getName()`

  `String`

  `getOriginalname()`

  `ArrayList<ItemRecipe>`

  `getPossibleItems()`

  `String`

  `getResultItem()`

  `String`

  `getUntranslatedName()`

  `boolean`

  `hasMinimumWater(InventoryItem item)`

  `boolean`

  `isAllowFrozenItem()`

  `boolean`

  `isCookable()`

  `boolean`

  `isHidden()`

  `boolean`

  `isItemUsableInRecipe(IsoGameCharacter chr,
  InventoryItem baseItem,
  Integer id)`

  `boolean`

  `isResultItem(InventoryItem item)`

  `boolean`

  `isSpiceAdded(InventoryItem baseItem,
  InventoryItem spiceItem)`

  `void`

  `Load(String name,
  String token)`

  `private void`

  `Load(String name,
  String[] strArray)`

  `boolean`

  `needToBeCooked(InventoryItem itemTest)`

  `void`

  `setAllowFrozenItem(boolean allow)`

  `void`

  `setIsHidden(boolean hide)`

  `private void`

  `useSpice(InventoryItem usedSpice,
  Food baseItem,
  int uses,
  int cookingLvl,
  IsoGameCharacter chr)`

  `private void`

  `useSpice(Food usedSpice,
  Food baseItem,
  float usedHunger,
  int cookingLvl,
  IsoGameCharacter chr)`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DECIMAL\_FORMAT

    private static final [DecimalFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/DecimalFormat.html "class or interface in java.text") DECIMAL\_FORMAT
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### displayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### originalname

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalname
  + ### maxItems

    public int maxItems
  + ### itemsList

    public final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ItemRecipe](ItemRecipe.html "class in zombie.scripting.objects")> itemsList
  + ### resultItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") resultItem
  + ### baseItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") baseItem
  + ### cookable

    public boolean cookable
  + ### addIngredientIfCooked

    public boolean addIngredientIfCooked
  + ### canAddSpicesEmpty

    public boolean canAddSpicesEmpty
  + ### addIngredientSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") addIngredientSound
  + ### hidden

    public boolean hidden
  + ### allowFrozenItem

    public boolean allowFrozenItem
  + ### template

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") template
  + ### minimumWater

    public [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang") minimumWater
* Constructor Details
  -------------------

  + ### EvolvedRecipe

    public EvolvedRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") token)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### Load

    private void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] strArray)
  + ### needToBeCooked

    public boolean needToBeCooked([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") itemTest)
  + ### getItemsCanBeUse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")> getItemsCanBeUse([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") baseItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### isItemUsableInRecipe

    public boolean isItemUsableInRecipe([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") baseItem,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") id)
  + ### checkItemCanBeUse

    private void checkItemCanBeUse([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") itemContainer,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") baseItem,
    int cookingLvl,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")> result,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") addItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") baseItem,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") usedItem,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### checkUniqueRecipe

    private void checkUniqueRecipe([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") baseItem)
  + ### addPoison

    private void addPoison([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") usedItem,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") baseItem,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") usedItemContainer)
  + ### useSpice

    private void useSpice([Food](../../inventory/types/Food.html "class in zombie.inventory.types") usedSpice,
    [Food](../../inventory/types/Food.html "class in zombie.inventory.types") baseItem,
    float usedHunger,
    int cookingLvl,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### useSpice

    private void useSpice([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") usedSpice,
    [Food](../../inventory/types/Food.html "class in zombie.inventory.types") baseItem,
    int uses,
    int cookingLvl,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getItemRecipe

    public [ItemRecipe](ItemRecipe.html "class in zombie.scripting.objects") getItemRecipe([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") usedItem)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getOriginalname

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOriginalname()
  + ### getUntranslatedName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUntranslatedName()
  + ### getBaseItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBaseItem()
  + ### getMinimumWater

    public float getMinimumWater()
  + ### hasMinimumWater

    public boolean hasMinimumWater([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getItemsList

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ItemRecipe](ItemRecipe.html "class in zombie.scripting.objects")> getItemsList()
  + ### getPossibleItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemRecipe](ItemRecipe.html "class in zombie.scripting.objects")> getPossibleItems()
  + ### getResultItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getResultItem()
  + ### getFullResultItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullResultItem()
  + ### isCookable

    public boolean isCookable()
  + ### getMaxItems

    public int getMaxItems()
  + ### isResultItem

    public boolean isResultItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isSpiceAdded

    public boolean isSpiceAdded([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") baseItem,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") spiceItem)
  + ### getAddIngredientSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAddIngredientSound()
  + ### setIsHidden

    public void setIsHidden(boolean hide)
  + ### isHidden

    public boolean isHidden()
  + ### isAllowFrozenItem

    public boolean isAllowFrozenItem()
  + ### setAllowFrozenItem

    public void setAllowFrozenItem(boolean allow)