[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.StorySounds](package-summary.html)
2. [StorySound](StorySound.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [baseVolume](#baseVolume)
6. [Constructor Details](#constructor-detail)
   1. [StorySound(String, float)](#%3Cinit%3E(java.lang.String,float))
7. [Method Details](#method-detail)
   1. [playSound()](#playSound())
   2. [playSound(float)](#playSound(float))
   3. [playSound(float, float, float, float, float)](#playSound(float,float,float,float,float))
   4. [playSound(float, float, float, float, float, float)](#playSound(float,float,float,float,float,float))
   5. [getName()](#getName())
   6. [setName(String)](#setName(java.lang.String))
   7. [getBaseVolume()](#getBaseVolume())
   8. [setBaseVolume(float)](#setBaseVolume(float))
   9. [getClone()](#getClone())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class StorySound
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.StorySounds.StorySound

---

public final class StorySound
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `baseVolume`

  `private String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `StorySound(String name,
  float baseVol)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getBaseVolume()`

  `StorySound`

  `getClone()`

  `String`

  `getName()`

  `long`

  `playSound()`

  `long`

  `playSound(float volumeOverride)`

  `long`

  `playSound(float x,
  float y,
  float z,
  float minRange,
  float maxRange)`

  `long`

  `playSound(float volumeMod,
  float x,
  float y,
  float z,
  float minRange,
  float maxRange)`

  `void`

  `setBaseVolume(float baseVolume)`

  `void`

  `setName(String name)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### baseVolume

    private float baseVolume
* Constructor Details
  -------------------

  + ### StorySound

    public StorySound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float baseVol)
* Method Details
  --------------

  + ### playSound

    public long playSound()
  + ### playSound

    public long playSound(float volumeOverride)
  + ### playSound

    public long playSound(float x,
    float y,
    float z,
    float minRange,
    float maxRange)
  + ### playSound

    public long playSound(float volumeMod,
    float x,
    float y,
    float z,
    float minRange,
    float maxRange)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getBaseVolume

    public float getBaseVolume()
  + ### setBaseVolume

    public void setBaseVolume(float baseVolume)
  + ### getClone

    public [StorySound](StorySound.html "class in zombie.radio.StorySounds") getClone()