[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.traits](package-summary.html)
2. [ObservationFactory](ObservationFactory.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [observationMap](#observationMap)
7. [Constructor Details](#constructor-detail)
   1. [ObservationFactory()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [init()](#init())
   2. [setMutualExclusive(String, String)](#setMutualExclusive(java.lang.String,java.lang.String))
   3. [addObservation(String, String, String)](#addObservation(java.lang.String,java.lang.String,java.lang.String))
   4. [getObservation(String)](#getObservation(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ObservationFactory
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.traits.ObservationFactory

---

public final class ObservationFactory
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `ObservationFactory.Observation`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static HashMap<String, ObservationFactory.Observation>`

  `observationMap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ObservationFactory()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addObservation(String type,
  String name,
  String desc)`

  `static ObservationFactory.Observation`

  `getObservation(String name)`

  `static void`

  `init()`

  `static void`

  `setMutualExclusive(String a,
  String b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### observationMap

    public static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ObservationFactory.Observation](ObservationFactory.Observation.html "class in zombie.characters.traits")> observationMap
* Constructor Details
  -------------------

  + ### ObservationFactory

    public ObservationFactory()
* Method Details
  --------------

  + ### init

    public static void init()
  + ### setMutualExclusive

    public static void setMutualExclusive([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") a,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") b)
  + ### addObservation

    public static void addObservation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc)
  + ### getObservation

    public static [ObservationFactory.Observation](ObservationFactory.Observation.html "class in zombie.characters.traits") getObservation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)