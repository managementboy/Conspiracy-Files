[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [PoisonEffect](PoisonEffect.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [None](#None)
   2. [Mild](#Mild)
   3. [Medium](#Medium)
   4. [Severe](#Severe)
   5. [Extreme](#Extreme)
   6. [Deadly](#Deadly)
8. [Field Details](#field-detail)
   1. [names](#names)
   2. [levelMap](#levelMap)
   3. [nameMap](#nameMap)
   4. [level](#level)
   5. [lowerCache](#lowerCache)
9. [Constructor Details](#constructor-detail)
   1. [PoisonEffect(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getLevel()](#getLevel())
    4. [getPlayerEffect()](#getPlayerEffect())
    5. [FromLevel(int)](#FromLevel(int))
    6. [toStringLower()](#toStringLower())
    7. [FromNameLower(String)](#FromNameLower(java.lang.String))
    8. [containsNameLowercase(String)](#containsNameLowercase(java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class PoisonEffect
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids")>

zombie.entity.components.fluids.PoisonEffect

All Implemented Interfaces:
:   `Serializable, Comparable<PoisonEffect>, Constable`

---

public enum PoisonEffect
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Deadly`

  `Extreme`

  `Medium`

  `Mild`

  `None`

  `Severe`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `level`

  `private static final HashMap<Integer, PoisonEffect>`

  `levelMap`

  `private String`

  `lowerCache`

  `private static final HashMap<String, PoisonEffect>`

  `nameMap`

  `private static final HashSet<String>`

  `names`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `PoisonEffect(int level)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static boolean`

  `containsNameLowercase(String name)`

  `static PoisonEffect`

  `FromLevel(int level)`

  `static PoisonEffect`

  `FromNameLower(String name)`

  `int`

  `getLevel()`

  `int`

  `getPlayerEffect()`

  `String`

  `toStringLower()`

  `static PoisonEffect`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static PoisonEffect[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### None

    public static final [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") None
  + ### Mild

    public static final [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") Mild
  + ### Medium

    public static final [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") Medium
  + ### Severe

    public static final [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") Severe
  + ### Extreme

    public static final [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") Extreme
  + ### Deadly

    public static final [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") Deadly
* Field Details
  -------------

  + ### names

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> names
  + ### levelMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids")> levelMap
  + ### nameMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids")> nameMap
  + ### level

    private final int level
  + ### lowerCache

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lowerCache
* Constructor Details
  -------------------

  + ### PoisonEffect

    private PoisonEffect(int level)
* Method Details
  --------------

  + ### values

    public static [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getLevel

    public int getLevel()
  + ### getPlayerEffect

    public int getPlayerEffect()
  + ### FromLevel

    public static [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") FromLevel(int level)
  + ### toStringLower

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toStringLower()
  + ### FromNameLower

    public static [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") FromNameLower([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### containsNameLowercase

    public static boolean containsNameLowercase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)