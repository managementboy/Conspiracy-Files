[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [FluidType](FluidType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Water](#Water)
   2. [Petrol](#Petrol)
   3. [RubbingAlcohol](#RubbingAlcohol)
   4. [TaintedWater](#TaintedWater)
   5. [Beer](#Beer)
   6. [Whiskey](#Whiskey)
   7. [SodaPop](#SodaPop)
   8. [Coffee](#Coffee)
   9. [Tea](#Tea)
   10. [Wine](#Wine)
   11. [Bleach](#Bleach)
   12. [Blood](#Blood)
   13. [Honey](#Honey)
   14. [Mead](#Mead)
   15. [Acid](#Acid)
   16. [SpiffoJuice](#SpiffoJuice)
   17. [SecretFlavoring](#SecretFlavoring)
   18. [CarbonatedWater](#CarbonatedWater)
   19. [CowMilk](#CowMilk)
   20. [SheepMilk](#SheepMilk)
   21. [CleaningLiquid](#CleaningLiquid)
   22. [AnimalBlood](#AnimalBlood)
   23. [AnimalGrease](#AnimalGrease)
   24. [Dye](#Dye)
   25. [HairDye](#HairDye)
   26. [Paint](#Paint)
   27. [PoisonWeak](#PoisonWeak)
   28. [PoisonNormal](#PoisonNormal)
   29. [PoisonStrong](#PoisonStrong)
   30. [PoisonPotent](#PoisonPotent)
   31. [AnimalMilk](#AnimalMilk)
   32. [Modded](#Modded)
   33. [None](#None)
8. [Field Details](#field-detail)
   1. [fluidNames](#fluidNames)
   2. [fluidIdMap](#fluidIdMap)
   3. [fluidNameMap](#fluidNameMap)
   4. [id](#id)
   5. [lowerCache](#lowerCache)
9. [Constructor Details](#constructor-detail)
   1. [FluidType(byte)](#%3Cinit%3E(byte))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getId()](#getId())
    4. [toStringLower()](#toStringLower())
    5. [containsNameLowercase(String)](#containsNameLowercase(java.lang.String))
    6. [FromId(byte)](#FromId(byte))
    7. [FromNameLower(String)](#FromNameLower(java.lang.String))
    8. [getAllFluidName()](#getAllFluidName())
    9. [getDisplayName()](#getDisplayName())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class FluidType
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[FluidType](FluidType.html "enum class in zombie.entity.components.fluids")>

zombie.entity.components.fluids.FluidType

All Implemented Interfaces:
:   `Serializable, Comparable<FluidType>, Constable`

---

public enum FluidType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[FluidType](FluidType.html "enum class in zombie.entity.components.fluids")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Acid`

  `AnimalBlood`

  `AnimalGrease`

  `AnimalMilk`

  `Beer`

  `Bleach`

  `Blood`

  `CarbonatedWater`

  `CleaningLiquid`

  `Coffee`

  `CowMilk`

  `Dye`

  `HairDye`

  `Honey`

  `Mead`

  `Modded`

  `None`

  `Paint`

  `Petrol`

  `PoisonNormal`

  `PoisonPotent`

  `PoisonStrong`

  `PoisonWeak`

  `RubbingAlcohol`

  `SecretFlavoring`

  `SheepMilk`

  `SodaPop`

  `SpiffoJuice`

  `TaintedWater`

  `Tea`

  `Water`

  `Whiskey`

  `Wine`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final HashMap<Byte, FluidType>`

  `fluidIdMap`

  `private static final HashMap<String, FluidType>`

  `fluidNameMap`

  `private static final HashSet<String>`

  `fluidNames`

  `private final byte`

  `id`

  `private String`

  `lowerCache`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FluidType(byte typeID)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static boolean`

  `containsNameLowercase(String name)`

  `static FluidType`

  `FromId(byte id)`

  `static FluidType`

  `FromNameLower(String name)`

  `static ArrayList<String>`

  `getAllFluidName()`

  `String`

  `getDisplayName()`

  `byte`

  `getId()`

  `String`

  `toStringLower()`

  `static FluidType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static FluidType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Water

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Water
  + ### Petrol

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Petrol
  + ### RubbingAlcohol

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") RubbingAlcohol
  + ### TaintedWater

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") TaintedWater
  + ### Beer

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Beer
  + ### Whiskey

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Whiskey
  + ### SodaPop

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") SodaPop
  + ### Coffee

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Coffee
  + ### Tea

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Tea
  + ### Wine

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Wine
  + ### Bleach

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Bleach
  + ### Blood

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Blood
  + ### Honey

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Honey
  + ### Mead

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Mead
  + ### Acid

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Acid
  + ### SpiffoJuice

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") SpiffoJuice
  + ### SecretFlavoring

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") SecretFlavoring
  + ### CarbonatedWater

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") CarbonatedWater
  + ### CowMilk

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") CowMilk
  + ### SheepMilk

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") SheepMilk
  + ### CleaningLiquid

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") CleaningLiquid
  + ### AnimalBlood

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") AnimalBlood
  + ### AnimalGrease

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") AnimalGrease
  + ### Dye

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Dye
  + ### HairDye

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") HairDye
  + ### Paint

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Paint
  + ### PoisonWeak

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") PoisonWeak
  + ### PoisonNormal

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") PoisonNormal
  + ### PoisonStrong

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") PoisonStrong
  + ### PoisonPotent

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") PoisonPotent
  + ### AnimalMilk

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") AnimalMilk
  + ### Modded

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") Modded
  + ### None

    public static final [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") None
* Field Details
  -------------

  + ### fluidNames

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> fluidNames
  + ### fluidIdMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Byte](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Byte.html "class or interface in java.lang"), [FluidType](FluidType.html "enum class in zombie.entity.components.fluids")> fluidIdMap
  + ### fluidNameMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [FluidType](FluidType.html "enum class in zombie.entity.components.fluids")> fluidNameMap
  + ### id

    private final byte id
  + ### lowerCache

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lowerCache
* Constructor Details
  -------------------

  + ### FluidType

    private FluidType(byte typeID)
* Method Details
  --------------

  + ### values

    public static [FluidType](FluidType.html "enum class in zombie.entity.components.fluids")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `name` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null
  + ### getId

    public byte getId()
  + ### toStringLower

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toStringLower()
  + ### containsNameLowercase

    public static boolean containsNameLowercase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### FromId

    public static [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") FromId(byte id)
  + ### FromNameLower

    public static [FluidType](FluidType.html "enum class in zombie.entity.components.fluids") FromNameLower([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllFluidName

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllFluidName()
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()