[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoHutch](IsoHutch.html)
3. [NestBox](IsoHutch.NestBox.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [animal](#animal)
   2. [eggs](#eggs)
   3. [maxEggs](#maxEggs)
   4. [index](#index)
6. [Constructor Details](#constructor-detail)
   1. [NestBox(int)](#%3Cinit%3E(int))
7. [Method Details](#method-detail)
   1. [getIndex()](#getIndex())
   2. [getEggsNb()](#getEggsNb())
   3. [addEgg(Food)](#addEgg(zombie.inventory.types.Food))
   4. [getEgg(int)](#getEgg(int))
   5. [removeEgg(int)](#removeEgg(int))
   6. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   7. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoHutch.NestBox
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.objects.IsoHutch.NestBox

Enclosing class:
:   `IsoHutch`

---

public class IsoHutch.NestBox
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `IsoAnimal`

  `animal`

  `(package private) ArrayList<Food>`

  `eggs`

  `(package private) final int`

  `index`

  `static final int`

  `maxEggs`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NestBox(int index)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addEgg(Food egg)`

  `Food`

  `getEgg(int index)`

  `int`

  `getEggsNb()`

  `int`

  `getIndex()`

  `(package private) void`

  `load(ByteBuffer input,
  int worldVersion)`

  `Food`

  `removeEgg(int index)`

  `(package private) void`

  `save(ByteBuffer output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### animal

    public [IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal
  + ### eggs

    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Food](../../inventory/types/Food.html "class in zombie.inventory.types")> eggs
  + ### maxEggs

    public static final int maxEggs

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoHutch.NestBox.maxEggs)
  + ### index

    final int index
* Constructor Details
  -------------------

  + ### NestBox

    public NestBox(int index)
* Method Details
  --------------

  + ### getIndex

    public int getIndex()
  + ### getEggsNb

    public int getEggsNb()
  + ### addEgg

    public void addEgg([Food](../../inventory/types/Food.html "class in zombie.inventory.types") egg)
  + ### getEgg

    public [Food](../../inventory/types/Food.html "class in zombie.inventory.types") getEgg(int index)
  + ### removeEgg

    public [Food](../../inventory/types/Food.html "class in zombie.inventory.types") removeEgg(int index)
  + ### save

    void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`