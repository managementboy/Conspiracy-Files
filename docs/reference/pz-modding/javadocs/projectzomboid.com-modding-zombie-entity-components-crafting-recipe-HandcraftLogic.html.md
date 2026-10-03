[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [HandcraftLogic](HandcraftLogic.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [workstationInteractDistance](#workstationInteractDistance)
   2. [craftActionInProgress](#craftActionInProgress)
   3. [numCraftActionInProgress](#numCraftActionInProgress)
   4. [craftActionTable](#craftActionTable)
   5. [cachedRecipeInfos](#cachedRecipeInfos)
   6. [cachedRecipeInfoMap](#cachedRecipeInfoMap)
7. [Constructor Details](#constructor-detail)
   1. [HandcraftLogic(IsoGameCharacter, CraftBench, IsoObject)](#%3Cinit%3E(zombie.characters.IsoGameCharacter,zombie.entity.components.crafting.CraftBench,zombie.iso.IsoObject))
8. [Method Details](#method-detail)
   1. [getPlayer()](#getPlayer())
   2. [getCraftBench()](#getCraftBench())
   3. [getIsoObject()](#getIsoObject())
   4. [getRecipeData()](#getRecipeData())
   5. [getSourceResources()](#getSourceResources())
   6. [getRecipeList()](#getRecipeList())
   7. [getAllItems()](#getAllItems())
   8. [startCraftAction(KahluaTableImpl)](#startCraftAction(se.krka.kahlua.j2se.KahluaTableImpl))
   9. [stopCraftAction()](#stopCraftAction())
   10. [stopCraftAction(boolean)](#stopCraftAction(boolean))
   11. [getResidualFluidFromInput(InputScript)](#getResidualFluidFromInput(zombie.scripting.entity.components.crafting.InputScript))
   12. [isCraftActionInProgress()](#isCraftActionInProgress())
   13. [getCraftActionTable()](#getCraftActionTable())
   14. [performCurrentRecipe()](#performCurrentRecipe())
   15. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   16. [setRecipeFromContextClick(CraftRecipe, InventoryItem)](#setRecipeFromContextClick(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.inventory.InventoryItem))
   17. [checkValidRecipeSelected()](#checkValidRecipeSelected())
   18. [setRecipes(List)](#setRecipes(java.util.List))
   19. [filterRecipeList(String, String, boolean, IsoPlayer)](#filterRecipeList(java.lang.String,java.lang.String,boolean,zombie.characters.IsoPlayer))
   20. [getCreatedOutputItems(ArrayList)](#getCreatedOutputItems(java.util.ArrayList))
   21. [rebuildCachedRecipeInfo()](#rebuildCachedRecipeInfo())
   22. [createCachedRecipeInfo(CraftRecipe, ArrayList)](#createCachedRecipeInfo(zombie.scripting.entity.components.crafting.CraftRecipe,java.util.ArrayList))
   23. [isCharacterInRangeOfWorkbench()](#isCharacterInRangeOfWorkbench())
   24. [isValidRecipeForCharacter(CraftRecipe)](#isValidRecipeForCharacter(zombie.scripting.entity.components.crafting.CraftRecipe))
   25. [canCharacterPerformRecipe(CraftRecipe)](#canCharacterPerformRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   26. [isRecipeAvailableForCharacter(CraftRecipe)](#isRecipeAvailableForCharacter(zombie.scripting.entity.components.crafting.CraftRecipe))
   27. [getResultTexture()](#getResultTexture())
   28. [setIsoObject(IsoObject)](#setIsoObject(zombie.iso.IsoObject))
   29. [setSelectedRecipeStyle(String)](#setSelectedRecipeStyle(java.lang.String))
   30. [getSelectedRecipeStyle()](#getSelectedRecipeStyle())
   31. [setRecipeSortMode(String)](#setRecipeSortMode(java.lang.String))
   32. [getRecipeSortMode()](#getRecipeSortMode())
   33. [isUsingRecipeAtHandBenefit()](#isUsingRecipeAtHandBenefit())
   34. [getUsingRecipeAtHandItem()](#getUsingRecipeAtHandItem())
   35. [isRecipeAtHand()](#isRecipeAtHand())
   36. [setLastSelectedRecipe(CraftRecipe)](#setLastSelectedRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   37. [getLastSelectedRecipe()](#getLastSelectedRecipe())
   38. [setLastManualInputMode(boolean)](#setLastManualInputMode(boolean))
   39. [getLastManualInputMode()](#getLastManualInputMode())
   40. [findCraftSurface(IsoGameCharacter, int)](#findCraftSurface(zombie.characters.IsoGameCharacter,int))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class HandcraftLogic
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.crafting.BaseCraftingLogic](../BaseCraftingLogic.html "class in zombie.entity.components.crafting")

zombie.entity.components.crafting.recipe.HandcraftLogic

---

public class HandcraftLogic
extends [BaseCraftingLogic](../BaseCraftingLogic.html "class in zombie.entity.components.crafting")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `HandcraftLogic.CachedRecipeInfo`

  ### Nested classes/interfaces inherited from class [BaseCraftingLogic](../BaseCraftingLogic.html#nested-class-summary "class in zombie.entity.components.crafting")

  `BaseCraftingLogic.CachedRecipeComparator, BaseCraftingLogic.CraftEventHandler`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashMap<CraftRecipe, HandcraftLogic.CachedRecipeInfo>`

  `cachedRecipeInfoMap`

  `private final ArrayList<HandcraftLogic.CachedRecipeInfo>`

  `cachedRecipeInfos`

  `private boolean`

  `craftActionInProgress`

  `private se.krka.kahlua.j2se.KahluaTableImpl`

  `craftActionTable`

  `private int`

  `numCraftActionInProgress`

  `private static final int`

  `workstationInteractDistance`

  ### Fields inherited from class [BaseCraftingLogic](../BaseCraftingLogic.html#field-summary "class in zombie.entity.components.crafting")

  `allItems, cachedCanPerform, cachedCanPerformDirty, cachedPossibleCraftCount, cachedRecipeComparator, cachedRecipeInfosDirty, categoryFilterString, completeRecipeList, containers, craftBench, events, filteredRecipeList, filterString, inputItemNodeCollection, isoObject, manualInputAllowedItemTypes, manualSelectInputScriptFilter, player, recipeData, sourceResources, targetVariableInputRatio, testRecipeData`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `HandcraftLogic(IsoGameCharacter player,
  CraftBench craftBench,
  IsoObject isoObject)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canCharacterPerformRecipe(CraftRecipe recipe)`

  `void`

  `checkValidRecipeSelected()`

  `protected BaseCraftingLogic.CachedRecipeInfo`

  `createCachedRecipeInfo(CraftRecipe recipe,
  ArrayList<ItemContainer> containers)`

  `void`

  `filterRecipeList(String filter,
  String categoryFilter,
  boolean force,
  IsoPlayer player)`

  `IsoObject`

  `findCraftSurface(IsoGameCharacter player,
  int radius)`

  `ArrayList<InventoryItem>`

  `getAllItems()`

  `se.krka.kahlua.j2se.KahluaTableImpl`

  `getCraftActionTable()`

  `CraftBench`

  `getCraftBench()`

  `void`

  `getCreatedOutputItems(ArrayList<InventoryItem> list)`

  `IsoObject`

  `getIsoObject()`

  `protected boolean`

  `getLastManualInputMode()`

  `CraftRecipe`

  `getLastSelectedRecipe()`

  `IsoGameCharacter`

  `getPlayer()`

  `CraftRecipeData`

  `getRecipeData()`

  `CraftRecipeListNodeCollection`

  `getRecipeList()`

  `String`

  `getRecipeSortMode()`

  `float`

  `getResidualFluidFromInput(InputScript inputScript)`

  `Texture`

  `getResultTexture()`

  `String`

  `getSelectedRecipeStyle()`

  `ArrayList<Resource>`

  `getSourceResources()`

  `InventoryItem`

  `getUsingRecipeAtHandItem()`

  `boolean`

  `isCharacterInRangeOfWorkbench()`

  `boolean`

  `isCraftActionInProgress()`

  `boolean`

  `isRecipeAtHand()`

  `boolean`

  `isRecipeAvailableForCharacter(CraftRecipe recipe)`

  `boolean`

  `isUsingRecipeAtHandBenefit()`

  `boolean`

  `isValidRecipeForCharacter(CraftRecipe recipe)`

  `boolean`

  `performCurrentRecipe()`

  `protected void`

  `rebuildCachedRecipeInfo()`

  `void`

  `setIsoObject(IsoObject isoObj)`

  `void`

  `setLastManualInputMode(boolean b)`

  `void`

  `setLastSelectedRecipe(CraftRecipe recipe)`

  `void`

  `setRecipe(CraftRecipe recipe)`

  `void`

  `setRecipeFromContextClick(CraftRecipe recipe,
  InventoryItem inventoryItem)`

  `void`

  `setRecipes(List<CraftRecipe> recipes)`

  `void`

  `setRecipeSortMode(String sortMode)`

  `void`

  `setSelectedRecipeStyle(String style)`

  `void`

  `startCraftAction(se.krka.kahlua.j2se.KahluaTableImpl actionTable)`

  `void`

  `stopCraftAction()`

  `void`

  `stopCraftAction(boolean stopAll)`

  ### Methods inherited from class [BaseCraftingLogic](../BaseCraftingLogic.html#method-summary "class in zombie.entity.components.crafting")

  `addEventListener, addEventListener, areAllInputItemsSatisfied, autoPopulateInputs, cachedCanPerformCurrentRecipe, callLua, callLua, callLua, callLuaBool, callLuaObject, canPerformCurrentRecipe, clearManualInputs, clearManualInputsFor, clearTargetVariableInputRatio, copyManualInputsFrom, filterAndSortRecipeList, filterRecipeList, filterRecipeList, getAllViableInputInventoryItems, getAllViableInputResources, getCachedRecipeInfo, getCategoryList, getContainers, getFavouriteModDataString, getFavouriteModDataString, getInputCount, getInputItemNodes, getInputItemNodesForInput, getInputUses, getLastManualInputMode, getLastSelectedRecipe, getManualInputsFor, getManualSelectInputScriptFilter, getModelHandOne, getModelHandTwo, getMulticraftConsumedItems, getMulticraftConsumedItemsFor, getMulticraftConsumedResources, getPossibleCraftCount, getRecipe, getRecipeSortMode, getSatisfiedInputFluids, getSatisfiedInputInventoryItems, getSatisfiedInputItems, getSelectedRecipeStyle, getVariableInputRatio, hasRequiredWorkstation, isContainersAccessible, isInputSatisfied, isManualSelectInputs, offerInputItem, populateInputs, refresh, registerEvent, removeInputItem, setContainers, setLastManualInputMode, setLastSelectedRecipe, setManualInputsFor, setManualSelectInputs, setManualSelectInputScriptFilter, setRecipeSortMode, setSelectedRecipeStyle, setShowManualSelectInputs, setSortModeInternal, setTargetVariableInputRatio, shouldShowManualSelectInputs, sortRecipeList, triggerEvent, updateFloorContainer, updateManualInputAllowedItemTypes`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### workstationInteractDistance

    private static final int workstationInteractDistance

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.entity.components.crafting.recipe.HandcraftLogic.workstationInteractDistance)
  + ### craftActionInProgress

    private boolean craftActionInProgress
  + ### numCraftActionInProgress

    private int numCraftActionInProgress
  + ### craftActionTable

    private se.krka.kahlua.j2se.KahluaTableImpl craftActionTable
  + ### cachedRecipeInfos

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[HandcraftLogic.CachedRecipeInfo](HandcraftLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting.recipe")> cachedRecipeInfos
  + ### cachedRecipeInfoMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting"), [HandcraftLogic.CachedRecipeInfo](HandcraftLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting.recipe")> cachedRecipeInfoMap
* Constructor Details
  -------------------

  + ### HandcraftLogic

    public HandcraftLogic([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") player,
    [CraftBench](../CraftBench.html "class in zombie.entity.components.crafting") craftBench,
    [IsoObject](../../../../iso/IsoObject.html "class in zombie.iso") isoObject)
* Method Details
  --------------

  + ### getPlayer

    public [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") getPlayer()
  + ### getCraftBench

    public [CraftBench](../CraftBench.html "class in zombie.entity.components.crafting") getCraftBench()
  + ### getIsoObject

    public [IsoObject](../../../../iso/IsoObject.html "class in zombie.iso") getIsoObject()
  + ### getRecipeData

    public [CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getRecipeData()
  + ### getSourceResources

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> getSourceResources()
  + ### getRecipeList

    public [CraftRecipeListNodeCollection](CraftRecipeListNodeCollection.html "class in zombie.entity.components.crafting.recipe") getRecipeList()
  + ### getAllItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllItems()
  + ### startCraftAction

    public void startCraftAction(se.krka.kahlua.j2se.KahluaTableImpl actionTable)
  + ### stopCraftAction

    public void stopCraftAction()
  + ### stopCraftAction

    public void stopCraftAction(boolean stopAll)
  + ### getResidualFluidFromInput

    public float getResidualFluidFromInput([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### isCraftActionInProgress

    public boolean isCraftActionInProgress()
  + ### getCraftActionTable

    public se.krka.kahlua.j2se.KahluaTableImpl getCraftActionTable()
  + ### performCurrentRecipe

    public boolean performCurrentRecipe()
  + ### setRecipe

    public void setRecipe([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)

    Overrides:
    :   `setRecipe` in class `BaseCraftingLogic`
  + ### setRecipeFromContextClick

    public void setRecipeFromContextClick([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### checkValidRecipeSelected

    public void checkValidRecipeSelected()
  + ### setRecipes

    public void setRecipes([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipes)

    Overrides:
    :   `setRecipes` in class `BaseCraftingLogic`
  + ### filterRecipeList

    public void filterRecipeList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") categoryFilter,
    boolean force,
    [IsoPlayer](../../../../characters/IsoPlayer.html "class in zombie.characters") player)

    Overrides:
    :   `filterRecipeList` in class `BaseCraftingLogic`
  + ### getCreatedOutputItems

    public void getCreatedOutputItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### rebuildCachedRecipeInfo

    protected void rebuildCachedRecipeInfo()

    Overrides:
    :   `rebuildCachedRecipeInfo` in class `BaseCraftingLogic`
  + ### createCachedRecipeInfo

    protected [BaseCraftingLogic.CachedRecipeInfo](../BaseCraftingLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting") createCachedRecipeInfo([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)

    Overrides:
    :   `createCachedRecipeInfo` in class `BaseCraftingLogic`
  + ### isCharacterInRangeOfWorkbench

    public boolean isCharacterInRangeOfWorkbench()

    Overrides:
    :   `isCharacterInRangeOfWorkbench` in class `BaseCraftingLogic`
  + ### isValidRecipeForCharacter

    public boolean isValidRecipeForCharacter([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### canCharacterPerformRecipe

    public boolean canCharacterPerformRecipe([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### isRecipeAvailableForCharacter

    public boolean isRecipeAvailableForCharacter([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getResultTexture

    public [Texture](../../../../core/textures/Texture.html "class in zombie.core.textures") getResultTexture()
  + ### setIsoObject

    public void setIsoObject([IsoObject](../../../../iso/IsoObject.html "class in zombie.iso") isoObj)
  + ### setSelectedRecipeStyle

    public void setSelectedRecipeStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") style)
  + ### getSelectedRecipeStyle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSelectedRecipeStyle()
  + ### setRecipeSortMode

    public void setRecipeSortMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sortMode)
  + ### getRecipeSortMode

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeSortMode()
  + ### isUsingRecipeAtHandBenefit

    public boolean isUsingRecipeAtHandBenefit()
  + ### getUsingRecipeAtHandItem

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getUsingRecipeAtHandItem()
  + ### isRecipeAtHand

    public boolean isRecipeAtHand()
  + ### setLastSelectedRecipe

    public void setLastSelectedRecipe([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getLastSelectedRecipe

    public [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getLastSelectedRecipe()
  + ### setLastManualInputMode

    public void setLastManualInputMode(boolean b)
  + ### getLastManualInputMode

    protected boolean getLastManualInputMode()
  + ### findCraftSurface

    public [IsoObject](../../../../iso/IsoObject.html "class in zombie.iso") findCraftSurface([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") player,
    int radius)