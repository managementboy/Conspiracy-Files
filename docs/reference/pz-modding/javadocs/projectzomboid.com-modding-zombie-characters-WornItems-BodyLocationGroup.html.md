[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.WornItems](package-summary.html)
2. [BodyLocationGroup](BodyLocationGroup.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [locations](#locations)
6. [Constructor Details](#constructor-detail)
   1. [BodyLocationGroup(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getId()](#getId())
   2. [getLocation(ItemBodyLocation)](#getLocation(zombie.scripting.objects.ItemBodyLocation))
   3. [getOrCreateLocation(ItemBodyLocation)](#getOrCreateLocation(zombie.scripting.objects.ItemBodyLocation))
   4. [getLocationByIndex(int)](#getLocationByIndex(int))
   5. [moveLocationToIndex(ItemBodyLocation, int)](#moveLocationToIndex(zombie.scripting.objects.ItemBodyLocation,int))
   6. [size()](#size())
   7. [setExclusive(ItemBodyLocation, ItemBodyLocation)](#setExclusive(zombie.scripting.objects.ItemBodyLocation,zombie.scripting.objects.ItemBodyLocation))
   8. [isExclusive(ItemBodyLocation, ItemBodyLocation)](#isExclusive(zombie.scripting.objects.ItemBodyLocation,zombie.scripting.objects.ItemBodyLocation))
   9. [setHideModel(ItemBodyLocation, ItemBodyLocation)](#setHideModel(zombie.scripting.objects.ItemBodyLocation,zombie.scripting.objects.ItemBodyLocation))
   10. [isHideModel(ItemBodyLocation, ItemBodyLocation)](#isHideModel(zombie.scripting.objects.ItemBodyLocation,zombie.scripting.objects.ItemBodyLocation))
   11. [setAltModel(ItemBodyLocation, ItemBodyLocation)](#setAltModel(zombie.scripting.objects.ItemBodyLocation,zombie.scripting.objects.ItemBodyLocation))
   12. [isAltModel(ItemBodyLocation, ItemBodyLocation)](#isAltModel(zombie.scripting.objects.ItemBodyLocation,zombie.scripting.objects.ItemBodyLocation))
   13. [indexOf(ItemBodyLocation)](#indexOf(zombie.scripting.objects.ItemBodyLocation))
   14. [setMultiItem(ItemBodyLocation, boolean)](#setMultiItem(zombie.scripting.objects.ItemBodyLocation,boolean))
   15. [isMultiItem(ItemBodyLocation)](#isMultiItem(zombie.scripting.objects.ItemBodyLocation))
   16. [getAllLocations()](#getAllLocations())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class BodyLocationGroup
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.WornItems.BodyLocationGroup

---

public class BodyLocationGroup
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `id`

  `private final List<BodyLocation>`

  `locations`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BodyLocationGroup(String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `List<BodyLocation>`

  `getAllLocations()`

  `String`

  `getId()`

  `BodyLocation`

  `getLocation(ItemBodyLocation itemBodyLocation)`

  `BodyLocation`

  `getLocationByIndex(int index)`

  `BodyLocation`

  `getOrCreateLocation(ItemBodyLocation itemBodyLocation)`

  `int`

  `indexOf(ItemBodyLocation locationId)`

  `boolean`

  `isAltModel(ItemBodyLocation firstId,
  ItemBodyLocation secondId)`

  `boolean`

  `isExclusive(ItemBodyLocation firstId,
  ItemBodyLocation secondId)`

  `boolean`

  `isHideModel(ItemBodyLocation firstId,
  ItemBodyLocation secondId)`

  `boolean`

  `isMultiItem(ItemBodyLocation locationId)`

  `void`

  `moveLocationToIndex(ItemBodyLocation itemBodyLocation,
  int index)`

  `void`

  `setAltModel(ItemBodyLocation firstId,
  ItemBodyLocation secondId)`

  `void`

  `setExclusive(ItemBodyLocation firstId,
  ItemBodyLocation secondId)`

  `void`

  `setHideModel(ItemBodyLocation firstId,
  ItemBodyLocation secondId)`

  `void`

  `setMultiItem(ItemBodyLocation locationId,
  boolean bMultiItem)`

  `int`

  `size()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### locations

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[BodyLocation](BodyLocation.html "class in zombie.characters.WornItems")> locations
* Constructor Details
  -------------------

  + ### BodyLocationGroup

    public BodyLocationGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getLocation

    public [BodyLocation](BodyLocation.html "class in zombie.characters.WornItems") getLocation([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### getOrCreateLocation

    public [BodyLocation](BodyLocation.html "class in zombie.characters.WornItems") getOrCreateLocation([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### getLocationByIndex

    public [BodyLocation](BodyLocation.html "class in zombie.characters.WornItems") getLocationByIndex(int index)
  + ### moveLocationToIndex

    public void moveLocationToIndex([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation,
    int index)
  + ### size

    public int size()
  + ### setExclusive

    public void setExclusive([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") firstId,
    [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") secondId)
  + ### isExclusive

    public boolean isExclusive([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") firstId,
    [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") secondId)
  + ### setHideModel

    public void setHideModel([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") firstId,
    [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") secondId)
  + ### isHideModel

    public boolean isHideModel([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") firstId,
    [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") secondId)
  + ### setAltModel

    public void setAltModel([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") firstId,
    [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") secondId)
  + ### isAltModel

    public boolean isAltModel([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") firstId,
    [ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") secondId)
  + ### indexOf

    public int indexOf([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") locationId)
  + ### setMultiItem

    public void setMultiItem([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") locationId,
    boolean bMultiItem)
  + ### isMultiItem

    public boolean isMultiItem([ItemBodyLocation](../../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") locationId)
  + ### getAllLocations

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[BodyLocation](BodyLocation.html "class in zombie.characters.WornItems")> getAllLocations()