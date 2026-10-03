[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [fmod.fmod](package-summary.html)
2. [FMODSoundEmitter](FMODSoundEmitter.html)
3. [Sound](FMODSoundEmitter.Sound.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [emitter](#emitter)
   2. [clip](#clip)
   3. [remote](#remote)
   4. [name](#name)
   5. [volume](#volume)
   6. [pitch](#pitch)
   7. [parent](#parent)
   8. [setVolume](#setVolume)
   9. [setX](#setX)
   10. [setY](#setY)
   11. [setZ](#setZ)
6. [Constructor Details](#constructor-detail)
   1. [Sound(FMODSoundEmitter)](#%3Cinit%3E(fmod.fmod.FMODSoundEmitter))
7. [Method Details](#method-detail)
   1. [getRef()](#getRef())
   2. [stop(boolean, boolean)](#stop(boolean,boolean))
   3. [set3D(boolean)](#set3D(boolean))
   4. [release(boolean)](#release(boolean))
   5. [tick(boolean)](#tick(boolean))
   6. [tickWhileStopped()](#tickWhileStopped())
   7. [getVolume()](#getVolume())
   8. [setParameterValue(FMOD\_STUDIO\_PARAMETER\_DESCRIPTION, float)](#setParameterValue(fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION,float))
   9. [setTimelinePosition(String)](#setTimelinePosition(java.lang.String))
   10. [triggerCue()](#triggerCue())
   11. [isTriggeredCue()](#isTriggeredCue())
   12. [restart()](#restart())
   13. [getEventDescription()](#getEventDescription())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FMODSoundEmitter.Sound
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

fmod.fmod.FMODSoundEmitter.Sound

Direct Known Subclasses:
:   `FMODSoundEmitter.EventSound, FMODSoundEmitter.FileSound`

Enclosing class:
:   `FMODSoundEmitter`

---

private abstract static class FMODSoundEmitter.Sound
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `GameSoundClip`

  `clip`

  `final FMODSoundEmitter`

  `emitter`

  `String`

  `name`

  `IsoObject`

  `parent`

  `float`

  `pitch`

  `boolean`

  `remote`

  `float`

  `setVolume`

  `float`

  `setX`

  `float`

  `setY`

  `float`

  `setZ`

  `float`

  `volume`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Sound(FMODSoundEmitter emitter)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `fmod.fmod.FMOD_STUDIO_EVENT_DESCRIPTION`

  `getEventDescription()`

  `(package private) abstract long`

  `getRef()`

  `float`

  `getVolume()`

  `(package private) abstract boolean`

  `isTriggeredCue()`

  `(package private) abstract void`

  `release(boolean bImmediate)`

  `(package private) abstract boolean`

  `restart()`

  `(package private) abstract void`

  `set3D(boolean is3D)`

  `(package private) abstract void`

  `setParameterValue(fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription,
  float value)`

  `(package private) abstract void`

  `setTimelinePosition(String positionName)`

  `(package private) abstract void`

  `stop(boolean bReleaseEvent,
  boolean bImmediate)`

  `(package private) abstract boolean`

  `tick(boolean isStarting)`

  `(package private) abstract boolean`

  `tickWhileStopped()`

  `(package private) abstract void`

  `triggerCue()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### emitter

    public final [FMODSoundEmitter](FMODSoundEmitter.html "class in fmod.fmod") emitter
  + ### clip

    public [GameSoundClip](../../zombie/audio/GameSoundClip.html "class in zombie.audio") clip
  + ### remote

    public boolean remote
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### volume

    public float volume
  + ### pitch

    public float pitch
  + ### parent

    public [IsoObject](../../zombie/iso/IsoObject.html "class in zombie.iso") parent
  + ### setVolume

    public float setVolume
  + ### setX

    public float setX
  + ### setY

    public float setY
  + ### setZ

    public float setZ
* Constructor Details
  -------------------

  + ### Sound

    public Sound([FMODSoundEmitter](FMODSoundEmitter.html "class in fmod.fmod") emitter)
* Method Details
  --------------

  + ### getRef

    abstract long getRef()
  + ### stop

    abstract void stop(boolean bReleaseEvent,
    boolean bImmediate)
  + ### set3D

    abstract void set3D(boolean is3D)
  + ### release

    abstract void release(boolean bImmediate)
  + ### tick

    abstract boolean tick(boolean isStarting)
  + ### tickWhileStopped

    abstract boolean tickWhileStopped()
  + ### getVolume

    public float getVolume()
  + ### setParameterValue

    abstract void setParameterValue(fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription,
    float value)
  + ### setTimelinePosition

    abstract void setTimelinePosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") positionName)
  + ### triggerCue

    abstract void triggerCue()
  + ### isTriggeredCue

    abstract boolean isTriggeredCue()
  + ### restart

    abstract boolean restart()
  + ### getEventDescription

    public fmod.fmod.FMOD\_STUDIO\_EVENT\_DESCRIPTION getEventDescription()