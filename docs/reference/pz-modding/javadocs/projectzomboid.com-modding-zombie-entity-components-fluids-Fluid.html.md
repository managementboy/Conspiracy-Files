[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [Fluid](Fluid.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [hasInitialized](#hasInitialized)
   2. [fluidEnumMap](#fluidEnumMap)
   3. [fluidStringMap](#fluidStringMap)
   4. [cacheStringMap](#cacheStringMap)
   5. [scriptToFluidMap](#scriptToFluidMap)
   6. [allFluids](#allFluids)
   7. [Water](#Water)
   8. [TaintedWater](#TaintedWater)
   9. [Petrol](#Petrol)
   10. [Alcohol](#Alcohol)
   11. [PoisonPotent](#PoisonPotent)
   12. [Beer](#Beer)
   13. [Whiskey](#Whiskey)
   14. [SodaPop](#SodaPop)
   15. [Coffee](#Coffee)
   16. [Tea](#Tea)
   17. [Wine](#Wine)
   18. [Bleach](#Bleach)
   19. [Blood](#Blood)
   20. [Honey](#Honey)
   21. [Mead](#Mead)
   22. [Acid](#Acid)
   23. [SpiffoJuice](#SpiffoJuice)
   24. [SecretFlavoring](#SecretFlavoring)
   25. [CarbonatedWater](#CarbonatedWater)
   26. [CleaningLiquid](#CleaningLiquid)
   27. [CowMilk](#CowMilk)
   28. [SheepMilk](#SheepMilk)
   29. [AnimalBlood](#AnimalBlood)
   30. [AnimalGrease](#AnimalGrease)
   31. [Dye](#Dye)
   32. [HairDye](#HairDye)
   33. [AnimalMilk](#AnimalMilk)
   34. [script](#script)
   35. [fluidType](#fluidType)
   36. [fluidTypeStr](#fluidTypeStr)
   37. [color](#color)
   38. [categories](#categories)
   39. [categoriesCacheStr](#categoriesCacheStr)
   40. [blendWhitelist](#blendWhitelist)
   41. [blendBlacklist](#blendBlacklist)
   42. [poisonInfo](#poisonInfo)
   43. [properties](#properties)
6. [Constructor Details](#constructor-detail)
   1. [Fluid(FluidType)](#%3Cinit%3E(zombie.entity.components.fluids.FluidType))
   2. [Fluid(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [addFluid(FluidType)](#addFluid(zombie.entity.components.fluids.FluidType))
   2. [Get(FluidType)](#Get(zombie.entity.components.fluids.FluidType))
   3. [Get(String)](#Get(java.lang.String))
   4. [getAllFluids()](#getAllFluids())
   5. [getAllFluidItemsDebug()](#getAllFluidItemsDebug())
   6. [FluidsInitialized()](#FluidsInitialized())
   7. [Init(ScriptLoadMode)](#Init(zombie.scripting.ScriptLoadMode))
   8. [PreReloadScripts()](#PreReloadScripts())
   9. [Reset()](#Reset())
   10. [saveFluid(Fluid, ByteBuffer)](#saveFluid(zombie.entity.components.fluids.Fluid,java.nio.ByteBuffer))
   11. [loadFluid(ByteBuffer, int)](#loadFluid(java.nio.ByteBuffer,int))
   12. [setScript(FluidDefinitionScript)](#setScript(zombie.scripting.objects.FluidDefinitionScript))
   13. [isVanilla()](#isVanilla())
   14. [toString()](#toString())
   15. [getInstance()](#getInstance())
   16. [getFluidType()](#getFluidType())
   17. [getFluidTypeString()](#getFluidTypeString())
   18. [getColor()](#getColor())
   19. [getCategories()](#getCategories())
   20. [isCategory(FluidCategory)](#isCategory(zombie.entity.components.fluids.FluidCategory))
   21. [getDisplayName()](#getDisplayName())
   22. [getTranslatedName()](#getTranslatedName())
   23. [getTranslatedNameLower()](#getTranslatedNameLower())
   24. [canBlendWith(Fluid)](#canBlendWith(zombie.entity.components.fluids.Fluid))
   25. [getProperties()](#getProperties())
   26. [getPoisonInfo()](#getPoisonInfo())
   27. [isPoisonous()](#isPoisonous())
   28. [getScript()](#getScript())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class Fluid
===========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.fluids.Fluid

---

public class Fluid
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

Fluids can be registered by using the FluidType enum for Vanilla Fluids, additional String type based Fluids are there for mod support.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final Fluid`

  `Acid`

  `static final Fluid`

  `Alcohol`

  `private static final ArrayList<Fluid>`

  `allFluids`

  `static final Fluid`

  `AnimalBlood`

  `static final Fluid`

  `AnimalGrease`

  `static final Fluid`

  `AnimalMilk`

  `static final Fluid`

  `Beer`

  `static final Fluid`

  `Bleach`

  `private FluidFilter`

  `blendBlacklist`

  `private FluidFilter`

  `blendWhitelist`

  `static final Fluid`

  `Blood`

  `private static final HashMap<String,Fluid>`

  `cacheStringMap`

  `static final Fluid`

  `CarbonatedWater`

  `private com.google.common.collect.ImmutableSet<FluidCategory>`

  `categories`

  `private String`

  `categoriesCacheStr`

  `static final Fluid`

  `CleaningLiquid`

  `static final Fluid`

  `Coffee`

  `private final Color`

  `color`

  `static final Fluid`

  `CowMilk`

  `static final Fluid`

  `Dye`

  `private static final HashMap<FluidType, Fluid>`

  `fluidEnumMap`

  `private static final HashMap<String,Fluid>`

  `fluidStringMap`

  `private final FluidType`

  `fluidType`

  `private final String`

  `fluidTypeStr`

  `static final Fluid`

  `HairDye`

  `private static boolean`

  `hasInitialized`

  `static final Fluid`

  `Honey`

  `static final Fluid`

  `Mead`

  `static final Fluid`

  `Petrol`

  `private PoisonInfo`

  `poisonInfo`

  `static final Fluid`

  `PoisonPotent`

  `private SealedFluidProperties`

  `properties`

  `private FluidDefinitionScript`

  `script`

  `private static final HashMap<FluidDefinitionScript, Fluid>`

  `scriptToFluidMap`

  `static final Fluid`

  `SecretFlavoring`

  `static final Fluid`

  `SheepMilk`

  `static final Fluid`

  `SodaPop`

  `static final Fluid`

  `SpiffoJuice`

  `static final Fluid`

  `TaintedWater`

  `static final Fluid`

  `Tea`

  `static final Fluid`

  `Water`

  `static final Fluid`

  `Whiskey`

  `static final Fluid`

  `Wine`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Fluid(String fluidTypeStr)`

  `private`

  `Fluid(FluidType fluidType)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static Fluid`

  `addFluid(FluidType type)`

  `boolean`

  `canBlendWith(Fluid fluid)`

  `static boolean`

  `FluidsInitialized()`

  `static Fluid`

  `Get(String name)`

  `static Fluid`

  `Get(FluidType type)`

  `static ArrayList<Item>`

  `getAllFluidItemsDebug()`

  `static ArrayList<Fluid>`

  `getAllFluids()`

  `com.google.common.collect.ImmutableSet<FluidCategory>`

  `getCategories()`

  `Color`

  `getColor()`

  `String`

  `getDisplayName()`

  `FluidType`

  `getFluidType()`

  `String`

  `getFluidTypeString()`

  `zombie.entity.components.fluids.FluidInstance`

  `getInstance()`

  `PoisonInfo`

  `getPoisonInfo()`

  `SealedFluidProperties`

  `getProperties()`

  `FluidDefinitionScript`

  `getScript()`

  `String`

  `getTranslatedName()`

  `String`

  `getTranslatedNameLower()`

  `static void`

  `Init(zombie.scripting.ScriptLoadMode loadMode)`

  `boolean`

  `isCategory(FluidCategory category)`

  `boolean`

  `isPoisonous()`

  `boolean`

  `isVanilla()`

  `static Fluid`

  `loadFluid(ByteBuffer input,
  int worldVersion)`

  `static void`

  `PreReloadScripts()`

  `static void`

  `Reset()`

  `static void`

  `saveFluid(Fluid fluid,
  ByteBuffer output)`

  `private void`

  `setScript(FluidDefinitionScript script)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### hasInitialized

    private static boolean hasInitialized
  + ### fluidEnumMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[FluidType](FluidType.html "enum class in zombie.entity.components.fluids"), [Fluid](Fluid.html "class in zombie.entity.components.fluids")> fluidEnumMap
  + ### fluidStringMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Fluid](Fluid.html "class in zombie.entity.components.fluids")> fluidStringMap
  + ### cacheStringMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Fluid](Fluid.html "class in zombie.entity.components.fluids")> cacheStringMap
  + ### scriptToFluidMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[FluidDefinitionScript](../../../scripting/objects/FluidDefinitionScript.html "class in zombie.scripting.objects"), [Fluid](Fluid.html "class in zombie.entity.components.fluids")> scriptToFluidMap
  + ### allFluids

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Fluid](Fluid.html "class in zombie.entity.components.fluids")> allFluids
  + ### Water

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Water
  + ### TaintedWater

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") TaintedWater
  + ### Petrol

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Petrol
  + ### Alcohol

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Alcohol
  + ### PoisonPotent

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") PoisonPotent
  + ### Beer

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Beer
  + ### Whiskey

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Whiskey
  + ### SodaPop

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") SodaPop
  + ### Coffee

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Coffee
  + ### Tea

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Tea
  + ### Wine

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Wine
  + ### Bleach

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Bleach
  + ### Blood

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Blood
  + ### Honey

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Honey
  + ### Mead

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Mead
  + ### Acid

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Acid
  + ### SpiffoJuice

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") SpiffoJuice
  + ### SecretFlavoring

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") SecretFlavoring
  + ### CarbonatedWater

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") CarbonatedWater
  + ### CleaningLiquid

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") CleaningLiquid
  + ### CowMilk

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") CowMilk
  + ### SheepMilk

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") SheepMilk
  + ### AnimalBlood

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") AnimalBlood
  + ### AnimalGrease

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") AnimalGrease
  + ### Dye

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") Dye
  + ### HairDye

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") HairDye
  + ### AnimalMilk

    public static final [Fluid](Fluid.html "class in zombie.entity.components.fluids") AnimalMilk
  + ### script

    private [FluidDefinitionScript](../../../scripting/objects/FluidDefinitionScript.html "class in zombie.scripting.objects") script
  + ### fluidType

    private final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") fluidType
  + ### fluidTypeStr

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidTypeStr
  + ### color

    private final [Color](../../../core/Color.html "class in zombie.core") color
  + ### categories

    private com.google.common.collect.ImmutableSet<[FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids")> categories
  + ### categoriesCacheStr

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") categoriesCacheStr
  + ### blendWhitelist

    private [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") blendWhitelist
  + ### blendBlacklist

    private [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") blendBlacklist
  + ### poisonInfo

    private [PoisonInfo](PoisonInfo.html "class in zombie.entity.components.fluids") poisonInfo
  + ### properties

    private [SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids") properties
* Constructor Details
  -------------------

  + ### Fluid

    private Fluid([FluidType](FluidType.html "enum class in zombie.entity.components.fluids") fluidType)
  + ### Fluid

    private Fluid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidTypeStr)
* Method Details
  --------------

  + ### addFluid

    private static [Fluid](Fluid.html "class in zombie.entity.components.fluids") addFluid([FluidType](FluidType.html "enum class in zombie.entity.components.fluids") type)
  + ### Get

    public static [Fluid](Fluid.html "class in zombie.entity.components.fluids") Get([FluidType](FluidType.html "enum class in zombie.entity.components.fluids") type)
  + ### Get

    public static [Fluid](Fluid.html "class in zombie.entity.components.fluids") Get([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllFluids

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Fluid](Fluid.html "class in zombie.entity.components.fluids")> getAllFluids()
  + ### getAllFluidItemsDebug

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects")> getAllFluidItemsDebug()
  + ### FluidsInitialized

    public static boolean FluidsInitialized()
  + ### Init

    public static void Init(zombie.scripting.ScriptLoadMode loadMode)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### PreReloadScripts

    public static void PreReloadScripts()
  + ### Reset

    public static void Reset()
  + ### saveFluid

    public static void saveFluid([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### loadFluid

    public static [Fluid](Fluid.html "class in zombie.entity.components.fluids") loadFluid([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### setScript

    private void setScript([FluidDefinitionScript](../../../scripting/objects/FluidDefinitionScript.html "class in zombie.scripting.objects") script)
  + ### isVanilla

    public boolean isVanilla()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getInstance

    public zombie.entity.components.fluids.FluidInstance getInstance()
  + ### getFluidType

    public [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") getFluidType()
  + ### getFluidTypeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFluidTypeString()
  + ### getColor

    public [Color](../../../core/Color.html "class in zombie.core") getColor()
  + ### getCategories

    public com.google.common.collect.ImmutableSet<[FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids")> getCategories()
  + ### isCategory

    public boolean isCategory([FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") category)
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### getTranslatedName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedName()
  + ### getTranslatedNameLower

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedNameLower()
  + ### canBlendWith

    public boolean canBlendWith([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### getProperties

    public [SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids") getProperties()
  + ### getPoisonInfo

    public [PoisonInfo](PoisonInfo.html "class in zombie.entity.components.fluids") getPoisonInfo()
  + ### isPoisonous

    public boolean isPoisonous()
  + ### getScript

    public [FluidDefinitionScript](../../../scripting/objects/FluidDefinitionScript.html "class in zombie.scripting.objects") getScript()