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
3. [FileSound](FMODSoundEmitter.FileSound.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [sound](#sound)
   2. [channel](#channel)
   3. [is3d](#is3d)
   4. [ambient](#ambient)
   5. [lx](#lx)
   6. [ly](#ly)
   7. [lz](#lz)
6. [Constructor Details](#constructor-detail)
   1. [FileSound(FMODSoundEmitter)](#%3Cinit%3E(fmod.fmod.FMODSoundEmitter))
7. [Method Details](#method-detail)
   1. [getRef()](#getRef())
   2. [stop(boolean, boolean)](#stop(boolean,boolean))
   3. [set3D(boolean)](#set3D(boolean))
   4. [release(boolean)](#release(boolean))
   5. [tick(boolean)](#tick(boolean))
   6. [tickWhileStopped()](#tickWhileStopped())
   7. [setParameterValue(FMOD\_STUDIO\_PARAMETER\_DESCRIPTION, float)](#setParameterValue(fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION,float))
   8. [setTimelinePosition(String)](#setTimelinePosition(java.lang.String))
   9. [triggerCue()](#triggerCue())
   10. [isTriggeredCue()](#isTriggeredCue())
   11. [restart()](#restart())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FMODSoundEmitter.FileSound
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[fmod.fmod.FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html "class in fmod.fmod")

fmod.fmod.FMODSoundEmitter.FileSound

Enclosing class:
:   `FMODSoundEmitter`

---

private static final class FMODSoundEmitter.FileSound
extends [FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html "class in fmod.fmod")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) boolean`

  `ambient`

  `private long`

  `channel`

  `private byte`

  `is3d`

  `private float`

  `lx`

  `private float`

  `ly`

  `private float`

  `lz`

  `private long`

  `sound`

  ### Fields inherited from class [FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html#field-summary "class in fmod.fmod")

  `clip, emitter, name, parent, pitch, remote, setVolume, setX, setY, setZ, volume`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FileSound(FMODSoundEmitter emitter)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `long`

  `getRef()`

  `(package private) boolean`

  `isTriggeredCue()`

  `void`

  `release(boolean bImmediate)`

  `(package private) boolean`

  `restart()`

  `void`

  `set3D(boolean is3D)`

  `(package private) void`

  `setParameterValue(fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription,
  float value)`

  `(package private) void`

  `setTimelinePosition(String positionName)`

  `void`

  `stop(boolean bReleaseEvent,
  boolean bImmediate)`

  `boolean`

  `tick(boolean isStarting)`

  `boolean`

  `tickWhileStopped()`

  `(package private) void`

  `triggerCue()`

  ### Methods inherited from class [FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html#method-summary "class in fmod.fmod")

  `getEventDescription, getVolume`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### sound

    private long sound
  + ### channel

    private long channel
  + ### is3d

    private byte is3d
  + ### ambient

    boolean ambient
  + ### lx

    private float lx
  + ### ly

    private float ly
  + ### lz

    private float lz
* Constructor Details
  -------------------

  + ### FileSound

    private FileSound([FMODSoundEmitter](FMODSoundEmitter.html "class in fmod.fmod") emitter)
* Method Details
  --------------

  + ### getRef

    public long getRef()

    Specified by:
    :   `getRef` in class `FMODSoundEmitter.Sound`
  + ### stop

    public void stop(boolean bReleaseEvent,
    boolean bImmediate)

    Specified by:
    :   `stop` in class `FMODSoundEmitter.Sound`
  + ### set3D

    public void set3D(boolean is3D)

    Specified by:
    :   `set3D` in class `FMODSoundEmitter.Sound`
  + ### release

    public void release(boolean bImmediate)

    Specified by:
    :   `release` in class `FMODSoundEmitter.Sound`
  + ### tick

    public boolean tick(boolean isStarting)

    Specified by:
    :   `tick` in class `FMODSoundEmitter.Sound`
  + ### tickWhileStopped

    public boolean tickWhileStopped()

    Specified by:
    :   `tickWhileStopped` in class `FMODSoundEmitter.Sound`
  + ### setParameterValue

    void setParameterValue(fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription,
    float value)

    Specified by:
    :   `setParameterValue` in class `FMODSoundEmitter.Sound`
  + ### setTimelinePosition

    void setTimelinePosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") positionName)

    Specified by:
    :   `setTimelinePosition` in class `FMODSoundEmitter.Sound`
  + ### triggerCue

    void triggerCue()

    Specified by:
    :   `triggerCue` in class `FMODSoundEmitter.Sound`
  + ### isTriggeredCue

    boolean isTriggeredCue()

    Specified by:
    :   `isTriggeredCue` in class `FMODSoundEmitter.Sound`
  + ### restart

    boolean restart()

    Specified by:
    :   `restart` in class `FMODSoundEmitter.Sound`