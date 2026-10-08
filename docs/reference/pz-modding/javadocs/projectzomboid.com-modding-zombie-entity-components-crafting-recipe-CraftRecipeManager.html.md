[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeManager](CraftRecipeManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [FLOAT\_EPSILON](#FLOAT_EPSILON)
   2. [initialized](#initialized)
   3. [craftRecipeTagManager](#craftRecipeTagManager)
   4. [unmodifiableAllRecipes](#unmodifiableAllRecipes)
   5. [playerCraftDataMap](#playerCraftDataMap)
   6. [RecipeList](#RecipeList)
7. [Constructor Details](#constructor-detail)
   1. [CraftRecipeManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [Reset()](#Reset())
   2. [Init()](#Init())
   3. [FormatAndRegisterRecipeTagsQuery(String)](#FormatAndRegisterRecipeTagsQuery(java.lang.String))
   4. [sanitizeTagQuery(String)](#sanitizeTagQuery(java.lang.String))
   5. [getRecipesForTag(String)](#getRecipesForTag(java.lang.String))
   6. [getAllRecipeTags()](#getAllRecipeTags())
   7. [getTagGroups()](#getTagGroups())
   8. [debugPrintTagManager()](#debugPrintTagManager())
   9. [debugPrintTagManagerLines()](#debugPrintTagManagerLines())
   10. [LogAllRecipesToFile()](#LogAllRecipesToFile())
   11. [queryRecipes(String)](#queryRecipes(java.lang.String))
   12. [queryRecipes(CraftRecipeTag...)](#queryRecipes(zombie.scripting.objects.CraftRecipeTag...))
   13. [populateRecipeList(String, List, boolean)](#populateRecipeList(java.lang.String,java.util.List,boolean))
   14. [populateRecipeList(String, List, List, boolean)](#populateRecipeList(java.lang.String,java.util.List,java.util.List,boolean))
   15. [filterRecipeList(String, List)](#filterRecipeList(java.lang.String,java.util.List))
   16. [filterRecipeList(String, List, List)](#filterRecipeList(java.lang.String,java.util.List,java.util.List))
   17. [getCraftDataForPlayer(IsoPlayer)](#getCraftDataForPlayer(zombie.characters.IsoPlayer))
   18. [getAllItemsFromContainers(ArrayList, ArrayList)](#getAllItemsFromContainers(java.util.ArrayList,java.util.ArrayList))
   19. [getAllValidItemsForRecipe(CraftRecipe, ArrayList, ArrayList, IsoGameCharacter)](#getAllValidItemsForRecipe(zombie.scripting.entity.components.crafting.CraftRecipe,java.util.ArrayList,java.util.ArrayList,zombie.characters.IsoGameCharacter))
   20. [getValidInputScriptForItem(CraftRecipe, InventoryItem, IsoGameCharacter)](#getValidInputScriptForItem(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   21. [getAllValidInputScriptsForItem(CraftRecipe, InventoryItem, IsoGameCharacter)](#getAllValidInputScriptsForItem(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   22. [isItemToolForRecipe(CraftRecipe, InventoryItem, IsoGameCharacter)](#isItemToolForRecipe(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   23. [isItemValidForRecipe(CraftRecipe, InventoryItem, IsoGameCharacter)](#isItemValidForRecipe(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   24. [isItemValidForInputScript(InputScript, InventoryItem, IsoGameCharacter)](#isItemValidForInputScript(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   25. [isValidRecipeForCharacter(CraftRecipe, IsoGameCharacter, CraftRecipeMonitor, ArrayList)](#isValidRecipeForCharacter(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.characters.IsoGameCharacter,zombie.entity.components.crafting.CraftRecipeMonitor,java.util.ArrayList))
   26. [validateHasRequiredSkill(CraftRecipe, IsoGameCharacter, ArrayList)](#validateHasRequiredSkill(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.characters.IsoGameCharacter,java.util.ArrayList))
   27. [hasPlayerLearnedRecipe(CraftRecipe, IsoGameCharacter)](#hasPlayerLearnedRecipe(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.characters.IsoGameCharacter))
   28. [hasPlayerRequiredSkill(CraftRecipe.RequiredSkill, IsoGameCharacter)](#hasPlayerRequiredSkill(zombie.scripting.entity.components.crafting.CraftRecipe.RequiredSkill,zombie.characters.IsoGameCharacter))
   29. [getAutoCraftCountItems(CraftRecipe, ArrayList)](#getAutoCraftCountItems(zombie.scripting.entity.components.crafting.CraftRecipe,java.util.ArrayList))
   30. [validateInputScript(InputScript, ResourceType, boolean)](#validateInputScript(zombie.scripting.entity.components.crafting.InputScript,zombie.entity.components.resources.ResourceType,boolean))
   31. [validateOutputScript(OutputScript, ResourceType, boolean)](#validateOutputScript(zombie.scripting.entity.components.crafting.OutputScript,zombie.entity.components.resources.ResourceType,boolean))
   32. [isCurrentCraftActionPending(IsoGameCharacter, KahluaTable)](#isCurrentCraftActionPending(zombie.characters.IsoGameCharacter,se.krka.kahlua.vm.KahluaTable))
   33. [consumesEntireItem(InputScript, InventoryItem)](#consumesEntireItem(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem))
   34. [itemGetQueuedAmount(IsoGameCharacter, InventoryItem, CraftRecipeData.CacheData)](#itemGetQueuedAmount(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData))
   35. [consumeInputFromResources(InputScript, List, boolean, CraftRecipeData.CacheData, IsoGameCharacter, Set)](#consumeInputFromResources(zombie.scripting.entity.components.crafting.InputScript,java.util.List,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,zombie.characters.IsoGameCharacter,java.util.Set))
   36. [consumeInputItem(InputScript, List, boolean, CraftRecipeData.CacheData, IsoGameCharacter, Set)](#consumeInputItem(zombie.scripting.entity.components.crafting.InputScript,java.util.List,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,zombie.characters.IsoGameCharacter,java.util.Set))
   37. [consumeInputItem(InputScript, InventoryItem, boolean, CraftRecipeData.CacheData, IsoGameCharacter)](#consumeInputItem(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,zombie.characters.IsoGameCharacter))
   38. [consumeInputItemInternal(InputScript, InventoryItem, boolean, CraftRecipeData.CacheData, IsoGameCharacter)](#consumeInputItemInternal(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,zombie.characters.IsoGameCharacter))
   39. [consumeInputItemUsesInternal(InputScript, InventoryItem, boolean, CraftRecipeData.CacheData, int)](#consumeInputItemUsesInternal(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,int))
   40. [consumeInputFluid(InputScript, List, boolean, CraftRecipeData.CacheData, float)](#consumeInputFluid(zombie.scripting.entity.components.crafting.InputScript,java.util.List,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,float))
   41. [consumeInputFluidInternal(InputScript, FluidContainer, boolean, CraftRecipeData.CacheData, float)](#consumeInputFluidInternal(zombie.scripting.entity.components.crafting.InputScript,zombie.entity.components.fluids.FluidContainer,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,float))
   42. [consumeInputEnergy(InputScript, List, boolean, CraftRecipeData.CacheData)](#consumeInputEnergy(zombie.scripting.entity.components.crafting.InputScript,java.util.List,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData))
   43. [consumeInputEnergyFromItemInternal(InputScript, InventoryItem, boolean, CraftRecipeData.CacheData, int)](#consumeInputEnergyFromItemInternal(zombie.scripting.entity.components.crafting.InputScript,zombie.inventory.InventoryItem,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,int))
   44. [createOutputToResource(OutputScript, Resource, boolean, CraftRecipeData.CacheData)](#createOutputToResource(zombie.scripting.entity.components.crafting.OutputScript,zombie.entity.components.resources.Resource,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData))
   45. [createOutputItem(OutputScript, Item, boolean, CraftRecipeData.CacheData, IsoGameCharacter)](#createOutputItem(zombie.scripting.entity.components.crafting.OutputScript,zombie.scripting.objects.Item,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,zombie.characters.IsoGameCharacter))
   46. [createOutputItemInternal(OutputScript, Item, boolean, CraftRecipeData.CacheData, IsoGameCharacter)](#createOutputItemInternal(zombie.scripting.entity.components.crafting.OutputScript,zombie.scripting.objects.Item,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,zombie.characters.IsoGameCharacter))
   47. [createOutputItemUsesInternal(OutputScript, InventoryItem, boolean, CraftRecipeData.CacheData, int)](#createOutputItemUsesInternal(zombie.scripting.entity.components.crafting.OutputScript,zombie.inventory.InventoryItem,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,int))
   48. [createOutputFluid(OutputScript, Resource, boolean, CraftRecipeData.CacheData)](#createOutputFluid(zombie.scripting.entity.components.crafting.OutputScript,zombie.entity.components.resources.Resource,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData))
   49. [createOutputFluidInternal(OutputScript, FluidContainer, boolean, CraftRecipeData.CacheData, float)](#createOutputFluidInternal(zombie.scripting.entity.components.crafting.OutputScript,zombie.entity.components.fluids.FluidContainer,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,float))
   50. [createOutputEnergy(OutputScript, Resource, boolean, CraftRecipeData.CacheData)](#createOutputEnergy(zombie.scripting.entity.components.crafting.OutputScript,zombie.entity.components.resources.Resource,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData))
   51. [createOutputEnergyToItemInternal(OutputScript, InventoryItem, boolean, CraftRecipeData.CacheData, int)](#createOutputEnergyToItemInternal(zombie.scripting.entity.components.crafting.OutputScript,zombie.inventory.InventoryItem,boolean,zombie.entity.components.crafting.recipe.CraftRecipeData.CacheData,int))
   52. [getUniqueRecipeItems(InventoryItem, IsoGameCharacter, ArrayList)](#getUniqueRecipeItems(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,java.util.ArrayList))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeManager
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.CraftRecipeManager

---

public class CraftRecipeManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `CraftRecipeManager.CraftRecipeListProvider`

  `static enum`

  `CraftRecipeManager.FilterMode`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static zombie.util.TaggedObjectManager<CraftRecipe>`

  `craftRecipeTagManager`

  `private static final float`

  `FLOAT_EPSILON`

  `private static boolean`

  `initialized`

  `private static final Map<IsoPlayer, CraftRecipeData>`

  `playerCraftDataMap`

  `private static final ArrayList<CraftRecipe>`

  `RecipeList`

  `private static List<CraftRecipe>`

  `unmodifiableAllRecipes`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CraftRecipeManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static boolean`

  `consumeInputEnergy(InputScript input,
  List<Resource> resources,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData)`

  `private static boolean`

  `consumeInputEnergyFromItemInternal(InputScript input,
  InventoryItem inventoryItem,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  int useQueued)`

  `private static boolean`

  `consumeInputFluid(InputScript input,
  List<Resource> resources,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  float useQueued)`

  `private static boolean`

  `consumeInputFluidInternal(InputScript input,
  FluidContainer fc,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  float useQueued)`

  `protected static boolean`

  `consumeInputFromResources(InputScript input,
  List<Resource> resources,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  IsoGameCharacter character,
  Set<Resource> usedResources)`

  `protected static boolean`

  `consumeInputItem(InputScript input,
  List<Resource> resources,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  IsoGameCharacter character,
  Set<Resource> usedResources)`

  `protected static boolean`

  `consumeInputItem(InputScript input,
  InventoryItem inventoryItem,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  IsoGameCharacter character)`

  `private static boolean`

  `consumeInputItemInternal(InputScript input,
  InventoryItem inventoryItem,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  IsoGameCharacter character)`

  `private static boolean`

  `consumeInputItemUsesInternal(InputScript input,
  InventoryItem inventoryItem,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  int useQueued)`

  `private static boolean`

  `consumesEntireItem(InputScript inputScript,
  InventoryItem item)`

  `private static boolean`

  `createOutputEnergy(OutputScript output,
  Resource resource,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData)`

  `private static boolean`

  `createOutputEnergyToItemInternal(OutputScript output,
  InventoryItem targetItem,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  int useQueued)`

  `private static boolean`

  `createOutputFluid(OutputScript output,
  Resource resource,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData)`

  `private static boolean`

  `createOutputFluidInternal(OutputScript output,
  FluidContainer fc,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  float useQueued)`

  `protected static boolean`

  `createOutputItem(OutputScript output,
  Item item,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  IsoGameCharacter character)`

  `private static boolean`

  `createOutputItemInternal(OutputScript output,
  Item item,
  boolean testOnly,
  CraftRecipeData.CacheData data,
  IsoGameCharacter character)`

  `private static boolean`

  `createOutputItemUsesInternal(OutputScript output,
  InventoryItem targetItem,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData,
  int useQueued)`

  `protected static boolean`

  `createOutputToResource(OutputScript output,
  Resource resource,
  boolean testOnly,
  CraftRecipeData.CacheData cacheData)`

  `static void`

  `debugPrintTagManager()`

  `static ArrayList<String>`

  `debugPrintTagManagerLines()`

  `static List<CraftRecipe>`

  `filterRecipeList(String filterString,
  List<CraftRecipe> listToPopulate)`

  `static List<CraftRecipe>`

  `filterRecipeList(String filterString,
  List<CraftRecipe> listToPopulate,
  List<CraftRecipe> sourceList)`

  Filters a list of CraftRecipe's based on supplied 'filterString'
  Filtering options:
  - No prefix, search if recipe name contains filter string
  - Prefix with '@' search if recipe mod name contains filter string
  - Prefix with '$' search if recipe has a tag containing filter string

  `static String`

  `FormatAndRegisterRecipeTagsQuery(String tagQueryString)`

  Can be used by scripts for example to preformat the tags string and cache query result list post script loading.

  `static ArrayList<InventoryItem>`

  `getAllItemsFromContainers(ArrayList<ItemContainer> containers,
  ArrayList<InventoryItem> items)`

  `static List<String>`

  `getAllRecipeTags()`

  `static ArrayList<InputScript>`

  `getAllValidInputScriptsForItem(CraftRecipe recipe,
  InventoryItem inventoryItem,
  IsoGameCharacter character)`

  `static ArrayList<InventoryItem>`

  `getAllValidItemsForRecipe(CraftRecipe recipe,
  ArrayList<InventoryItem> sourceItems,
  ArrayList<InventoryItem> filteredItems,
  IsoGameCharacter character)`

  `static int`

  `getAutoCraftCountItems(CraftRecipe recipe,
  ArrayList<InventoryItem> allItems)`

  for performance gain pass a list that has already filtered items down to only usable in recipe

  `static CraftRecipeData`

  `getCraftDataForPlayer(IsoPlayer player)`

  `static List<CraftRecipe>`

  `getRecipesForTag(String category)`

  `static List<String>`

  `getTagGroups()`

  `static ArrayList<CraftRecipe>`

  `getUniqueRecipeItems(InventoryItem item,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers)`

  `static InputScript`

  `getValidInputScriptForItem(CraftRecipe recipe,
  InventoryItem inventoryItem,
  IsoGameCharacter character)`

  `static boolean`

  `hasPlayerLearnedRecipe(CraftRecipe recipe,
  IsoGameCharacter character)`

  `static boolean`

  `hasPlayerRequiredSkill(CraftRecipe.RequiredSkill requiredSkill,
  IsoGameCharacter character)`

  `static void`

  `Init()`

  `private static boolean`

  `isCurrentCraftActionPending(IsoGameCharacter player,
  se.krka.kahlua.vm.KahluaTable action)`

  `static boolean`

  `isItemToolForRecipe(CraftRecipe recipe,
  InventoryItem inventoryItem,
  IsoGameCharacter character)`

  `static boolean`

  `isItemValidForInputScript(InputScript input,
  InventoryItem inventoryItem,
  IsoGameCharacter character)`

  `static boolean`

  `isItemValidForRecipe(CraftRecipe recipe,
  InventoryItem inventoryItem,
  IsoGameCharacter character)`

  `static boolean`

  `isValidRecipeForCharacter(CraftRecipe recipe,
  IsoGameCharacter character,
  CraftRecipeMonitor monitor,
  ArrayList<ItemContainer> containers)`

  `static float`

  `itemGetQueuedAmount(IsoGameCharacter player,
  InventoryItem item,
  CraftRecipeData.CacheData cacheData)`

  `static void`

  `LogAllRecipesToFile()`

  `static List<CraftRecipe>`

  `populateRecipeList(String tagQueryString,
  List<CraftRecipe> listToPopulate,
  boolean clearList)`

  Populate the supplied 'listToPopulate' with queried recipes.

  `static List<CraftRecipe>`

  `populateRecipeList(String tagQueryString,
  List<CraftRecipe> listToPopulate,
  List<CraftRecipe> sourceList,
  boolean clearList)`

  Populate the supplied 'filteredList' with queried recipes.

  `static List<CraftRecipe>`

  `queryRecipes(String tagQueryString)`

  The query string passed may contain whitelist and/or blacklist tags.

  `static List<CraftRecipe>`

  `queryRecipes(zombie.scripting.objects.CraftRecipeTag... craftRecipeTag)`

  `static void`

  `Reset()`

  `static String`

  `sanitizeTagQuery(String tagQueryString)`

  Formats and sanitizes a query string without registering tags.

  `private static boolean`

  `validateHasRequiredSkill(CraftRecipe recipe,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers)`

  `private static boolean`

  `validateInputScript(InputScript inputScript,
  ResourceType resourceType,
  boolean testOnly)`

  `private static boolean`

  `validateOutputScript(OutputScript outputScript,
  ResourceType resourceType,
  boolean testOnly)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### FLOAT\_EPSILON

    private static final float FLOAT\_EPSILON

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.entity.components.crafting.recipe.CraftRecipeManager.FLOAT_EPSILON)
  + ### initialized

    private static boolean initialized
  + ### craftRecipeTagManager

    private static zombie.util.TaggedObjectManager<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> craftRecipeTagManager
  + ### unmodifiableAllRecipes

    private static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> unmodifiableAllRecipes
  + ### playerCraftDataMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[IsoPlayer](../../../../characters/IsoPlayer.html "class in zombie.characters"), [CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe")> playerCraftDataMap
  + ### RecipeList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> RecipeList
* Constructor Details
  -------------------

  + ### CraftRecipeManager

    public CraftRecipeManager()
* Method Details
  --------------

  + ### Reset

    public static void Reset()
  + ### Init

    public static void Init()
  + ### FormatAndRegisterRecipeTagsQuery

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FormatAndRegisterRecipeTagsQuery([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tagQueryString)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Can be used by scripts for example to preformat the tags string and cache query result list post script loading.
    If not called during script loading the tagQueryString will be processed and cached once encountered.

    Throws:
    :   `Exception`
  + ### sanitizeTagQuery

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sanitizeTagQuery([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tagQueryString)

    Formats and sanitizes a query string without registering tags.
  + ### getRecipesForTag

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getRecipesForTag([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getAllRecipeTags

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllRecipeTags()
  + ### getTagGroups

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTagGroups()
  + ### debugPrintTagManager

    public static void debugPrintTagManager()
  + ### debugPrintTagManagerLines

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> debugPrintTagManagerLines()
  + ### LogAllRecipesToFile

    public static void LogAllRecipesToFile()
  + ### queryRecipes

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> queryRecipes([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tagQueryString)

    The query string passed may contain whitelist and/or blacklist tags.
    The tags should be separated by ';' and whitelist and blacklist are separated by '-' where whitelist is left side of separator.
    Example whitelist only:
    "Tag1;Tag2"
    Example whitelist and blacklist:
    "Tag1;Tag2-Tag3"
    Example blacklist only:
    "-Tag1;Tag2"
    The returned list is a unmodifiable view of a backing ArrayList that is cached for identical queries.
    Queries are case insensitive.
    Special case "\*" added that returns full craft recipe list.
    NOTE: the returned List may grow as new tags/tagged objects could potentially be added any time (but not removed)
    It is also assumed that tags of a TaggedObject don't change post initialization.

    Returns:
    :   unmodifiable list of queried CraftRecipes
  + ### queryRecipes

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> queryRecipes(zombie.scripting.objects.CraftRecipeTag... craftRecipeTag)
  + ### populateRecipeList

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> populateRecipeList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tagQueryString,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> listToPopulate,
    boolean clearList)

    Populate the supplied 'listToPopulate' with queried recipes.
    Note: This method does not use caching and will iterate/test the objects each call.

    Returns:
    :   returns the supplied 'filteredList'
  + ### populateRecipeList

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> populateRecipeList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tagQueryString,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> listToPopulate,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> sourceList,
    boolean clearList)

    Populate the supplied 'filteredList' with queried recipes.
    If 'sourceList' is not null it will be used to collect objects from, otherwise defaults to all registered recipes.
    Note: This method does not use caching and will iterate/test the objects each call.

    Returns:
    :   returns the supplied 'filteredList'
  + ### filterRecipeList

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> filterRecipeList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterString,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> listToPopulate)
  + ### filterRecipeList

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> filterRecipeList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterString,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> listToPopulate,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> sourceList)

    Filters a list of CraftRecipe's based on supplied 'filterString'
    Filtering options:
    - No prefix, search if recipe name contains filter string
    - Prefix with '@' search if recipe mod name contains filter string
    - Prefix with '$' search if recipe has a tag containing filter string
  + ### getCraftDataForPlayer

    public static [CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getCraftDataForPlayer([IsoPlayer](../../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### getAllItemsFromContainers

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllItemsFromContainers([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### getAllValidItemsForRecipe

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getAllValidItemsForRecipe([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> sourceItems,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> filteredItems,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getValidInputScriptForItem

    public static [InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") getValidInputScriptForItem([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getAllValidInputScriptsForItem

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting")> getAllValidInputScriptsForItem([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### isItemToolForRecipe

    public static boolean isItemToolForRecipe([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### isItemValidForRecipe

    public static boolean isItemValidForRecipe([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### isItemValidForInputScript

    public static boolean isItemValidForInputScript([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### isValidRecipeForCharacter

    public static boolean isValidRecipeForCharacter([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [CraftRecipeMonitor](../CraftRecipeMonitor.html "class in zombie.entity.components.crafting") monitor,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### validateHasRequiredSkill

    private static boolean validateHasRequiredSkill([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)
  + ### hasPlayerLearnedRecipe

    public static boolean hasPlayerLearnedRecipe([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### hasPlayerRequiredSkill

    public static boolean hasPlayerRequiredSkill([CraftRecipe.RequiredSkill](../../../../scripting/entity/components/crafting/CraftRecipe.RequiredSkill.html "class in zombie.scripting.entity.components.crafting") requiredSkill,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### getAutoCraftCountItems

    public static int getAutoCraftCountItems([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> allItems)

    for performance gain pass a list that has already filtered items down to only usable in recipe
  + ### validateInputScript

    private static boolean validateInputScript([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [ResourceType](../../resources/ResourceType.html "enum class in zombie.entity.components.resources") resourceType,
    boolean testOnly)
  + ### validateOutputScript

    private static boolean validateOutputScript([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") outputScript,
    [ResourceType](../../resources/ResourceType.html "enum class in zombie.entity.components.resources") resourceType,
    boolean testOnly)
  + ### isCurrentCraftActionPending

    private static boolean isCurrentCraftActionPending([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") player,
    se.krka.kahlua.vm.KahluaTable action)
  + ### consumesEntireItem

    private static boolean consumesEntireItem([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### itemGetQueuedAmount

    public static float itemGetQueuedAmount([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") player,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData)
  + ### consumeInputFromResources

    protected static boolean consumeInputFromResources([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> usedResources)
  + ### consumeInputItem

    protected static boolean consumeInputItem([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> usedResources)
  + ### consumeInputItem

    protected static boolean consumeInputItem([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### consumeInputItemInternal

    private static boolean consumeInputItemInternal([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### consumeInputItemUsesInternal

    private static boolean consumeInputItemUsesInternal([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    int useQueued)
  + ### consumeInputFluid

    private static boolean consumeInputFluid([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    float useQueued)
  + ### consumeInputFluidInternal

    private static boolean consumeInputFluidInternal([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [FluidContainer](../../fluids/FluidContainer.html "class in zombie.entity.components.fluids") fc,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    float useQueued)
  + ### consumeInputEnergy

    private static boolean consumeInputEnergy([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData)
  + ### consumeInputEnergyFromItemInternal

    private static boolean consumeInputEnergyFromItemInternal([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    int useQueued)
  + ### createOutputToResource

    protected static boolean createOutputToResource([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [Resource](../../resources/Resource.html "class in zombie.entity.components.resources") resource,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData)
  + ### createOutputItem

    protected static boolean createOutputItem([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### createOutputItemInternal

    private static boolean createOutputItemInternal([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") data,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### createOutputItemUsesInternal

    private static boolean createOutputItemUsesInternal([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") targetItem,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    int useQueued)
  + ### createOutputFluid

    private static boolean createOutputFluid([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [Resource](../../resources/Resource.html "class in zombie.entity.components.resources") resource,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData)
  + ### createOutputFluidInternal

    private static boolean createOutputFluidInternal([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [FluidContainer](../../fluids/FluidContainer.html "class in zombie.entity.components.fluids") fc,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    float useQueued)
  + ### createOutputEnergy

    private static boolean createOutputEnergy([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [Resource](../../resources/Resource.html "class in zombie.entity.components.resources") resource,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData)
  + ### createOutputEnergyToItemInternal

    private static boolean createOutputEnergyToItemInternal([OutputScript](../../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output,
    [InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") targetItem,
    boolean testOnly,
    [CraftRecipeData.CacheData](CraftRecipeData.CacheData.html "class in zombie.entity.components.crafting.recipe") cacheData,
    int useQueued)
  + ### getUniqueRecipeItems

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getUniqueRecipeItems([InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../../../../inventory/ItemContainer.html "class in zombie.inventory")> containers)