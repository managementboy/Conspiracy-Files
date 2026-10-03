[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [CraftRecipe](CraftRecipe.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [name](#name)
   2. [translationName](#translationName)
   3. [iconName](#iconName)
   4. [iconTexture](#iconTexture)
   5. [recipeGroup](#recipeGroup)
   6. [needToBeLearn](#needToBeLearn)
   7. [skillRequired](#skillRequired)
   8. [autoLearnAny](#autoLearnAny)
   9. [autoLearnAll](#autoLearnAll)
   10. [xpAward](#xpAward)
   11. [metaRecipe](#metaRecipe)
   12. [hasOnTickInputs](#hasOnTickInputs)
   13. [hasOnTickOutputs](#hasOnTickOutputs)
   14. [time](#time)
   15. [loadedTimedActionScript](#loadedTimedActionScript)
   16. [timedActionScript](#timedActionScript)
   17. [luaCalls](#luaCalls)
   18. [inputs](#inputs)
   19. [outputs](#outputs)
   20. [ioLines](#ioLines)
   21. [category](#category)
   22. [categoryTags](#categoryTags)
   23. [unmodifiableCategoryTags](#unmodifiableCategoryTags)
   24. [categoryBits](#categoryBits)
   25. [prop1](#prop1)
   26. [prop2](#prop2)
   27. [animation](#animation)
   28. [toolLeft](#toolLeft)
   29. [toolRight](#toolRight)
   30. [existsAsVanilla](#existsAsVanilla)
   31. [modId](#modId)
   32. [modInfo](#modInfo)
   33. [outputMappers](#outputMappers)
   34. [overlayMapper](#overlayMapper)
   35. [usesTools](#usesTools)
   36. [tooltip](#tooltip)
   37. [allowBatchCraft](#allowBatchCraft)
   38. [canWalk](#canWalk)
   39. [luaOnTestCacheString](#luaOnTestCacheString)
   40. [luaOnTestCacheObject](#luaOnTestCacheObject)
   41. [onAddToMenu](#onAddToMenu)
   42. [researchSkillLevel](#researchSkillLevel)
   43. [researchAll](#researchAll)
   44. [researchAny](#researchAny)
7. [Constructor Details](#constructor-detail)
   1. [CraftRecipe()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getOutputMapper(String)](#getOutputMapper(java.lang.String))
   2. [getOrCreateOutputMapper(String)](#getOrCreateOutputMapper(java.lang.String))
   3. [getOverlayMapper()](#getOverlayMapper())
   4. [getExistsAsVanilla()](#getExistsAsVanilla())
   5. [isVanilla()](#isVanilla())
   6. [getModID()](#getModID())
   7. [getModName()](#getModName())
   8. [getName()](#getName())
   9. [getTranslationName()](#getTranslationName())
   10. [overrideTranslationName(String)](#overrideTranslationName(java.lang.String))
   11. [getIconName()](#getIconName())
   12. [getIconTexture()](#getIconTexture())
   13. [overrideIconTexture(Texture)](#overrideIconTexture(zombie.core.textures.Texture))
   14. [isShapeless()](#isShapeless())
   15. [isConsumeOnFinish()](#isConsumeOnFinish())
   16. [isRequiresPlayer()](#isRequiresPlayer())
   17. [needToBeLearn()](#needToBeLearn())
   18. [canBeResearched()](#canBeResearched())
   19. [canAlwaysBeResearched()](#canAlwaysBeResearched())
   20. [cannotBeResearched()](#cannotBeResearched())
   21. [getTime()](#getTime())
   22. [getTime(IsoGameCharacter)](#getTime(zombie.characters.IsoGameCharacter))
   23. [getTimedActionScript()](#getTimedActionScript())
   24. [getRecipeGroup()](#getRecipeGroup())
   25. [getCategory()](#getCategory())
   26. [getTags()](#getTags())
   27. [getTagBits()](#getTagBits())
   28. [getModTags()](#getModTags())
   29. [setTags(List)](#setTags(java.util.List))
   30. [getInputCount()](#getInputCount())
   31. [getOutputCount()](#getOutputCount())
   32. [getInputs()](#getInputs())
   33. [getOutputs()](#getOutputs())
   34. [getIoLines()](#getIoLines())
   35. [getIndexForIO(CraftRecipe.IOScript)](#getIndexForIO(zombie.scripting.entity.components.crafting.CraftRecipe.IOScript))
   36. [getIOForIndex(int)](#getIOForIndex(int))
   37. [containsIO(CraftRecipe.IOScript)](#containsIO(zombie.scripting.entity.components.crafting.CraftRecipe.IOScript))
   38. [isUsesTools()](#isUsesTools())
   39. [getToolLeft()](#getToolLeft())
   40. [getToolRight()](#getToolRight())
   41. [getToolBoth()](#getToolBoth())
   42. [getProp1()](#getProp1())
   43. [setProp1(InputScript)](#setProp1(zombie.scripting.entity.components.crafting.InputScript))
   44. [getProp2()](#getProp2())
   45. [setProp2(InputScript)](#setProp2(zombie.scripting.entity.components.crafting.InputScript))
   46. [getAnimation()](#getAnimation())
   47. [setAnimation(String)](#setAnimation(java.lang.String))
   48. [hasOnTickInputs()](#hasOnTickInputs())
   49. [hasOnTickOutputs()](#hasOnTickOutputs())
   50. [hasLuaCall(CraftRecipe.LuaCall)](#hasLuaCall(zombie.scripting.entity.components.crafting.CraftRecipe.LuaCall))
   51. [getLuaCallString(CraftRecipe.LuaCall)](#getLuaCallString(zombie.scripting.entity.components.crafting.CraftRecipe.LuaCall))
   52. [setLuaCall(CraftRecipe.LuaCall, String)](#setLuaCall(zombie.scripting.entity.components.crafting.CraftRecipe.LuaCall,java.lang.String))
   53. [getTooltip()](#getTooltip())
   54. [isAllowBatchCraft()](#isAllowBatchCraft())
   55. [isCanWalk()](#isCanWalk())
   56. [InitLoadPP(String)](#InitLoadPP(java.lang.String))
   57. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   58. [Load(String, ScriptParser.Block)](#Load(java.lang.String,zombie.scripting.ScriptParser.Block))
   59. [LoadIO(ScriptParser.Block, boolean)](#LoadIO(zombie.scripting.ScriptParser.Block,boolean))
   60. [LoadOutputMapper(ScriptParser.Block)](#LoadOutputMapper(zombie.scripting.ScriptParser.Block))
   61. [LoadOverlayMapper(ScriptParser.Block)](#LoadOverlayMapper(zombie.scripting.ScriptParser.Block))
   62. [PreReload()](#PreReload())
   63. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   64. [OnPostWorldDictionaryInit()](#OnPostWorldDictionaryInit())
   65. [getRequiredSkills()](#getRequiredSkills())
   66. [getAutoLearnAnySkills()](#getAutoLearnAnySkills())
   67. [getAutoLearnAllSkills()](#getAutoLearnAllSkills())
   68. [checkAutoLearnAnySkills(IsoGameCharacter)](#checkAutoLearnAnySkills(zombie.characters.IsoGameCharacter))
   69. [checkAutoLearnAnySkills(IsoGameCharacter, boolean)](#checkAutoLearnAnySkills(zombie.characters.IsoGameCharacter,boolean))
   70. [checkAutoLearnAllSkills(IsoGameCharacter)](#checkAutoLearnAllSkills(zombie.characters.IsoGameCharacter))
   71. [checkAutoLearnAllSkills(IsoGameCharacter, boolean)](#checkAutoLearnAllSkills(zombie.characters.IsoGameCharacter,boolean))
   72. [validateHasAutoLearnAnySkill(IsoGameCharacter)](#validateHasAutoLearnAnySkill(zombie.characters.IsoGameCharacter))
   73. [validateHasAutoLearnAllSkill(IsoGameCharacter)](#validateHasAutoLearnAllSkill(zombie.characters.IsoGameCharacter))
   74. [checkMetaRecipe(IsoGameCharacter, String)](#checkMetaRecipe(zombie.characters.IsoGameCharacter,java.lang.String))
   75. [checkMetaRecipe(IsoGameCharacter)](#checkMetaRecipe(zombie.characters.IsoGameCharacter))
   76. [getRequiredSkillCount()](#getRequiredSkillCount())
   77. [getRequiredSkill(int)](#getRequiredSkill(int))
   78. [getAutoLearnAnySkillCount()](#getAutoLearnAnySkillCount())
   79. [getAutoLearnAllSkillCount()](#getAutoLearnAllSkillCount())
   80. [getAutoLearnAnySkill(int)](#getAutoLearnAnySkill(int))
   81. [getAutoLearnAllSkill(int)](#getAutoLearnAllSkill(int))
   82. [getMetaRecipe()](#getMetaRecipe())
   83. [getXPAwardCount()](#getXPAwardCount())
   84. [getXPAward(int)](#getXPAward(int))
   85. [clearRequiredSkills()](#clearRequiredSkills())
   86. [addRequiredSkill(PerkFactory.Perk, int)](#addRequiredSkill(zombie.characters.skills.PerkFactory.Perk,int))
   87. [canUseItem(InventoryItem, IsoGameCharacter)](#canUseItem(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   88. [canUseItem(String)](#canUseItem(java.lang.String))
   89. [OnTestItem(InventoryItem, IsoGameCharacter)](#OnTestItem(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   90. [hasTag(CraftRecipeTag)](#hasTag(zombie.scripting.objects.CraftRecipeTag))
   91. [isCanBeDoneFromFloor()](#isCanBeDoneFromFloor())
   92. [canBeDoneInDark()](#canBeDoneInDark())
   93. [isAnySurfaceCraft()](#isAnySurfaceCraft())
   94. [isInHandCraftCraft()](#isInHandCraftCraft())
   95. [isAutoRotate()](#isAutoRotate())
   96. [getHighestRelevantSkillLevel(IsoGameCharacter)](#getHighestRelevantSkillLevel(zombie.characters.IsoGameCharacter))
   97. [getHighestRelevantSkillLevel(IsoGameCharacter, boolean)](#getHighestRelevantSkillLevel(zombie.characters.IsoGameCharacter,boolean))
   98. [getHighestRelevantSkill(IsoGameCharacter)](#getHighestRelevantSkill(zombie.characters.IsoGameCharacter))
   99. [getHighestRelevantSkillFromXpAward(IsoGameCharacter)](#getHighestRelevantSkillFromXpAward(zombie.characters.IsoGameCharacter))
   100. [onLuaFileReloaded()](#onLuaFileReloaded())
   101. [getOnAddToMenu()](#getOnAddToMenu())
   102. [involvesSkill(PerkFactory.Perk)](#involvesSkill(zombie.characters.skills.PerkFactory.Perk))
   103. [involvesSkill(PerkFactory.Perk, boolean)](#involvesSkill(zombie.characters.skills.PerkFactory.Perk,boolean))
   104. [isSmithing()](#isSmithing())
   105. [canOutputItem(InventoryItem)](#canOutputItem(zombie.inventory.InventoryItem))
   106. [canOutputItem(Item)](#canOutputItem(zombie.scripting.objects.Item))
   107. [setResearchSkillLevel(int)](#setResearchSkillLevel(int))
   108. [getResearchSkillLevel()](#getResearchSkillLevel())
   109. [getResearchSkillLevel(IsoGameCharacter)](#getResearchSkillLevel(zombie.characters.IsoGameCharacter))
   110. [normalizeSkillLevel(int)](#normalizeSkillLevel(int))
   111. [getHighestSkillRequirement()](#getHighestSkillRequirement())
   112. [getHighestSkillRequirement(boolean)](#getHighestSkillRequirement(boolean))
   113. [getHighestPerkRequirement()](#getHighestPerkRequirement())
   114. [canResearch(IsoGameCharacter)](#canResearch(zombie.characters.IsoGameCharacter))
   115. [canResearch(IsoGameCharacter, boolean)](#canResearch(zombie.characters.IsoGameCharacter,boolean))
   116. [isResearchAll()](#isResearchAll())
   117. [generateDebugText()](#generateDebugText())
   118. [generateDebugText(IsoGameCharacter)](#generateDebugText(zombie.characters.IsoGameCharacter))
   119. [addXP(IsoGameCharacter)](#addXP(zombie.characters.IsoGameCharacter))
   120. [addXP(IsoGameCharacter, boolean)](#addXP(zombie.characters.IsoGameCharacter,boolean))
   121. [canBenefitFromRecipeAtHand(IsoGameCharacter)](#canBenefitFromRecipeAtHand(zombie.characters.IsoGameCharacter))
   122. [couldBenefitFromRecipeAtHand(IsoGameCharacter)](#couldBenefitFromRecipeAtHand(zombie.characters.IsoGameCharacter))
   123. [validateBenefitFromRecipeAtHand(IsoGameCharacter, ArrayList)](#validateBenefitFromRecipeAtHand(zombie.characters.IsoGameCharacter,java.util.ArrayList))
   124. [validateBenefitFromRecipeAtHand(HandcraftLogic)](#validateBenefitFromRecipeAtHand(zombie.entity.components.crafting.recipe.HandcraftLogic))
   125. [hasRecipeAtHand(IsoGameCharacter, ArrayList)](#hasRecipeAtHand(zombie.characters.IsoGameCharacter,java.util.ArrayList))
   126. [hasRecipeAtHand(HandcraftLogic)](#hasRecipeAtHand(zombie.entity.components.crafting.recipe.HandcraftLogic))
   127. [getFavouriteModDataString(CraftRecipe)](#getFavouriteModDataString(zombie.scripting.entity.components.crafting.CraftRecipe))
   128. [isFavourite(IsoGameCharacter)](#isFavourite(zombie.characters.IsoGameCharacter))
   129. [hasPlayerLearned(IsoGameCharacter)](#hasPlayerLearned(zombie.characters.IsoGameCharacter))
   130. [characterHasRequiredSkills(IsoGameCharacter)](#characterHasRequiredSkills(zombie.characters.IsoGameCharacter))
   131. [requiresSpecificWorkstation()](#requiresSpecificWorkstation())
   132. [isBuildableRecipe()](#isBuildableRecipe())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipe
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.entity.components.crafting.CraftRecipe

All Implemented Interfaces:
:   `zombie.util.TaggedObjectManager.TaggedObject`

---

public class CraftRecipe
extends [BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")
implements zombie.util.TaggedObjectManager.TaggedObject

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `CraftRecipe.IOScript`

  `static enum`

  `CraftRecipe.LuaCall`

  `static final class`

  `CraftRecipe.RequiredSkill`

  `static final class`

  `CraftRecipe.XpAward`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `allowBatchCraft`

  `private String`

  `animation`

  `ArrayList<CraftRecipe.RequiredSkill>`

  `autoLearnAll`

  `ArrayList<CraftRecipe.RequiredSkill>`

  `autoLearnAny`

  `private boolean`

  `canWalk`

  `private String`

  `category`

  `private final BitSet`

  `categoryBits`

  `private final ArrayList<String>`

  `categoryTags`

  `private boolean`

  `existsAsVanilla`

  `private boolean`

  `hasOnTickInputs`

  `private boolean`

  `hasOnTickOutputs`

  `private String`

  `iconName`

  `private Texture`

  `iconTexture`

  `private final ArrayList<InputScript>`

  `inputs`

  `private final ArrayList<CraftRecipe.IOScript>`

  `ioLines`

  `private String`

  `loadedTimedActionScript`

  `private final HashMap<CraftRecipe.LuaCall, String>`

  `luaCalls`

  `private static Object`

  `luaOnTestCacheObject`

  `private static String`

  `luaOnTestCacheString`

  `String`

  `metaRecipe`

  `private String`

  `modId`

  `private ChooseGameInfo.Mod`

  `modInfo`

  `private String`

  `name`

  `private boolean`

  `needToBeLearn`

  `private String`

  `onAddToMenu`

  `private final HashMap<String, OutputMapper>`

  `outputMappers`

  `private final ArrayList<OutputScript>`

  `outputs`

  `private final zombie.entity.components.crafting.recipe.OverlayMapper`

  `overlayMapper`

  `private InputScript`

  `prop1`

  `private InputScript`

  `prop2`

  `private CraftRecipeGroup`

  `recipeGroup`

  `private final ArrayList<PerkFactory.Perk>`

  `researchAll`

  `private final ArrayList<PerkFactory.Perk>`

  `researchAny`

  `int`

  `researchSkillLevel`

  `ArrayList<CraftRecipe.RequiredSkill>`

  `skillRequired`

  `private int`

  `time`

  `private TimedActionScript`

  `timedActionScript`

  `private InputScript`

  `toolLeft`

  `private InputScript`

  `toolRight`

  `private String`

  `tooltip`

  `private String`

  `translationName`

  `private List<String>`

  `unmodifiableCategoryTags`

  `private boolean`

  `usesTools`

  `ArrayList<CraftRecipe.XpAward>`

  `xpAward`

  ### Fields inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CraftRecipe()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addRequiredSkill(PerkFactory.Perk perk,
  int level)`

  `void`

  `addXP(IsoGameCharacter character)`

  `void`

  `addXP(IsoGameCharacter character,
  boolean showXP)`

  `boolean`

  `canAlwaysBeResearched()`

  `boolean`

  `canBeDoneInDark()`

  `boolean`

  `canBenefitFromRecipeAtHand(IsoGameCharacter chr)`

  `boolean`

  `canBeResearched()`

  `boolean`

  `cannotBeResearched()`

  `boolean`

  `canOutputItem(InventoryItem item)`

  `boolean`

  `canOutputItem(Item item)`

  `boolean`

  `canResearch(IsoGameCharacter chr)`

  `boolean`

  `canResearch(IsoGameCharacter chr,
  boolean blacklistKnown)`

  `boolean`

  `canUseItem(String item)`

  `boolean`

  `canUseItem(InventoryItem item,
  IsoGameCharacter character)`

  `boolean`

  `characterHasRequiredSkills(IsoGameCharacter chr)`

  `void`

  `checkAutoLearnAllSkills(IsoGameCharacter chr)`

  `void`

  `checkAutoLearnAllSkills(IsoGameCharacter chr,
  boolean textSpam)`

  `void`

  `checkAutoLearnAnySkills(IsoGameCharacter chr)`

  `void`

  `checkAutoLearnAnySkills(IsoGameCharacter chr,
  boolean textSpam)`

  `void`

  `checkMetaRecipe(IsoGameCharacter chr)`

  `void`

  `checkMetaRecipe(IsoGameCharacter chr,
  String checkedRecipe)`

  `void`

  `clearRequiredSkills()`

  `boolean`

  `containsIO(CraftRecipe.IOScript script)`

  `boolean`

  `couldBenefitFromRecipeAtHand(IsoGameCharacter chr)`

  `String`

  `generateDebugText()`

  `String`

  `generateDebugText(IsoGameCharacter chr)`

  `String`

  `getAnimation()`

  `CraftRecipe.RequiredSkill`

  `getAutoLearnAllSkill(int index)`

  `int`

  `getAutoLearnAllSkillCount()`

  `ArrayList<String>`

  `getAutoLearnAllSkills()`

  `CraftRecipe.RequiredSkill`

  `getAutoLearnAnySkill(int index)`

  `int`

  `getAutoLearnAnySkillCount()`

  `ArrayList<String>`

  `getAutoLearnAnySkills()`

  `String`

  `getCategory()`

  `boolean`

  `getExistsAsVanilla()`

  `String`

  `getFavouriteModDataString(CraftRecipe recipe)`

  `PerkFactory.Perk`

  `getHighestPerkRequirement()`

  `PerkFactory.Perk`

  `getHighestRelevantSkill(IsoGameCharacter character)`

  `PerkFactory.Perk`

  `getHighestRelevantSkillFromXpAward(IsoGameCharacter character)`

  `int`

  `getHighestRelevantSkillLevel(IsoGameCharacter character)`

  `int`

  `getHighestRelevantSkillLevel(IsoGameCharacter character,
  boolean includeAutoLearn)`

  `int`

  `getHighestSkillRequirement()`

  `int`

  `getHighestSkillRequirement(boolean includeAutoLearn)`

  `String`

  `getIconName()`

  `Texture`

  `getIconTexture()`

  `int`

  `getIndexForIO(CraftRecipe.IOScript script)`

  `int`

  `getInputCount()`

  `ArrayList<InputScript>`

  `getInputs()`

  `CraftRecipe.IOScript`

  `getIOForIndex(int index)`

  `ArrayList<CraftRecipe.IOScript>`

  `getIoLines()`

  `String`

  `getLuaCallString(CraftRecipe.LuaCall luaCall)`

  `String`

  `getMetaRecipe()`

  `String`

  `getModID()`

  `String`

  `getModName()`

  `List<String>`

  `getModTags()`

  `String`

  `getName()`

  `String`

  `getOnAddToMenu()`

  `protected OutputMapper`

  `getOrCreateOutputMapper(String name)`

  `int`

  `getOutputCount()`

  `protected OutputMapper`

  `getOutputMapper(String name)`

  `ArrayList<OutputScript>`

  `getOutputs()`

  `zombie.entity.components.crafting.recipe.OverlayMapper`

  `getOverlayMapper()`

  `InputScript`

  `getProp1()`

  `InputScript`

  `getProp2()`

  `CraftRecipeGroup`

  `getRecipeGroup()`

  `CraftRecipe.RequiredSkill`

  `getRequiredSkill(int index)`

  `int`

  `getRequiredSkillCount()`

  `ArrayList<String>`

  `getRequiredSkills()`

  `int`

  `getResearchSkillLevel()`

  `int`

  `getResearchSkillLevel(IsoGameCharacter chr)`

  `BitSet`

  `getTagBits()`

  `List<String>`

  `getTags()`

  `int`

  `getTime()`

  `int`

  `getTime(IsoGameCharacter character)`

  `TimedActionScript`

  `getTimedActionScript()`

  `InputScript`

  `getToolBoth()`

  `InputScript`

  `getToolLeft()`

  `InputScript`

  `getToolRight()`

  `String`

  `getTooltip()`

  `String`

  `getTranslationName()`

  `CraftRecipe.XpAward`

  `getXPAward(int index)`

  `int`

  `getXPAwardCount()`

  `boolean`

  `hasLuaCall(CraftRecipe.LuaCall luaCall)`

  `boolean`

  `hasOnTickInputs()`

  `boolean`

  `hasOnTickOutputs()`

  `boolean`

  `hasPlayerLearned(IsoGameCharacter character)`

  `boolean`

  `hasRecipeAtHand(IsoGameCharacter chr,
  ArrayList<ItemContainer> containers)`

  `boolean`

  `hasRecipeAtHand(HandcraftLogic logic)`

  `boolean`

  `hasTag(zombie.scripting.objects.CraftRecipeTag craftRecipeTag)`

  `void`

  `InitLoadPP(String name)`

  `boolean`

  `involvesSkill(PerkFactory.Perk skill)`

  `boolean`

  `involvesSkill(PerkFactory.Perk skill,
  boolean includeAutoLearn)`

  `boolean`

  `isAllowBatchCraft()`

  `boolean`

  `isAnySurfaceCraft()`

  `boolean`

  `isAutoRotate()`

  `boolean`

  `isBuildableRecipe()`

  `boolean`

  `isCanBeDoneFromFloor()`

  `boolean`

  `isCanWalk()`

  `boolean`

  `isConsumeOnFinish()`

  Deprecated.

  `boolean`

  `isFavourite(IsoGameCharacter character)`

  `boolean`

  `isInHandCraftCraft()`

  `boolean`

  `isRequiresPlayer()`

  Deprecated.

  `boolean`

  `isResearchAll()`

  `boolean`

  `isShapeless()`

  Deprecated.

  `boolean`

  `isSmithing()`

  `boolean`

  `isUsesTools()`

  `boolean`

  `isVanilla()`

  `void`

  `Load(String name,
  String body)`

  `void`

  `Load(String name,
  zombie.scripting.ScriptParser.Block block)`

  `private void`

  `LoadIO(zombie.scripting.ScriptParser.Block block,
  boolean isInput)`

  `private void`

  `LoadOutputMapper(zombie.scripting.ScriptParser.Block block)`

  `private void`

  `LoadOverlayMapper(zombie.scripting.ScriptParser.Block block)`

  `boolean`

  `needToBeLearn()`

  `int`

  `normalizeSkillLevel(int level)`

  `static void`

  `onLuaFileReloaded()`

  `void`

  `OnPostWorldDictionaryInit()`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `boolean`

  `OnTestItem(InventoryItem inventoryItem,
  IsoGameCharacter character)`

  `void`

  `overrideIconTexture(Texture icon)`

  `void`

  `overrideTranslationName(String name)`

  `void`

  `PreReload()`

  `boolean`

  `requiresSpecificWorkstation()`

  `void`

  `setAnimation(String animationString)`

  `private void`

  `setLuaCall(CraftRecipe.LuaCall luaCall,
  String luaFunction)`

  `void`

  `setProp1(InputScript prop)`

  `void`

  `setProp2(InputScript prop)`

  `void`

  `setResearchSkillLevel(int level)`

  `void`

  `setTags(List<String> tags)`

  `boolean`

  `validateBenefitFromRecipeAtHand(IsoGameCharacter chr,
  ArrayList<ItemContainer> containers)`

  `boolean`

  `validateBenefitFromRecipeAtHand(HandcraftLogic logic)`

  `private boolean`

  `validateHasAutoLearnAllSkill(IsoGameCharacter chr)`

  `private boolean`

  `validateHasAutoLearnAnySkill(IsoGameCharacter chr)`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### translationName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName
  + ### iconName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") iconName
  + ### iconTexture

    private [Texture](../../../../core/textures/Texture.html "class in zombie.core.textures") iconTexture
  + ### recipeGroup

    private [CraftRecipeGroup](../../../objects/CraftRecipeGroup.html "enum class in zombie.scripting.objects") recipeGroup
  + ### needToBeLearn

    private boolean needToBeLearn
  + ### skillRequired

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe.RequiredSkill](CraftRecipe.RequiredSkill.html "class in zombie.scripting.entity.components.crafting")> skillRequired
  + ### autoLearnAny

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe.RequiredSkill](CraftRecipe.RequiredSkill.html "class in zombie.scripting.entity.components.crafting")> autoLearnAny
  + ### autoLearnAll

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe.RequiredSkill](CraftRecipe.RequiredSkill.html "class in zombie.scripting.entity.components.crafting")> autoLearnAll
  + ### xpAward

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe.XpAward](CraftRecipe.XpAward.html "class in zombie.scripting.entity.components.crafting")> xpAward
  + ### metaRecipe

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") metaRecipe
  + ### hasOnTickInputs

    private boolean hasOnTickInputs
  + ### hasOnTickOutputs

    private boolean hasOnTickOutputs
  + ### time

    private int time
  + ### loadedTimedActionScript

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") loadedTimedActionScript
  + ### timedActionScript

    private [TimedActionScript](../../../objects/TimedActionScript.html "class in zombie.scripting.objects") timedActionScript
  + ### luaCalls

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[CraftRecipe.LuaCall](CraftRecipe.LuaCall.html "enum class in zombie.scripting.entity.components.crafting"), [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> luaCalls
  + ### inputs

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting")> inputs
  + ### outputs

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting")> outputs
  + ### ioLines

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe.IOScript](CraftRecipe.IOScript.html "class in zombie.scripting.entity.components.crafting")> ioLines
  + ### category

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category
  + ### categoryTags

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> categoryTags
  + ### unmodifiableCategoryTags

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> unmodifiableCategoryTags
  + ### categoryBits

    private final [BitSet](../../../../entity/util/BitSet.html "class in zombie.entity.util") categoryBits
  + ### prop1

    private [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") prop1
  + ### prop2

    private [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") prop2
  + ### animation

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animation
  + ### toolLeft

    private [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") toolLeft
  + ### toolRight

    private [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") toolRight
  + ### existsAsVanilla

    private boolean existsAsVanilla
  + ### modId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId
  + ### modInfo

    private [ChooseGameInfo.Mod](../../../../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") modInfo
  + ### outputMappers

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [OutputMapper](../../../../entity/components/crafting/recipe/OutputMapper.html "class in zombie.entity.components.crafting.recipe")> outputMappers
  + ### overlayMapper

    private final zombie.entity.components.crafting.recipe.OverlayMapper overlayMapper
  + ### usesTools

    private boolean usesTools
  + ### tooltip

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltip
  + ### allowBatchCraft

    private boolean allowBatchCraft
  + ### canWalk

    private boolean canWalk
  + ### luaOnTestCacheString

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaOnTestCacheString
  + ### luaOnTestCacheObject

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") luaOnTestCacheObject
  + ### onAddToMenu

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onAddToMenu
  + ### researchSkillLevel

    public int researchSkillLevel
  + ### researchAll

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills")> researchAll
  + ### researchAny

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills")> researchAny
* Constructor Details
  -------------------

  + ### CraftRecipe

    public CraftRecipe()
* Method Details
  --------------

  + ### getOutputMapper

    protected [OutputMapper](../../../../entity/components/crafting/recipe/OutputMapper.html "class in zombie.entity.components.crafting.recipe") getOutputMapper([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getOrCreateOutputMapper

    protected [OutputMapper](../../../../entity/components/crafting/recipe/OutputMapper.html "class in zombie.entity.components.crafting.recipe") getOrCreateOutputMapper([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getOverlayMapper

    public zombie.entity.components.crafting.recipe.OverlayMapper getOverlayMapper()
  + ### getExistsAsVanilla

    public boolean getExistsAsVanilla()
  + ### isVanilla

    public boolean isVanilla()
  + ### getModID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModID()
  + ### getModName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModName()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getTranslationName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationName()
  + ### overrideTranslationName

    public void overrideTranslationName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getIconName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIconName()
  + ### getIconTexture

    public [Texture](../../../../core/textures/Texture.html "class in zombie.core.textures") getIconTexture()
  + ### overrideIconTexture

    public void overrideIconTexture([Texture](../../../../core/textures/Texture.html "class in zombie.core.textures") icon)
  + ### isShapeless

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isShapeless()

    Deprecated.
  + ### isConsumeOnFinish

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isConsumeOnFinish()

    Deprecated.
  + ### isRequiresPlayer

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean isRequiresPlayer()

    Deprecated.
  + ### needToBeLearn

    public boolean needToBeLearn()
  + ### canBeResearched

    public boolean canBeResearched()
  + ### canAlwaysBeResearched

    public boolean canAlwaysBeResearched()
  + ### cannotBeResearched

    public boolean cannotBeResearched()
  + ### getTime

    public int getTime()
  + ### getTime

    public int getTime([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getTimedActionScript

    public [TimedActionScript](../../../objects/TimedActionScript.html "class in zombie.scripting.objects") getTimedActionScript()
  + ### getRecipeGroup

    public [CraftRecipeGroup](../../../objects/CraftRecipeGroup.html "enum class in zombie.scripting.objects") getRecipeGroup()
  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()
  + ### getTags

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTags()

    Specified by:
    :   `getTags` in interface `zombie.util.TaggedObjectManager.TaggedObject`
  + ### getTagBits

    public [BitSet](../../../../entity/util/BitSet.html "class in zombie.entity.util") getTagBits()

    Specified by:
    :   `getTagBits` in interface `zombie.util.TaggedObjectManager.TaggedObject`
  + ### getModTags

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getModTags()
  + ### setTags

    public void setTags([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tags)
  + ### getInputCount

    public int getInputCount()
  + ### getOutputCount

    public int getOutputCount()
  + ### getInputs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting")> getInputs()
  + ### getOutputs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[OutputScript](OutputScript.html "class in zombie.scripting.entity.components.crafting")> getOutputs()
  + ### getIoLines

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe.IOScript](CraftRecipe.IOScript.html "class in zombie.scripting.entity.components.crafting")> getIoLines()
  + ### getIndexForIO

    public int getIndexForIO([CraftRecipe.IOScript](CraftRecipe.IOScript.html "class in zombie.scripting.entity.components.crafting") script)
  + ### getIOForIndex

    public [CraftRecipe.IOScript](CraftRecipe.IOScript.html "class in zombie.scripting.entity.components.crafting") getIOForIndex(int index)
  + ### containsIO

    public boolean containsIO([CraftRecipe.IOScript](CraftRecipe.IOScript.html "class in zombie.scripting.entity.components.crafting") script)
  + ### isUsesTools

    public boolean isUsesTools()
  + ### getToolLeft

    public [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") getToolLeft()
  + ### getToolRight

    public [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") getToolRight()
  + ### getToolBoth

    public [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") getToolBoth()
  + ### getProp1

    public [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") getProp1()
  + ### setProp1

    public void setProp1([InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") prop)
  + ### getProp2

    public [InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") getProp2()
  + ### setProp2

    public void setProp2([InputScript](InputScript.html "class in zombie.scripting.entity.components.crafting") prop)
  + ### getAnimation

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimation()
  + ### setAnimation

    public void setAnimation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animationString)
  + ### hasOnTickInputs

    public boolean hasOnTickInputs()
  + ### hasOnTickOutputs

    public boolean hasOnTickOutputs()
  + ### hasLuaCall

    public boolean hasLuaCall([CraftRecipe.LuaCall](CraftRecipe.LuaCall.html "enum class in zombie.scripting.entity.components.crafting") luaCall)
  + ### getLuaCallString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaCallString([CraftRecipe.LuaCall](CraftRecipe.LuaCall.html "enum class in zombie.scripting.entity.components.crafting") luaCall)
  + ### setLuaCall

    private void setLuaCall([CraftRecipe.LuaCall](CraftRecipe.LuaCall.html "enum class in zombie.scripting.entity.components.crafting") luaCall,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaFunction)
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()
  + ### isAllowBatchCraft

    public boolean isAllowBatchCraft()
  + ### isCanWalk

    public boolean isCanWalk()
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
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadIO

    private void LoadIO(zombie.scripting.ScriptParser.Block block,
    boolean isInput)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadOutputMapper

    private void LoadOutputMapper(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadOverlayMapper

    private void LoadOverlayMapper(zombie.scripting.ScriptParser.Block block)
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
  + ### OnPostWorldDictionaryInit

    public void OnPostWorldDictionaryInit()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `OnPostWorldDictionaryInit` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### getRequiredSkills

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getRequiredSkills()
  + ### getAutoLearnAnySkills

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAutoLearnAnySkills()
  + ### getAutoLearnAllSkills

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAutoLearnAllSkills()
  + ### checkAutoLearnAnySkills

    public void checkAutoLearnAnySkills([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### checkAutoLearnAnySkills

    public void checkAutoLearnAnySkills([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean textSpam)
  + ### checkAutoLearnAllSkills

    public void checkAutoLearnAllSkills([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### checkAutoLearnAllSkills

    public void checkAutoLearnAllSkills([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean textSpam)
  + ### validateHasAutoLearnAnySkill

    private boolean validateHasAutoLearnAnySkill([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### validateHasAutoLearnAllSkill

    private boolean validateHasAutoLearnAllSkill([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### checkMetaRecipe

    public void checkMetaRecipe([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") checkedRecipe)
  + ### checkMetaRecipe

    public void checkMetaRecipe([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### getRequiredSkillCount

    public int getRequiredSkillCount()
  + ### getRequiredSkill

    public [CraftRecipe.RequiredSkill](CraftRecipe.RequiredSkill.html "class in zombie.scripting.entity.components.crafting") getRequiredSkill(int index)
  + ### getAutoLearnAnySkillCount

    public int getAutoLearnAnySkillCount()
  + ### getAutoLearnAllSkillCount

    public int getAutoLearnAllSkillCount()
  + ### getAutoLearnAnySkill

    public [CraftRecipe.RequiredSkill](CraftRecipe.RequiredSkill.html "class in zombie.scripting.entity.components.crafting") getAutoLearnAnySkill(int index)
  + ### getAutoLearnAllSkill

    public [CraftRecipe.RequiredSkill](CraftRecipe.RequiredSkill.html "class in zombie.scripting.entity.components.crafting") getAutoLearnAllSkill(int index)
  + ### getMetaRecipe

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMetaRecipe()
  + ### getXPAwardCount

    public int getXPAwardCount()
  + ### getXPAward

    public [CraftRecipe.XpAward](CraftRecipe.XpAward.html "class in zombie.scripting.entity.components.crafting") getXPAward(int index)
  + ### clearRequiredSkills

    public void clearRequiredSkills()
  + ### addRequiredSkill

    public void addRequiredSkill([PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    int level)
  + ### canUseItem

    public boolean canUseItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### canUseItem

    public boolean canUseItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### OnTestItem

    public boolean OnTestItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### hasTag

    public boolean hasTag(zombie.scripting.objects.CraftRecipeTag craftRecipeTag)
  + ### isCanBeDoneFromFloor

    public boolean isCanBeDoneFromFloor()
  + ### canBeDoneInDark

    public boolean canBeDoneInDark()
  + ### isAnySurfaceCraft

    public boolean isAnySurfaceCraft()
  + ### isInHandCraftCraft

    public boolean isInHandCraftCraft()
  + ### isAutoRotate

    public boolean isAutoRotate()
  + ### getHighestRelevantSkillLevel

    public int getHighestRelevantSkillLevel([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getHighestRelevantSkillLevel

    public int getHighestRelevantSkillLevel([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean includeAutoLearn)
  + ### getHighestRelevantSkill

    public [PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") getHighestRelevantSkill([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getHighestRelevantSkillFromXpAward

    public [PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") getHighestRelevantSkillFromXpAward([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### onLuaFileReloaded

    public static void onLuaFileReloaded()
  + ### getOnAddToMenu

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnAddToMenu()
  + ### involvesSkill

    public boolean involvesSkill([PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") skill)
  + ### involvesSkill

    public boolean involvesSkill([PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") skill,
    boolean includeAutoLearn)
  + ### isSmithing

    public boolean isSmithing()
  + ### canOutputItem

    public boolean canOutputItem([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### canOutputItem

    public boolean canOutputItem([Item](../../../objects/Item.html "class in zombie.scripting.objects") item)
  + ### setResearchSkillLevel

    public void setResearchSkillLevel(int level)
  + ### getResearchSkillLevel

    public int getResearchSkillLevel()
  + ### getResearchSkillLevel

    public int getResearchSkillLevel([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### normalizeSkillLevel

    public int normalizeSkillLevel(int level)
  + ### getHighestSkillRequirement

    public int getHighestSkillRequirement()
  + ### getHighestSkillRequirement

    public int getHighestSkillRequirement(boolean includeAutoLearn)
  + ### getHighestPerkRequirement

    public [PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") getHighestPerkRequirement()
  + ### canResearch

    public boolean canResearch([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### canResearch

    public boolean canResearch([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean blacklistKnown)
  + ### isResearchAll

    public boolean isResearchAll()
  + ### generateDebugText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") generateDebugText()
  + ### generateDebugText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") generateDebugText([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addXP

    public void addXP([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### addXP

    public void addXP([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    boolean showXP)
  + ### canBenefitFromRecipeAtHand

    public boolean canBenefitFromRecipeAtHand([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### couldBenefitFromRecipeAtHand

    public boolean couldBenefitFromRecipeAtHand([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### validateBenefitFromRecipeAtHand

    public boolean validateBenefitFromRecipeAtHand([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### validateBenefitFromRecipeAtHand

    public boolean validateBenefitFromRecipeAtHand([HandcraftLogic](../../../../entity/components/crafting/recipe/HandcraftLogic.html "class in zombie.entity.components.crafting.recipe") logic)
  + ### hasRecipeAtHand

    public boolean hasRecipeAtHand([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### hasRecipeAtHand

    public boolean hasRecipeAtHand([HandcraftLogic](../../../../entity/components/crafting/recipe/HandcraftLogic.html "class in zombie.entity.components.crafting.recipe") logic)
  + ### getFavouriteModDataString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFavouriteModDataString([CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### isFavourite

    public boolean isFavourite([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### hasPlayerLearned

    public boolean hasPlayerLearned([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### characterHasRequiredSkills

    public boolean characterHasRequiredSkills([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### requiresSpecificWorkstation

    public boolean requiresSpecificWorkstation()
  + ### isBuildableRecipe

    public boolean isBuildableRecipe()