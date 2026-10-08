[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.media](package-summary.html)
2. [MediaData](MediaData.html)
3. [MediaLineData](MediaData.MediaLineData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [text](#text)
   2. [color](#color)
   3. [codes](#codes)
6. [Constructor Details](#constructor-detail)
   1. [MediaLineData(String, float, float, float, String)](#%3Cinit%3E(java.lang.String,float,float,float,java.lang.String))
7. [Method Details](#method-detail)
   1. [getTranslatedText()](#getTranslatedText())
   2. [getColor()](#getColor())
   3. [getR()](#getR())
   4. [getG()](#getG())
   5. [getB()](#getB())
   6. [getCodes()](#getCodes())
   7. [getTextGuid()](#getTextGuid())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class MediaData.MediaLineData
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.media.MediaData.MediaLineData

Enclosing class:
:   `MediaData`

---

public static final class MediaData.MediaLineData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `codes`

  `private final Color`

  `color`

  `private final String`

  `text`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MediaLineData(String text,
  float r,
  float g,
  float b,
  String codes)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getB()`

  `String`

  `getCodes()`

  `Color`

  `getColor()`

  `float`

  `getG()`

  `float`

  `getR()`

  `String`

  `getTextGuid()`

  `String`

  `getTranslatedText()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### text

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text
  + ### color

    private final [Color](../../core/Color.html "class in zombie.core") color
  + ### codes

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes
* Constructor Details
  -------------------

  + ### MediaLineData

    public MediaLineData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    float r,
    float g,
    float b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes)
* Method Details
  --------------

  + ### getTranslatedText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedText()
  + ### getColor

    public [Color](../../core/Color.html "class in zombie.core") getColor()
  + ### getR

    public float getR()
  + ### getG

    public float getG()
  + ### getB

    public float getB()
  + ### getCodes

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCodes()
  + ### getTextGuid

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextGuid()