[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [CharacterSoundEmitter](CharacterSoundEmitter.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [currentPriority](#currentPriority)
   2. [vocals](#vocals)
   3. [footsteps](#footsteps)
   4. [extra](#extra)
   5. [footstep1](#footstep1)
   6. [footstep2](#footstep2)
7. [Constructor Details](#constructor-detail)
   1. [CharacterSoundEmitter(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
8. [Method Details](#method-detail)
   1. [register()](#register())
   2. [unregister()](#unregister())
   3. [playVocals(String)](#playVocals(java.lang.String))
   4. [getFootstepToPlay()](#getFootstepToPlay())
   5. [playFootsteps(String, float)](#playFootsteps(java.lang.String,float))
   6. [playSound(String)](#playSound(java.lang.String))
   7. [playSound(String, boolean)](#playSound(java.lang.String,boolean))
   8. [playSound(String, IsoObject)](#playSound(java.lang.String,zombie.iso.IsoObject))
   9. [playSoundImpl(String, IsoObject)](#playSoundImpl(java.lang.String,zombie.iso.IsoObject))
   10. [tick()](#tick())
   11. [setPos(float, float, float)](#setPos(float,float,float))
   12. [set(float, float, float)](#set(float,float,float))
   13. [isEmpty()](#isEmpty())
   14. [isClear()](#isClear())
   15. [setPitch(long, float)](#setPitch(long,float))
   16. [setVolume(long, float)](#setVolume(long,float))
   17. [hasSustainPoints(long)](#hasSustainPoints(long))
   18. [triggerCue(long)](#triggerCue(long))
   19. [stopSound(long)](#stopSound(long))
   20. [stopSoundDelayRelease(long)](#stopSoundDelayRelease(long))
   21. [stopSoundLocal(long)](#stopSoundLocal(long))
   22. [stopOrTriggerSound(long)](#stopOrTriggerSound(long))
   23. [stopOrTriggerSoundLocal(long)](#stopOrTriggerSoundLocal(long))
   24. [stopOrTriggerSoundByName(String)](#stopOrTriggerSoundByName(java.lang.String))
   25. [stopAll()](#stopAll())
   26. [stopSoundByName(String)](#stopSoundByName(java.lang.String))
   27. [hasSoundsToStart()](#hasSoundsToStart())
   28. [isPlaying(long)](#isPlaying(long))
   29. [isPlaying(String)](#isPlaying(java.lang.String))
   30. [setParameterValue(long, FMOD\_STUDIO\_PARAMETER\_DESCRIPTION, float)](#setParameterValue(long,fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION,float))
   31. [setParameterValueByName(long, String, float)](#setParameterValueByName(long,java.lang.String,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CharacterSoundEmitter
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html "class in zombie.characters")

zombie.characters.CharacterSoundEmitter

All Implemented Interfaces:
:   `zombie.interfaces.ICommonSoundEmitter`

---

public final class CharacterSoundEmitter
extends [BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html "class in zombie.characters")
implements zombie.interfaces.ICommonSoundEmitter

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static enum`

  `CharacterSoundEmitter.footstep`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `currentPriority`

  `(package private) final FMODSoundEmitter`

  `extra`

  `private long`

  `footstep1`

  `private long`

  `footstep2`

  `(package private) final FMODSoundEmitter`

  `footsteps`

  `(package private) final FMODSoundEmitter`

  `vocals`

  ### Fields inherited from class [BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html#field-summary "class in zombie.characters")

  `character`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CharacterSoundEmitter(IsoGameCharacter chr)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) CharacterSoundEmitter.footstep`

  `getFootstepToPlay()`

  `boolean`

  `hasSoundsToStart()`

  `boolean`

  `hasSustainPoints(long handle)`

  `boolean`

  `isClear()`

  `boolean`

  `isEmpty()`

  `boolean`

  `isPlaying(long eventInstance)`

  `boolean`

  `isPlaying(String alias)`

  `void`

  `playFootsteps(String file,
  float volume)`

  `long`

  `playSound(String file)`

  `long`

  `playSound(String file,
  boolean doWorldSound)`

  `long`

  `playSound(String file,
  IsoObject proxy)`

  `long`

  `playSoundImpl(String file,
  IsoObject proxy)`

  `long`

  `playVocals(String file)`

  `void`

  `register()`

  `void`

  `set(float x,
  float y,
  float z)`

  `void`

  `setParameterValue(long soundRef,
  fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription,
  float value)`

  `void`

  `setParameterValueByName(long soundRef,
  String parameterName,
  float value)`

  `void`

  `setPitch(long handle,
  float pitch)`

  `void`

  `setPos(float x,
  float y,
  float z)`

  `void`

  `setVolume(long handle,
  float volume)`

  `void`

  `stopAll()`

  `void`

  `stopOrTriggerSound(long eventInstance)`

  `void`

  `stopOrTriggerSoundByName(String name)`

  `void`

  `stopOrTriggerSoundLocal(long eventInstance)`

  `int`

  `stopSound(long eventInstance)`

  `int`

  `stopSoundByName(String soundName)`

  `int`

  `stopSoundDelayRelease(long eventInstance)`

  `void`

  `stopSoundLocal(long handle)`

  `void`

  `tick()`

  `void`

  `triggerCue(long handle)`

  `void`

  `unregister()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### currentPriority

    float currentPriority
  + ### vocals

    final [FMODSoundEmitter](../../fmod/fmod/FMODSoundEmitter.html "class in fmod.fmod") vocals
  + ### footsteps

    final [FMODSoundEmitter](../../fmod/fmod/FMODSoundEmitter.html "class in fmod.fmod") footsteps
  + ### extra

    final [FMODSoundEmitter](../../fmod/fmod/FMODSoundEmitter.html "class in fmod.fmod") extra
  + ### footstep1

    private long footstep1
  + ### footstep2

    private long footstep2
* Constructor Details
  -------------------

  + ### CharacterSoundEmitter

    public CharacterSoundEmitter([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr)
* Method Details
  --------------

  + ### register

    public void register()

    Specified by:
    :   `register` in class `BaseCharacterSoundEmitter`
  + ### unregister

    public void unregister()

    Specified by:
    :   `unregister` in class `BaseCharacterSoundEmitter`
  + ### playVocals

    public long playVocals([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playVocals` in class `BaseCharacterSoundEmitter`
  + ### getFootstepToPlay

    [CharacterSoundEmitter.footstep](CharacterSoundEmitter.footstep.html "enum class in zombie.characters") getFootstepToPlay()
  + ### playFootsteps

    public void playFootsteps([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    float volume)

    Specified by:
    :   `playFootsteps` in class `BaseCharacterSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playSound` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `playSound` in class `BaseCharacterSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    boolean doWorldSound)

    Specified by:
    :   `playSound` in interface `zombie.interfaces.ICommonSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") proxy)

    Specified by:
    :   `playSound` in class `BaseCharacterSoundEmitter`
  + ### playSoundImpl

    public long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") proxy)

    Specified by:
    :   `playSoundImpl` in class `BaseCharacterSoundEmitter`
  + ### tick

    public void tick()

    Specified by:
    :   `tick` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `tick` in class `BaseCharacterSoundEmitter`
  + ### setPos

    public void setPos(float x,
    float y,
    float z)

    Specified by:
    :   `setPos` in interface `zombie.interfaces.ICommonSoundEmitter`
  + ### set

    public void set(float x,
    float y,
    float z)

    Specified by:
    :   `set` in class `BaseCharacterSoundEmitter`
  + ### isEmpty

    public boolean isEmpty()

    Specified by:
    :   `isEmpty` in interface `zombie.interfaces.ICommonSoundEmitter`
  + ### isClear

    public boolean isClear()

    Specified by:
    :   `isClear` in class `BaseCharacterSoundEmitter`
  + ### setPitch

    public void setPitch(long handle,
    float pitch)

    Specified by:
    :   `setPitch` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `setPitch` in class `BaseCharacterSoundEmitter`
  + ### setVolume

    public void setVolume(long handle,
    float volume)

    Specified by:
    :   `setVolume` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `setVolume` in class `BaseCharacterSoundEmitter`
  + ### hasSustainPoints

    public boolean hasSustainPoints(long handle)

    Specified by:
    :   `hasSustainPoints` in interface `zombie.interfaces.ICommonSoundEmitter`
  + ### triggerCue

    public void triggerCue(long handle)

    Specified by:
    :   `triggerCue` in interface `zombie.interfaces.ICommonSoundEmitter`
  + ### stopSound

    public int stopSound(long eventInstance)

    Specified by:
    :   `stopSound` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `stopSound` in class `BaseCharacterSoundEmitter`
  + ### stopSoundDelayRelease

    public int stopSoundDelayRelease(long eventInstance)

    Specified by:
    :   `stopSoundDelayRelease` in class `BaseCharacterSoundEmitter`
  + ### stopSoundLocal

    public void stopSoundLocal(long handle)

    Specified by:
    :   `stopSoundLocal` in class `BaseCharacterSoundEmitter`
  + ### stopOrTriggerSound

    public void stopOrTriggerSound(long eventInstance)

    Specified by:
    :   `stopOrTriggerSound` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `stopOrTriggerSound` in class `BaseCharacterSoundEmitter`
  + ### stopOrTriggerSoundLocal

    public void stopOrTriggerSoundLocal(long eventInstance)

    Specified by:
    :   `stopOrTriggerSoundLocal` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `stopOrTriggerSoundLocal` in class `BaseCharacterSoundEmitter`
  + ### stopOrTriggerSoundByName

    public void stopOrTriggerSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `stopOrTriggerSoundByName` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `stopOrTriggerSoundByName` in class `BaseCharacterSoundEmitter`
  + ### stopAll

    public void stopAll()

    Specified by:
    :   `stopAll` in class `BaseCharacterSoundEmitter`
  + ### stopSoundByName

    public int stopSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName)

    Specified by:
    :   `stopSoundByName` in class `BaseCharacterSoundEmitter`
  + ### hasSoundsToStart

    public boolean hasSoundsToStart()

    Specified by:
    :   `hasSoundsToStart` in class `BaseCharacterSoundEmitter`
  + ### isPlaying

    public boolean isPlaying(long eventInstance)

    Specified by:
    :   `isPlaying` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `isPlaying` in class `BaseCharacterSoundEmitter`
  + ### isPlaying

    public boolean isPlaying([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)

    Specified by:
    :   `isPlaying` in interface `zombie.interfaces.ICommonSoundEmitter`

    Specified by:
    :   `isPlaying` in class `BaseCharacterSoundEmitter`
  + ### setParameterValue

    public void setParameterValue(long soundRef,
    fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription,
    float value)

    Specified by:
    :   `setParameterValue` in class `BaseCharacterSoundEmitter`
  + ### setParameterValueByName

    public void setParameterValueByName(long soundRef,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName,
    float value)

    Specified by:
    :   `setParameterValueByName` in class `BaseCharacterSoundEmitter`