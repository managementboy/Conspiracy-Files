[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.modding](package-summary.html)
2. [ActiveMods](ActiveMods.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [s\_activeMods](#s_activeMods)
   2. [s\_loaded](#s_loaded)
   3. [id](#id)
   4. [mods](#mods)
   5. [mapOrder](#mapOrder)
6. [Constructor Details](#constructor-detail)
   1. [ActiveMods(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [count()](#count())
   2. [getByIndex(int)](#getByIndex(int))
   3. [getById(String)](#getById(java.lang.String))
   4. [indexOf(String)](#indexOf(java.lang.String))
   5. [create(String)](#create(java.lang.String))
   6. [requireValidId(String)](#requireValidId(java.lang.String))
   7. [setLoadedMods(ActiveMods)](#setLoadedMods(zombie.modding.ActiveMods))
   8. [requiresResetLua(ActiveMods)](#requiresResetLua(zombie.modding.ActiveMods))
   9. [renderUI()](#renderUI())
   10. [Reset()](#Reset())
   11. [clear()](#clear())
   12. [getMods()](#getMods())
   13. [getMapOrder()](#getMapOrder())
   14. [copyFrom(ActiveMods)](#copyFrom(zombie.modding.ActiveMods))
   15. [setModActive(String, boolean)](#setModActive(java.lang.String,boolean))
   16. [isModActive(String)](#isModActive(java.lang.String))
   17. [removeMod(String)](#removeMod(java.lang.String))
   18. [removeMapOrder(String)](#removeMapOrder(java.lang.String))
   19. [checkMissingMods()](#checkMissingMods())
   20. [checkMissingMaps()](#checkMissingMaps())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ActiveMods
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.modding.ActiveMods

---

public final class ActiveMods
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `id`

  `private final ArrayList<String>`

  `mapOrder`

  `private final ArrayList<String>`

  `mods`

  `private static final ArrayList<ActiveMods>`

  `s_activeMods`

  `private static final ActiveMods`

  `s_loaded`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ActiveMods(String id)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `checkMissingMaps()`

  `void`

  `checkMissingMods()`

  `void`

  `clear()`

  `void`

  `copyFrom(ActiveMods other)`

  `private static int`

  `count()`

  `private static ActiveMods`

  `create(String id)`

  `static ActiveMods`

  `getById(String id)`

  `static ActiveMods`

  `getByIndex(int index)`

  `ArrayList<String>`

  `getMapOrder()`

  `ArrayList<String>`

  `getMods()`

  `static int`

  `indexOf(String id)`

  `boolean`

  `isModActive(String modID)`

  `void`

  `removeMapOrder(String folder)`

  `void`

  `removeMod(String modID)`

  `static void`

  `renderUI()`

  `static boolean`

  `requiresResetLua(ActiveMods activeMods)`

  `private static void`

  `requireValidId(String id)`

  `static void`

  `Reset()`

  `static void`

  `setLoadedMods(ActiveMods activeMods)`

  `void`

  `setModActive(String modID,
  boolean active)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### s\_activeMods

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ActiveMods](ActiveMods.html "class in zombie.modding")> s\_activeMods
  + ### s\_loaded

    private static final [ActiveMods](ActiveMods.html "class in zombie.modding") s\_loaded
  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### mods

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> mods
  + ### mapOrder

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> mapOrder
* Constructor Details
  -------------------

  + ### ActiveMods

    public ActiveMods([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### count

    private static int count()
  + ### getByIndex

    public static [ActiveMods](ActiveMods.html "class in zombie.modding") getByIndex(int index)
  + ### getById

    public static [ActiveMods](ActiveMods.html "class in zombie.modding") getById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### indexOf

    public static int indexOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### create

    private static [ActiveMods](ActiveMods.html "class in zombie.modding") create([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### requireValidId

    private static void requireValidId([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### setLoadedMods

    public static void setLoadedMods([ActiveMods](ActiveMods.html "class in zombie.modding") activeMods)
  + ### requiresResetLua

    public static boolean requiresResetLua([ActiveMods](ActiveMods.html "class in zombie.modding") activeMods)
  + ### renderUI

    public static void renderUI()
  + ### Reset

    public static void Reset()
  + ### clear

    public void clear()
  + ### getMods

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getMods()
  + ### getMapOrder

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getMapOrder()
  + ### copyFrom

    public void copyFrom([ActiveMods](ActiveMods.html "class in zombie.modding") other)
  + ### setModActive

    public void setModActive([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID,
    boolean active)
  + ### isModActive

    public boolean isModActive([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### removeMod

    public void removeMod([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### removeMapOrder

    public void removeMapOrder([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") folder)
  + ### checkMissingMods

    public void checkMissingMods()
  + ### checkMissingMaps

    public void checkMissingMaps()