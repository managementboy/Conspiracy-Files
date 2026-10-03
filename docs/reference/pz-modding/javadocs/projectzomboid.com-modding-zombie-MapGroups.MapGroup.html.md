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
3. [MapGroup](MapGroups.MapGroup.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [directories](#directories)
6. [Constructor Details](#constructor-detail)
   1. [MapGroup()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addDirectory(String, String)](#addDirectory(java.lang.String,java.lang.String))
   2. [addDirectory(String, String, ArrayList)](#addDirectory(java.lang.String,java.lang.String,java.util.ArrayList))
   3. [addDirectory(MapGroups.MapDirectory)](#addDirectory(zombie.MapGroups.MapDirectory))
   4. [getDirectoryByName(String)](#getDirectoryByName(java.lang.String))
   5. [hasDirectory(String)](#hasDirectory(java.lang.String))
   6. [hasAnyOfTheseDirectories(ArrayList)](#hasAnyOfTheseDirectories(java.util.ArrayList))
   7. [isReferencedByOtherMaps(MapGroups.MapDirectory)](#isReferencedByOtherMaps(zombie.MapGroups.MapDirectory))
   8. [getDirsRecursively(MapGroups.MapDirectory, ArrayList)](#getDirsRecursively(zombie.MapGroups.MapDirectory,java.util.ArrayList))
   9. [setPriority()](#setPriority())
   10. [setPriority(List)](#setPriority(java.util.List))
   11. [setOrder(ActiveMods)](#setOrder(zombie.modding.ActiveMods))
   12. [checkMapConflicts()](#checkMapConflicts())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class MapGroups.MapGroup
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.MapGroups.MapGroup

Enclosing class:
:   `MapGroups`

---

private class MapGroups.MapGroup
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final LinkedList<MapGroups.MapDirectory>`

  `directories`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `MapGroup()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `addDirectory(String directoryName,
  String path)`

  `(package private) void`

  `addDirectory(String directoryName,
  String path,
  ArrayList<String> lotDirs)`

  `(package private) void`

  `addDirectory(MapGroups.MapDirectory mapDir)`

  `(package private) boolean`

  `checkMapConflicts()`

  `(package private) MapGroups.MapDirectory`

  `getDirectoryByName(String name)`

  `(package private) void`

  `getDirsRecursively(MapGroups.MapDirectory mapDir,
  ArrayList<String> result)`

  `(package private) boolean`

  `hasAnyOfTheseDirectories(ArrayList<MapGroups.MapDirectory> anyOf)`

  `(package private) boolean`

  `hasDirectory(String name)`

  `(package private) boolean`

  `isReferencedByOtherMaps(MapGroups.MapDirectory mapDir)`

  `(package private) void`

  `setOrder(ActiveMods activeMods)`

  `(package private) void`

  `setPriority()`

  `(package private) void`

  `setPriority(List<String> priorityList)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### directories

    private final [LinkedList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedList.html "class or interface in java.util")<[MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie")> directories
* Constructor Details
  -------------------

  + ### MapGroup

    private MapGroup()
* Method Details
  --------------

  + ### addDirectory

    void addDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") directoryName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### addDirectory

    void addDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") directoryName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> lotDirs)
  + ### addDirectory

    void addDirectory([MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie") mapDir)
  + ### getDirectoryByName

    [MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie") getDirectoryByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### hasDirectory

    boolean hasDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### hasAnyOfTheseDirectories

    boolean hasAnyOfTheseDirectories([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie")> anyOf)
  + ### isReferencedByOtherMaps

    boolean isReferencedByOtherMaps([MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie") mapDir)
  + ### getDirsRecursively

    void getDirsRecursively([MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie") mapDir,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> result)
  + ### setPriority

    void setPriority()
  + ### setPriority

    void setPriority([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> priorityList)
  + ### setOrder

    void setOrder([ActiveMods](modding/ActiveMods.html "class in zombie.modding") activeMods)
  + ### checkMapConflicts

    boolean checkMapConflicts()