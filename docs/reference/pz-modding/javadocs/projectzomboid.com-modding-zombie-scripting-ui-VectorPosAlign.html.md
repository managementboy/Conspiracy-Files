[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.ui](package-summary.html)
2. [VectorPosAlign](VectorPosAlign.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [None](#None)
   2. [TopLeft](#TopLeft)
   3. [TopMiddle](#TopMiddle)
   4. [TopRight](#TopRight)
   5. [CenterLeft](#CenterLeft)
   6. [CenterMiddle](#CenterMiddle)
   7. [CenterRight](#CenterRight)
   8. [BottomLeft](#BottomLeft)
   9. [BottomMiddle](#BottomMiddle)
   10. [BottomRight](#BottomRight)
8. [Field Details](#field-detail)
   1. [xmod](#xmod)
   2. [ymod](#ymod)
9. [Constructor Details](#constructor-detail)
   1. [VectorPosAlign(float, float)](#%3Cinit%3E(float,float))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getXmod()](#getXmod())
    4. [getYmod()](#getYmod())
    5. [getX(XuiScript.XuiVector)](#getX(zombie.scripting.ui.XuiScript.XuiVector))
    6. [getY(XuiScript.XuiVector)](#getY(zombie.scripting.ui.XuiScript.XuiVector))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class VectorPosAlign
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui")>

zombie.scripting.ui.VectorPosAlign

All Implemented Interfaces:
:   `Serializable, Comparable<VectorPosAlign>, Constable`

---

public enum VectorPosAlign
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `BottomLeft`

  `BottomMiddle`

  `BottomRight`

  `CenterLeft`

  `CenterMiddle`

  `CenterRight`

  `None`

  `TopLeft`

  `TopMiddle`

  `TopRight`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final float`

  `xmod`

  `private final float`

  `ymod`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `VectorPosAlign(float xmod,
  float ymod)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getX(XuiScript.XuiVector v)`

  `float`

  `getXmod()`

  `float`

  `getY(XuiScript.XuiVector v)`

  `float`

  `getYmod()`

  `static VectorPosAlign`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static VectorPosAlign[]`

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

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") None
  + ### TopLeft

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") TopLeft
  + ### TopMiddle

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") TopMiddle
  + ### TopRight

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") TopRight
  + ### CenterLeft

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") CenterLeft
  + ### CenterMiddle

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") CenterMiddle
  + ### CenterRight

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") CenterRight
  + ### BottomLeft

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") BottomLeft
  + ### BottomMiddle

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") BottomMiddle
  + ### BottomRight

    public static final [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") BottomRight
* Field Details
  -------------

  + ### xmod

    private final float xmod
  + ### ymod

    private final float ymod
* Constructor Details
  -------------------

  + ### VectorPosAlign

    private VectorPosAlign(float xmod,
    float ymod)
* Method Details
  --------------

  + ### values

    public static [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [VectorPosAlign](VectorPosAlign.html "enum class in zombie.scripting.ui") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getXmod

    public float getXmod()
  + ### getYmod

    public float getYmod()
  + ### getX

    public float getX([XuiScript.XuiVector](XuiScript.XuiVector.html "class in zombie.scripting.ui") v)
  + ### getY

    public float getY([XuiScript.XuiVector](XuiScript.XuiVector.html "class in zombie.scripting.ui") v)