[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [TextDrawObject](TextDrawObject.html)
3. [DrawLine](TextDrawObject.DrawLine.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [elements](#elements)
   2. [h](#h)
   3. [w](#w)
   4. [charW](#charW)
6. [Constructor Details](#constructor-detail)
   1. [DrawLine()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addElement(TextDrawObject.DrawElement)](#addElement(zombie.ui.TextDrawObject.DrawElement))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TextDrawObject.DrawLine
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.TextDrawObject.DrawLine

Enclosing class:
:   `TextDrawObject`

---

private static final class TextDrawObject.DrawLine
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `charW`

  `private final ArrayList<TextDrawObject.DrawElement>`

  `elements`

  `private int`

  `h`

  `private int`

  `w`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `DrawLine()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addElement(TextDrawObject.DrawElement elem)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### elements

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TextDrawObject.DrawElement](TextDrawObject.DrawElement.html "class in zombie.ui")> elements
  + ### h

    private int h
  + ### w

    private int w
  + ### charW

    private int charW
* Constructor Details
  -------------------

  + ### DrawLine

    private DrawLine()
* Method Details
  --------------

  + ### addElement

    private void addElement([TextDrawObject.DrawElement](TextDrawObject.DrawElement.html "class in zombie.ui") elem)