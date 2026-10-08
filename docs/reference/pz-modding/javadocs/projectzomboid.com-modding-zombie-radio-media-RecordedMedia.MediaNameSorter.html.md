[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.media](package-summary.html)
2. [RecordedMedia](RecordedMedia.html)
3. [MediaNameSorter](RecordedMedia.MediaNameSorter.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [MediaNameSorter()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [compare(MediaData, MediaData)](#compare(zombie.radio.media.MediaData,zombie.radio.media.MediaData))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RecordedMedia.MediaNameSorter
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.media.RecordedMedia.MediaNameSorter

All Implemented Interfaces:
:   `Comparator<MediaData>`

Enclosing class:
:   `RecordedMedia`

---

public static class RecordedMedia.MediaNameSorter
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[MediaData](MediaData.html "class in zombie.radio.media")>

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MediaNameSorter()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(MediaData o1,
  MediaData o2)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Constructor Details
  -------------------

  + ### MediaNameSorter

    public MediaNameSorter()
* Method Details
  --------------

  + ### compare

    public int compare([MediaData](MediaData.html "class in zombie.radio.media") o1,
    [MediaData](MediaData.html "class in zombie.radio.media") o2)

    Specified by:
    :   `compare` in interface `Comparator<MediaData>`