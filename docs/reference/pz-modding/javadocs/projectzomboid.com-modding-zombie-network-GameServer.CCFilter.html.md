[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [GameServer](GameServer.html)
3. [CCFilter](GameServer.CCFilter.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [command](#command)
   2. [allow](#allow)
   3. [next](#next)
6. [Constructor Details](#constructor-detail)
   1. [CCFilter()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [matches(String)](#matches(java.lang.String))
   2. [passes(String)](#passes(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameServer.CCFilter
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.GameServer.CCFilter

Enclosing class:
:   `GameServer`

---

private static final class GameServer.CCFilter
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) boolean`

  `allow`

  `(package private) String`

  `command`

  `(package private) GameServer.CCFilter`

  `next`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CCFilter()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) boolean`

  `matches(String command)`

  `(package private) boolean`

  `passes(String command)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### command

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command
  + ### allow

    boolean allow
  + ### next

    [GameServer.CCFilter](GameServer.CCFilter.html "class in zombie.network") next
* Constructor Details
  -------------------

  + ### CCFilter

    private CCFilter()
* Method Details
  --------------

  + ### matches

    boolean matches([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command)
  + ### passes

    boolean passes([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command)