[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoCell](IsoCell.html)
3. [StencilArea](IsoCell.StencilArea.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [stencilX1](#stencilX1)
   2. [stencilY1](#stencilY1)
   3. [stencilX2](#stencilX2)
   4. [stencilY2](#stencilY2)
   5. [x](#x)
   6. [y](#y)
   7. [texWidth](#texWidth)
   8. [texHeight](#texHeight)
   9. [offX](#offX)
   10. [offY](#offY)
6. [Constructor Details](#constructor-detail)
   1. [StencilArea(int, int, int, int, int, int, int, int, int, int)](#%3Cinit%3E(int,int,int,int,int,int,int,int,int,int))
7. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [hashCode()](#hashCode())
   3. [equals(Object)](#equals(java.lang.Object))
   4. [stencilX1()](#stencilX1())
   5. [stencilY1()](#stencilY1())
   6. [stencilX2()](#stencilX2())
   7. [stencilY2()](#stencilY2())
   8. [x()](#x())
   9. [y()](#y())
   10. [texWidth()](#texWidth())
   11. [texHeight()](#texHeight())
   12. [offX()](#offX())
   13. [offY()](#offY())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Record Class IsoCell.StencilArea
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

zombie.iso.IsoCell.StencilArea

Enclosing class:
:   `IsoCell`

---

public static record IsoCell.StencilArea(int stencilX1, int stencilY1, int stencilX2, int stencilY2, int x, int y, int texWidth, int texHeight, int offX, int offY)
extends [Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `offX`

  The field for the `offX` record component.

  `private final int`

  `offY`

  The field for the `offY` record component.

  `private final int`

  `stencilX1`

  The field for the `stencilX1` record component.

  `private final int`

  `stencilX2`

  The field for the `stencilX2` record component.

  `private final int`

  `stencilY1`

  The field for the `stencilY1` record component.

  `private final int`

  `stencilY2`

  The field for the `stencilY2` record component.

  `private final int`

  `texHeight`

  The field for the `texHeight` record component.

  `private final int`

  `texWidth`

  The field for the `texWidth` record component.

  `private final int`

  `x`

  The field for the `x` record component.

  `private final int`

  `y`

  The field for the `y` record component.
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `StencilArea(int stencilX1,
  int stencilY1,
  int stencilX2,
  int stencilY2,
  int x,
  int y,
  int texWidth,
  int texHeight,
  int offX,
  int offY)`

  Creates an instance of a `StencilArea` record class.
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `final boolean`

  `equals(Object o)`

  Indicates whether some other object is "equal to" this one.

  `final int`

  `hashCode()`

  Returns a hash code value for this object.

  `int`

  `offX()`

  Returns the value of the `offX` record component.

  `int`

  `offY()`

  Returns the value of the `offY` record component.

  `int`

  `stencilX1()`

  Returns the value of the `stencilX1` record component.

  `int`

  `stencilX2()`

  Returns the value of the `stencilX2` record component.

  `int`

  `stencilY1()`

  Returns the value of the `stencilY1` record component.

  `int`

  `stencilY2()`

  Returns the value of the `stencilY2` record component.

  `int`

  `texHeight()`

  Returns the value of the `texHeight` record component.

  `int`

  `texWidth()`

  Returns the value of the `texWidth` record component.

  `final String`

  `toString()`

  Returns a string representation of this record class.

  `int`

  `x()`

  Returns the value of the `x` record component.

  `int`

  `y()`

  Returns the value of the `y` record component.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### stencilX1

    private final int stencilX1

    The field for the `stencilX1` record component.
  + ### stencilY1

    private final int stencilY1

    The field for the `stencilY1` record component.
  + ### stencilX2

    private final int stencilX2

    The field for the `stencilX2` record component.
  + ### stencilY2

    private final int stencilY2

    The field for the `stencilY2` record component.
  + ### x

    private final int x

    The field for the `x` record component.
  + ### y

    private final int y

    The field for the `y` record component.
  + ### texWidth

    private final int texWidth

    The field for the `texWidth` record component.
  + ### texHeight

    private final int texHeight

    The field for the `texHeight` record component.
  + ### offX

    private final int offX

    The field for the `offX` record component.
  + ### offY

    private final int offY

    The field for the `offY` record component.
* Constructor Details
  -------------------

  + ### StencilArea

    public StencilArea(int stencilX1,
    int stencilY1,
    int stencilX2,
    int stencilY2,
    int x,
    int y,
    int texWidth,
    int texHeight,
    int offX,
    int offY)

    Creates an instance of a `StencilArea` record class.

    Parameters:
    :   `stencilX1` - the value for the `stencilX1` record component
    :   `stencilY1` - the value for the `stencilY1` record component
    :   `stencilX2` - the value for the `stencilX2` record component
    :   `stencilY2` - the value for the `stencilY2` record component
    :   `x` - the value for the `x` record component
    :   `y` - the value for the `y` record component
    :   `texWidth` - the value for the `texWidth` record component
    :   `texHeight` - the value for the `texHeight` record component
    :   `offX` - the value for the `offX` record component
    :   `offY` - the value for the `offY` record component
* Method Details
  --------------

  + ### toString

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Returns a string representation of this record class. The representation contains the name of the class, followed by the name and value of each of the record components.

    Specified by:
    :   `toString` in class `Record`

    Returns:
    :   a string representation of this object
  + ### hashCode

    public final int hashCode()

    Returns a hash code value for this object. The value is derived from the hash code of each of the record components.

    Specified by:
    :   `hashCode` in class `Record`

    Returns:
    :   a hash code value for this object
  + ### equals

    public final boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Indicates whether some other object is "equal to" this one. The objects are equal if the other object is of the same class and if all the record components are equal. All components in this record class are compared with the `compare` method from their corresponding wrapper classes.

    Specified by:
    :   `equals` in class `Record`

    Parameters:
    :   `o` - the object with which to compare

    Returns:
    :   `true` if this object is the same as the `o` argument; `false` otherwise.
  + ### stencilX1

    public int stencilX1()

    Returns the value of the `stencilX1` record component.

    Returns:
    :   the value of the `stencilX1` record component
  + ### stencilY1

    public int stencilY1()

    Returns the value of the `stencilY1` record component.

    Returns:
    :   the value of the `stencilY1` record component
  + ### stencilX2

    public int stencilX2()

    Returns the value of the `stencilX2` record component.

    Returns:
    :   the value of the `stencilX2` record component
  + ### stencilY2

    public int stencilY2()

    Returns the value of the `stencilY2` record component.

    Returns:
    :   the value of the `stencilY2` record component
  + ### x

    public int x()

    Returns the value of the `x` record component.

    Returns:
    :   the value of the `x` record component
  + ### y

    public int y()

    Returns the value of the `y` record component.

    Returns:
    :   the value of the `y` record component
  + ### texWidth

    public int texWidth()

    Returns the value of the `texWidth` record component.

    Returns:
    :   the value of the `texWidth` record component
  + ### texHeight

    public int texHeight()

    Returns the value of the `texHeight` record component.

    Returns:
    :   the value of the `texHeight` record component
  + ### offX

    public int offX()

    Returns the value of the `offX` record component.

    Returns:
    :   the value of the `offX` record component
  + ### offY

    public int offY()

    Returns the value of the `offY` record component.

    Returns:
    :   the value of the `offY` record component