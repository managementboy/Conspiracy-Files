[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [VehicleType](VehicleType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [vehiclesDefinition](#vehiclesDefinition)
   2. [chanceToSpawnNormal](#chanceToSpawnNormal)
   3. [chanceToSpawnBurnt](#chanceToSpawnBurnt)
   4. [spawnRate](#spawnRate)
   5. [chanceOfOverCar](#chanceOfOverCar)
   6. [randomAngle](#randomAngle)
   7. [baseVehicleQuality](#baseVehicleQuality)
   8. [name](#name)
   9. [chanceToSpawnKey](#chanceToSpawnKey)
   10. [chanceToPartDamage](#chanceToPartDamage)
   11. [isSpecialCar](#isSpecialCar)
   12. [isBurntCar](#isBurntCar)
   13. [chanceToSpawnSpecial](#chanceToSpawnSpecial)
   14. [forceSpawn](#forceSpawn)
   15. [vehicles](#vehicles)
   16. [specialVehicles](#specialVehicles)
7. [Constructor Details](#constructor-detail)
   1. [VehicleType(String)](#%3Cinit%3E(java.lang.String))
8. [Method Details](#method-detail)
   1. [init()](#init())
   2. [validate(Collection)](#validate(java.util.Collection))
   3. [initNormal()](#initNormal())
   4. [hasTypeForZone(String)](#hasTypeForZone(java.lang.String))
   5. [getRandomVehicleType(String)](#getRandomVehicleType(java.lang.String))
   6. [getRandomVehicleType(String, Boolean)](#getRandomVehicleType(java.lang.String,java.lang.Boolean))
   7. [getTypeFromName(String)](#getTypeFromName(java.lang.String))
   8. [getBaseVehicleQuality()](#getBaseVehicleQuality())
   9. [getRandomBaseVehicleQuality()](#getRandomBaseVehicleQuality())
   10. [getChanceToSpawnKey()](#getChanceToSpawnKey())
   11. [setChanceToSpawnKey(int)](#setChanceToSpawnKey(int))
   12. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class VehicleType
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.VehicleType

---

public final class VehicleType
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `VehicleType.VehicleTypeDefinition`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `baseVehicleQuality`

  `int`

  `chanceOfOverCar`

  `int`

  `chanceToPartDamage`

  `int`

  `chanceToSpawnBurnt`

  `private int`

  `chanceToSpawnKey`

  `int`

  `chanceToSpawnNormal`

  `int`

  `chanceToSpawnSpecial`

  `boolean`

  `forceSpawn`

  `boolean`

  `isBurntCar`

  `boolean`

  `isSpecialCar`

  `String`

  `name`

  `boolean`

  `randomAngle`

  `int`

  `spawnRate`

  `static final ArrayList<VehicleType>`

  `specialVehicles`

  `static final HashMap<String, VehicleType>`

  `vehicles`

  `final ArrayList<VehicleType.VehicleTypeDefinition>`

  `vehiclesDefinition`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehicleType(String name)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getBaseVehicleQuality()`

  `int`

  `getChanceToSpawnKey()`

  `float`

  `getRandomBaseVehicleQuality()`

  `static VehicleType`

  `getRandomVehicleType(String zoneName)`

  `static VehicleType`

  `getRandomVehicleType(String zoneName,
  Boolean doNormalWhenSpecific)`

  `static VehicleType`

  `getTypeFromName(String name)`

  `static boolean`

  `hasTypeForZone(String zoneName)`

  `static void`

  `init()`

  `private static void`

  `initNormal()`

  `static void`

  `Reset()`

  `void`

  `setChanceToSpawnKey(int chanceToSpawnKey)`

  `private static void`

  `validate(Collection<VehicleType> types)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### vehiclesDefinition

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleType.VehicleTypeDefinition](VehicleType.VehicleTypeDefinition.html "class in zombie.vehicles")> vehiclesDefinition
  + ### chanceToSpawnNormal

    public int chanceToSpawnNormal
  + ### chanceToSpawnBurnt

    public int chanceToSpawnBurnt
  + ### spawnRate

    public int spawnRate
  + ### chanceOfOverCar

    public int chanceOfOverCar
  + ### randomAngle

    public boolean randomAngle
  + ### baseVehicleQuality

    public float baseVehicleQuality
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### chanceToSpawnKey

    private int chanceToSpawnKey
  + ### chanceToPartDamage

    public int chanceToPartDamage
  + ### isSpecialCar

    public boolean isSpecialCar
  + ### isBurntCar

    public boolean isBurntCar
  + ### chanceToSpawnSpecial

    public int chanceToSpawnSpecial
  + ### forceSpawn

    public boolean forceSpawn
  + ### vehicles

    public static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [VehicleType](VehicleType.html "class in zombie.vehicles")> vehicles
  + ### specialVehicles

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleType](VehicleType.html "class in zombie.vehicles")> specialVehicles
* Constructor Details
  -------------------

  + ### VehicleType

    public VehicleType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### init

    public static void init()
  + ### validate

    private static void validate([Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html "class or interface in java.util")<[VehicleType](VehicleType.html "class in zombie.vehicles")> types)
  + ### initNormal

    private static void initNormal()
  + ### hasTypeForZone

    public static boolean hasTypeForZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### getRandomVehicleType

    public static [VehicleType](VehicleType.html "class in zombie.vehicles") getRandomVehicleType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName)
  + ### getRandomVehicleType

    public static [VehicleType](VehicleType.html "class in zombie.vehicles") getRandomVehicleType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") doNormalWhenSpecific)
  + ### getTypeFromName

    public static [VehicleType](VehicleType.html "class in zombie.vehicles") getTypeFromName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getBaseVehicleQuality

    public float getBaseVehicleQuality()
  + ### getRandomBaseVehicleQuality

    public float getRandomBaseVehicleQuality()
  + ### getChanceToSpawnKey

    public int getChanceToSpawnKey()
  + ### setChanceToSpawnKey

    public void setChanceToSpawnKey(int chanceToSpawnKey)
  + ### Reset

    public static void Reset()