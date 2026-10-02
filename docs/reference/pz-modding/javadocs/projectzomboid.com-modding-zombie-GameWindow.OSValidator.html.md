[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [GameWindow](GameWindow.html)
3. [OSValidator](GameWindow.OSValidator.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [OS](#OS)
6. [Constructor Details](#constructor-detail)
   1. [OSValidator()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isWindows()](#isWindows())
   2. [isMac()](#isMac())
   3. [isUnix()](#isUnix())
   4. [isSolaris()](#isSolaris())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class GameWindow.OSValidator
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.GameWindow.OSValidator

Enclosing class:
:   `GameWindow`

---

public static class GameWindow.OSValidator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final String`

  `OS`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `OSValidator()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static boolean`

  `isMac()`

  `static boolean`

  `isSolaris()`

  `static boolean`

  `isUnix()`

  `static boolean`

  `isWindows()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### OS

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") OS
* Constructor Details
  -------------------

  + ### OSValidator

    public OSValidator()
* Method Details
  --------------

  + ### isWindows

    public static boolean isWindows()
  + ### isMac

    public static boolean isMac()
  + ### isUnix

    public static boolean isUnix()
  + ### isSolaris

    public static boolean isSolaris()