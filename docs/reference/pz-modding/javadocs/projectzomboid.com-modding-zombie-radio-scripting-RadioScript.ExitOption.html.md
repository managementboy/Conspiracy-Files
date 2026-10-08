[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.scripting](package-summary.html)
2. [RadioScript](RadioScript.html)
3. [ExitOption](RadioScript.ExitOption.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [scriptname](#scriptname)
   2. [chance](#chance)
   3. [startDelay](#startDelay)
6. [Constructor Details](#constructor-detail)
   1. [ExitOption(String, int, int)](#%3Cinit%3E(java.lang.String,int,int))
7. [Method Details](#method-detail)
   1. [getScriptname()](#getScriptname())
   2. [getChance()](#getChance())
   3. [getStartDelay()](#getStartDelay())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RadioScript.ExitOption
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.scripting.RadioScript.ExitOption

Enclosing class:
:   `RadioScript`

---

public static final class RadioScript.ExitOption
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `chance`

  `private final String`

  `scriptname`

  `private final int`

  `startDelay`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ExitOption(String name,
  int rollchance,
  int startdelay)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getChance()`

  `String`

  `getScriptname()`

  `int`

  `getStartDelay()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### scriptname

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptname
  + ### chance

    private final int chance
  + ### startDelay

    private final int startDelay
* Constructor Details
  -------------------

  + ### ExitOption

    public ExitOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int rollchance,
    int startdelay)
* Method Details
  --------------

  + ### getScriptname

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getScriptname()
  + ### getChance

    public int getChance()
  + ### getStartDelay

    public int getStartDelay()