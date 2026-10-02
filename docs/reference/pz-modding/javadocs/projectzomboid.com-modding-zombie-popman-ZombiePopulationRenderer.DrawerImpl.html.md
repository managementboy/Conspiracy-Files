[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.popman](package-summary.html)
2. [ZombiePopulationRenderer](ZombiePopulationRenderer.html)
3. [DrawerImpl](ZombiePopulationRenderer.DrawerImpl.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [renderBuffer](#renderBuffer)
6. [Constructor Details](#constructor-detail)
   1. [DrawerImpl()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reserve(int)](#reserve(int))
   2. [renderBufferByte(byte)](#renderBufferByte(byte))
   3. [renderBufferFloat(double)](#renderBufferFloat(double))
   4. [renderBufferFloat(float)](#renderBufferFloat(float))
   5. [renderBufferInt(int)](#renderBufferInt(int))
   6. [renderBufferString(String)](#renderBufferString(java.lang.String))
   7. [renderLineUI(float, float, float, float, float, float, float, float)](#renderLineUI(float,float,float,float,float,float,float,float))
   8. [renderRectFilledUI(float, float, float, float, float, float, float, float)](#renderRectFilledUI(float,float,float,float,float,float,float,float))
   9. [renderStringUI(float, float, String, double, double, double, double)](#renderStringUI(float,float,java.lang.String,double,double,double,double))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ZombiePopulationRenderer.DrawerImpl
=========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.popman.ZombiePopulationRenderer.DrawerImpl

Enclosing class:
:   `ZombiePopulationRenderer`

---

private static class ZombiePopulationRenderer.DrawerImpl
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) ByteBuffer`

  `renderBuffer`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `DrawerImpl()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `renderBufferByte(byte v)`

  `private void`

  `renderBufferFloat(double v)`

  `private void`

  `renderBufferFloat(float v)`

  `private void`

  `renderBufferInt(int v)`

  `private void`

  `renderBufferString(String v)`

  `private void`

  `renderLineUI(float x1,
  float y1,
  float x2,
  float y2,
  float r,
  float g,
  float b,
  float a)`

  `private void`

  `renderRectFilledUI(float x,
  float y,
  float w,
  float h,
  float r,
  float g,
  float b,
  float a)`

  `private void`

  `renderStringUI(float x,
  float y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `private void`

  `reserve(int nBytes)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### renderBuffer

    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") renderBuffer
* Constructor Details
  -------------------

  + ### DrawerImpl

    private DrawerImpl()
* Method Details
  --------------

  + ### reserve

    private void reserve(int nBytes)
  + ### renderBufferByte

    private void renderBufferByte(byte v)
  + ### renderBufferFloat

    private void renderBufferFloat(double v)
  + ### renderBufferFloat

    private void renderBufferFloat(float v)
  + ### renderBufferInt

    private void renderBufferInt(int v)
  + ### renderBufferString

    private void renderBufferString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") v)
  + ### renderLineUI

    private void renderLineUI(float x1,
    float y1,
    float x2,
    float y2,
    float r,
    float g,
    float b,
    float a)
  + ### renderRectFilledUI

    private void renderRectFilledUI(float x,
    float y,
    float w,
    float h,
    float r,
    float g,
    float b,
    float a)
  + ### renderStringUI

    private void renderStringUI(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)