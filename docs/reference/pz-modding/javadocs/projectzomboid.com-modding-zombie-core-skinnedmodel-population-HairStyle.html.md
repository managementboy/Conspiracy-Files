[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.population](package-summary.html)
2. [HairStyle](HairStyle.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [name](#name)
   2. [model](#model)
   3. [texture](#texture)
   4. [alternate](#alternate)
   5. [level](#level)
   6. [trimChoices](#trimChoices)
   7. [growReference](#growReference)
   8. [attachedHair](#attachedHair)
   9. [noChoose](#noChoose)
7. [Constructor Details](#constructor-detail)
   1. [HairStyle()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [isValid()](#isValid())
   2. [getAlternate(String)](#getAlternate(java.lang.String))
   3. [getLevel()](#getLevel())
   4. [getName()](#getName())
   5. [getTrimChoices()](#getTrimChoices())
   6. [isAttachedHair()](#isAttachedHair())
   7. [isGrowReference()](#isGrowReference())
   8. [isNoChoose()](#isNoChoose())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class HairStyle
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.population.HairStyle

---

public final class HairStyle
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `HairStyle.Alternate`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ArrayList<HairStyle.Alternate>`

  `alternate`

  `boolean`

  `attachedHair`

  `boolean`

  `growReference`

  `int`

  `level`

  `String`

  `model`

  `String`

  `name`

  `boolean`

  `noChoose`

  `String`

  `texture`

  `final ArrayList<String>`

  `trimChoices`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `HairStyle()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getAlternate(String category)`

  `int`

  `getLevel()`

  `String`

  `getName()`

  `ArrayList<String>`

  `getTrimChoices()`

  `boolean`

  `isAttachedHair()`

  `boolean`

  `isGrowReference()`

  `boolean`

  `isNoChoose()`

  `boolean`

  `isValid()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### model

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") model
  + ### texture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texture
  + ### alternate

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[HairStyle.Alternate](HairStyle.Alternate.html "class in zombie.core.skinnedmodel.population")> alternate
  + ### level

    public int level
  + ### trimChoices

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> trimChoices
  + ### growReference

    public boolean growReference
  + ### attachedHair

    public boolean attachedHair
  + ### noChoose

    public boolean noChoose
* Constructor Details
  -------------------

  + ### HairStyle

    public HairStyle()
* Method Details
  --------------

  + ### isValid

    public boolean isValid()
  + ### getAlternate

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAlternate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getLevel

    public int getLevel()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getTrimChoices

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTrimChoices()
  + ### isAttachedHair

    public boolean isAttachedHair()
  + ### isGrowReference

    public boolean isGrowReference()
  + ### isNoChoose

    public boolean isNoChoose()