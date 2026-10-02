[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.scripting](package-summary.html)
2. [ScriptManager](ScriptManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [debugTypes](#debugTypes)
   3. [currentFileName](#currentFileName)
   4. [loadFileNames](#loadFileNames)
   5. [moduleMap](#moduleMap)
   6. [moduleList](#moduleList)
   7. [currentLoadingModule](#currentLoadingModule)
   8. [moduleAliases](#moduleAliases)
   9. [buf](#buf)
   10. [cachedModules](#cachedModules)
   11. [tagToItemMap](#tagToItemMap)
   12. [typeToItemMap](#typeToItemMap)
   13. [clothingToItemMap](#clothingToItemMap)
   14. [visualDamagesList](#visualDamagesList)
   15. [bucketCollectionList](#bucketCollectionList)
   16. [bucketCollectionMap](#bucketCollectionMap)
   17. [hasLoadErrors](#hasLoadErrors)
   18. [vehicleTemplates](#vehicleTemplates)
   19. [entityTemplates](#entityTemplates)
   20. [items](#items)
   21. [recipes](#recipes)
   22. [uniqueRecipes](#uniqueRecipes)
   23. [uniqueRecipeTempStack](#uniqueRecipeTempStack)
   24. [evolvedRecipes](#evolvedRecipes)
   25. [evolvedRecipeTempStack](#evolvedRecipeTempStack)
   26. [fixings](#fixings)
   27. [animationMeshes](#animationMeshes)
   28. [clocks](#clocks)
   29. [mannequins](#mannequins)
   30. [models](#models)
   31. [physicsShapes](#physicsShapes)
   32. [gameSounds](#gameSounds)
   33. [soundTimelines](#soundTimelines)
   34. [spriteModels](#spriteModels)
   35. [vehicles](#vehicles)
   36. [animations](#animations)
   37. [vehicleEngineRpms](#vehicleEngineRpms)
   38. [itemConfigs](#itemConfigs)
   39. [entities](#entities)
   40. [xuiConfigScripts](#xuiConfigScripts)
   41. [xuiLayouts](#xuiLayouts)
   42. [xuiStyles](#xuiStyles)
   43. [xuiDefaultStyles](#xuiDefaultStyles)
   44. [xuiGlobalColors](#xuiGlobalColors)
   45. [xuiSkinScripts](#xuiSkinScripts)
   46. [itemFilters](#itemFilters)
   47. [fluidFilters](#fluidFilters)
   48. [craftRecipes](#craftRecipes)
   49. [stringLists](#stringLists)
   50. [energyDefinitionScripts](#energyDefinitionScripts)
   51. [fluidDefinitionScripts](#fluidDefinitionScripts)
   52. [timedActionScripts](#timedActionScripts)
   53. [ragdollScripts](#ragdollScripts)
   54. [physicsHitReactionScripts](#physicsHitReactionScripts)
   55. [characterTraitScripts](#characterTraitScripts)
   56. [characterProfessionScripts](#characterProfessionScripts)
   57. [Base](#Base)
   58. [Base\_Module](#Base_Module)
   59. [checksum](#checksum)
   60. [tempFileToModMap](#tempFileToModMap)
   61. [currentLoadFileMod](#currentLoadFileMod)
   62. [currentLoadFileAbsPath](#currentLoadFileAbsPath)
   63. [currentLoadFileName](#currentLoadFileName)
   64. [VanillaID](#VanillaID)
6. [Constructor Details](#constructor-detail)
   1. [ScriptManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [EnableDebug(ScriptType, boolean)](#EnableDebug(zombie.scripting.ScriptType,boolean))
   2. [isDebugEnabled(ScriptType)](#isDebugEnabled(zombie.scripting.ScriptType))
   3. [println(ScriptType, String)](#println(zombie.scripting.ScriptType,java.lang.String))
   4. [println(BaseScriptObject, String)](#println(zombie.scripting.objects.BaseScriptObject,java.lang.String))
   5. [addBucketCollection(ScriptBucketCollection)](#addBucketCollection(zombie.scripting.ScriptBucketCollection))
   6. [getScriptsForType(ScriptType)](#getScriptsForType(zombie.scripting.ScriptType))
   7. [getVehicleTemplate(String)](#getVehicleTemplate(java.lang.String))
   8. [getAllVehicleTemplates()](#getAllVehicleTemplates())
   9. [getGameEntityTemplate(String)](#getGameEntityTemplate(java.lang.String))
   10. [getAllGameEntityTemplates()](#getAllGameEntityTemplates())
   11. [getItem(String)](#getItem(java.lang.String))
   12. [getAllItems()](#getAllItems())
   13. [getRecipe(String)](#getRecipe(java.lang.String))
   14. [getAllRecipes()](#getAllRecipes())
   15. [getUniqueRecipe(String)](#getUniqueRecipe(java.lang.String))
   16. [getAllUniqueRecipes()](#getAllUniqueRecipes())
   17. [getEvolvedRecipe(String)](#getEvolvedRecipe(java.lang.String))
   18. [getAllEvolvedRecipesList()](#getAllEvolvedRecipesList())
   19. [getAllEvolvedRecipes()](#getAllEvolvedRecipes())
   20. [getFixing(String)](#getFixing(java.lang.String))
   21. [getAllFixing(ArrayList)](#getAllFixing(java.util.ArrayList))
   22. [getAnimationsMesh(String)](#getAnimationsMesh(java.lang.String))
   23. [getAllAnimationsMeshes()](#getAllAnimationsMeshes())
   24. [getClockScript(String)](#getClockScript(java.lang.String))
   25. [getAllClockScripts()](#getAllClockScripts())
   26. [getMannequinScript(String)](#getMannequinScript(java.lang.String))
   27. [getAllMannequinScripts()](#getAllMannequinScripts())
   28. [getModelScript(String)](#getModelScript(java.lang.String))
   29. [getAllModelScripts()](#getAllModelScripts())
   30. [addModelScript(ModelScript)](#addModelScript(zombie.scripting.objects.ModelScript))
   31. [getPhysicsShape(String)](#getPhysicsShape(java.lang.String))
   32. [getAllPhysicsShapes()](#getAllPhysicsShapes())
   33. [getGameSound(String)](#getGameSound(java.lang.String))
   34. [getAllGameSounds()](#getAllGameSounds())
   35. [getSoundTimeline(String)](#getSoundTimeline(java.lang.String))
   36. [getAllSoundTimelines()](#getAllSoundTimelines())
   37. [getSpriteModel(String)](#getSpriteModel(java.lang.String))
   38. [getAllSpriteModels()](#getAllSpriteModels())
   39. [addSpriteModel(SpriteModel)](#addSpriteModel(zombie.iso.SpriteModel))
   40. [getVehicle(String)](#getVehicle(java.lang.String))
   41. [getAllVehicleScripts()](#getAllVehicleScripts())
   42. [getRandomVehicleScript()](#getRandomVehicleScript())
   43. [getRuntimeAnimationScript(String)](#getRuntimeAnimationScript(java.lang.String))
   44. [getAllRuntimeAnimationScripts()](#getAllRuntimeAnimationScripts())
   45. [getVehicleEngineRPM(String)](#getVehicleEngineRPM(java.lang.String))
   46. [getAllVehicleEngineRPMs()](#getAllVehicleEngineRPMs())
   47. [getItemConfig(String)](#getItemConfig(java.lang.String))
   48. [getAllItemConfigs()](#getAllItemConfigs())
   49. [getGameEntityScript(String)](#getGameEntityScript(java.lang.String))
   50. [getAllGameEntities()](#getAllGameEntities())
   51. [getAllBuildableRecipes()](#getAllBuildableRecipes())
   52. [getBuildableRecipe(String)](#getBuildableRecipe(java.lang.String))
   53. [getXuiConfigScript(String)](#getXuiConfigScript(java.lang.String))
   54. [getAllXuiConfigScripts()](#getAllXuiConfigScripts())
   55. [getXuiLayout(String)](#getXuiLayout(java.lang.String))
   56. [getAllXuiLayouts()](#getAllXuiLayouts())
   57. [getXuiStyle(String)](#getXuiStyle(java.lang.String))
   58. [getAllXuiStyles()](#getAllXuiStyles())
   59. [getXuiDefaultStyle(String)](#getXuiDefaultStyle(java.lang.String))
   60. [getAllXuiDefaultStyles()](#getAllXuiDefaultStyles())
   61. [getXuiColor(String)](#getXuiColor(java.lang.String))
   62. [getAllXuiColors()](#getAllXuiColors())
   63. [getXuiSkinScript(String)](#getXuiSkinScript(java.lang.String))
   64. [getAllXuiSkinScripts()](#getAllXuiSkinScripts())
   65. [getItemFilter(String)](#getItemFilter(java.lang.String))
   66. [getAllItemFilters()](#getAllItemFilters())
   67. [getFluidFilter(String)](#getFluidFilter(java.lang.String))
   68. [getAllFluidFilters()](#getAllFluidFilters())
   69. [getCraftRecipe(String)](#getCraftRecipe(java.lang.String))
   70. [getAllCraftRecipes()](#getAllCraftRecipes())
   71. [VerifyAllCraftRecipesAreLearnable()](#VerifyAllCraftRecipesAreLearnable())
   72. [checkAutoLearn(IsoGameCharacter)](#checkAutoLearn(zombie.characters.IsoGameCharacter))
   73. [checkMetaRecipes(IsoGameCharacter)](#checkMetaRecipes(zombie.characters.IsoGameCharacter))
   74. [checkMetaRecipe(IsoGameCharacter, String)](#checkMetaRecipe(zombie.characters.IsoGameCharacter,java.lang.String))
   75. [getStringList(String)](#getStringList(java.lang.String))
   76. [getAllStringLists()](#getAllStringLists())
   77. [getEnergyDefinitionScript(String)](#getEnergyDefinitionScript(java.lang.String))
   78. [getAllEnergyDefinitionScripts()](#getAllEnergyDefinitionScripts())
   79. [getFluidDefinitionScript(String)](#getFluidDefinitionScript(java.lang.String))
   80. [getAllFluidDefinitionScripts()](#getAllFluidDefinitionScripts())
   81. [getTimedActionScript(String)](#getTimedActionScript(java.lang.String))
   82. [getAllTimedActionScripts()](#getAllTimedActionScripts())
   83. [getRagdollScript(String)](#getRagdollScript(java.lang.String))
   84. [getPhysicsHitReactionScript(String)](#getPhysicsHitReactionScript(java.lang.String))
   85. [getCharacterTraitScript(String)](#getCharacterTraitScript(java.lang.String))
   86. [getCharacterProfessionScript(String)](#getCharacterProfessionScript(java.lang.String))
   87. [update()](#update())
   88. [LoadFile(ScriptLoadMode, String, boolean)](#LoadFile(zombie.scripting.ScriptLoadMode,java.lang.String,boolean))
   89. [registerLoadFileName(String)](#registerLoadFileName(java.lang.String))
   90. [ParseScript(ScriptLoadMode, String)](#ParseScript(zombie.scripting.ScriptLoadMode,java.lang.String))
   91. [CreateFromToken(ScriptLoadMode, String)](#CreateFromToken(zombie.scripting.ScriptLoadMode,java.lang.String))
   92. [searchFolders(URI, File, ArrayList)](#searchFolders(java.net.URI,java.io.File,java.util.ArrayList))
   93. [getItemName(String)](#getItemName(java.lang.String))
   94. [getModule(String)](#getModule(java.lang.String))
   95. [getModule(String, boolean)](#getModule(java.lang.String,boolean))
   96. [getModuleNoDisableCheck(String)](#getModuleNoDisableCheck(java.lang.String))
   97. [FindItem(String)](#FindItem(java.lang.String))
   98. [FindItem(String, boolean)](#FindItem(java.lang.String,boolean))
   99. [isDrainableItemType(String)](#isDrainableItemType(java.lang.String))
   100. [CheckExitPoints()](#CheckExitPoints())
   101. [getAllItemsWithTag(ItemTag)](#getAllItemsWithTag(zombie.scripting.objects.ItemTag))
   102. [getItemsTag(ItemTag)](#getItemsTag(zombie.scripting.objects.ItemTag))
   103. [getItemsByType(String)](#getItemsByType(java.lang.String))
   104. [Reset()](#Reset())
   105. [getChecksum()](#getChecksum())
   106. [getCurrentLoadFileMod()](#getCurrentLoadFileMod())
   107. [getCurrentLoadFileAbsPath()](#getCurrentLoadFileAbsPath())
   108. [getCurrentLoadFileName()](#getCurrentLoadFileName())
   109. [Load()](#Load())
   110. [ReloadScripts(ScriptType)](#ReloadScripts(zombie.scripting.ScriptType))
   111. [ReloadScripts(EnumSet)](#ReloadScripts(java.util.EnumSet))
   112. [loadScripts(ScriptLoadMode, EnumSet)](#loadScripts(zombie.scripting.ScriptLoadMode,java.util.EnumSet))
   113. [LoadedAfterLua()](#LoadedAfterLua())
   114. [PostTileDefinitions()](#PostTileDefinitions())
   115. [PostWorldDictionaryInit()](#PostWorldDictionaryInit())
   116. [hasLoadErrors()](#hasLoadErrors())
   117. [hasLoadErrors(boolean)](#hasLoadErrors(boolean))
   118. [resolveGetItemTypes(ArrayList, ArrayList)](#resolveGetItemTypes(java.util.ArrayList,java.util.ArrayList))
   119. [debugItems()](#debugItems())
   120. [getAllRecipesFor(String)](#getAllRecipesFor(java.lang.String))
   121. [getItemTypeForClothingItem(String)](#getItemTypeForClothingItem(java.lang.String))
   122. [getItemForClothingItem(String)](#getItemForClothingItem(java.lang.String))
   123. [createZedDmgMap()](#createZedDmgMap())
   124. [getZedDmgMap()](#getZedDmgMap())
   125. [createClothingItemMap()](#createClothingItemMap())
   126. [resolveItemTypes()](#resolveItemTypes())
   127. [resolveItemType(ScriptModule, String)](#resolveItemType(zombie.scripting.objects.ScriptModule,java.lang.String))
   128. [resolveModelScript(ScriptModule, String)](#resolveModelScript(zombie.scripting.objects.ScriptModule,java.lang.String))
   129. [getSpecificItem(String)](#getSpecificItem(java.lang.String))
   130. [getSpecificEntity(String)](#getSpecificEntity(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ScriptManager
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ScriptManager

All Implemented Interfaces:
:   `zombie.scripting.IScriptObjectStore`

---

public final class ScriptManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.scripting.IScriptObjectStore

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.scripting.ScriptBucketCollection<AnimationsMesh>`

  `animationMeshes`

  `private final zombie.scripting.ScriptBucketCollection<RuntimeAnimationScript>`

  `animations`

  `static final String`

  `Base`

  `static final String`

  `Base_Module`

  `private final ArrayList<zombie.scripting.ScriptBucketCollection<?>>`

  `bucketCollectionList`

  `private final HashMap<ScriptType, zombie.scripting.ScriptBucketCollection<?>>`

  `bucketCollectionMap`

  `private final StringBuilder`

  `buf`

  `private final HashMap<String, ScriptModule>`

  `cachedModules`

  `private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.CharacterProfessionDefinitionScript>`

  `characterProfessionScripts`

  `private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.CharacterTraitDefinitionScript>`

  `characterTraitScripts`

  `private String`

  `checksum`

  `private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.ClockScript>`

  `clocks`

  `private final HashMap<String,String>`

  `clothingToItemMap`

  `private final zombie.scripting.ScriptBucketCollection<CraftRecipe>`

  `craftRecipes`

  `String`

  `currentFileName`

  `private static String`

  `currentLoadFileAbsPath`

  `private static String`

  `currentLoadFileMod`

  `private static String`

  `currentLoadFileName`

  `ScriptModule`

  `currentLoadingModule`

  `private static final EnumSet<ScriptType>`

  `debugTypes`

  `private final zombie.scripting.ScriptBucketCollection<EnergyDefinitionScript>`

  `energyDefinitionScripts`

  `private final zombie.scripting.ScriptBucketCollection<GameEntityScript>`

  `entities`

  `private final zombie.scripting.ScriptBucketCollection<GameEntityTemplate>`

  `entityTemplates`

  `private final zombie.scripting.ScriptBucketCollection<EvolvedRecipe>`

  `evolvedRecipes`

  `private final Stack<EvolvedRecipe>`

  `evolvedRecipeTempStack`

  `private final zombie.scripting.ScriptBucketCollection<Fixing>`

  `fixings`

  `private final zombie.scripting.ScriptBucketCollection<FluidDefinitionScript>`

  `fluidDefinitionScripts`

  `private final zombie.scripting.ScriptBucketCollection<FluidFilterScript>`

  `fluidFilters`

  `private final zombie.scripting.ScriptBucketCollection<GameSoundScript>`

  `gameSounds`

  `private boolean`

  `hasLoadErrors`

  `static final ScriptManager`

  `instance`

  `private final zombie.scripting.ScriptBucketCollection<ItemConfig>`

  `itemConfigs`

  `private final zombie.scripting.ScriptBucketCollection<ItemFilterScript>`

  `itemFilters`

  `private final zombie.scripting.ScriptBucketCollection<Item>`

  `items`

  `private final ArrayList<String>`

  `loadFileNames`

  `private final zombie.scripting.ScriptBucketCollection<MannequinScript>`

  `mannequins`

  `private final zombie.scripting.ScriptBucketCollection<ModelScript>`

  `models`

  `private final HashMap<String,String>`

  `moduleAliases`

  `final ArrayList<ScriptModule>`

  `moduleList`

  `final HashMap<String, ScriptModule>`

  `moduleMap`

  `private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.PhysicsHitReactionScript>`

  `physicsHitReactionScripts`

  `private final zombie.scripting.ScriptBucketCollection<PhysicsShapeScript>`

  `physicsShapes`

  `private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.RagdollScript>`

  `ragdollScripts`

  `private final zombie.scripting.ScriptBucketCollection<Recipe>`

  `recipes`

  `private final zombie.scripting.ScriptBucketCollection<SoundTimelineScript>`

  `soundTimelines`

  `private final zombie.scripting.ScriptBucketCollection<SpriteModel>`

  `spriteModels`

  `private final zombie.scripting.ScriptBucketCollection<StringListScript>`

  `stringLists`

  `private final HashMap<ItemTag, ArrayList<Item>>`

  `tagToItemMap`

  `private HashMap<String,String>`

  `tempFileToModMap`

  `private final zombie.scripting.ScriptBucketCollection<TimedActionScript>`

  `timedActionScripts`

  `private final HashMap<String, ArrayList<Item>>`

  `typeToItemMap`

  `private final zombie.scripting.ScriptBucketCollection<UniqueRecipe>`

  `uniqueRecipes`

  `private final Stack<UniqueRecipe>`

  `uniqueRecipeTempStack`

  `static final String`

  `VanillaID`

  `private final zombie.scripting.ScriptBucketCollection<VehicleEngineRPM>`

  `vehicleEngineRpms`

  `private final zombie.scripting.ScriptBucketCollection<VehicleScript>`

  `vehicles`

  `private final zombie.scripting.ScriptBucketCollection<VehicleTemplate>`

  `vehicleTemplates`

  `private final ArrayList<String>`

  `visualDamagesList`

  `private final zombie.scripting.ScriptBucketCollection<XuiConfigScript>`

  `xuiConfigScripts`

  `private final zombie.scripting.ScriptBucketCollection<XuiLayoutScript>`

  `xuiDefaultStyles`

  `private final zombie.scripting.ScriptBucketCollection<XuiColorsScript>`

  `xuiGlobalColors`

  `private final zombie.scripting.ScriptBucketCollection<XuiLayoutScript>`

  `xuiLayouts`

  `private final zombie.scripting.ScriptBucketCollection<XuiSkinScript>`

  `xuiSkinScripts`

  `private final zombie.scripting.ScriptBucketCollection<XuiLayoutScript>`

  `xuiStyles`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ScriptManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private <T extends BaseScriptObject>  
  zombie.scripting.ScriptBucketCollection<T>`

  `addBucketCollection(zombie.scripting.ScriptBucketCollection<T> collection)`

  `void`

  `addModelScript(ModelScript modelScript)`

  `void`

  `addSpriteModel(SpriteModel spriteModel)`

  `void`

  `checkAutoLearn(IsoGameCharacter chr)`

  `void`

  `CheckExitPoints()`

  `void`

  `checkMetaRecipe(IsoGameCharacter chr,
  String checkRecipe)`

  `void`

  `checkMetaRecipes(IsoGameCharacter chr)`

  `private void`

  `createClothingItemMap()`

  `private void`

  `CreateFromToken(zombie.scripting.ScriptLoadMode loadMode,
  String token)`

  `private void`

  `createZedDmgMap()`

  `private void`

  `debugItems()`

  `static void`

  `EnableDebug(ScriptType type,
  boolean enable)`

  You can enable additional debug info by using a debuglog.cfg (not .ini) by adding:
  +Script.Item
  +Script.Recipe
  etc.

  `Item`

  `FindItem(String name)`

  `Item`

  `FindItem(String name,
  boolean moduleDefaultsToBase)`

  `ArrayList<AnimationsMesh>`

  `getAllAnimationsMeshes()`

  `ArrayList<CraftRecipe>`

  `getAllBuildableRecipes()`

  `ArrayList<zombie.scripting.objects.ClockScript>`

  `getAllClockScripts()`

  `ArrayList<CraftRecipe>`

  `getAllCraftRecipes()`

  `ArrayList<EnergyDefinitionScript>`

  `getAllEnergyDefinitionScripts()`

  `Stack<EvolvedRecipe>`

  `getAllEvolvedRecipes()`

  `ArrayList<EvolvedRecipe>`

  `getAllEvolvedRecipesList()`

  `ArrayList<Fixing>`

  `getAllFixing(ArrayList<Fixing> result)`

  `ArrayList<FluidDefinitionScript>`

  `getAllFluidDefinitionScripts()`

  `ArrayList<FluidFilterScript>`

  `getAllFluidFilters()`

  `ArrayList<GameEntityScript>`

  `getAllGameEntities()`

  `ArrayList<GameEntityTemplate>`

  `getAllGameEntityTemplates()`

  `ArrayList<GameSoundScript>`

  `getAllGameSounds()`

  `ArrayList<ItemConfig>`

  `getAllItemConfigs()`

  `ArrayList<ItemFilterScript>`

  `getAllItemFilters()`

  `ArrayList<Item>`

  `getAllItems()`

  `private ArrayList<Item>`

  `getAllItemsWithTag(ItemTag itemTag)`

  `ArrayList<MannequinScript>`

  `getAllMannequinScripts()`

  `ArrayList<ModelScript>`

  `getAllModelScripts()`

  `ArrayList<PhysicsShapeScript>`

  `getAllPhysicsShapes()`

  `ArrayList<Recipe>`

  `getAllRecipes()`

  `ArrayList<Recipe>`

  `getAllRecipesFor(String result)`

  `ArrayList<RuntimeAnimationScript>`

  `getAllRuntimeAnimationScripts()`

  `ArrayList<SoundTimelineScript>`

  `getAllSoundTimelines()`

  `ArrayList<SpriteModel>`

  `getAllSpriteModels()`

  `ArrayList<StringListScript>`

  `getAllStringLists()`

  `ArrayList<TimedActionScript>`

  `getAllTimedActionScripts()`

  `Stack<UniqueRecipe>`

  `getAllUniqueRecipes()`

  `ArrayList<VehicleEngineRPM>`

  `getAllVehicleEngineRPMs()`

  `ArrayList<VehicleScript>`

  `getAllVehicleScripts()`

  `ArrayList<VehicleTemplate>`

  `getAllVehicleTemplates()`

  `ArrayList<XuiColorsScript>`

  `getAllXuiColors()`

  `ArrayList<XuiConfigScript>`

  `getAllXuiConfigScripts()`

  `ArrayList<XuiLayoutScript>`

  `getAllXuiDefaultStyles()`

  `ArrayList<XuiLayoutScript>`

  `getAllXuiLayouts()`

  `ArrayList<XuiSkinScript>`

  `getAllXuiSkinScripts()`

  `ArrayList<XuiLayoutScript>`

  `getAllXuiStyles()`

  `AnimationsMesh`

  `getAnimationsMesh(String name)`

  `CraftRecipe`

  `getBuildableRecipe(String recipe)`

  `zombie.scripting.objects.CharacterProfessionDefinitionScript`

  `getCharacterProfessionScript(String name)`

  `zombie.scripting.objects.CharacterTraitDefinitionScript`

  `getCharacterTraitScript(String name)`

  `String`

  `getChecksum()`

  `zombie.scripting.objects.ClockScript`

  `getClockScript(String name)`

  `CraftRecipe`

  `getCraftRecipe(String name)`

  `static String`

  `getCurrentLoadFileAbsPath()`

  `static String`

  `getCurrentLoadFileMod()`

  `static String`

  `getCurrentLoadFileName()`

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

  `Item`

  `getItemForClothingItem(String clothingName)`

  `static String`

  `getItemName(String name)`

  `ArrayList<Item>`

  `getItemsByType(String type)`

  `ArrayList<Item>`

  `getItemsTag(ItemTag itemTag)`

  `String`

  `getItemTypeForClothingItem(String clothingItem)`

  `MannequinScript`

  `getMannequinScript(String name)`

  `ModelScript`

  `getModelScript(String name)`

  `ScriptModule`

  `getModule(String name)`

  `ScriptModule`

  `getModule(String name,
  boolean defaultToBase)`

  `ScriptModule`

  `getModuleNoDisableCheck(String name)`

  `zombie.scripting.objects.PhysicsHitReactionScript`

  `getPhysicsHitReactionScript(String name)`

  `PhysicsShapeScript`

  `getPhysicsShape(String name)`

  `zombie.scripting.objects.RagdollScript`

  `getRagdollScript(String name)`

  `VehicleScript`

  `getRandomVehicleScript()`

  `Recipe`

  `getRecipe(String name)`

  `RuntimeAnimationScript`

  `getRuntimeAnimationScript(String name)`

  `ArrayList<?>`

  `getScriptsForType(ScriptType type)`

  `SoundTimelineScript`

  `getSoundTimeline(String name)`

  `GameEntityScript`

  `getSpecificEntity(String name)`

  `Item`

  `getSpecificItem(String name)`

  `SpriteModel`

  `getSpriteModel(String name)`

  `StringListScript`

  `getStringList(String name)`

  `TimedActionScript`

  `getTimedActionScript(String name)`

  `UniqueRecipe`

  `getUniqueRecipe(String name)`

  `VehicleScript`

  `getVehicle(String name)`

  `VehicleEngineRPM`

  `getVehicleEngineRPM(String name)`

  `VehicleTemplate`

  `getVehicleTemplate(String name)`

  `XuiColorsScript`

  `getXuiColor(String name)`

  `XuiConfigScript`

  `getXuiConfigScript(String name)`

  `XuiLayoutScript`

  `getXuiDefaultStyle(String name)`

  `XuiLayoutScript`

  `getXuiLayout(String name)`

  `XuiSkinScript`

  `getXuiSkinScript(String name)`

  `XuiLayoutScript`

  `getXuiStyle(String name)`

  `ArrayList<String>`

  `getZedDmgMap()`

  `boolean`

  `hasLoadErrors()`

  `boolean`

  `hasLoadErrors(boolean onlyCritical)`

  `static boolean`

  `isDebugEnabled(ScriptType type)`

  `boolean`

  `isDrainableItemType(String itemType)`

  `void`

  `Load()`

  `void`

  `LoadedAfterLua()`

  `void`

  `LoadFile(zombie.scripting.ScriptLoadMode loadMode,
  String filename,
  boolean bLoadJar)`

  `private void`

  `loadScripts(zombie.scripting.ScriptLoadMode loadMode,
  EnumSet<ScriptType> toLoadTypes)`

  `void`

  `ParseScript(zombie.scripting.ScriptLoadMode loadMode,
  String totalFile)`

  `void`

  `PostTileDefinitions()`

  `void`

  `PostWorldDictionaryInit()`

  `static void`

  `println(BaseScriptObject scriptObject,
  String msg)`

  `static void`

  `println(ScriptType type,
  String msg)`

  `private void`

  `registerLoadFileName(String name)`

  `void`

  `ReloadScripts(EnumSet<ScriptType> types)`

  `void`

  `ReloadScripts(ScriptType type)`

  `void`

  `Reset()`

  `static void`

  `resolveGetItemTypes(ArrayList<String> sourceItems,
  ArrayList<Item> scriptItems)`

  `String`

  `resolveItemType(ScriptModule module,
  String itemType)`

  `private void`

  `resolveItemTypes()`

  `String`

  `resolveModelScript(ScriptModule module,
  String modelScriptName)`

  `void`

  `searchFolders(URI base,
  File fo,
  ArrayList<String> loadList)`

  `void`

  `update()`

  `void`

  `VerifyAllCraftRecipesAreLearnable()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [ScriptManager](ScriptManager.html "class in zombie.scripting") instance
  + ### debugTypes

    private static final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[ScriptType](ScriptType.html "enum class in zombie.scripting")> debugTypes
  + ### currentFileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentFileName
  + ### loadFileNames

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadFileNames
  + ### moduleMap

    public final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ScriptModule](objects/ScriptModule.html "class in zombie.scripting.objects")> moduleMap
  + ### moduleList

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ScriptModule](objects/ScriptModule.html "class in zombie.scripting.objects")> moduleList
  + ### currentLoadingModule

    public [ScriptModule](objects/ScriptModule.html "class in zombie.scripting.objects") currentLoadingModule
  + ### moduleAliases

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> moduleAliases
  + ### buf

    private final [StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") buf
  + ### cachedModules

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ScriptModule](objects/ScriptModule.html "class in zombie.scripting.objects")> cachedModules
  + ### tagToItemMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[ItemTag](objects/ItemTag.html "class in zombie.scripting.objects"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](objects/Item.html "class in zombie.scripting.objects")>> tagToItemMap
  + ### typeToItemMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](objects/Item.html "class in zombie.scripting.objects")>> typeToItemMap
  + ### clothingToItemMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> clothingToItemMap
  + ### visualDamagesList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> visualDamagesList
  + ### bucketCollectionList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.scripting.ScriptBucketCollection<?>> bucketCollectionList
  + ### bucketCollectionMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[ScriptType](ScriptType.html "enum class in zombie.scripting"), zombie.scripting.ScriptBucketCollection<?>> bucketCollectionMap
  + ### hasLoadErrors

    private boolean hasLoadErrors
  + ### vehicleTemplates

    private final zombie.scripting.ScriptBucketCollection<[VehicleTemplate](objects/VehicleTemplate.html "class in zombie.scripting.objects")> vehicleTemplates
  + ### entityTemplates

    private final zombie.scripting.ScriptBucketCollection<[GameEntityTemplate](entity/GameEntityTemplate.html "class in zombie.scripting.entity")> entityTemplates
  + ### items

    private final zombie.scripting.ScriptBucketCollection<[Item](objects/Item.html "class in zombie.scripting.objects")> items
  + ### recipes

    private final zombie.scripting.ScriptBucketCollection<[Recipe](objects/Recipe.html "class in zombie.scripting.objects")> recipes
  + ### uniqueRecipes

    private final zombie.scripting.ScriptBucketCollection<[UniqueRecipe](objects/UniqueRecipe.html "class in zombie.scripting.objects")> uniqueRecipes
  + ### uniqueRecipeTempStack

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[UniqueRecipe](objects/UniqueRecipe.html "class in zombie.scripting.objects")> uniqueRecipeTempStack
  + ### evolvedRecipes

    private final zombie.scripting.ScriptBucketCollection<[EvolvedRecipe](objects/EvolvedRecipe.html "class in zombie.scripting.objects")> evolvedRecipes
  + ### evolvedRecipeTempStack

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[EvolvedRecipe](objects/EvolvedRecipe.html "class in zombie.scripting.objects")> evolvedRecipeTempStack
  + ### fixings

    private final zombie.scripting.ScriptBucketCollection<[Fixing](objects/Fixing.html "class in zombie.scripting.objects")> fixings
  + ### animationMeshes

    private final zombie.scripting.ScriptBucketCollection<[AnimationsMesh](objects/AnimationsMesh.html "class in zombie.scripting.objects")> animationMeshes
  + ### clocks

    private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.ClockScript> clocks
  + ### mannequins

    private final zombie.scripting.ScriptBucketCollection<[MannequinScript](objects/MannequinScript.html "class in zombie.scripting.objects")> mannequins
  + ### models

    private final zombie.scripting.ScriptBucketCollection<[ModelScript](objects/ModelScript.html "class in zombie.scripting.objects")> models
  + ### physicsShapes

    private final zombie.scripting.ScriptBucketCollection<[PhysicsShapeScript](objects/PhysicsShapeScript.html "class in zombie.scripting.objects")> physicsShapes
  + ### gameSounds

    private final zombie.scripting.ScriptBucketCollection<[GameSoundScript](objects/GameSoundScript.html "class in zombie.scripting.objects")> gameSounds
  + ### soundTimelines

    private final zombie.scripting.ScriptBucketCollection<[SoundTimelineScript](objects/SoundTimelineScript.html "class in zombie.scripting.objects")> soundTimelines
  + ### spriteModels

    private final zombie.scripting.ScriptBucketCollection<[SpriteModel](../iso/SpriteModel.html "class in zombie.iso")> spriteModels
  + ### vehicles

    private final zombie.scripting.ScriptBucketCollection<[VehicleScript](objects/VehicleScript.html "class in zombie.scripting.objects")> vehicles
  + ### animations

    private final zombie.scripting.ScriptBucketCollection<[RuntimeAnimationScript](../core/skinnedmodel/runtime/RuntimeAnimationScript.html "class in zombie.core.skinnedmodel.runtime")> animations
  + ### vehicleEngineRpms

    private final zombie.scripting.ScriptBucketCollection<[VehicleEngineRPM](../vehicles/VehicleEngineRPM.html "class in zombie.vehicles")> vehicleEngineRpms
  + ### itemConfigs

    private final zombie.scripting.ScriptBucketCollection<[ItemConfig](itemConfig/ItemConfig.html "class in zombie.scripting.itemConfig")> itemConfigs
  + ### entities

    private final zombie.scripting.ScriptBucketCollection<[GameEntityScript](entity/GameEntityScript.html "class in zombie.scripting.entity")> entities
  + ### xuiConfigScripts

    private final zombie.scripting.ScriptBucketCollection<[XuiConfigScript](objects/XuiConfigScript.html "class in zombie.scripting.objects")> xuiConfigScripts
  + ### xuiLayouts

    private final zombie.scripting.ScriptBucketCollection<[XuiLayoutScript](objects/XuiLayoutScript.html "class in zombie.scripting.objects")> xuiLayouts
  + ### xuiStyles

    private final zombie.scripting.ScriptBucketCollection<[XuiLayoutScript](objects/XuiLayoutScript.html "class in zombie.scripting.objects")> xuiStyles
  + ### xuiDefaultStyles

    private final zombie.scripting.ScriptBucketCollection<[XuiLayoutScript](objects/XuiLayoutScript.html "class in zombie.scripting.objects")> xuiDefaultStyles
  + ### xuiGlobalColors

    private final zombie.scripting.ScriptBucketCollection<[XuiColorsScript](objects/XuiColorsScript.html "class in zombie.scripting.objects")> xuiGlobalColors
  + ### xuiSkinScripts

    private final zombie.scripting.ScriptBucketCollection<[XuiSkinScript](objects/XuiSkinScript.html "class in zombie.scripting.objects")> xuiSkinScripts
  + ### itemFilters

    private final zombie.scripting.ScriptBucketCollection<[ItemFilterScript](objects/ItemFilterScript.html "class in zombie.scripting.objects")> itemFilters
  + ### fluidFilters

    private final zombie.scripting.ScriptBucketCollection<[FluidFilterScript](objects/FluidFilterScript.html "class in zombie.scripting.objects")> fluidFilters
  + ### craftRecipes

    private final zombie.scripting.ScriptBucketCollection<[CraftRecipe](entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> craftRecipes
  + ### stringLists

    private final zombie.scripting.ScriptBucketCollection<[StringListScript](objects/StringListScript.html "class in zombie.scripting.objects")> stringLists
  + ### energyDefinitionScripts

    private final zombie.scripting.ScriptBucketCollection<[EnergyDefinitionScript](objects/EnergyDefinitionScript.html "class in zombie.scripting.objects")> energyDefinitionScripts
  + ### fluidDefinitionScripts

    private final zombie.scripting.ScriptBucketCollection<[FluidDefinitionScript](objects/FluidDefinitionScript.html "class in zombie.scripting.objects")> fluidDefinitionScripts
  + ### timedActionScripts

    private final zombie.scripting.ScriptBucketCollection<[TimedActionScript](objects/TimedActionScript.html "class in zombie.scripting.objects")> timedActionScripts
  + ### ragdollScripts

    private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.RagdollScript> ragdollScripts
  + ### physicsHitReactionScripts

    private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.PhysicsHitReactionScript> physicsHitReactionScripts
  + ### characterTraitScripts

    private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.CharacterTraitDefinitionScript> characterTraitScripts
  + ### characterProfessionScripts

    private final zombie.scripting.ScriptBucketCollection<zombie.scripting.objects.CharacterProfessionDefinitionScript> characterProfessionScripts
  + ### Base

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Base

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.scripting.ScriptManager.Base)
  + ### Base\_Module

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Base\_Module

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.scripting.ScriptManager.Base_Module)
  + ### checksum

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") checksum
  + ### tempFileToModMap

    private [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tempFileToModMap
  + ### currentLoadFileMod

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentLoadFileMod
  + ### currentLoadFileAbsPath

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentLoadFileAbsPath
  + ### currentLoadFileName

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentLoadFileName
  + ### VanillaID

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") VanillaID

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.scripting.ScriptManager.VanillaID)
* Constructor Details
  -------------------

  + ### ScriptManager

    public ScriptManager()
* Method Details
  --------------

  + ### EnableDebug

    public static void EnableDebug([ScriptType](ScriptType.html "enum class in zombie.scripting") type,
    boolean enable)

    You can enable additional debug info by using a debuglog.cfg (not .ini) by adding:
    +Script.Item
    +Script.Recipe
    etc.
    See branch root folder: debug.cfg for example.
  + ### isDebugEnabled

    public static boolean isDebugEnabled([ScriptType](ScriptType.html "enum class in zombie.scripting") type)
  + ### println

    public static void println([ScriptType](ScriptType.html "enum class in zombie.scripting") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### println

    public static void println([BaseScriptObject](objects/BaseScriptObject.html "class in zombie.scripting.objects") scriptObject,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### addBucketCollection

    private <T extends [BaseScriptObject](objects/BaseScriptObject.html "class in zombie.scripting.objects")>
    zombie.scripting.ScriptBucketCollection<T> addBucketCollection(zombie.scripting.ScriptBucketCollection<T> collection)
  + ### getScriptsForType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<?> getScriptsForType([ScriptType](ScriptType.html "enum class in zombie.scripting") type)
  + ### getVehicleTemplate

    public [VehicleTemplate](objects/VehicleTemplate.html "class in zombie.scripting.objects") getVehicleTemplate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllVehicleTemplates

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleTemplate](objects/VehicleTemplate.html "class in zombie.scripting.objects")> getAllVehicleTemplates()
  + ### getGameEntityTemplate

    public [GameEntityTemplate](entity/GameEntityTemplate.html "class in zombie.scripting.entity") getGameEntityTemplate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllGameEntityTemplates

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[GameEntityTemplate](entity/GameEntityTemplate.html "class in zombie.scripting.entity")> getAllGameEntityTemplates()
  + ### getItem

    public [Item](objects/Item.html "class in zombie.scripting.objects") getItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `getItem` in interface `zombie.scripting.IScriptObjectStore`
  + ### getAllItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](objects/Item.html "class in zombie.scripting.objects")> getAllItems()
  + ### getRecipe

    public [Recipe](objects/Recipe.html "class in zombie.scripting.objects") getRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `getRecipe` in interface `zombie.scripting.IScriptObjectStore`
  + ### getAllRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe](objects/Recipe.html "class in zombie.scripting.objects")> getAllRecipes()
  + ### getUniqueRecipe

    public [UniqueRecipe](objects/UniqueRecipe.html "class in zombie.scripting.objects") getUniqueRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllUniqueRecipes

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[UniqueRecipe](objects/UniqueRecipe.html "class in zombie.scripting.objects")> getAllUniqueRecipes()
  + ### getEvolvedRecipe

    public [EvolvedRecipe](objects/EvolvedRecipe.html "class in zombie.scripting.objects") getEvolvedRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllEvolvedRecipesList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EvolvedRecipe](objects/EvolvedRecipe.html "class in zombie.scripting.objects")> getAllEvolvedRecipesList()
  + ### getAllEvolvedRecipes

    public [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[EvolvedRecipe](objects/EvolvedRecipe.html "class in zombie.scripting.objects")> getAllEvolvedRecipes()
  + ### getFixing

    public [Fixing](objects/Fixing.html "class in zombie.scripting.objects") getFixing([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllFixing

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Fixing](objects/Fixing.html "class in zombie.scripting.objects")> getAllFixing([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Fixing](objects/Fixing.html "class in zombie.scripting.objects")> result)
  + ### getAnimationsMesh

    public [AnimationsMesh](objects/AnimationsMesh.html "class in zombie.scripting.objects") getAnimationsMesh([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllAnimationsMeshes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AnimationsMesh](objects/AnimationsMesh.html "class in zombie.scripting.objects")> getAllAnimationsMeshes()
  + ### getClockScript

    public zombie.scripting.objects.ClockScript getClockScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllClockScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.scripting.objects.ClockScript> getAllClockScripts()
  + ### getMannequinScript

    public [MannequinScript](objects/MannequinScript.html "class in zombie.scripting.objects") getMannequinScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllMannequinScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MannequinScript](objects/MannequinScript.html "class in zombie.scripting.objects")> getAllMannequinScripts()
  + ### getModelScript

    public [ModelScript](objects/ModelScript.html "class in zombie.scripting.objects") getModelScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllModelScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ModelScript](objects/ModelScript.html "class in zombie.scripting.objects")> getAllModelScripts()
  + ### addModelScript

    public void addModelScript([ModelScript](objects/ModelScript.html "class in zombie.scripting.objects") modelScript)
  + ### getPhysicsShape

    public [PhysicsShapeScript](objects/PhysicsShapeScript.html "class in zombie.scripting.objects") getPhysicsShape([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllPhysicsShapes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PhysicsShapeScript](objects/PhysicsShapeScript.html "class in zombie.scripting.objects")> getAllPhysicsShapes()
  + ### getGameSound

    public [GameSoundScript](objects/GameSoundScript.html "class in zombie.scripting.objects") getGameSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllGameSounds

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[GameSoundScript](objects/GameSoundScript.html "class in zombie.scripting.objects")> getAllGameSounds()
  + ### getSoundTimeline

    public [SoundTimelineScript](objects/SoundTimelineScript.html "class in zombie.scripting.objects") getSoundTimeline([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllSoundTimelines

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SoundTimelineScript](objects/SoundTimelineScript.html "class in zombie.scripting.objects")> getAllSoundTimelines()
  + ### getSpriteModel

    public [SpriteModel](../iso/SpriteModel.html "class in zombie.iso") getSpriteModel([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllSpriteModels

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SpriteModel](../iso/SpriteModel.html "class in zombie.iso")> getAllSpriteModels()
  + ### addSpriteModel

    public void addSpriteModel([SpriteModel](../iso/SpriteModel.html "class in zombie.iso") spriteModel)
  + ### getVehicle

    public [VehicleScript](objects/VehicleScript.html "class in zombie.scripting.objects") getVehicle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllVehicleScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript](objects/VehicleScript.html "class in zombie.scripting.objects")> getAllVehicleScripts()
  + ### getRandomVehicleScript

    public [VehicleScript](objects/VehicleScript.html "class in zombie.scripting.objects") getRandomVehicleScript()
  + ### getRuntimeAnimationScript

    public [RuntimeAnimationScript](../core/skinnedmodel/runtime/RuntimeAnimationScript.html "class in zombie.core.skinnedmodel.runtime") getRuntimeAnimationScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllRuntimeAnimationScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RuntimeAnimationScript](../core/skinnedmodel/runtime/RuntimeAnimationScript.html "class in zombie.core.skinnedmodel.runtime")> getAllRuntimeAnimationScripts()
  + ### getVehicleEngineRPM

    public [VehicleEngineRPM](../vehicles/VehicleEngineRPM.html "class in zombie.vehicles") getVehicleEngineRPM([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllVehicleEngineRPMs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleEngineRPM](../vehicles/VehicleEngineRPM.html "class in zombie.vehicles")> getAllVehicleEngineRPMs()
  + ### getItemConfig

    public [ItemConfig](itemConfig/ItemConfig.html "class in zombie.scripting.itemConfig") getItemConfig([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllItemConfigs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemConfig](itemConfig/ItemConfig.html "class in zombie.scripting.itemConfig")> getAllItemConfigs()
  + ### getGameEntityScript

    public [GameEntityScript](entity/GameEntityScript.html "class in zombie.scripting.entity") getGameEntityScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllGameEntities

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[GameEntityScript](entity/GameEntityScript.html "class in zombie.scripting.entity")> getAllGameEntities()
  + ### getAllBuildableRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getAllBuildableRecipes()
  + ### getBuildableRecipe

    public [CraftRecipe](entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getBuildableRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
  + ### getXuiConfigScript

    public [XuiConfigScript](objects/XuiConfigScript.html "class in zombie.scripting.objects") getXuiConfigScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllXuiConfigScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiConfigScript](objects/XuiConfigScript.html "class in zombie.scripting.objects")> getAllXuiConfigScripts()
  + ### getXuiLayout

    public [XuiLayoutScript](objects/XuiLayoutScript.html "class in zombie.scripting.objects") getXuiLayout([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllXuiLayouts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiLayoutScript](objects/XuiLayoutScript.html "class in zombie.scripting.objects")> getAllXuiLayouts()
  + ### getXuiStyle

    public [XuiLayoutScript](objects/XuiLayoutScript.html "class in zombie.scripting.objects") getXuiStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllXuiStyles

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiLayoutScript](objects/XuiLayoutScript.html "class in zombie.scripting.objects")> getAllXuiStyles()
  + ### getXuiDefaultStyle

    public [XuiLayoutScript](objects/XuiLayoutScript.html "class in zombie.scripting.objects") getXuiDefaultStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllXuiDefaultStyles

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiLayoutScript](objects/XuiLayoutScript.html "class in zombie.scripting.objects")> getAllXuiDefaultStyles()
  + ### getXuiColor

    public [XuiColorsScript](objects/XuiColorsScript.html "class in zombie.scripting.objects") getXuiColor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllXuiColors

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiColorsScript](objects/XuiColorsScript.html "class in zombie.scripting.objects")> getAllXuiColors()
  + ### getXuiSkinScript

    public [XuiSkinScript](objects/XuiSkinScript.html "class in zombie.scripting.objects") getXuiSkinScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllXuiSkinScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiSkinScript](objects/XuiSkinScript.html "class in zombie.scripting.objects")> getAllXuiSkinScripts()
  + ### getItemFilter

    public [ItemFilterScript](objects/ItemFilterScript.html "class in zombie.scripting.objects") getItemFilter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllItemFilters

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemFilterScript](objects/ItemFilterScript.html "class in zombie.scripting.objects")> getAllItemFilters()
  + ### getFluidFilter

    public [FluidFilterScript](objects/FluidFilterScript.html "class in zombie.scripting.objects") getFluidFilter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllFluidFilters

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FluidFilterScript](objects/FluidFilterScript.html "class in zombie.scripting.objects")> getAllFluidFilters()
  + ### getCraftRecipe

    public [CraftRecipe](entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getCraftRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllCraftRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getAllCraftRecipes()
  + ### VerifyAllCraftRecipesAreLearnable

    public void VerifyAllCraftRecipesAreLearnable()
  + ### checkAutoLearn

    public void checkAutoLearn([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### checkMetaRecipes

    public void checkMetaRecipes([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### checkMetaRecipe

    public void checkMetaRecipe([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") checkRecipe)
  + ### getStringList

    public [StringListScript](objects/StringListScript.html "class in zombie.scripting.objects") getStringList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllStringLists

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[StringListScript](objects/StringListScript.html "class in zombie.scripting.objects")> getAllStringLists()
  + ### getEnergyDefinitionScript

    public [EnergyDefinitionScript](objects/EnergyDefinitionScript.html "class in zombie.scripting.objects") getEnergyDefinitionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllEnergyDefinitionScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EnergyDefinitionScript](objects/EnergyDefinitionScript.html "class in zombie.scripting.objects")> getAllEnergyDefinitionScripts()
  + ### getFluidDefinitionScript

    public [FluidDefinitionScript](objects/FluidDefinitionScript.html "class in zombie.scripting.objects") getFluidDefinitionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllFluidDefinitionScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FluidDefinitionScript](objects/FluidDefinitionScript.html "class in zombie.scripting.objects")> getAllFluidDefinitionScripts()
  + ### getTimedActionScript

    public [TimedActionScript](objects/TimedActionScript.html "class in zombie.scripting.objects") getTimedActionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllTimedActionScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TimedActionScript](objects/TimedActionScript.html "class in zombie.scripting.objects")> getAllTimedActionScripts()
  + ### getRagdollScript

    public zombie.scripting.objects.RagdollScript getRagdollScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getPhysicsHitReactionScript

    public zombie.scripting.objects.PhysicsHitReactionScript getPhysicsHitReactionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getCharacterTraitScript

    public zombie.scripting.objects.CharacterTraitDefinitionScript getCharacterTraitScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getCharacterProfessionScript

    public zombie.scripting.objects.CharacterProfessionDefinitionScript getCharacterProfessionScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### update

    public void update()
  + ### LoadFile

    public void LoadFile(zombie.scripting.ScriptLoadMode loadMode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    boolean bLoadJar)
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io")

    Throws:
    :   `FileNotFoundException`
  + ### registerLoadFileName

    private void registerLoadFileName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### ParseScript

    public void ParseScript(zombie.scripting.ScriptLoadMode loadMode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
  + ### CreateFromToken

    private void CreateFromToken(zombie.scripting.ScriptLoadMode loadMode,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") token)
  + ### searchFolders

    public void searchFolders([URI](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/net/URI.html "class or interface in java.net") base,
    [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") fo,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadList)
  + ### getItemName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getModule

    public [ScriptModule](objects/ScriptModule.html "class in zombie.scripting.objects") getModule([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getModule

    public [ScriptModule](objects/ScriptModule.html "class in zombie.scripting.objects") getModule([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultToBase)
  + ### getModuleNoDisableCheck

    public [ScriptModule](objects/ScriptModule.html "class in zombie.scripting.objects") getModuleNoDisableCheck([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### FindItem

    public [Item](objects/Item.html "class in zombie.scripting.objects") FindItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### FindItem

    public [Item](objects/Item.html "class in zombie.scripting.objects") FindItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean moduleDefaultsToBase)
  + ### isDrainableItemType

    public boolean isDrainableItemType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### CheckExitPoints

    public void CheckExitPoints()
  + ### getAllItemsWithTag

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](objects/Item.html "class in zombie.scripting.objects")> getAllItemsWithTag([ItemTag](objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getItemsTag

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](objects/Item.html "class in zombie.scripting.objects")> getItemsTag([ItemTag](objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getItemsByType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](objects/Item.html "class in zombie.scripting.objects")> getItemsByType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### Reset

    public void Reset()
  + ### getChecksum

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getChecksum()
  + ### getCurrentLoadFileMod

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentLoadFileMod()
  + ### getCurrentLoadFileAbsPath

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentLoadFileAbsPath()
  + ### getCurrentLoadFileName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentLoadFileName()
  + ### Load

    public void Load()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### ReloadScripts

    public void ReloadScripts([ScriptType](ScriptType.html "enum class in zombie.scripting") type)
  + ### ReloadScripts

    public void ReloadScripts([EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[ScriptType](ScriptType.html "enum class in zombie.scripting")> types)
  + ### loadScripts

    private void loadScripts(zombie.scripting.ScriptLoadMode loadMode,
    [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[ScriptType](ScriptType.html "enum class in zombie.scripting")> toLoadTypes)
  + ### LoadedAfterLua

    public void LoadedAfterLua()
  + ### PostTileDefinitions

    public void PostTileDefinitions()
  + ### PostWorldDictionaryInit

    public void PostWorldDictionaryInit()
  + ### hasLoadErrors

    public boolean hasLoadErrors()
  + ### hasLoadErrors

    public boolean hasLoadErrors(boolean onlyCritical)
  + ### resolveGetItemTypes

    public static void resolveGetItemTypes([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> sourceItems,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](objects/Item.html "class in zombie.scripting.objects")> scriptItems)
  + ### debugItems

    private void debugItems()
  + ### getAllRecipesFor

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe](objects/Recipe.html "class in zombie.scripting.objects")> getAllRecipesFor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") result)
  + ### getItemTypeForClothingItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemTypeForClothingItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clothingItem)
  + ### getItemForClothingItem

    public [Item](objects/Item.html "class in zombie.scripting.objects") getItemForClothingItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clothingName)
  + ### createZedDmgMap

    private void createZedDmgMap()
  + ### getZedDmgMap

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getZedDmgMap()
  + ### createClothingItemMap

    private void createClothingItemMap()
  + ### resolveItemTypes

    private void resolveItemTypes()
  + ### resolveItemType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") resolveItemType([ScriptModule](objects/ScriptModule.html "class in zombie.scripting.objects") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### resolveModelScript

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") resolveModelScript([ScriptModule](objects/ScriptModule.html "class in zombie.scripting.objects") module,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modelScriptName)
  + ### getSpecificItem

    public [Item](objects/Item.html "class in zombie.scripting.objects") getSpecificItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getSpecificEntity

    public [GameEntityScript](entity/GameEntityScript.html "class in zombie.scripting.entity") getSpecificEntity([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)