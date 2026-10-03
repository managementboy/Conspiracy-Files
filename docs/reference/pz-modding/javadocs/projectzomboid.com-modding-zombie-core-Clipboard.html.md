[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [Clipboard](Clipboard.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [mainThread](#mainThread)
   2. [previousKnownValue](#previousKnownValue)
   3. [delaySetMainThread](#delaySetMainThread)
6. [Constructor Details](#constructor-detail)
   1. [Clipboard()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initMainThread()](#initMainThread())
   2. [rememberCurrentValue()](#rememberCurrentValue())
   3. [getClipboard()](#getClipboard())
   4. [setClipboard(String)](#setClipboard(java.lang.String))
   5. [updateMainThread()](#updateMainThread())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Clipboard
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.Clipboard

---

public final class Clipboard
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static String`

  `delaySetMainThread`

  `private static Thread`

  `mainThread`

  `private static String`

  `previousKnownValue`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Clipboard()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static String`

  `getClipboard()`

  `static void`

  `initMainThread()`

  `static void`

  `rememberCurrentValue()`

  `static void`

  `setClipboard(String str)`

  `static void`

  `updateMainThread()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### mainThread

    private static [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") mainThread
  + ### previousKnownValue

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") previousKnownValue
  + ### delaySetMainThread

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") delaySetMainThread
* Constructor Details
  -------------------

  + ### Clipboard

    public Clipboard()
* Method Details
  --------------

  + ### initMainThread

    public static void initMainThread()
  + ### rememberCurrentValue

    public static void rememberCurrentValue()
  + ### getClipboard

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClipboard()
  + ### setClipboard

    public static void setClipboard([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### updateMainThread

    public static void updateMainThread()