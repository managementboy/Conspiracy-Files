[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.build](package-summary.html)
2. [BuildLogic](BuildLogic.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [selectedRecipe](#selectedRecipe)
   2. [recipeDataInProgress](#recipeDataInProgress)
   3. [craftActionInProgress](#craftActionInProgress)
   4. [recipeComponentScriptLookup](#recipeComponentScriptLookup)
7. [Constructor Details](#constructor-detail)
   1. [BuildLogic(IsoGameCharacter, CraftBench, IsoObject)](#%3Cinit%3E(zombie.characters.IsoGameCharacter,zombie.entity.components.crafting.CraftBench,zombie.iso.IsoObject))
8. [Method Details](#method-detail)
   1. [getRecipeList()](#getRecipeList())
   2. [getRecipe()](#getRecipe())
   3. [getRecipeData()](#getRecipeData())
   4. [getRecipeDataInProgress()](#getRecipeDataInProgress())
   5. [getSelectedBuildObject()](#getSelectedBuildObject())
   6. [getWallCoveringParams()](#getWallCoveringParams())
   7. [getPaintColor(String)](#getPaintColor(java.lang.String))
   8. [getAllBuildableRecipes()](#getAllBuildableRecipes())
   9. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   10. [isCraftActionInProgress()](#isCraftActionInProgress())
   11. [areAllInputItemsSatisfied()](#areAllInputItemsSatisfied())
   12. [isInputSatisfied(InputScript)](#isInputSatisfied(zombie.scripting.entity.components.crafting.InputScript))
   13. [startCraftAction(KahluaTableImpl)](#startCraftAction(se.krka.kahlua.j2se.KahluaTableImpl))
   14. [updateFloorContainer()](#updateFloorContainer())
   15. [performCurrentRecipe()](#performCurrentRecipe())
   16. [stopCraftAction()](#stopCraftAction())
   17. [getAllConsumedItems()](#getAllConsumedItems())
   18. [setSelectedRecipeStyle(String)](#setSelectedRecipeStyle(java.lang.String))
   19. [getSelectedRecipeStyle()](#getSelectedRecipeStyle())
   20. [setRecipeSortMode(String)](#setRecipeSortMode(java.lang.String))
   21. [getRecipeSortMode()](#getRecipeSortMode())
   22. [setLastSelectedRecipe(CraftRecipe)](#setLastSelectedRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   23. [getLastSelectedRecipe()](#getLastSelectedRecipe())
   24. [setLastManualInputMode(boolean)](#setLastManualInputMode(boolean))
   25. [getLastManualInputMode()](#getLastManualInputMode())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class BuildLogic
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.crafting.BaseCraftingLogic](../crafting/BaseCraftingLogic.html "class in zombie.entity.components.crafting")

zombie.entity.components.build.BuildLogic

---

public class BuildLogic
extends [BaseCraftingLogic](../crafting/BaseCraftingLogic.html "class in zombie.entity.components.crafting")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [BaseCraftingLogic](../crafting/BaseCraftingLogic.html#nested-class-summary "class in zombie.entity.components.crafting")

  `BaseCraftingLogic.CachedRecipeComparator, BaseCraftingLogic.CachedRecipeInfo, BaseCraftingLogic.CraftEventHandler`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `craftActionInProgress`

  `private final Dictionary<CraftRecipe, CraftRecipeComponentScript>`

  `recipeComponentScriptLookup`

  `private final CraftRecipeData`

  `recipeDataInProgress`

  `private CraftRecipe`

  `selectedRecipe`

  ### Fields inherited from class [BaseCraftingLogic](../crafting/BaseCraftingLogic.html#field-summary "class in zombie.entity.components.crafting")

  `allItems, cachedCanPerform, cachedCanPerformDirty, cachedPossibleCraftCount, cachedRecipeComparator, cachedRecipeInfoMap, cachedRecipeInfos, cachedRecipeInfosDirty, categoryFilterString, completeRecipeList, containers, craftBench, events, filteredRecipeList, filterString, inputItemNodeCollection, isoObject, manualInputAllowedItemTypes, manualSelectInputScriptFilter, player, recipeData, sourceResources, targetVariableInputRatio, testRecipeData`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BuildLogic(IsoGameCharacter player,
  CraftBench craftBench,
  IsoObject isoObject)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `areAllInputItemsSatisfied()`

  `ArrayList<CraftRecipe>`

  `getAllBuildableRecipes()`

  `ArrayList<InventoryItem>`

  `getAllConsumedItems()`

  `protected boolean`

  `getLastManualInputMode()`

  `CraftRecipe`

  `getLastSelectedRecipe()`

  `private Color`

  `getPaintColor(String paintType)`

  `CraftRecipe`

  `getRecipe()`

  `CraftRecipeData`

  `getRecipeData()`

  `CraftRecipeData`

  `getRecipeDataInProgress()`

  `CraftRecipeListNodeCollection`

  `getRecipeList()`

  `String`

  `getRecipeSortMode()`

  `SpriteConfigManager.ObjectInfo`

  `getSelectedBuildObject()`

  `String`

  `getSelectedRecipeStyle()`

  `se.krka.kahlua.vm.KahluaTable`

  `getWallCoveringParams()`

  `boolean`

  `isCraftActionInProgress()`

  `boolean`

  `isInputSatisfied(InputScript inputScript)`

  `boolean`

  `performCurrentRecipe()`

  `void`

  `setLastManualInputMode(boolean b)`

  `void`

  `setLastSelectedRecipe(CraftRecipe recipe)`

  `void`

  `setRecipe(CraftRecipe recipe)`

  `void`

  `setRecipeSortMode(String sortMode)`

  `void`

  `setSelectedRecipeStyle(String style)`

  `void`

  `startCraftAction(se.krka.kahlua.j2se.KahluaTableImpl actionTable)`

  `void`

  `stopCraftAction()`

  `void`

  `updateFloorContainer()`

  ### Methods inherited from class [BaseCraftingLogic](../crafting/BaseCraftingLogic.html#method-summary "class in zombie.entity.components.crafting")

  `addEventListener, addEventListener, autoPopulateInputs, cachedCanPerformCurrentRecipe, callLua, callLua, callLua, callLuaBool, callLuaObject, canPerformCurrentRecipe, clearManualInputs, clearManualInputsFor, clearTargetVariableInputRatio, copyManualInputsFrom, createCachedRecipeInfo, filterAndSortRecipeList, filterRecipeList, filterRecipeList, filterRecipeList, getAllViableInputInventoryItems, getAllViableInputResources, getCachedRecipeInfo, getCategoryList, getContainers, getFavouriteModDataString, getFavouriteModDataString, getInputCount, getInputItemNodes, getInputItemNodesForInput, getInputUses, getLastManualInputMode, getLastSelectedRecipe, getManualInputsFor, getManualSelectInputScriptFilter, getModelHandOne, getModelHandTwo, getMulticraftConsumedItems, getMulticraftConsumedItemsFor, getMulticraftConsumedResources, getPossibleCraftCount, getRecipeSortMode, getSatisfiedInputFluids, getSatisfiedInputInventoryItems, getSatisfiedInputItems, getSelectedRecipeStyle, getVariableInputRatio, hasRequiredWorkstation, isCharacterInRangeOfWorkbench, isContainersAccessible, isManualSelectInputs, offerInputItem, populateInputs, rebuildCachedRecipeInfo, refresh, registerEvent, removeInputItem, setContainers, setLastManualInputMode, setLastSelectedRecipe, setManualInputsFor, setManualSelectInputs, setManualSelectInputScriptFilter, setRecipes, setRecipeSortMode, setSelectedRecipeStyle, setShowManualSelectInputs, setSortModeInternal, setTargetVariableInputRatio, shouldShowManualSelectInputs, sortRecipeList, triggerEvent, updateFloorContainer, updateManualInputAllowedItemTypes`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### selectedRecipe

    private [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") selectedRecipe
  + ### recipeDataInProgress

    private final [CraftRecipeData](../crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeDataInProgress
  + ### craftActionInProgress

    private boolean craftActionInProgress
  + ### recipeComponentScriptLookup

    private final [Dictionary](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Dictionary.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting"), [CraftRecipeComponentScript](../../../scripting/entity/components/crafting/CraftRecipeComponentScript.html "class in zombie.scripting.entity.components.crafting")> recipeComponentScriptLookup
* Constructor Details
  -------------------

  + ### BuildLogic

    public BuildLogic([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") player,
    [CraftBench](../crafting/CraftBench.html "class in zombie.entity.components.crafting") craftBench,
    [IsoObject](../../../iso/IsoObject.html "class in zombie.iso") isoObject)
* Method Details
  --------------

  + ### getRecipeList

    public [CraftRecipeListNodeCollection](../crafting/recipe/CraftRecipeListNodeCollection.html "class in zombie.entity.components.crafting.recipe") getRecipeList()
  + ### getRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getRecipe()

    Overrides:
    :   `getRecipe` in class `BaseCraftingLogic`
  + ### getRecipeData

    public [CraftRecipeData](../crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getRecipeData()
  + ### getRecipeDataInProgress

    public [CraftRecipeData](../crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getRecipeDataInProgress()
  + ### getSelectedBuildObject

    public [SpriteConfigManager.ObjectInfo](../spriteconfig/SpriteConfigManager.ObjectInfo.html "class in zombie.entity.components.spriteconfig") getSelectedBuildObject()
  + ### getWallCoveringParams

    public se.krka.kahlua.vm.KahluaTable getWallCoveringParams()
  + ### getPaintColor

    private [Color](../../../core/Color.html "class in zombie.core") getPaintColor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") paintType)
  + ### getAllBuildableRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getAllBuildableRecipes()
  + ### setRecipe

    public void setRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)

    Overrides:
    :   `setRecipe` in class `BaseCraftingLogic`
  + ### isCraftActionInProgress

    public boolean isCraftActionInProgress()
  + ### areAllInputItemsSatisfied

    public boolean areAllInputItemsSatisfied()

    Overrides:
    :   `areAllInputItemsSatisfied` in class `BaseCraftingLogic`
  + ### isInputSatisfied

    public boolean isInputSatisfied([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)

    Overrides:
    :   `isInputSatisfied` in class `BaseCraftingLogic`
  + ### startCraftAction

    public void startCraftAction(se.krka.kahlua.j2se.KahluaTableImpl actionTable)
  + ### updateFloorContainer

    public void updateFloorContainer()
  + ### performCurrentRecipe

    public boolean performCurrentRecipe()
  + ### stopCraftAction

    public void stopCraftAction()
  + ### getAllConsumedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllConsumedItems()
  + ### setSelectedRecipeStyle

    public void setSelectedRecipeStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") style)
  + ### getSelectedRecipeStyle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSelectedRecipeStyle()
  + ### setRecipeSortMode

    public void setRecipeSortMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sortMode)
  + ### getRecipeSortMode

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeSortMode()
  + ### setLastSelectedRecipe

    public void setLastSelectedRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getLastSelectedRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getLastSelectedRecipe()
  + ### setLastManualInputMode

    public void setLastManualInputMode(boolean b)
  + ### getLastManualInputMode

    protected boolean getLastManualInputMode()