[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [Family](Family.html)
3. [Builder](Family.Builder.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [all](#all)
   2. [one](#one)
   3. [exclude](#exclude)
6. [Constructor Details](#constructor-detail)
   1. [Builder()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [all(ComponentType...)](#all(zombie.entity.ComponentType...))
   3. [one(ComponentType...)](#one(zombie.entity.ComponentType...))
   4. [exclude(ComponentType...)](#exclude(zombie.entity.ComponentType...))
   5. [get()](#get())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Family.Builder
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.Family.Builder

Enclosing class:
:   `Family`

---

public static class Family.Builder
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private BitSet`

  `all`

  `private BitSet`

  `exclude`

  `private BitSet`

  `one`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Builder()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `final Family.Builder`

  `all(ComponentType... componentTypes)`

  `final Family.Builder`

  `exclude(ComponentType... componentTypes)`

  `Family`

  `get()`

  `final Family.Builder`

  `one(ComponentType... componentTypes)`

  `Family.Builder`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### all

    private [BitSet](util/BitSet.html "class in zombie.entity.util") all
  + ### one

    private [BitSet](util/BitSet.html "class in zombie.entity.util") one
  + ### exclude

    private [BitSet](util/BitSet.html "class in zombie.entity.util") exclude
* Constructor Details
  -------------------

  + ### Builder

    Builder()
* Method Details
  --------------

  + ### reset

    public [Family.Builder](Family.Builder.html "class in zombie.entity") reset()
  + ### all

    public final [Family.Builder](Family.Builder.html "class in zombie.entity") all([ComponentType](ComponentType.html "enum class in zombie.entity")... componentTypes)
  + ### one

    public final [Family.Builder](Family.Builder.html "class in zombie.entity") one([ComponentType](ComponentType.html "enum class in zombie.entity")... componentTypes)
  + ### exclude

    public final [Family.Builder](Family.Builder.html "class in zombie.entity") exclude([ComponentType](ComponentType.html "enum class in zombie.entity")... componentTypes)
  + ### get

    public [Family](Family.html "class in zombie.entity") get()