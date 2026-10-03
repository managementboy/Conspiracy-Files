[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [GameSoundClip](GameSoundClip.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [INIT\_FLAG\_DISTANCE\_MIN](#INIT_FLAG_DISTANCE_MIN)
   2. [INIT\_FLAG\_DISTANCE\_MAX](#INIT_FLAG_DISTANCE_MAX)
   3. [INIT\_FLAG\_STOP\_IMMEDIATE](#INIT_FLAG_STOP_IMMEDIATE)
   4. [gameSound](#gameSound)
   5. [event](#event)
   6. [eventDescription](#eventDescription)
   7. [eventDescriptionMp](#eventDescriptionMp)
   8. [file](#file)
   9. [volume](#volume)
   10. [pitch](#pitch)
   11. [distanceMin](#distanceMin)
   12. [distanceMax](#distanceMax)
   13. [reverbMaxRange](#reverbMaxRange)
   14. [reverbFactor](#reverbFactor)
   15. [priority](#priority)
   16. [initFlags](#initFlags)
   17. [reloadEpoch](#reloadEpoch)
6. [Constructor Details](#constructor-detail)
   1. [GameSoundClip(GameSound)](#%3Cinit%3E(zombie.audio.GameSound))
7. [Method Details](#method-detail)
   1. [getEvent()](#getEvent())
   2. [getFile()](#getFile())
   3. [getVolume()](#getVolume())
   4. [getPitch()](#getPitch())
   5. [hasMinDistance()](#hasMinDistance())
   6. [hasMaxDistance()](#hasMaxDistance())
   7. [getMinDistance()](#getMinDistance())
   8. [getMaxDistance()](#getMaxDistance())
   9. [isStopImmediate()](#isStopImmediate())
   10. [getEffectiveVolume()](#getEffectiveVolume())
   11. [getEffectiveVolumeInMenu()](#getEffectiveVolumeInMenu())
   12. [checkReloaded()](#checkReloaded())
   13. [getEventDescription(boolean)](#getEventDescription(boolean))
   14. [hasSustainPoints(boolean)](#hasSustainPoints(boolean))
   15. [hasParameter(boolean, FMOD\_STUDIO\_PARAMETER\_DESCRIPTION)](#hasParameter(boolean,fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameSoundClip
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.GameSoundClip

---

public final class GameSoundClip
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `distanceMax`

  `float`

  `distanceMin`

  `String`

  `event`

  `fmod.fmod.FMOD_STUDIO_EVENT_DESCRIPTION`

  `eventDescription`

  `fmod.fmod.FMOD_STUDIO_EVENT_DESCRIPTION`

  `eventDescriptionMp`

  `String`

  `file`

  `final GameSound`

  `gameSound`

  `static final short`

  `INIT_FLAG_DISTANCE_MAX`

  `static final short`

  `INIT_FLAG_DISTANCE_MIN`

  `static final short`

  `INIT_FLAG_STOP_IMMEDIATE`

  `short`

  `initFlags`

  `float`

  `pitch`

  `int`

  `priority`

  `short`

  `reloadEpoch`

  `float`

  `reverbFactor`

  `float`

  `reverbMaxRange`

  `float`

  `volume`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameSoundClip(GameSound gameSound)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `GameSoundClip`

  `checkReloaded()`

  `float`

  `getEffectiveVolume()`

  `float`

  `getEffectiveVolumeInMenu()`

  `String`

  `getEvent()`

  `fmod.fmod.FMOD_STUDIO_EVENT_DESCRIPTION`

  `getEventDescription(boolean remote)`

  `String`

  `getFile()`

  `float`

  `getMaxDistance()`

  `float`

  `getMinDistance()`

  `float`

  `getPitch()`

  `float`

  `getVolume()`

  `boolean`

  `hasMaxDistance()`

  `boolean`

  `hasMinDistance()`

  `boolean`

  `hasParameter(boolean remote,
  fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription)`

  `boolean`

  `hasSustainPoints(boolean remote)`

  `boolean`

  `isStopImmediate()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### INIT\_FLAG\_DISTANCE\_MIN

    public static final short INIT\_FLAG\_DISTANCE\_MIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.audio.GameSoundClip.INIT_FLAG_DISTANCE_MIN)
  + ### INIT\_FLAG\_DISTANCE\_MAX

    public static final short INIT\_FLAG\_DISTANCE\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.audio.GameSoundClip.INIT_FLAG_DISTANCE_MAX)
  + ### INIT\_FLAG\_STOP\_IMMEDIATE

    public static final short INIT\_FLAG\_STOP\_IMMEDIATE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.audio.GameSoundClip.INIT_FLAG_STOP_IMMEDIATE)
  + ### gameSound

    public final [GameSound](GameSound.html "class in zombie.audio") gameSound
  + ### event

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") event
  + ### eventDescription

    public fmod.fmod.FMOD\_STUDIO\_EVENT\_DESCRIPTION eventDescription
  + ### eventDescriptionMp

    public fmod.fmod.FMOD\_STUDIO\_EVENT\_DESCRIPTION eventDescriptionMp
  + ### file

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file
  + ### volume

    public float volume
  + ### pitch

    public float pitch
  + ### distanceMin

    public float distanceMin
  + ### distanceMax

    public float distanceMax
  + ### reverbMaxRange

    public float reverbMaxRange
  + ### reverbFactor

    public float reverbFactor
  + ### priority

    public int priority
  + ### initFlags

    public short initFlags
  + ### reloadEpoch

    public short reloadEpoch
* Constructor Details
  -------------------

  + ### GameSoundClip

    public GameSoundClip([GameSound](GameSound.html "class in zombie.audio") gameSound)
* Method Details
  --------------

  + ### getEvent

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEvent()
  + ### getFile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFile()
  + ### getVolume

    public float getVolume()
  + ### getPitch

    public float getPitch()
  + ### hasMinDistance

    public boolean hasMinDistance()
  + ### hasMaxDistance

    public boolean hasMaxDistance()
  + ### getMinDistance

    public float getMinDistance()
  + ### getMaxDistance

    public float getMaxDistance()
  + ### isStopImmediate

    public boolean isStopImmediate()
  + ### getEffectiveVolume

    public float getEffectiveVolume()
  + ### getEffectiveVolumeInMenu

    public float getEffectiveVolumeInMenu()
  + ### checkReloaded

    public [GameSoundClip](GameSoundClip.html "class in zombie.audio") checkReloaded()
  + ### getEventDescription

    public fmod.fmod.FMOD\_STUDIO\_EVENT\_DESCRIPTION getEventDescription(boolean remote)
  + ### hasSustainPoints

    public boolean hasSustainPoints(boolean remote)
  + ### hasParameter

    public boolean hasParameter(boolean remote,
    fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription)