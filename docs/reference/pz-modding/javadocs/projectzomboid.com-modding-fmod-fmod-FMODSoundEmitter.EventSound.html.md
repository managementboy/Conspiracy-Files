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
3. [EventSound](FMODSoundEmitter.EventSound.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [eventInstance](#eventInstance)
   2. [eventInstanceStopped](#eventInstanceStopped)
   3. [triggeredCue](#triggeredCue)
   4. [checkTimeMs](#checkTimeMs)
6. [Constructor Details](#constructor-detail)
   1. [EventSound(FMODSoundEmitter)](#%3Cinit%3E(fmod.fmod.FMODSoundEmitter))
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

Class FMODSoundEmitter.EventSound
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[fmod.fmod.FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html "class in fmod.fmod")

fmod.fmod.FMODSoundEmitter.EventSound

Enclosing class:
:   `FMODSoundEmitter`

---

private static final class FMODSoundEmitter.EventSound
extends [FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html "class in fmod.fmod")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private long`

  `checkTimeMs`

  `private long`

  `eventInstance`

  `private long`

  `eventInstanceStopped`

  `private boolean`

  `triggeredCue`

  ### Fields inherited from class [FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html#field-summary "class in fmod.fmod")

  `clip, emitter, name, parent, pitch, remote, setVolume, setX, setY, setZ, volume`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `EventSound(FMODSoundEmitter emitter)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `long`

  `getRef()`

  `boolean`

  `isTriggeredCue()`

  `void`

  `release(boolean bImmediate)`

  `boolean`

  `restart()`

  `void`

  `set3D(boolean is3D)`

  `void`

  `setParameterValue(fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription,
  float value)`

  `void`

  `setTimelinePosition(String positionName)`

  `void`

  `stop(boolean bReleaseEvent,
  boolean bImmediate)`

  `boolean`

  `tick(boolean isStarting)`

  `boolean`

  `tickWhileStopped()`

  `void`

  `triggerCue()`

  ### Methods inherited from class [FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html#method-summary "class in fmod.fmod")

  `getEventDescription, getVolume`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### eventInstance

    private long eventInstance
  + ### eventInstanceStopped

    private long eventInstanceStopped
  + ### triggeredCue

    private boolean triggeredCue
  + ### checkTimeMs

    private long checkTimeMs
* Constructor Details
  -------------------

  + ### EventSound

    public EventSound([FMODSoundEmitter](FMODSoundEmitter.html "class in fmod.fmod") emitter)
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

    public void setParameterValue(fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription,
    float value)

    Specified by:
    :   `setParameterValue` in class `FMODSoundEmitter.Sound`
  + ### setTimelinePosition

    public void setTimelinePosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") positionName)

    Specified by:
    :   `setTimelinePosition` in class `FMODSoundEmitter.Sound`
  + ### triggerCue

    public void triggerCue()

    Specified by:
    :   `triggerCue` in class `FMODSoundEmitter.Sound`
  + ### isTriggeredCue

    public boolean isTriggeredCue()

    Specified by:
    :   `isTriggeredCue` in class `FMODSoundEmitter.Sound`
  + ### restart

    public boolean restart()

    Specified by:
    :   `restart` in class `FMODSoundEmitter.Sound`