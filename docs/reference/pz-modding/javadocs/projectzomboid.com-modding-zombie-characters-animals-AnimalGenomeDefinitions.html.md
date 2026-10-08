[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [AnimalGenomeDefinitions](AnimalGenomeDefinitions.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [currentValue](#currentValue)
   3. [ratios](#ratios)
   4. [minValue](#minValue)
   5. [maxValue](#maxValue)
   6. [fullGenomeDef](#fullGenomeDef)
   7. [geneticDisorder](#geneticDisorder)
   8. [forcedValues](#forcedValues)
6. [Constructor Details](#constructor-detail)
   1. [AnimalGenomeDefinitions()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [loadGenomeDefinition()](#loadGenomeDefinition())
   2. [loadRatio(KahluaTableImpl)](#loadRatio(se.krka.kahlua.j2se.KahluaTableImpl))
   3. [getGeneticDisorderList()](#getGeneticDisorderList())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AnimalGenomeDefinitions
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.AnimalGenomeDefinitions

---

public class AnimalGenomeDefinitions
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

This contains all the genes defined in AnimalGenomeDefinitions, used when we init an animal genome to have values
This won't be manipulated as gene, see AnimalGene.java which is one gene of an animal

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `currentValue`

  `boolean`

  `forcedValues`

  `static HashMap<String, AnimalGenomeDefinitions>`

  `fullGenomeDef`

  `static ArrayList<String>`

  `geneticDisorder`

  `float`

  `maxValue`

  `float`

  `minValue`

  `String`

  `name`

  `HashMap<String,Float>`

  `ratios`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalGenomeDefinitions()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<String>`

  `getGeneticDisorderList()`

  `static void`

  `loadGenomeDefinition()`

  `private void`

  `loadRatio(se.krka.kahlua.j2se.KahluaTableImpl def)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### currentValue

    public float currentValue
  + ### ratios

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> ratios
  + ### minValue

    public float minValue
  + ### maxValue

    public float maxValue
  + ### fullGenomeDef

    public static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalGenomeDefinitions](AnimalGenomeDefinitions.html "class in zombie.characters.animals")> fullGenomeDef
  + ### geneticDisorder

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> geneticDisorder
  + ### forcedValues

    public boolean forcedValues
* Constructor Details
  -------------------

  + ### AnimalGenomeDefinitions

    public AnimalGenomeDefinitions()
* Method Details
  --------------

  + ### loadGenomeDefinition

    public static void loadGenomeDefinition()
  + ### loadRatio

    private void loadRatio(se.krka.kahlua.j2se.KahluaTableImpl def)
  + ### getGeneticDisorderList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getGeneticDisorderList()