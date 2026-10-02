[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [FluidDefinitionScript](FluidDefinitionScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [propertiesMap](#propertiesMap)
   2. [properties](#properties)
   3. [existsAsVanilla](#existsAsVanilla)
   4. [modId](#modId)
   5. [fluidType](#fluidType)
   6. [fluidTypeString](#fluidTypeString)
   7. [colorReference](#colorReference)
   8. [color](#color)
   9. [categories](#categories)
   10. [displayName](#displayName)
   11. [blendWhitelist](#blendWhitelist)
   12. [blendBlacklist](#blendBlacklist)
   13. [hasPoison](#hasPoison)
   14. [poisonMaxEffect](#poisonMaxEffect)
   15. [poisonMinAmount](#poisonMinAmount)
   16. [poisonDiluteRatio](#poisonDiluteRatio)
   17. [fatigueChange](#fatigueChange)
   18. [hungerChange](#hungerChange)
   19. [stressChange](#stressChange)
   20. [thirstChange](#thirstChange)
   21. [unhappyChange](#unhappyChange)
   22. [calories](#calories)
   23. [carbohydrates](#carbohydrates)
   24. [lipids](#lipids)
   25. [proteins](#proteins)
   26. [alcohol](#alcohol)
   27. [fluReduction](#fluReduction)
   28. [painReduction](#painReduction)
   29. [enduranceChange](#enduranceChange)
   30. [foodSicknessChange](#foodSicknessChange)
7. [Constructor Details](#constructor-detail)
   1. [FluidDefinitionScript()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [addProperty(String, float)](#addProperty(java.lang.String,float))
   2. [getExistsAsVanilla()](#getExistsAsVanilla())
   3. [isVanilla()](#isVanilla())
   4. [getModID()](#getModID())
   5. [getFluidType()](#getFluidType())
   6. [getFluidTypeString()](#getFluidTypeString())
   7. [getDisplayName()](#getDisplayName())
   8. [getColor()](#getColor())
   9. [getCategories()](#getCategories())
   10. [getBlendWhitelist()](#getBlendWhitelist())
   11. [getBlendBlackList()](#getBlendBlackList())
   12. [getPoisonMaxEffect()](#getPoisonMaxEffect())
   13. [getPoisonMinAmount()](#getPoisonMinAmount())
   14. [getPoisonDiluteRatio()](#getPoisonDiluteRatio())
   15. [getFatigueChange()](#getFatigueChange())
   16. [getHungerChange()](#getHungerChange())
   17. [getStressChange()](#getStressChange())
   18. [getThirstChange()](#getThirstChange())
   19. [getUnhappyChange()](#getUnhappyChange())
   20. [getCalories()](#getCalories())
   21. [getCarbohydrates()](#getCarbohydrates())
   22. [getLipids()](#getLipids())
   23. [getProteins()](#getProteins())
   24. [getAlcohol()](#getAlcohol())
   25. [getFluReduction()](#getFluReduction())
   26. [getPainReduction()](#getPainReduction())
   27. [getEnduranceChange()](#getEnduranceChange())
   28. [getFoodSicknessChange()](#getFoodSicknessChange())
   29. [hasPropertiesSet()](#hasPropertiesSet())
   30. [InitLoadPP(String)](#InitLoadPP(java.lang.String))
   31. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   32. [LoadCategories(ScriptParser.Block)](#LoadCategories(zombie.scripting.ScriptParser.Block))
   33. [LoadPoison(ScriptParser.Block)](#LoadPoison(zombie.scripting.ScriptParser.Block))
   34. [LoadProperties(ScriptParser.Block)](#LoadProperties(zombie.scripting.ScriptParser.Block))
   35. [PreReload()](#PreReload())
   36. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FluidDefinitionScript
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.FluidDefinitionScript

---

public class FluidDefinitionScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `FluidDefinitionScript.PropertyValue`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final FluidDefinitionScript.PropertyValue`

  `alcohol`

  `private FluidFilterScript`

  `blendBlacklist`

  `private FluidFilterScript`

  `blendWhitelist`

  `private final FluidDefinitionScript.PropertyValue`

  `calories`

  `private final FluidDefinitionScript.PropertyValue`

  `carbohydrates`

  `private final EnumSet<FluidCategory>`

  `categories`

  `private final Color`

  `color`

  `private String`

  `colorReference`

  `private String`

  `displayName`

  `private final FluidDefinitionScript.PropertyValue`

  `enduranceChange`

  `private boolean`

  `existsAsVanilla`

  `private final FluidDefinitionScript.PropertyValue`

  `fatigueChange`

  `private FluidType`

  `fluidType`

  `private String`

  `fluidTypeString`

  `private final FluidDefinitionScript.PropertyValue`

  `fluReduction`

  `private final FluidDefinitionScript.PropertyValue`

  `foodSicknessChange`

  `private boolean`

  `hasPoison`

  `private final FluidDefinitionScript.PropertyValue`

  `hungerChange`

  `private final FluidDefinitionScript.PropertyValue`

  `lipids`

  `private String`

  `modId`

  `private final FluidDefinitionScript.PropertyValue`

  `painReduction`

  `private float`

  `poisonDiluteRatio`

  `private PoisonEffect`

  `poisonMaxEffect`

  `private float`

  `poisonMinAmount`

  `private final ArrayList<FluidDefinitionScript.PropertyValue>`

  `properties`

  `private final HashMap<String, FluidDefinitionScript.PropertyValue>`

  `propertiesMap`

  `private final FluidDefinitionScript.PropertyValue`

  `proteins`

  `private final FluidDefinitionScript.PropertyValue`

  `stressChange`

  `private final FluidDefinitionScript.PropertyValue`

  `thirstChange`

  `private final FluidDefinitionScript.PropertyValue`

  `unhappyChange`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `FluidDefinitionScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private FluidDefinitionScript.PropertyValue`

  `addProperty(String name,
  float defaultValue)`

  `float`

  `getAlcohol()`

  `FluidFilterScript`

  `getBlendBlackList()`

  `FluidFilterScript`

  `getBlendWhitelist()`

  `float`

  `getCalories()`

  `float`

  `getCarbohydrates()`

  `EnumSet<FluidCategory>`

  `getCategories()`

  `Color`

  `getColor()`

  `String`

  `getDisplayName()`

  `float`

  `getEnduranceChange()`

  `boolean`

  `getExistsAsVanilla()`

  `float`

  `getFatigueChange()`

  `FluidType`

  `getFluidType()`

  `String`

  `getFluidTypeString()`

  `float`

  `getFluReduction()`

  `int`

  `getFoodSicknessChange()`

  `float`

  `getHungerChange()`

  `float`

  `getLipids()`

  `String`

  `getModID()`

  `float`

  `getPainReduction()`

  `float`

  `getPoisonDiluteRatio()`

  `PoisonEffect`

  `getPoisonMaxEffect()`

  `float`

  `getPoisonMinAmount()`

  `float`

  `getProteins()`

  `float`

  `getStressChange()`

  `float`

  `getThirstChange()`

  `float`

  `getUnhappyChange()`

  `boolean`

  `hasPropertiesSet()`

  `void`

  `InitLoadPP(String name)`

  `boolean`

  `isVanilla()`

  `void`

  `Load(String name,
  String body)`

  `private void`

  `LoadCategories(zombie.scripting.ScriptParser.Block block)`

  `private void`

  `LoadPoison(zombie.scripting.ScriptParser.Block block)`

  `private void`

  `LoadProperties(zombie.scripting.ScriptParser.Block block)`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `void`

  `PreReload()`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### propertiesMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects")> propertiesMap
  + ### properties

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects")> properties
  + ### existsAsVanilla

    private boolean existsAsVanilla
  + ### modId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId
  + ### fluidType

    private [FluidType](../../entity/components/fluids/FluidType.html "enum class in zombie.entity.components.fluids") fluidType
  + ### fluidTypeString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidTypeString
  + ### colorReference

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") colorReference
  + ### color

    private final [Color](../../core/Color.html "class in zombie.core") color
  + ### categories

    private final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[FluidCategory](../../entity/components/fluids/FluidCategory.html "enum class in zombie.entity.components.fluids")> categories
  + ### displayName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### blendWhitelist

    private [FluidFilterScript](FluidFilterScript.html "class in zombie.scripting.objects") blendWhitelist
  + ### blendBlacklist

    private [FluidFilterScript](FluidFilterScript.html "class in zombie.scripting.objects") blendBlacklist
  + ### hasPoison

    private boolean hasPoison
  + ### poisonMaxEffect

    private [PoisonEffect](../../entity/components/fluids/PoisonEffect.html "enum class in zombie.entity.components.fluids") poisonMaxEffect
  + ### poisonMinAmount

    private float poisonMinAmount
  + ### poisonDiluteRatio

    private float poisonDiluteRatio
  + ### fatigueChange

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") fatigueChange
  + ### hungerChange

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") hungerChange
  + ### stressChange

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") stressChange
  + ### thirstChange

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") thirstChange
  + ### unhappyChange

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") unhappyChange
  + ### calories

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") calories
  + ### carbohydrates

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") carbohydrates
  + ### lipids

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") lipids
  + ### proteins

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") proteins
  + ### alcohol

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") alcohol
  + ### fluReduction

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") fluReduction
  + ### painReduction

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") painReduction
  + ### enduranceChange

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") enduranceChange
  + ### foodSicknessChange

    private final [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") foodSicknessChange
* Constructor Details
  -------------------

  + ### FluidDefinitionScript

    protected FluidDefinitionScript()
* Method Details
  --------------

  + ### addProperty

    private [FluidDefinitionScript.PropertyValue](FluidDefinitionScript.PropertyValue.html "class in zombie.scripting.objects") addProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float defaultValue)
  + ### getExistsAsVanilla

    public boolean getExistsAsVanilla()
  + ### isVanilla

    public boolean isVanilla()
  + ### getModID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModID()
  + ### getFluidType

    public [FluidType](../../entity/components/fluids/FluidType.html "enum class in zombie.entity.components.fluids") getFluidType()
  + ### getFluidTypeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFluidTypeString()
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### getColor

    public [Color](../../core/Color.html "class in zombie.core") getColor()
  + ### getCategories

    public [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[FluidCategory](../../entity/components/fluids/FluidCategory.html "enum class in zombie.entity.components.fluids")> getCategories()
  + ### getBlendWhitelist

    public [FluidFilterScript](FluidFilterScript.html "class in zombie.scripting.objects") getBlendWhitelist()
  + ### getBlendBlackList

    public [FluidFilterScript](FluidFilterScript.html "class in zombie.scripting.objects") getBlendBlackList()
  + ### getPoisonMaxEffect

    public [PoisonEffect](../../entity/components/fluids/PoisonEffect.html "enum class in zombie.entity.components.fluids") getPoisonMaxEffect()
  + ### getPoisonMinAmount

    public float getPoisonMinAmount()
  + ### getPoisonDiluteRatio

    public float getPoisonDiluteRatio()
  + ### getFatigueChange

    public float getFatigueChange()
  + ### getHungerChange

    public float getHungerChange()
  + ### getStressChange

    public float getStressChange()
  + ### getThirstChange

    public float getThirstChange()
  + ### getUnhappyChange

    public float getUnhappyChange()
  + ### getCalories

    public float getCalories()
  + ### getCarbohydrates

    public float getCarbohydrates()
  + ### getLipids

    public float getLipids()
  + ### getProteins

    public float getProteins()
  + ### getAlcohol

    public float getAlcohol()
  + ### getFluReduction

    public float getFluReduction()
  + ### getPainReduction

    public float getPainReduction()
  + ### getEnduranceChange

    public float getEnduranceChange()
  + ### getFoodSicknessChange

    public int getFoodSicknessChange()
  + ### hasPropertiesSet

    public boolean hasPropertiesSet()
  + ### InitLoadPP

    public void InitLoadPP([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Overrides:
    :   `InitLoadPP` in class `BaseScriptObject`
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") body)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### LoadCategories

    private void LoadCategories(zombie.scripting.ScriptParser.Block block)
  + ### LoadPoison

    private void LoadPoison(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadProperties

    private void LoadProperties(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
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