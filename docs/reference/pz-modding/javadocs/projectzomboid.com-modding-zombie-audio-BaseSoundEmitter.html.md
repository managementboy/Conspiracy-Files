[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [BaseSoundEmitter](BaseSoundEmitter.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [BaseSoundEmitter()](#%3Cinit%3E())
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
   18. [setVolumeAll(float)](#setVolumeAll(float))
   19. [stopAll()](#stopAll())
   20. [playSound(String)](#playSound(java.lang.String))
   21. [playSound(String, IsoGameCharacter)](#playSound(java.lang.String,zombie.characters.IsoGameCharacter))
   22. [playSound(String, int, int, int)](#playSound(java.lang.String,int,int,int))
   23. [playSound(String, IsoGridSquare)](#playSound(java.lang.String,zombie.iso.IsoGridSquare))
   24. [playSoundImpl(String, IsoGridSquare)](#playSoundImpl(java.lang.String,zombie.iso.IsoGridSquare))
   25. [playSound(String, boolean)](#playSound(java.lang.String,boolean))
   26. [playSoundImpl(String, boolean, IsoObject)](#playSoundImpl(java.lang.String,boolean,zombie.iso.IsoObject))
   27. [playSoundLooped(String)](#playSoundLooped(java.lang.String))
   28. [playSoundLoopedImpl(String)](#playSoundLoopedImpl(java.lang.String))
   29. [playSound(String, IsoObject)](#playSound(java.lang.String,zombie.iso.IsoObject))
   30. [playSoundImpl(String, IsoObject)](#playSoundImpl(java.lang.String,zombie.iso.IsoObject))
   31. [playClip(GameSoundClip, IsoObject)](#playClip(zombie.audio.GameSoundClip,zombie.iso.IsoObject))
   32. [playAmbientSound(String)](#playAmbientSound(java.lang.String))
   33. [playAmbientLoopedImpl(String)](#playAmbientLoopedImpl(java.lang.String))
   34. [set3D(long, boolean)](#set3D(long,boolean))
   35. [tick()](#tick())
   36. [hasSoundsToStart()](#hasSoundsToStart())
   37. [isEmpty()](#isEmpty())
   38. [isPlaying(long)](#isPlaying(long))
   39. [isPlaying(String)](#isPlaying(java.lang.String))
   40. [restart(long)](#restart(long))
   41. [setPlayRemoteEvents(boolean)](#setPlayRemoteEvents(boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseSoundEmitter
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.BaseSoundEmitter

Direct Known Subclasses:
:   `DummySoundEmitter, FMODSoundEmitter`

---

public abstract class BaseSoundEmitter
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BaseSoundEmitter()`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `abstract boolean`

  `hasSoundsToStart()`

  `abstract boolean`

  `hasSustainPoints(long handle)`

  `abstract boolean`

  `isEmpty()`

  `abstract boolean`

  `isPlaying(long channel)`

  `abstract boolean`

  `isPlaying(String alias)`

  `abstract boolean`

  `isUsingParameter(long handle,
  String parameterName)`

  `abstract long`

  `playAmbientLoopedImpl(String file)`

  `abstract long`

  `playAmbientSound(String name)`

  `abstract long`

  `playClip(GameSoundClip clip,
  IsoObject parent)`

  `abstract long`

  `playSound(String file)`

  `abstract long`

  `playSound(String file,
  boolean doWorldSound)`

  Deprecated.

  `abstract long`

  `playSound(String file,
  int x,
  int y,
  int z)`

  `abstract long`

  `playSound(String file,
  IsoGameCharacter character)`

  `abstract long`

  `playSound(String file,
  IsoGridSquare square)`

  `abstract long`

  `playSound(String file,
  IsoObject parent)`

  `abstract long`

  `playSoundImpl(String file,
  boolean doWorldSound,
  IsoObject parent)`

  Deprecated.

  `abstract long`

  `playSoundImpl(String file,
  IsoGridSquare square)`

  `abstract long`

  `playSoundImpl(String file,
  IsoObject parent)`

  `abstract long`

  `playSoundLooped(String file)`

  `abstract long`

  `playSoundLoopedImpl(String file)`

  `abstract void`

  `randomStart()`

  `abstract boolean`

  `restart(long handle)`

  `abstract void`

  `set3D(long handle,
  boolean is3D)`

  `abstract void`

  `setParameterValue(long handle,
  fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription,
  float value)`

  `abstract void`

  `setParameterValueByName(long handle,
  String parameterName,
  float value)`

  `abstract void`

  `setPitch(long handle,
  float pitch)`

  `abstract void`

  `setPlayRemoteEvents(boolean remote)`

  `abstract void`

  `setPos(float x,
  float y,
  float z)`

  `abstract void`

  `setTimelinePosition(long handle,
  String positionName)`

  `abstract void`

  `setVolume(long handle,
  float volume)`

  `abstract void`

  `setVolumeAll(float volume)`

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

  `stopSoundByName(String name)`

  `abstract int`

  `stopSoundDelayRelease(long channel)`

  `abstract void`

  `stopSoundLocal(long handle)`

  `abstract void`

  `tick()`

  `abstract void`

  `triggerCue(long handle)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### BaseSoundEmitter

    public BaseSoundEmitter()
* Method Details
  --------------

  + ### randomStart

    public abstract void randomStart()
  + ### setPos

    public abstract void setPos(float x,
    float y,
    float z)
  + ### stopSound

    public abstract int stopSound(long channel)
  + ### stopSoundDelayRelease

    public abstract int stopSoundDelayRelease(long channel)
  + ### stopSoundLocal

    public abstract void stopSoundLocal(long handle)
  + ### stopOrTriggerSoundLocal

    public abstract void stopOrTriggerSoundLocal(long handle)
  + ### stopSoundByName

    public abstract int stopSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### stopOrTriggerSound

    public abstract void stopOrTriggerSound(long handle)
  + ### stopOrTriggerSoundByName

    public abstract void stopOrTriggerSoundByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setVolume

    public abstract void setVolume(long handle,
    float volume)
  + ### setPitch

    public abstract void setPitch(long handle,
    float pitch)
  + ### hasSustainPoints

    public abstract boolean hasSustainPoints(long handle)
  + ### setParameterValue

    public abstract void setParameterValue(long handle,
    fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription,
    float value)
  + ### setParameterValueByName

    public abstract void setParameterValueByName(long handle,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName,
    float value)
  + ### isUsingParameter

    public abstract boolean isUsingParameter(long handle,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName)
  + ### setTimelinePosition

    public abstract void setTimelinePosition(long handle,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") positionName)
  + ### triggerCue

    public abstract void triggerCue(long handle)
  + ### setVolumeAll

    public abstract void setVolumeAll(float volume)
  + ### stopAll

    public abstract void stopAll()
  + ### playSound

    public abstract long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### playSound

    public abstract long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### playSound

    public abstract long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    int x,
    int y,
    int z)
  + ### playSound

    public abstract long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### playSoundImpl

    public abstract long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### playSound

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public abstract long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    boolean doWorldSound)

    Deprecated.
  + ### playSoundImpl

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public abstract long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    boolean doWorldSound,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)

    Deprecated.
  + ### playSoundLooped

    public abstract long playSoundLooped([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### playSoundLoopedImpl

    public abstract long playSoundLoopedImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### playSound

    public abstract long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)
  + ### playSoundImpl

    public abstract long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)
  + ### playClip

    public abstract long playClip([GameSoundClip](GameSoundClip.html "class in zombie.audio") clip,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)
  + ### playAmbientSound

    public abstract long playAmbientSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### playAmbientLoopedImpl

    public abstract long playAmbientLoopedImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### set3D

    public abstract void set3D(long handle,
    boolean is3D)
  + ### tick

    public abstract void tick()
  + ### hasSoundsToStart

    public abstract boolean hasSoundsToStart()
  + ### isEmpty

    public abstract boolean isEmpty()
  + ### isPlaying

    public abstract boolean isPlaying(long channel)
  + ### isPlaying

    public abstract boolean isPlaying([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)
  + ### restart

    public abstract boolean restart(long handle)
  + ### setPlayRemoteEvents

    public abstract void setPlayRemoteEvents(boolean remote)