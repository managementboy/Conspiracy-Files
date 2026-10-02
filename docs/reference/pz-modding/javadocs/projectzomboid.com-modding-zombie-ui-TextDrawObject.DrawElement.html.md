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
3. [DrawElement](TextDrawObject.DrawElement.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [text](#text)
   2. [scrambleText](#scrambleText)
   3. [currentScrambleVal](#currentScrambleVal)
   4. [f](#f)
   5. [font](#font)
   6. [r](#r)
   7. [g](#g)
   8. [b](#b)
   9. [w](#w)
   10. [h](#h)
   11. [isImage](#isImage)
   12. [useFont](#useFont)
   13. [useColor](#useColor)
   14. [tex](#tex)
   15. [isTextImage](#isTextImage)
   16. [charWidth](#charWidth)
6. [Constructor Details](#constructor-detail)
   1. [DrawElement()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [addText(String)](#addText(java.lang.String))
   3. [scrambleText(float)](#scrambleText(float))
   4. [trim()](#trim())
   5. [softclone()](#softclone())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TextDrawObject.DrawElement
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.TextDrawObject.DrawElement

Enclosing class:
:   `TextDrawObject`

---

private static final class TextDrawObject.DrawElement
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `b`

  `private int`

  `charWidth`

  `private float`

  `currentScrambleVal`

  `private UIFont`

  `f`

  `private AngelCodeFont`

  `font`

  `private float`

  `g`

  `private int`

  `h`

  `private boolean`

  `isImage`

  `private boolean`

  `isTextImage`

  `private float`

  `r`

  `private String`

  `scrambleText`

  `private Texture`

  `tex`

  `private String`

  `text`

  `private boolean`

  `useColor`

  `private boolean`

  `useFont`

  `private int`

  `w`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `DrawElement()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addText(String txt)`

  `private void`

  `reset()`

  `private void`

  `scrambleText(float scrambleVal)`

  `private TextDrawObject.DrawElement`

  `softclone()`

  `private void`

  `trim()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### text

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text
  + ### scrambleText

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scrambleText
  + ### currentScrambleVal

    private float currentScrambleVal
  + ### f

    private [UIFont](UIFont.html "enum class in zombie.ui") f
  + ### font

    private [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") font
  + ### r

    private float r
  + ### g

    private float g
  + ### b

    private float b
  + ### w

    private int w
  + ### h

    private int h
  + ### isImage

    private boolean isImage
  + ### useFont

    private boolean useFont
  + ### useColor

    private boolean useColor
  + ### tex

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex
  + ### isTextImage

    private boolean isTextImage
  + ### charWidth

    private int charWidth
* Constructor Details
  -------------------

  + ### DrawElement

    private DrawElement()
* Method Details
  --------------

  + ### reset

    private void reset()
  + ### addText

    private void addText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") txt)
  + ### scrambleText

    private void scrambleText(float scrambleVal)
  + ### trim

    private void trim()
  + ### softclone

    private [TextDrawObject.DrawElement](TextDrawObject.DrawElement.html "class in zombie.ui") softclone()