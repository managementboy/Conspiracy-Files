[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [fmod.fmod](package-summary.html)
2. [FMODAudio](FMODAudio.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [emitter](#emitter)
6. [Constructor Details](#constructor-detail)
   1. [FMODAudio(BaseSoundEmitter)](#%3Cinit%3E(zombie.audio.BaseSoundEmitter))
7. [Method Details](#method-detail)
   1. [isPlaying()](#isPlaying())
   2. [setVolume(float)](#setVolume(float))
   3. [start()](#start())
   4. [pause()](#pause())
   5. [stop()](#stop())
   6. [setName(String)](#setName(java.lang.String))
   7. [getName()](#getName())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FMODAudio
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

fmod.fmod.FMODAudio

All Implemented Interfaces:
:   `fmod.fmod.Audio`

---

public class FMODAudio
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements fmod.fmod.Audio

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `BaseSoundEmitter`

  `emitter`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FMODAudio(BaseSoundEmitter emitter)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getName()`

  `boolean`

  `isPlaying()`

  `void`

  `pause()`

  `void`

  `setName(String name)`

  `void`

  `setVolume(float volume)`

  `void`

  `start()`

  `void`

  `stop()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### emitter

    public [BaseSoundEmitter](../../zombie/audio/BaseSoundEmitter.html "class in zombie.audio") emitter
* Constructor Details
  -------------------

  + ### FMODAudio

    public FMODAudio([BaseSoundEmitter](../../zombie/audio/BaseSoundEmitter.html "class in zombie.audio") emitter)
* Method Details
  --------------

  + ### isPlaying

    public boolean isPlaying()

    Specified by:
    :   `isPlaying` in interface `fmod.fmod.Audio`
  + ### setVolume

    public void setVolume(float volume)

    Specified by:
    :   `setVolume` in interface `fmod.fmod.Audio`
  + ### start

    public void start()

    Specified by:
    :   `start` in interface `fmod.fmod.Audio`
  + ### pause

    public void pause()

    Specified by:
    :   `pause` in interface `fmod.fmod.Audio`
  + ### stop

    public void stop()

    Specified by:
    :   `stop` in interface `fmod.fmod.Audio`
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `setName` in interface `fmod.fmod.Audio`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()

    Specified by:
    :   `getName` in interface `fmod.fmod.Audio`