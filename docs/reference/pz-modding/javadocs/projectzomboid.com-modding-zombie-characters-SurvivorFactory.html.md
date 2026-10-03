[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [SurvivorFactory](SurvivorFactory.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [FemaleForenames](#FemaleForenames)
   2. [MaleForenames](#MaleForenames)
   3. [Surnames](#Surnames)
7. [Constructor Details](#constructor-detail)
   1. [SurvivorFactory()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [Reset()](#Reset())
   2. [CreateFamily(int)](#CreateFamily(int))
   3. [CreateSurvivor()](#CreateSurvivor())
   4. [CreateSurvivor(SurvivorFactory.SurvivorType, boolean)](#CreateSurvivor(zombie.characters.SurvivorFactory.SurvivorType,boolean))
   5. [setTorso(SurvivorDesc)](#setTorso(zombie.characters.SurvivorDesc))
   6. [CreateSurvivor(SurvivorFactory.SurvivorType)](#CreateSurvivor(zombie.characters.SurvivorFactory.SurvivorType))
   7. [CreateSurvivorGroup(int)](#CreateSurvivorGroup(int))
   8. [InstansiateInCell(SurvivorDesc, IsoCell, int, int, int)](#InstansiateInCell(zombie.characters.SurvivorDesc,zombie.iso.IsoCell,int,int,int))
   9. [randomName(SurvivorDesc)](#randomName(zombie.characters.SurvivorDesc))
   10. [addSurname(String)](#addSurname(java.lang.String))
   11. [addFemaleForename(String)](#addFemaleForename(java.lang.String))
   12. [addMaleForename(String)](#addMaleForename(java.lang.String))
   13. [getRandomSurname()](#getRandomSurname())
   14. [getRandomForename(boolean)](#getRandomForename(boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SurvivorFactory
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.SurvivorFactory

---

public final class SurvivorFactory
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `SurvivorFactory.SurvivorType`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final ArrayList<String>`

  `FemaleForenames`

  `static final ArrayList<String>`

  `MaleForenames`

  `static final ArrayList<String>`

  `Surnames`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SurvivorFactory()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addFemaleForename(String forename)`

  `static void`

  `addMaleForename(String forename)`

  `static void`

  `addSurname(String surName)`

  `static SurvivorDesc[]`

  `CreateFamily(int nCount)`

  `static SurvivorDesc`

  `CreateSurvivor()`

  `static SurvivorDesc`

  `CreateSurvivor(SurvivorFactory.SurvivorType survivorType)`

  `static SurvivorDesc`

  `CreateSurvivor(SurvivorFactory.SurvivorType survivorType,
  boolean bFemale)`

  `static SurvivorDesc[]`

  `CreateSurvivorGroup(int nCount)`

  `static String`

  `getRandomForename(boolean bFemale)`

  `static String`

  `getRandomSurname()`

  `static IsoSurvivor`

  `InstansiateInCell(SurvivorDesc desc,
  IsoCell cell,
  int x,
  int y,
  int z)`

  `static void`

  `randomName(SurvivorDesc desc)`

  `static void`

  `Reset()`

  `static void`

  `setTorso(SurvivorDesc survivor)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### FemaleForenames

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> FemaleForenames
  + ### MaleForenames

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> MaleForenames
  + ### Surnames

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> Surnames
* Constructor Details
  -------------------

  + ### SurvivorFactory

    public SurvivorFactory()
* Method Details
  --------------

  + ### Reset

    public static void Reset()
  + ### CreateFamily

    public static [SurvivorDesc](SurvivorDesc.html "class in zombie.characters")[] CreateFamily(int nCount)
  + ### CreateSurvivor

    public static [SurvivorDesc](SurvivorDesc.html "class in zombie.characters") CreateSurvivor()
  + ### CreateSurvivor

    public static [SurvivorDesc](SurvivorDesc.html "class in zombie.characters") CreateSurvivor([SurvivorFactory.SurvivorType](SurvivorFactory.SurvivorType.html "enum class in zombie.characters") survivorType,
    boolean bFemale)
  + ### setTorso

    public static void setTorso([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") survivor)
  + ### CreateSurvivor

    public static [SurvivorDesc](SurvivorDesc.html "class in zombie.characters") CreateSurvivor([SurvivorFactory.SurvivorType](SurvivorFactory.SurvivorType.html "enum class in zombie.characters") survivorType)
  + ### CreateSurvivorGroup

    public static [SurvivorDesc](SurvivorDesc.html "class in zombie.characters")[] CreateSurvivorGroup(int nCount)
  + ### InstansiateInCell

    public static [IsoSurvivor](IsoSurvivor.html "class in zombie.characters") InstansiateInCell([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc,
    [IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    int x,
    int y,
    int z)
  + ### randomName

    public static void randomName([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc)
  + ### addSurname

    public static void addSurname([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") surName)
  + ### addFemaleForename

    public static void addFemaleForename([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") forename)
  + ### addMaleForename

    public static void addMaleForename([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") forename)
  + ### getRandomSurname

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomSurname()
  + ### getRandomForename

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomForename(boolean bFemale)