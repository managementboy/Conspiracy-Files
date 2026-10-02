[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.chat](package-summary.html)
2. [NineGridTexture](NineGridTexture.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [topLeft](#topLeft)
   2. [topMid](#topMid)
   3. [topRight](#topRight)
   4. [left](#left)
   5. [mid](#mid)
   6. [right](#right)
   7. [botLeft](#botLeft)
   8. [botMid](#botMid)
   9. [botRight](#botRight)
   10. [outer](#outer)
6. [Constructor Details](#constructor-detail)
   1. [NineGridTexture(String, int)](#%3Cinit%3E(java.lang.String,int))
7. [Method Details](#method-detail)
   1. [renderInnerBased(int, int, int, int, float, float, float, float)](#renderInnerBased(int,int,int,int,float,float,float,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class NineGridTexture
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.chat.NineGridTexture

---

public class NineGridTexture
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Texture`

  `botLeft`

  `private final Texture`

  `botMid`

  `private final Texture`

  `botRight`

  `private final Texture`

  `left`

  `private final Texture`

  `mid`

  `private final int`

  `outer`

  `private final Texture`

  `right`

  `private final Texture`

  `topLeft`

  `private final Texture`

  `topMid`

  `private final Texture`

  `topRight`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NineGridTexture(String base,
  int outer)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `renderInnerBased(int x,
  int y,
  int w,
  int h,
  float r,
  float g,
  float b,
  float a)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### topLeft

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") topLeft
  + ### topMid

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") topMid
  + ### topRight

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") topRight
  + ### left

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") left
  + ### mid

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") mid
  + ### right

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") right
  + ### botLeft

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") botLeft
  + ### botMid

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") botMid
  + ### botRight

    private final [Texture](../core/textures/Texture.html "class in zombie.core.textures") botRight
  + ### outer

    private final int outer
* Constructor Details
  -------------------

  + ### NineGridTexture

    public NineGridTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") base,
    int outer)
* Method Details
  --------------

  + ### renderInnerBased

    public void renderInnerBased(int x,
    int y,
    int w,
    int h,
    float r,
    float g,
    float b,
    float a)