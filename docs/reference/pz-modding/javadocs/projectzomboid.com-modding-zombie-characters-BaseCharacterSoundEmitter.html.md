[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [character](#character)
6. [Constructor Details](#constructor-detail)
   1. [BaseCharacterSoundEmitter(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
7. [Method Details](#method-detail)
   1. [register()](#register())
   2. [unregister()](#unregister())
   3. [playVocals(String)](#playVocals(java.lang.String))
   4. [playFootsteps(String, float)](#playFootsteps(java.lang.String,float))
   5. [playSound(String)](#playSound(java.lang.String))
   6. [playSound(String, IsoObject)](#playSound(java.lang.String,zombie.iso.IsoObject))
   7. [playSoundImpl(String, IsoObject)](#playSoundImpl(java.lang.String,zombie.iso.IsoObject))
   8. [tick()](#tick())
   9. [set(float, float, float)](#set(float,float,float))
   10. [isClear()](#isClear())
   11. [setPitch(long, float)](#setPitch(long,float))
   12. [setVolume(long, float)](#setVolume(long,float))
   13. [stopSound(long)](#stopSound(long))
   14. [stopSoundDelayRelease(long)](#stopSoundDelayRelease(long))
   15. [stopSoundLocal(long)](#stopSoundLocal(long))
   16. [stopOrTriggerSoundLocal(long)](#stopOrTriggerSoundLocal(long))
   17. [stopSoundByName(String)](#stopSoundByName(java.lang.String))
   18. [stopOrTriggerSound(long)](#stopOrTriggerSound(long))
   19. [stopOrTriggerSoundByName(String)](#stopOrTriggerSoundByName(java.lang.String))
   20. [stopAll()](#stopAll())
   21. [hasSoundsToStart()](#hasSoundsToStart())
   22. [isPlaying(long)](#isPlaying(long))
   23. [isPlaying(String)](#isPlaying(java.lang.String))
   24. [setParameterValue(long, FMOD\_STUDIO\_PARAMETER\_DESCRIPTION, float)](#setParameterValue(long,fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION,float))
   25. [setParameterValueByName(long, String, float)](#setParameterValueByName(long,java.lang.String,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseCharacterSoundEmitter
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BaseCharacterSoundEmitter

Direct Known Subclasses:
:   `CharacterSoundEmitter, DummyCharacterSoundEmitter`

---

public abstract class BaseCharacterSoundEmitter
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final IsoGameCharacter`

  `character`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BaseCharacterSoundEmitter(IsoGameCharacter chr)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `abstract boolean`

  `hasSoundsToStart()`

  `abstract boolean`

  `isClear()`

  `abstract boolean`

  `isPlaying(long channel)`

  `abstract boolean`

  `isPlaying(String alias)`

  `abstract void`

  `playFootsteps(String file,
  float volume)`

  `abstract long`

  `playSound(String file)`

  `abstract long`

  `playSound(String file,
  IsoObject proxy)`

  `abstract long`

  `playSoundImpl(String file,
  IsoObject proxy)`

  `abstract long`

  `playVocals(String file)`

  `abstract void`

  `register()`

  `abstract void`

  `set(float x,
  float y,
  float z)`

  `abstract void`

  `setParameterValue(long soundRef,
  fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription,
  float value)`

  `abstract void`

  `setParameterValueByName(long soundRef,
  String parameterName,
  float value)`

  `abstract void`

  `setPitch(long handle,
  float pitch)`

  `abstract void`

  `setVolume(long handle,
  float volume)`

  `abstract void`

  `stopAll()`

  `abstract void`

  `stopOrTriggerSound(long handle)`

  `abstract void`

  `stopOrTriggerSoundByName(String name)`

  `abstract void`

  `stopOrTriggerSoundLocal(long handle)`

  `abstract int`

  `stopSound(long channel)`

  `abstract int`

  `stopSoundByName(String soundName)`

  `abstract int`

  `stopSoundDelayRelease(long channel)`

  `abstract void`

  `stopSoundLocal(long handle)`

  `abstract void`

  `tick()`

  `abstract void`

  `unregister()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### character

    protected final [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") character
* Constructor Details
  -------------------

  + ### BaseCharacterSoundEmitter

    public BaseCharacterSoundEmitter([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr)
* Method Details
  --------------

  + ### register

    public abstract void register()
  + ### unregister

    public abstract void unregister()
  + ### playVocals

    public abstract long playVocals([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### playFootsteps

    public abstract void playFootsteps([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    float volume)
  + ### playSound

    public abstract long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### playSound

    public abstract long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") proxy)
  + ### playSoundImpl

    public abstract long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") proxy)
  + ### tick

    public abstract void tick()
  + ### set

    public abstract void set(float x,
    float y,
    float z)
  + ### isClear

    public abstract boolean isClear()
  + ### setPitch

    public abstract void setPitch(long handle,
    float pitch)
  + ### setVolume

    public abstract void setVolume(long handle,
    float volume)
  + ### stopSound

    public abstract int stopSound(long channel)
  + ### stopSoundDelayRelease

    public abstract int stopSoundDelayRelease(long channel)
  + ### stopSoundLocal

    public abstract void stopSoundLocal(long handle)
  + ### stopOrTriggerSoundLocal

    public abstract void stopOrTriggerSoundLocal(long handle)
  + ### stopSoundByName

    public abstract int stopSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName)
  + ### stopOrTriggerSound

    public abstract void stopOrTriggerSound(long handle)
  + ### stopOrTriggerSoundByName

    public abstract void stopOrTriggerSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### stopAll

    public abstract void stopAll()
  + ### hasSoundsToStart

    public abstract boolean hasSoundsToStart()
  + ### isPlaying

    public abstract boolean isPlaying(long channel)
  + ### isPlaying

    public abstract boolean isPlaying([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)
  + ### setParameterValue

    public abstract void setParameterValue(long soundRef,
    fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription,
    float value)
  + ### setParameterValueByName

    public abstract void setParameterValueByName(long soundRef,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName,
    float value)