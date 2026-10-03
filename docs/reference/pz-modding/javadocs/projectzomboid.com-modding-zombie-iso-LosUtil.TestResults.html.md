[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [LosUtil](LosUtil.html)
3. [TestResults](LosUtil.TestResults.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Clear](#Clear)
   2. [ClearThroughOpenDoor](#ClearThroughOpenDoor)
   3. [ClearThroughWindow](#ClearThroughWindow)
   4. [Blocked](#Blocked)
   5. [ClearThroughClosedDoor](#ClearThroughClosedDoor)
7. [Constructor Details](#constructor-detail)
   1. [TestResults()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class LosUtil.TestResults
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso")>

zombie.iso.LosUtil.TestResults

All Implemented Interfaces:
:   `Serializable, Comparable<LosUtil.TestResults>, Constable`

Enclosing class:
:   `LosUtil`

---

public static enum LosUtil.TestResults
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Blocked`

  `Clear`

  `ClearThroughClosedDoor`

  `ClearThroughOpenDoor`

  `ClearThroughWindow`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `TestResults()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static LosUtil.TestResults`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static LosUtil.TestResults[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Clear

    public static final [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") Clear
  + ### ClearThroughOpenDoor

    public static final [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") ClearThroughOpenDoor
  + ### ClearThroughWindow

    public static final [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") ClearThroughWindow
  + ### Blocked

    public static final [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") Blocked
  + ### ClearThroughClosedDoor

    public static final [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") ClearThroughClosedDoor
* Constructor Details
  -------------------

  + ### TestResults

    private TestResults()
* Method Details
  --------------

  + ### values

    public static [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [LosUtil.TestResults](LosUtil.TestResults.html "enum class in zombie.iso") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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