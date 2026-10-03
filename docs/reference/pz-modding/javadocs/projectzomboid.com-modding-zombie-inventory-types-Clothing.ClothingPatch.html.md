[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.inventory.types](package-summary.html)
2. [Clothing](Clothing.html)
3. [ClothingPatch](Clothing.ClothingPatch.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tailorLvl](#tailorLvl)
   2. [fabricType](#fabricType)
   3. [scratchDefense](#scratchDefense)
   4. [biteDefense](#biteDefense)
   5. [hasHole](#hasHole)
   6. [conditionGain](#conditionGain)
6. [Constructor Details](#constructor-detail)
   1. [ClothingPatch()](#%3Cinit%3E())
   2. [ClothingPatch(int, int, boolean)](#%3Cinit%3E(int,int,boolean))
7. [Method Details](#method-detail)
   1. [getFabricTypeName()](#getFabricTypeName())
   2. [getScratchDefense()](#getScratchDefense())
   3. [getBiteDefense()](#getBiteDefense())
   4. [getFabricType()](#getFabricType())
   5. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   6. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   7. [save\_old(ByteBuffer, boolean)](#save_old(java.nio.ByteBuffer,boolean))
   8. [load\_old(ByteBuffer, int, boolean)](#load_old(java.nio.ByteBuffer,int,boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Clothing.ClothingPatch
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.types.Clothing.ClothingPatch

Enclosing class:
:   `Clothing`

---

public static class Clothing.ClothingPatch
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `biteDefense`

  `int`

  `conditionGain`

  `int`

  `fabricType`

  `boolean`

  `hasHole`

  `int`

  `scratchDefense`

  `int`

  `tailorLvl`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClothingPatch()`

  `ClothingPatch(int tailorLvl,
  int fabricType,
  boolean hasHole)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `int`

  `getBiteDefense()`

  `int`

  `getFabricType()`

  `String`

  `getFabricTypeName()`

  `int`

  `getScratchDefense()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `load_old(ByteBuffer input,
  int worldVersion,
  boolean net)`

  Deprecated.

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `void`

  `save_old(ByteBuffer output,
  boolean net)`

  Deprecated.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tailorLvl

    public int tailorLvl
  + ### fabricType

    public int fabricType
  + ### scratchDefense

    public int scratchDefense
  + ### biteDefense

    public int biteDefense
  + ### hasHole

    public boolean hasHole
  + ### conditionGain

    public int conditionGain
* Constructor Details
  -------------------

  + ### ClothingPatch

    public ClothingPatch()
  + ### ClothingPatch

    public ClothingPatch(int tailorLvl,
    int fabricType,
    boolean hasHole)
* Method Details
  --------------

  + ### getFabricTypeName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFabricTypeName()
  + ### getScratchDefense

    public int getScratchDefense()
  + ### getBiteDefense

    public int getBiteDefense()
  + ### getFabricType

    public int getFabricType()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save\_old

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void save\_old([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Deprecated.

    Throws:
    :   `IOException`
  + ### load\_old

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void load\_old([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Deprecated.

    Throws:
    :   `IOException`