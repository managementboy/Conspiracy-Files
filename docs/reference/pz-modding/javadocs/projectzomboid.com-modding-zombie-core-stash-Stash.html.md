[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.stash](package-summary.html)
2. [Stash](Stash.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [type](#type)
   3. [item](#item)
   4. [customName](#customName)
   5. [buildingX](#buildingX)
   6. [buildingY](#buildingY)
   7. [spawnTable](#spawnTable)
   8. [annotations](#annotations)
   9. [spawnOnlyOnZed](#spawnOnlyOnZed)
   10. [minDayToSpawn](#minDayToSpawn)
   11. [maxDayToSpawn](#maxDayToSpawn)
   12. [minTrapToSpawn](#minTrapToSpawn)
   13. [maxTrapToSpawn](#maxTrapToSpawn)
   14. [zombies](#zombies)
   15. [containers](#containers)
   16. [barricades](#barricades)
6. [Constructor Details](#constructor-detail)
   1. [Stash(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [load(KahluaTableImpl)](#load(se.krka.kahlua.j2se.KahluaTableImpl))
   2. [getName()](#getName())
   3. [getItem()](#getItem())
   4. [getBuildingX()](#getBuildingX())
   5. [getBuildingY()](#getBuildingY())
   6. [applyAnnotations(UIWorldMap)](#applyAnnotations(zombie.worldMap.UIWorldMap))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Stash
===========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.stash.Stash

---

public final class Stash
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `ArrayList<zombie.core.stash.StashAnnotation>`

  `annotations`

  `int`

  `barricades`

  `int`

  `buildingX`

  `int`

  `buildingY`

  `ArrayList<zombie.core.stash.StashContainer>`

  `containers`

  `String`

  `customName`

  `String`

  `item`

  `int`

  `maxDayToSpawn`

  `int`

  `maxTrapToSpawn`

  `int`

  `minDayToSpawn`

  `int`

  `minTrapToSpawn`

  `String`

  `name`

  `boolean`

  `spawnOnlyOnZed`

  `String`

  `spawnTable`

  `String`

  `type`

  `int`

  `zombies`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Stash(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `applyAnnotations(zombie.worldMap.UIWorldMap ui)`

  `int`

  `getBuildingX()`

  `int`

  `getBuildingY()`

  `String`

  `getItem()`

  `String`

  `getName()`

  `void`

  `load(se.krka.kahlua.j2se.KahluaTableImpl stashDesc)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### type

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### item

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item
  + ### customName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customName
  + ### buildingX

    public int buildingX
  + ### buildingY

    public int buildingY
  + ### spawnTable

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spawnTable
  + ### annotations

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.stash.StashAnnotation> annotations
  + ### spawnOnlyOnZed

    public boolean spawnOnlyOnZed
  + ### minDayToSpawn

    public int minDayToSpawn
  + ### maxDayToSpawn

    public int maxDayToSpawn
  + ### minTrapToSpawn

    public int minTrapToSpawn
  + ### maxTrapToSpawn

    public int maxTrapToSpawn
  + ### zombies

    public int zombies
  + ### containers

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.stash.StashContainer> containers
  + ### barricades

    public int barricades
* Constructor Details
  -------------------

  + ### Stash

    public Stash([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### load

    public void load(se.krka.kahlua.j2se.KahluaTableImpl stashDesc)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getItem()
  + ### getBuildingX

    public int getBuildingX()
  + ### getBuildingY

    public int getBuildingY()
  + ### applyAnnotations

    public void applyAnnotations(zombie.worldMap.UIWorldMap ui)