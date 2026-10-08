[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.radio](package-summary.html)
2. [RadioAPI](RadioAPI.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
6. [Constructor Details](#constructor-detail)
   1. [RadioAPI()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [timeToTimeStamp(int, int, int)](#timeToTimeStamp(int,int,int))
   2. [timeStampToDays(int)](#timeStampToDays(int))
   3. [timeStampToHours(int)](#timeStampToHours(int))
   4. [timeStampToMinutes(int)](#timeStampToMinutes(int))
   5. [hasInstance()](#hasInstance())
   6. [getInstance()](#getInstance())
   7. [getChannels(String)](#getChannels(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RadioAPI
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.RadioAPI

---

public final class RadioAPI
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static RadioAPI`

  `instance`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `RadioAPI()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `se.krka.kahlua.vm.KahluaTable`

  `getChannels(String category)`

  `static RadioAPI`

  `getInstance()`

  `static boolean`

  `hasInstance()`

  `static int`

  `timeStampToDays(int stamp)`

  `static int`

  `timeStampToHours(int stamp)`

  `static int`

  `timeStampToMinutes(int stamp)`

  `static int`

  `timeToTimeStamp(int days,
  int hours,
  int minutes)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [RadioAPI](RadioAPI.html "class in zombie.radio") instance
* Constructor Details
  -------------------

  + ### RadioAPI

    private RadioAPI()
* Method Details
  --------------

  + ### timeToTimeStamp

    public static int timeToTimeStamp(int days,
    int hours,
    int minutes)
  + ### timeStampToDays

    public static int timeStampToDays(int stamp)
  + ### timeStampToHours

    public static int timeStampToHours(int stamp)
  + ### timeStampToMinutes

    public static int timeStampToMinutes(int stamp)
  + ### hasInstance

    public static boolean hasInstance()
  + ### getInstance

    public static [RadioAPI](RadioAPI.html "class in zombie.radio") getInstance()
  + ### getChannels

    public se.krka.kahlua.vm.KahluaTable getChannels([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)