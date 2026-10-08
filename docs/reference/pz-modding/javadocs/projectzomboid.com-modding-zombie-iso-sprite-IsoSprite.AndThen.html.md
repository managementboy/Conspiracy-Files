[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.sprite](package-summary.html)
2. [IsoSprite](IsoSprite.html)
3. [AndThen](IsoSprite.AndThen.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [a](#a)
   2. [b](#b)
6. [Constructor Details](#constructor-detail)
   1. [AndThen()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(Consumer, Consumer)](#set(java.util.function.Consumer,java.util.function.Consumer))
   2. [accept(TextureDraw)](#accept(zombie.core.textures.TextureDraw))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoSprite.AndThen
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.sprite.IsoSprite.AndThen

All Implemented Interfaces:
:   `Consumer<zombie.core.textures.TextureDraw>`

Enclosing class:
:   `IsoSprite`

---

private static final class IsoSprite.AndThen
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private Consumer<? super zombie.core.textures.TextureDraw>`

  `a`

  `private Consumer<? super zombie.core.textures.TextureDraw>`

  `b`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `AndThen()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `accept(zombie.core.textures.TextureDraw o)`

  `private IsoSprite.AndThen`

  `set(Consumer<zombie.core.textures.TextureDraw> a,
  Consumer<zombie.core.textures.TextureDraw> b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html#method-summary "class or interface in java.util.function")

  `andThen`

* Field Details
  -------------

  + ### a

    private [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<? super zombie.core.textures.TextureDraw> a
  + ### b

    private [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<? super zombie.core.textures.TextureDraw> b
* Constructor Details
  -------------------

  + ### AndThen

    private AndThen()
* Method Details
  --------------

  + ### set

    private [IsoSprite.AndThen](IsoSprite.AndThen.html "class in zombie.iso.sprite") set([Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> b)
  + ### accept

    public void accept(zombie.core.textures.TextureDraw o)

    Specified by:
    :   `accept` in interface `Consumer<zombie.core.textures.TextureDraw>`