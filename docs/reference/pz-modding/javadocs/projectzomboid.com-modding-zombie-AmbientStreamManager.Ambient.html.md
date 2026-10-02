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
3. [Ambient](AmbientStreamManager.Ambient.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [name](#name)
   4. [radius](#radius)
   5. [volume](#volume)
   6. [worldSoundRadius](#worldSoundRadius)
   7. [worldSoundVolume](#worldSoundVolume)
   8. [trackMouse](#trackMouse)
   9. [emitter](#emitter)
6. [Constructor Details](#constructor-detail)
   1. [Ambient(String, float, float, float, float)](#%3Cinit%3E(java.lang.String,float,float,float,float))
   2. [Ambient(String, float, float, float, float, boolean)](#%3Cinit%3E(java.lang.String,float,float,float,float,boolean))
7. [Method Details](#method-detail)
   1. [finished()](#finished())
   2. [update()](#update())
   3. [repeatWorldSounds(int, int)](#repeatWorldSounds(int,int))

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class AmbientStreamManager.Ambient
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.AmbientStreamManager.Ambient

Enclosing class:
:   `AmbientStreamManager`

---

public static final class AmbientStreamManager.Ambient
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final FMODSoundEmitter`

  `emitter`

  `String`

  `name`

  `(package private) float`

  `radius`

  `boolean`

  `trackMouse`

  `(package private) float`

  `volume`

  `(package private) int`

  `worldSoundRadius`

  `(package private) int`

  `worldSoundVolume`

  `float`

  `x`

  `float`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Ambient(String name,
  float x,
  float y,
  float radius,
  float volume)`

  `Ambient(String name,
  float x,
  float y,
  float radius,
  float volume,
  boolean remote)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `finished()`

  `void`

  `repeatWorldSounds(int radius,
  int volume)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    public float x
  + ### y

    public float y
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### radius

    float radius
  + ### volume

    float volume
  + ### worldSoundRadius

    int worldSoundRadius
  + ### worldSoundVolume

    int worldSoundVolume
  + ### trackMouse

    public boolean trackMouse
  + ### emitter

    final [FMODSoundEmitter](../fmod/fmod/FMODSoundEmitter.html "class in fmod.fmod") emitter
* Constructor Details
  -------------------

  + ### Ambient

    public Ambient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float x,
    float y,
    float radius,
    float volume)
  + ### Ambient

    public Ambient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float x,
    float y,
    float radius,
    float volume,
    boolean remote)
* Method Details
  --------------

  + ### finished

    public boolean finished()
  + ### update

    public void update()
  + ### repeatWorldSounds

    public void repeatWorldSounds(int radius,
    int volume)