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
3. [ItemPickerRoom](ItemPickerJava.ItemPickerRoom.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [containers](#containers)
   2. [fillRand](#fillRand)
   3. [isShop](#isShop)
   4. [specificId](#specificId)
   5. [professionChance](#professionChance)
   6. [outfit](#outfit)
   7. [outfitFemale](#outfitFemale)
   8. [outfitMale](#outfitMale)
   9. [outfitChance](#outfitChance)
   10. [vehicle](#vehicle)
   11. [vehicles](#vehicles)
   12. [vehicleChance](#vehicleChance)
   13. [vehicleDistribution](#vehicleDistribution)
   14. [vehicleSkin](#vehicleSkin)
   15. [femaleChance](#femaleChance)
   16. [roomTypes](#roomTypes)
   17. [zoneRequires](#zoneRequires)
   18. [zoneDisallows](#zoneDisallows)
   19. [containerChance](#containerChance)
   20. [femaleOdds](#femaleOdds)
   21. [bagType](#bagType)
   22. [bagTable](#bagTable)
   23. [professionChanceInt](#professionChanceInt)
6. [Constructor Details](#constructor-detail)
   1. [ItemPickerRoom()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [compact()](#compact())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemPickerJava.ItemPickerRoom
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemPickerJava.ItemPickerRoom

Enclosing class:
:   `ItemPickerJava`

---

public static final class ItemPickerJava.ItemPickerRoom
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `String`

  `bagTable`

  `String`

  `bagType`

  `String`

  `containerChance`

  `gnu.trove.map.hash.THashMap<String, ItemPickerJava.ItemPickerContainer>`

  `containers`

  `String`

  `femaleChance`

  `String`

  `femaleOdds`

  `int`

  `fillRand`

  `boolean`

  `isShop`

  `String`

  `outfit`

  `String`

  `outfitChance`

  `String`

  `outfitFemale`

  `String`

  `outfitMale`

  `int`

  `professionChance`

  `int`

  `professionChanceInt`

  `String`

  `roomTypes`

  `String`

  `specificId`

  `String`

  `vehicle`

  `String`

  `vehicleChance`

  `String`

  `vehicleDistribution`

  `List<String>`

  `vehicles`

  `Integer`

  `vehicleSkin`

  `String`

  `zoneDisallows`

  `String`

  `zoneRequires`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemPickerRoom()`
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

  + ### containers

    public gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ItemPickerJava.ItemPickerContainer](ItemPickerJava.ItemPickerContainer.html "class in zombie.inventory")> containers
  + ### fillRand

    public int fillRand
  + ### isShop

    public boolean isShop
  + ### specificId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificId
  + ### professionChance

    public int professionChance
  + ### outfit

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit
  + ### outfitFemale

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitFemale
  + ### outfitMale

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitMale
  + ### outfitChance

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitChance
  + ### vehicle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") vehicle
  + ### vehicles

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> vehicles
  + ### vehicleChance

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") vehicleChance
  + ### vehicleDistribution

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") vehicleDistribution
  + ### vehicleSkin

    public [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") vehicleSkin
  + ### femaleChance

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") femaleChance
  + ### roomTypes

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomTypes
  + ### zoneRequires

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneRequires
  + ### zoneDisallows

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneDisallows
  + ### containerChance

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerChance
  + ### femaleOdds

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") femaleOdds
  + ### bagType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bagType
  + ### bagTable

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bagTable
  + ### professionChanceInt

    public int professionChanceInt
* Constructor Details
  -------------------

  + ### ItemPickerRoom

    public ItemPickerRoom()
* Method Details
  --------------

  + ### compact

    void compact()