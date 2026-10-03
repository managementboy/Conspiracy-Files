[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeData](CraftRecipeData.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [FLOAT\_EPSILON](#FLOAT_EPSILON)
   2. [MAX\_CRAFT\_COUNT](#MAX_CRAFT_COUNT)
   3. [DATA\_POOL](#DATA_POOL)
   4. [character](#character)
   5. [craftRecipeMonitor](#craftRecipeMonitor)
   6. [recipe](#recipe)
   7. [inputs](#inputs)
   8. [outputs](#outputs)
   9. [usedResources](#usedResources)
   10. [usedItems](#usedItems)
   11. [allowInputResources](#allowInputResources)
   12. [allowInputItems](#allowInputItems)
   13. [allowOutputResources](#allowOutputResources)
   14. [allowOutputItems](#allowOutputItems)
   15. [craftMode](#craftMode)
   16. [hasConsumedInputs](#hasConsumedInputs)
   17. [hasTestedInputs](#hasTestedInputs)
   18. [toOutputItems](#toOutputItems)
   19. [consumedUsedItems](#consumedUsedItems)
   20. [allViableItems](#allViableItems)
   21. [allViableResources](#allViableResources)
   22. [luaFunctionMap](#luaFunctionMap)
   23. [luaOnTestCacheString](#luaOnTestCacheString)
   24. [luaOnTestCacheObject](#luaOnTestCacheObject)
   25. [targetVariableInputRatio](#targetVariableInputRatio)
   26. [calculatedVariableInputRatio](#calculatedVariableInputRatio)
   27. [variableInputOverfilledItems](#variableInputOverfilledItems)
   28. [variableInputOverfilledResources](#variableInputOverfilledResources)
   29. [eatPercentage](#eatPercentage)
   30. [elapsedTime](#elapsedTime)
   31. [modData](#modData)
7. [Constructor Details](#constructor-detail)
   1. [CraftRecipeData()](#%3Cinit%3E())
   2. [CraftRecipeData(CraftMode, boolean, boolean, boolean, boolean)](#%3Cinit%3E(zombie.entity.components.crafting.CraftMode,boolean,boolean,boolean,boolean))
8. [Method Details](#method-detail)
   1. [Alloc(CraftMode, boolean, boolean, boolean, boolean)](#Alloc(zombie.entity.components.crafting.CraftMode,boolean,boolean,boolean,boolean))
   2. [Release(CraftRecipeData)](#Release(zombie.entity.components.crafting.recipe.CraftRecipeData))
   3. [setMonitor(CraftRecipeMonitor)](#setMonitor(zombie.entity.components.crafting.CraftRecipeMonitor))
   4. [isAllowInputItems()](#isAllowInputItems())
   5. [isAllowOutputItems()](#isAllowOutputItems())
   6. [isAllowInputResources()](#isAllowInputResources())
   7. [isAllowOutputResources()](#isAllowOutputResources())
   8. [getToOutputItems()](#getToOutputItems())
   9. [reset()](#reset())
   10. [clearRecipe()](#clearRecipe())
   11. [clearCaches()](#clearCaches())
   12. [setCharacter(IsoGameCharacter)](#setCharacter(zombie.characters.IsoGameCharacter))
   13. [getCharacter()](#getCharacter())
   14. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   15. [getRecipe()](#getRecipe())
   16. [getDataForInputScript(InputScript)](#getDataForInputScript(zombie.scripting.entity.components.crafting.InputScript))
   17. [getDataForOutputScript(OutputScript)](#getDataForOutputScript(zombie.scripting.entity.components.crafting.OutputScript))
   18. [getFirstManualInputFor(InputScript)](#getFirstManualInputFor(zombie.scripting.entity.components.crafting.InputScript))
   19. [canOfferInputItem(InventoryItem)](#canOfferInputItem(zombie.inventory.InventoryItem))
   20. [canOfferInputItem(InventoryItem, boolean)](#canOfferInputItem(zombie.inventory.InventoryItem,boolean))
   21. [canOfferInputItem(InputScript, InventoryItem)](#canOfferInputItem(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem))
   22. [canOfferInputItem(InputScript, InventoryItem, boolean)](#canOfferInputItem(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem,boolean))
   23. [offerAndReplaceInputItem(InventoryItem)](#offerAndReplaceInputItem(zombie.inventory.InventoryItem))
   24. [offerAndReplaceInputItem(CraftRecipeData.InputScriptData, InventoryItem)](#offerAndReplaceInputItem(zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData,zombie.inventory.InventoryItem))
   25. [offerInputItem(InputScript, InventoryItem)](#offerInputItem(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem))
   26. [offerInputItem(InputScript, InventoryItem, boolean)](#offerInputItem(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem,boolean))
   27. [containsInputItem(InventoryItem)](#containsInputItem(zombie.inventory.InventoryItem))
   28. [containsInputItem(CraftRecipeData.InputScriptData, InventoryItem)](#containsInputItem(zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData,zombie.inventory.InventoryItem))
   29. [removeInputItem(InventoryItem)](#removeInputItem(zombie.inventory.InventoryItem))
   30. [areAllInputItemsSatisfied()](#areAllInputItemsSatisfied())
   31. [luaCallOnTest()](#luaCallOnTest())
   32. [initLuaFunctions()](#initLuaFunctions())
   33. [luaCallOnStart()](#luaCallOnStart())
   34. [luaCallOnStart(IsoGameCharacter)](#luaCallOnStart(zombie.characters.IsoGameCharacter))
   35. [luaCallOnUpdate()](#luaCallOnUpdate())
   36. [luaCallOnCreate()](#luaCallOnCreate())
   37. [luaCallOnCreate(IsoGameCharacter)](#luaCallOnCreate(zombie.characters.IsoGameCharacter))
   38. [luaCallOnFailed()](#luaCallOnFailed())
   39. [canPerform(IsoGameCharacter, List, List, boolean, ArrayList)](#canPerform(zombie.characters.IsoGameCharacter,java.util.List,java.util.List,boolean,java.util.ArrayList))
   40. [perform(IsoGameCharacter, List, List, ArrayList)](#perform(zombie.characters.IsoGameCharacter,java.util.List,java.util.List,java.util.ArrayList))
   41. [addXP(IsoGameCharacter)](#addXP(zombie.characters.IsoGameCharacter))
   42. [processDestroyAndUsedItems(IsoGameCharacter)](#processDestroyAndUsedItems(zombie.characters.IsoGameCharacter))
   43. [getPossibleCraftCount(List, List, List, List, boolean)](#getPossibleCraftCount(java.util.List,java.util.List,java.util.List,java.util.List,boolean))
   44. [getInputCraftCount(CraftRecipeData.InputScriptData, List, List, boolean)](#getInputCraftCount(zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData,java.util.List,java.util.List,boolean))
   45. [getResourceCraftCount(CraftRecipeData.InputScriptData, List, List, boolean)](#getResourceCraftCount(zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData,java.util.List,java.util.List,boolean))
   46. [canConsumeInputs(List, List, boolean, boolean)](#canConsumeInputs(java.util.List,java.util.List,boolean,boolean))
   47. [canConsumeInputs(List)](#canConsumeInputs(java.util.List))
   48. [consumeInputs(List)](#consumeInputs(java.util.List))
   49. [consumeOnTickInputs(List)](#consumeOnTickInputs(java.util.List))
   50. [canCreateOutputs(List)](#canCreateOutputs(java.util.List))
   51. [createOutputs(List)](#createOutputs(java.util.List))
   52. [canCreateOutputs(List, IsoGameCharacter)](#canCreateOutputs(java.util.List,zombie.characters.IsoGameCharacter))
   53. [createOutputs(List, IsoGameCharacter)](#createOutputs(java.util.List,zombie.characters.IsoGameCharacter))
   54. [createOnTickOutputs(List)](#createOnTickOutputs(java.util.List))
   55. [consumeInputsInternal(IsoGameCharacter, boolean, List, List)](#consumeInputsInternal(zombie.characters.IsoGameCharacter,boolean,java.util.List,java.util.List))
   56. [consumeInputsInternal(IsoGameCharacter, boolean, List, List, boolean, boolean)](#consumeInputsInternal(zombie.characters.IsoGameCharacter,boolean,java.util.List,java.util.List,boolean,boolean))
   57. [createOutputsInternal(boolean, List, IsoGameCharacter)](#createOutputsInternal(boolean,java.util.List,zombie.characters.IsoGameCharacter))
   58. [consumeRecipeInputsOnTick(List)](#consumeRecipeInputsOnTick(java.util.List))
   59. [consumeRecipeInputs(boolean, List, List, boolean, boolean, IsoGameCharacter)](#consumeRecipeInputs(boolean,java.util.List,java.util.List,boolean,boolean,zombie.characters.IsoGameCharacter))
   60. [OnTestItem(InventoryItem)](#OnTestItem(zombie.inventory.InventoryItem))
   61. [consumeInputFromItems(InputScript, List, boolean, CraftRecipeData.CacheData, boolean, IsoGameCharacter)](#consumeInputFromItems(zombie.scripting.entity.components.crafting.InputScript,java.util.List,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,boolean,zombie.characters.IsoGameCharacter))
   62. [consumeInputFromResources(InputScript, List, boolean, CraftRecipeData.CacheData, IsoGameCharacter)](#consumeInputFromResources(zombie.scripting.entity.components.crafting.InputScript,java.util.List,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,zombie.characters.IsoGameCharacter))
   63. [createRecipeOutputsOnTick(List)](#createRecipeOutputsOnTick(java.util.List))
   64. [createRecipeOutputs(boolean, List, IsoGameCharacter)](#createRecipeOutputs(boolean,java.util.List,zombie.characters.IsoGameCharacter))
   65. [processKeepInputItem(CraftRecipeData.InputScriptData, IsoGameCharacter, boolean, InventoryItem)](#processKeepInputItem(zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData,zombie.characters.IsoGameCharacter,boolean,zombie.inventory.InventoryItem))
   66. [createOutputItems(OutputScript, ItemDataList, boolean, CraftRecipeData.CacheData, IsoGameCharacter)](#createOutputItems(zombie.scripting.entity.components.crafting.OutputScript,zombie.entity.components.crafting.recipe.ItemDataList,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,zombie.characters.IsoGameCharacter))
   67. [collectKeepItems(ItemDataList, boolean)](#collectKeepItems(zombie.entity.components.crafting.recipe.ItemDataList,boolean))
   68. [distributeItemsToResources(List, ItemDataList, boolean)](#distributeItemsToResources(java.util.List,zombie.entity.components.crafting.recipe.ItemDataList,boolean))
   69. [createOutputToResources(OutputScript, List, boolean, CraftRecipeData.CacheData)](#createOutputToResources(zombie.scripting.entity.components.crafting.OutputScript,java.util.List,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData))
   70. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   71. [load(ByteBuffer, int, CraftRecipe, boolean)](#load(java.nio.ByteBuffer,int,zombie.scripting.entity.components.crafting.CraftRecipe,boolean))
   72. [getModData()](#getModData())
   73. [getModelHandOne()](#getModelHandOne())
   74. [getModelHandTwo()](#getModelHandTwo())
   75. [getModel(boolean)](#getModel(boolean))
   76. [getAllConsumedItems()](#getAllConsumedItems())
   77. [getAllRecordedConsumedItems()](#getAllRecordedConsumedItems())
   78. [getAllConsumedItems(ArrayList)](#getAllConsumedItems(java.util.ArrayList))
   79. [getAllRecordedConsumedItems(ArrayList)](#getAllRecordedConsumedItems(java.util.ArrayList))
   80. [getAllConsumedItems(ArrayList, boolean)](#getAllConsumedItems(java.util.ArrayList,boolean))
   81. [getAllConsumedItems(ArrayList, boolean, boolean)](#getAllConsumedItems(java.util.ArrayList,boolean,boolean))
   82. [getAllKeepInputItems()](#getAllKeepInputItems())
   83. [getAllKeepInputItems(ArrayList)](#getAllKeepInputItems(java.util.ArrayList))
   84. [getAllInputItemsWithFlag(InputFlag)](#getAllInputItemsWithFlag(zombie.entity.components.crafting.InputFlag))
   85. [getAllInputItemsWithFlag(String)](#getAllInputItemsWithFlag(java.lang.String))
   86. [getInputItems(Integer)](#getInputItems(java.lang.Integer))
   87. [getFirstInputItemWithFlag(InputFlag)](#getFirstInputItemWithFlag(zombie.entity.components.crafting.InputFlag))
   88. [getFirstInputItemWithFlag(String)](#getFirstInputItemWithFlag(java.lang.String))
   89. [getFirstInputItemWithTag(ItemTag)](#getFirstInputItemWithTag(zombie.scripting.objects.ItemTag))
   90. [getAllInputItems()](#getAllInputItems())
   91. [getAppliedInputItemTypes(HashSet)](#getAppliedInputItemTypes(java.util.HashSet))
   92. [getAllDestroyInputItems()](#getAllDestroyInputItems())
   93. [getAllPutBackInputItems()](#getAllPutBackInputItems())
   94. [getAllNotKeepInputItems()](#getAllNotKeepInputItems())
   95. [getFirstCreatedItem()](#getFirstCreatedItem())
   96. [getAllCreatedItems()](#getAllCreatedItems())
   97. [getAllCreatedItems(ArrayList)](#getAllCreatedItems(java.util.ArrayList))
   98. [getFirstInputFluidWithFlag(InputFlag)](#getFirstInputFluidWithFlag(zombie.entity.components.crafting.InputFlag))
   99. [getFirstInputFluidWithFlag(String)](#getFirstInputFluidWithFlag(java.lang.String))
   100. [getAllViableItemsCount()](#getAllViableItemsCount())
   101. [getViableItem(int)](#getViableItem(int))
   102. [getAllViableResourcesCount()](#getAllViableResourcesCount())
   103. [getViableResource(int)](#getViableResource(int))
   104. [destroyAllSurvivingDestroyInputs()](#destroyAllSurvivingDestroyInputs())
   105. [isVariableAmount()](#isVariableAmount())
   106. [getVariableInputRatio()](#getVariableInputRatio())
   107. [setTargetVariableInputRatio(float)](#setTargetVariableInputRatio(float))
   108. [clearTargetVariableInputRatio()](#clearTargetVariableInputRatio())
   109. [addOverfilledResource(InputScript, HashMap)](#addOverfilledResource(zombie.scripting.entity.components.crafting.InputScript,java.util.HashMap))
   110. [getCalculatedVariableInputRatio()](#getCalculatedVariableInputRatio())
   111. [setCalculatedVariableInputRatio(float)](#setCalculatedVariableInputRatio(float))
   112. [getManualInputsFor(InputScript, ArrayList)](#getManualInputsFor(zombie.scripting.entity.components.crafting.InputScript,java.util.ArrayList))
   113. [clearManualInputs()](#clearManualInputs())
   114. [clearManualInputs(CraftRecipeData.InputScriptData)](#clearManualInputs(zombie.entity.components.crafting.recipe.CraftRecipeData.InputScriptData))
   115. [setManualInputsFor(InputScript, ArrayList)](#setManualInputsFor(zombie.scripting.entity.components.crafting.InputScript,java.util.ArrayList))
   116. [populateInputs(IsoGameCharacter, List, List, boolean)](#populateInputs(zombie.characters.IsoGameCharacter,java.util.List,java.util.List,boolean))
   117. [setEatPercentage(int)](#setEatPercentage(int))
   118. [getEatPercentage()](#getEatPercentage())
   119. [getElapsedTime()](#getElapsedTime())
   120. [setElapsedTime(double)](#setElapsedTime(double))
   121. [isFinished()](#isFinished())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeData
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.CraftRecipeData

---

public class CraftRecipeData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `CraftRecipeData.CacheData`

  `static class`

  `CraftRecipeData.InputScriptData`

  `static class`

  `CraftRecipeData.OutputScriptData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `allowInputItems`

  `private boolean`

  `allowInputResources`

  `private boolean`

  `allowOutputItems`

  `private boolean`

  `allowOutputResources`

  `private final ArrayList<InventoryItem>`

  `allViableItems`

  `private final ArrayList<Resource>`

  `allViableResources`

  `private float`

  `calculatedVariableInputRatio`

  `private IsoGameCharacter`

  `character`

  `private final HashSet<InventoryItem>`

  `consumedUsedItems`

  `private CraftMode`

  `craftMode`

  `private CraftRecipeMonitor`

  `craftRecipeMonitor`

  `private static final ArrayDeque<CraftRecipeData>`

  `DATA_POOL`

  `private int`

  `eatPercentage`

  `private double`

  `elapsedTime`

  `private static final float`

  `FLOAT_EPSILON`

  `private boolean`

  `hasConsumedInputs`

  `private boolean`

  `hasTestedInputs`

  `final ArrayList<CraftRecipeData.InputScriptData>`

  `inputs`

  `private final HashMap<CraftRecipe.LuaCall, Object>`

  `luaFunctionMap`

  `private static Object`

  `luaOnTestCacheObject`

  `private static String`

  `luaOnTestCacheString`

  `private static final int`

  `MAX_CRAFT_COUNT`

  `private se.krka.kahlua.vm.KahluaTable`

  `modData`

  `private final ArrayList<CraftRecipeData.OutputScriptData>`

  `outputs`

  `private CraftRecipe`

  `recipe`

  `private float`

  `targetVariableInputRatio`

  `private final ItemDataList`

  `toOutputItems`

  `private final HashSet<InventoryItem>`

  `usedItems`

  `private final HashSet<Resource>`

  `usedResources`

  `private final HashMap<InputScript, HashSet<InventoryItem>>`

  `variableInputOverfilledItems`

  `private final HashMap<InputScript, HashMap<Resource, ArrayList<InventoryItem>>>`

  `variableInputOverfilledResources`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CraftRecipeData()`

  `CraftRecipeData(CraftMode craftMode,
  boolean allowInputResources,
  boolean allowInputItems,
  boolean allowOutputResources,
  boolean allowOutputItems)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addOverfilledResource(InputScript input,
  HashMap<Resource, ArrayList<InventoryItem>> resources)`

  `private void`

  `addXP(IsoGameCharacter character)`

  `static CraftRecipeData`

  `Alloc(CraftMode craftMode,
  boolean allowInputResources,
  boolean allowInputItems,
  boolean allowOutputResources,
  boolean allowOutputItems)`

  `boolean`

  `areAllInputItemsSatisfied()`

  `boolean`

  `canConsumeInputs(List<Resource> inputResources)`

  `boolean`

  `canConsumeInputs(List<Resource> inputResources,
  List<InventoryItem> overrideInputItems,
  boolean forceTestAll,
  boolean clearAllViable)`

  `boolean`

  `canCreateOutputs(List<Resource> outputResources)`

  `boolean`

  `canCreateOutputs(List<Resource> outputResources,
  IsoGameCharacter character)`

  `boolean`

  `canOfferInputItem(InventoryItem inventoryItem)`

  `boolean`

  `canOfferInputItem(InventoryItem inventoryItem,
  boolean verbose)`

  `boolean`

  `canOfferInputItem(InputScript inputScript,
  InventoryItem item)`

  `boolean`

  `canOfferInputItem(InputScript inputScript,
  InventoryItem item,
  boolean verbose)`

  `boolean`

  `canPerform(IsoGameCharacter character,
  List<Resource> inputResources,
  List<InventoryItem> overrideInputItems,
  boolean forceTestAll,
  ArrayList<ItemContainer> containers)`

  `private void`

  `clearCaches()`

  `void`

  `clearManualInputs()`

  `void`

  `clearManualInputs(CraftRecipeData.InputScriptData input)`

  `private void`

  `clearRecipe()`

  `void`

  `clearTargetVariableInputRatio()`

  `private void`

  `collectKeepItems(ItemDataList items,
  boolean testOnly)`

  `private boolean`

  `consumeInputFromItems(InputScript input,
  List<InventoryItem> items,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  boolean clearUsed,
  IsoGameCharacter character)`

  `private boolean`

  `consumeInputFromResources(InputScript input,
  List<Resource> resources,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  IsoGameCharacter character)`

  `boolean`

  `consumeInputs(List<Resource> inputResources)`

  `private boolean`

  `consumeInputsInternal(IsoGameCharacter character,
  boolean testOnly,
  List<Resource> inputResources,
  List<InventoryItem> overrideInputItems)`

  `private boolean`

  `consumeInputsInternal(IsoGameCharacter character,
  boolean testOnly,
  List<Resource> inputResources,
  List<InventoryItem> overrideInputItems,
  boolean forceTestAll,
  boolean clearAllViable)`

  `boolean`

  `consumeOnTickInputs(List<Resource> inputResources)`

  `private boolean`

  `consumeRecipeInputs(boolean testOnly,
  List<Resource> inputResources,
  List<InventoryItem> overrideInputItems,
  boolean forceTestAll,
  boolean clearAllViable,
  IsoGameCharacter character)`

  `private boolean`

  `consumeRecipeInputsOnTick(List<Resource> inputResources)`

  `boolean`

  `containsInputItem(CraftRecipeData.InputScriptData data,
  InventoryItem inventoryItem)`

  `boolean`

  `containsInputItem(InventoryItem inventoryItem)`

  `boolean`

  `createOnTickOutputs(List<Resource> outputResources)`

  `private boolean`

  `createOutputItems(OutputScript output,
  ItemDataList items,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  IsoGameCharacter character)`

  `boolean`

  `createOutputs(List<Resource> outputResources)`

  `boolean`

  `createOutputs(List<Resource> outputResources,
  IsoGameCharacter character)`

  `private boolean`

  `createOutputsInternal(boolean testOnly,
  List<Resource> outputResources,
  IsoGameCharacter character)`

  `private boolean`

  `createOutputToResources(OutputScript output,
  List<Resource> resources,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData)`

  `boolean`

  `createRecipeOutputs(boolean testOnly,
  List<Resource> outputResources,
  IsoGameCharacter character)`

  `private boolean`

  `createRecipeOutputsOnTick(List<Resource> outputResources)`

  `private void`

  `destroyAllSurvivingDestroyInputs()`

  `private void`

  `distributeItemsToResources(List<Resource> outputResources,
  ItemDataList items,
  boolean testOnly)`

  `ArrayList<InventoryItem>`

  `getAllConsumedItems()`

  `ArrayList<InventoryItem>`

  `getAllConsumedItems(ArrayList<InventoryItem> list)`

  `ArrayList<InventoryItem>`

  `getAllConsumedItems(ArrayList<InventoryItem> list,
  boolean includeKeep)`

  `ArrayList<InventoryItem>`

  `getAllConsumedItems(ArrayList<InventoryItem> list,
  boolean includeKeep,
  boolean onlyRecorded)`

  `ArrayList<InventoryItem>`

  `getAllCreatedItems()`

  `ArrayList<InventoryItem>`

  `getAllCreatedItems(ArrayList<InventoryItem> list)`

  `ArrayList<InventoryItem>`

  `getAllDestroyInputItems()`

  `ArrayList<InventoryItem>`

  `getAllInputItems()`

  `ArrayList<InventoryItem>`

  `getAllInputItemsWithFlag(String flag)`

  `ArrayList<InventoryItem>`

  `getAllInputItemsWithFlag(InputFlag flag)`

  `ArrayList<InventoryItem>`

  `getAllKeepInputItems()`

  `ArrayList<InventoryItem>`

  `getAllKeepInputItems(ArrayList<InventoryItem> list)`

  `ArrayList<InventoryItem>`

  `getAllNotKeepInputItems()`

  `ArrayList<InventoryItem>`

  `getAllPutBackInputItems()`

  `ArrayList<InventoryItem>`

  `getAllRecordedConsumedItems()`

  `ArrayList<InventoryItem>`

  `getAllRecordedConsumedItems(ArrayList<InventoryItem> list)`

  `int`

  `getAllViableItemsCount()`

  `int`

  `getAllViableResourcesCount()`

  `HashSet<String>`

  `getAppliedInputItemTypes(HashSet<String> appliedItemTypes)`

  `float`

  `getCalculatedVariableInputRatio()`

  `IsoGameCharacter`

  `getCharacter()`

  `CraftRecipeData.InputScriptData`

  `getDataForInputScript(InputScript script)`

  `protected CraftRecipeData.OutputScriptData`

  `getDataForOutputScript(OutputScript script)`

  `int`

  `getEatPercentage()`

  `double`

  `getElapsedTime()`

  `InventoryItem`

  `getFirstCreatedItem()`

  `FluidSample`

  `getFirstInputFluidWithFlag(String flag)`

  `FluidSample`

  `getFirstInputFluidWithFlag(InputFlag flag)`

  `InventoryItem`

  `getFirstInputItemWithFlag(String flag)`

  `InventoryItem`

  `getFirstInputItemWithFlag(InputFlag flag)`

  `InventoryItem`

  `getFirstInputItemWithTag(ItemTag itemTag)`

  `InventoryItem`

  `getFirstManualInputFor(InputScript inputScript)`

  `private int`

  `getInputCraftCount(CraftRecipeData.InputScriptData inputData,
  List<InventoryItem> inputItems,
  List<InventoryItem> consumedItems,
  boolean limitItemsToAppliedItems)`

  `ArrayList<InventoryItem>`

  `getInputItems(Integer index)`

  `ArrayList<InventoryItem>`

  `getManualInputsFor(InputScript inputScript,
  ArrayList<InventoryItem> list)`

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

  `private String`

  `getModel(boolean isHandOne)`

  `String`

  `getModelHandOne()`

  `String`

  `getModelHandTwo()`

  `int`

  `getPossibleCraftCount(List<Resource> inputResources,
  List<InventoryItem> inputItems,
  List<Resource> consumedResources,
  List<InventoryItem> consumedItems,
  boolean limitItemsToAppliedItems)`

  `CraftRecipe`

  `getRecipe()`

  `private int`

  `getResourceCraftCount(CraftRecipeData.InputScriptData inputData,
  List<Resource> inputResources,
  List<Resource> consumedResources,
  boolean limitItemsToAppliedItems)`

  `ItemDataList`

  `getToOutputItems()`

  `float`

  `getVariableInputRatio()`

  `InventoryItem`

  `getViableItem(int index)`

  `Resource`

  `getViableResource(int index)`

  `private boolean`

  `initLuaFunctions()`

  `boolean`

  `isAllowInputItems()`

  `boolean`

  `isAllowInputResources()`

  `boolean`

  `isAllowOutputItems()`

  `boolean`

  `isAllowOutputResources()`

  `boolean`

  `isFinished()`

  `boolean`

  `isVariableAmount()`

  `boolean`

  `load(ByteBuffer input,
  int worldVersion,
  CraftRecipe recipe,
  boolean recipeInvalidated)`

  `void`

  `luaCallOnCreate()`

  `void`

  `luaCallOnCreate(IsoGameCharacter character)`

  `void`

  `luaCallOnFailed()`

  `void`

  `luaCallOnStart()`

  `void`

  `luaCallOnStart(IsoGameCharacter character)`

  `boolean`

  `luaCallOnTest()`

  `void`

  `luaCallOnUpdate()`

  `boolean`

  `offerAndReplaceInputItem(CraftRecipeData.InputScriptData data,
  InventoryItem inventoryItem)`

  `boolean`

  `offerAndReplaceInputItem(InventoryItem inventoryItem)`

  `boolean`

  `offerInputItem(InputScript inputScript,
  InventoryItem item)`

  `boolean`

  `offerInputItem(InputScript inputScript,
  InventoryItem item,
  boolean verbose)`

  `boolean`

  `OnTestItem(InventoryItem inventoryItem)`

  `boolean`

  `perform(IsoGameCharacter character,
  List<Resource> inputResources,
  List<InventoryItem> overrideInputItems,
  ArrayList<ItemContainer> containers)`

  `void`

  `populateInputs(IsoGameCharacter player,
  List<InventoryItem> inputItems,
  List<Resource> resources,
  boolean clearExisting)`

  `void`

  `processDestroyAndUsedItems(IsoGameCharacter character)`

  `private void`

  `processKeepInputItem(CraftRecipeData.InputScriptData inputData,
  IsoGameCharacter character,
  boolean testOnly,
  InventoryItem inventoryItem)`

  `static void`

  `Release(CraftRecipeData data)`

  `boolean`

  `removeInputItem(InventoryItem inventoryItem)`

  `void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setCalculatedVariableInputRatio(float value)`

  `void`

  `setCharacter(IsoGameCharacter character)`

  `void`

  `setEatPercentage(int percentage)`

  `void`

  `setElapsedTime(double elapsedTime)`

  `boolean`

  `setManualInputsFor(InputScript inputScript,
  ArrayList<InventoryItem> list)`

  `void`

  `setMonitor(CraftRecipeMonitor monitor)`

  `void`

  `setRecipe(CraftRecipe recipe)`

  `void`

  `setTargetVariableInputRatio(float target)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### FLOAT\_EPSILON

    private static final float FLOAT\_EPSILON

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.entity.components.crafting.recipe.CraftRecipeData.FLOAT_EPSILON)
  + ### MAX\_CRAFT\_COUNT

    private static final int MAX\_CRAFT\_COUNT

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.entity.components.crafting.recipe.CraftRecipeData.MAX_CRAFT_COUNT)
  + ### DATA\_POOL

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe")> DATA\_POOL
  + ### character

    private [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character
  + ### craftRecipeMonitor

    private [CraftRecipeMonitor](../CraftRecipeMonitor.html "class in zombie.entity.components.crafting") craftRecipeMonitor
  + ### recipe

    private [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe
  + ### inputs

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe")> inputs
  + ### outputs

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipeData.OutputScriptData](CraftRecipeData.OutputScriptData.html "class in zombie.entity.components.crafting.recipe")> outputs
  + ### usedResources

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> usedResources
  + ### usedItems

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> usedItems
  + ### allowInputResources

    private boolean allowInputResources
  + ### allowInputItems

    private boolean allowInputItems
  + ### allowOutputResources

    private boolean allowOutputResources
  + ### allowOutputItems

    private boolean allowOutputItems
  + ### craftMode

    private [CraftMode](../CraftMode.html "enum class in zombie.entity.components.crafting") craftMode
  + ### hasConsumedInputs

    private boolean hasConsumedInputs
  + ### hasTestedInputs

    private boolean hasTestedInputs
  + ### toOutputItems

    private final [ItemDataList](ItemDataList.html "class in zombie.entity.components.crafting.recipe") toOutputItems
  + ### consumedUsedItems

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> consumedUsedItems
  + ### allViableItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> allViableItems
  + ### allViableResources

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> allViableResources
  + ### luaFunctionMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[CraftRecipe.LuaCall](../../../../scripting/entity/components/crafting/CraftRecipe.LuaCall.html "enum class in zombie.scripting.entity.components.crafting"), [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> luaFunctionMap
  + ### luaOnTestCacheString

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaOnTestCacheString
  + ### luaOnTestCacheObject

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaOnTestCacheObject
  + ### targetVariableInputRatio

    private float targetVariableInputRatio
  + ### calculatedVariableInputRatio

    private float calculatedVariableInputRatio
  + ### variableInputOverfilledItems

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting"), [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")>> variableInputOverfilledItems
  + ### variableInputOverfilledResources

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting"), [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")>>> variableInputOverfilledResources
  + ### eatPercentage

    private int eatPercentage
  + ### elapsedTime

    private double elapsedTime
  + ### modData

    private se.krka.kahlua.vm.KahluaTable modData
* Constructor Details
  -------------------

  + ### CraftRecipeData

    private CraftRecipeData()
  + ### CraftRecipeData

    public CraftRecipeData([CraftMode](../CraftMode.html "enum class in zombie.entity.components.crafting") craftMode,
    boolean allowInputResources,
    boolean allowInputItems,
    boolean allowOutputResources,
    boolean allowOutputItems)
* Method Details
  --------------

  + ### Alloc

    public static [CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") Alloc([CraftMode](../CraftMode.html "enum class in zombie.entity.components.crafting") craftMode,
    boolean allowInputResources,
    boolean allowInputItems,
    boolean allowOutputResources,
    boolean allowOutputItems)
  + ### Release

    public static void Release([CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") data)
  + ### setMonitor

    public void setMonitor([CraftRecipeMonitor](../CraftRecipeMonitor.html "class in zombie.entity.components.crafting") monitor)
  + ### isAllowInputItems

    public boolean isAllowInputItems()
  + ### isAllowOutputItems

    public boolean isAllowOutputItems()
  + ### isAllowInputResources

    public boolean isAllowInputResources()
  + ### isAllowOutputResources

    public boolean isAllowOutputResources()
  + ### getToOutputItems

    public [ItemDataList](ItemDataList.html "class in zombie.entity.components.crafting.recipe") getToOutputItems()
  + ### reset

    public void reset()
  + ### clearRecipe

    private void clearRecipe()
  + ### clearCaches

    private void clearCaches()
  + ### setCharacter

    public void setCharacter([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getCharacter

    public [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") getCharacter()
  + ### setRecipe

    public void setRecipe([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getRecipe

    public [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getRecipe()
  + ### getDataForInputScript

    public [CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") getDataForInputScript([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") script)
  + ### getDataForOutputScript

    protected [CraftRecipeData.OutputScriptData](CraftRecipeData.OutputScriptData.html "class in zombie.entity.components.crafting.recipe") getDataForOutputScript([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") script)
  + ### getFirstManualInputFor

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getFirstManualInputFor([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### canOfferInputItem

    public boolean canOfferInputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### canOfferInputItem

    public boolean canOfferInputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    boolean verbose)
  + ### canOfferInputItem

    public boolean canOfferInputItem([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### canOfferInputItem

    public boolean canOfferInputItem([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean verbose)
  + ### offerAndReplaceInputItem

    public boolean offerAndReplaceInputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### offerAndReplaceInputItem

    public boolean offerAndReplaceInputItem([CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") data,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### offerInputItem

    public boolean offerInputItem([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### offerInputItem

    public boolean offerInputItem([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean verbose)
  + ### containsInputItem

    public boolean containsInputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### containsInputItem

    public boolean containsInputItem([CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") data,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### removeInputItem

    public boolean removeInputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### areAllInputItemsSatisfied

    public boolean areAllInputItemsSatisfied()
  + ### luaCallOnTest

    public boolean luaCallOnTest()
  + ### initLuaFunctions

    private boolean initLuaFunctions()
  + ### luaCallOnStart

    public void luaCallOnStart()
  + ### luaCallOnStart

    public void luaCallOnStart([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### luaCallOnUpdate

    public void luaCallOnUpdate()
  + ### luaCallOnCreate

    public void luaCallOnCreate()
  + ### luaCallOnCreate

    public void luaCallOnCreate([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### luaCallOnFailed

    public void luaCallOnFailed()
  + ### canPerform

    public boolean canPerform([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> overrideInputItems,
    boolean forceTestAll,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### perform

    public boolean perform([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> overrideInputItems,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### addXP

    private void addXP([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### processDestroyAndUsedItems

    public void processDestroyAndUsedItems([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getPossibleCraftCount

    public int getPossibleCraftCount([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> inputItems,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> consumedResources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> consumedItems,
    boolean limitItemsToAppliedItems)
  + ### getInputCraftCount

    private int getInputCraftCount([CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") inputData,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> inputItems,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> consumedItems,
    boolean limitItemsToAppliedItems)
  + ### getResourceCraftCount

    private int getResourceCraftCount([CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") inputData,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> consumedResources,
    boolean limitItemsToAppliedItems)
  + ### canConsumeInputs

    public boolean canConsumeInputs([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> overrideInputItems,
    boolean forceTestAll,
    boolean clearAllViable)
  + ### canConsumeInputs

    public boolean canConsumeInputs([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources)
  + ### consumeInputs

    public boolean consumeInputs([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources)
  + ### consumeOnTickInputs

    public boolean consumeOnTickInputs([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources)
  + ### canCreateOutputs

    public boolean canCreateOutputs([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> outputResources)
  + ### createOutputs

    public boolean createOutputs([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> outputResources)
  + ### canCreateOutputs

    public boolean canCreateOutputs([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> outputResources,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### createOutputs

    public boolean createOutputs([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> outputResources,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### createOnTickOutputs

    public boolean createOnTickOutputs([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> outputResources)
  + ### consumeInputsInternal

    private boolean consumeInputsInternal([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean testOnly,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> overrideInputItems)
  + ### consumeInputsInternal

    private boolean consumeInputsInternal([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean testOnly,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> overrideInputItems,
    boolean forceTestAll,
    boolean clearAllViable)
  + ### createOutputsInternal

    private boolean createOutputsInternal(boolean testOnly,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> outputResources,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### consumeRecipeInputsOnTick

    private boolean consumeRecipeInputsOnTick([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources)
  + ### consumeRecipeInputs

    private boolean consumeRecipeInputs(boolean testOnly,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> inputResources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> overrideInputItems,
    boolean forceTestAll,
    boolean clearAllViable,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### OnTestItem

    public boolean OnTestItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### consumeInputFromItems

    private boolean consumeInputFromItems([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> items,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    boolean clearUsed,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### consumeInputFromResources

    private boolean consumeInputFromResources([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### createRecipeOutputsOnTick

    private boolean createRecipeOutputsOnTick([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> outputResources)
  + ### createRecipeOutputs

    public boolean createRecipeOutputs(boolean testOnly,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> outputResources,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### processKeepInputItem

    private void processKeepInputItem([CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") inputData,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean testOnly,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem)
  + ### createOutputItems

    private boolean createOutputItems([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [ItemDataList](ItemDataList.html "class in zombie.entity.components.crafting.recipe") items,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### collectKeepItems

    private void collectKeepItems([ItemDataList](ItemDataList.html "class in zombie.entity.components.crafting.recipe") items,
    boolean testOnly)
  + ### distributeItemsToResources

    private void distributeItemsToResources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> outputResources,
    [ItemDataList](ItemDataList.html "class in zombie.entity.components.crafting.recipe") items,
    boolean testOnly)
  + ### createOutputToResources

    private boolean createOutputToResources([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public boolean load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    boolean recipeInvalidated)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()
  + ### getModelHandOne

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModelHandOne()
  + ### getModelHandTwo

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModelHandTwo()
  + ### getModel

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModel(boolean isHandOne)
  + ### getAllConsumedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllConsumedItems()
  + ### getAllRecordedConsumedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllRecordedConsumedItems()
  + ### getAllConsumedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllConsumedItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### getAllRecordedConsumedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllRecordedConsumedItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### getAllConsumedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllConsumedItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list,
    boolean includeKeep)
  + ### getAllConsumedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllConsumedItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list,
    boolean includeKeep,
    boolean onlyRecorded)
  + ### getAllKeepInputItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllKeepInputItems()
  + ### getAllKeepInputItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllKeepInputItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### getAllInputItemsWithFlag

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllInputItemsWithFlag([InputFlag](../InputFlag.html "enum class in zombie.entity.components.crafting") flag)
  + ### getAllInputItemsWithFlag

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllInputItemsWithFlag([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") flag)
  + ### getInputItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getInputItems([Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") index)
  + ### getFirstInputItemWithFlag

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getFirstInputItemWithFlag([InputFlag](../InputFlag.html "enum class in zombie.entity.components.crafting") flag)
  + ### getFirstInputItemWithFlag

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getFirstInputItemWithFlag([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") flag)
  + ### getFirstInputItemWithTag

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getFirstInputItemWithTag([ItemTag](../../../../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getAllInputItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllInputItems()
  + ### getAppliedInputItemTypes

    public [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAppliedInputItemTypes([HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> appliedItemTypes)
  + ### getAllDestroyInputItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllDestroyInputItems()
  + ### getAllPutBackInputItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllPutBackInputItems()
  + ### getAllNotKeepInputItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllNotKeepInputItems()
  + ### getFirstCreatedItem

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getFirstCreatedItem()
  + ### getAllCreatedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllCreatedItems()
  + ### getAllCreatedItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllCreatedItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### getFirstInputFluidWithFlag

    public [FluidSample](../../fluids/FluidSample.html "class in zombie.entity.components.fluids") getFirstInputFluidWithFlag([InputFlag](../InputFlag.html "enum class in zombie.entity.components.crafting") flag)
  + ### getFirstInputFluidWithFlag

    public [FluidSample](../../fluids/FluidSample.html "class in zombie.entity.components.fluids") getFirstInputFluidWithFlag([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") flag)
  + ### getAllViableItemsCount

    public int getAllViableItemsCount()
  + ### getViableItem

    public [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") getViableItem(int index)
  + ### getAllViableResourcesCount

    public int getAllViableResourcesCount()
  + ### getViableResource

    public [Resource](../../resources/Resource.html "class in zombie.entity.components.resources") getViableResource(int index)
  + ### destroyAllSurvivingDestroyInputs

    private void destroyAllSurvivingDestroyInputs()
  + ### isVariableAmount

    public boolean isVariableAmount()
  + ### getVariableInputRatio

    public float getVariableInputRatio()
  + ### setTargetVariableInputRatio

    public void setTargetVariableInputRatio(float target)
  + ### clearTargetVariableInputRatio

    public void clearTargetVariableInputRatio()
  + ### addOverfilledResource

    public void addOverfilledResource([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")>> resources)
  + ### getCalculatedVariableInputRatio

    public float getCalculatedVariableInputRatio()
  + ### setCalculatedVariableInputRatio

    public void setCalculatedVariableInputRatio(float value)
  + ### getManualInputsFor

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getManualInputsFor([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### clearManualInputs

    public void clearManualInputs()
  + ### clearManualInputs

    public void clearManualInputs([CraftRecipeData.InputScriptData](CraftRecipeData.InputScriptData.html "class in zombie.entity.components.crafting.recipe") input)
  + ### setManualInputsFor

    public boolean setManualInputsFor([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### populateInputs

    public void populateInputs([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") player,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> inputItems,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    boolean clearExisting)
  + ### setEatPercentage

    public void setEatPercentage(int percentage)
  + ### getEatPercentage

    public int getEatPercentage()
  + ### getElapsedTime

    public double getElapsedTime()
  + ### setElapsedTime

    public void setElapsedTime(double elapsedTime)
  + ### isFinished

    public boolean isFinished()