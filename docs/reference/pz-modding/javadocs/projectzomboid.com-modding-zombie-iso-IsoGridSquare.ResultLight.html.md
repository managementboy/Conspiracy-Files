[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoGridSquare](IsoGridSquare.html)
3. [ResultLight](IsoGridSquare.ResultLight.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [x](#x)
   3. [y](#y)
   4. [z](#z)
   5. [radius](#radius)
   6. [r](#r)
   7. [g](#g)
   8. [b](#b)
   9. [RLF\_NONE](#RLF_NONE)
   10. [RLF\_ROOMLIGHT](#RLF_ROOMLIGHT)
   11. [RLF\_TORCH](#RLF_TORCH)
   12. [flags](#flags)
6. [Constructor Details](#constructor-detail)
   1. [ResultLight()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [copyFrom(IsoGridSquare.ResultLight)](#copyFrom(zombie.iso.IsoGridSquare.ResultLight))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGridSquare.ResultLight
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoGridSquare.ResultLight

Enclosing class:
:   `IsoGridSquare`

---

public static final class IsoGridSquare.ResultLight
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `b`

  `int`

  `flags`

  `float`

  `g`

  `int`

  `id`

  `float`

  `r`

  `int`

  `radius`

  `static final int`

  `RLF_NONE`

  `static final int`

  `RLF_ROOMLIGHT`

  `static final int`

  `RLF_TORCH`

  `int`

  `x`

  `int`

  `y`

  `int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ResultLight()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `IsoGridSquare.ResultLight`

  `copyFrom(IsoGridSquare.ResultLight other)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    public int id
  + ### x

    public int x
  + ### y

    public int y
  + ### z

    public int z
  + ### radius

    public int radius
  + ### r

    public float r
  + ### g

    public float g
  + ### b

    public float b
  + ### RLF\_NONE

    public static final int RLF\_NONE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.ResultLight.RLF_NONE)
  + ### RLF\_ROOMLIGHT

    public static final int RLF\_ROOMLIGHT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.ResultLight.RLF_ROOMLIGHT)
  + ### RLF\_TORCH

    public static final int RLF\_TORCH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoGridSquare.ResultLight.RLF_TORCH)
  + ### flags

    public int flags
* Constructor Details
  -------------------

  + ### ResultLight

    public ResultLight()
* Method Details
  --------------

  + ### copyFrom

    public [IsoGridSquare.ResultLight](IsoGridSquare.ResultLight.html "class in zombie.iso") copyFrom([IsoGridSquare.ResultLight](IsoGridSquare.ResultLight.html "class in zombie.iso") other)