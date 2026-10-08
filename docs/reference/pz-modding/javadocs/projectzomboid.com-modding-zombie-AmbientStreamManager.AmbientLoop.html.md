[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [AmbientStreamManager](AmbientStreamManager.html)
3. [AmbientLoop](AmbientStreamManager.AmbientLoop.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [volChangeAmount](#volChangeAmount)
   2. [targVol](#targVol)
   3. [currVol](#currVol)
   4. [name](#name)
   5. [volumedelta](#volumedelta)
   6. [channel](#channel)
   7. [emitter](#emitter)
6. [Constructor Details](#constructor-detail)
   1. [AmbientLoop(float, String, float)](#%3Cinit%3E(float,java.lang.String,float))
7. [Method Details](#method-detail)
   1. [update()](#update())
   2. [stop()](#stop())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class AmbientStreamManager.AmbientLoop
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.AmbientStreamManager.AmbientLoop

Enclosing class:
:   `AmbientStreamManager`

---

public static final class AmbientStreamManager.AmbientLoop
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `long`

  `channel`

  `float`

  `currVol`

  `final FMODSoundEmitter`

  `emitter`

  `String`

  `name`

  `float`

  `targVol`

  `static float`

  `volChangeAmount`

  `float`

  `volumedelta`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AmbientLoop(float startVol,
  String name,
  float volDel)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `stop()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### volChangeAmount

    public static float volChangeAmount
  + ### targVol

    public float targVol
  + ### currVol

    public float currVol
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### volumedelta

    public float volumedelta
  + ### channel

    public long channel
  + ### emitter

    public final [FMODSoundEmitter](../fmod/fmod/FMODSoundEmitter.html "class in fmod.fmod") emitter
* Constructor Details
  -------------------

  + ### AmbientLoop

    public AmbientLoop(float startVol,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float volDel)
* Method Details
  --------------

  + ### update

    public void update()
  + ### stop

    public void stop()