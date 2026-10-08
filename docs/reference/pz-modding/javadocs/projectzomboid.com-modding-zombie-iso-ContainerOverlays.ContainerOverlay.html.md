[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [ContainerOverlays](ContainerOverlays.html)
3. [ContainerOverlay](ContainerOverlays.ContainerOverlay.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [entries](#entries)
6. [Constructor Details](#constructor-detail)
   1. [ContainerOverlay()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getEntries(String, ArrayList)](#getEntries(java.lang.String,java.util.ArrayList))
   2. [pickRandom(String, int, int, int)](#pickRandom(java.lang.String,int,int,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ContainerOverlays.ContainerOverlay
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.ContainerOverlays.ContainerOverlay

Enclosing class:
:   `ContainerOverlays`

---

private static final class ContainerOverlays.ContainerOverlay
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ArrayList<ContainerOverlays.ContainerOverlayEntry>`

  `entries`

  `String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ContainerOverlay()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `getEntries(String room,
  ArrayList<ContainerOverlays.ContainerOverlayEntry> out)`

  `ContainerOverlays.ContainerOverlayEntry`

  `pickRandom(String room,
  int x,
  int y,
  int z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### entries

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ContainerOverlays.ContainerOverlayEntry](ContainerOverlays.ContainerOverlayEntry.html "class in zombie.iso")> entries
* Constructor Details
  -------------------

  + ### ContainerOverlay

    private ContainerOverlay()
* Method Details
  --------------

  + ### getEntries

    public void getEntries([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") room,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ContainerOverlays.ContainerOverlayEntry](ContainerOverlays.ContainerOverlayEntry.html "class in zombie.iso")> out)
  + ### pickRandom

    public [ContainerOverlays.ContainerOverlayEntry](ContainerOverlays.ContainerOverlayEntry.html "class in zombie.iso") pickRandom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") room,
    int x,
    int y,
    int z)