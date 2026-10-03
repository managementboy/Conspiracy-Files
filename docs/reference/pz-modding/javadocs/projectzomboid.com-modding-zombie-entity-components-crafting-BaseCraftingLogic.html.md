[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [BaseCraftingLogic](BaseCraftingLogic.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [player](#player)
   2. [craftBench](#craftBench)
   3. [isoObject](#isoObject)
   4. [events](#events)
   5. [allItems](#allItems)
   6. [containers](#containers)
   7. [sourceResources](#sourceResources)
   8. [filterString](#filterString)
   9. [categoryFilterString](#categoryFilterString)
   10. [completeRecipeList](#completeRecipeList)
   11. [filteredRecipeList](#filteredRecipeList)
   12. [recipeData](#recipeData)
   13. [testRecipeData](#testRecipeData)
   14. [manualSelectInputs](#manualSelectInputs)
   15. [showManualSelectInputs](#showManualSelectInputs)
   16. [manualSelectInputScriptFilter](#manualSelectInputScriptFilter)
   17. [manualInputAllowedItemTypes](#manualInputAllowedItemTypes)
   18. [cachedPossibleCraftCount](#cachedPossibleCraftCount)
   19. [limitAutoFillToCurrentlyFilledItems](#limitAutoFillToCurrentlyFilledItems)
   20. [multicraftConsumedResources](#multicraftConsumedResources)
   21. [multicraftConsumedItems](#multicraftConsumedItems)
   22. [inputItemNodeCollection](#inputItemNodeCollection)
   23. [cachedRecipeComparator](#cachedRecipeComparator)
   24. [cachedRecipeInfos](#cachedRecipeInfos)
   25. [cachedRecipeInfoMap](#cachedRecipeInfoMap)
   26. [cachedRecipeInfosDirty](#cachedRecipeInfosDirty)
   27. [cachedCanPerform](#cachedCanPerform)
   28. [cachedCanPerformDirty](#cachedCanPerformDirty)
   29. [targetVariableInputRatio](#targetVariableInputRatio)
   30. [TL\_getFavouriteModDataString](#TL_getFavouriteModDataString)
7. [Constructor Details](#constructor-detail)
   1. [BaseCraftingLogic(IsoGameCharacter, CraftBench)](#%3Cinit%3E(zombie.characters.IsoGameCharacter,zombie.entity.components.crafting.CraftBench))
8. [Method Details](#method-detail)
   1. [getCategoryList()](#getCategoryList())
   2. [registerEvent(String)](#registerEvent(java.lang.String))
   3. [addEventListener(String, Object)](#addEventListener(java.lang.String,java.lang.Object))
   4. [addEventListener(String, Object, Object)](#addEventListener(java.lang.String,java.lang.Object,java.lang.Object))
   5. [triggerEvent(String, Object...)](#triggerEvent(java.lang.String,java.lang.Object...))
   6. [filterRecipeList(String, String)](#filterRecipeList(java.lang.String,java.lang.String))
   7. [filterRecipeList(String, String, boolean)](#filterRecipeList(java.lang.String,java.lang.String,boolean))
   8. [filterRecipeList(String, String, boolean, IsoPlayer)](#filterRecipeList(java.lang.String,java.lang.String,boolean,zombie.characters.IsoPlayer))
   9. [getFilterStringMatchType(String, String, String[], boolean)](#getFilterStringMatchType(java.lang.String,java.lang.String,java.lang.String%5B%5D,boolean))
   10. [filterAndSortRecipeList(String, String, CraftRecipeListNodeCollection, List, IsoPlayer, Comparator)](#filterAndSortRecipeList(java.lang.String,java.lang.String,zombie.entity.components.crafting.recipe.CraftRecipeListNodeCollection,java.util.List,zombie.characters.IsoPlayer,java.util.Comparator))
   11. [sortRecipeList()](#sortRecipeList())
   12. [setSortModeInternal(String)](#setSortModeInternal(java.lang.String))
   13. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   14. [setRecipes(List)](#setRecipes(java.util.List))
   15. [getRecipe()](#getRecipe())
   16. [setContainers(ArrayList)](#setContainers(java.util.ArrayList))
   17. [getContainers()](#getContainers())
   18. [refresh()](#refresh())
   19. [setTargetVariableInputRatio(float)](#setTargetVariableInputRatio(float))
   20. [clearTargetVariableInputRatio()](#clearTargetVariableInputRatio())
   21. [getVariableInputRatio()](#getVariableInputRatio())
   22. [getFavouriteModDataString(CraftRecipe)](#getFavouriteModDataString(zombie.scripting.entity.components.crafting.CraftRecipe))
   23. [getFavouriteModDataString(String)](#getFavouriteModDataString(java.lang.String))
   24. [setSelectedRecipeStyle(String, String)](#setSelectedRecipeStyle(java.lang.String,java.lang.String))
   25. [getSelectedRecipeStyle(String)](#getSelectedRecipeStyle(java.lang.String))
   26. [setRecipeSortMode(String, String)](#setRecipeSortMode(java.lang.String,java.lang.String))
   27. [getRecipeSortMode(String)](#getRecipeSortMode(java.lang.String))
   28. [setLastSelectedRecipe(String, CraftRecipe)](#setLastSelectedRecipe(java.lang.String,zombie.scripting.entity.components.crafting.CraftRecipe))
   29. [getLastSelectedRecipe(String)](#getLastSelectedRecipe(java.lang.String))
   30. [setLastManualInputMode(String, boolean)](#setLastManualInputMode(java.lang.String,boolean))
   31. [getLastManualInputMode(String)](#getLastManualInputMode(java.lang.String))
   32. [callLuaObject(String, Object)](#callLuaObject(java.lang.String,java.lang.Object))
   33. [callLuaBool(String, Object)](#callLuaBool(java.lang.String,java.lang.Object))
   34. [callLua(String, Object)](#callLua(java.lang.String,java.lang.Object))
   35. [callLua(String, Object, Object)](#callLua(java.lang.String,java.lang.Object,java.lang.Object))
   36. [callLua(String, Object, Object, Object)](#callLua(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))
   37. [getModelHandOne()](#getModelHandOne())
   38. [getModelHandTwo()](#getModelHandTwo())
   39. [isContainersAccessible(List)](#isContainersAccessible(java.util.List))
   40. [updateFloorContainer(ArrayList)](#updateFloorContainer(java.util.ArrayList))
   41. [createCachedRecipeInfo(CraftRecipe, ArrayList)](#createCachedRecipeInfo(zombie.scripting.entity.components.crafting.CraftRecipe,java.util.ArrayList))
   42. [rebuildCachedRecipeInfo()](#rebuildCachedRecipeInfo())
   43. [getCachedRecipeInfo(CraftRecipe)](#getCachedRecipeInfo(zombie.scripting.entity.components.crafting.CraftRecipe))
   44. [areAllInputItemsSatisfied()](#areAllInputItemsSatisfied())
   45. [isCharacterInRangeOfWorkbench()](#isCharacterInRangeOfWorkbench())
   46. [hasRequiredWorkstation()](#hasRequiredWorkstation())
   47. [cachedCanPerformCurrentRecipe()](#cachedCanPerformCurrentRecipe())
   48. [canPerformCurrentRecipe()](#canPerformCurrentRecipe())
   49. [isManualSelectInputs()](#isManualSelectInputs())
   50. [setManualSelectInputs(boolean)](#setManualSelectInputs(boolean))
   51. [shouldShowManualSelectInputs()](#shouldShowManualSelectInputs())
   52. [setShowManualSelectInputs(boolean)](#setShowManualSelectInputs(boolean))
   53. [getManualSelectInputScriptFilter()](#getManualSelectInputScriptFilter())
   54. [setManualSelectInputScriptFilter(InputScript)](#setManualSelectInputScriptFilter(zombie.scripting.entity.components.crafting.InputScript))
   55. [clearManualInputs()](#clearManualInputs())
   56. [clearManualInputsFor(CraftRecipeData.InputScriptData)](#clearManualInputsFor(zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData))
   57. [setManualInputsFor(InputScript, ArrayList)](#setManualInputsFor(zombie.scripting.entity.components.crafting.InputScript,java.util.ArrayList))
   58. [getManualInputsFor(InputScript, ArrayList)](#getManualInputsFor(zombie.scripting.entity.components.crafting.InputScript,java.util.ArrayList))
   59. [copyManualInputsFrom(BaseCraftingLogic)](#copyManualInputsFrom(zombie.entity.components.crafting.BaseCraftingLogic))
   60. [updateManualInputAllowedItemTypes()](#updateManualInputAllowedItemTypes())
   61. [populateInputs(IsoGameCharacter, List, List, boolean)](#populateInputs(zombie.characters.IsoGameCharacter,java.util.List,java.util.List,boolean))
   62. [autoPopulateInputs()](#autoPopulateInputs())
   63. [getInputItemNodes()](#getInputItemNodes())
   64. [getInputItemNodesForInput(InputScript)](#getInputItemNodesForInput(zombie.scripting.entity.components.crafting.InputScript))
   65. [getInputCount(InputScript)](#getInputCount(zombie.scripting.entity.components.crafting.InputScript))
   66. [getInputUses(InputScript)](#getInputUses(zombie.scripting.entity.components.crafting.InputScript))
   67. [isInputSatisfied(InputScript)](#isInputSatisfied(zombie.scripting.entity.components.crafting.InputScript))
   68. [getSatisfiedInputFluids(InputScript)](#getSatisfiedInputFluids(zombie.scripting.entity.components.crafting.InputScript))
   69. [getSatisfiedInputItems(InputScript)](#getSatisfiedInputItems(zombie.scripting.entity.components.crafting.InputScript))
   70. [getSatisfiedInputInventoryItems(InputScript)](#getSatisfiedInputInventoryItems(zombie.scripting.entity.components.crafting.InputScript))
   71. [getAllViableInputInventoryItems()](#getAllViableInputInventoryItems())
   72. [getAllViableInputResources()](#getAllViableInputResources())
   73. [offerInputItem(InventoryItem)](#offerInputItem(zombie.inventory.InventoryItem))
   74. [removeInputItem(InventoryItem)](#removeInputItem(zombie.inventory.InventoryItem))
   75. [getPossibleCraftCount(boolean)](#getPossibleCraftCount(boolean))
   76. [getMulticraftConsumedResources()](#getMulticraftConsumedResources())
   77. [getMulticraftConsumedItems()](#getMulticraftConsumedItems())
   78. [getMulticraftConsumedItemsFor(InputScript, ArrayList)](#getMulticraftConsumedItemsFor(zombie.scripting.entity.components.crafting.InputScript,java.util.ArrayList))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class BaseCraftingLogic
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.BaseCraftingLogic

Direct Known Subclasses:
:   `BuildLogic, HandcraftLogic`

---

public abstract class BaseCraftingLogic
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `BaseCraftingLogic.CachedRecipeComparator`

  sort order: Valid Recipes, CanPerform Recipe, AlphaNumeric

  `static class`

  `BaseCraftingLogic.CachedRecipeInfo`

  `protected static class`

  `BaseCraftingLogic.CraftEventHandler`

  `(package private) static enum`

  `BaseCraftingLogic.FilterStringMatchType`

  Filter string match type - to assist with ordering of search results by match exactness
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final ArrayList<InventoryItem>`

  `allItems`

  `protected boolean`

  `cachedCanPerform`

  `protected boolean`

  `cachedCanPerformDirty`

  `protected int`

  `cachedPossibleCraftCount`

  `protected final BaseCraftingLogic.CachedRecipeComparator`

  `cachedRecipeComparator`

  `protected final HashMap<CraftRecipe, BaseCraftingLogic.CachedRecipeInfo>`

  `cachedRecipeInfoMap`

  `protected final ArrayList<BaseCraftingLogic.CachedRecipeInfo>`

  `cachedRecipeInfos`

  `protected boolean`

  `cachedRecipeInfosDirty`

  `protected String`

  `categoryFilterString`

  `protected final ArrayList<CraftRecipe>`

  `completeRecipeList`

  `protected final ArrayList<ItemContainer>`

  `containers`

  `protected final CraftBench`

  `craftBench`

  `protected final HashMap<String, ArrayList<BaseCraftingLogic.CraftEventHandler>>`

  `events`

  `protected final CraftRecipeListNodeCollection`

  `filteredRecipeList`

  `protected String`

  `filterString`

  `protected zombie.entity.components.crafting.recipe.InputItemNodeCollection`

  `inputItemNodeCollection`

  `protected IsoObject`

  `isoObject`

  `private final boolean`

  `limitAutoFillToCurrentlyFilledItems`

  `protected final HashSet<String>`

  `manualInputAllowedItemTypes`

  `private boolean`

  `manualSelectInputs`

  `protected InputScript`

  `manualSelectInputScriptFilter`

  `private final ArrayList<InventoryItem>`

  `multicraftConsumedItems`

  `private final ArrayList<Resource>`

  `multicraftConsumedResources`

  `protected final IsoGameCharacter`

  `player`

  `protected final CraftRecipeData`

  `recipeData`

  `private boolean`

  `showManualSelectInputs`

  `protected final ArrayList<Resource>`

  `sourceResources`

  `protected float`

  `targetVariableInputRatio`

  `protected final CraftRecipeData`

  `testRecipeData`

  `private static final ThreadLocal<HashMap<String,String>>`

  `TL_getFavouriteModDataString`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BaseCraftingLogic(IsoGameCharacter player,
  CraftBench craftBench)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

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

  `void`

  `autoPopulateInputs()`

  `boolean`

  `cachedCanPerformCurrentRecipe()`

  `static void`

  `callLua(String func,
  Object params)`

  `static void`

  `callLua(String func,
  Object params,
  Object params2)`

  `static void`

  `callLua(String func,
  Object params,
  Object params2,
  Object params3)`

  `static boolean`

  `callLuaBool(String func,
  Object params)`

  `static se.krka.kahlua.vm.KahluaTable`

  `callLuaObject(String func,
  Object params)`

  `boolean`

  `canPerformCurrentRecipe()`

  `void`

  `clearManualInputs()`

  `void`

  `clearManualInputsFor(CraftRecipeData.InputScriptData input)`

  `void`

  `clearTargetVariableInputRatio()`

  `void`

  `copyManualInputsFrom(BaseCraftingLogic logic)`

  `protected BaseCraftingLogic.CachedRecipeInfo`

  `createCachedRecipeInfo(CraftRecipe recipe,
  ArrayList<ItemContainer> containers)`

  `static CraftRecipeListNodeCollection`

  `filterAndSortRecipeList(String filterString,
  String categoryFilterString,
  CraftRecipeListNodeCollection listToPopulate,
  List<CraftRecipe> sourceList,
  IsoPlayer player,
  Comparator<CraftRecipe> sortComparator)`

  Filters a list of CraftRecipe's based on supplied 'filterString'
  Filtering options:
  - No prefix, search if recipe name contains filter string
  - Prefix with '@' search if recipe mod name contains filter string
  - Prefix with '$' search if recipe has a tag containing filter string

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

  `List<InventoryItem>`

  `getAllViableInputInventoryItems()`

  `List<Resource>`

  `getAllViableInputResources()`

  `BaseCraftingLogic.CachedRecipeInfo`

  `getCachedRecipeInfo(CraftRecipe recipe)`

  `ArrayList<String>`

  `getCategoryList()`

  `ArrayList<ItemContainer>`

  `getContainers()`

  `static String`

  `getFavouriteModDataString(String recipe)`

  `static String`

  `getFavouriteModDataString(CraftRecipe recipe)`

  `private static BaseCraftingLogic.FilterStringMatchType`

  `getFilterStringMatchType(String filterString,
  String recipeName,
  String[] filterStringParts,
  boolean matchExactly)`

  `int`

  `getInputCount(InputScript inputScript)`

  `ArrayList<InputItemNode>`

  `getInputItemNodes()`

  `ArrayList<InputItemNode>`

  `getInputItemNodesForInput(InputScript input)`

  `float`

  `getInputUses(InputScript inputScript)`

  `protected boolean`

  `getLastManualInputMode(String panel)`

  `protected CraftRecipe`

  `getLastSelectedRecipe(String panel)`

  `ArrayList<InventoryItem>`

  `getManualInputsFor(InputScript inputScript,
  ArrayList<InventoryItem> list)`

  `InputScript`

  `getManualSelectInputScriptFilter()`

  `String`

  `getModelHandOne()`

  `String`

  `getModelHandTwo()`

  `ArrayList<InventoryItem>`

  `getMulticraftConsumedItems()`

  `ArrayList<InventoryItem>`

  `getMulticraftConsumedItemsFor(InputScript inputScript,
  ArrayList<InventoryItem> list)`

  `ArrayList<Resource>`

  `getMulticraftConsumedResources()`

  `int`

  `getPossibleCraftCount(boolean forceRecache)`

  `CraftRecipe`

  `getRecipe()`

  `protected String`

  `getRecipeSortMode(String panel)`

  `List<Fluid>`

  `getSatisfiedInputFluids(InputScript inputScript)`

  `List<InventoryItem>`

  `getSatisfiedInputInventoryItems(InputScript inputScript)`

  `List<Item>`

  `getSatisfiedInputItems(InputScript inputScript)`

  `protected String`

  `getSelectedRecipeStyle(String panel)`

  `float`

  `getVariableInputRatio()`

  `boolean`

  `hasRequiredWorkstation()`

  `boolean`

  `isCharacterInRangeOfWorkbench()`

  `boolean`

  `isContainersAccessible(List<ItemContainer> containers)`

  `boolean`

  `isInputSatisfied(InputScript inputScript)`

  `boolean`

  `isManualSelectInputs()`

  `boolean`

  `offerInputItem(InventoryItem item)`

  `void`

  `populateInputs(IsoGameCharacter player,
  List<InventoryItem> inputItems,
  List<Resource> resources,
  boolean clearExisting)`

  `protected void`

  `rebuildCachedRecipeInfo()`

  `void`

  `refresh()`

  `protected void`

  `registerEvent(String eventName)`

  `boolean`

  `removeInputItem(InventoryItem item)`

  `boolean`

  `setContainers(ArrayList<ItemContainer> containersToUse)`

  `protected void`

  `setLastManualInputMode(String panel,
  boolean manualInputs)`

  `protected void`

  `setLastSelectedRecipe(String panel,
  CraftRecipe recipe)`

  `boolean`

  `setManualInputsFor(InputScript inputScript,
  ArrayList<InventoryItem> list)`

  `void`

  `setManualSelectInputs(boolean b)`

  `void`

  `setManualSelectInputScriptFilter(InputScript script)`

  `void`

  `setRecipe(CraftRecipe recipe)`

  `void`

  `setRecipes(List<CraftRecipe> recipes)`

  `protected void`

  `setRecipeSortMode(String panel,
  String sortMode)`

  `protected void`

  `setSelectedRecipeStyle(String panel,
  String style)`

  `void`

  `setShowManualSelectInputs(boolean b)`

  `protected void`

  `setSortModeInternal(String sortMode)`

  `void`

  `setTargetVariableInputRatio(float target)`

  `boolean`

  `shouldShowManualSelectInputs()`

  `void`

  `sortRecipeList()`

  `protected void`

  `triggerEvent(String event,
  Object... args)`

  `boolean`

  `updateFloorContainer(ArrayList<ItemContainer> containers)`

  `void`

  `updateManualInputAllowedItemTypes()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### player

    protected final [IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") player
  + ### craftBench

    protected final [CraftBench](CraftBench.html "class in zombie.entity.components.crafting") craftBench
  + ### isoObject

    protected [IsoObject](../../../iso/IsoObject.html "class in zombie.iso") isoObject
  + ### events

    protected final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseCraftingLogic.CraftEventHandler](BaseCraftingLogic.CraftEventHandler.html "class in zombie.entity.components.crafting")>> events
  + ### allItems

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> allItems
  + ### containers

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../inventory/ItemContainer.html "class in zombie.inventory")> containers
  + ### sourceResources

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> sourceResources
  + ### filterString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterString
  + ### categoryFilterString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") categoryFilterString
  + ### completeRecipeList

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> completeRecipeList
  + ### filteredRecipeList

    protected final [CraftRecipeListNodeCollection](recipe/CraftRecipeListNodeCollection.html "class in zombie.entity.components.crafting.recipe") filteredRecipeList
  + ### recipeData

    protected final [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeData
  + ### testRecipeData

    protected final [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") testRecipeData
  + ### manualSelectInputs

    private boolean manualSelectInputs
  + ### showManualSelectInputs

    private boolean showManualSelectInputs
  + ### manualSelectInputScriptFilter

    protected [InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") manualSelectInputScriptFilter
  + ### manualInputAllowedItemTypes

    protected final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> manualInputAllowedItemTypes
  + ### cachedPossibleCraftCount

    protected int cachedPossibleCraftCount
  + ### limitAutoFillToCurrentlyFilledItems

    private final boolean limitAutoFillToCurrentlyFilledItems

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.crafting.BaseCraftingLogic.limitAutoFillToCurrentlyFilledItems)
  + ### multicraftConsumedResources

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> multicraftConsumedResources
  + ### multicraftConsumedItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> multicraftConsumedItems
  + ### inputItemNodeCollection

    protected zombie.entity.components.crafting.recipe.InputItemNodeCollection inputItemNodeCollection
  + ### cachedRecipeComparator

    protected final [BaseCraftingLogic.CachedRecipeComparator](BaseCraftingLogic.CachedRecipeComparator.html "class in zombie.entity.components.crafting") cachedRecipeComparator
  + ### cachedRecipeInfos

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseCraftingLogic.CachedRecipeInfo](BaseCraftingLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting")> cachedRecipeInfos
  + ### cachedRecipeInfoMap

    protected final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting"), [BaseCraftingLogic.CachedRecipeInfo](BaseCraftingLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting")> cachedRecipeInfoMap
  + ### cachedRecipeInfosDirty

    protected boolean cachedRecipeInfosDirty
  + ### cachedCanPerform

    protected boolean cachedCanPerform
  + ### cachedCanPerformDirty

    protected boolean cachedCanPerformDirty
  + ### targetVariableInputRatio

    protected float targetVariableInputRatio
  + ### TL\_getFavouriteModDataString

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> TL\_getFavouriteModDataString
* Constructor Details
  -------------------

  + ### BaseCraftingLogic

    public BaseCraftingLogic([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") player,
    [CraftBench](CraftBench.html "class in zombie.entity.components.crafting") craftBench)
* Method Details
  --------------

  + ### getCategoryList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getCategoryList()
  + ### registerEvent

    protected void registerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventName)
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
  + ### getFilterStringMatchType

    private static [BaseCraftingLogic.FilterStringMatchType](BaseCraftingLogic.FilterStringMatchType.html "enum class in zombie.entity.components.crafting") getFilterStringMatchType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterString,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] filterStringParts,
    boolean matchExactly)
  + ### filterAndSortRecipeList

    public static [CraftRecipeListNodeCollection](recipe/CraftRecipeListNodeCollection.html "class in zombie.entity.components.crafting.recipe") filterAndSortRecipeList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterString,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") categoryFilterString,
    [CraftRecipeListNodeCollection](recipe/CraftRecipeListNodeCollection.html "class in zombie.entity.components.crafting.recipe") listToPopulate,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> sourceList,
    [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player,
    [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> sortComparator)

    Filters a list of CraftRecipe's based on supplied 'filterString'
    Filtering options:
    - No prefix, search if recipe name contains filter string
    - Prefix with '@' search if recipe mod name contains filter string
    - Prefix with '$' search if recipe has a tag containing filter string
  + ### sortRecipeList

    public void sortRecipeList()
  + ### setSortModeInternal

    protected void setSortModeInternal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sortMode)
  + ### setRecipe

    public void setRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### setRecipes

    public void setRecipes([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipes)
  + ### getRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getRecipe()
  + ### setContainers

    public boolean setContainers([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../inventory/ItemContainer.html "class in zombie.inventory")> containersToUse)
  + ### getContainers

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../inventory/ItemContainer.html "class in zombie.inventory")> getContainers()
  + ### refresh

    public void refresh()
  + ### setTargetVariableInputRatio

    public void setTargetVariableInputRatio(float target)
  + ### clearTargetVariableInputRatio

    public void clearTargetVariableInputRatio()
  + ### getVariableInputRatio

    public float getVariableInputRatio()
  + ### getFavouriteModDataString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFavouriteModDataString([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getFavouriteModDataString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFavouriteModDataString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
  + ### setSelectedRecipeStyle

    protected void setSelectedRecipeStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") panel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") style)
  + ### getSelectedRecipeStyle

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSelectedRecipeStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") panel)
  + ### setRecipeSortMode

    protected void setRecipeSortMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") panel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sortMode)
  + ### getRecipeSortMode

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeSortMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") panel)
  + ### setLastSelectedRecipe

    protected void setLastSelectedRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") panel,
    [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getLastSelectedRecipe

    protected [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getLastSelectedRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") panel)
  + ### setLastManualInputMode

    protected void setLastManualInputMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") panel,
    boolean manualInputs)
  + ### getLastManualInputMode

    protected boolean getLastManualInputMode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") panel)
  + ### callLuaObject

    public static se.krka.kahlua.vm.KahluaTable callLuaObject([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") params)
  + ### callLuaBool

    public static boolean callLuaBool([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") params)
  + ### callLua

    public static void callLua([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") params)
  + ### callLua

    public static void callLua([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") params,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") params2)
  + ### callLua

    public static void callLua([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") params,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") params2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") params3)
  + ### getModelHandOne

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModelHandOne()
  + ### getModelHandTwo

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModelHandTwo()
  + ### isContainersAccessible

    public boolean isContainersAccessible([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[ItemContainer](../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### updateFloorContainer

    public boolean updateFloorContainer([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### createCachedRecipeInfo

    protected [BaseCraftingLogic.CachedRecipeInfo](BaseCraftingLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting") createCachedRecipeInfo([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### rebuildCachedRecipeInfo

    protected void rebuildCachedRecipeInfo()
  + ### getCachedRecipeInfo

    public [BaseCraftingLogic.CachedRecipeInfo](BaseCraftingLogic.CachedRecipeInfo.html "class in zombie.entity.components.crafting") getCachedRecipeInfo([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### areAllInputItemsSatisfied

    public boolean areAllInputItemsSatisfied()
  + ### isCharacterInRangeOfWorkbench

    public boolean isCharacterInRangeOfWorkbench()
  + ### hasRequiredWorkstation

    public boolean hasRequiredWorkstation()
  + ### cachedCanPerformCurrentRecipe

    public boolean cachedCanPerformCurrentRecipe()
  + ### canPerformCurrentRecipe

    public boolean canPerformCurrentRecipe()
  + ### isManualSelectInputs

    public boolean isManualSelectInputs()
  + ### setManualSelectInputs

    public void setManualSelectInputs(boolean b)
  + ### shouldShowManualSelectInputs

    public boolean shouldShowManualSelectInputs()
  + ### setShowManualSelectInputs

    public void setShowManualSelectInputs(boolean b)
  + ### getManualSelectInputScriptFilter

    public [InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") getManualSelectInputScriptFilter()
  + ### setManualSelectInputScriptFilter

    public void setManualSelectInputScriptFilter([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") script)
  + ### clearManualInputs

    public void clearManualInputs()
  + ### clearManualInputsFor

    public void clearManualInputsFor([CraftRecipeData.InputScriptData](recipe/CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") input)
  + ### setManualInputsFor

    public boolean setManualInputsFor([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### getManualInputsFor

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> getManualInputsFor([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### copyManualInputsFrom

    public void copyManualInputsFrom([BaseCraftingLogic](BaseCraftingLogic.html "class in zombie.entity.components.crafting") logic)
  + ### updateManualInputAllowedItemTypes

    public void updateManualInputAllowedItemTypes()
  + ### populateInputs

    public void populateInputs([IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") player,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> inputItems,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    boolean clearExisting)
  + ### autoPopulateInputs

    public void autoPopulateInputs()
  + ### getInputItemNodes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InputItemNode](recipe/InputItemNode.html "class in zombie.entity.components.crafting.recipe")> getInputItemNodes()
  + ### getInputItemNodesForInput

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InputItemNode](recipe/InputItemNode.html "class in zombie.entity.components.crafting.recipe")> getInputItemNodesForInput([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input)
  + ### getInputCount

    public int getInputCount([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### getInputUses

    public float getInputUses([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### isInputSatisfied

    public boolean isInputSatisfied([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### getSatisfiedInputFluids

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Fluid](../fluids/Fluid.html "class in zombie.entity.components.fluids")> getSatisfiedInputFluids([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### getSatisfiedInputItems

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects")> getSatisfiedInputItems([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### getSatisfiedInputInventoryItems

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> getSatisfiedInputInventoryItems([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### getAllViableInputInventoryItems

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllViableInputInventoryItems()
  + ### getAllViableInputResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getAllViableInputResources()
  + ### offerInputItem

    public boolean offerInputItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### removeInputItem

    public boolean removeInputItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getPossibleCraftCount

    public int getPossibleCraftCount(boolean forceRecache)
  + ### getMulticraftConsumedResources

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getMulticraftConsumedResources()
  + ### getMulticraftConsumedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> getMulticraftConsumedItems()
  + ### getMulticraftConsumedItemsFor

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> getMulticraftConsumedItemsFor([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> list)