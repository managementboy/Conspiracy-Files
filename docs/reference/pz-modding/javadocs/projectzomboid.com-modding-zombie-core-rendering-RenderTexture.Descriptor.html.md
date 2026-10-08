[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.rendering](package-summary.html)
2. [RenderTexture](RenderTexture.html)
3. [Descriptor](RenderTexture.Descriptor.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [width](#width)
   3. [height](#height)
   4. [length](#length)
   5. [colourFormat](#colourFormat)
   6. [depthFormat](#depthFormat)
   7. [depthAsTexture](#depthAsTexture)
   8. [wrappingMode](#wrappingMode)
6. [Constructor Details](#constructor-detail)
   1. [Descriptor(String)](#%3Cinit%3E(java.lang.String))
   2. [Descriptor(RenderTexture.Descriptor)](#%3Cinit%3E(zombie.core.rendering.RenderTexture.Descriptor))
7. [Method Details](#method-detail)
   1. [Copy(RenderTexture)](#Copy(zombie.core.rendering.RenderTexture))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RenderTexture.Descriptor
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.rendering.RenderTexture.Descriptor

Enclosing class:
:   `RenderTexture`

---

public static class RenderTexture.Descriptor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `colourFormat`

  `boolean`

  `depthAsTexture`

  `int`

  `depthFormat`

  `int`

  `height`

  `int`

  `length`

  `final String`

  `name`

  `int`

  `width`

  `int`

  `wrappingMode`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Descriptor(String name)`

  `Descriptor(RenderTexture.Descriptor desc)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `Copy(RenderTexture rt)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### width

    public int width
  + ### height

    public int height
  + ### length

    public int length
  + ### colourFormat

    public int colourFormat
  + ### depthFormat

    public int depthFormat
  + ### depthAsTexture

    public boolean depthAsTexture
  + ### wrappingMode

    public int wrappingMode
* Constructor Details
  -------------------

  + ### Descriptor

    public Descriptor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### Descriptor

    public Descriptor([RenderTexture.Descriptor](RenderTexture.Descriptor.html "class in zombie.core.rendering") desc)
* Method Details
  --------------

  + ### Copy

    private void Copy([RenderTexture](RenderTexture.html "class in zombie.core.rendering") rt)