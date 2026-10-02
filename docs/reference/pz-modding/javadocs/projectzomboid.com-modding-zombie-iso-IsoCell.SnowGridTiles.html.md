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
3. [SnowGridTiles](IsoCell.SnowGridTiles.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [counter](#counter)
   3. [textures](#textures)
6. [Constructor Details](#constructor-detail)
   1. [SnowGridTiles(byte)](#%3Cinit%3E(byte))
7. [Method Details](#method-detail)
   1. [add(Texture)](#add(zombie.core.textures.Texture))
   2. [getNext()](#getNext())
   3. [get(int)](#get(int))
   4. [size()](#size())
   5. [getRand()](#getRand())
   6. [contains(Texture)](#contains(zombie.core.textures.Texture))
   7. [resetCounter()](#resetCounter())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoCell.SnowGridTiles
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoCell.SnowGridTiles

Enclosing class:
:   `IsoCell`

---

protected class IsoCell.SnowGridTiles
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `counter`

  `protected byte`

  `id`

  `private final ArrayList<Texture>`

  `textures`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SnowGridTiles(byte id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `add(Texture tex)`

  `protected boolean`

  `contains(Texture other)`

  `protected Texture`

  `get(int index)`

  `protected Texture`

  `getNext()`

  `protected Texture`

  `getRand()`

  `protected void`

  `resetCounter()`

  `protected int`

  `size()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    protected byte id
  + ### counter

    private int counter
  + ### textures

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Texture](../core/textures/Texture.html "class in zombie.core.textures")> textures
* Constructor Details
  -------------------

  + ### SnowGridTiles

    public SnowGridTiles(byte id)
* Method Details
  --------------

  + ### add

    protected void add([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex)
  + ### getNext

    protected [Texture](../core/textures/Texture.html "class in zombie.core.textures") getNext()
  + ### get

    protected [Texture](../core/textures/Texture.html "class in zombie.core.textures") get(int index)
  + ### size

    protected int size()
  + ### getRand

    protected [Texture](../core/textures/Texture.html "class in zombie.core.textures") getRand()
  + ### contains

    protected boolean contains([Texture](../core/textures/Texture.html "class in zombie.core.textures") other)
  + ### resetCounter

    protected void resetCounter()