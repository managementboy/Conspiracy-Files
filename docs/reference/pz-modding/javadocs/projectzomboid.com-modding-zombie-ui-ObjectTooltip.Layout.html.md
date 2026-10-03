[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [ObjectTooltip](ObjectTooltip.html)
3. [Layout](ObjectTooltip.Layout.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [items](#items)
   2. [minLabelWidth](#minLabelWidth)
   3. [minValueWidth](#minValueWidth)
   4. [next](#next)
   5. [nextPadY](#nextPadY)
   6. [offsetY](#offsetY)
   7. [freeItems](#freeItems)
6. [Constructor Details](#constructor-detail)
   1. [Layout()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addItem()](#addItem())
   2. [setMinLabelWidth(int)](#setMinLabelWidth(int))
   3. [setMinValueWidth(int)](#setMinValueWidth(int))
   4. [render(int, int, ObjectTooltip)](#render(int,int,zombie.ui.ObjectTooltip))
   5. [free()](#free())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ObjectTooltip.Layout
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.ObjectTooltip.Layout

Enclosing class:
:   `ObjectTooltip`

---

public static class ObjectTooltip.Layout
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Stack<ObjectTooltip.LayoutItem>`

  `freeItems`

  `ArrayList<ObjectTooltip.LayoutItem>`

  `items`

  `int`

  `minLabelWidth`

  `int`

  `minValueWidth`

  `ObjectTooltip.Layout`

  `next`

  `int`

  `nextPadY`

  `int`

  `offsetY`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Layout()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ObjectTooltip.LayoutItem`

  `addItem()`

  `void`

  `free()`

  `int`

  `render(int left,
  int top,
  ObjectTooltip ui)`

  `void`

  `setMinLabelWidth(int minWidth)`

  `void`

  `setMinValueWidth(int minWidth)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### items

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ObjectTooltip.LayoutItem](ObjectTooltip.LayoutItem.html "class in zombie.ui")> items
  + ### minLabelWidth

    public int minLabelWidth
  + ### minValueWidth

    public int minValueWidth
  + ### next

    public [ObjectTooltip.Layout](ObjectTooltip.Layout.html "class in zombie.ui") next
  + ### nextPadY

    public int nextPadY
  + ### offsetY

    public int offsetY
  + ### freeItems

    private static final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[ObjectTooltip.LayoutItem](ObjectTooltip.LayoutItem.html "class in zombie.ui")> freeItems
* Constructor Details
  -------------------

  + ### Layout

    public Layout()
* Method Details
  --------------

  + ### addItem

    public [ObjectTooltip.LayoutItem](ObjectTooltip.LayoutItem.html "class in zombie.ui") addItem()
  + ### setMinLabelWidth

    public void setMinLabelWidth(int minWidth)
  + ### setMinValueWidth

    public void setMinValueWidth(int minWidth)
  + ### render

    public int render(int left,
    int top,
    [ObjectTooltip](ObjectTooltip.html "class in zombie.ui") ui)
  + ### free

    public void free()