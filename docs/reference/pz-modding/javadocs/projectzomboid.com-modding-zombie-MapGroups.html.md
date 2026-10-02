[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [MapGroups](MapGroups.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [groups](#groups)
   2. [realDirectories](#realDirectories)
7. [Constructor Details](#constructor-detail)
   1. [MapGroups()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getVanillaMapDirectories(boolean)](#getVanillaMapDirectories(boolean))
   2. [addMissingVanillaDirectories(String)](#addMissingVanillaDirectories(java.lang.String))
   3. [createGroups()](#createGroups())
   4. [createGroups(ActiveMods, boolean)](#createGroups(zombie.modding.ActiveMods,boolean))
   5. [createGroups(ActiveMods, boolean, boolean)](#createGroups(zombie.modding.ActiveMods,boolean,boolean))
   6. [getDirsRecursively(MapGroups.MapDirectory, ArrayList)](#getDirsRecursively(zombie.MapGroups.MapDirectory,java.util.ArrayList))
   7. [getNumberOfGroups()](#getNumberOfGroups())
   8. [getMapDirectoriesInGroup(int)](#getMapDirectoriesInGroup(int))
   9. [setWorld(int)](#setWorld(int))
   10. [handleMapDirectory(String, String)](#handleMapDirectory(java.lang.String,java.lang.String))
   11. [getLotDirectories(String)](#getLotDirectories(java.lang.String))
   12. [findGroupWithAnyOfTheseDirectories(ArrayList)](#findGroupWithAnyOfTheseDirectories(java.util.ArrayList))
   13. [getAllMapsInOrder()](#getAllMapsInOrder())
   14. [checkMapConflicts()](#checkMapConflicts())
   15. [getMapConflicts(String)](#getMapConflicts(java.lang.String))

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class MapGroups
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.MapGroups

---

public final class MapGroups
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private class`

  `MapGroups.MapDirectory`

  `private class`

  `MapGroups.MapGroup`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<MapGroups.MapGroup>`

  `groups`

  `private final ArrayList<MapGroups.MapDirectory>`

  `realDirectories`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MapGroups()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static String`

  `addMissingVanillaDirectories(String mapName)`

  `boolean`

  `checkMapConflicts()`

  `void`

  `createGroups()`

  `void`

  `createGroups(ActiveMods activeMods,
  boolean includeVanilla)`

  `void`

  `createGroups(ActiveMods activeMods,
  boolean includeVanilla,
  boolean includeChallenges)`

  `private MapGroups.MapGroup`

  `findGroupWithAnyOfTheseDirectories(ArrayList<MapGroups.MapDirectory> directories)`

  `ArrayList<String>`

  `getAllMapsInOrder()`

  `private void`

  `getDirsRecursively(MapGroups.MapDirectory mapDir,
  ArrayList<MapGroups.MapDirectory> result)`

  `private ArrayList<String>`

  `getLotDirectories(String path)`

  `ArrayList<String>`

  `getMapConflicts(String mapName)`

  `ArrayList<String>`

  `getMapDirectoriesInGroup(int groupIndex)`

  `int`

  `getNumberOfGroups()`

  `private static ArrayList<String>`

  `getVanillaMapDirectories(boolean includeChallenges)`

  `private void`

  `handleMapDirectory(String directoryName,
  String path)`

  `void`

  `setWorld(int groupIndex)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### groups

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MapGroups.MapGroup](MapGroups.MapGroup.html "class in zombie")> groups
  + ### realDirectories

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie")> realDirectories
* Constructor Details
  -------------------

  + ### MapGroups

    public MapGroups()
* Method Details
  --------------

  + ### getVanillaMapDirectories

    private static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getVanillaMapDirectories(boolean includeChallenges)
  + ### addMissingVanillaDirectories

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") addMissingVanillaDirectories([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapName)
  + ### createGroups

    public void createGroups()
  + ### createGroups

    public void createGroups([ActiveMods](modding/ActiveMods.html "class in zombie.modding") activeMods,
    boolean includeVanilla)
  + ### createGroups

    public void createGroups([ActiveMods](modding/ActiveMods.html "class in zombie.modding") activeMods,
    boolean includeVanilla,
    boolean includeChallenges)
  + ### getDirsRecursively

    private void getDirsRecursively([MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie") mapDir,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie")> result)
  + ### getNumberOfGroups

    public int getNumberOfGroups()
  + ### getMapDirectoriesInGroup

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getMapDirectoriesInGroup(int groupIndex)
  + ### setWorld

    public void setWorld(int groupIndex)
  + ### handleMapDirectory

    private void handleMapDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") directoryName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### getLotDirectories

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLotDirectories([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### findGroupWithAnyOfTheseDirectories

    private [MapGroups.MapGroup](MapGroups.MapGroup.html "class in zombie") findGroupWithAnyOfTheseDirectories([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie")> directories)
  + ### getAllMapsInOrder

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllMapsInOrder()
  + ### checkMapConflicts

    public boolean checkMapConflicts()
  + ### getMapConflicts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getMapConflicts([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mapName)