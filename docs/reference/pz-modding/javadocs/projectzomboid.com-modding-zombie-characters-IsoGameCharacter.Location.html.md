[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoGameCharacter](IsoGameCharacter.html)
3. [Location](IsoGameCharacter.Location.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [z](#z)
6. [Constructor Details](#constructor-detail)
   1. [Location()](#%3Cinit%3E())
   2. [Location(int, int, int)](#%3Cinit%3E(int,int,int))
7. [Method Details](#method-detail)
   1. [set(int, int, int)](#set(int,int,int))
   2. [getX()](#getX())
   3. [getY()](#getY())
   4. [getZ()](#getZ())
   5. [equals(int, int, int)](#equals(int,int,int))
   6. [equals(Object)](#equals(java.lang.Object))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGameCharacter.Location
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoGameCharacter.Location

Enclosing class:
:   `IsoGameCharacter`

---

public static class IsoGameCharacter.Location
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

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

  `Location()`

  `Location(int x,
  int y,
  int z)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `equals(int x,
  int y,
  int z)`

  `boolean`

  `equals(Object other)`

  `int`

  `getX()`

  `int`

  `getY()`

  `int`

  `getZ()`

  `IsoGameCharacter.Location`

  `set(int x,
  int y,
  int z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    public int x
  + ### y

    public int y
  + ### z

    public int z
* Constructor Details
  -------------------

  + ### Location

    public Location()
  + ### Location

    public Location(int x,
    int y,
    int z)
* Method Details
  --------------

  + ### set

    public [IsoGameCharacter.Location](IsoGameCharacter.Location.html "class in zombie.characters") set(int x,
    int y,
    int z)
  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getZ

    public int getZ()
  + ### equals

    public boolean equals(int x,
    int y,
    int z)
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") other)

    Overrides:
    :   `equals` in class `Object`