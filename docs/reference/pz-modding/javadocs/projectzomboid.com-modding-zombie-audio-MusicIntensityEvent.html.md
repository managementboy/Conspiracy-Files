[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [MusicIntensityEvent](MusicIntensityEvent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [intensity](#intensity)
   3. [durationMs](#durationMs)
   4. [elapsedTimeMs](#elapsedTimeMs)
6. [Constructor Details](#constructor-detail)
   1. [MusicIntensityEvent(String, float, long)](#%3Cinit%3E(java.lang.String,float,long))
7. [Method Details](#method-detail)
   1. [getId()](#getId())
   2. [getIntensity()](#getIntensity())
   3. [getDuration()](#getDuration())
   4. [getElapsedTime()](#getElapsedTime())
   5. [setElapsedTime(long)](#setElapsedTime(long))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MusicIntensityEvent
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.MusicIntensityEvent

---

public final class MusicIntensityEvent
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final long`

  `durationMs`

  `private long`

  `elapsedTimeMs`

  `private final String`

  `id`

  `private final float`

  `intensity`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MusicIntensityEvent(String label,
  float intensity,
  long durationMs)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `long`

  `getDuration()`

  `long`

  `getElapsedTime()`

  `String`

  `getId()`

  `float`

  `getIntensity()`

  `void`

  `setElapsedTime(long milliseconds)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### intensity

    private final float intensity
  + ### durationMs

    private final long durationMs
  + ### elapsedTimeMs

    private long elapsedTimeMs
* Constructor Details
  -------------------

  + ### MusicIntensityEvent

    public MusicIntensityEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") label,
    float intensity,
    long durationMs)
* Method Details
  --------------

  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getIntensity

    public float getIntensity()
  + ### getDuration

    public long getDuration()
  + ### getElapsedTime

    public long getElapsedTime()
  + ### setElapsedTime

    public void setElapsedTime(long milliseconds)