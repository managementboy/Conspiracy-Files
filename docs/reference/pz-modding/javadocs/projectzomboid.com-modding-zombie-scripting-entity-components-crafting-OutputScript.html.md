[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [OutputScript](OutputScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [\_emptyItems](#_emptyItems)
   2. [type](#type)
   3. [loadedFluid](#loadedFluid)
   4. [loadedEnergy](#loadedEnergy)
   5. [fluid](#fluid)
   6. [energy](#energy)
   7. [amount](#amount)
   8. [maxamount](#maxamount)
   9. [chance](#chance)
   10. [applyOnTick](#applyOnTick)
   11. [shapedIndex](#shapedIndex)
   12. [itemApplyMode](#itemApplyMode)
   13. [fluidMatchMode](#fluidMatchMode)
   14. [originalLine](#originalLine)
   15. [createToItemScript](#createToItemScript)
   16. [flags](#flags)
   17. [outputMapper](#outputMapper)
   18. [possibleFluids](#possibleFluids)
   19. [possiblyEnergies](#possiblyEnergies)
6. [Constructor Details](#constructor-detail)
   1. [OutputScript(CraftRecipe, ResourceType)](#%3Cinit%3E(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.entity.components.resources.ResourceType))
7. [Method Details](#method-detail)
   1. [typeCheck(ResourceType)](#typeCheck(zombie.entity.components.resources.ResourceType))
   2. [isValid()](#isValid())
   3. [hasCreateToItem()](#hasCreateToItem())
   4. [getCreateToItemScript()](#getCreateToItemScript())
   5. [hasFlag(OutputFlag)](#hasFlag(zombie.entity.components.crafting.OutputFlag))
   6. [isReplaceInput()](#isReplaceInput())
   7. [getOriginalLine()](#getOriginalLine())
   8. [getResourceType()](#getResourceType())
   9. [getChance()](#getChance())
   10. [getIntAmount()](#getIntAmount())
   11. [getAmount()](#getAmount())
   12. [getIntMaxAmount()](#getIntMaxAmount())
   13. [getMaxAmount()](#getMaxAmount())
   14. [isVariableAmount()](#isVariableAmount())
   15. [getShapedIndex()](#getShapedIndex())
   16. [isApplyOnTick()](#isApplyOnTick())
   17. [isHandcraftOnly()](#isHandcraftOnly())
   18. [isAutomationOnly()](#isAutomationOnly())
   19. [getPossibleResultItems()](#getPossibleResultItems())
   20. [getPossibleResultFluids()](#getPossibleResultFluids())
   21. [getPossibleResultEnergies()](#getPossibleResultEnergies())
   22. [getOutputMapper()](#getOutputMapper())
   23. [getItem(CraftRecipeData)](#getItem(zombie.entity.components.crafting.recipe.CraftRecipeData))
   24. [getFluid()](#getFluid())
   25. [getEnergy()](#getEnergy())
   26. [getItemApplyMode()](#getItemApplyMode())
   27. [getFluidMatchMode()](#getFluidMatchMode())
   28. [isFluidExact()](#isFluidExact())
   29. [isFluidPrimary()](#isFluidPrimary())
   30. [isFluidAnything()](#isFluidAnything())
   31. [isCreateUses()](#isCreateUses())
   32. [containsItem(Item)](#containsItem(zombie.scripting.objects.Item))
   33. [containsFluid(Fluid)](#containsFluid(zombie.entity.components.fluids.Fluid))
   34. [containsEnergy(Energy)](#containsEnergy(zombie.entity.energy.Energy))
   35. [isFluidMatch(FluidContainer)](#isFluidMatch(zombie.entity.components.fluids.FluidContainer))
   36. [isEnergyMatch(DrainableComboItem)](#isEnergyMatch(zombie.inventory.types.DrainableComboItem))
   37. [isEnergyMatch(Energy)](#isEnergyMatch(zombie.entity.energy.Energy))
   38. [LoadBlock(CraftRecipe, ScriptParser.Block)](#LoadBlock(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.scripting.ScriptParser.Block))
   39. [Load(CraftRecipe, String)](#Load(zombie.scripting.entity.components.crafting.CraftRecipe,java.lang.String))
   40. [Load(CraftRecipe, String, boolean)](#Load(zombie.scripting.entity.components.crafting.CraftRecipe,java.lang.String,boolean))
   41. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   42. [OnPostWorldDictionaryInit()](#OnPostWorldDictionaryInit())
   43. [canOutputItem(InventoryItem)](#canOutputItem(zombie.inventory.InventoryItem))
   44. [canOutputItem(Item)](#canOutputItem(zombie.scripting.objects.Item))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class OutputScript
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.entity.components.crafting.CraftRecipe.IOScript](CraftRecipe.IOScript.html "class in zombie.scripting.entity.components.crafting")

zombie.scripting.entity.components.crafting.OutputScript

---

public class OutputScript
extends [CraftRecipe.IOScript](CraftRecipe.IOScript.html "class in zombie.scripting.entity.components.crafting")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<Item>`

  `_emptyItems`

  `private float`

  `amount`

  `private boolean`

  `applyOnTick`

  `private float`

  `chance`

  `protected OutputScript`

  `createToItemScript`

  `private Energy`

  `energy`

  `private final EnumSet<OutputFlag>`

  `flags`

  `private Fluid`

  `fluid`

  `private FluidMatchMode`

  `fluidMatchMode`

  `private ItemApplyMode`

  `itemApplyMode`

  `private String`

  `loadedEnergy`

  `private String`

  `loadedFluid`

  `private float`

  `maxamount`

  `private String`

  `originalLine`

  `private OutputMapper`

  `outputMapper`

  `private final ArrayList<Fluid>`

  `possibleFluids`

  `private final ArrayList<Energy>`

  `possiblyEnergies`

  `private int`

  `shapedIndex`

  Deprecated.

  `private final ResourceType`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `OutputScript(CraftRecipe parentRecipe,
  ResourceType type)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canOutputItem(InventoryItem item)`

  `boolean`

  `canOutputItem(Item item)`

  `boolean`

  `containsEnergy(Energy energy)`

  `boolean`

  `containsFluid(Fluid fluid)`

  `boolean`

  `containsItem(Item item)`

  `float`

  `getAmount()`

  `float`

  `getChance()`

  `OutputScript`

  `getCreateToItemScript()`

  `Energy`

  `getEnergy()`

  `Fluid`

  `getFluid()`

  `FluidMatchMode`

  `getFluidMatchMode()`

  `int`

  `getIntAmount()`

  `int`

  `getIntMaxAmount()`

  `Item`

  `getItem(CraftRecipeData recipeData)`

  `ItemApplyMode`

  `getItemApplyMode()`

  `float`

  `getMaxAmount()`

  `String`

  `getOriginalLine()`

  `OutputMapper`

  `getOutputMapper()`

  `ArrayList<Energy>`

  `getPossibleResultEnergies()`

  `ArrayList<Fluid>`

  `getPossibleResultFluids()`

  `ArrayList<Item>`

  `getPossibleResultItems()`

  `ResourceType`

  `getResourceType()`

  `int`

  `getShapedIndex()`

  Deprecated.

  `boolean`

  `hasCreateToItem()`

  `boolean`

  `hasFlag(OutputFlag flag)`

  `boolean`

  `isApplyOnTick()`

  `boolean`

  `isAutomationOnly()`

  `boolean`

  `isCreateUses()`

  Deprecated.

  `boolean`

  `isEnergyMatch(Energy energy)`

  `boolean`

  `isEnergyMatch(DrainableComboItem item)`

  `boolean`

  `isFluidAnything()`

  `boolean`

  `isFluidExact()`

  `boolean`

  `isFluidMatch(FluidContainer container)`

  `boolean`

  `isFluidPrimary()`

  `boolean`

  `isHandcraftOnly()`

  `boolean`

  `isReplaceInput()`

  Deprecated.

  `protected boolean`

  `isValid()`

  `boolean`

  `isVariableAmount()`

  `protected static OutputScript`

  `Load(CraftRecipe parentRecipe,
  String line)`

  `protected static OutputScript`

  `Load(CraftRecipe parentRecipe,
  String line,
  boolean isInternal)`

  `protected static OutputScript`

  `LoadBlock(CraftRecipe parentRecipe,
  zombie.scripting.ScriptParser.Block block)`

  `protected void`

  `OnPostWorldDictionaryInit()`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `private boolean`

  `typeCheck(ResourceType type)`

  ### Methods inherited from class [CraftRecipe.IOScript](CraftRecipe.IOScript.html#method-summary "class in zombie.scripting.entity.components.crafting")

  `getParentRecipe, getRecipeLineIndex`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### \_emptyItems

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](../../../objects/Item.html "class in zombie.scripting.objects")> \_emptyItems
  + ### type

    private final [ResourceType](../../../../entity/components/resources/ResourceType.html "enum class in zombie.entity.components.resources") type
  + ### loadedFluid

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") loadedFluid
  + ### loadedEnergy

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") loadedEnergy
  + ### fluid

    private [Fluid](../../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids") fluid
  + ### energy

    private [Energy](../../../../entity/energy/Energy.html "class in zombie.entity.energy") energy
  + ### amount

    private float amount
  + ### maxamount

    private float maxamount
  + ### chance

    private float chance
  + ### applyOnTick

    private boolean applyOnTick
  + ### shapedIndex

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    private int shapedIndex

    Deprecated.
  + ### itemApplyMode

    private [ItemApplyMode](../../../../entity/components/crafting/ItemApplyMode.html "enum class in zombie.entity.components.crafting") itemApplyMode
  + ### fluidMatchMode

    private [FluidMatchMode](../../../../entity/components/crafting/FluidMatchMode.html "enum class in zombie.entity.components.crafting") fluidMatchMode
  + ### originalLine

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalLine
  + ### createToItemScript

    protected [OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting") createToItemScript
  + ### flags

    private final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[OutputFlag](../../../../entity/components/crafting/OutputFlag.html "enum class in zombie.entity.components.crafting")> flags
  + ### outputMapper

    private [OutputMapper](../../../../entity/components/crafting/recipe/OutputMapper.html "class in zombie.entity.components.crafting.recipe") outputMapper
  + ### possibleFluids

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Fluid](../../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids")> possibleFluids
  + ### possiblyEnergies

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Energy](../../../../entity/energy/Energy.html "class in zombie.entity.energy")> possiblyEnergies
* Constructor Details
  -------------------

  + ### OutputScript

    private OutputScript([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe,
    [ResourceType](../../../../entity/components/resources/ResourceType.html "enum class in zombie.entity.components.resources") type)
* Method Details
  --------------

  + ### typeCheck

    private boolean typeCheck([ResourceType](../../../../entity/components/resources/ResourceType.html "enum class in zombie.entity.components.resources") type)
  + ### isValid

    protected boolean isValid()
  + ### hasCreateToItem

    public boolean hasCreateToItem()
  + ### getCreateToItemScript

    public [OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting") getCreateToItemScript()
  + ### hasFlag

    public boolean hasFlag([OutputFlag](../../../../entity/components/crafting/OutputFlag.html "enum class in zombie.entity.components.crafting") flag)
  + ### isReplaceInput

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isReplaceInput()

    Deprecated.
  + ### getOriginalLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOriginalLine()
  + ### getResourceType

    public [ResourceType](../../../../entity/components/resources/ResourceType.html "enum class in zombie.entity.components.resources") getResourceType()
  + ### getChance

    public float getChance()
  + ### getIntAmount

    public int getIntAmount()
  + ### getAmount

    public float getAmount()
  + ### getIntMaxAmount

    public int getIntMaxAmount()
  + ### getMaxAmount

    public float getMaxAmount()
  + ### isVariableAmount

    public boolean isVariableAmount()
  + ### getShapedIndex

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public int getShapedIndex()

    Deprecated.
  + ### isApplyOnTick

    public boolean isApplyOnTick()
  + ### isHandcraftOnly

    public boolean isHandcraftOnly()
  + ### isAutomationOnly

    public boolean isAutomationOnly()
  + ### getPossibleResultItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](../../../objects/Item.html "class in zombie.scripting.objects")> getPossibleResultItems()
  + ### getPossibleResultFluids

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Fluid](../../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids")> getPossibleResultFluids()
  + ### getPossibleResultEnergies

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Energy](../../../../entity/energy/Energy.html "class in zombie.entity.energy")> getPossibleResultEnergies()
  + ### getOutputMapper

    public [OutputMapper](../../../../entity/components/crafting/recipe/OutputMapper.html "class in zombie.entity.components.crafting.recipe") getOutputMapper()
  + ### getItem

    public [Item](../../../objects/Item.html "class in zombie.scripting.objects") getItem([CraftRecipeData](../../../../entity/components/crafting/recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeData)
  + ### getFluid

    public [Fluid](../../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids") getFluid()
  + ### getEnergy

    public [Energy](../../../../entity/energy/Energy.html "class in zombie.entity.energy") getEnergy()
  + ### getItemApplyMode

    public [ItemApplyMode](../../../../entity/components/crafting/ItemApplyMode.html "enum class in zombie.entity.components.crafting") getItemApplyMode()
  + ### getFluidMatchMode

    public [FluidMatchMode](../../../../entity/components/crafting/FluidMatchMode.html "enum class in zombie.entity.components.crafting") getFluidMatchMode()
  + ### isFluidExact

    public boolean isFluidExact()
  + ### isFluidPrimary

    public boolean isFluidPrimary()
  + ### isFluidAnything

    public boolean isFluidAnything()
  + ### isCreateUses

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isCreateUses()

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

    protected static [OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting") LoadBlock([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe,
    zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Load

    protected static [OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting") Load([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Load

    protected static [OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting") Load([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") parentRecipe,
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
  + ### canOutputItem

    public boolean canOutputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### canOutputItem

    public boolean canOutputItem([Item](../../../objects/Item.html "class in zombie.scripting.objects") item)