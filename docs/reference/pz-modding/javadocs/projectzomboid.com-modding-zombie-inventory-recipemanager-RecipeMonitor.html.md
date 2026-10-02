[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.recipemanager](package-summary.html)
2. [RecipeMonitor](RecipeMonitor.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [enabled](#enabled)
   2. [suspended](#suspended)
   3. [monitorID](#monitorID)
   4. [tabs](#tabs)
   5. [tabStr](#tabStr)
   6. [tabSize](#tabSize)
   7. [defColor](#defColor)
   8. [colGray](#colGray)
   9. [colNeg](#colNeg)
   10. [colPos](#colPos)
   11. [colHeader](#colHeader)
   12. [lines](#lines)
   13. [colors](#colors)
   14. [recipeName](#recipeName)
   15. [lastRecipe](#lastRecipe)
   16. [recipeLines](#recipeLines)
6. [Constructor Details](#constructor-detail)
   1. [RecipeMonitor()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Enable(boolean)](#Enable(boolean))
   2. [IsEnabled()](#IsEnabled())
   3. [getMonitorID()](#getMonitorID())
   4. [StartMonitor()](#StartMonitor())
   5. [getColGray()](#getColGray())
   6. [getColBlack()](#getColBlack())
   7. [setRecipe(Recipe)](#setRecipe(zombie.scripting.objects.Recipe))
   8. [getRecipeName()](#getRecipeName())
   9. [getRecipe()](#getRecipe())
   10. [getRecipeLines()](#getRecipeLines())
   11. [canLog()](#canLog())
   12. [suspend()](#suspend())
   13. [resume()](#resume())
   14. [Log(String)](#Log(java.lang.String))
   15. [Log(String, Color)](#Log(java.lang.String,zombie.core.Color))
   16. [LogBlanc()](#LogBlanc())
   17. [LogList(String, ArrayList)](#LogList(java.lang.String,java.util.ArrayList))
   18. [LogInit(Recipe, IsoGameCharacter, ArrayList, InventoryItem, ArrayList, boolean)](#LogInit(zombie.scripting.objects.Recipe,zombie.characters.IsoGameCharacter,java.util.ArrayList,zombie.inventory.InventoryItem,java.util.ArrayList,boolean))
   19. [getContainerString(ItemContainer)](#getContainerString(zombie.inventory.ItemContainer))
   20. [LogContainers(String, ArrayList)](#LogContainers(java.lang.String,java.util.ArrayList))
   21. [LogContainers(String, ArrayList, boolean)](#LogContainers(java.lang.String,java.util.ArrayList,boolean))
   22. [LogSources(List)](#LogSources(java.util.List))
   23. [LogSource(String, Recipe.Source)](#LogSource(java.lang.String,zombie.scripting.objects.Recipe.Source))
   24. [LogItem(String, InventoryItem)](#LogItem(java.lang.String,zombie.inventory.InventoryItem))
   25. [getResultString(Recipe.Result)](#getResultString(zombie.scripting.objects.Recipe.Result))
   26. [setTabStr()](#setTabStr())
   27. [ResetTabs()](#ResetTabs())
   28. [SetTab(int)](#SetTab(int))
   29. [IncTab()](#IncTab())
   30. [DecTab()](#DecTab())
   31. [GetLines()](#GetLines())
   32. [GetColors()](#GetColors())
   33. [GetColorForLine(int)](#GetColorForLine(int))
   34. [GetSaveDir()](#GetSaveDir())
   35. [SaveToFile()](#SaveToFile())
   36. [w\_blanc(BufferedWriter)](#w_blanc(java.io.BufferedWriter))
   37. [w\_write(BufferedWriter, String)](#w_write(java.io.BufferedWriter,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RecipeMonitor
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.recipemanager.RecipeMonitor

---

public class RecipeMonitor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final Color`

  `colGray`

  `static final Color`

  `colHeader`

  `static final Color`

  `colNeg`

  `private static final ArrayList<Color>`

  `colors`

  `static final Color`

  `colPos`

  `private static final Color`

  `defColor`

  `private static boolean`

  `enabled`

  `private static Recipe`

  `lastRecipe`

  `private static final ArrayList<String>`

  `lines`

  `private static int`

  `monitorID`

  `private static final ArrayList<String>`

  `recipeLines`

  `private static String`

  `recipeName`

  `private static boolean`

  `suspended`

  `private static int`

  `tabs`

  `private static final String`

  `tabSize`

  `private static String`

  `tabStr`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RecipeMonitor()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `static boolean`

  `canLog()`

  `static void`

  `DecTab()`

  `static void`

  `Enable(boolean b)`

  `static Color`

  `getColBlack()`

  `static Color`

  `getColGray()`

  `static Color`

  `GetColorForLine(int i)`

  `static ArrayList<Color>`

  `GetColors()`

  `static String`

  `getContainerString(ItemContainer container)`

  `static ArrayList<String>`

  `GetLines()`

  `static int`

  `getMonitorID()`

  `static Recipe`

  `getRecipe()`

  `static ArrayList<String>`

  `getRecipeLines()`

  Deprecated.

  `static String`

  `getRecipeName()`

  `static String`

  `getResultString(Recipe.Result result)`

  `static String`

  `GetSaveDir()`

  `static void`

  `IncTab()`

  `static boolean`

  `IsEnabled()`

  `static void`

  `Log(String s)`

  `static void`

  `Log(String s,
  Color c)`

  `static void`

  `LogBlanc()`

  `private static void`

  `LogContainers(String tag,
  ArrayList<ItemContainer> containers)`

  `private static void`

  `LogContainers(String tag,
  ArrayList<ItemContainer> containers,
  boolean full)`

  `static void`

  `LogInit(Recipe recipe,
  IsoGameCharacter character,
  ArrayList<ItemContainer> containers,
  InventoryItem selectedItem,
  ArrayList<InventoryItem> ignoreItems,
  boolean allItems)`

  `static void`

  `LogItem(String tag,
  InventoryItem item)`

  `static <T> void`

  `LogList(String tag,
  ArrayList<T> sourceTypes)`

  `private static void`

  `LogSource(String tag,
  Recipe.Source source)`

  `static void`

  `LogSources(List<Recipe.Source> sources)`

  `static void`

  `ResetTabs()`

  `static void`

  `resume()`

  `static void`

  `SaveToFile()`

  `static void`

  `setRecipe(Recipe recipe)`

  `static void`

  `SetTab(int i)`

  `private static void`

  `setTabStr()`

  `static void`

  `StartMonitor()`

  `static void`

  `suspend()`

  `private static void`

  `w_blanc(BufferedWriter w)`

  `private static void`

  `w_write(BufferedWriter w,
  String line)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### enabled

    private static boolean enabled
  + ### suspended

    private static boolean suspended
  + ### monitorID

    private static int monitorID
  + ### tabs

    private static int tabs
  + ### tabStr

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tabStr
  + ### tabSize

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tabSize

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.inventory.recipemanager.RecipeMonitor.tabSize)
  + ### defColor

    private static final [Color](../../core/Color.html "class in zombie.core") defColor
  + ### colGray

    public static final [Color](../../core/Color.html "class in zombie.core") colGray
  + ### colNeg

    public static final [Color](../../core/Color.html "class in zombie.core") colNeg
  + ### colPos

    public static final [Color](../../core/Color.html "class in zombie.core") colPos
  + ### colHeader

    public static final [Color](../../core/Color.html "class in zombie.core") colHeader
  + ### lines

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> lines
  + ### colors

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Color](../../core/Color.html "class in zombie.core")> colors
  + ### recipeName

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeName
  + ### lastRecipe

    private static [Recipe](../../scripting/objects/Recipe.html "class in zombie.scripting.objects") lastRecipe
  + ### recipeLines

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> recipeLines
* Constructor Details
  -------------------

  + ### RecipeMonitor

    public RecipeMonitor()
* Method Details
  --------------

  + ### Enable

    public static void Enable(boolean b)
  + ### IsEnabled

    public static boolean IsEnabled()
  + ### getMonitorID

    public static int getMonitorID()
  + ### StartMonitor

    public static void StartMonitor()
  + ### getColGray

    public static [Color](../../core/Color.html "class in zombie.core") getColGray()
  + ### getColBlack

    public static [Color](../../core/Color.html "class in zombie.core") getColBlack()
  + ### setRecipe

    public static void setRecipe([Recipe](../../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe)
  + ### getRecipeName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeName()
  + ### getRecipe

    public static [Recipe](../../scripting/objects/Recipe.html "class in zombie.scripting.objects") getRecipe()
  + ### getRecipeLines

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getRecipeLines()

    Deprecated.
  + ### canLog

    public static boolean canLog()
  + ### suspend

    public static void suspend()
  + ### resume

    public static void resume()
  + ### Log

    public static void Log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### Log

    public static void Log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    [Color](../../core/Color.html "class in zombie.core") c)
  + ### LogBlanc

    public static void LogBlanc()
  + ### LogList

    public static <T> void LogList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<T> sourceTypes)
  + ### LogInit

    public static void LogInit([Recipe](../../scripting/objects/Recipe.html "class in zombie.scripting.objects") recipe,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../ItemContainer.html "class in zombie.inventory")> containers,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") selectedItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../InventoryItem.html "class in zombie.inventory")> ignoreItems,
    boolean allItems)
  + ### getContainerString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerString([ItemContainer](../ItemContainer.html "class in zombie.inventory") container)
  + ### LogContainers

    private static void LogContainers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../ItemContainer.html "class in zombie.inventory")> containers)
  + ### LogContainers

    private static void LogContainers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../ItemContainer.html "class in zombie.inventory")> containers,
    boolean full)
  + ### LogSources

    public static void LogSources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Recipe.Source](../../scripting/objects/Recipe.Source.html "class in zombie.scripting.objects")> sources)
  + ### LogSource

    private static void LogSource([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag,
    [Recipe.Source](../../scripting/objects/Recipe.Source.html "class in zombie.scripting.objects") source)
  + ### LogItem

    public static void LogItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag,
    [InventoryItem](../InventoryItem.html "class in zombie.inventory") item)
  + ### getResultString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getResultString([Recipe.Result](../../scripting/objects/Recipe.Result.html "class in zombie.scripting.objects") result)
  + ### setTabStr

    private static void setTabStr()
  + ### ResetTabs

    public static void ResetTabs()
  + ### SetTab

    public static void SetTab(int i)
  + ### IncTab

    public static void IncTab()
  + ### DecTab

    public static void DecTab()
  + ### GetLines

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> GetLines()
  + ### GetColors

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Color](../../core/Color.html "class in zombie.core")> GetColors()
  + ### GetColorForLine

    public static [Color](../../core/Color.html "class in zombie.core") GetColorForLine(int i)
  + ### GetSaveDir

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetSaveDir()
  + ### SaveToFile

    public static void SaveToFile()
  + ### w\_blanc

    private static void w\_blanc([BufferedWriter](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/BufferedWriter.html "class or interface in java.io") w)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### w\_write

    private static void w\_write([BufferedWriter](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/BufferedWriter.html "class or interface in java.io") w,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`