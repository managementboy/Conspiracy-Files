[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [ItemSoundManager](ItemSoundManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [items](#items)
   2. [emitters](#emitters)
   3. [toAdd](#toAdd)
   4. [toRemove](#toRemove)
   5. [toStopItems](#toStopItems)
   6. [toStopEmitters](#toStopEmitters)
   7. [instanceLimiter](#instanceLimiter)
   8. [activeLimiterGroups](#activeLimiterGroups)
   9. [limiterEmitters](#limiterEmitters)
   10. [limiterParams](#limiterParams)
6. [Constructor Details](#constructor-detail)
   1. [ItemSoundManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addItem(InventoryItem)](#addItem(zombie.inventory.InventoryItem))
   2. [removeItem(InventoryItem)](#removeItem(zombie.inventory.InventoryItem))
   3. [removeItems(ArrayList)](#removeItems(java.util.ArrayList))
   4. [update()](#update())
   5. [getExistingContainer(InventoryItem)](#getExistingContainer(zombie.inventory.InventoryItem))
   6. [getEmitterForSoundLimiterGroup(String)](#getEmitterForSoundLimiterGroup(java.lang.String))
   7. [getParamsForSoundLimiterGroup(String)](#getParamsForSoundLimiterGroup(java.lang.String))
   8. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemSoundManager
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemSoundManager

---

public final class ItemSoundManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final List<String>`

  `activeLimiterGroups`

  `private static final ArrayList<BaseSoundEmitter>`

  `emitters`

  `private static final zombie.audio.SoundInstanceLimiter`

  `instanceLimiter`

  `private static final ArrayList<InventoryItem>`

  `items`

  `private static final Map<String, BaseSoundEmitter>`

  `limiterEmitters`

  `private static final Map<String, zombie.audio.SoundLimiterParams>`

  `limiterParams`

  `private static final ArrayList<InventoryItem>`

  `toAdd`

  `private static final ArrayList<InventoryItem>`

  `toRemove`

  `private static final ArrayList<BaseSoundEmitter>`

  `toStopEmitters`

  `private static final ArrayList<InventoryItem>`

  `toStopItems`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemSoundManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addItem(InventoryItem item)`

  `(package private) static BaseSoundEmitter`

  `getEmitterForSoundLimiterGroup(String groupID)`

  `private static ItemContainer`

  `getExistingContainer(InventoryItem item)`

  `(package private) static zombie.audio.SoundLimiterParams`

  `getParamsForSoundLimiterGroup(String groupID)`

  `static void`

  `removeItem(InventoryItem item)`

  `static void`

  `removeItems(ArrayList<InventoryItem> items)`

  `static void`

  `Reset()`

  `static void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### items

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> items
  + ### emitters

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio")> emitters
  + ### toAdd

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> toAdd
  + ### toRemove

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> toRemove
  + ### toStopItems

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> toStopItems
  + ### toStopEmitters

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio")> toStopEmitters
  + ### instanceLimiter

    private static final zombie.audio.SoundInstanceLimiter instanceLimiter
  + ### activeLimiterGroups

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> activeLimiterGroups
  + ### limiterEmitters

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio")> limiterEmitters
  + ### limiterParams

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.audio.SoundLimiterParams> limiterParams
* Constructor Details
  -------------------

  + ### ItemSoundManager

    public ItemSoundManager()
* Method Details
  --------------

  + ### addItem

    public static void addItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### removeItem

    public static void removeItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### removeItems

    public static void removeItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> items)
  + ### update

    public static void update()
  + ### getExistingContainer

    private static [ItemContainer](ItemContainer.html "class in zombie.inventory") getExistingContainer([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### getEmitterForSoundLimiterGroup

    static [BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") getEmitterForSoundLimiterGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") groupID)
  + ### getParamsForSoundLimiterGroup

    static zombie.audio.SoundLimiterParams getParamsForSoundLimiterGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") groupID)
  + ### Reset

    public static void Reset()