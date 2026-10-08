[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [ItemPickerJava](ItemPickerJava.html)
3. [ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [items](#items)
   2. [rolls](#rolls)
   3. [noAutoAge](#noAutoAge)
   4. [isShop](#isShop)
   5. [fillRand](#fillRand)
   6. [maxMap](#maxMap)
   7. [stashChance](#stashChance)
   8. [junk](#junk)
   9. [bags](#bags)
   10. [procedural](#procedural)
   11. [dontSpawnAmmo](#dontSpawnAmmo)
   12. [gunStorage](#gunStorage)
   13. [ignoreZombieDensity](#ignoreZombieDensity)
   14. [cookFood](#cookFood)
   15. [canBurn](#canBurn)
   16. [isTrash](#isTrash)
   17. [isWorn](#isWorn)
   18. [isRotten](#isRotten)
   19. [onlyOne](#onlyOne)
   20. [defaultInventoryLoot](#defaultInventoryLoot)
   21. [proceduralItems](#proceduralItems)
6. [Constructor Details](#constructor-detail)
   1. [ItemPickerContainer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [compact()](#compact())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemPickerJava.ItemPickerContainer
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemPickerJava.ItemPickerContainer

Enclosing class:
:   `ItemPickerJava`

---

public static final class ItemPickerJava.ItemPickerContainer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `ItemPickerJava.ItemPickerContainer`

  `bags`

  `boolean`

  `canBurn`

  `boolean`

  `cookFood`

  `boolean`

  `defaultInventoryLoot`

  `boolean`

  `dontSpawnAmmo`

  `int`

  `fillRand`

  `boolean`

  `gunStorage`

  `boolean`

  `ignoreZombieDensity`

  `boolean`

  `isRotten`

  `boolean`

  `isShop`

  `boolean`

  `isTrash`

  `boolean`

  `isWorn`

  `ItemPickerJava.ItemPickerItem[]`

  `items`

  `ItemPickerJava.ItemPickerContainer`

  `junk`

  `int`

  `maxMap`

  `boolean`

  `noAutoAge`

  `boolean`

  `onlyOne`

  `boolean`

  `procedural`

  `ArrayList<ItemPickerJava.ProceduralItem>`

  `proceduralItems`

  `float`

  `rolls`

  `int`

  `stashChance`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemPickerContainer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `compact()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### items

    public [ItemPickerJava.ItemPickerItem](ItemPickerJava.ItemPickerItem.html "class in zombie.inventory")[] items
  + ### rolls

    public float rolls
  + ### noAutoAge

    public boolean noAutoAge
  + ### isShop

    public boolean isShop
  + ### fillRand

    public int fillRand
  + ### maxMap

    public int maxMap
  + ### stashChance

    public int stashChance
  + ### junk

    public [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") junk
  + ### bags

    public [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory") bags
  + ### procedural

    public boolean procedural
  + ### dontSpawnAmmo

    public boolean dontSpawnAmmo
  + ### gunStorage

    public boolean gunStorage
  + ### ignoreZombieDensity

    public boolean ignoreZombieDensity
  + ### cookFood

    public boolean cookFood
  + ### canBurn

    public boolean canBurn
  + ### isTrash

    public boolean isTrash
  + ### isWorn

    public boolean isWorn
  + ### isRotten

    public boolean isRotten
  + ### onlyOne

    public boolean onlyOne
  + ### defaultInventoryLoot

    public boolean defaultInventoryLoot
  + ### proceduralItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemPickerJava.ProceduralItem](ItemPickerJava.ProceduralItem.html "class in zombie.inventory")> proceduralItems
* Constructor Details
  -------------------

  + ### ItemPickerContainer

    public ItemPickerContainer()
* Method Details
  --------------

  + ### compact

    void compact()