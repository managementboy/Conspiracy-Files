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
3. [Observation](ObservationFactory.Observation.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [traitId](#traitId)
   2. [name](#name)
   3. [description](#description)
   4. [mutuallyExclusive](#mutuallyExclusive)
6. [Constructor Details](#constructor-detail)
   1. [Observation(String, String, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String))
7. [Method Details](#method-detail)
   1. [getLabel()](#getLabel())
   2. [getLeftLabel()](#getLeftLabel())
   3. [getRightLabel()](#getRightLabel())
   4. [getDescription()](#getDescription())
   5. [setDescription(String)](#setDescription(java.lang.String))
   6. [getTraitID()](#getTraitID())
   7. [setTraitID(String)](#setTraitID(java.lang.String))
   8. [getName()](#getName())
   9. [setName(String)](#setName(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ObservationFactory.Observation
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.traits.ObservationFactory.Observation

All Implemented Interfaces:
:   `IListBoxItem`

Enclosing class:
:   `ObservationFactory`

---

public static class ObservationFactory.Observation
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [IListBoxItem](../../interfaces/IListBoxItem.html "interface in zombie.interfaces")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `description`

  `ArrayList<String>`

  `mutuallyExclusive`

  `private String`

  `name`

  `private String`

  `traitId`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Observation(String tr,
  String name,
  String desc)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getDescription()`

  `String`

  `getLabel()`

  `String`

  `getLeftLabel()`

  `String`

  `getName()`

  `String`

  `getRightLabel()`

  `String`

  `getTraitID()`

  `void`

  `setDescription(String description)`

  `void`

  `setName(String name)`

  `void`

  `setTraitID(String traitId)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### traitId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") traitId
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### description

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### mutuallyExclusive

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> mutuallyExclusive
* Constructor Details
  -------------------

  + ### Observation

    public Observation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc)
* Method Details
  --------------

  + ### getLabel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLabel()

    Specified by:
    :   `getLabel` in interface `IListBoxItem`
  + ### getLeftLabel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLeftLabel()

    Specified by:
    :   `getLeftLabel` in interface `IListBoxItem`
  + ### getRightLabel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRightLabel()

    Specified by:
    :   `getRightLabel` in interface `IListBoxItem`
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### setDescription

    public void setDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description)
  + ### getTraitID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTraitID()
  + ### setTraitID

    public void setTraitID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") traitId)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)