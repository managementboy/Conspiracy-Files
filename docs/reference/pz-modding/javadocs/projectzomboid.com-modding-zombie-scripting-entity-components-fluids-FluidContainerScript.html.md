[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.fluids](package-summary.html)
2. [FluidContainerScript](FluidContainerScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [TAG\_OVERRIDE](#TAG_OVERRIDE)
   2. [whitelist](#whitelist)
   3. [blacklist](#blacklist)
   4. [containerName](#containerName)
   5. [capacity](#capacity)
   6. [initialAmountSet](#initialAmountSet)
   7. [initialAmountMin](#initialAmountMin)
   8. [initialAmountMax](#initialAmountMax)
   9. [initialFluids](#initialFluids)
   10. [initialFluidsIsRandom](#initialFluidsIsRandom)
   11. [inputLocked](#inputLocked)
   12. [canEmpty](#canEmpty)
   13. [hiddenAmount](#hiddenAmount)
   14. [rainCatcher](#rainCatcher)
   15. [fillsWithCleanWater](#fillsWithCleanWater)
   16. [customDrinkSound](#customDrinkSound)
   17. [transferRate](#transferRate)
7. [Constructor Details](#constructor-detail)
   1. [FluidContainerScript()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [PreReload()](#PreReload())
   2. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   3. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))
   4. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))
   5. [loadBlockFluids(ScriptParser.Block, boolean)](#loadBlockFluids(zombie.scripting.ScriptParser.Block,boolean))
   6. [getOrCreateFluidScript(String)](#getOrCreateFluidScript(java.lang.String))
   7. [readFluidAsBlock(ScriptParser.Block)](#readFluidAsBlock(zombie.scripting.ScriptParser.Block))
   8. [readFluid(String)](#readFluid(java.lang.String))
   9. [getWhitelistCopy()](#getWhitelistCopy())
   10. [getBlacklistCopy()](#getBlacklistCopy())
   11. [getContainerName()](#getContainerName())
   12. [getCustomDrinkSound()](#getCustomDrinkSound())
   13. [getCapacity()](#getCapacity())
   14. [getInitialAmount()](#getInitialAmount())
   15. [getInitialFluids()](#getInitialFluids())
   16. [isInitialFluidsIsRandom()](#isInitialFluidsIsRandom())
   17. [getInputLocked()](#getInputLocked())
   18. [getCanEmpty()](#getCanEmpty())
   19. [isHiddenAmount()](#isHiddenAmount())
   20. [getRainCatcher()](#getRainCatcher())
   21. [isFilledWithCleanWater()](#isFilledWithCleanWater())
   22. [getTransferRate()](#getTransferRate())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class FluidContainerScript
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.fluids.FluidContainerScript

---

public class FluidContainerScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `FluidContainerScript.FluidScript`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private FluidFilterScript`

  `blacklist`

  `private boolean`

  `canEmpty`

  `private float`

  `capacity`

  `private String`

  `containerName`

  `private String`

  `customDrinkSound`

  `private boolean`

  `fillsWithCleanWater`

  `private boolean`

  `hiddenAmount`

  `private float`

  `initialAmountMax`

  `private float`

  `initialAmountMin`

  `private boolean`

  `initialAmountSet`

  `private ArrayList<FluidContainerScript.FluidScript>`

  `initialFluids`

  `private boolean`

  `initialFluidsIsRandom`

  `private boolean`

  `inputLocked`

  `private float`

  `rainCatcher`

  `private static final String`

  `TAG_OVERRIDE`

  `private float`

  `transferRate`

  `private FluidFilterScript`

  `whitelist`

  ### Fields inherited from class [ComponentScript](../../ComponentScript.html#field-summary "class in zombie.scripting.entity")

  `type`

  ### Fields inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FluidContainerScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `copyFrom(ComponentScript componentScript)`

  `FluidFilter`

  `getBlacklistCopy()`

  `boolean`

  `getCanEmpty()`

  `float`

  `getCapacity()`

  `String`

  `getContainerName()`

  `String`

  `getCustomDrinkSound()`

  `float`

  `getInitialAmount()`

  `ArrayList<FluidContainerScript.FluidScript>`

  `getInitialFluids()`

  `boolean`

  `getInputLocked()`

  `private FluidContainerScript.FluidScript`

  `getOrCreateFluidScript(String fluidType)`

  `float`

  `getRainCatcher()`

  `float`

  `getTransferRate()`

  `FluidFilter`

  `getWhitelistCopy()`

  `boolean`

  `isFilledWithCleanWater()`

  `boolean`

  `isHiddenAmount()`

  `boolean`

  `isInitialFluidsIsRandom()`

  `protected void`

  `load(zombie.scripting.ScriptParser.Block block)`

  `private void`

  `loadBlockFluids(zombie.scripting.ScriptParser.Block block,
  boolean isOverride)`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `void`

  `PreReload()`

  `private FluidContainerScript.FluidScript`

  `readFluid(String v)`

  `private FluidContainerScript.FluidScript`

  `readFluidAsBlock(zombie.scripting.ScriptParser.Block block)`

  ### Methods inherited from class [ComponentScript](../../ComponentScript.html#method-summary "class in zombie.scripting.entity")

  `getName, isoMasterOnly, parseKeyValue`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### TAG\_OVERRIDE

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TAG\_OVERRIDE

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.scripting.entity.components.fluids.FluidContainerScript.TAG_OVERRIDE)
  + ### whitelist

    private [FluidFilterScript](../../../objects/FluidFilterScript.html "class in zombie.scripting.objects") whitelist
  + ### blacklist

    private [FluidFilterScript](../../../objects/FluidFilterScript.html "class in zombie.scripting.objects") blacklist
  + ### containerName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerName
  + ### capacity

    private float capacity
  + ### initialAmountSet

    private boolean initialAmountSet
  + ### initialAmountMin

    private float initialAmountMin
  + ### initialAmountMax

    private float initialAmountMax
  + ### initialFluids

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FluidContainerScript.FluidScript](FluidContainerScript.FluidScript.html "class in zombie.scripting.entity.components.fluids")> initialFluids
  + ### initialFluidsIsRandom

    private boolean initialFluidsIsRandom
  + ### inputLocked

    private boolean inputLocked
  + ### canEmpty

    private boolean canEmpty
  + ### hiddenAmount

    private boolean hiddenAmount
  + ### rainCatcher

    private float rainCatcher
  + ### fillsWithCleanWater

    private boolean fillsWithCleanWater
  + ### customDrinkSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customDrinkSound
  + ### transferRate

    private float transferRate
* Constructor Details
  -------------------

  + ### FluidContainerScript

    private FluidContainerScript()
* Method Details
  --------------

  + ### PreReload

    public void PreReload()

    Overrides:
    :   `PreReload` in class `BaseScriptObject`
  + ### OnScriptsLoaded

    public void OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `OnScriptsLoaded` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### copyFrom

    protected void copyFrom([ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity") componentScript)

    Specified by:
    :   `copyFrom` in class `ComponentScript`
  + ### load

    protected void load(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `load` in class `ComponentScript`

    Throws:
    :   `Exception`
  + ### loadBlockFluids

    private void loadBlockFluids(zombie.scripting.ScriptParser.Block block,
    boolean isOverride)
  + ### getOrCreateFluidScript

    private [FluidContainerScript.FluidScript](FluidContainerScript.FluidScript.html "class in zombie.scripting.entity.components.fluids") getOrCreateFluidScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidType)
  + ### readFluidAsBlock

    private [FluidContainerScript.FluidScript](FluidContainerScript.FluidScript.html "class in zombie.scripting.entity.components.fluids") readFluidAsBlock(zombie.scripting.ScriptParser.Block block)
  + ### readFluid

    private [FluidContainerScript.FluidScript](FluidContainerScript.FluidScript.html "class in zombie.scripting.entity.components.fluids") readFluid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") v)
  + ### getWhitelistCopy

    public [FluidFilter](../../../../entity/components/fluids/FluidFilter.html "class in zombie.entity.components.fluids") getWhitelistCopy()
  + ### getBlacklistCopy

    public [FluidFilter](../../../../entity/components/fluids/FluidFilter.html "class in zombie.entity.components.fluids") getBlacklistCopy()
  + ### getContainerName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerName()
  + ### getCustomDrinkSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomDrinkSound()
  + ### getCapacity

    public float getCapacity()
  + ### getInitialAmount

    public float getInitialAmount()
  + ### getInitialFluids

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FluidContainerScript.FluidScript](FluidContainerScript.FluidScript.html "class in zombie.scripting.entity.components.fluids")> getInitialFluids()
  + ### isInitialFluidsIsRandom

    public boolean isInitialFluidsIsRandom()
  + ### getInputLocked

    public boolean getInputLocked()
  + ### getCanEmpty

    public boolean getCanEmpty()
  + ### isHiddenAmount

    public boolean isHiddenAmount()
  + ### getRainCatcher

    public float getRainCatcher()
  + ### isFilledWithCleanWater

    public boolean isFilledWithCleanWater()
  + ### getTransferRate

    public float getTransferRate()