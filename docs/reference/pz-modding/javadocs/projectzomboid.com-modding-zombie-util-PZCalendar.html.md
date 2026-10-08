[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.util](package-summary.html)
2. [PZCalendar](PZCalendar.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [calendar](#calendar)
6. [Constructor Details](#constructor-detail)
   1. [PZCalendar(Calendar)](#%3Cinit%3E(java.util.Calendar))
7. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [set(int, int, int, int, int)](#set(int,int,int,int,int))
   3. [setTimeInMillis(long)](#setTimeInMillis(long))
   4. [get(int)](#get(int))
   5. [getTime()](#getTime())
   6. [getTimeInMillis()](#getTimeInMillis())
   7. [isLeapYear(int)](#isLeapYear(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PZCalendar
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.util.PZCalendar

---

public final class PZCalendar
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Calendar`

  `calendar`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PZCalendar(Calendar calendar)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `get(int field)`

  `static PZCalendar`

  `getInstance()`

  `final Date`

  `getTime()`

  `long`

  `getTimeInMillis()`

  `boolean`

  `isLeapYear(int year)`

  `void`

  `set(int year,
  int month,
  int dayOfMonth,
  int hourOfDay,
  int minute)`

  `void`

  `setTimeInMillis(long millis)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### calendar

    private final [Calendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Calendar.html "class or interface in java.util") calendar
* Constructor Details
  -------------------

  + ### PZCalendar

    public PZCalendar([Calendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Calendar.html "class or interface in java.util") calendar)
* Method Details
  --------------

  + ### getInstance

    public static [PZCalendar](PZCalendar.html "class in zombie.util") getInstance()
  + ### set

    public void set(int year,
    int month,
    int dayOfMonth,
    int hourOfDay,
    int minute)
  + ### setTimeInMillis

    public void setTimeInMillis(long millis)
  + ### get

    public int get(int field)
  + ### getTime

    public final [Date](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Date.html "class or interface in java.util") getTime()
  + ### getTimeInMillis

    public long getTimeInMillis()
  + ### isLeapYear

    public boolean isLeapYear(int year)