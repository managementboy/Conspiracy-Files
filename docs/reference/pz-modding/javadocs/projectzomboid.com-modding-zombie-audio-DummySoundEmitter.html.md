[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [DummySoundEmitter](DummySoundEmitter.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [DummySoundEmitter()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [randomStart()](#randomStart())
   2. [setPos(float, float, float)](#setPos(float,float,float))
   3. [stopSound(long)](#stopSound(long))
   4. [stopSoundDelayRelease(long)](#stopSoundDelayRelease(long))
   5. [stopSoundLocal(long)](#stopSoundLocal(long))
   6. [stopOrTriggerSoundLocal(long)](#stopOrTriggerSoundLocal(long))
   7. [stopSoundByName(String)](#stopSoundByName(java.lang.String))
   8. [stopOrTriggerSound(long)](#stopOrTriggerSound(long))
   9. [stopOrTriggerSoundByName(String)](#stopOrTriggerSoundByName(java.lang.String))
   10. [setVolume(long, float)](#setVolume(long,float))
   11. [setPitch(long, float)](#setPitch(long,float))
   12. [hasSustainPoints(long)](#hasSustainPoints(long))
   13. [setParameterValue(long, FMOD\_STUDIO\_PARAMETER\_DESCRIPTION, float)](#setParameterValue(long,fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION,float))
   14. [setParameterValueByName(long, String, float)](#setParameterValueByName(long,java.lang.String,float))
   15. [isUsingParameter(long, String)](#isUsingParameter(long,java.lang.String))
   16. [setTimelinePosition(long, String)](#setTimelinePosition(long,java.lang.String))
   17. [triggerCue(long)](#triggerCue(long))
   18. [set3D(long, boolean)](#set3D(long,boolean))
   19. [setVolumeAll(float)](#setVolumeAll(float))
   20. [stopAll()](#stopAll())
   21. [playSound(String)](#playSound(java.lang.String))
   22. [playSound(String, IsoGameCharacter)](#playSound(java.lang.String,zombie.characters.IsoGameCharacter))
   23. [playSound(String, int, int, int)](#playSound(java.lang.String,int,int,int))
   24. [playSound(String, IsoGridSquare)](#playSound(java.lang.String,zombie.iso.IsoGridSquare))
   25. [playSoundImpl(String, IsoGridSquare)](#playSoundImpl(java.lang.String,zombie.iso.IsoGridSquare))
   26. [playSound(String, boolean)](#playSound(java.lang.String,boolean))
   27. [playSoundImpl(String, boolean, IsoObject)](#playSoundImpl(java.lang.String,boolean,zombie.iso.IsoObject))
   28. [playSound(String, IsoObject)](#playSound(java.lang.String,zombie.iso.IsoObject))
   29. [playSoundImpl(String, IsoObject)](#playSoundImpl(java.lang.String,zombie.iso.IsoObject))
   30. [playClip(GameSoundClip, IsoObject)](#playClip(zombie.audio.GameSoundClip,zombie.iso.IsoObject))
   31. [playAmbientSound(String)](#playAmbientSound(java.lang.String))
   32. [tick()](#tick())
   33. [hasSoundsToStart()](#hasSoundsToStart())
   34. [isEmpty()](#isEmpty())
   35. [isPlaying(long)](#isPlaying(long))
   36. [isPlaying(String)](#isPlaying(java.lang.String))
   37. [restart(long)](#restart(long))
   38. [setPlayRemoteEvents(boolean)](#setPlayRemoteEvents(boolean))
   39. [playSoundLooped(String)](#playSoundLooped(java.lang.String))
   40. [playSoundLoopedImpl(String)](#playSoundLoopedImpl(java.lang.String))
   41. [playAmbientLoopedImpl(String)](#playAmbientLoopedImpl(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DummySoundEmitter
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.audio.BaseSoundEmitter](BaseSoundEmitter.html "class in zombie.audio")

zombie.audio.DummySoundEmitter

---

public class DummySoundEmitter
extends [BaseSoundEmitter](BaseSoundEmitter.html "class in zombie.audio")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DummySoundEmitter()`
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

  `isEmpty()`

  `boolean`

  `isPlaying(long channel)`

  `boolean`

  `isPlaying(String alias)`

  `boolean`

  `isUsingParameter(long handle,
  String parameterName)`

  `long`

  `playAmbientLoopedImpl(String file)`

  `long`

  `playAmbientSound(String name)`

  `long`

  `playClip(GameSoundClip clip,
  IsoObject parent)`

  `long`

  `playSound(String file)`

  `long`

  `playSound(String file,
  boolean doWorldSound)`

  `long`

  `playSound(String file,
  int x,
  int y,
  int z)`

  `long`

  `playSound(String file,
  IsoGameCharacter character)`

  `long`

  `playSound(String file,
  IsoGridSquare square)`

  `long`

  `playSound(String file,
  IsoObject parent)`

  `long`

  `playSoundImpl(String file,
  boolean doWorldSound,
  IsoObject parent)`

  `long`

  `playSoundImpl(String file,
  IsoGridSquare square)`

  `long`

  `playSoundImpl(String file,
  IsoObject parent)`

  `long`

  `playSoundLooped(String file)`

  `long`

  `playSoundLoopedImpl(String file)`

  `void`

  `randomStart()`

  `boolean`

  `restart(long handle)`

  `void`

  `set3D(long handle,
  boolean is3D)`

  `void`

  `setParameterValue(long handle,
  fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription,
  float value)`

  `void`

  `setParameterValueByName(long handle,
  String parameterName,
  float value)`

  `void`

  `setPitch(long handle,
  float volume)`

  `void`

  `setPlayRemoteEvents(boolean remote)`

  `void`

  `setPos(float x,
  float y,
  float z)`

  `void`

  `setTimelinePosition(long handle,
  String positionName)`

  `void`

  `setVolume(long handle,
  float volume)`

  `void`

  `setVolumeAll(float volume)`

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

  `stopSoundByName(String name)`

  `int`

  `stopSoundDelayRelease(long channel)`

  `void`

  `stopSoundLocal(long handle)`

  `void`

  `tick()`

  `void`

  `triggerCue(long handle)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### DummySoundEmitter

    public DummySoundEmitter()
* Method Details
  --------------

  + ### randomStart

    public void randomStart()

    Specified by:
    :   `randomStart` in class `BaseSoundEmitter`
  + ### setPos

    public void setPos(float x,
    float y,
    float z)

    Specified by:
    :   `setPos` in class `BaseSoundEmitter`
  + ### stopSound

    public int stopSound(long channel)

    Specified by:
    :   `stopSound` in class `BaseSoundEmitter`
  + ### stopSoundDelayRelease

    public int stopSoundDelayRelease(long channel)

    Specified by:
    :   `stopSoundDelayRelease` in class `BaseSoundEmitter`
  + ### stopSoundLocal

    public void stopSoundLocal(long handle)

    Specified by:
    :   `stopSoundLocal` in class `BaseSoundEmitter`
  + ### stopOrTriggerSoundLocal

    public void stopOrTriggerSoundLocal(long handle)

    Specified by:
    :   `stopOrTriggerSoundLocal` in class `BaseSoundEmitter`
  + ### stopSoundByName

    public int stopSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `stopSoundByName` in class `BaseSoundEmitter`
  + ### stopOrTriggerSound

    public void stopOrTriggerSound(long handle)

    Specified by:
    :   `stopOrTriggerSound` in class `BaseSoundEmitter`
  + ### stopOrTriggerSoundByName

    public void stopOrTriggerSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `stopOrTriggerSoundByName` in class `BaseSoundEmitter`
  + ### setVolume

    public void setVolume(long handle,
    float volume)

    Specified by:
    :   `setVolume` in class `BaseSoundEmitter`
  + ### setPitch

    public void setPitch(long handle,
    float volume)

    Specified by:
    :   `setPitch` in class `BaseSoundEmitter`
  + ### hasSustainPoints

    public boolean hasSustainPoints(long handle)

    Specified by:
    :   `hasSustainPoints` in class `BaseSoundEmitter`
  + ### setParameterValue

    public void setParameterValue(long handle,
    fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription,
    float value)

    Specified by:
    :   `setParameterValue` in class `BaseSoundEmitter`
  + ### setParameterValueByName

    public void setParameterValueByName(long handle,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName,
    float value)

    Specified by:
    :   `setParameterValueByName` in class `BaseSoundEmitter`
  + ### isUsingParameter

    public boolean isUsingParameter(long handle,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName)

    Specified by:
    :   `isUsingParameter` in class `BaseSoundEmitter`
  + ### setTimelinePosition

    public void setTimelinePosition(long handle,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") positionName)

    Specified by:
    :   `setTimelinePosition` in class `BaseSoundEmitter`
  + ### triggerCue

    public void triggerCue(long handle)

    Specified by:
    :   `triggerCue` in class `BaseSoundEmitter`
  + ### set3D

    public void set3D(long handle,
    boolean is3D)

    Specified by:
    :   `set3D` in class `BaseSoundEmitter`
  + ### setVolumeAll

    public void setVolumeAll(float volume)

    Specified by:
    :   `setVolumeAll` in class `BaseSoundEmitter`
  + ### stopAll

    public void stopAll()

    Specified by:
    :   `stopAll` in class `BaseSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playSound` in class `BaseSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)

    Specified by:
    :   `playSound` in class `BaseSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    int x,
    int y,
    int z)

    Specified by:
    :   `playSound` in class `BaseSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)

    Specified by:
    :   `playSound` in class `BaseSoundEmitter`
  + ### playSoundImpl

    public long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)

    Specified by:
    :   `playSoundImpl` in class `BaseSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    boolean doWorldSound)

    Specified by:
    :   `playSound` in class `BaseSoundEmitter`
  + ### playSoundImpl

    public long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    boolean doWorldSound,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)

    Specified by:
    :   `playSoundImpl` in class `BaseSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)

    Specified by:
    :   `playSound` in class `BaseSoundEmitter`
  + ### playSoundImpl

    public long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)

    Specified by:
    :   `playSoundImpl` in class `BaseSoundEmitter`
  + ### playClip

    public long playClip([GameSoundClip](GameSoundClip.html "class in zombie.audio") clip,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)

    Specified by:
    :   `playClip` in class `BaseSoundEmitter`
  + ### playAmbientSound

    public long playAmbientSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `playAmbientSound` in class `BaseSoundEmitter`
  + ### tick

    public void tick()

    Specified by:
    :   `tick` in class `BaseSoundEmitter`
  + ### hasSoundsToStart

    public boolean hasSoundsToStart()

    Specified by:
    :   `hasSoundsToStart` in class `BaseSoundEmitter`
  + ### isEmpty

    public boolean isEmpty()

    Specified by:
    :   `isEmpty` in class `BaseSoundEmitter`
  + ### isPlaying

    public boolean isPlaying(long channel)

    Specified by:
    :   `isPlaying` in class `BaseSoundEmitter`
  + ### isPlaying

    public boolean isPlaying([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)

    Specified by:
    :   `isPlaying` in class `BaseSoundEmitter`
  + ### restart

    public boolean restart(long handle)

    Specified by:
    :   `restart` in class `BaseSoundEmitter`
  + ### setPlayRemoteEvents

    public void setPlayRemoteEvents(boolean remote)

    Specified by:
    :   `setPlayRemoteEvents` in class `BaseSoundEmitter`
  + ### playSoundLooped

    public long playSoundLooped([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playSoundLooped` in class `BaseSoundEmitter`
  + ### playSoundLoopedImpl

    public long playSoundLoopedImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playSoundLoopedImpl` in class `BaseSoundEmitter`
  + ### playAmbientLoopedImpl

    public long playAmbientLoopedImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playAmbientLoopedImpl` in class `BaseSoundEmitter`