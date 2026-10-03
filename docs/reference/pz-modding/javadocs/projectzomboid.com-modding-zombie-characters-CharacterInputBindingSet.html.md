[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [CharacterInputBindingSet](CharacterInputBindingSet.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [loadedBindingSets](#loadedBindingSets)
   2. [name](#name)
   3. [description](#description)
   4. [allBindings](#allBindings)
7. [Constructor Details](#constructor-detail)
   1. [CharacterInputBindingSet()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getDescription()](#getDescription())
   3. [apply()](#apply())
   4. [setBindingsToCurrent()](#setBindingsToCurrent())
   5. [save()](#save())
   6. [addBinding(CharacterInputBindingSetEntry)](#addBinding(zombie.characters.CharacterInputBindingSetEntry))
   7. [addBinding(CharacterJoypadButtonBinding)](#addBinding(zombie.characters.CharacterJoypadButtonBinding))
   8. [addBinding(CharacterJoypadAxis2dBinding)](#addBinding(zombie.characters.CharacterJoypadAxis2dBinding))
   9. [getLoadedBindingSets()](#getLoadedBindingSets())
   10. [reloadAll()](#reloadAll())
   11. [isInputBindingFile(File)](#isInputBindingFile(java.io.File))
   12. [saveAll()](#saveAll())
   13. [loadFromFile(String)](#loadFromFile(java.lang.String))
   14. [containsSetName(List, String)](#containsSetName(java.util.List,java.lang.String))
   15. [containsSetName(CharacterInputBindingSet[], String)](#containsSetName(zombie.characters.CharacterInputBindingSet%5B%5D,java.lang.String))
   16. [containsSetName(String)](#containsSetName(java.lang.String))
   17. [getUniqueSetName(String)](#getUniqueSetName(java.lang.String))
   18. [trimTrailingNumberFromName(String)](#trimTrailingNumberFromName(java.lang.String))
   19. [createNewFromCurrent(String)](#createNewFromCurrent(java.lang.String))
   20. [resetAllToDefault()](#resetAllToDefault())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CharacterInputBindingSet
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.CharacterInputBindingSet

---

public class CharacterInputBindingSet
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `CharacterInputBindingSet.Axis2dBinding`

  `static class`

  `CharacterInputBindingSet.ButtonAxis1dBinding`

  `static class`

  `CharacterInputBindingSet.ButtonAxis2dBinding`

  `static class`

  `CharacterInputBindingSet.ButtonBinding`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `CharacterInputBindingSetEntry[]`

  `allBindings`

  `String`

  `description`

  `private static CharacterInputBindingSet[]`

  `loadedBindingSets`

  `String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CharacterInputBindingSet()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addBinding(CharacterInputBindingSetEntry newBinding)`

  `private void`

  `addBinding(CharacterJoypadAxis2dBinding currentBinding)`

  `private void`

  `addBinding(CharacterJoypadButtonBinding currentBinding)`

  `void`

  `apply()`

  `static boolean`

  `containsSetName(String name)`

  `private static boolean`

  `containsSetName(List<CharacterInputBindingSet> allSets,
  String name)`

  `private static boolean`

  `containsSetName(CharacterInputBindingSet[] allSets,
  String name)`

  `static CharacterInputBindingSet`

  `createNewFromCurrent(String name)`

  `String`

  `getDescription()`

  `static CharacterInputBindingSet[]`

  `getLoadedBindingSets()`

  `String`

  `getName()`

  `static String`

  `getUniqueSetName(String name)`

  `private static boolean`

  `isInputBindingFile(File file)`

  `private static CharacterInputBindingSet`

  `loadFromFile(String bindingsFilePath)`

  `static CharacterInputBindingSet[]`

  `reloadAll()`

  `static void`

  `resetAllToDefault()`

  `boolean`

  `save()`

  `static boolean`

  `saveAll()`

  `void`

  `setBindingsToCurrent()`

  `private static String`

  `trimTrailingNumberFromName(String name)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### loadedBindingSets

    private static [CharacterInputBindingSet](CharacterInputBindingSet.html "class in zombie.characters")[] loadedBindingSets
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### description

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### allBindings

    public [CharacterInputBindingSetEntry](CharacterInputBindingSetEntry.html "class in zombie.characters")[] allBindings
* Constructor Details
  -------------------

  + ### CharacterInputBindingSet

    public CharacterInputBindingSet()
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### apply

    public void apply()
  + ### setBindingsToCurrent

    public void setBindingsToCurrent()
  + ### save

    public boolean save()
  + ### addBinding

    public void addBinding([CharacterInputBindingSetEntry](CharacterInputBindingSetEntry.html "class in zombie.characters") newBinding)
  + ### addBinding

    private void addBinding([CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") currentBinding)
  + ### addBinding

    private void addBinding([CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters") currentBinding)
  + ### getLoadedBindingSets

    public static [CharacterInputBindingSet](CharacterInputBindingSet.html "class in zombie.characters")[] getLoadedBindingSets()
  + ### reloadAll

    public static [CharacterInputBindingSet](CharacterInputBindingSet.html "class in zombie.characters")[] reloadAll()
  + ### isInputBindingFile

    private static boolean isInputBindingFile([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") file)
  + ### saveAll

    public static boolean saveAll()
  + ### loadFromFile

    private static [CharacterInputBindingSet](CharacterInputBindingSet.html "class in zombie.characters") loadFromFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bindingsFilePath)
  + ### containsSetName

    private static boolean containsSetName([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CharacterInputBindingSet](CharacterInputBindingSet.html "class in zombie.characters")> allSets,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### containsSetName

    private static boolean containsSetName([CharacterInputBindingSet](CharacterInputBindingSet.html "class in zombie.characters")[] allSets,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### containsSetName

    public static boolean containsSetName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getUniqueSetName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUniqueSetName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### trimTrailingNumberFromName

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") trimTrailingNumberFromName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### createNewFromCurrent

    public static [CharacterInputBindingSet](CharacterInputBindingSet.html "class in zombie.characters") createNewFromCurrent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### resetAllToDefault

    public static void resetAllToDefault()