[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.StorySounds](package-summary.html)
2. [StorySoundEvent](StorySoundEvent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [eventSounds](#eventSounds)
6. [Constructor Details](#constructor-detail)
   1. [StorySoundEvent()](#%3Cinit%3E())
   2. [StorySoundEvent(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [setName(String)](#setName(java.lang.String))
   3. [getEventSounds()](#getEventSounds())
   4. [setEventSounds(ArrayList)](#setEventSounds(java.util.ArrayList))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class StorySoundEvent
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.StorySounds.StorySoundEvent

---

public final class StorySoundEvent
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected ArrayList<EventSound>`

  `eventSounds`

  `protected String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `StorySoundEvent()`

  `StorySoundEvent(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ArrayList<EventSound>`

  `getEventSounds()`

  `String`

  `getName()`

  `void`

  `setEventSounds(ArrayList<EventSound> eventSounds)`

  `void`

  `setName(String name)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### eventSounds

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EventSound](EventSound.html "class in zombie.radio.StorySounds")> eventSounds
* Constructor Details
  -------------------

  + ### StorySoundEvent

    public StorySoundEvent()
  + ### StorySoundEvent

    public StorySoundEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getEventSounds

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EventSound](EventSound.html "class in zombie.radio.StorySounds")> getEventSounds()
  + ### setEventSounds

    public void setEventSounds([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EventSound](EventSound.html "class in zombie.radio.StorySounds")> eventSounds)