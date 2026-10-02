[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.worldgen.biomes](package-summary.html)
2. [BiomeRegistry](BiomeRegistry.html)
3. [BiomeGetterFiltered](BiomeRegistry.BiomeGetterFiltered.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [filter](#filter)
   2. [bush](#bush)
   3. [oreLevel](#oreLevel)
6. [Constructor Details](#constructor-detail)
   1. [BiomeGetterFiltered(String, BiomeType.Bush, BiomeType.OreLevel)](#%3Cinit%3E(java.lang.String,zombie.iso.worldgen.biomes.BiomeType.Bush,zombie.iso.worldgen.biomes.BiomeType.OreLevel))
7. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [hashCode()](#hashCode())
   3. [equals(Object)](#equals(java.lang.Object))
   4. [filter()](#filter())
   5. [bush()](#bush())
   6. [oreLevel()](#oreLevel())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Record Class BiomeRegistry.BiomeGetterFiltered
==============================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

zombie.iso.worldgen.biomes.BiomeRegistry.BiomeGetterFiltered

Enclosing class:
:   `BiomeRegistry`

---

private static record BiomeRegistry.BiomeGetterFiltered([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter, zombie.iso.worldgen.biomes.BiomeType.Bush bush, zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel)
extends [Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.iso.worldgen.biomes.BiomeType.Bush`

  `bush`

  The field for the `bush` record component.

  `private final String`

  `filter`

  The field for the `filter` record component.

  `private final zombie.iso.worldgen.biomes.BiomeType.OreLevel`

  `oreLevel`

  The field for the `oreLevel` record component.
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BiomeGetterFiltered(String filter,
  zombie.iso.worldgen.biomes.BiomeType.Bush bush,
  zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel)`

  Creates an instance of a `BiomeGetterFiltered` record class.
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.iso.worldgen.biomes.BiomeType.Bush`

  `bush()`

  Returns the value of the `bush` record component.

  `final boolean`

  `equals(Object o)`

  Indicates whether some other object is "equal to" this one.

  `String`

  `filter()`

  Returns the value of the `filter` record component.

  `final int`

  `hashCode()`

  Returns a hash code value for this object.

  `zombie.iso.worldgen.biomes.BiomeType.OreLevel`

  `oreLevel()`

  Returns the value of the `oreLevel` record component.

  `final String`

  `toString()`

  Returns a string representation of this record class.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### filter

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter

    The field for the `filter` record component.
  + ### bush

    private final zombie.iso.worldgen.biomes.BiomeType.Bush bush

    The field for the `bush` record component.
  + ### oreLevel

    private final zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel

    The field for the `oreLevel` record component.
* Constructor Details
  -------------------

  + ### BiomeGetterFiltered

    private BiomeGetterFiltered([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    zombie.iso.worldgen.biomes.BiomeType.Bush bush,
    zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel)

    Creates an instance of a `BiomeGetterFiltered` record class.

    Parameters:
    :   `filter` - the value for the `filter` record component
    :   `bush` - the value for the `bush` record component
    :   `oreLevel` - the value for the `oreLevel` record component
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

    Indicates whether some other object is "equal to" this one. The objects are equal if the other object is of the same class and if all the record components are equal. All components in this record class are compared with [`Objects::equals(Object,Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Objects.html#equals(java.lang.Object,java.lang.Object) "class or interface in java.util").

    Specified by:
    :   `equals` in class `Record`

    Parameters:
    :   `o` - the object with which to compare

    Returns:
    :   `true` if this object is the same as the `o` argument; `false` otherwise.
  + ### filter

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter()

    Returns the value of the `filter` record component.

    Returns:
    :   the value of the `filter` record component
  + ### bush

    public zombie.iso.worldgen.biomes.BiomeType.Bush bush()

    Returns the value of the `bush` record component.

    Returns:
    :   the value of the `bush` record component
  + ### oreLevel

    public zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel()

    Returns the value of the `oreLevel` record component.

    Returns:
    :   the value of the `oreLevel` record component