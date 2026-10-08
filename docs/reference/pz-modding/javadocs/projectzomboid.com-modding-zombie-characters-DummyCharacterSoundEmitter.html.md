[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [DummyCharacterSoundEmitter](DummyCharacterSoundEmitter.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [z](#z)
   4. [sounds](#sounds)
6. [Constructor Details](#constructor-detail)
   1. [DummyCharacterSoundEmitter(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
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
   17. [stopOrTriggerSound(long)](#stopOrTriggerSound(long))
   18. [stopOrTriggerSoundByName(String)](#stopOrTriggerSoundByName(java.lang.String))
   19. [stopAll()](#stopAll())
   20. [stopSoundByName(String)](#stopSoundByName(java.lang.String))
   21. [hasSoundsToStart()](#hasSoundsToStart())
   22. [isPlaying(long)](#isPlaying(long))
   23. [isPlaying(String)](#isPlaying(java.lang.String))
   24. [setParameterValue(long, FMOD\_STUDIO\_PARAMETER\_DESCRIPTION, float)](#setParameterValue(long,fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION,float))
   25. [setParameterValueByName(long, String, float)](#setParameterValueByName(long,java.lang.String,float))
   26. [hasSustainPoints(long)](#hasSustainPoints(long))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DummyCharacterSoundEmitter
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html "class in zombie.characters")

zombie.characters.DummyCharacterSoundEmitter

---

public final class DummyCharacterSoundEmitter
extends [BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html "class in zombie.characters")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashMap<Long,String>`

  `sounds`

  `float`

  `x`

  `float`

  `y`

  `float`

  `z`

  ### Fields inherited from class [BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html#field-summary "class in zombie.characters")

  `character`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DummyCharacterSoundEmitter(IsoGameCharacter chr)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `hasSoundsToStart()`

  `boolean`

  `hasSustainPoints(long handle)`

  `boolean`

  `isClear()`

  `boolean`

  `isPlaying(long channel)`

  `boolean`

  `isPlaying(String alias)`

  `void`

  `playFootsteps(String file,
  float volume)`

  `long`

  `playSound(String file)`

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

  `setVolume(long handle,
  float volume)`

  `void`

  `stopAll()`

  `void`

  `stopOrTriggerSound(long handle)`

  `void`

  `stopOrTriggerSoundByName(String name)`

  `void`

  `stopOrTriggerSoundLocal(long handle)`

  `int`

  `stopSound(long channel)`

  `int`

  `stopSoundByName(String soundName)`

  `int`

  `stopSoundDelayRelease(long channel)`

  `void`

  `stopSoundLocal(long handle)`

  `void`

  `tick()`

  `void`

  `unregister()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    public float x
  + ### y

    public float y
  + ### z

    public float z
  + ### sounds

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> sounds
* Constructor Details
  -------------------

  + ### DummyCharacterSoundEmitter

    public DummyCharacterSoundEmitter([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr)
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
  + ### playFootsteps

    public void playFootsteps([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    float volume)

    Specified by:
    :   `playFootsteps` in class `BaseCharacterSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playSound` in class `BaseCharacterSoundEmitter`
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
    :   `tick` in class `BaseCharacterSoundEmitter`
  + ### set

    public void set(float x,
    float y,
    float z)

    Specified by:
    :   `set` in class `BaseCharacterSoundEmitter`
  + ### isClear

    public boolean isClear()

    Specified by:
    :   `isClear` in class `BaseCharacterSoundEmitter`
  + ### setPitch

    public void setPitch(long handle,
    float pitch)

    Specified by:
    :   `setPitch` in class `BaseCharacterSoundEmitter`
  + ### setVolume

    public void setVolume(long handle,
    float volume)

    Specified by:
    :   `setVolume` in class `BaseCharacterSoundEmitter`
  + ### stopSound

    public int stopSound(long channel)

    Specified by:
    :   `stopSound` in class `BaseCharacterSoundEmitter`
  + ### stopSoundDelayRelease

    public int stopSoundDelayRelease(long channel)

    Specified by:
    :   `stopSoundDelayRelease` in class `BaseCharacterSoundEmitter`
  + ### stopSoundLocal

    public void stopSoundLocal(long handle)

    Specified by:
    :   `stopSoundLocal` in class `BaseCharacterSoundEmitter`
  + ### stopOrTriggerSoundLocal

    public void stopOrTriggerSoundLocal(long handle)

    Specified by:
    :   `stopOrTriggerSoundLocal` in class `BaseCharacterSoundEmitter`
  + ### stopOrTriggerSound

    public void stopOrTriggerSound(long handle)

    Specified by:
    :   `stopOrTriggerSound` in class `BaseCharacterSoundEmitter`
  + ### stopOrTriggerSoundByName

    public void stopOrTriggerSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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

    public boolean isPlaying(long channel)

    Specified by:
    :   `isPlaying` in class `BaseCharacterSoundEmitter`
  + ### isPlaying

    public boolean isPlaying([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)

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
  + ### hasSustainPoints

    public boolean hasSustainPoints(long handle)