[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.fonts](package-summary.html)
2. [AngelCodeFont](AngelCodeFont.html)
3. [CharDef](AngelCodeFont.CharDef.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [dlIndex](#dlIndex)
   2. [height](#height)
   3. [id](#id)
   4. [image](#image)
   5. [kerningSecond](#kerningSecond)
   6. [kerningAmount](#kerningAmount)
   7. [width](#width)
   8. [x](#x)
   9. [xadvance](#xadvance)
   10. [xoffset](#xoffset)
   11. [y](#y)
   12. [yoffset](#yoffset)
   13. [page](#page)
6. [Constructor Details](#constructor-detail)
   1. [CharDef()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [draw(float, float)](#draw(float,float))
   2. [getKerning(int)](#getKerning(int))
   3. [init()](#init())
   4. [destroy()](#destroy())
   5. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AngelCodeFont.CharDef
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.fonts.AngelCodeFont.CharDef

Enclosing class:
:   `AngelCodeFont`

---

public class AngelCodeFont.CharDef
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `short`

  `dlIndex`

  `short`

  `height`

  `int`

  `id`

  `Texture`

  `image`

  `short[]`

  `kerningAmount`

  `short[]`

  `kerningSecond`

  `short`

  `page`

  `short`

  `width`

  `short`

  `x`

  `short`

  `xadvance`

  `short`

  `xoffset`

  `short`

  `y`

  `short`

  `yoffset`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CharDef()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `destroy()`

  `void`

  `draw(float x,
  float y)`

  `int`

  `getKerning(int otherCodePoint)`

  `void`

  `init()`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### dlIndex

    public short dlIndex
  + ### height

    public short height
  + ### id

    public int id
  + ### image

    public [Texture](../textures/Texture.html "class in zombie.core.textures") image
  + ### kerningSecond

    public short[] kerningSecond
  + ### kerningAmount

    public short[] kerningAmount
  + ### width

    public short width
  + ### x

    public short x
  + ### xadvance

    public short xadvance
  + ### xoffset

    public short xoffset
  + ### y

    public short y
  + ### yoffset

    public short yoffset
  + ### page

    public short page
* Constructor Details
  -------------------

  + ### CharDef

    public CharDef()
* Method Details
  --------------

  + ### draw

    public void draw(float x,
    float y)
  + ### getKerning

    public int getKerning(int otherCodePoint)
  + ### init

    public void init()
  + ### destroy

    public void destroy()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`