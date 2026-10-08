[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.WornItems](package-summary.html)
2. [BodyLocation](BodyLocation.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [group](#group)
   2. [id](#id)
   3. [exclusive](#exclusive)
   4. [hideModel](#hideModel)
   5. [altModel](#altModel)
   6. [multiItem](#multiItem)
6. [Constructor Details](#constructor-detail)
   1. [BodyLocation(BodyLocationGroup, ItemBodyLocation)](#%3Cinit%3E(zombie.characters.WornItems.BodyLocationGroup,zombie.scripting.objects.ItemBodyLocation))
7. [Method Details](#method-detail)
   1. [setExclusive(ItemBodyLocation)](#setExclusive(zombie.scripting.objects.ItemBodyLocation))
   2. [setHideModel(ItemBodyLocation)](#setHideModel(zombie.scripting.objects.ItemBodyLocation))
   3. [setAltModel(ItemBodyLocation)](#setAltModel(zombie.scripting.objects.ItemBodyLocation))
   4. [isMultiItem()](#isMultiItem())
   5. [setMultiItem(boolean)](#setMultiItem(boolean))
   6. [isHideModel(ItemBodyLocation)](#isHideModel(zombie.scripting.objects.ItemBodyLocation))
   7. [isAltModel(ItemBodyLocation)](#isAltModel(zombie.scripting.objects.ItemBodyLocation))
   8. [isExclusive(ItemBodyLocation)](#isExclusive(zombie.scripting.objects.ItemBodyLocation))
   9. [isId(ItemBodyLocation)](#isId(zombie.scripting.objects.ItemBodyLocation))
   10. [getId()](#getId())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class BodyLocation
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.WornItems.BodyLocation

---

public final class BodyLocation
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final List<ItemBodyLocation>`

  `altModel`

  `private final List<ItemBodyLocation>`

  `exclusive`

  `private final BodyLocationGroup`

  `group`

  `private final List<ItemBodyLocation>`

  `hideModel`

  `private final ItemBodyLocation`

  `id`

  `private boolean`

  `multiItem`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BodyLocation(BodyLocationGroup group,
  ItemBodyLocation id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ItemBodyLocation`

  `getId()`

  `boolean`

  `isAltModel(ItemBodyLocation itemBodyLocation)`

  `boolean`

  `isExclusive(ItemBodyLocation itemBodyLocation)`

  `boolean`

  `isHideModel(ItemBodyLocation itemBodyLocation)`

  `boolean`

  `isId(ItemBodyLocation itemBodyLocation)`

  `boolean`

  `isMultiItem()`

  `BodyLocation`

  `setAltModel(ItemBodyLocation itemBodyLocation)`

  `BodyLocation`

  `setExclusive(ItemBodyLocation itemBodyLocation)`

  `BodyLocation`

  `setHideModel(ItemBodyLocation itemBodyLocation)`

  `BodyLocation`

  `setMultiItem(boolean bMultiItem)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### group

    private final [BodyLocationGroup](BodyLocationGroup.html "class in zombie.characters.WornItems") group
  + ### id

    private final [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") id
  + ### exclusive

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects")> exclusive
  + ### hideModel

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects")> hideModel
  + ### altModel

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects")> altModel
  + ### multiItem

    private boolean multiItem
* Constructor Details
  -------------------

  + ### BodyLocation

    public BodyLocation([BodyLocationGroup](BodyLocationGroup.html "class in zombie.characters.WornItems") group,
    [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") id)
* Method Details
  --------------

  + ### setExclusive

    public [BodyLocation](BodyLocation.html "class in zombie.characters.WornItems") setExclusive([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### setHideModel

    public [BodyLocation](BodyLocation.html "class in zombie.characters.WornItems") setHideModel([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### setAltModel

    public [BodyLocation](BodyLocation.html "class in zombie.characters.WornItems") setAltModel([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### isMultiItem

    public boolean isMultiItem()
  + ### setMultiItem

    public [BodyLocation](BodyLocation.html "class in zombie.characters.WornItems") setMultiItem(boolean bMultiItem)
  + ### isHideModel

    public boolean isHideModel([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### isAltModel

    public boolean isAltModel([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### isExclusive

    public boolean isExclusive([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### isId

    public boolean isId([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### getId

    public [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") getId()