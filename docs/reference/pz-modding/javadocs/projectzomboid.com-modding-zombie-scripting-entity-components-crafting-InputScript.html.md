[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [InputScript](InputScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [loadedItems](#loadedItems)
   2. [loadedFluids](#loadedFluids)
   3. [loadedEnergies](#loadedEnergies)
   4. [items](#items)
   5. [itemTags](#itemTags)
   6. [categories](#categories)
   7. [fluidFilter](#fluidFilter)
   8. [filteredFluidCache](#filteredFluidCache)
   9. [energies](#energies)
   10. [acceptsAnyItem](#acceptsAnyItem)
   11. [acceptsAnyFluid](#acceptsAnyFluid)
   12. [acceptsAnyEnergy](#acceptsAnyEnergy)
   13. [type](#type)
   14. [itemScriptCache](#itemScriptCache)
   15. [itemApplyMode](#itemApplyMode)
   16. [fluidMatchMode](#fluidMatchMode)
   17. [amount](#amount)
   18. [maxamount](#maxamount)
   19. [amounts](#amounts)
   20. [maxamounts](#maxamounts)
   21. [applyOnTick](#applyOnTick)
   22. [shapedIndex](#shapedIndex)
   23. [originalLine](#originalLine)
   24. [createToItemScript](#createToItemScript)
   25. [consumeFromItemScript](#consumeFromItemScript)
   26. [parentScript](#parentScript)
   27. [flags](#flags)
6. [Constructor Details](#constructor-detail)
   1. [InputScript(CraftRecipe, ResourceType)](#%3Cinit%3E(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.entity.components.resources.ResourceType))
7. [Method Details](#method-detail)
   1. [typeCheck(ResourceType)](#typeCheck(zombie.entity.components.resources.ResourceType))
   2. [isValid()](#isValid())
   3. [getPossibleInputItems()](#getPossibleInputItems())
   4. [hasPossibleFrozenFoodInputItems()](#hasPossibleFrozenFoodInputItems())
   5. [getPossibleInputFluids()](#getPossibleInputFluids())
   6. [getInputFluidFilterDisplayName()](#getInputFluidFilterDisplayName())
   7. [getInputFluidFilterTooltip()](#getInputFluidFilterTooltip())
   8. [getPossibleInputEnergies()](#getPossibleInputEnergies())
   9. [hasCreateToItem()](#hasCreateToItem())
   10. [getCreateToItemScript()](#getCreateToItemScript())
   11. [hasConsumeFromItem()](#hasConsumeFromItem())
   12. [getConsumeFromItemScript()](#getConsumeFromItemScript())
   13. [hasParentScript()](#hasParentScript())
   14. [getParentScript()](#getParentScript())
   15. [hasFlag(InputFlag)](#hasFlag(zombie.entity.components.crafting.InputFlag))
   16. [getOriginalLine()](#getOriginalLine())
   17. [getResourceType()](#getResourceType())
   18. [isUsesPartialItem(Item)](#isUsesPartialItem(zombie.scripting.objects.Item))
   19. [isExclusive()](#isExclusive())
   20. [isItemCount()](#isItemCount())
   21. [isDestroy()](#isDestroy())
   22. [isKeep()](#isKeep())
   23. [isTool()](#isTool())
   24. [isToolLeft()](#isToolLeft())
   25. [isToolRight()](#isToolRight())
   26. [isWorn()](#isWorn())
   27. [isNotWorn()](#isNotWorn())
   28. [isFull()](#isFull())
   29. [isEmpty()](#isEmpty())
   30. [notFull()](#notFull())
   31. [notEmpty()](#notEmpty())
   32. [isDamaged()](#isDamaged())
   33. [isUndamaged()](#isUndamaged())
   34. [allowFrozenItem()](#allowFrozenItem())
   35. [dontAllowFrozenItem()](#dontAllowFrozenItem())
   36. [allowRottenItem()](#allowRottenItem())
   37. [allowDestroyedItem()](#allowDestroyedItem())
   38. [isEmptyContainer()](#isEmptyContainer())
   39. [isWholeFoodItem()](#isWholeFoodItem())
   40. [isUncookedFoodItem()](#isUncookedFoodItem())
   41. [isCookedFoodItem()](#isCookedFoodItem())
   42. [isHeadPart()](#isHeadPart())
   43. [isSharpenable()](#isSharpenable())
   44. [dontPutBack()](#dontPutBack())
   45. [inheritColor()](#inheritColor())
   46. [inheritCondition()](#inheritCondition())
   47. [inheritHeadCondition()](#inheritHeadCondition())
   48. [inheritSharpness()](#inheritSharpness())
   49. [inheritUses()](#inheritUses())
   50. [isNotDull()](#isNotDull())
   51. [mayDegrade()](#mayDegrade())
   52. [mayDegradeLight()](#mayDegradeLight())
   53. [mayDegradeVeryLight()](#mayDegradeVeryLight())
   54. [mayDegradeHeavy()](#mayDegradeHeavy())
   55. [sharpnessCheck()](#sharpnessCheck())
   56. [getShapedIndex()](#getShapedIndex())
   57. [getItemApplyMode()](#getItemApplyMode())
   58. [getFluidMatchMode()](#getFluidMatchMode())
   59. [isFluidExact()](#isFluidExact())
   60. [isFluidPrimary()](#isFluidPrimary())
   61. [isFluidMixture()](#isFluidMixture())
   62. [isFluidAnything()](#isFluidAnything())
   63. [isVariableAmount()](#isVariableAmount())
   64. [getIntAmount()](#getIntAmount())
   65. [getAmount()](#getAmount())
   66. [getIntMaxAmount()](#getIntMaxAmount())
   67. [getMaxAmount()](#getMaxAmount())
   68. [getIntAmount(int)](#getIntAmount(int))
   69. [getAmount(int)](#getAmount(int))
   70. [getIntMaxAmount(int)](#getIntMaxAmount(int))
   71. [getMaxAmount(int)](#getMaxAmount(int))
   72. [getIntAmount(String)](#getIntAmount(java.lang.String))
   73. [getAmount(String)](#getAmount(java.lang.String))
   74. [getIntMaxAmount(String)](#getIntMaxAmount(java.lang.String))
   75. [getMaxAmount(String)](#getMaxAmount(java.lang.String))
   76. [getRelativeScale(String)](#getRelativeScale(java.lang.String))
   77. [isProp1()](#isProp1())
   78. [isProp2()](#isProp2())
   79. [isApplyOnTick()](#isApplyOnTick())
   80. [isAcceptsAnyItem()](#isAcceptsAnyItem())
   81. [isAcceptsAnyFluid()](#isAcceptsAnyFluid())
   82. [isAcceptsAnyEnergy()](#isAcceptsAnyEnergy())
   83. [isHandcraftOnly()](#isHandcraftOnly())
   84. [isAutomationOnly()](#isAutomationOnly())
   85. [isReplace()](#isReplace())
   86. [getReplaceOutputScript()](#getReplaceOutputScript())
   87. [containsItem(Item)](#containsItem(zombie.scripting.objects.Item))
   88. [containsFluid(Fluid)](#containsFluid(zombie.entity.components.fluids.Fluid))
   89. [containsEnergy(Energy)](#containsEnergy(zombie.entity.energy.Energy))
   90. [isFluidMatch(FluidContainer)](#isFluidMatch(zombie.entity.components.fluids.FluidContainer))
   91. [isEnergyMatch(DrainableComboItem)](#isEnergyMatch(zombie.inventory.types.DrainableComboItem))
   92. [isEnergyMatch(Energy)](#isEnergyMatch(zombie.entity.energy.Energy))
   93. [LoadBlock(CraftRecipe, ScriptParser.Block)](#LoadBlock(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.scripting.ScriptParser.Block))
   94. [Load(CraftRecipe, String)](#Load(zombie.scripting.entity.components.crafting.CraftRecipe,java.lang.String))
   95. [Load(CraftRecipe, String, boolean)](#Load(zombie.scripting.entity.components.crafting.CraftRecipe,java.lang.String,boolean))
   96. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   97. [OnPostWorldDictionaryInit()](#OnPostWorldDictionaryInit())
   98. [canUseItem(InventoryItem, IsoGameCharacter)](#canUseItem(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   99. [canUseItem(String)](#canUseItem(java.lang.String))
   100. [allowFavorites()](#allowFavorites())
   101. [passesFavoriteTest(InventoryItem)](#passesFavoriteTest(zombie.inventory.InventoryItem))
   102. [passesRottenTest(InventoryItem)](#passesRottenTest(zombie.inventory.InventoryItem))
   103. [passesFrozenTest(InventoryItem)](#passesFrozenTest(zombie.inventory.InventoryItem))
   104. [passesBrokenTest(InventoryItem)](#passesBrokenTest(zombie.inventory.InventoryItem))
   105. [passesSealedTest(InventoryItem)](#passesSealedTest(zombie.inventory.InventoryItem))
   106. [doesItemPassRoutineStatusTests(InventoryItem, IsoGameCharacter)](#doesItemPassRoutineStatusTests(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   107. [doesItemPassClothingTypeStatusTests(InventoryItem)](#doesItemPassClothingTypeStatusTests(zombie.inventory.InventoryItem))
   108. [doesItemPassSharpnessStatusTests(InventoryItem)](#doesItemPassSharpnessStatusTests(zombie.inventory.InventoryItem))
   109. [doesItemPassDamageStatusTests(InventoryItem)](#doesItemPassDamageStatusTests(zombie.inventory.InventoryItem))
   110. [doesItemPassIsOrNotEmptyAndFullTests(InventoryItem)](#doesItemPassIsOrNotEmptyAndFullTests(zombie.inventory.InventoryItem))
   111. [doesItemPassFoodAndCookingTests(InventoryItem)](#doesItemPassFoodAndCookingTests(zombie.inventory.InventoryItem))
   112. [isCanBeDoneFromFloor()](#isCanBeDoneFromFloor())
   113. [isRecordInput()](#isRecordInput())
   114. [getItemTags()](#getItemTags())
   115. [getItems()](#getItems())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class InputScript
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.entity.components.crafting.CraftRecipe.IOScript](CraftRecipe.IOScript.html "class in zombie.scripting.entity.components.crafting")

zombie.scripting.entity.components.crafting.InputScript

---

public class InputScript
extends [CraftRecipe.IOScript](CraftRecipe.IOScript.html "class in zombie.scripting.entity.components.crafting")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `acceptsAnyEnergy`

  `private boolean`

  `acceptsAnyFluid`

  `private boolean`

  `acceptsAnyItem`

  `private float`

  `amount`

  `private final ArrayList<Float>`

  `amounts`

  `private boolean`

  `applyOnTick`

  `private final ArrayList<String>`

  `categories`

  `protected InputScript`

  `consumeFromItemScript`

  `protected OutputScript`

  `createToItemScript`

  `private final ArrayList<Energy>`

  `energies`

  `private final ArrayList<Fluid>`

  `filteredFluidCache`

  `private final EnumSet<InputFlag>`

  `flags`

  `private final FluidFilter`

  `fluidFilter`

  `private FluidMatchMode`

  `fluidMatchMode`

  `private ItemApplyMode`

  `itemApplyMode`

  `private final ArrayList<String>`

  `items`

  `private List<Item>`

  `itemScriptCache`

  `private final Set<ItemTag>`

  `itemTags`

  `private final ArrayList<String>`

  `loadedEnergies`

  `private final ArrayList<String>`

  `loadedFluids`

  `private final ArrayList<String>`

  `loadedItems`

  `private float`

  `maxamount`

  `private final ArrayList<Float>`

  `maxamounts`

  `private String`

  `originalLine`

  `protected InputScript`

  `parentScript`

  `private int`

  `shapedIndex`

  `private final ResourceType`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `InputScript(CraftRecipe parentRecipe,
  ResourceType type)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `allowDestroyedItem()`

  `boolean`

  `allowFavorites()`

  `boolean`

  `allowFrozenItem()`

  `boolean`

  `allowRottenItem()`

  `boolean`

  `canUseItem(String item)`

  `boolean`

  `canUseItem(InventoryItem item,
  IsoGameCharacter character)`

  `boolean`

  `containsEnergy(Energy energy)`

  `boolean`

  `containsFluid(Fluid fluid)`

  `boolean`

  `containsItem(Item item)`

  `boolean`

  `doesItemPassClothingTypeStatusTests(InventoryItem item)`

  `boolean`

  `doesItemPassDamageStatusTests(InventoryItem item)`

  `boolean`

  `doesItemPassFoodAndCookingTests(InventoryItem item)`

  `boolean`

  `doesItemPassIsOrNotEmptyAndFullTests(InventoryItem item)`

  `boolean`

  `doesItemPassRoutineStatusTests(InventoryItem item,
  IsoGameCharacter character)`

  `boolean`

  `doesItemPassSharpnessStatusTests(InventoryItem item)`

  `boolean`

  `dontAllowFrozenItem()`

  `boolean`

  `dontPutBack()`

  `float`

  `getAmount()`

  `float`

  `getAmount(int idx)`

  `float`

  `getAmount(String item)`

  `InputScript`

  `getConsumeFromItemScript()`

  `OutputScript`

  `getCreateToItemScript()`

  `FluidMatchMode`

  `getFluidMatchMode()`

  `String`

  `getInputFluidFilterDisplayName()`

  `String`

  `getInputFluidFilterTooltip()`

  `int`

  `getIntAmount()`

  `int`

  `getIntAmount(int idx)`

  `int`

  `getIntAmount(String item)`

  `int`

  `getIntMaxAmount()`

  `int`

  `getIntMaxAmount(int idx)`

  `int`

  `getIntMaxAmount(String item)`

  `ItemApplyMode`

  `getItemApplyMode()`

  `List<String>`

  `getItems()`

  `Set<ItemTag>`

  `getItemTags()`

  `float`

  `getMaxAmount()`

  `float`

  `getMaxAmount(int idx)`

  `float`

  `getMaxAmount(String item)`

  `String`

  `getOriginalLine()`

  `InputScript`

  `getParentScript()`

  `ArrayList<Energy>`

  `getPossibleInputEnergies()`

  `ArrayList<Fluid>`

  `getPossibleInputFluids()`

  `List<Item>`

  `getPossibleInputItems()`

  `float`

  `getRelativeScale(String item)`

  `OutputScript`

  `getReplaceOutputScript()`

  Deprecated.

  `ResourceType`

  `getResourceType()`

  `int`

  `getShapedIndex()`

  Deprecated.

  `boolean`

  `hasConsumeFromItem()`

  `boolean`

  `hasCreateToItem()`

  `boolean`

  `hasFlag(InputFlag flag)`

  `boolean`

  `hasParentScript()`

  `boolean`

  `hasPossibleFrozenFoodInputItems()`

  `boolean`

  `inheritColor()`

  `boolean`

  `inheritCondition()`

  `boolean`

  `inheritHeadCondition()`

  `boolean`

  `inheritSharpness()`

  `boolean`

  `inheritUses()`

  `boolean`

  `isAcceptsAnyEnergy()`

  `boolean`

  `isAcceptsAnyFluid()`

  `boolean`

  `isAcceptsAnyItem()`

  `boolean`

  `isApplyOnTick()`

  `boolean`

  `isAutomationOnly()`

  `boolean`

  `isCanBeDoneFromFloor()`

  `boolean`

  `isCookedFoodItem()`

  `boolean`

  `isDamaged()`

  `boolean`

  `isDestroy()`

  `boolean`

  `isEmpty()`

  `boolean`

  `isEmptyContainer()`

  `boolean`

  `isEnergyMatch(Energy energy)`

  `boolean`

  `isEnergyMatch(DrainableComboItem item)`

  `boolean`

  `isExclusive()`

  `boolean`

  `isFluidAnything()`

  `boolean`

  `isFluidExact()`

  `boolean`

  `isFluidMatch(FluidContainer container)`

  `boolean`

  `isFluidMixture()`

  `boolean`

  `isFluidPrimary()`

  `boolean`

  `isFull()`

  `boolean`

  `isHandcraftOnly()`

  `boolean`

  `isHeadPart()`

  `boolean`

  `isItemCount()`

  `boolean`

  `isKeep()`

  `boolean`

  `isNotDull()`

  `boolean`

  `isNotWorn()`

  `boolean`

  `isProp1()`

  `boolean`

  `isProp2()`

  `boolean`

  `isRecordInput()`

  `boolean`

  `isReplace()`

  Deprecated.

  `boolean`

  `isSharpenable()`

  `boolean`

  `isTool()`

  `boolean`

  `isToolLeft()`

  `boolean`

  `isToolRight()`

  `boolean`

  `isUncookedFoodItem()`

  `boolean`

  `isUndamaged()`

  `boolean`

  `isUsesPartialItem(Item item)`

  `protected boolean`

  `isValid()`

  `boolean`

  `isVariableAmount()`

  `boolean`

  `isWholeFoodItem()`

  `boolean`

  `isWorn()`

  `protected static InputScript`

  `Load(CraftRecipe parentRecipe,
  String line)`

  `protected static InputScript`

  `Load(CraftRecipe parentRecipe,
  String line,
  boolean isInternal)`

  `protected static InputScript`

  `LoadBlock(CraftRecipe parentRecipe,
  zombie.scripting.ScriptParser.Block block)`

  `boolean`

  `mayDegrade()`

  `boolean`

  `mayDegradeHeavy()`

  `boolean`

  `mayDegradeLight()`

  `boolean`

  `mayDegradeVeryLight()`

  `boolean`

  `notEmpty()`

  `boolean`

  `notFull()`

  `protected void`

  `OnPostWorldDictionaryInit()`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `boolean`

  `passesBrokenTest(InventoryItem item)`

  `boolean`

  `passesFavoriteTest(InventoryItem item)`

  `boolean`

  `passesFrozenTest(InventoryItem item)`

  `boolean`

  `passesRottenTest(InventoryItem item)`

  `boolean`

  `passesSealedTest(InventoryItem item)`

  `boolean`

  `sharpnessCheck()`

  `private boolean`

  `typeCheck(ResourceType type)`

  ### Methods inherited from class [CraftRecipe.IOScript](CraftRecipe.IOScript.html#method-summary "class in zombie.scripting.entity.components.crafting")

  `getParentRecipe, getRecipeLineIndex`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### loadedItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadedItems
  + ### loadedFluids

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadedFluids
  + ### loadedEnergies

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadedEnergies
  + ### items

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> items
  + ### itemTags

    private final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[ItemTag](../../../objects/ItemTag.html "class in zombie.scripting.objects")> itemTags
  + ### categories

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> categories
  + ### fluidFilter

    private final [FluidFilter](../../../../entity/components/fluids/FluidFilter.html "class in zombie.entity.components.fluids") fluidFilter
  + ### filteredFluidCache

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Fluid](../../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids")> filteredFluidCache
  + ### energies

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Energy](../../../../entity/energy/Energy.html "class in zombie.entity.energy")> energies
  + ### acceptsAnyItem

    private boolean acceptsAnyItem
  + ### acceptsAnyFluid

    private boolean acceptsAnyFluid
  + ### acceptsAnyEnergy

    private boolean acceptsAnyEnergy
  + ### type

    private final [ResourceType](../../../../entity/components/resources/ResourceType.html "enum class in zombie.entity.components.resources") type
  + ### itemScriptCache

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Item](../../../objects/Item.html "class in zombie.scripting.objects")> itemScriptCache
  + ### itemApplyMode

    private [ItemApplyMode](../../../../entity/components/crafting/ItemApplyMode.html "enum class in zombie.entity.components.crafting") itemApplyMode
  + ### fluidMatchMode

    private [FluidMatchMode](../../../../entity/components/crafting/FluidMatchMode.html "enum class in zombie.entity.components.crafting") fluidMatchMode
  + ### amount

    private float amount
  + ### maxamount

    private float maxamount
  + ### amounts

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> amounts
  + ### maxamounts

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> maxamounts
  + ### applyOnTick

    private boolean applyOnTick
  + ### shapedIndex

    private int shapedIndex
  + ### originalLine

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalLine
  + ### createToItemScript

    protected [OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting") createToItemScript
  + ### consumeFromItemScript

    protected [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") consumeFromItemScript
  + ### parentScript

    protected [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") parentScript
  + ### flags

    private final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[InputFlag](../../../../entity/components/crafting/InputFlag.html "enum class in zombie.entity.components.crafting")> flags
* Constructor Details
  -------------------

  + ### InputScript

    private InputScript([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe,
    [ResourceType](../../../../entity/components/resources/ResourceType.html "enum class in zombie.entity.components.resources") type)
* Method Details
  --------------

  + ### typeCheck

    private boolean typeCheck([ResourceType](../../../../entity/components/resources/ResourceType.html "enum class in zombie.entity.components.resources") type)
  + ### isValid

    protected boolean isValid()
  + ### getPossibleInputItems

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Item](../../../objects/Item.html "class in zombie.scripting.objects")> getPossibleInputItems()
  + ### hasPossibleFrozenFoodInputItems

    public boolean hasPossibleFrozenFoodInputItems()
  + ### getPossibleInputFluids

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Fluid](../../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids")> getPossibleInputFluids()
  + ### getInputFluidFilterDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInputFluidFilterDisplayName()
  + ### getInputFluidFilterTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInputFluidFilterTooltip()
  + ### getPossibleInputEnergies

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Energy](../../../../entity/energy/Energy.html "class in zombie.entity.energy")> getPossibleInputEnergies()
  + ### hasCreateToItem

    public boolean hasCreateToItem()
  + ### getCreateToItemScript

    public [OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting") getCreateToItemScript()
  + ### hasConsumeFromItem

    public boolean hasConsumeFromItem()
  + ### getConsumeFromItemScript

    public [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") getConsumeFromItemScript()
  + ### hasParentScript

    public boolean hasParentScript()
  + ### getParentScript

    public [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") getParentScript()
  + ### hasFlag

    public boolean hasFlag([InputFlag](../../../../entity/components/crafting/InputFlag.html "enum class in zombie.entity.components.crafting") flag)
  + ### getOriginalLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOriginalLine()
  + ### getResourceType

    public [ResourceType](../../../../entity/components/resources/ResourceType.html "enum class in zombie.entity.components.resources") getResourceType()
  + ### isUsesPartialItem

    public boolean isUsesPartialItem([Item](../../../objects/Item.html "class in zombie.scripting.objects") item)
  + ### isExclusive

    public boolean isExclusive()
  + ### isItemCount

    public boolean isItemCount()
  + ### isDestroy

    public boolean isDestroy()
  + ### isKeep

    public boolean isKeep()
  + ### isTool

    public boolean isTool()
  + ### isToolLeft

    public boolean isToolLeft()
  + ### isToolRight

    public boolean isToolRight()
  + ### isWorn

    public boolean isWorn()
  + ### isNotWorn

    public boolean isNotWorn()
  + ### isFull

    public boolean isFull()
  + ### isEmpty

    public boolean isEmpty()
  + ### notFull

    public boolean notFull()
  + ### notEmpty

    public boolean notEmpty()
  + ### isDamaged

    public boolean isDamaged()
  + ### isUndamaged

    public boolean isUndamaged()
  + ### allowFrozenItem

    public boolean allowFrozenItem()
  + ### dontAllowFrozenItem

    public boolean dontAllowFrozenItem()
  + ### allowRottenItem

    public boolean allowRottenItem()
  + ### allowDestroyedItem

    public boolean allowDestroyedItem()
  + ### isEmptyContainer

    public boolean isEmptyContainer()
  + ### isWholeFoodItem

    public boolean isWholeFoodItem()
  + ### isUncookedFoodItem

    public boolean isUncookedFoodItem()
  + ### isCookedFoodItem

    public boolean isCookedFoodItem()
  + ### isHeadPart

    public boolean isHeadPart()
  + ### isSharpenable

    public boolean isSharpenable()
  + ### dontPutBack

    public boolean dontPutBack()
  + ### inheritColor

    public boolean inheritColor()
  + ### inheritCondition

    public boolean inheritCondition()
  + ### inheritHeadCondition

    public boolean inheritHeadCondition()
  + ### inheritSharpness

    public boolean inheritSharpness()
  + ### inheritUses

    public boolean inheritUses()
  + ### isNotDull

    public boolean isNotDull()
  + ### mayDegrade

    public boolean mayDegrade()
  + ### mayDegradeLight

    public boolean mayDegradeLight()
  + ### mayDegradeVeryLight

    public boolean mayDegradeVeryLight()
  + ### mayDegradeHeavy

    public boolean mayDegradeHeavy()
  + ### sharpnessCheck

    public boolean sharpnessCheck()
  + ### getShapedIndex

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public int getShapedIndex()

    Deprecated.
  + ### getItemApplyMode

    public [ItemApplyMode](../../../../entity/components/crafting/ItemApplyMode.html "enum class in zombie.entity.components.crafting") getItemApplyMode()
  + ### getFluidMatchMode

    public [FluidMatchMode](../../../../entity/components/crafting/FluidMatchMode.html "enum class in zombie.entity.components.crafting") getFluidMatchMode()
  + ### isFluidExact

    public boolean isFluidExact()
  + ### isFluidPrimary

    public boolean isFluidPrimary()
  + ### isFluidMixture

    public boolean isFluidMixture()
  + ### isFluidAnything

    public boolean isFluidAnything()
  + ### isVariableAmount

    public boolean isVariableAmount()
  + ### getIntAmount

    public int getIntAmount()
  + ### getAmount

    public float getAmount()
  + ### getIntMaxAmount

    public int getIntMaxAmount()
  + ### getMaxAmount

    public float getMaxAmount()
  + ### getIntAmount

    public int getIntAmount(int idx)
  + ### getAmount

    public float getAmount(int idx)
  + ### getIntMaxAmount

    public int getIntMaxAmount(int idx)
  + ### getMaxAmount

    public float getMaxAmount(int idx)
  + ### getIntAmount

    public int getIntAmount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### getAmount

    public float getAmount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### getIntMaxAmount

    public int getIntMaxAmount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### getMaxAmount

    public float getMaxAmount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### getRelativeScale

    public float getRelativeScale([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### isProp1

    public boolean isProp1()
  + ### isProp2

    public boolean isProp2()
  + ### isApplyOnTick

    public boolean isApplyOnTick()
  + ### isAcceptsAnyItem

    public boolean isAcceptsAnyItem()
  + ### isAcceptsAnyFluid

    public boolean isAcceptsAnyFluid()
  + ### isAcceptsAnyEnergy

    public boolean isAcceptsAnyEnergy()
  + ### isHandcraftOnly

    public boolean isHandcraftOnly()
  + ### isAutomationOnly

    public boolean isAutomationOnly()
  + ### isReplace

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isReplace()

    Deprecated.
  + ### getReplaceOutputScript

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting") getReplaceOutputScript()

    Deprecated.
  + ### containsItem

    public boolean containsItem([Item](../../../objects/Item.html "class in zombie.scripting.objects") item)
  + ### containsFluid

    public boolean containsFluid([Fluid](../../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### containsEnergy

    public boolean containsEnergy([Energy](../../../../entity/energy/Energy.html "class in zombie.entity.energy") energy)
  + ### isFluidMatch

    public boolean isFluidMatch([FluidContainer](../../../../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") container)
  + ### isEnergyMatch

    public boolean isEnergyMatch([DrainableComboItem](../../../../inventory/types/DrainableComboItem.html "class in zombie.inventory.types") item)
  + ### isEnergyMatch

    public boolean isEnergyMatch([Energy](../../../../entity/energy/Energy.html "class in zombie.entity.energy") energy)
  + ### LoadBlock

    protected static [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") LoadBlock([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe,
    zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Load

    protected static [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") Load([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Load

    protected static [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") Load([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    boolean isInternal)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### OnScriptsLoaded

    public void OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### OnPostWorldDictionaryInit

    protected void OnPostWorldDictionaryInit()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### canUseItem

    public boolean canUseItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### canUseItem

    public boolean canUseItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### allowFavorites

    public boolean allowFavorites()
  + ### passesFavoriteTest

    public boolean passesFavoriteTest([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### passesRottenTest

    public boolean passesRottenTest([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### passesFrozenTest

    public boolean passesFrozenTest([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### passesBrokenTest

    public boolean passesBrokenTest([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### passesSealedTest

    public boolean passesSealedTest([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### doesItemPassRoutineStatusTests

    public boolean doesItemPassRoutineStatusTests([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### doesItemPassClothingTypeStatusTests

    public boolean doesItemPassClothingTypeStatusTests([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### doesItemPassSharpnessStatusTests

    public boolean doesItemPassSharpnessStatusTests([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### doesItemPassDamageStatusTests

    public boolean doesItemPassDamageStatusTests([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### doesItemPassIsOrNotEmptyAndFullTests

    public boolean doesItemPassIsOrNotEmptyAndFullTests([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### doesItemPassFoodAndCookingTests

    public boolean doesItemPassFoodAndCookingTests([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isCanBeDoneFromFloor

    public boolean isCanBeDoneFromFloor()
  + ### isRecordInput

    public boolean isRecordInput()
  + ### getItemTags

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[ItemTag](../../../objects/ItemTag.html "class in zombie.scripting.objects")> getItemTags()
  + ### getItems

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getItems()