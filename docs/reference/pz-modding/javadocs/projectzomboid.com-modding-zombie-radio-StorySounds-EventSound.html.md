[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.StorySounds](package-summary.html)
2. [EventSound](EventSound.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [color](#color)
   3. [dataPoints](#dataPoints)
   4. [storySounds](#storySounds)
6. [Constructor Details](#constructor-detail)
   1. [EventSound()](#%3Cinit%3E())
   2. [EventSound(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [setName(String)](#setName(java.lang.String))
   3. [getColor()](#getColor())
   4. [setColor(Color)](#setColor(zombie.core.Color))
   5. [getDataPoints()](#getDataPoints())
   6. [setDataPoints(ArrayList)](#setDataPoints(java.util.ArrayList))
   7. [getStorySounds()](#getStorySounds())
   8. [setStorySounds(ArrayList)](#setStorySounds(java.util.ArrayList))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class EventSound
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.StorySounds.EventSound

---

public final class EventSound
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected Color`

  `color`

  `protected ArrayList<DataPoint>`

  `dataPoints`

  `protected String`

  `name`

  `protected ArrayList<StorySound>`

  `storySounds`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `EventSound()`

  `EventSound(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Color`

  `getColor()`

  `ArrayList<DataPoint>`

  `getDataPoints()`

  `String`

  `getName()`

  `ArrayList<StorySound>`

  `getStorySounds()`

  `void`

  `setColor(Color color)`

  `void`

  `setDataPoints(ArrayList<DataPoint> dataPoints)`

  `void`

  `setName(String name)`

  `void`

  `setStorySounds(ArrayList<StorySound> storySounds)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### color

    protected [Color](../../core/Color.html "class in zombie.core") color
  + ### dataPoints

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DataPoint](DataPoint.html "class in zombie.radio.StorySounds")> dataPoints
  + ### storySounds

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[StorySound](StorySound.html "class in zombie.radio.StorySounds")> storySounds
* Constructor Details
  -------------------

  + ### EventSound

    public EventSound()
  + ### EventSound

    public EventSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getColor

    public [Color](../../core/Color.html "class in zombie.core") getColor()
  + ### setColor

    public void setColor([Color](../../core/Color.html "class in zombie.core") color)
  + ### getDataPoints

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DataPoint](DataPoint.html "class in zombie.radio.StorySounds")> getDataPoints()
  + ### setDataPoints

    public void setDataPoints([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DataPoint](DataPoint.html "class in zombie.radio.StorySounds")> dataPoints)
  + ### getStorySounds

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[StorySound](StorySound.html "class in zombie.radio.StorySounds")> getStorySounds()
  + ### setStorySounds

    public void setStorySounds([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[StorySound](StorySound.html "class in zombie.radio.StorySounds")> storySounds)