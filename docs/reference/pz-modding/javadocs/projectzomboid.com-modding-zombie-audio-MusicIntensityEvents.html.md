[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [MusicIntensityEvents](MusicIntensityEvents.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [events](#events)
   2. [updateTimeMs](#updateTimeMs)
   3. [intensity](#intensity)
6. [Constructor Details](#constructor-detail)
   1. [MusicIntensityEvents()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addEvent(String, float, long, boolean)](#addEvent(java.lang.String,float,long,boolean))
   2. [clear()](#clear())
   3. [getEventCount()](#getEventCount())
   4. [getEventByIndex(int)](#getEventByIndex(int))
   5. [findEventById(String)](#findEventById(java.lang.String))
   6. [calculateIntensity()](#calculateIntensity())
   7. [update()](#update())
   8. [getIntensity()](#getIntensity())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MusicIntensityEvents
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.MusicIntensityEvents

---

public final class MusicIntensityEvents
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<MusicIntensityEvent>`

  `events`

  `private float`

  `intensity`

  `private long`

  `updateTimeMs`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MusicIntensityEvents()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `MusicIntensityEvent`

  `addEvent(String id,
  float intensity,
  long durationMS,
  boolean bMultiple)`

  `private float`

  `calculateIntensity()`

  `void`

  `clear()`

  `MusicIntensityEvent`

  `findEventById(String id)`

  `MusicIntensityEvent`

  `getEventByIndex(int index)`

  `int`

  `getEventCount()`

  `float`

  `getIntensity()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### events

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MusicIntensityEvent](MusicIntensityEvent.html "class in zombie.audio")> events
  + ### updateTimeMs

    private long updateTimeMs
  + ### intensity

    private float intensity
* Constructor Details
  -------------------

  + ### MusicIntensityEvents

    public MusicIntensityEvents()
* Method Details
  --------------

  + ### addEvent

    public [MusicIntensityEvent](MusicIntensityEvent.html "class in zombie.audio") addEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    float intensity,
    long durationMS,
    boolean bMultiple)
  + ### clear

    public void clear()
  + ### getEventCount

    public int getEventCount()
  + ### getEventByIndex

    public [MusicIntensityEvent](MusicIntensityEvent.html "class in zombie.audio") getEventByIndex(int index)
  + ### findEventById

    public [MusicIntensityEvent](MusicIntensityEvent.html "class in zombie.audio") findEventById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### calculateIntensity

    private float calculateIntensity()
  + ### update

    public void update()
  + ### getIntensity

    public float getIntensity()