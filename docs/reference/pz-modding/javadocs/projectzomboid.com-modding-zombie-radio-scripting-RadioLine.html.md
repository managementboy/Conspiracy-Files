[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.scripting](package-summary.html)
2. [RadioLine](RadioLine.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [r](#r)
   2. [g](#g)
   3. [b](#b)
   4. [text](#text)
   5. [effects](#effects)
   6. [airTime](#airTime)
6. [Constructor Details](#constructor-detail)
   1. [RadioLine(String, float, float, float)](#%3Cinit%3E(java.lang.String,float,float,float))
   2. [RadioLine(String, float, float, float, String)](#%3Cinit%3E(java.lang.String,float,float,float,java.lang.String))
7. [Method Details](#method-detail)
   1. [getR()](#getR())
   2. [getG()](#getG())
   3. [getB()](#getB())
   4. [getText()](#getText())
   5. [getEffectsString()](#getEffectsString())
   6. [isCustomAirTime()](#isCustomAirTime())
   7. [getAirTime()](#getAirTime())
   8. [setAirTime(float)](#setAirTime(float))
   9. [setText(String)](#setText(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RadioLine
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.scripting.RadioLine

---

public final class RadioLine
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `airTime`

  `private final float`

  `b`

  `private String`

  `effects`

  `private final float`

  `g`

  `private final float`

  `r`

  `private String`

  `text`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RadioLine(String txt,
  float red,
  float green,
  float blue)`

  `RadioLine(String txt,
  float red,
  float green,
  float blue,
  String fx)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getAirTime()`

  `float`

  `getB()`

  `String`

  `getEffectsString()`

  `float`

  `getG()`

  `float`

  `getR()`

  `String`

  `getText()`

  `boolean`

  `isCustomAirTime()`

  `void`

  `setAirTime(float airTime)`

  `void`

  `setText(String text)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### r

    private final float r
  + ### g

    private final float g
  + ### b

    private final float b
  + ### text

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text
  + ### effects

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") effects
  + ### airTime

    private float airTime
* Constructor Details
  -------------------

  + ### RadioLine

    public RadioLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") txt,
    float red,
    float green,
    float blue)
  + ### RadioLine

    public RadioLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") txt,
    float red,
    float green,
    float blue,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fx)
* Method Details
  --------------

  + ### getR

    public float getR()
  + ### getG

    public float getG()
  + ### getB

    public float getB()
  + ### getText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getText()
  + ### getEffectsString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEffectsString()
  + ### isCustomAirTime

    public boolean isCustomAirTime()
  + ### getAirTime

    public float getAirTime()
  + ### setAirTime

    public void setAirTime(float airTime)
  + ### setText

    public void setText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)