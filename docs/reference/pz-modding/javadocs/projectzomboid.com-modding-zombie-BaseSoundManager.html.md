[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [BaseSoundManager](BaseSoundManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [allowMusic](#allowMusic)
6. [Constructor Details](#constructor-detail)
   1. [BaseSoundManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isRemastered()](#isRemastered())
   2. [update1()](#update1())
   3. [update3()](#update3())
   4. [update2()](#update2())
   5. [update4()](#update4())
   6. [CacheSound(String)](#CacheSound(java.lang.String))
   7. [StopSound(Audio)](#StopSound(fmod.fmod.Audio))
   8. [StopMusic()](#StopMusic())
   9. [Purge()](#Purge())
   10. [stop()](#stop())
   11. [HasMusic(Audio)](#HasMusic(fmod.fmod.Audio))
   12. [Update()](#Update())
   13. [Start(Audio, float, String)](#Start(fmod.fmod.Audio,float,java.lang.String))
   14. [PrepareMusic(String)](#PrepareMusic(java.lang.String))
   15. [PlayWorldSoundWav(String, IsoGridSquare, float, float, float, int, boolean)](#PlayWorldSoundWav(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,int,boolean))
   16. [PlayWorldSoundWav(String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundWav(java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   17. [PlayWorldSoundWav(String, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundWav(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,boolean))
   18. [PlayWorldSound(String, IsoGridSquare, float, float, float, int, boolean)](#PlayWorldSound(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,int,boolean))
   19. [PlayWorldSound(String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSound(java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   20. [PlayWorldSoundImpl(String, boolean, int, int, int, float, float, float, boolean)](#PlayWorldSoundImpl(java.lang.String,boolean,int,int,int,float,float,float,boolean))
   21. [PlayWorldSound(String, IsoGridSquare, float, float, float, boolean)](#PlayWorldSound(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,boolean))
   22. [update3D()](#update3D())
   23. [PlaySoundWav(String, int, boolean, float)](#PlaySoundWav(java.lang.String,int,boolean,float))
   24. [PlaySoundWav(String, boolean, float)](#PlaySoundWav(java.lang.String,boolean,float))
   25. [PlaySoundWav(String, boolean, float, float)](#PlaySoundWav(java.lang.String,boolean,float,float))
   26. [PlayWorldSoundWavImpl(String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundWavImpl(java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   27. [PlayJukeboxSound(String, boolean, float)](#PlayJukeboxSound(java.lang.String,boolean,float))
   28. [PlaySoundEvenSilent(String, boolean, float)](#PlaySoundEvenSilent(java.lang.String,boolean,float))
   29. [PlaySound(String, boolean, float)](#PlaySound(java.lang.String,boolean,float))
   30. [PlaySound(String, boolean, float, float)](#PlaySound(java.lang.String,boolean,float,float))
   31. [PlayMusic(String, String, boolean, float)](#PlayMusic(java.lang.String,java.lang.String,boolean,float))
   32. [PlayAsMusic(String, Audio, boolean, float)](#PlayAsMusic(java.lang.String,fmod.fmod.Audio,boolean,float))
   33. [setMusicState(String)](#setMusicState(java.lang.String))
   34. [setMusicWakeState(IsoPlayer, String)](#setMusicWakeState(zombie.characters.IsoPlayer,java.lang.String))
   35. [DoMusic(String, boolean)](#DoMusic(java.lang.String,boolean))
   36. [getMusicPosition()](#getMusicPosition())
   37. [CheckDoMusic()](#CheckDoMusic())
   38. [stopMusic(String)](#stopMusic(java.lang.String))
   39. [playMusicNonTriggered(String, float)](#playMusicNonTriggered(java.lang.String,float))
   40. [playAmbient(String)](#playAmbient(java.lang.String))
   41. [playMusic(String)](#playMusic(java.lang.String))
   42. [isPlayingMusic()](#isPlayingMusic())
   43. [IsMusicPlaying()](#IsMusicPlaying())
   44. [getCurrentMusicName()](#getCurrentMusicName())
   45. [getCurrentMusicLibrary()](#getCurrentMusicLibrary())
   46. [PlayAsMusic(String, Audio, float, boolean)](#PlayAsMusic(java.lang.String,fmod.fmod.Audio,float,boolean))
   47. [playUISound(String)](#playUISound(java.lang.String))
   48. [isPlayingUISound(String)](#isPlayingUISound(java.lang.String))
   49. [isPlayingUISound(long)](#isPlayingUISound(long))
   50. [stopUISound(long)](#stopUISound(long))
   51. [FadeOutMusic(String, int)](#FadeOutMusic(java.lang.String,int))
   52. [BlendThenStart(Audio, float, String)](#BlendThenStart(fmod.fmod.Audio,float,java.lang.String))
   53. [BlendVolume(Audio, float, float)](#BlendVolume(fmod.fmod.Audio,float,float))
   54. [BlendVolume(Audio, float)](#BlendVolume(fmod.fmod.Audio,float))
   55. [setSoundVolume(float)](#setSoundVolume(float))
   56. [getSoundVolume()](#getSoundVolume())
   57. [setAmbientVolume(float)](#setAmbientVolume(float))
   58. [getAmbientVolume()](#getAmbientVolume())
   59. [setMusicVolume(float)](#setMusicVolume(float))
   60. [getMusicVolume()](#getMusicVolume())
   61. [setVehicleEngineVolume(float)](#setVehicleEngineVolume(float))
   62. [getVehicleEngineVolume()](#getVehicleEngineVolume())
   63. [playNightAmbient(String)](#playNightAmbient(java.lang.String))
   64. [getAmbientPieces()](#getAmbientPieces())
   65. [pauseSoundAndMusic()](#pauseSoundAndMusic())
   66. [pauseSoundAndMusic(boolean)](#pauseSoundAndMusic(boolean))
   67. [resumeSoundAndMusic()](#resumeSoundAndMusic())
   68. [debugScriptSounds()](#debugScriptSounds())
   69. [registerEmitter(BaseSoundEmitter)](#registerEmitter(zombie.audio.BaseSoundEmitter))
   70. [unregisterEmitter(BaseSoundEmitter)](#unregisterEmitter(zombie.audio.BaseSoundEmitter))
   71. [isListenerInRange(float, float, float)](#isListenerInRange(float,float,float))
   72. [playImpactSound(IsoGridSquare, AmmoType)](#playImpactSound(zombie.iso.IsoGridSquare,zombie.scripting.objects.AmmoType))
   73. [playImpactSound(IsoGridSquare, AmmoType, MaterialType)](#playImpactSound(zombie.iso.IsoGridSquare,zombie.scripting.objects.AmmoType,zombie.iso.enums.MaterialType))
   74. [playDamageSound(IsoGridSquare, MaterialType)](#playDamageSound(zombie.iso.IsoGridSquare,zombie.iso.enums.MaterialType))
   75. [playDestructionSound(IsoGridSquare, MaterialType)](#playDestructionSound(zombie.iso.IsoGridSquare,zombie.iso.enums.MaterialType))
   76. [dumpEventInstancesToTextFile()](#dumpEventInstancesToTextFile())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class BaseSoundManager
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.BaseSoundManager

Direct Known Subclasses:
:   `DummySoundManager, SoundManager`

---

public abstract class BaseSoundManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `allowMusic`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BaseSoundManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `abstract fmod.fmod.Audio`

  `BlendThenStart(fmod.fmod.Audio musicTrack,
  float f,
  String prefMusic)`

  `abstract void`

  `BlendVolume(fmod.fmod.Audio audio,
  float targetVolume)`

  `abstract void`

  `BlendVolume(fmod.fmod.Audio audio,
  float targetVolume,
  float blendSpeedAlpha)`

  `abstract void`

  `CacheSound(String file)`

  `abstract void`

  `CheckDoMusic()`

  `abstract void`

  `debugScriptSounds()`

  `abstract void`

  `DoMusic(String name,
  boolean bLoop)`

  `abstract void`

  `dumpEventInstancesToTextFile()`

  `abstract void`

  `FadeOutMusic(String name,
  int milli)`

  `abstract ArrayList<fmod.fmod.Audio>`

  `getAmbientPieces()`

  `abstract float`

  `getAmbientVolume()`

  `abstract String`

  `getCurrentMusicLibrary()`

  `abstract String`

  `getCurrentMusicName()`

  `abstract float`

  `getMusicPosition()`

  `abstract float`

  `getMusicVolume()`

  `abstract float`

  `getSoundVolume()`

  `abstract float`

  `getVehicleEngineVolume()`

  `protected abstract boolean`

  `HasMusic(fmod.fmod.Audio musicTrack)`

  `abstract boolean`

  `isListenerInRange(float x,
  float y,
  float range)`

  `abstract boolean`

  `IsMusicPlaying()`

  `abstract boolean`

  `isPlayingMusic()`

  `abstract boolean`

  `isPlayingUISound(long eventInstance)`

  `abstract boolean`

  `isPlayingUISound(String name)`

  `abstract boolean`

  `isRemastered()`

  `abstract void`

  `pauseSoundAndMusic()`

  `abstract void`

  `pauseSoundAndMusic(boolean bOptionallyKeepMusicPlaying)`

  `abstract void`

  `playAmbient(String name)`

  `abstract void`

  `PlayAsMusic(String name,
  fmod.fmod.Audio musicTrack,
  boolean loop,
  float volume)`

  `abstract void`

  `PlayAsMusic(String name,
  fmod.fmod.Audio musicTrack,
  float volume,
  boolean bloop)`

  `abstract void`

  `playDamageSound(IsoGridSquare isoGridSquare,
  zombie.iso.enums.MaterialType materialType)`

  `abstract void`

  `playDestructionSound(IsoGridSquare isoGridSquare,
  zombie.iso.enums.MaterialType materialType)`

  `abstract void`

  `playImpactSound(IsoGridSquare isoGridSquare,
  AmmoType ammoType)`

  `abstract void`

  `playImpactSound(IsoGridSquare isoGridSquare,
  AmmoType ammoType,
  zombie.iso.enums.MaterialType materialType)`

  `abstract fmod.fmod.Audio`

  `PlayJukeboxSound(String name,
  boolean loop,
  float maxGain)`

  `abstract void`

  `playMusic(String name)`

  `abstract fmod.fmod.Audio`

  `PlayMusic(String n,
  String name,
  boolean loop,
  float maxGain)`

  `abstract void`

  `playMusicNonTriggered(String name,
  float gain)`

  `abstract void`

  `playNightAmbient(String choice)`

  `abstract fmod.fmod.Audio`

  `PlaySound(String name,
  boolean loop,
  float maxGain)`

  `abstract fmod.fmod.Audio`

  `PlaySound(String name,
  boolean loop,
  float pitchVar,
  float maxGain)`

  `abstract fmod.fmod.Audio`

  `PlaySoundEvenSilent(String name,
  boolean loop,
  float maxGain)`

  `abstract fmod.fmod.Audio`

  `PlaySoundWav(String name,
  boolean loop,
  float maxGain)`

  `abstract fmod.fmod.Audio`

  `PlaySoundWav(String name,
  boolean loop,
  float maxGain,
  float pitchVar)`

  `abstract fmod.fmod.Audio`

  `PlaySoundWav(String name,
  int variations,
  boolean loop,
  float maxGain)`

  `abstract long`

  `playUISound(String name)`

  `abstract fmod.fmod.Audio`

  `PlayWorldSound(String name,
  boolean loop,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `abstract fmod.fmod.Audio`

  `PlayWorldSound(String name,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `abstract fmod.fmod.Audio`

  `PlayWorldSound(String name,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  int choices,
  boolean ignoreOutside)`

  `abstract fmod.fmod.Audio`

  `PlayWorldSoundImpl(String name,
  boolean loop,
  int sx,
  int sy,
  int sz,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `abstract fmod.fmod.Audio`

  `PlayWorldSoundWav(String name,
  boolean loop,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `abstract fmod.fmod.Audio`

  `PlayWorldSoundWav(String name,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `abstract void`

  `PlayWorldSoundWav(String name,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  int choices,
  boolean ignoreOutside)`

  `abstract fmod.fmod.Audio`

  `PlayWorldSoundWavImpl(String name,
  boolean loop,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `abstract fmod.fmod.Audio`

  `PrepareMusic(String name)`

  `abstract void`

  `Purge()`

  `abstract void`

  `registerEmitter(BaseSoundEmitter emitter)`

  `abstract void`

  `resumeSoundAndMusic()`

  `abstract void`

  `setAmbientVolume(float volume)`

  `abstract void`

  `setMusicState(String stateName)`

  `abstract void`

  `setMusicVolume(float volume)`

  `abstract void`

  `setMusicWakeState(IsoPlayer player,
  String stateName)`

  `abstract void`

  `setSoundVolume(float volume)`

  `abstract void`

  `setVehicleEngineVolume(float volume)`

  `abstract fmod.fmod.Audio`

  `Start(fmod.fmod.Audio musicTrack,
  float f,
  String prefMusic)`

  `abstract void`

  `stop()`

  `abstract void`

  `stopMusic(String name)`

  `abstract void`

  `StopMusic()`

  `abstract void`

  `StopSound(fmod.fmod.Audio soundEffect)`

  `abstract void`

  `stopUISound(long eventInstance)`

  `abstract void`

  `unregisterEmitter(BaseSoundEmitter emitter)`

  `abstract void`

  `Update()`

  `abstract void`

  `update1()`

  `abstract void`

  `update2()`

  `abstract void`

  `update3()`

  `abstract void`

  `update3D()`

  `abstract void`

  `update4()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### allowMusic

    public boolean allowMusic
* Constructor Details
  -------------------

  + ### BaseSoundManager

    public BaseSoundManager()
* Method Details
  --------------

  + ### isRemastered

    public abstract boolean isRemastered()
  + ### update1

    public abstract void update1()
  + ### update3

    public abstract void update3()
  + ### update2

    public abstract void update2()
  + ### update4

    public abstract void update4()
  + ### CacheSound

    public abstract void CacheSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### StopSound

    public abstract void StopSound(fmod.fmod.Audio soundEffect)
  + ### StopMusic

    public abstract void StopMusic()
  + ### Purge

    public abstract void Purge()
  + ### stop

    public abstract void stop()
  + ### HasMusic

    protected abstract boolean HasMusic(fmod.fmod.Audio musicTrack)
  + ### Update

    public abstract void Update()
  + ### Start

    public abstract fmod.fmod.Audio Start(fmod.fmod.Audio musicTrack,
    float f,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefMusic)
  + ### PrepareMusic

    public abstract fmod.fmod.Audio PrepareMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### PlayWorldSoundWav

    public abstract void PlayWorldSoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    int choices,
    boolean ignoreOutside)
  + ### PlayWorldSoundWav

    public abstract fmod.fmod.Audio PlayWorldSoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)
  + ### PlayWorldSoundWav

    public abstract fmod.fmod.Audio PlayWorldSoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)
  + ### PlayWorldSound

    public abstract fmod.fmod.Audio PlayWorldSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    int choices,
    boolean ignoreOutside)
  + ### PlayWorldSound

    public abstract fmod.fmod.Audio PlayWorldSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)
  + ### PlayWorldSoundImpl

    public abstract fmod.fmod.Audio PlayWorldSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    int sx,
    int sy,
    int sz,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)
  + ### PlayWorldSound

    public abstract fmod.fmod.Audio PlayWorldSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)
  + ### update3D

    public abstract void update3D()
  + ### PlaySoundWav

    public abstract fmod.fmod.Audio PlaySoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int variations,
    boolean loop,
    float maxGain)
  + ### PlaySoundWav

    public abstract fmod.fmod.Audio PlaySoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)
  + ### PlaySoundWav

    public abstract fmod.fmod.Audio PlaySoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain,
    float pitchVar)
  + ### PlayWorldSoundWavImpl

    public abstract fmod.fmod.Audio PlayWorldSoundWavImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)
  + ### PlayJukeboxSound

    public abstract fmod.fmod.Audio PlayJukeboxSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)
  + ### PlaySoundEvenSilent

    public abstract fmod.fmod.Audio PlaySoundEvenSilent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)
  + ### PlaySound

    public abstract fmod.fmod.Audio PlaySound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)
  + ### PlaySound

    public abstract fmod.fmod.Audio PlaySound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float pitchVar,
    float maxGain)
  + ### PlayMusic

    public abstract fmod.fmod.Audio PlayMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)
  + ### PlayAsMusic

    public abstract void PlayAsMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    fmod.fmod.Audio musicTrack,
    boolean loop,
    float volume)
  + ### setMusicState

    public abstract void setMusicState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stateName)
  + ### setMusicWakeState

    public abstract void setMusicWakeState([IsoPlayer](characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stateName)
  + ### DoMusic

    public abstract void DoMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean bLoop)
  + ### getMusicPosition

    public abstract float getMusicPosition()
  + ### CheckDoMusic

    public abstract void CheckDoMusic()
  + ### stopMusic

    public abstract void stopMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### playMusicNonTriggered

    public abstract void playMusicNonTriggered([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float gain)
  + ### playAmbient

    public abstract void playAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### playMusic

    public abstract void playMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### isPlayingMusic

    public abstract boolean isPlayingMusic()
  + ### IsMusicPlaying

    public abstract boolean IsMusicPlaying()
  + ### getCurrentMusicName

    public abstract [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentMusicName()
  + ### getCurrentMusicLibrary

    public abstract [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentMusicLibrary()
  + ### PlayAsMusic

    public abstract void PlayAsMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    fmod.fmod.Audio musicTrack,
    float volume,
    boolean bloop)
  + ### playUISound

    public abstract long playUISound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### isPlayingUISound

    public abstract boolean isPlayingUISound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### isPlayingUISound

    public abstract boolean isPlayingUISound(long eventInstance)
  + ### stopUISound

    public abstract void stopUISound(long eventInstance)
  + ### FadeOutMusic

    public abstract void FadeOutMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int milli)
  + ### BlendThenStart

    public abstract fmod.fmod.Audio BlendThenStart(fmod.fmod.Audio musicTrack,
    float f,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefMusic)
  + ### BlendVolume

    public abstract void BlendVolume(fmod.fmod.Audio audio,
    float targetVolume,
    float blendSpeedAlpha)
  + ### BlendVolume

    public abstract void BlendVolume(fmod.fmod.Audio audio,
    float targetVolume)
  + ### setSoundVolume

    public abstract void setSoundVolume(float volume)
  + ### getSoundVolume

    public abstract float getSoundVolume()
  + ### setAmbientVolume

    public abstract void setAmbientVolume(float volume)
  + ### getAmbientVolume

    public abstract float getAmbientVolume()
  + ### setMusicVolume

    public abstract void setMusicVolume(float volume)
  + ### getMusicVolume

    public abstract float getMusicVolume()
  + ### setVehicleEngineVolume

    public abstract void setVehicleEngineVolume(float volume)
  + ### getVehicleEngineVolume

    public abstract float getVehicleEngineVolume()
  + ### playNightAmbient

    public abstract void playNightAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") choice)
  + ### getAmbientPieces

    public abstract [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<fmod.fmod.Audio> getAmbientPieces()
  + ### pauseSoundAndMusic

    public abstract void pauseSoundAndMusic()
  + ### pauseSoundAndMusic

    public abstract void pauseSoundAndMusic(boolean bOptionallyKeepMusicPlaying)
  + ### resumeSoundAndMusic

    public abstract void resumeSoundAndMusic()
  + ### debugScriptSounds

    public abstract void debugScriptSounds()
  + ### registerEmitter

    public abstract void registerEmitter([BaseSoundEmitter](audio/BaseSoundEmitter.html "class in zombie.audio") emitter)
  + ### unregisterEmitter

    public abstract void unregisterEmitter([BaseSoundEmitter](audio/BaseSoundEmitter.html "class in zombie.audio") emitter)
  + ### isListenerInRange

    public abstract boolean isListenerInRange(float x,
    float y,
    float range)
  + ### playImpactSound

    public abstract void playImpactSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    [AmmoType](scripting/objects/AmmoType.html "class in zombie.scripting.objects") ammoType)
  + ### playImpactSound

    public abstract void playImpactSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    [AmmoType](scripting/objects/AmmoType.html "class in zombie.scripting.objects") ammoType,
    zombie.iso.enums.MaterialType materialType)
  + ### playDamageSound

    public abstract void playDamageSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    zombie.iso.enums.MaterialType materialType)
  + ### playDestructionSound

    public abstract void playDestructionSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    zombie.iso.enums.MaterialType materialType)
  + ### dumpEventInstancesToTextFile

    public abstract void dumpEventInstancesToTextFile()