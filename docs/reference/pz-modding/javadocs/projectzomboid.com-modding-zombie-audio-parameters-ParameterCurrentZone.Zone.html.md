[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.audio.parameters](package-summary.html)
2. [ParameterCurrentZone](ParameterCurrentZone.html)
3. [Zone](ParameterCurrentZone.Zone.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [None](#None)
   2. [DeepForest](#DeepForest)
   3. [Farm](#Farm)
   4. [Forest](#Forest)
   5. [Nav](#Nav)
   6. [Town](#Town)
   7. [TrailerPark](#TrailerPark)
   8. [Vegetation](#Vegetation)
8. [Field Details](#field-detail)
   1. [label](#label)
9. [Constructor Details](#constructor-detail)
   1. [Zone(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class ParameterCurrentZone.Zone
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters")>

zombie.audio.parameters.ParameterCurrentZone.Zone

All Implemented Interfaces:
:   `Serializable, Comparable<ParameterCurrentZone.Zone>, Constable`

Enclosing class:
:   `ParameterCurrentZone`

---

static enum ParameterCurrentZone.Zone
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `DeepForest`

  `Farm`

  `Forest`

  `Nav`

  `None`

  `Town`

  `TrailerPark`

  `Vegetation`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final int`

  `label`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Zone(int label)`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ParameterCurrentZone.Zone`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static ParameterCurrentZone.Zone[]`

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

    public static final [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") None
  + ### DeepForest

    public static final [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") DeepForest
  + ### Farm

    public static final [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") Farm
  + ### Forest

    public static final [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") Forest
  + ### Nav

    public static final [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") Nav
  + ### Town

    public static final [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") Town
  + ### TrailerPark

    public static final [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") TrailerPark
  + ### Vegetation

    public static final [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") Vegetation
* Field Details
  -------------

  + ### label

    final int label
* Constructor Details
  -------------------

  + ### Zone

    private Zone(int label)
* Method Details
  --------------

  + ### values

    public static [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [ParameterCurrentZone.Zone](ParameterCurrentZone.Zone.html "enum class in zombie.audio.parameters") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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