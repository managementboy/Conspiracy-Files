[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [Translator](Translator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [LOOKALIKE\_CHARS](#LOOKALIKE_CHARS)
   2. [availableLanguage](#availableLanguage)
   3. [debug](#debug)
   4. [debugFile](#debugFile)
   5. [debugErrors](#debugErrors)
   6. [debugItemEvolvedRecipeName](#debugItemEvolvedRecipeName)
   7. [debugItem](#debugItem)
   8. [debugMultiStageBuild](#debugMultiStageBuild)
   9. [debugRecipe](#debugRecipe)
   10. [debugRecipeGroups](#debugRecipeGroups)
   11. [moodles](#moodles)
   12. [ui](#ui)
   13. [survivalGuide](#survivalGuide)
   14. [contextMenu](#contextMenu)
   15. [farming](#farming)
   16. [recipe](#recipe)
   17. [recipeGroups](#recipeGroups)
   18. [igui](#igui)
   19. [sandbox](#sandbox)
   20. [tooltip](#tooltip)
   21. [challenge](#challenge)
   22. [missing](#missing)
   23. [azertyLanguages](#azertyLanguages)
   24. [stash](#stash)
   25. [moveables](#moveables)
   26. [makeup](#makeup)
   27. [gameSound](#gameSound)
   28. [dynamicRadio](#dynamicRadio)
   29. [items](#items)
   30. [itemName](#itemName)
   31. [itemEvolvedRecipeName](#itemEvolvedRecipeName)
   32. [recordedMedia](#recordedMedia)
   33. [recordedMedia\_EN](#recordedMedia_EN)
   34. [survivorNames](#survivorNames)
   35. [attributes](#attributes)
   36. [fluids](#fluids)
   37. [entity](#entity)
   38. [mapLabel](#mapLabel)
   39. [printMedia](#printMedia)
   40. [printText](#printText)
   41. [radioData](#radioData)
   42. [bodyParts](#bodyParts)
   43. [brReplacements](#brReplacements)
   44. [credits](#credits)
   45. [tempMap](#tempMap)
   46. [MAYBE\_PLACEHOLDER](#MAYBE_PLACEHOLDER)
   47. [BY\_NAME](#BY_NAME)
   48. [language](#language)
   49. [FORMAT\_TOKEN](#FORMAT_TOKEN)
6. [Constructor Details](#constructor-detail)
   1. [Translator()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [loadFiles()](#loadFiles())
   2. [isValidPlaceholder(String)](#isValidPlaceholder(java.lang.String))
   3. [extractPlaceholders(String)](#extractPlaceholders(java.lang.String))
   4. [forLanguageStack(Consumer)](#forLanguageStack(java.util.function.Consumer))
   5. [tryFillMapFromFile(String, String, Map, Language, Function)](#tryFillMapFromFile(java.lang.String,java.lang.String,java.util.Map,zombie.core.Language,java.util.function.Function))
   6. [tryFillMapFromMods(String, Map, Language)](#tryFillMapFromMods(java.lang.String,java.util.Map,zombie.core.Language))
   7. [readMapTranslation(ChooseGameInfo.Map, String)](#readMapTranslation(zombie.gameStates.ChooseGameInfo.Map,java.lang.String))
   8. [readModTranslation(ChooseGameInfo.Mod)](#readModTranslation(zombie.gameStates.ChooseGameInfo.Mod))
   9. [getTextInternal(String, boolean)](#getTextInternal(java.lang.String,boolean))
   10. [getText(String, Object...)](#getText(java.lang.String,java.lang.Object...))
   11. [reportMissingArgumentsFromPastAbuse(String, String, Object[])](#reportMissingArgumentsFromPastAbuse(java.lang.String,java.lang.String,java.lang.Object%5B%5D))
   12. [getTextOrNull(String, Object...)](#getTextOrNull(java.lang.String,java.lang.Object...))
   13. [fixupArgs(Object[])](#fixupArgs(java.lang.Object%5B%5D))
   14. [setLanguage(Language)](#setLanguage(zombie.core.Language))
   15. [setLanguage(int)](#setLanguage(int))
   16. [getLanguage()](#getLanguage())
   17. [getAvailableLanguage()](#getAvailableLanguage())
   18. [getDisplayItemName(String)](#getDisplayItemName(java.lang.String))
   19. [getItemNameFromFullType(String)](#getItemNameFromFullType(java.lang.String))
   20. [setDefaultItemEvolvedRecipeName(String, String)](#setDefaultItemEvolvedRecipeName(java.lang.String,java.lang.String))
   21. [getItemEvolvedRecipeName(String)](#getItemEvolvedRecipeName(java.lang.String))
   22. [getMoveableDisplayName(String)](#getMoveableDisplayName(java.lang.String))
   23. [getMoveableDisplayNameOrNull(String)](#getMoveableDisplayNameOrNull(java.lang.String))
   24. [getRecipeName(String)](#getRecipeName(java.lang.String))
   25. [getRecipeGroupName(String)](#getRecipeGroupName(java.lang.String))
   26. [getDefaultLanguage()](#getDefaultLanguage())
   27. [debugItemEvolvedRecipeNames()](#debugItemEvolvedRecipeNames())
   28. [debugItemNames()](#debugItemNames())
   29. [debugMultiStageBuildNames()](#debugMultiStageBuildNames())
   30. [debugRecipeNames()](#debugRecipeNames())
   31. [debugRecipeGroupNames()](#debugRecipeGroupNames())
   32. [debugwrite(String)](#debugwrite(java.lang.String))
   33. [getAzertyMap()](#getAzertyMap())
   34. [getTextMediaEN(String)](#getTextMediaEN(java.lang.String))
   35. [getAttributeText(String)](#getAttributeText(java.lang.String))
   36. [getAttributeTextOrNull(String)](#getAttributeTextOrNull(java.lang.String))
   37. [getAttributeText(String, boolean)](#getAttributeText(java.lang.String,boolean))
   38. [getFluidText(String)](#getFluidText(java.lang.String))
   39. [getEntityText(String)](#getEntityText(java.lang.String))
   40. [getMapLabelText(String)](#getMapLabelText(java.lang.String))
   41. [getUI()](#getUI())
   42. [cryAboutUnicodeConfusables(String, File)](#cryAboutUnicodeConfusables(java.lang.String,java.io.File))
   43. [formatFixer(String)](#formatFixer(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Translator
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.Translator

---

public final class Translator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Map<String,String>`

  `attributes`

  `private static List<Language>`

  `availableLanguage`

  `private static ArrayList<String>`

  `azertyLanguages`

  `private static final Map<String,String>`

  `bodyParts`

  `private static final Map<String,String>`

  `brReplacements`

  `static final Map<String, Map<String,String>>`

  `BY_NAME`

  `private static final Map<String,String>`

  `challenge`

  `private static final Map<String,String>`

  `contextMenu`

  `private static final Map<String,String>`

  `credits`

  `static boolean`

  `debug`

  `private static boolean`

  `debugErrors`

  `private static FileWriter`

  `debugFile`

  `private static final Set<String>`

  `debugItem`

  `private static final Set<String>`

  `debugItemEvolvedRecipeName`

  `private static final Set<String>`

  `debugMultiStageBuild`

  `private static final Set<String>`

  `debugRecipe`

  `private static final Set<String>`

  `debugRecipeGroups`

  `private static final Map<String,String>`

  `dynamicRadio`

  `private static final Map<String,String>`

  `entity`

  `private static final Map<String,String>`

  `farming`

  `private static final Map<String,String>`

  `fluids`

  `private static final Pattern`

  `FORMAT_TOKEN`

  `private static final Map<String,String>`

  `gameSound`

  `private static final Map<String,String>`

  `igui`

  `private static final Map<String,String>`

  `itemEvolvedRecipeName`

  `private static final Map<String,String>`

  `itemName`

  `private static final Map<String,String>`

  `items`

  `static Language`

  `language`

  `static final char[]`

  `LOOKALIKE_CHARS`

  `private static final Map<String,String>`

  `makeup`

  `private static final Map<String,String>`

  `mapLabel`

  `private static final Pattern`

  `MAYBE_PLACEHOLDER`

  `private static final Set<String>`

  `missing`

  `private static final Map<String,String>`

  `moodles`

  `private static final Map<String,String>`

  `moveables`

  `private static final Map<String,String>`

  `printMedia`

  `private static final Map<String,String>`

  `printText`

  `private static final Map<String,String>`

  `radioData`

  `private static final Map<String,String>`

  `recipe`

  `private static final Map<String,String>`

  `recipeGroups`

  `private static final Map<String,String>`

  `recordedMedia`

  `private static final Map<String,String>`

  `recordedMedia_EN`

  `private static final Map<String,String>`

  `sandbox`

  `private static final Map<String,String>`

  `stash`

  `private static final Map<String,String>`

  `survivalGuide`

  `private static final Map<String,String>`

  `survivorNames`

  `private static final Map<String,String>`

  `tempMap`

  `private static final Map<String,String>`

  `tooltip`

  `private static final Map<String,String>`

  `ui`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Translator()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `cryAboutUnicodeConfusables(String content,
  File file)`

  `static void`

  `debugItemEvolvedRecipeNames()`

  `static void`

  `debugItemNames()`

  `static void`

  `debugMultiStageBuildNames()`

  `static void`

  `debugRecipeGroupNames()`

  `static void`

  `debugRecipeNames()`

  `private static void`

  `debugwrite(String s)`

  `private static Set<String>`

  `extractPlaceholders(String text)`

  `private static Object[]`

  `fixupArgs(Object[] args)`

  `static void`

  `forLanguageStack(Consumer<Language> consumer)`

  `private static String`

  `formatFixer(String input)`

  `static String`

  `getAttributeText(String s)`

  `private static String`

  `getAttributeText(String s,
  boolean nullOnFail)`

  `static String`

  `getAttributeTextOrNull(String s)`

  `static List<Language>`

  `getAvailableLanguage()`

  `static ArrayList<String>`

  `getAzertyMap()`

  `static Language`

  `getDefaultLanguage()`

  `static String`

  `getDisplayItemName(String trim)`

  `static String`

  `getEntityText(String s)`

  `static String`

  `getFluidText(String s)`

  `static String`

  `getItemEvolvedRecipeName(String fullType)`

  `static String`

  `getItemNameFromFullType(String fullType)`

  `static Language`

  `getLanguage()`

  `static String`

  `getMapLabelText(String s)`

  `static String`

  `getMoveableDisplayName(String name)`

  `static String`

  `getMoveableDisplayNameOrNull(String name)`

  `static String`

  `getRecipeGroupName(String name)`

  `static String`

  `getRecipeName(String name)`

  `static String`

  `getText(String desc,
  Object... args)`

  `private static String`

  `getTextInternal(String desc,
  boolean nullOK)`

  `static String`

  `getTextMediaEN(String desc)`

  `static String`

  `getTextOrNull(String desc,
  Object... args)`

  `static Map<String,String>`

  `getUI()`

  `private static boolean`

  `isValidPlaceholder(String s)`

  `static void`

  `loadFiles()`

  `static void`

  `readMapTranslation(ChooseGameInfo.Map map,
  String dir)`

  `static void`

  `readModTranslation(ChooseGameInfo.Mod mod)`

  `private static String`

  `reportMissingArgumentsFromPastAbuse(String desc,
  String text,
  Object[] args)`

  `static void`

  `setDefaultItemEvolvedRecipeName(String fullType,
  String english)`

  `static void`

  `setLanguage(int languageId)`

  `static void`

  `setLanguage(Language newlanguage)`

  `private static void`

  `tryFillMapFromFile(String rootDir,
  String fileName,
  Map<String,String> map,
  Language language,
  Function<String,String> formatFixer)`

  `private static void`

  `tryFillMapFromMods(String fileName,
  Map<String,String> map,
  Language language)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### LOOKALIKE\_CHARS

    public static final char[] LOOKALIKE\_CHARS
  + ### availableLanguage

    private static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Language](Language.html "class in zombie.core")> availableLanguage
  + ### debug

    public static boolean debug
  + ### debugFile

    private static [FileWriter](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileWriter.html "class or interface in java.io") debugFile
  + ### debugErrors

    private static boolean debugErrors
  + ### debugItemEvolvedRecipeName

    private static final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> debugItemEvolvedRecipeName
  + ### debugItem

    private static final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> debugItem
  + ### debugMultiStageBuild

    private static final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> debugMultiStageBuild
  + ### debugRecipe

    private static final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> debugRecipe
  + ### debugRecipeGroups

    private static final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> debugRecipeGroups
  + ### moodles

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> moodles
  + ### ui

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> ui
  + ### survivalGuide

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> survivalGuide
  + ### contextMenu

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> contextMenu
  + ### farming

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> farming
  + ### recipe

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> recipe
  + ### recipeGroups

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> recipeGroups
  + ### igui

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> igui
  + ### sandbox

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> sandbox
  + ### tooltip

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tooltip
  + ### challenge

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> challenge
  + ### missing

    private static final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> missing
  + ### azertyLanguages

    private static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> azertyLanguages
  + ### stash

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> stash
  + ### moveables

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> moveables
  + ### makeup

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> makeup
  + ### gameSound

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> gameSound
  + ### dynamicRadio

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> dynamicRadio
  + ### items

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> items
  + ### itemName

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemName
  + ### itemEvolvedRecipeName

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemEvolvedRecipeName
  + ### recordedMedia

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> recordedMedia
  + ### recordedMedia\_EN

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> recordedMedia\_EN
  + ### survivorNames

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> survivorNames
  + ### attributes

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> attributes
  + ### fluids

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> fluids
  + ### entity

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> entity
  + ### mapLabel

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> mapLabel
  + ### printMedia

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> printMedia
  + ### printText

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> printText
  + ### radioData

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> radioData
  + ### bodyParts

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> bodyParts
  + ### brReplacements

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> brReplacements
  + ### credits

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> credits
  + ### tempMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tempMap
  + ### MAYBE\_PLACEHOLDER

    private static final [Pattern](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/regex/Pattern.html "class or interface in java.util.regex") MAYBE\_PLACEHOLDER
  + ### BY\_NAME

    public static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> BY\_NAME
  + ### language

    public static [Language](Language.html "class in zombie.core") language
  + ### FORMAT\_TOKEN

    private static final [Pattern](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/regex/Pattern.html "class or interface in java.util.regex") FORMAT\_TOKEN
* Constructor Details
  -------------------

  + ### Translator

    public Translator()
* Method Details
  --------------

  + ### loadFiles

    public static void loadFiles()
  + ### isValidPlaceholder

    private static boolean isValidPlaceholder([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### extractPlaceholders

    private static [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> extractPlaceholders([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### forLanguageStack

    public static void forLanguageStack([Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<[Language](Language.html "class in zombie.core")> consumer)
  + ### tryFillMapFromFile

    private static void tryFillMapFromFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rootDir,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> map,
    [Language](Language.html "class in zombie.core") language,
    [Function](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Function.html "class or interface in java.util.function")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> formatFixer)
  + ### tryFillMapFromMods

    private static void tryFillMapFromMods([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> map,
    [Language](Language.html "class in zombie.core") language)
  + ### readMapTranslation

    public static void readMapTranslation([ChooseGameInfo.Map](../gameStates/ChooseGameInfo.Map.html "class in zombie.gameStates") map,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dir)
  + ### readModTranslation

    public static void readModTranslation([ChooseGameInfo.Mod](../gameStates/ChooseGameInfo.Mod.html "class in zombie.gameStates") mod)
  + ### getTextInternal

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextInternal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc,
    boolean nullOK)
  + ### getText

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... args)
  + ### reportMissingArgumentsFromPastAbuse

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") reportMissingArgumentsFromPastAbuse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] args)
  + ### getTextOrNull

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextOrNull([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... args)
  + ### fixupArgs

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] fixupArgs([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] args)
  + ### setLanguage

    public static void setLanguage([Language](Language.html "class in zombie.core") newlanguage)
  + ### setLanguage

    public static void setLanguage(int languageId)
  + ### getLanguage

    public static [Language](Language.html "class in zombie.core") getLanguage()
  + ### getAvailableLanguage

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Language](Language.html "class in zombie.core")> getAvailableLanguage()
  + ### getDisplayItemName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayItemName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") trim)
  + ### getItemNameFromFullType

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemNameFromFullType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType)
  + ### setDefaultItemEvolvedRecipeName

    public static void setDefaultItemEvolvedRecipeName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") english)
  + ### getItemEvolvedRecipeName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItemEvolvedRecipeName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType)
  + ### getMoveableDisplayName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMoveableDisplayName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getMoveableDisplayNameOrNull

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMoveableDisplayNameOrNull([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getRecipeName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getRecipeGroupName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeGroupName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getDefaultLanguage

    public static [Language](Language.html "class in zombie.core") getDefaultLanguage()
  + ### debugItemEvolvedRecipeNames

    public static void debugItemEvolvedRecipeNames()
  + ### debugItemNames

    public static void debugItemNames()
  + ### debugMultiStageBuildNames

    public static void debugMultiStageBuildNames()
  + ### debugRecipeNames

    public static void debugRecipeNames()
  + ### debugRecipeGroupNames

    public static void debugRecipeGroupNames()
  + ### debugwrite

    private static void debugwrite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getAzertyMap

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAzertyMap()
  + ### getTextMediaEN

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextMediaEN([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc)
  + ### getAttributeText

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttributeText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getAttributeTextOrNull

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttributeTextOrNull([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getAttributeText

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttributeText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    boolean nullOnFail)
  + ### getFluidText

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFluidText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getEntityText

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEntityText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getMapLabelText

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMapLabelText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getUI

    public static [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getUI()
  + ### cryAboutUnicodeConfusables

    private static void cryAboutUnicodeConfusables([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") content,
    [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") file)
  + ### formatFixer

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formatFixer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input)