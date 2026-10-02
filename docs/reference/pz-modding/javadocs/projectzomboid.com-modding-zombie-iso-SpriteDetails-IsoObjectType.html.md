[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.SpriteDetails](package-summary.html)
2. [IsoObjectType](IsoObjectType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [normal](#normal)
   2. [jukebox](#jukebox)
   3. [wall](#wall)
   4. [stairsTW](#stairsTW)
   5. [stairsTN](#stairsTN)
   6. [stairsMW](#stairsMW)
   7. [stairsMN](#stairsMN)
   8. [stairsBW](#stairsBW)
   9. [stairsBN](#stairsBN)
   10. [UNUSED9](#UNUSED9)
   11. [UNUSED10](#UNUSED10)
   12. [doorW](#doorW)
   13. [doorN](#doorN)
   14. [lightswitch](#lightswitch)
   15. [radio](#radio)
   16. [curtainN](#curtainN)
   17. [curtainS](#curtainS)
   18. [curtainW](#curtainW)
   19. [curtainE](#curtainE)
   20. [doorFrW](#doorFrW)
   21. [doorFrN](#doorFrN)
   22. [tree](#tree)
   23. [windowFN](#windowFN)
   24. [windowFW](#windowFW)
   25. [UNUSED24](#UNUSED24)
   26. [WestRoofB](#WestRoofB)
   27. [WestRoofM](#WestRoofM)
   28. [WestRoofT](#WestRoofT)
   29. [isMoveAbleObject](#isMoveAbleObject)
   30. [MAX](#MAX)
8. [Field Details](#field-detail)
   1. [index](#index)
   2. [fromStringMap](#fromStringMap)
9. [Constructor Details](#constructor-detail)
   1. [IsoObjectType(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [index()](#index())
    4. [fromIndex(int)](#fromIndex(int))
    5. [FromString(String)](#FromString(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class IsoObjectType
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails")>

zombie.iso.SpriteDetails.IsoObjectType

All Implemented Interfaces:
:   `Serializable, Comparable<IsoObjectType>, Constable`

---

public enum IsoObjectType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `curtainE`

  `curtainN`

  `curtainS`

  `curtainW`

  `doorFrN`

  `doorFrW`

  `doorN`

  `doorW`

  `isMoveAbleObject`

  `jukebox`

  `lightswitch`

  `MAX`

  `normal`

  `radio`

  `stairsBN`

  `stairsBW`

  `stairsMN`

  `stairsMW`

  `stairsTN`

  `stairsTW`

  `tree`

  `UNUSED10`

  `UNUSED24`

  `UNUSED9`

  `wall`

  `WestRoofB`

  `WestRoofM`

  `WestRoofT`

  `windowFN`

  `windowFW`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final HashMap<String, IsoObjectType>`

  `fromStringMap`

  `private final int`

  `index`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `IsoObjectType(int index)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoObjectType`

  `fromIndex(int value)`

  `static IsoObjectType`

  `FromString(String str)`

  `int`

  `index()`

  `static IsoObjectType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static IsoObjectType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### normal

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") normal
  + ### jukebox

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") jukebox
  + ### wall

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") wall
  + ### stairsTW

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") stairsTW
  + ### stairsTN

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") stairsTN
  + ### stairsMW

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") stairsMW
  + ### stairsMN

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") stairsMN
  + ### stairsBW

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") stairsBW
  + ### stairsBN

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") stairsBN
  + ### UNUSED9

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") UNUSED9
  + ### UNUSED10

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") UNUSED10
  + ### doorW

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") doorW
  + ### doorN

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") doorN
  + ### lightswitch

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") lightswitch
  + ### radio

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") radio
  + ### curtainN

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") curtainN
  + ### curtainS

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") curtainS
  + ### curtainW

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") curtainW
  + ### curtainE

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") curtainE
  + ### doorFrW

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") doorFrW
  + ### doorFrN

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") doorFrN
  + ### tree

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") tree
  + ### windowFN

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") windowFN
  + ### windowFW

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") windowFW
  + ### UNUSED24

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") UNUSED24
  + ### WestRoofB

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") WestRoofB
  + ### WestRoofM

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") WestRoofM
  + ### WestRoofT

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") WestRoofT
  + ### isMoveAbleObject

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") isMoveAbleObject
  + ### MAX

    public static final [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") MAX
* Field Details
  -------------

  + ### index

    private final int index
  + ### fromStringMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails")> fromStringMap
* Constructor Details
  -------------------

  + ### IsoObjectType

    private IsoObjectType(int index)
* Method Details
  --------------

  + ### values

    public static [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### index

    public int index()
  + ### fromIndex

    public static [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") fromIndex(int value)
  + ### FromString

    public static [IsoObjectType](IsoObjectType.html "enum class in zombie.iso.SpriteDetails") FromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)