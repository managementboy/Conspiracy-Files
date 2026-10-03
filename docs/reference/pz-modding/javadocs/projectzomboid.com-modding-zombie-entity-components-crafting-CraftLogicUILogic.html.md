[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [CraftLogicUILogic](CraftLogicUILogic.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [player](#player)
   2. [entity](#entity)
   3. [component](#component)
   4. [selectedRecipe](#selectedRecipe)
   5. [filteredRecipeList](#filteredRecipeList)
   6. [recipeComparator](#recipeComparator)
   7. [filterString](#filterString)
   8. [inputItemNodeCollection](#inputItemNodeCollection)
   9. [resourceItemNodeCollection](#resourceItemNodeCollection)
   10. [events](#events)
   11. [showManualSelectInputs](#showManualSelectInputs)
   12. [manualSelectInputScriptFilter](#manualSelectInputScriptFilter)
   13. [manualSelectItemSlot](#manualSelectItemSlot)
   14. [cachedCanStart](#cachedCanStart)
   15. [cachedCanStartDirty](#cachedCanStartDirty)
   16. [cachedPossibleCraftCount](#cachedPossibleCraftCount)
   17. [selectedInventoryItems](#selectedInventoryItems)
   18. [containers](#containers)
   19. [allItems](#allItems)
7. [Constructor Details](#constructor-detail)
   1. [CraftLogicUILogic(IsoPlayer, GameEntity, CraftLogic)](#%3Cinit%3E(zombie.characters.IsoPlayer,zombie.entity.GameEntity,zombie.entity.components.crafting.CraftLogic))
8. [Method Details](#method-detail)
   1. [getCraftLogic()](#getCraftLogic())
   2. [getEntity()](#getEntity())
   3. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   4. [getRecipe()](#getRecipe())
   5. [getRecipeList()](#getRecipeList())
   6. [cachedCanStart(IsoPlayer)](#cachedCanStart(zombie.characters.IsoPlayer))
   7. [registerEvent(String)](#registerEvent(java.lang.String))
   8. [addEventListener(String, Object)](#addEventListener(java.lang.String,java.lang.Object))
   9. [addEventListener(String, Object, Object)](#addEventListener(java.lang.String,java.lang.Object,java.lang.Object))
   10. [triggerEvent(String, Object...)](#triggerEvent(java.lang.String,java.lang.Object...))
   11. [getEntityIcon()](#getEntityIcon())
   12. [setSelectedRecipeStyle(String)](#setSelectedRecipeStyle(java.lang.String))
   13. [getSelectedRecipeStyle()](#getSelectedRecipeStyle())
   14. [setRecipeSortMode(String)](#setRecipeSortMode(java.lang.String))
   15. [getRecipeSortMode()](#getRecipeSortMode())
   16. [setSortModeInternal(String)](#setSortModeInternal(java.lang.String))
   17. [filterRecipeList(String, String)](#filterRecipeList(java.lang.String,java.lang.String))
   18. [filterRecipeList(String, String, boolean)](#filterRecipeList(java.lang.String,java.lang.String,boolean))
   19. [filterRecipeList(String, String, boolean, IsoPlayer)](#filterRecipeList(java.lang.String,java.lang.String,boolean,zombie.characters.IsoPlayer))
   20. [sortRecipeList()](#sortRecipeList())
   21. [getPossibleCraftCount(boolean)](#getPossibleCraftCount(boolean))
   22. [getItemsInProgress()](#getItemsInProgress())
   23. [getStatusIconsForItemInProgress(InventoryItem, CraftRecipeData)](#getStatusIconsForItemInProgress(zombie.inventory.InventoryItem,zombie.entity.components.crafting.recipe.CraftRecipeData))
   24. [getOutputItems()](#getOutputItems())
   25. [shouldShowManualSelectInputs()](#shouldShowManualSelectInputs())
   26. [setShowManualSelectInputs(boolean)](#setShowManualSelectInputs(boolean))
   27. [getManualSelectInputScriptFilter()](#getManualSelectInputScriptFilter())
   28. [getManualSelectItemSlot()](#getManualSelectItemSlot())
   29. [setManualSelectInputScriptFilter(InputScript, KahluaTable)](#setManualSelectInputScriptFilter(zombie.scripting.entity.components.crafting.InputScript,se.krka.kahlua.vm.KahluaTable))
   30. [getRecipeData()](#getRecipeData())
   31. [getInputItemNodes()](#getInputItemNodes())
   32. [getInputItemNodesForInput(InputScript)](#getInputItemNodesForInput(zombie.scripting.entity.components.crafting.InputScript))
   33. [getResourceItemNodes()](#getResourceItemNodes())
   34. [onResourceSlotContentsChanged()](#onResourceSlotContentsChanged())
   35. [setCraftQuantity(int)](#setCraftQuantity(int))
   36. [setContainers(ArrayList)](#setContainers(java.util.ArrayList))
   37. [getContainers()](#getContainers())
   38. [doProgressSlotTooltip(KahluaTable, ObjectTooltip)](#doProgressSlotTooltip(se.krka.kahlua.vm.KahluaTable,zombie.ui.ObjectTooltip))
   39. [doPreviewSlotTooltip(KahluaTable, ObjectTooltip)](#doPreviewSlotTooltip(se.krka.kahlua.vm.KahluaTable,zombie.ui.ObjectTooltip))
   40. [offerInputItem(InventoryItem)](#offerInputItem(zombie.inventory.InventoryItem))
   41. [removeInputItem(InventoryItem)](#removeInputItem(zombie.inventory.InventoryItem))
   42. [clearManualInputsFor(CraftRecipeData.InputScriptData)](#clearManualInputsFor(zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData))
   43. [getInventoryItemsToTransfer()](#getInventoryItemsToTransfer())
   44. [cachedCanPerformCurrentRecipe()](#cachedCanPerformCurrentRecipe())
   45. [areAllInputItemsSatisfied()](#areAllInputItemsSatisfied())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class CraftLogicUILogic
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.CraftLogicUILogic

---

public class CraftLogicUILogic
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `CraftLogicUILogic.RecipeComparator`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final ArrayList<InventoryItem>`

  `allItems`

  `private boolean`

  `cachedCanStart`

  `private boolean`

  `cachedCanStartDirty`

  `private int`

  `cachedPossibleCraftCount`

  `private final CraftLogic`

  `component`

  `private final ArrayList<ItemContainer>`

  `containers`

  `private final GameEntity`

  `entity`

  `protected final HashMap<String, ArrayList<BaseCraftingLogic.CraftEventHandler>>`

  `events`

  `private final CraftRecipeListNodeCollection`

  `filteredRecipeList`

  `private String`

  `filterString`

  `(package private) zombie.entity.components.crafting.recipe.InputItemNodeCollection`

  `inputItemNodeCollection`

  `private InputScript`

  `manualSelectInputScriptFilter`

  `private se.krka.kahlua.vm.KahluaTable`

  `manualSelectItemSlot`

  `private final IsoPlayer`

  `player`

  `private final CraftLogicUILogic.RecipeComparator`

  `recipeComparator`

  `(package private) zombie.entity.components.crafting.recipe.InputItemNodeCollection`

  `resourceItemNodeCollection`

  `private final List<InventoryItem>`

  `selectedInventoryItems`

  `private CraftRecipe`

  `selectedRecipe`

  `private boolean`

  `showManualSelectInputs`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CraftLogicUILogic(IsoPlayer player,
  GameEntity entity,
  CraftLogic component)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addEventListener(String event,
  Object function)`

  `void`

  `addEventListener(String event,
  Object function,
  Object targetTable)`

  `boolean`

  `areAllInputItemsSatisfied()`

  `boolean`

  `cachedCanPerformCurrentRecipe()`

  `boolean`

  `cachedCanStart(IsoPlayer player)`

  `void`

  `clearManualInputsFor(CraftRecipeData.InputScriptData input)`

  `void`

  `doPreviewSlotTooltip(se.krka.kahlua.vm.KahluaTable itemSlot,
  ObjectTooltip tooltipUI)`

  `void`

  `doProgressSlotTooltip(se.krka.kahlua.vm.KahluaTable itemSlot,
  ObjectTooltip tooltipUI)`

  `void`

  `filterRecipeList(String filter,
  String categoryFilter)`

  `void`

  `filterRecipeList(String filter,
  String categoryFilter,
  boolean force)`

  `void`

  `filterRecipeList(String filter,
  String categoryFilter,
  boolean force,
  IsoPlayer player)`

  `ArrayList<ItemContainer>`

  `getContainers()`

  `CraftLogic`

  `getCraftLogic()`

  `GameEntity`

  `getEntity()`

  `Texture`

  `getEntityIcon()`

  `ArrayList<InputItemNode>`

  `getInputItemNodes()`

  `ArrayList<InputItemNode>`

  `getInputItemNodesForInput(InputScript input)`

  `se.krka.kahlua.vm.KahluaTable`

  `getInventoryItemsToTransfer()`

  `se.krka.kahlua.vm.KahluaTable`

  `getItemsInProgress()`

  `InputScript`

  `getManualSelectInputScriptFilter()`

  `se.krka.kahlua.vm.KahluaTable`

  `getManualSelectItemSlot()`

  `se.krka.kahlua.vm.KahluaTable`

  `getOutputItems()`

  `int`

  `getPossibleCraftCount(boolean forceRecache)`

  `CraftRecipe`

  `getRecipe()`

  `CraftRecipeData`

  `getRecipeData()`

  `CraftRecipeListNodeCollection`

  `getRecipeList()`

  `String`

  `getRecipeSortMode()`

  `ArrayList<InputItemNode>`

  `getResourceItemNodes()`

  `String`

  `getSelectedRecipeStyle()`

  `ArrayList<Texture>`

  `getStatusIconsForItemInProgress(InventoryItem item,
  CraftRecipeData craftRecipeData)`

  `void`

  `offerInputItem(InventoryItem inventoryItem)`

  `void`

  `onResourceSlotContentsChanged()`

  `private void`

  `registerEvent(String eventName)`

  `void`

  `removeInputItem(InventoryItem inventoryItem)`

  `void`

  `setContainers(ArrayList<ItemContainer> containersToUse)`

  `void`

  `setCraftQuantity(int quantity)`

  `void`

  `setManualSelectInputScriptFilter(InputScript script,
  se.krka.kahlua.vm.KahluaTable itemSlot)`

  `void`

  `setRecipe(CraftRecipe recipe)`

  `void`

  `setRecipeSortMode(String sortMode)`

  `void`

  `setSelectedRecipeStyle(String style)`

  `void`

  `setShowManualSelectInputs(boolean b)`

  `protected void`

  `setSortModeInternal(String sortMode)`

  `boolean`

  `shouldShowManualSelectInputs()`

  `void`

  `sortRecipeList()`

  `protected void`

  `triggerEvent(String event,
  Object... args)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### player

    private final [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player
  + ### entity

    private final [GameEntity](../../GameEntity.html "class in zombie.entity") entity
  + ### component

    private final [CraftLogic](CraftLogic.html "class in zombie.entity.components.crafting") component
  + ### selectedRecipe

    private [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") selectedRecipe
  + ### filteredRecipeList

    private final [CraftRecipeListNodeCollection](recipe/CraftRecipeListNodeCollection.html "class in zombie.entity.components.crafting.recipe") filteredRecipeList
  + ### recipeComparator

    private final [CraftLogicUILogic.RecipeComparator](CraftLogicUILogic.RecipeComparator.html "class in zombie.entity.components.crafting") recipeComparator
  + ### filterString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterString
  + ### inputItemNodeCollection

    zombie.entity.components.crafting.recipe.InputItemNodeCollection inputItemNodeCollection
  + ### resourceItemNodeCollection

    zombie.entity.components.crafting.recipe.InputItemNodeCollection resourceItemNodeCollection
  + ### events

    protected final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseCraftingLogic.CraftEventHandler](BaseCraftingLogic.CraftEventHandler.html "class in zombie.entity.components.crafting")>> events
  + ### showManualSelectInputs

    private boolean showManualSelectInputs
  + ### manualSelectInputScriptFilter

    private [InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") manualSelectInputScriptFilter
  + ### manualSelectItemSlot

    private se.krka.kahlua.vm.KahluaTable manualSelectItemSlot
  + ### cachedCanStart

    private boolean cachedCanStart
  + ### cachedCanStartDirty

    private boolean cachedCanStartDirty
  + ### cachedPossibleCraftCount

    private int cachedPossibleCraftCount
  + ### selectedInventoryItems

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> selectedInventoryItems
  + ### containers

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../inventory/ItemContainer.html "class in zombie.inventory")> containers
  + ### allItems

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> allItems
* Constructor Details
  -------------------

  + ### CraftLogicUILogic

    public CraftLogicUILogic([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player,
    [GameEntity](../../GameEntity.html "class in zombie.entity") entity,
    [CraftLogic](CraftLogic.html "class in zombie.entity.components.crafting") component)
* Method Details
  --------------

  + ### getCraftLogic

    public [CraftLogic](CraftLogic.html "class in zombie.entity.components.crafting") getCraftLogic()
  + ### getEntity

    public [GameEntity](../../GameEntity.html "class in zombie.entity") getEntity()
  + ### setRecipe

    public void setRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getRecipe()
  + ### getRecipeList

    public [CraftRecipeListNodeCollection](recipe/CraftRecipeListNodeCollection.html "class in zombie.entity.components.crafting.recipe") getRecipeList()
  + ### cachedCanStart

    public boolean cachedCanStart([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### registerEvent

    private void registerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventName)
  + ### addEventListener

    public void addEventListener([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") function)
  + ### addEventListener

    public void addEventListener([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") function,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") targetTable)
  + ### triggerEvent

    protected void triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... args)
  + ### getEntityIcon

    public [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") getEntityIcon()
  + ### setSelectedRecipeStyle

    public void setSelectedRecipeStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") style)
  + ### getSelectedRecipeStyle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSelectedRecipeStyle()
  + ### setRecipeSortMode

    public void setRecipeSortMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sortMode)
  + ### getRecipeSortMode

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeSortMode()
  + ### setSortModeInternal

    protected void setSortModeInternal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sortMode)
  + ### filterRecipeList

    public void filterRecipeList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") categoryFilter)
  + ### filterRecipeList

    public void filterRecipeList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") categoryFilter,
    boolean force)
  + ### filterRecipeList

    public void filterRecipeList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") categoryFilter,
    boolean force,
    [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### sortRecipeList

    public void sortRecipeList()
  + ### getPossibleCraftCount

    public int getPossibleCraftCount(boolean forceRecache)
  + ### getItemsInProgress

    public se.krka.kahlua.vm.KahluaTable getItemsInProgress()
  + ### getStatusIconsForItemInProgress

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Texture](../../../core/textures/Texture.html "class in zombie.core.textures")> getStatusIconsForItemInProgress([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)
  + ### getOutputItems

    public se.krka.kahlua.vm.KahluaTable getOutputItems()
  + ### shouldShowManualSelectInputs

    public boolean shouldShowManualSelectInputs()
  + ### setShowManualSelectInputs

    public void setShowManualSelectInputs(boolean b)
  + ### getManualSelectInputScriptFilter

    public [InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") getManualSelectInputScriptFilter()
  + ### getManualSelectItemSlot

    public se.krka.kahlua.vm.KahluaTable getManualSelectItemSlot()
  + ### setManualSelectInputScriptFilter

    public void setManualSelectInputScriptFilter([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") script,
    se.krka.kahlua.vm.KahluaTable itemSlot)
  + ### getRecipeData

    public [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getRecipeData()
  + ### getInputItemNodes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InputItemNode](recipe/InputItemNode.html "class in zombie.entity.components.crafting.recipe")> getInputItemNodes()
  + ### getInputItemNodesForInput

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InputItemNode](recipe/InputItemNode.html "class in zombie.entity.components.crafting.recipe")> getInputItemNodesForInput([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input)
  + ### getResourceItemNodes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InputItemNode](recipe/InputItemNode.html "class in zombie.entity.components.crafting.recipe")> getResourceItemNodes()
  + ### onResourceSlotContentsChanged

    public void onResourceSlotContentsChanged()
  + ### setCraftQuantity

    public void setCraftQuantity(int quantity)
  + ### setContainers

    public void setContainers([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../inventory/ItemContainer.html "class in zombie.inventory")> containersToUse)
  + ### getContainers

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../inventory/ItemContainer.html "class in zombie.inventory")> getContainers()
  + ### doProgressSlotTooltip

    public void doProgressSlotTooltip(se.krka.kahlua.vm.KahluaTable itemSlot,
    [ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI)
  + ### doPreviewSlotTooltip

    public void doPreviewSlotTooltip(se.krka.kahlua.vm.KahluaTable itemSlot,
    [ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI)
  + ### offerInputItem

    public void offerInputItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### removeInputItem

    public void removeInputItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### clearManualInputsFor

    public void clearManualInputsFor([CraftRecipeData.InputScriptData](recipe/CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") input)
  + ### getInventoryItemsToTransfer

    public se.krka.kahlua.vm.KahluaTable getInventoryItemsToTransfer()
  + ### cachedCanPerformCurrentRecipe

    public boolean cachedCanPerformCurrentRecipe()
  + ### areAllInputItemsSatisfied

    public boolean areAllInputItemsSatisfied()