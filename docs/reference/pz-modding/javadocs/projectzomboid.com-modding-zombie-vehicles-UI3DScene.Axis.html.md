[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [UI3DScene](UI3DScene.html)
3. [Axis](UI3DScene.Axis.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [None](#None)
   2. [X](#X)
   3. [Y](#Y)
   4. [Z](#Z)
   5. [XY](#XY)
   6. [XZ](#XZ)
   7. [YZ](#YZ)
7. [Constructor Details](#constructor-detail)
   1. [Axis()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class UI3DScene.Axis
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles")>

zombie.vehicles.UI3DScene.Axis

All Implemented Interfaces:
:   `Serializable, Comparable<UI3DScene.Axis>, Constable`

Enclosing class:
:   `UI3DScene`

---

static enum UI3DScene.Axis
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `None`

  `X`

  `XY`

  `XZ`

  `Y`

  `YZ`

  `Z`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Axis()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static UI3DScene.Axis`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static UI3DScene.Axis[]`

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

    public static final [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") None
  + ### X

    public static final [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") X
  + ### Y

    public static final [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") Y
  + ### Z

    public static final [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") Z
  + ### XY

    public static final [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") XY
  + ### XZ

    public static final [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") XZ
  + ### YZ

    public static final [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") YZ
* Constructor Details
  -------------------

  + ### Axis

    private Axis()
* Method Details
  --------------

  + ### values

    public static [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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