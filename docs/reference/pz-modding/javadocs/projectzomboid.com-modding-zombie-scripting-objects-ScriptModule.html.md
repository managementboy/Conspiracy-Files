[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [ScriptModule](ScriptModule.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [value](#value)
   3. [imports](#imports)
   4. [disabled](#disabled)
   5. [scriptBucketList](#scriptBucketList)
   6. [scriptBucketMap](#scriptBucketMap)
   7. [vehicleTemplates](#vehicleTemplates)
   8. [entityTemplates](#entityTemplates)
   9. [items](#items)
   10. [recipes](#recipes)
   11. [uniqueRecipes](#uniqueRecipes)
   12. [evolvedRecipes](#evolvedRecipes)
   13. [fixings](#fixings)
   14. [animationMeshes](#animationMeshes)
   15. [clocks](#clocks)
   16. [mannequins](#mannequins)
   17. [models](#models)
   18. [physicsShapes](#physicsShapes)
   19. [spriteModels](#spriteModels)
   20. [gameSounds](#gameSounds)
   21. [soundTimelines](#soundTimelines)
   22. [vehicles](#vehicles)
   23. [animations](#animations)
   24. [vehicleEngineRpms](#vehicleEngineRpms)
   25. [itemConfigs](#itemConfigs)
   26. [entities](#entities)
   27. [xuiConfigScripts](#xuiConfigScripts)
   28. [xuiLayouts](#xuiLayouts)
   29. [xuiStyles](#xuiStyles)
   30. [xuiDefaultStyles](#xuiDefaultStyles)
   31. [xuiGlobalColors](#xuiGlobalColors)
   32. [xuiSkinScripts](#xuiSkinScripts)
   33. [itemFilters](#itemFilters)
   34. [fluidFilters](#fluidFilters)
   35. [craftRecipes](#craftRecipes)
   36. [stringLists](#stringLists)
   37. [energyDefinitionScripts](#energyDefinitionScripts)
   38. [fluidDefinitionScripts](#fluidDefinitionScripts)
   39. [timedActionScripts](#timedActionScripts)
   40. [ragdollScripts](#ragdollScripts)
   41. [characterTraitScripts](#characterTraitScripts)
   42. [characterProfessionScripts](#characterProfessionScripts)
   43. [physicsHitReactionScripts](#physicsHitReactionScripts)
6. [Constructor Details](#constructor-detail)
   1. [ScriptModule()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addBucket(ScriptBucket)](#addBucket(zombie.scripting.ScriptBucket))
   2. [addBucket(ScriptBucket.Template)](#addBucket(zombie.scripting.ScriptBucket.Template))
   3. [getVehicleTemplate(String)](#getVehicleTemplate(java.lang.String))
   4. [getGameEntityTemplate(String)](#getGameEntityTemplate(java.lang.String))
   5. [getItem(String)](#getItem(java.lang.String))
   6. [getRecipe(String)](#getRecipe(java.lang.String))
   7. [getUniqueRecipe(String)](#getUniqueRecipe(java.lang.String))
   8. [getEvolvedRecipe(String)](#getEvolvedRecipe(java.lang.String))
   9. [getFixing(String)](#getFixing(java.lang.String))
   10. [getAnimationsMesh(String)](#getAnimationsMesh(java.lang.String))
   11. [getClockScript(String)](#getClockScript(java.lang.String))
   12. [getMannequinScript(String)](#getMannequinScript(java.lang.String))
   13. [getModelScript(String)](#getModelScript(java.lang.String))
   14. [getPhysicsShape(String)](#getPhysicsShape(java.lang.String))
   15. [getSpriteModel(String)](#getSpriteModel(java.lang.String))
   16. [getGameSound(String)](#getGameSound(java.lang.String))
   17. [getSoundTimeline(String)](#getSoundTimeline(java.lang.String))
   18. [getVehicle(String)](#getVehicle(java.lang.String))
   19. [getAnimation(String)](#getAnimation(java.lang.String))
   20. [getVehicleEngineRPM(String)](#getVehicleEngineRPM(java.lang.String))
   21. [getItemConfig(String)](#getItemConfig(java.lang.String))
   22. [getGameEntityScript(String)](#getGameEntityScript(java.lang.String))
   23. [getXuiConfigScript(String)](#getXuiConfigScript(java.lang.String))
   24. [getXuiLayout(String)](#getXuiLayout(java.lang.String))
   25. [getXuiStyle(String)](#getXuiStyle(java.lang.String))
   26. [getXuiDefaultStyle(String)](#getXuiDefaultStyle(java.lang.String))
   27. [getXuiGlobalColors(String)](#getXuiGlobalColors(java.lang.String))
   28. [getXuiSkinScript(String)](#getXuiSkinScript(java.lang.String))
   29. [getItemFilter(String)](#getItemFilter(java.lang.String))
   30. [getFluidFilter(String)](#getFluidFilter(java.lang.String))
   31. [getCraftRecipe(String)](#getCraftRecipe(java.lang.String))
   32. [getStringList(String)](#getStringList(java.lang.String))
   33. [getEnergyDefinitionScript(String)](#getEnergyDefinitionScript(java.lang.String))
   34. [getFluidDefinitionScript(String)](#getFluidDefinitionScript(java.lang.String))
   35. [getTimedActionScript(String)](#getTimedActionScript(java.lang.String))
   36. [getRagdollScript(String)](#getRagdollScript(java.lang.String))
   37. [getCharacterTraitScript(String)](#getCharacterTraitScript(java.lang.String))
   38. [getCharacterProfessionScript(String)](#getCharacterProfessionScript(java.lang.String))
   39. [getPhysicsHitReactionScript(String)](#getPhysicsHitReactionScript(java.lang.String))
   40. [Load(ScriptLoadMode, String, String)](#Load(zombie.scripting.ScriptLoadMode,java.lang.String,java.lang.String))
   41. [ParseScriptPP(ScriptLoadMode, String)](#ParseScriptPP(zombie.scripting.ScriptLoadMode,java.lang.String))
   42. [GetTokenType(String)](#GetTokenType(java.lang.String))
   43. [CreateFromTokenPP(ScriptLoadMode, String)](#CreateFromTokenPP(zombie.scripting.ScriptLoadMode,java.lang.String))
   44. [CheckExitPoints()](#CheckExitPoints())
   45. [getName()](#getName())
   46. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ScriptModule
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.ScriptModule

All Implemented Interfaces:
:   `zombie.scripting.IScriptObjectStore`

---

public final class ScriptModule
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.scripting.IScriptObjectStore

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final zombie.scripting.ScriptBucket<AnimationsMesh>`

  `animationMeshes`

  `final zombie.scripting.ScriptBucket<RuntimeAnimationScript>`

  `animations`

  `final zombie.scripting.ScriptBucket<zombie.scripting.objects.CharacterProfessionDefinitionScript>`

  `characterProfessionScripts`

  `final zombie.scripting.ScriptBucket<zombie.scripting.objects.CharacterTraitDefinitionScript>`

  `characterTraitScripts`

  `final zombie.scripting.ScriptBucket<zombie.scripting.objects.ClockScript>`

  `clocks`

  `final zombie.scripting.ScriptBucket<CraftRecipe>`

  `craftRecipes`

  `boolean`

  `disabled`

  `final zombie.scripting.ScriptBucket<EnergyDefinitionScript>`

  `energyDefinitionScripts`

  `final zombie.scripting.ScriptBucket<GameEntityScript>`

  `entities`

  `final zombie.scripting.ScriptBucket.Template<GameEntityTemplate>`

  `entityTemplates`

  `final zombie.scripting.ScriptBucket<EvolvedRecipe>`

  `evolvedRecipes`

  `final zombie.scripting.ScriptBucket<Fixing>`

  `fixings`

  `final zombie.scripting.ScriptBucket<FluidDefinitionScript>`

  `fluidDefinitionScripts`

  `final zombie.scripting.ScriptBucket<FluidFilterScript>`

  `fluidFilters`

  `final zombie.scripting.ScriptBucket<GameSoundScript>`

  `gameSounds`

  `final ArrayList<String>`

  `imports`

  `final zombie.scripting.ScriptBucket<ItemConfig>`

  `itemConfigs`

  `final zombie.scripting.ScriptBucket<ItemFilterScript>`

  `itemFilters`

  `final zombie.scripting.ScriptBucket<Item>`

  `items`

  `final zombie.scripting.ScriptBucket<MannequinScript>`

  `mannequins`

  `final zombie.scripting.ScriptBucket<ModelScript>`

  `models`

  `String`

  `name`

  `final zombie.scripting.ScriptBucket<zombie.scripting.objects.PhysicsHitReactionScript>`

  `physicsHitReactionScripts`

  `final zombie.scripting.ScriptBucket<PhysicsShapeScript>`

  `physicsShapes`

  `final zombie.scripting.ScriptBucket<zombie.scripting.objects.RagdollScript>`

  `ragdollScripts`

  `final zombie.scripting.ScriptBucket<Recipe>`

  `recipes`

  `private final ArrayList<zombie.scripting.ScriptBucket<?>>`

  `scriptBucketList`

  `private final HashMap<ScriptType, zombie.scripting.ScriptBucket<?>>`

  `scriptBucketMap`

  `final zombie.scripting.ScriptBucket<SoundTimelineScript>`

  `soundTimelines`

  `final zombie.scripting.ScriptBucket<SpriteModel>`

  `spriteModels`

  `final zombie.scripting.ScriptBucket<StringListScript>`

  `stringLists`

  `final zombie.scripting.ScriptBucket<TimedActionScript>`

  `timedActionScripts`

  `final zombie.scripting.ScriptBucket<UniqueRecipe>`

  `uniqueRecipes`

  `String`

  `value`

  `final zombie.scripting.ScriptBucket<VehicleEngineRPM>`

  `vehicleEngineRpms`

  `final zombie.scripting.ScriptBucket<VehicleScript>`

  `vehicles`

  `final zombie.scripting.ScriptBucket.Template<VehicleTemplate>`

  `vehicleTemplates`

  `final zombie.scripting.ScriptBucket<XuiConfigScript>`

  `xuiConfigScripts`

  `final zombie.scripting.ScriptBucket<XuiLayoutScript>`

  `xuiDefaultStyles`

  `final zombie.scripting.ScriptBucket<XuiColorsScript>`

  `xuiGlobalColors`

  `final zombie.scripting.ScriptBucket<XuiLayoutScript>`

  `xuiLayouts`

  `final zombie.scripting.ScriptBucket<XuiSkinScript>`

  `xuiSkinScripts`

  `final zombie.scripting.ScriptBucket<XuiLayoutScript>`

  `xuiStyles`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ScriptModule()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private <T extends BaseScriptObject>  
  zombie.scripting.ScriptBucket.Template<T>`

  `addBucket(zombie.scripting.ScriptBucket.Template<T> bucket)`

  `private <T extends BaseScriptObject>  
  zombie.scripting.ScriptBucket<T>`

  `addBucket(zombie.scripting.ScriptBucket<T> bucket)`

  `boolean`

  `CheckExitPoints()`

  `private void`

  `CreateFromTokenPP(zombie.scripting.ScriptLoadMode loadMode,
  String token)`

  `RuntimeAnimationScript`

  `getAnimation(String name)`

  `AnimationsMesh`

  `getAnimationsMesh(String name)`

  `zombie.scripting.objects.CharacterProfessionDefinitionScript`

  `getCharacterProfessionScript(String name)`

  `zombie.scripting.objects.CharacterTraitDefinitionScript`

  `getCharacterTraitScript(String name)`

  `zombie.scripting.objects.ClockScript`

  `getClockScript(String name)`

  `CraftRecipe`

  `getCraftRecipe(String name)`

  `EnergyDefinitionScript`

  `getEnergyDefinitionScript(String name)`

  `EvolvedRecipe`

  `getEvolvedRecipe(String name)`

  `Fixing`

  `getFixing(String name)`

  `FluidDefinitionScript`

  `getFluidDefinitionScript(String name)`

  `FluidFilterScript`

  `getFluidFilter(String name)`

  `GameEntityScript`

  `getGameEntityScript(String name)`

  `GameEntityTemplate`

  `getGameEntityTemplate(String name)`

  `GameSoundScript`

  `getGameSound(String name)`

  `Item`

  `getItem(String name)`

  `ItemConfig`

  `getItemConfig(String name)`

  `ItemFilterScript`

  `getItemFilter(String name)`

  `MannequinScript`

  `getMannequinScript(String name)`

  `ModelScript`

  `getModelScript(String name)`

  `String`

  `getName()`

  `zombie.scripting.objects.PhysicsHitReactionScript`

  `getPhysicsHitReactionScript(String name)`

  `PhysicsShapeScript`

  `getPhysicsShape(String name)`

  `zombie.scripting.objects.RagdollScript`

  `getRagdollScript(String name)`

  `Recipe`

  `getRecipe(String name)`

  `SoundTimelineScript`

  `getSoundTimeline(String name)`

  `SpriteModel`

  `getSpriteModel(String name)`

  `StringListScript`

  `getStringList(String name)`

  `TimedActionScript`

  `getTimedActionScript(String name)`

  `private String`

  `GetTokenType(String token)`

  `UniqueRecipe`

  `getUniqueRecipe(String name)`

  `VehicleScript`

  `getVehicle(String name)`

  `VehicleEngineRPM`

  `getVehicleEngineRPM(String name)`

  `VehicleTemplate`

  `getVehicleTemplate(String name)`

  `XuiConfigScript`

  `getXuiConfigScript(String name)`

  `XuiLayoutScript`

  `getXuiDefaultStyle(String name)`

  `XuiColorsScript`

  `getXuiGlobalColors(String name)`

  `XuiLayoutScript`

  `getXuiLayout(String name)`

  `XuiSkinScript`

  `getXuiSkinScript(String name)`

  `XuiLayoutScript`

  `getXuiStyle(String name)`

  `void`

  `Load(zombie.scripting.ScriptLoadMode loadMode,
  String name,
  String strArray)`

  `void`

  `ParseScriptPP(zombie.scripting.ScriptLoadMode loadMode,
  String totalFile)`

  `void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### value

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value
  + ### imports

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> imports
  + ### disabled

    public boolean disabled
  + ### scriptBucketList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.scripting.ScriptBucket<?>> scriptBucketList
  + ### scriptBucketMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[ScriptType](../ScriptType.html "enum class in zombie.scripting"), zombie.scripting.ScriptBucket<?>> scriptBucketMap
  + ### vehicleTemplates

    public final zombie.scripting.ScriptBucket.Template<[VehicleTemplate](VehicleTemplate.html "class in zombie.scripting.objects")> vehicleTemplates
  + ### entityTemplates

    public final zombie.scripting.ScriptBucket.Template<[GameEntityTemplate](../entity/GameEntityTemplate.html "class in zombie.scripting.entity")> entityTemplates
  + ### items

    public final zombie.scripting.ScriptBucket<[Item](Item.html "class in zombie.scripting.objects")> items
  + ### recipes

    public final zombie.scripting.ScriptBucket<[Recipe](Recipe.html "class in zombie.scripting.objects")> recipes
  + ### uniqueRecipes

    public final zombie.scripting.ScriptBucket<[UniqueRecipe](UniqueRecipe.html "class in zombie.scripting.objects")> uniqueRecipes
  + ### evolvedRecipes

    public final zombie.scripting.ScriptBucket<[EvolvedRecipe](EvolvedRecipe.html "class in zombie.scripting.objects")> evolvedRecipes
  + ### fixings

    public final zombie.scripting.ScriptBucket<[Fixing](Fixing.html "class in zombie.scripting.objects")> fixings
  + ### animationMeshes

    public final zombie.scripting.ScriptBucket<[AnimationsMesh](AnimationsMesh.html "class in zombie.scripting.objects")> animationMeshes
  + ### clocks

    public final zombie.scripting.ScriptBucket<zombie.scripting.objects.ClockScript> clocks
  + ### mannequins

    public final zombie.scripting.ScriptBucket<[MannequinScript](MannequinScript.html "class in zombie.scripting.objects")> mannequins
  + ### models

    public final zombie.scripting.ScriptBucket<[ModelScript](ModelScript.html "class in zombie.scripting.objects")> models
  + ### physicsShapes

    public final zombie.scripting.ScriptBucket<[PhysicsShapeScript](PhysicsShapeScript.html "class in zombie.scripting.objects")> physicsShapes
  + ### spriteModels

    public final zombie.scripting.ScriptBucket<[SpriteModel](../../iso/SpriteModel.html "class in zombie.iso")> spriteModels
  + ### gameSounds

    public final zombie.scripting.ScriptBucket<[GameSoundScript](GameSoundScript.html "class in zombie.scripting.objects")> gameSounds
  + ### soundTimelines

    public final zombie.scripting.ScriptBucket<[SoundTimelineScript](SoundTimelineScript.html "class in zombie.scripting.objects")> soundTimelines
  + ### vehicles

    public final zombie.scripting.ScriptBucket<[VehicleScript](VehicleScript.html "class in zombie.scripting.objects")> vehicles
  + ### animations

    public final zombie.scripting.ScriptBucket<[RuntimeAnimationScript](../../core/skinnedmodel/runtime/RuntimeAnimationScript.html "class in zombie.core.skinnedmodel.runtime")> animations
  + ### vehicleEngineRpms

    public final zombie.scripting.ScriptBucket<[VehicleEngineRPM](../../vehicles/VehicleEngineRPM.html "class in zombie.vehicles")> vehicleEngineRpms
  + ### itemConfigs

    public final zombie.scripting.ScriptBucket<[ItemConfig](../itemConfig/ItemConfig.html "class in zombie.scripting.itemConfig")> itemConfigs
  + ### entities

    public final zombie.scripting.ScriptBucket<[GameEntityScript](../entity/GameEntityScript.html "class in zombie.scripting.entity")> entities
  + ### xuiConfigScripts

    public final zombie.scripting.ScriptBucket<[XuiConfigScript](XuiConfigScript.html "class in zombie.scripting.objects")> xuiConfigScripts
  + ### xuiLayouts

    public final zombie.scripting.ScriptBucket<[XuiLayoutScript](XuiLayoutScript.html "class in zombie.scripting.objects")> xuiLayouts
  + ### xuiStyles

    public final zombie.scripting.ScriptBucket<[XuiLayoutScript](XuiLayoutScript.html "class in zombie.scripting.objects")> xuiStyles
  + ### xuiDefaultStyles

    public final zombie.scripting.ScriptBucket<[XuiLayoutScript](XuiLayoutScript.html "class in zombie.scripting.objects")> xuiDefaultStyles
  + ### xuiGlobalColors

    public final zombie.scripting.ScriptBucket<[XuiColorsScript](XuiColorsScript.html "class in zombie.scripting.objects")> xuiGlobalColors
  + ### xuiSkinScripts

    public final zombie.scripting.ScriptBucket<[XuiSkinScript](XuiSkinScript.html "class in zombie.scripting.objects")> xuiSkinScripts
  + ### itemFilters

    public final zombie.scripting.ScriptBucket<[ItemFilterScript](ItemFilterScript.html "class in zombie.scripting.objects")> itemFilters
  + ### fluidFilters

    public final zombie.scripting.ScriptBucket<[FluidFilterScript](FluidFilterScript.html "class in zombie.scripting.objects")> fluidFilters
  + ### craftRecipes

    public final zombie.scripting.ScriptBucket<[CraftRecipe](../entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> craftRecipes
  + ### stringLists

    public final zombie.scripting.ScriptBucket<[StringListScript](StringListScript.html "class in zombie.scripting.objects")> stringLists
  + ### energyDefinitionScripts

    public final zombie.scripting.ScriptBucket<[EnergyDefinitionScript](EnergyDefinitionScript.html "class in zombie.scripting.objects")> energyDefinitionScripts
  + ### fluidDefinitionScripts

    public final zombie.scripting.ScriptBucket<[FluidDefinitionScript](FluidDefinitionScript.html "class in zombie.scripting.objects")> fluidDefinitionScripts
  + ### timedActionScripts

    public final zombie.scripting.ScriptBucket<[TimedActionScript](TimedActionScript.html "class in zombie.scripting.objects")> timedActionScripts
  + ### ragdollScripts

    public final zombie.scripting.ScriptBucket<zombie.scripting.objects.RagdollScript> ragdollScripts
  + ### characterTraitScripts

    public final zombie.scripting.ScriptBucket<zombie.scripting.objects.CharacterTraitDefinitionScript> characterTraitScripts
  + ### characterProfessionScripts

    public final zombie.scripting.ScriptBucket<zombie.scripting.objects.CharacterProfessionDefinitionScript> characterProfessionScripts
  + ### physicsHitReactionScripts

    public final zombie.scripting.ScriptBucket<zombie.scripting.objects.PhysicsHitReactionScript> physicsHitReactionScripts
* Constructor Details
  -------------------

  + ### ScriptModule

    public ScriptModule()
* Method Details
  --------------

  + ### addBucket

    private <T extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")>
    zombie.scripting.ScriptBucket<T> addBucket(zombie.scripting.ScriptBucket<T> bucket)
  + ### addBucket

    private <T extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")>
    zombie.scripting.ScriptBucket.Template<T> addBucket(zombie.scripting.ScriptBucket.Template<T> bucket)
  + ### getVehicleTemplate

    public [VehicleTemplate](VehicleTemplate.html "class in zombie.scripting.objects") getVehicleTemplate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getGameEntityTemplate

    public [GameEntityTemplate](../entity/GameEntityTemplate.html "class in zombie.scripting.entity") getGameEntityTemplate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getItem

    public [Item](Item.html "class in zombie.scripting.objects") getItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `getItem` in interface `zombie.scripting.IScriptObjectStore`
  + ### getRecipe

    public [Recipe](Recipe.html "class in zombie.scripting.objects") getRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `getRecipe` in interface `zombie.scripting.IScriptObjectStore`
  + ### getUniqueRecipe

    public [UniqueRecipe](UniqueRecipe.html "class in zombie.scripting.objects") getUniqueRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getEvolvedRecipe

    public [EvolvedRecipe](EvolvedRecipe.html "class in zombie.scripting.objects") getEvolvedRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getFixing

    public [Fixing](Fixing.html "class in zombie.scripting.objects") getFixing([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAnimationsMesh

    public [AnimationsMesh](AnimationsMesh.html "class in zombie.scripting.objects") getAnimationsMesh([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getClockScript

    public zombie.scripting.objects.ClockScript getClockScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getMannequinScript

    public [MannequinScript](MannequinScript.html "class in zombie.scripting.objects") getMannequinScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getModelScript

    public [ModelScript](ModelScript.html "class in zombie.scripting.objects") getModelScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getPhysicsShape

    public [PhysicsShapeScript](PhysicsShapeScript.html "class in zombie.scripting.objects") getPhysicsShape([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getSpriteModel

    public [SpriteModel](../../iso/SpriteModel.html "class in zombie.iso") getSpriteModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getGameSound

    public [GameSoundScript](GameSoundScript.html "class in zombie.scripting.objects") getGameSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getSoundTimeline

    public [SoundTimelineScript](SoundTimelineScript.html "class in zombie.scripting.objects") getSoundTimeline([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getVehicle

    public [VehicleScript](VehicleScript.html "class in zombie.scripting.objects") getVehicle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAnimation

    public [RuntimeAnimationScript](../../core/skinnedmodel/runtime/RuntimeAnimationScript.html "class in zombie.core.skinnedmodel.runtime") getAnimation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getVehicleEngineRPM

    public [VehicleEngineRPM](../../vehicles/VehicleEngineRPM.html "class in zombie.vehicles") getVehicleEngineRPM([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getItemConfig

    public [ItemConfig](../itemConfig/ItemConfig.html "class in zombie.scripting.itemConfig") getItemConfig([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getGameEntityScript

    public [GameEntityScript](../entity/GameEntityScript.html "class in zombie.scripting.entity") getGameEntityScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getXuiConfigScript

    public [XuiConfigScript](XuiConfigScript.html "class in zombie.scripting.objects") getXuiConfigScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getXuiLayout

    public [XuiLayoutScript](XuiLayoutScript.html "class in zombie.scripting.objects") getXuiLayout([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getXuiStyle

    public [XuiLayoutScript](XuiLayoutScript.html "class in zombie.scripting.objects") getXuiStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getXuiDefaultStyle

    public [XuiLayoutScript](XuiLayoutScript.html "class in zombie.scripting.objects") getXuiDefaultStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getXuiGlobalColors

    public [XuiColorsScript](XuiColorsScript.html "class in zombie.scripting.objects") getXuiGlobalColors([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getXuiSkinScript

    public [XuiSkinScript](XuiSkinScript.html "class in zombie.scripting.objects") getXuiSkinScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getItemFilter

    public [ItemFilterScript](ItemFilterScript.html "class in zombie.scripting.objects") getItemFilter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getFluidFilter

    public [FluidFilterScript](FluidFilterScript.html "class in zombie.scripting.objects") getFluidFilter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getCraftRecipe

    public [CraftRecipe](../entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getCraftRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getStringList

    public [StringListScript](StringListScript.html "class in zombie.scripting.objects") getStringList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getEnergyDefinitionScript

    public [EnergyDefinitionScript](EnergyDefinitionScript.html "class in zombie.scripting.objects") getEnergyDefinitionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getFluidDefinitionScript

    public [FluidDefinitionScript](FluidDefinitionScript.html "class in zombie.scripting.objects") getFluidDefinitionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getTimedActionScript

    public [TimedActionScript](TimedActionScript.html "class in zombie.scripting.objects") getTimedActionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getRagdollScript

    public zombie.scripting.objects.RagdollScript getRagdollScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getCharacterTraitScript

    public zombie.scripting.objects.CharacterTraitDefinitionScript getCharacterTraitScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getCharacterProfessionScript

    public zombie.scripting.objects.CharacterProfessionDefinitionScript getCharacterProfessionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getPhysicsHitReactionScript

    public zombie.scripting.objects.PhysicsHitReactionScript getPhysicsHitReactionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### Load

    public void Load(zombie.scripting.ScriptLoadMode loadMode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") strArray)
  + ### ParseScriptPP

    public void ParseScriptPP(zombie.scripting.ScriptLoadMode loadMode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
  + ### GetTokenType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetTokenType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") token)
  + ### CreateFromTokenPP

    private void CreateFromTokenPP(zombie.scripting.ScriptLoadMode loadMode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") token)
  + ### CheckExitPoints

    public boolean CheckExitPoints()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### Reset

    public void Reset()