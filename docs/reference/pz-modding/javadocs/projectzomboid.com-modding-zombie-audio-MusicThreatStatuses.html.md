[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [MusicThreatStatuses](MusicThreatStatuses.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [player](#player)
   2. [statuses](#statuses)
   3. [intensity](#intensity)
6. [Constructor Details](#constructor-detail)
   1. [MusicThreatStatuses(IsoPlayer)](#%3Cinit%3E(zombie.characters.IsoPlayer))
7. [Method Details](#method-detail)
   1. [setStatus(String, float)](#setStatus(java.lang.String,float))
   2. [clear()](#clear())
   3. [getStatusCount()](#getStatusCount())
   4. [getStatusByIndex(int)](#getStatusByIndex(int))
   5. [findStatusById(String)](#findStatusById(java.lang.String))
   6. [calculateIntensity()](#calculateIntensity())
   7. [update()](#update())
   8. [getIntensity()](#getIntensity())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MusicThreatStatuses
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.MusicThreatStatuses

---

public final class MusicThreatStatuses
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `intensity`

  `private final IsoPlayer`

  `player`

  `private final ArrayList<MusicThreatStatus>`

  `statuses`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MusicThreatStatuses(IsoPlayer player)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private float`

  `calculateIntensity()`

  `void`

  `clear()`

  `MusicThreatStatus`

  `findStatusById(String id)`

  `float`

  `getIntensity()`

  `MusicThreatStatus`

  `getStatusByIndex(int index)`

  `int`

  `getStatusCount()`

  `MusicThreatStatus`

  `setStatus(String id,
  float intensity)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### player

    private final [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player
  + ### statuses

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MusicThreatStatus](MusicThreatStatus.html "class in zombie.audio")> statuses
  + ### intensity

    private float intensity
* Constructor Details
  -------------------

  + ### MusicThreatStatuses

    public MusicThreatStatuses([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
* Method Details
  --------------

  + ### setStatus

    public [MusicThreatStatus](MusicThreatStatus.html "class in zombie.audio") setStatus([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    float intensity)
  + ### clear

    public void clear()
  + ### getStatusCount

    public int getStatusCount()
  + ### getStatusByIndex

    public [MusicThreatStatus](MusicThreatStatus.html "class in zombie.audio") getStatusByIndex(int index)
  + ### findStatusById

    public [MusicThreatStatus](MusicThreatStatus.html "class in zombie.audio") findStatusById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### calculateIntensity

    private float calculateIntensity()
  + ### update

    public void update()
  + ### getIntensity

    public float getIntensity()