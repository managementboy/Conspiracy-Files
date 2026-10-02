[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [RecipeManager](RecipeManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [RecipeList](#RecipeList)
6. [Constructor Details](#constructor-detail)
   1. [RecipeManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [ScriptsLoaded()](#ScriptsLoaded())
   2. [resolveItemModuleDotType(Recipe, String, Set, String)](#resolveItemModuleDotType(zombie.scripting.objects.Recipe,java.lang.String,java.util.Set,java.lang.String))
   3. [LoadedAfterLua()](#LoadedAfterLua())
   4. [testLuaFunction(Recipe, String, String)](#testLuaFunction(zombie.scripting.objects.Recipe,java.lang.String,java.lang.String))
   5. [getKnownRecipesNumber(IsoGameCharacter)](#getKnownRecipesNumber(zombie.characters.IsoGameCharacter))
   6. [getUniqueRecipeItems(InventoryItem, IsoGameCharacter, ArrayList)](#getUniqueRecipeItems(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,java.util.ArrayList))
   7. [IsRecipeValid(Recipe, IsoGameCharacter, InventoryItem, ArrayList)](#IsRecipeValid(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,java.util.ArrayList))
   8. [printDebugRecipeValid(Recipe, IsoGameCharacter, InventoryItem, ArrayList)](#printDebugRecipeValid(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,java.util.ArrayList))
   9. [validateNearIsoObject(Recipe, IsoGameCharacter)](#validateNearIsoObject(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter))
   10. [validateCanPerform(Recipe, IsoGameCharacter, InventoryItem)](#validateCanPerform(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   11. [validateHasRequiredSkill(Recipe, IsoGameCharacter)](#validateHasRequiredSkill(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter))
   12. [validateRecipeContainsSourceItem(Recipe, InventoryItem)](#validateRecipeContainsSourceItem(zombie.scripting.objects.Recipe,zombie.inventory.InventoryItem))
   13. [validateHasAllRequiredItems(Recipe, IsoGameCharacter, InventoryItem, ArrayList)](#validateHasAllRequiredItems(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,java.util.ArrayList))
   14. [validateHasHeat(Recipe, InventoryItem, ArrayList, IsoGameCharacter)](#validateHasHeat(zombie.scripting.objects.Recipe,zombie.inventory.InventoryItem,java.util.ArrayList,zombie.characters.IsoGameCharacter))
   15. [getAvailableItemsAll(Recipe, IsoGameCharacter, ArrayList, InventoryItem, ArrayList)](#getAvailableItemsAll(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.inventory.InventoryItem,java.util.ArrayList))
   16. [getAvailableItemsNeeded(Recipe, IsoGameCharacter, ArrayList, InventoryItem, ArrayList)](#getAvailableItemsNeeded(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.inventory.InventoryItem,java.util.ArrayList))
   17. [getSourceItemsAll(Recipe, int, IsoGameCharacter, ArrayList, InventoryItem, ArrayList)](#getSourceItemsAll(zombie.scripting.objects.Recipe,int,zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.inventory.InventoryItem,java.util.ArrayList))
   18. [getSourceItemsNeeded(Recipe, int, IsoGameCharacter, ArrayList, InventoryItem, ArrayList)](#getSourceItemsNeeded(zombie.scripting.objects.Recipe,int,zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.inventory.InventoryItem,java.util.ArrayList))
   19. [getNumberOfTimesRecipeCanBeDone(Recipe, IsoGameCharacter, ArrayList, InventoryItem)](#getNumberOfTimesRecipeCanBeDone(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.inventory.InventoryItem))
   20. [PerformMakeItem(Recipe, InventoryItem, IsoGameCharacter, ArrayList)](#PerformMakeItem(zombie.scripting.objects.Recipe,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,java.util.ArrayList))
   21. [getAllEvolvedRecipes()](#getAllEvolvedRecipes())
   22. [getEvolvedRecipe(InventoryItem, IsoGameCharacter, ArrayList, boolean)](#getEvolvedRecipe(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,java.util.ArrayList,boolean))
   23. [getDismantleRecipeFor(String)](#getDismantleRecipeFor(java.lang.String))
   24. [GetMovableRecipeTool(boolean, Recipe, InventoryItem, IsoGameCharacter, ArrayList)](#GetMovableRecipeTool(boolean,zombie.scripting.objects.Recipe,zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,java.util.ArrayList))
   25. [HasAllRequiredItems(Recipe, IsoGameCharacter, InventoryItem, ArrayList)](#HasAllRequiredItems(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,java.util.ArrayList))
   26. [isAllItemsUsableRotten(Recipe, IsoGameCharacter, InventoryItem, ArrayList)](#isAllItemsUsableRotten(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem,java.util.ArrayList))
   27. [hasHeat(Recipe, InventoryItem, ArrayList, IsoGameCharacter)](#hasHeat(zombie.scripting.objects.Recipe,zombie.inventory.InventoryItem,java.util.ArrayList,zombie.characters.IsoGameCharacter))
   28. [DebugPrintAllRecipes()](#DebugPrintAllRecipes())
   29. [IsItemDestroyed(String, Recipe)](#IsItemDestroyed(java.lang.String,zombie.scripting.objects.Recipe))
   30. [UseAmount(String, Recipe, IsoGameCharacter)](#UseAmount(java.lang.String,zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter))
   31. [DoesWipeUseDelta(String, String)](#DoesWipeUseDelta(java.lang.String,java.lang.String))
   32. [DoesUseItemUp(String, Recipe)](#DoesUseItemUp(java.lang.String,zombie.scripting.objects.Recipe))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RecipeManager
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.RecipeManager

---

public class RecipeManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<Recipe>`

  `RecipeList`

  Temporary list that gets populated by recipes to return for some functions.
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RecipeManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `DebugPrintAllRecipes()`

  TODO UNUSED DEBUG FUNCTION

  `static boolean`

  `DoesUseItemUp(String itemToUse,
  Recipe recipe)`

  Deprecated.

  `static boolean`

  `DoesWipeUseDelta(String itemToUse,
  String itemToMake)`

  Deprecated.

  `static ArrayList<EvolvedRecipe>`

  `getAllEvolvedRecipes()`

  Referenced in lua

  `static ArrayList<InventoryItem>`

  `getAvailableItemsAll(Recipe recipe,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers,
  InventoryItem selectedItem,
  ArrayList<InventoryItem> ignoreItems)`

  Returns all the items from provided containers that match any of the sources
  however, note that if a source is not fully satisfied (count or use wise)
  then the items matching that particular source will not be included

  `static ArrayList<InventoryItem>`

  `getAvailableItemsNeeded(Recipe recipe,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers,
  InventoryItem selectedItem,
  ArrayList<InventoryItem> ignoreItems)`

  Returns the items from provided containers required to perform one craft
  if the recipe is invalid or one or more sources are not satisfied (count or use wise) the returned list will be empty.

  `static Recipe`

  `getDismantleRecipeFor(String item)`

  Referenced in lua

  `static ArrayList<EvolvedRecipe>`

  `getEvolvedRecipe(InventoryItem baseItem,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers,
  boolean need1ingredient)`

  Referenced in lua

  `static int`

  `getKnownRecipesNumber(IsoGameCharacter chr)`

  Returns the number of recipes known by character.

  `static InventoryItem`

  `GetMovableRecipeTool(boolean isPrimary,
  Recipe recipe,
  InventoryItem selectedItem,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers)`

  Referenced in lua

  `static int`

  `getNumberOfTimesRecipeCanBeDone(Recipe recipe,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers,
  InventoryItem selectedItem)`

  Returns the amount of times recipe can be performed with the items from provided containers

  `static ArrayList<InventoryItem>`

  `getSourceItemsAll(Recipe recipe,
  int sourceIndex,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers,
  InventoryItem selectedItem,
  ArrayList<InventoryItem> ignoreItems)`

  Returns all the items from provided containers that match the source at index `sourceIndex`
  however, note that if the source is not fully satisfied (count or use wise)
  then the resulting list will be empty

  `static ArrayList<InventoryItem>`

  `getSourceItemsNeeded(Recipe recipe,
  int sourceIndex,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers,
  InventoryItem selectedItem,
  ArrayList<InventoryItem> ignoreItems)`

  Returns the items from provided containers for source at index `sourceIndex` required to perform one craft
  if the recipe is invalid or the sources is not satisfied (count or use wise) the returned list will be empty.

  `static ArrayList<Recipe>`

  `getUniqueRecipeItems(InventoryItem item,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers)`

  Returns `ArrayList` containing all recipes using the `item` specified.

  `static boolean`

  `HasAllRequiredItems(Recipe recipe,
  IsoGameCharacter chr,
  InventoryItem selectedItem,
  ArrayList<ItemContainer> containers)`

  Provided in case mods call this public function.

  `static boolean`

  `hasHeat(Recipe recipe,
  InventoryItem item,
  ArrayList<ItemContainer> containers,
  IsoGameCharacter chr)`

  Provided in case mods call this public function

  `static boolean`

  `isAllItemsUsableRotten(Recipe recipe,
  IsoGameCharacter chr,
  InventoryItem selectedItem,
  ArrayList<ItemContainer> containers)`

  Purpose: If the recipe is food based, does the player have any rotten food items, and a high enough skill level to use said items?

  `static boolean`

  `IsItemDestroyed(String itemToUse,
  Recipe recipe)`

  Deprecated.

  `static boolean`

  `IsRecipeValid(Recipe recipe,
  IsoGameCharacter chr,
  InventoryItem item,
  ArrayList<ItemContainer> containers)`

  Returns whether the `character` specified can perform this recipe.

  `static void`

  `LoadedAfterLua()`

  Called when lua files are done loading.

  `static ArrayList<InventoryItem>`

  `PerformMakeItem(Recipe recipe,
  InventoryItem selectedItem,
  IsoGameCharacter chr,
  ArrayList<ItemContainer> containers)`

  Main method to make the item
  Referenced in lua

  `static void`

  `printDebugRecipeValid(Recipe recipe,
  IsoGameCharacter chr,
  InventoryItem item,
  ArrayList<ItemContainer> containers)`

  Debug print option

  `private static Item`

  `resolveItemModuleDotType(Recipe recipe,
  String sourceType,
  Set<String> reported,
  String errorMsg)`

  `static void`

  `ScriptsLoaded()`

  Called when ScriptManager has loaded all scripts.

  `private static void`

  `testLuaFunction(Recipe recipe,
  String functionName,
  String varName)`

  `static float`

  `UseAmount(String sourceFullType,
  Recipe recipe,
  IsoGameCharacter chr)`

  Deprecated.

  `private static boolean`

  `validateCanPerform(Recipe recipe,
  IsoGameCharacter chr,
  InventoryItem item)`

  Test if the `character` can perform this `recipe`.

  `private static boolean`

  `validateHasAllRequiredItems(Recipe recipe,
  IsoGameCharacter chr,
  InventoryItem selectedItem,
  ArrayList<ItemContainer> containers)`

  NOTE: Only used in IsRecipeValid
  Test if recipe has all required items.

  `static boolean`

  `validateHasHeat(Recipe recipe,
  InventoryItem item,
  ArrayList<ItemContainer> containers,
  IsoGameCharacter chr)`

  NOTE: Only used in IsRecipeValid
  Test if recipe has heat?

  `private static boolean`

  `validateHasRequiredSkill(Recipe recipe,
  IsoGameCharacter chr)`

  Tests if the specified `character` has the required skill level defined in the `recipe`.

  `private static boolean`

  `validateNearIsoObject(Recipe recipe,
  IsoGameCharacter chr)`

  NOTE: Only used in IsRecipeValid
  Test if the `character` specified is in range of an 'IsoObject'.

  `static boolean`

  `validateRecipeContainsSourceItem(Recipe recipe,
  InventoryItem item)`

  Test if the recipe contains the specified `item` as source item.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### RecipeList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects")> RecipeList

    Temporary list that gets populated by recipes to return for some functions.
* Constructor Details
  -------------------

  + ### RecipeManager

    public RecipeManager()
* Method Details
  --------------

  + ### ScriptsLoaded

    public static void ScriptsLoaded()

    Called when ScriptManager has loaded all scripts.
    Resolves item modules.
  + ### resolveItemModuleDotType

    private static [Item](../scripting/objects/Item.html "class in zombie.scripting.objects") resolveItemModuleDotType([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sourceType,
    [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> reported,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") errorMsg)
  + ### LoadedAfterLua

    public static void LoadedAfterLua()

    Called when lua files are done loading.
    Verifies lua callbacks and source item types formatted with [Recipe.GetItemTypes]
  + ### testLuaFunction

    private static void testLuaFunction([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") varName)
  + ### getKnownRecipesNumber

    public static int getKnownRecipesNumber([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Returns the number of recipes known by character.
    Used in ISCraftingUI.lua.
  + ### getUniqueRecipeItems

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects")> getUniqueRecipeItems([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers)

    Returns `ArrayList` containing all recipes using the `item` specified.
    Used in lua context menu's.
  + ### IsRecipeValid

    public static boolean IsRecipeValid([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers)

    Returns whether the `character` specified can perform this recipe.
    Called in various lua files.

    Returns:
    :   `true` if recipe is valid for this character.
  + ### printDebugRecipeValid

    public static void printDebugRecipeValid([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers)

    Debug print option
  + ### validateNearIsoObject

    private static boolean validateNearIsoObject([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    NOTE: Only used in IsRecipeValid
    Test if the `character` specified is in range of an 'IsoObject'.
    The object is specified in the recipe script as `RequiredNearObject`.
  + ### validateCanPerform

    private static boolean validateCanPerform([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") item)

    Test if the `character` can perform this `recipe`.
    If the recipe has a `CanPerform` lua reference set, that function will be called and the result returned.
    Otherwise returns true.
    If CanPerform is set, but the function is not found returns false.
    NOTE: Only used in IsRecipeValid
  + ### validateHasRequiredSkill

    private static boolean validateHasRequiredSkill([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Tests if the specified `character` has the required skill level defined in the `recipe`.
    NOTE: Only used in IsRecipeValid
  + ### validateRecipeContainsSourceItem

    public static boolean validateRecipeContainsSourceItem([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") item)

    Test if the recipe contains the specified `item` as source item.
  + ### validateHasAllRequiredItems

    private static boolean validateHasAllRequiredItems([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers)

    NOTE: Only used in IsRecipeValid
    Test if recipe has all required items.
  + ### validateHasHeat

    public static boolean validateHasHeat([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    NOTE: Only used in IsRecipeValid
    Test if recipe has heat?
  + ### getAvailableItemsAll

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAvailableItemsAll([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> ignoreItems)

    Returns all the items from provided containers that match any of the sources
    however, note that if a source is not fully satisfied (count or use wise)
    then the items matching that particular source will not be included
  + ### getAvailableItemsNeeded

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAvailableItemsNeeded([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> ignoreItems)

    Returns the items from provided containers required to perform one craft
    if the recipe is invalid or one or more sources are not satisfied (count or use wise) the returned list will be empty.
  + ### getSourceItemsAll

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSourceItemsAll([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    int sourceIndex,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> ignoreItems)

    Returns all the items from provided containers that match the source at index `sourceIndex`
    however, note that if the source is not fully satisfied (count or use wise)
    then the resulting list will be empty
  + ### getSourceItemsNeeded

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSourceItemsNeeded([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    int sourceIndex,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> ignoreItems)

    Returns the items from provided containers for source at index `sourceIndex` required to perform one craft
    if the recipe is invalid or the sources is not satisfied (count or use wise) the returned list will be empty.
  + ### getNumberOfTimesRecipeCanBeDone

    public static int getNumberOfTimesRecipeCanBeDone([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem)

    Returns the amount of times recipe can be performed with the items from provided containers
  + ### PerformMakeItem

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> PerformMakeItem([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers)

    Main method to make the item
    Referenced in lua
  + ### getAllEvolvedRecipes

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EvolvedRecipe](../scripting/objects/EvolvedRecipe.html "class in zombie.scripting.objects")> getAllEvolvedRecipes()

    Referenced in lua
  + ### getEvolvedRecipe

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EvolvedRecipe](../scripting/objects/EvolvedRecipe.html "class in zombie.scripting.objects")> getEvolvedRecipe([InventoryItem](InventoryItem.html "class in zombie.inventory") baseItem,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers,
    boolean need1ingredient)

    Referenced in lua
  + ### getDismantleRecipeFor

    public static [Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") getDismantleRecipeFor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)

    Referenced in lua
  + ### GetMovableRecipeTool

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") GetMovableRecipeTool(boolean isPrimary,
    [Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers)

    Referenced in lua
  + ### HasAllRequiredItems

    public static boolean HasAllRequiredItems([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers)

    Provided in case mods call this public function.
  + ### isAllItemsUsableRotten

    public static boolean isAllItemsUsableRotten([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers)

    Purpose: If the recipe is food based, does the player have any rotten food items, and a high enough skill level to use said items?
  + ### hasHeat

    public static boolean hasHeat([Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Provided in case mods call this public function
  + ### DebugPrintAllRecipes

    private static void DebugPrintAllRecipes()

    TODO UNUSED DEBUG FUNCTION
  + ### IsItemDestroyed

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static boolean IsItemDestroyed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemToUse,
    [Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe)

    Deprecated.

    These methods seem to be no longer in use, possibly remove?
    Todo do mods use these methods?
  + ### UseAmount

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static float UseAmount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sourceFullType,
    [Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Deprecated.
  + ### DoesWipeUseDelta

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static boolean DoesWipeUseDelta([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemToUse,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemToMake)

    Deprecated.
  + ### DoesUseItemUp

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static boolean DoesUseItemUp([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemToUse,
    [Recipe](../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe)

    Deprecated.