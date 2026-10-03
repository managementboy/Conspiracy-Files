[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [BentFences](BentFences.html)
3. [Entry](BentFences.Entry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [dir](#dir)
   2. [health](#health)
   3. [stages](#stages)
   4. [collapsed](#collapsed)
   5. [debris](#debris)
   6. [length](#length)
   7. [collapsedOffset](#collapsedOffset)
   8. [collapsedSizeX](#collapsedSizeX)
   9. [collapsedSizeY](#collapsedSizeY)
   10. [doSmash](#doSmash)
6. [Constructor Details](#constructor-detail)
   1. [Entry()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isNorth()](#isNorth())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BentFences.Entry
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.BentFences.Entry

Enclosing class:
:   `BentFences`

---

public static final class BentFences.Entry
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final ArrayList<String>`

  `collapsed`

  `(package private) int`

  `collapsedOffset`

  `(package private) int`

  `collapsedSizeX`

  `(package private) int`

  `collapsedSizeY`

  `(package private) final ArrayList<String>`

  `debris`

  `(package private) IsoDirections`

  `dir`

  `(package private) boolean`

  `doSmash`

  `(package private) int`

  `health`

  `(package private) int`

  `length`

  `(package private) final HashMap<Integer, ArrayList<String>>`

  `stages`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Entry()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) boolean`

  `isNorth()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### dir

    [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir
  + ### health

    int health
  + ### stages

    final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> stages
  + ### collapsed

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> collapsed
  + ### debris

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> debris
  + ### length

    int length
  + ### collapsedOffset

    int collapsedOffset
  + ### collapsedSizeX

    int collapsedSizeX
  + ### collapsedSizeY

    int collapsedSizeY
  + ### doSmash

    boolean doSmash
* Constructor Details
  -------------------

  + ### Entry

    public Entry()
* Method Details
  --------------

  + ### isNorth

    boolean isNorth()