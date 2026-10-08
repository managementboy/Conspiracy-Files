[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateManager](ClimateManager.html)
3. [AirFront](ClimateManager.AirFront.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [days](#days)
   2. [maxNoise](#maxNoise)
   3. [totalNoise](#totalNoise)
   4. [type](#type)
   5. [strength](#strength)
   6. [tmpNoiseAbs](#tmpNoiseAbs)
   7. [noiseCache](#noiseCache)
   8. [noiseCacheValue](#noiseCacheValue)
   9. [frontWindAngleDegrees](#frontWindAngleDegrees)
6. [Constructor Details](#constructor-detail)
   1. [AirFront()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getDays()](#getDays())
   2. [getMaxNoise()](#getMaxNoise())
   3. [getTotalNoise()](#getTotalNoise())
   4. [getType()](#getType())
   5. [getStrength()](#getStrength())
   6. [getAngleDegrees()](#getAngleDegrees())
   7. [setFrontType(int)](#setFrontType(int))
   8. [setFrontWind(float)](#setFrontWind(float))
   9. [setStrength(float)](#setStrength(float))
   10. [reset()](#reset())
   11. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   12. [load(DataInputStream)](#load(java.io.DataInputStream))
   13. [addDaySample(float)](#addDaySample(float))
   14. [copyFrom(ClimateManager.AirFront)](#copyFrom(zombie.iso.weather.ClimateManager.AirFront))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateManager.AirFront
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateManager.AirFront

Enclosing class:
:   `ClimateManager`

---

public static class ClimateManager.AirFront
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `days`

  `private float`

  `frontWindAngleDegrees`

  `private float`

  `maxNoise`

  `private final float[]`

  `noiseCache`

  `private float`

  `noiseCacheValue`

  `private float`

  `strength`

  `private float`

  `tmpNoiseAbs`

  `private float`

  `totalNoise`

  `private int`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AirFront()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addDaySample(float noiseval)`

  `void`

  `copyFrom(ClimateManager.AirFront other)`

  `float`

  `getAngleDegrees()`

  `float`

  `getDays()`

  `float`

  `getMaxNoise()`

  `float`

  `getStrength()`

  `float`

  `getTotalNoise()`

  `int`

  `getType()`

  `void`

  `load(DataInputStream input)`

  `protected void`

  `reset()`

  `void`

  `save(DataOutputStream output)`

  `void`

  `setFrontType(int type)`

  `protected void`

  `setFrontWind(float windangledegrees)`

  `void`

  `setStrength(float str)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### days

    private float days
  + ### maxNoise

    private float maxNoise
  + ### totalNoise

    private float totalNoise
  + ### type

    private int type
  + ### strength

    private float strength
  + ### tmpNoiseAbs

    private float tmpNoiseAbs
  + ### noiseCache

    private final float[] noiseCache
  + ### noiseCacheValue

    private float noiseCacheValue
  + ### frontWindAngleDegrees

    private float frontWindAngleDegrees
* Constructor Details
  -------------------

  + ### AirFront

    public AirFront()
* Method Details
  --------------

  + ### getDays

    public float getDays()
  + ### getMaxNoise

    public float getMaxNoise()
  + ### getTotalNoise

    public float getTotalNoise()
  + ### getType

    public int getType()
  + ### getStrength

    public float getStrength()
  + ### getAngleDegrees

    public float getAngleDegrees()
  + ### setFrontType

    public void setFrontType(int type)
  + ### setFrontWind

    protected void setFrontWind(float windangledegrees)
  + ### setStrength

    public void setStrength(float str)
  + ### reset

    protected void reset()
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### addDaySample

    public void addDaySample(float noiseval)
  + ### copyFrom

    public void copyFrom([ClimateManager.AirFront](ClimateManager.AirFront.html "class in zombie.iso.weather") other)