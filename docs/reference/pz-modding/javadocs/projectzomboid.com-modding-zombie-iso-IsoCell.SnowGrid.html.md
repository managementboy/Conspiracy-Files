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
3. [SnowGrid](IsoCell.SnowGrid.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [w](#w)
   2. [h](#h)
   3. [frac](#frac)
   4. [N](#N)
   5. [S](#S)
   6. [W](#W)
   7. [E](#E)
   8. [A](#A)
   9. [B](#B)
   10. [grid](#grid)
   11. [gridType](#gridType)
6. [Constructor Details](#constructor-detail)
   1. [SnowGrid(int)](#%3Cinit%3E(int))
7. [Method Details](#method-detail)
   1. [init(int)](#init(int))
   2. [check(int, int)](#check(int,int))
   3. [checkAny(int, int)](#checkAny(int,int))
   4. [set(int, int, int, IsoCell.SnowGridTiles)](#set(int,int,int,zombie.iso.IsoCell.SnowGridTiles))
   5. [subtract(IsoCell.SnowGrid)](#subtract(zombie.iso.IsoCell.SnowGrid))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoCell.SnowGrid
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoCell.SnowGrid

Enclosing class:
:   `IsoCell`

---

private class IsoCell.SnowGrid
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final int`

  `A`

  `static final int`

  `B`

  `static final int`

  `E`

  `int`

  `frac`

  `final Texture[][][]`

  `grid`

  `final byte[][][]`

  `gridType`

  `int`

  `h`

  `static final int`

  `N`

  `static final int`

  `S`

  `int`

  `w`

  `static final int`

  `W`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SnowGrid(int frac)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `check(int x,
  int y)`

  `boolean`

  `checkAny(int x,
  int y)`

  `IsoCell.SnowGrid`

  `init(int frac)`

  `void`

  `set(int x,
  int y,
  int t,
  IsoCell.SnowGridTiles tiles)`

  `void`

  `subtract(IsoCell.SnowGrid other)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### w

    public int w
  + ### h

    public int h
  + ### frac

    public int frac
  + ### N

    public static final int N

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SnowGrid.N)
  + ### S

    public static final int S

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SnowGrid.S)
  + ### W

    public static final int W

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SnowGrid.W)
  + ### E

    public static final int E

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SnowGrid.E)
  + ### A

    public static final int A

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SnowGrid.A)
  + ### B

    public static final int B

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCell.SnowGrid.B)
  + ### grid

    public final [Texture](../core/textures/Texture.html "class in zombie.core.textures")[][][] grid
  + ### gridType

    public final byte[][][] gridType
* Constructor Details
  -------------------

  + ### SnowGrid

    public SnowGrid(int frac)
* Method Details
  --------------

  + ### init

    public [IsoCell.SnowGrid](IsoCell.SnowGrid.html "class in zombie.iso") init(int frac)
  + ### check

    public boolean check(int x,
    int y)
  + ### checkAny

    public boolean checkAny(int x,
    int y)
  + ### set

    public void set(int x,
    int y,
    int t,
    [IsoCell.SnowGridTiles](IsoCell.SnowGridTiles.html "class in zombie.iso") tiles)
  + ### subtract

    public void subtract([IsoCell.SnowGrid](IsoCell.SnowGrid.html "class in zombie.iso") other)