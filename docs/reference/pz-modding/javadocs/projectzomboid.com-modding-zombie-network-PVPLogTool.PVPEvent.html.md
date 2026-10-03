[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [PVPLogTool](PVPLogTool.html)
3. [PVPEvent](PVPLogTool.PVPEvent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [format](#format)
   2. [timestamp](#timestamp)
   3. [wielder](#wielder)
   4. [target](#target)
   5. [x](#x)
   6. [y](#y)
   7. [z](#z)
6. [Constructor Details](#constructor-detail)
   1. [PVPEvent(String, String, float, float, float)](#%3Cinit%3E(java.lang.String,java.lang.String,float,float,float))
7. [Method Details](#method-detail)
   1. [reset(String, String, float, float, float)](#reset(java.lang.String,java.lang.String,float,float,float))
   2. [reset(String, String, String, float, float, float)](#reset(java.lang.String,java.lang.String,java.lang.String,float,float,float))
   3. [getText()](#getText())
   4. [isSet()](#isSet())
   5. [getX()](#getX())
   6. [getY()](#getY())
   7. [getZ()](#getZ())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PVPLogTool.PVPEvent
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.PVPLogTool.PVPEvent

Enclosing class:
:   `PVPLogTool`

---

public static class PVPLogTool.PVPEvent
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final SimpleDateFormat`

  `format`

  `String`

  `target`

  `String`

  `timestamp`

  `String`

  `wielder`

  `float`

  `x`

  `float`

  `y`

  `float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PVPEvent(String wielder,
  String target,
  float x,
  float y,
  float z)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getText()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `boolean`

  `isSet()`

  `void`

  `reset(String wielder,
  String target,
  float x,
  float y,
  float z)`

  `void`

  `reset(String timestamp,
  String wielder,
  String target,
  float x,
  float y,
  float z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### format

    private static final [SimpleDateFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/SimpleDateFormat.html "class or interface in java.text") format
  + ### timestamp

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") timestamp
  + ### wielder

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wielder
  + ### target

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") target
  + ### x

    public float x
  + ### y

    public float y
  + ### z

    public float z
* Constructor Details
  -------------------

  + ### PVPEvent

    public PVPEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wielder,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") target,
    float x,
    float y,
    float z)
* Method Details
  --------------

  + ### reset

    public void reset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wielder,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") target,
    float x,
    float y,
    float z)
  + ### reset

    public void reset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") timestamp,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wielder,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") target,
    float x,
    float y,
    float z)
  + ### getText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getText()
  + ### isSet

    public boolean isSet()
  + ### getX

    public float getX()
  + ### getY

    public float getY()
  + ### getZ

    public float getZ()