[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [AnimalGene](AnimalGene.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [id](#id)
   3. [allele1](#allele1)
   4. [allele2](#allele2)
6. [Constructor Details](#constructor-detail)
   1. [AnimalGene()](#%3Cinit%3E())
   2. [AnimalGene(AnimalGene)](#%3Cinit%3E(zombie.characters.animals.AnimalGene))
7. [Method Details](#method-detail)
   1. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   2. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   3. [initGenome(IsoAnimal)](#initGenome(zombie.characters.animals.IsoAnimal))
   4. [initUsedGene()](#initUsedGene())
   5. [initAllele(String, boolean, float, boolean)](#initAllele(java.lang.String,boolean,float,boolean))
   6. [doRatio(AnimalGenomeDefinitions, HashMap, AnimalAllele)](#doRatio(zombie.characters.animals.AnimalGenomeDefinitions,java.util.HashMap,zombie.characters.animals.AnimalAllele))
   7. [initGenesFromParents(HashMap, HashMap)](#initGenesFromParents(java.util.HashMap,java.util.HashMap))
   8. [checkGeneticDisorder(IsoAnimal)](#checkGeneticDisorder(zombie.characters.animals.IsoAnimal))
   9. [doMutation(AnimalAllele)](#doMutation(zombie.characters.animals.AnimalAllele))
   10. [getName()](#getName())
   11. [getAllele1()](#getAllele1())
   12. [getAllele2()](#getAllele2())
   13. [getUsedGene()](#getUsedGene())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AnimalGene
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.AnimalGene

---

public class AnimalGene
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

This is one gene of an animal, this is what gonna get manipulated

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `AnimalAllele`

  `allele1`

  `AnimalAllele`

  `allele2`

  `int`

  `id`

  `String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalGene()`

  `AnimalGene(AnimalGene gene)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `checkGeneticDisorder(IsoAnimal animal)`

  `static void`

  `doMutation(AnimalAllele allele)`

  Add random mutations for a gene (we do it 2 times, 1 per allele of a gene)
  Multiple mutations can happen.

  `static void`

  `doRatio(AnimalGenomeDefinitions def,
  HashMap<String, AnimalGene> fullGenome,
  AnimalAllele allele)`

  This is to do some correlation between gene, like maxMilk having a bad influence on the meatRatio, the more maxMilk, the less meatRatio, but the less maxMilk, the more meatRatio!
  The base gene used for the calc will be the one active, but both the genes of the affected gene will be used

  `AnimalAllele`

  `getAllele1()`

  `AnimalAllele`

  `getAllele2()`

  `String`

  `getName()`

  `AnimalAllele`

  `getUsedGene()`

  `private static AnimalAllele`

  `initAllele(String name,
  boolean forcedDominant,
  float value,
  boolean forcedValues)`

  `static HashMap<String, AnimalGene>`

  `initGenesFromParents(HashMap<String, AnimalGene> femaleGenome,
  HashMap<String, AnimalGene> maleGenome)`

  We check every genes of each parents, and take one of the value of it, we could have an increase or decrease in this value too.

  `static void`

  `initGenome(IsoAnimal animal)`

  Init the full genome of an animal from its def

  `void`

  `initUsedGene()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### id

    public int id
  + ### allele1

    public [AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") allele1
  + ### allele2

    public [AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") allele2
* Constructor Details
  -------------------

  + ### AnimalGene

    public AnimalGene()
  + ### AnimalGene

    public AnimalGene([AnimalGene](AnimalGene.html "class in zombie.characters.animals") gene)
* Method Details
  --------------

  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### initGenome

    public static void initGenome([IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") animal)

    Init the full genome of an animal from its def
  + ### initUsedGene

    public void initUsedGene()
  + ### initAllele

    private static [AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") initAllele([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean forcedDominant,
    float value,
    boolean forcedValues)
  + ### doRatio

    public static void doRatio([AnimalGenomeDefinitions](AnimalGenomeDefinitions.html "class in zombie.characters.animals") def,
    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGene](AnimalGene.html "class in zombie.characters.animals")> fullGenome,
    [AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") allele)

    This is to do some correlation between gene, like maxMilk having a bad influence on the meatRatio, the more maxMilk, the less meatRatio, but the less maxMilk, the more meatRatio!
    The base gene used for the calc will be the one active, but both the genes of the affected gene will be used
  + ### initGenesFromParents

    public static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGene](AnimalGene.html "class in zombie.characters.animals")> initGenesFromParents([HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGene](AnimalGene.html "class in zombie.characters.animals")> femaleGenome,
    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGene](AnimalGene.html "class in zombie.characters.animals")> maleGenome)

    We check every genes of each parents, and take one of the value of it, we could have an increase or decrease in this value too.
    MaleGenome could be nil if it comes from debug stuff
  + ### checkGeneticDisorder

    public static void checkGeneticDisorder([IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### doMutation

    public static void doMutation([AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") allele)

    Add random mutations for a gene (we do it 2 times, 1 per allele of a gene)
    Multiple mutations can happen.
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getAllele1

    public [AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") getAllele1()
  + ### getAllele2

    public [AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") getAllele2()
  + ### getUsedGene

    public [AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") getUsedGene()