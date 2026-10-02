[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [Recipe](Recipe.html)
3. [Source](Recipe.Source.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [keep](#keep)
   2. [items](#items)
   3. [originalItems](#originalItems)
   4. [destroy](#destroy)
   5. [count](#count)
   6. [use](#use)
6. [Constructor Details](#constructor-detail)
   1. [Source()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isDestroy()](#isDestroy())
   2. [setDestroy(boolean)](#setDestroy(boolean))
   3. [isKeep()](#isKeep())
   4. [setKeep(boolean)](#setKeep(boolean))
   5. [getCount()](#getCount())
   6. [setCount(float)](#setCount(float))
   7. [getUse()](#getUse())
   8. [setUse(float)](#setUse(float))
   9. [getItems()](#getItems())
   10. [getOriginalItems()](#getOriginalItems())
   11. [getOnlyItem()](#getOnlyItem())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Recipe.Source
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.Recipe.Source

Enclosing class:
:   `Recipe`

---

public static final class Recipe.Source
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `count`

  `boolean`

  `destroy`

  `private final ArrayList<String>`

  `items`

  `boolean`

  `keep`

  `private final ArrayList<String>`

  `originalItems`

  `float`

  `use`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Source()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getCount()`

  `ArrayList<String>`

  `getItems()`

  `String`

  `getOnlyItem()`

  `ArrayList<String>`

  `getOriginalItems()`

  `float`

  `getUse()`

  `boolean`

  `isDestroy()`

  `boolean`

  `isKeep()`

  `void`

  `setCount(float count)`

  `void`

  `setDestroy(boolean destroy)`

  `void`

  `setKeep(boolean keep)`

  `void`

  `setUse(float use)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### keep

    public boolean keep
  + ### items

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> items
  + ### originalItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> originalItems
  + ### destroy

    public boolean destroy
  + ### count

    public float count
  + ### use

    public float use
* Constructor Details
  -------------------

  + ### Source

    public Source()
* Method Details
  --------------

  + ### isDestroy

    public boolean isDestroy()
  + ### setDestroy

    public void setDestroy(boolean destroy)
  + ### isKeep

    public boolean isKeep()
  + ### setKeep

    public void setKeep(boolean keep)
  + ### getCount

    public float getCount()
  + ### setCount

    public void setCount(float count)
  + ### getUse

    public float getUse()
  + ### setUse

    public void setUse(float use)
  + ### getItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getItems()
  + ### getOriginalItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getOriginalItems()
  + ### getOnlyItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnlyItem()