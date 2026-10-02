[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.recipemanager](package-summary.html)
2. [ItemRecipe](ItemRecipe.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [FLUID\_PREFIX](#FLUID_PREFIX)
   2. [pool](#pool)
   3. [recipe](#recipe)
   4. [character](#character)
   5. [selectedItem](#selectedItem)
   6. [allItems](#allItems)
   7. [valid](#valid)
   8. [hasCollectedSources](#hasCollectedSources)
   9. [usedItemProperties](#usedItemProperties)
   10. [sourceRecords](#sourceRecords)
   11. [allSourceItems](#allSourceItems)
   12. [allResultItems](#allResultItems)
   13. [resultsPerType](#resultsPerType)
6. [Constructor Details](#constructor-detail)
   1. [ItemRecipe()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getNumberOfTimesRecipeCanBeDone(Recipe, IsoGameCharacter, ArrayList, InventoryItem)](#getNumberOfTimesRecipeCanBeDone(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.inventory.InventoryItem))
   2. [Alloc(Recipe, IsoGameCharacter, ArrayList, InventoryItem, ArrayList, boolean)](#Alloc(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.inventory.InventoryItem,java.util.ArrayList,boolean))
   3. [Release(ItemRecipe)](#Release(zombie.inventory.recipemanager.ItemRecipe))
   4. [getRecipe()](#getRecipe())
   5. [getCharacter()](#getCharacter())
   6. [getSelectedItem()](#getSelectedItem())
   7. [isValid()](#isValid())
   8. [ensureResultsPerType(int)](#ensureResultsPerType(int))
   9. [getRecipeName()](#getRecipeName())
   10. [reset()](#reset())
   11. [init(Recipe, IsoGameCharacter, ArrayList, InventoryItem, ArrayList, boolean)](#init(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.inventory.InventoryItem,java.util.ArrayList,boolean))
   12. [collectSourceItems()](#collectSourceItems())
   13. [getNumberOfTimesRecipeCanBeDone()](#getNumberOfTimesRecipeCanBeDone())
   14. [perform()](#perform())
   15. [getSourceItems()](#getSourceItems())
   16. [getSourceItems(int)](#getSourceItems(int))
   17. [testItem(InventoryItem)](#testItem(zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ItemRecipe
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.recipemanager.ItemRecipe

---

public class ItemRecipe
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `allItems`

  `private final ArrayList<InventoryItem>`

  `allResultItems`

  `private final ArrayList<InventoryItem>`

  `allSourceItems`

  `private IsoGameCharacter`

  `character`

  `static final String`

  `FLUID_PREFIX`

  `private boolean`

  `hasCollectedSources`

  `private static final ArrayDeque<ItemRecipe>`

  `pool`

  `private Recipe`

  `recipe`

  `private ArrayList<InventoryItem>[]`

  `resultsPerType`

  `private InventoryItem`

  `selectedItem`

  `private final ArrayList<zombie.inventory.recipemanager.SourceRecord>`

  `sourceRecords`

  `private final zombie.inventory.recipemanager.UsedItemProperties`

  `usedItemProperties`

  `private boolean`

  `valid`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ItemRecipe()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ItemRecipe`

  `Alloc(Recipe recipe,
  IsoGameCharacter character,
  ArrayList<ItemContainer> containers,
  InventoryItem selectedItem,
  ArrayList<InventoryItem> ignoreItems,
  boolean allItems)`

  Note: the returned ItemRecipe needs to be released after usage.

  `private void`

  `collectSourceItems()`

  `private void`

  `ensureResultsPerType(int amount)`

  `protected IsoGameCharacter`

  `getCharacter()`

  `private int`

  `getNumberOfTimesRecipeCanBeDone()`

  `static int`

  `getNumberOfTimesRecipeCanBeDone(Recipe recipe,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers,
  InventoryItem selectedItem)`

  `protected Recipe`

  `getRecipe()`

  `protected String`

  `getRecipeName()`

  `protected InventoryItem`

  `getSelectedItem()`

  `ArrayList<InventoryItem>`

  `getSourceItems()`

  `ArrayList<InventoryItem>`

  `getSourceItems(int sourceIndex)`

  `private void`

  `init(Recipe recipe,
  IsoGameCharacter character,
  ArrayList<ItemContainer> containers,
  InventoryItem selectedItem,
  ArrayList<InventoryItem> ignoreItems,
  boolean allItems)`

  `protected boolean`

  `isValid()`

  `ArrayList<InventoryItem>`

  `perform()`

  `static void`

  `Release(ItemRecipe o)`

  `private ItemRecipe`

  `reset()`

  `protected boolean`

  `testItem(InventoryItem item)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### FLUID\_PREFIX

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FLUID\_PREFIX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.recipemanager.ItemRecipe.FLUID_PREFIX)
  + ### pool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[ItemRecipe](ItemRecipe.html "class in zombie.inventory.recipemanager")> pool
  + ### recipe

    private [Recipe](../../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe
  + ### character

    private [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character
  + ### selectedItem

    private [InventoryItem](../InventoryItem.html "class in zombie.inventory") selectedItem
  + ### allItems

    private boolean allItems
  + ### valid

    private boolean valid
  + ### hasCollectedSources

    private boolean hasCollectedSources
  + ### usedItemProperties

    private final zombie.inventory.recipemanager.UsedItemProperties usedItemProperties
  + ### sourceRecords

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.inventory.recipemanager.SourceRecord> sourceRecords
  + ### allSourceItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")> allSourceItems
  + ### allResultItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")> allResultItems
  + ### resultsPerType

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")>[] resultsPerType
* Constructor Details
  -------------------

  + ### ItemRecipe

    private ItemRecipe()
* Method Details
  --------------

  + ### getNumberOfTimesRecipeCanBeDone

    public static int getNumberOfTimesRecipeCanBeDone([Recipe](../../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../ItemContainer.html "class in zombie.inventory")> containers,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") selectedItem)
  + ### Alloc

    public static [ItemRecipe](ItemRecipe.html "class in zombie.inventory.recipemanager") Alloc([Recipe](../../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../ItemContainer.html "class in zombie.inventory")> containers,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")> ignoreItems,
    boolean allItems)

    Note: the returned ItemRecipe needs to be released after usage.
  + ### Release

    public static void Release([ItemRecipe](ItemRecipe.html "class in zombie.inventory.recipemanager") o)
  + ### getRecipe

    protected [Recipe](../../scripting/objects/Recipe.html "class in zombie.scripting.objects") getRecipe()
  + ### getCharacter

    protected [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") getCharacter()
  + ### getSelectedItem

    protected [InventoryItem](../InventoryItem.html "class in zombie.inventory") getSelectedItem()
  + ### isValid

    protected boolean isValid()
  + ### ensureResultsPerType

    private void ensureResultsPerType(int amount)
  + ### getRecipeName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeName()
  + ### reset

    private [ItemRecipe](ItemRecipe.html "class in zombie.inventory.recipemanager") reset()
  + ### init

    private void init([Recipe](../../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../ItemContainer.html "class in zombie.inventory")> containers,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")> ignoreItems,
    boolean allItems)
  + ### collectSourceItems

    private void collectSourceItems()
  + ### getNumberOfTimesRecipeCanBeDone

    private int getNumberOfTimesRecipeCanBeDone()
  + ### perform

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")> perform()
  + ### getSourceItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")> getSourceItems()
  + ### getSourceItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")> getSourceItems(int sourceIndex)
  + ### testItem

    protected boolean testItem([InventoryItem](../InventoryItem.html "class in zombie.inventory") item)