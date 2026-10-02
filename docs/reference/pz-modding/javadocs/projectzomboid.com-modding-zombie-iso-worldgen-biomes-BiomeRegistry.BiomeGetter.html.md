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
3. [BiomeGetter](BiomeRegistry.BiomeGetter.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [landscape](#landscape)
   2. [plant](#plant)
   3. [bush](#bush)
   4. [temperature](#temperature)
   5. [hygrometry](#hygrometry)
   6. [oreLevel](#oreLevel)
6. [Constructor Details](#constructor-detail)
   1. [BiomeGetter(BiomeType.Landscape, BiomeType.Plant, BiomeType.Bush, BiomeType.Temperature, BiomeType.Hygrometry, BiomeType.OreLevel)](#%3Cinit%3E(zombie.iso.worldgen.biomes.BiomeType.Landscape,zombie.iso.worldgen.biomes.BiomeType.Plant,zombie.iso.worldgen.biomes.BiomeType.Bush,zombie.iso.worldgen.biomes.BiomeType.Temperature,zombie.iso.worldgen.biomes.BiomeType.Hygrometry,zombie.iso.worldgen.biomes.BiomeType.OreLevel))
7. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [hashCode()](#hashCode())
   3. [equals(Object)](#equals(java.lang.Object))
   4. [landscape()](#landscape())
   5. [plant()](#plant())
   6. [bush()](#bush())
   7. [temperature()](#temperature())
   8. [hygrometry()](#hygrometry())
   9. [oreLevel()](#oreLevel())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Record Class BiomeRegistry.BiomeGetter
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

zombie.iso.worldgen.biomes.BiomeRegistry.BiomeGetter

Enclosing class:
:   `BiomeRegistry`

---

private static record BiomeRegistry.BiomeGetter(zombie.iso.worldgen.biomes.BiomeType.Landscape landscape, zombie.iso.worldgen.biomes.BiomeType.Plant plant, zombie.iso.worldgen.biomes.BiomeType.Bush bush, zombie.iso.worldgen.biomes.BiomeType.Temperature temperature, zombie.iso.worldgen.biomes.BiomeType.Hygrometry hygrometry, zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel)
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

  `private final zombie.iso.worldgen.biomes.BiomeType.Hygrometry`

  `hygrometry`

  The field for the `hygrometry` record component.

  `private final zombie.iso.worldgen.biomes.BiomeType.Landscape`

  `landscape`

  The field for the `landscape` record component.

  `private final zombie.iso.worldgen.biomes.BiomeType.OreLevel`

  `oreLevel`

  The field for the `oreLevel` record component.

  `private final zombie.iso.worldgen.biomes.BiomeType.Plant`

  `plant`

  The field for the `plant` record component.

  `private final zombie.iso.worldgen.biomes.BiomeType.Temperature`

  `temperature`

  The field for the `temperature` record component.
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BiomeGetter(zombie.iso.worldgen.biomes.BiomeType.Landscape landscape,
  zombie.iso.worldgen.biomes.BiomeType.Plant plant,
  zombie.iso.worldgen.biomes.BiomeType.Bush bush,
  zombie.iso.worldgen.biomes.BiomeType.Temperature temperature,
  zombie.iso.worldgen.biomes.BiomeType.Hygrometry hygrometry,
  zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel)`

  Creates an instance of a `BiomeGetter` record class.
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

  `final int`

  `hashCode()`

  Returns a hash code value for this object.

  `zombie.iso.worldgen.biomes.BiomeType.Hygrometry`

  `hygrometry()`

  Returns the value of the `hygrometry` record component.

  `zombie.iso.worldgen.biomes.BiomeType.Landscape`

  `landscape()`

  Returns the value of the `landscape` record component.

  `zombie.iso.worldgen.biomes.BiomeType.OreLevel`

  `oreLevel()`

  Returns the value of the `oreLevel` record component.

  `zombie.iso.worldgen.biomes.BiomeType.Plant`

  `plant()`

  Returns the value of the `plant` record component.

  `zombie.iso.worldgen.biomes.BiomeType.Temperature`

  `temperature()`

  Returns the value of the `temperature` record component.

  `final String`

  `toString()`

  Returns a string representation of this record class.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### landscape

    private final zombie.iso.worldgen.biomes.BiomeType.Landscape landscape

    The field for the `landscape` record component.
  + ### plant

    private final zombie.iso.worldgen.biomes.BiomeType.Plant plant

    The field for the `plant` record component.
  + ### bush

    private final zombie.iso.worldgen.biomes.BiomeType.Bush bush

    The field for the `bush` record component.
  + ### temperature

    private final zombie.iso.worldgen.biomes.BiomeType.Temperature temperature

    The field for the `temperature` record component.
  + ### hygrometry

    private final zombie.iso.worldgen.biomes.BiomeType.Hygrometry hygrometry

    The field for the `hygrometry` record component.
  + ### oreLevel

    private final zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel

    The field for the `oreLevel` record component.
* Constructor Details
  -------------------

  + ### BiomeGetter

    private BiomeGetter(zombie.iso.worldgen.biomes.BiomeType.Landscape landscape,
    zombie.iso.worldgen.biomes.BiomeType.Plant plant,
    zombie.iso.worldgen.biomes.BiomeType.Bush bush,
    zombie.iso.worldgen.biomes.BiomeType.Temperature temperature,
    zombie.iso.worldgen.biomes.BiomeType.Hygrometry hygrometry,
    zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel)

    Creates an instance of a `BiomeGetter` record class.

    Parameters:
    :   `landscape` - the value for the `landscape` record component
    :   `plant` - the value for the `plant` record component
    :   `bush` - the value for the `bush` record component
    :   `temperature` - the value for the `temperature` record component
    :   `hygrometry` - the value for the `hygrometry` record component
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
  + ### landscape

    public zombie.iso.worldgen.biomes.BiomeType.Landscape landscape()

    Returns the value of the `landscape` record component.

    Returns:
    :   the value of the `landscape` record component
  + ### plant

    public zombie.iso.worldgen.biomes.BiomeType.Plant plant()

    Returns the value of the `plant` record component.

    Returns:
    :   the value of the `plant` record component
  + ### bush

    public zombie.iso.worldgen.biomes.BiomeType.Bush bush()

    Returns the value of the `bush` record component.

    Returns:
    :   the value of the `bush` record component
  + ### temperature

    public zombie.iso.worldgen.biomes.BiomeType.Temperature temperature()

    Returns the value of the `temperature` record component.

    Returns:
    :   the value of the `temperature` record component
  + ### hygrometry

    public zombie.iso.worldgen.biomes.BiomeType.Hygrometry hygrometry()

    Returns the value of the `hygrometry` record component.

    Returns:
    :   the value of the `hygrometry` record component
  + ### oreLevel

    public zombie.iso.worldgen.biomes.BiomeType.OreLevel oreLevel()

    Returns the value of the `oreLevel` record component.

    Returns:
    :   the value of the `oreLevel` record component