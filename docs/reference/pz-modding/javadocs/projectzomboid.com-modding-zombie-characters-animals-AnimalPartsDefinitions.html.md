[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [AnimalPartsDefinitions](AnimalPartsDefinitions.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [AnimalPartsDefinitions()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [getLeather(String)](#getLeather(java.lang.String))
   2. [getAllPartsDef(String)](#getAllPartsDef(java.lang.String))
   3. [getAllBonesDef(String)](#getAllBonesDef(java.lang.String))
   4. [getDef(KahluaTableImpl, String)](#getDef(se.krka.kahlua.j2se.KahluaTableImpl,java.lang.String))
   5. [getAnimalDef(String)](#getAnimalDef(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AnimalPartsDefinitions
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.AnimalPartsDefinitions

---

public class AnimalPartsDefinitions
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalPartsDefinitions()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<zombie.characters.animals.AnimalPart>`

  `getAllBonesDef(String animalType)`

  `static ArrayList<zombie.characters.animals.AnimalPart>`

  `getAllPartsDef(String animalType)`

  Return a list of AnimalPart with every possible parts
  this should only be meat/rennet etc.

  `static se.krka.kahlua.j2se.KahluaTableImpl`

  `getAnimalDef(String animalType)`

  `static ArrayList<zombie.characters.animals.AnimalPart>`

  `getDef(se.krka.kahlua.j2se.KahluaTableImpl def,
  String type)`

  `static String`

  `getLeather(String animalType)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### AnimalPartsDefinitions

    public AnimalPartsDefinitions()
* Method Details
  --------------

  + ### getLeather

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLeather([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType)
  + ### getAllPartsDef

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.animals.AnimalPart> getAllPartsDef([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType)

    Return a list of AnimalPart with every possible parts
    this should only be meat/rennet etc.
    Bones invalid input: '&' leather comes elsewhere
  + ### getAllBonesDef

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.animals.AnimalPart> getAllBonesDef([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType)
  + ### getDef

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.animals.AnimalPart> getDef(se.krka.kahlua.j2se.KahluaTableImpl def,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getAnimalDef

    public static se.krka.kahlua.j2se.KahluaTableImpl getAnimalDef([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType)