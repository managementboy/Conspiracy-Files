[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [DummySoundManager](DummySoundManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [ambientPieces](#ambientPieces)
6. [Constructor Details](#constructor-detail)
   1. [DummySoundManager()](#%3Cinit%3E())
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
   26. [PlayJukeboxSound(String, boolean, float)](#PlayJukeboxSound(java.lang.String,boolean,float))
   27. [PlaySoundEvenSilent(String, boolean, float)](#PlaySoundEvenSilent(java.lang.String,boolean,float))
   28. [PlaySound(String, boolean, float)](#PlaySound(java.lang.String,boolean,float))
   29. [PlaySound(String, boolean, float, float)](#PlaySound(java.lang.String,boolean,float,float))
   30. [PlayMusic(String, String, boolean, float)](#PlayMusic(java.lang.String,java.lang.String,boolean,float))
   31. [PlayAsMusic(String, Audio, boolean, float)](#PlayAsMusic(java.lang.String,fmod.fmod.Audio,boolean,float))
   32. [setMusicState(String)](#setMusicState(java.lang.String))
   33. [setMusicWakeState(IsoPlayer, String)](#setMusicWakeState(zombie.characters.IsoPlayer,java.lang.String))
   34. [DoMusic(String, boolean)](#DoMusic(java.lang.String,boolean))
   35. [getMusicPosition()](#getMusicPosition())
   36. [CheckDoMusic()](#CheckDoMusic())
   37. [stopMusic(String)](#stopMusic(java.lang.String))
   38. [playMusicNonTriggered(String, float)](#playMusicNonTriggered(java.lang.String,float))
   39. [playAmbient(String)](#playAmbient(java.lang.String))
   40. [playMusic(String)](#playMusic(java.lang.String))
   41. [isPlayingMusic()](#isPlayingMusic())
   42. [IsMusicPlaying()](#IsMusicPlaying())
   43. [PlayAsMusic(String, Audio, float, boolean)](#PlayAsMusic(java.lang.String,fmod.fmod.Audio,float,boolean))
   44. [playUISound(String)](#playUISound(java.lang.String))
   45. [isPlayingUISound(String)](#isPlayingUISound(java.lang.String))
   46. [isPlayingUISound(long)](#isPlayingUISound(long))
   47. [stopUISound(long)](#stopUISound(long))
   48. [FadeOutMusic(String, int)](#FadeOutMusic(java.lang.String,int))
   49. [BlendThenStart(Audio, float, String)](#BlendThenStart(fmod.fmod.Audio,float,java.lang.String))
   50. [BlendVolume(Audio, float, float)](#BlendVolume(fmod.fmod.Audio,float,float))
   51. [BlendVolume(Audio, float)](#BlendVolume(fmod.fmod.Audio,float))
   52. [setSoundVolume(float)](#setSoundVolume(float))
   53. [getSoundVolume()](#getSoundVolume())
   54. [setMusicVolume(float)](#setMusicVolume(float))
   55. [getMusicVolume()](#getMusicVolume())
   56. [setVehicleEngineVolume(float)](#setVehicleEngineVolume(float))
   57. [getVehicleEngineVolume()](#getVehicleEngineVolume())
   58. [setAmbientVolume(float)](#setAmbientVolume(float))
   59. [getAmbientVolume()](#getAmbientVolume())
   60. [playNightAmbient(String)](#playNightAmbient(java.lang.String))
   61. [getAmbientPieces()](#getAmbientPieces())
   62. [pauseSoundAndMusic()](#pauseSoundAndMusic())
   63. [pauseSoundAndMusic(boolean)](#pauseSoundAndMusic(boolean))
   64. [resumeSoundAndMusic()](#resumeSoundAndMusic())
   65. [debugScriptSounds()](#debugScriptSounds())
   66. [registerEmitter(BaseSoundEmitter)](#registerEmitter(zombie.audio.BaseSoundEmitter))
   67. [unregisterEmitter(BaseSoundEmitter)](#unregisterEmitter(zombie.audio.BaseSoundEmitter))
   68. [isListenerInRange(float, float, float)](#isListenerInRange(float,float,float))
   69. [PlayWorldSoundWavImpl(String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundWavImpl(java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   70. [getCurrentMusicName()](#getCurrentMusicName())
   71. [getCurrentMusicLibrary()](#getCurrentMusicLibrary())
   72. [playImpactSound(IsoGridSquare, AmmoType)](#playImpactSound(zombie.iso.IsoGridSquare,zombie.scripting.objects.AmmoType))
   73. [playImpactSound(IsoGridSquare, AmmoType, MaterialType)](#playImpactSound(zombie.iso.IsoGridSquare,zombie.scripting.objects.AmmoType,zombie.iso.enums.MaterialType))
   74. [playDamageSound(IsoGridSquare, MaterialType)](#playDamageSound(zombie.iso.IsoGridSquare,zombie.iso.enums.MaterialType))
   75. [playDestructionSound(IsoGridSquare, MaterialType)](#playDestructionSound(zombie.iso.IsoGridSquare,zombie.iso.enums.MaterialType))
   76. [dumpEventInstancesToTextFile()](#dumpEventInstancesToTextFile())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class DummySoundManager
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.BaseSoundManager](BaseSoundManager.html "class in zombie")

zombie.DummySoundManager

---

public final class DummySoundManager
extends [BaseSoundManager](BaseSoundManager.html "class in zombie")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<fmod.fmod.Audio>`

  `ambientPieces`

  ### Fields inherited from class [BaseSoundManager](BaseSoundManager.html#field-summary "class in zombie")

  `allowMusic`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DummySoundManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `fmod.fmod.Audio`

  `BlendThenStart(fmod.fmod.Audio musicTrack,
  float f,
  String prefMusic)`

  `void`

  `BlendVolume(fmod.fmod.Audio audio,
  float targetVolume)`

  `void`

  `BlendVolume(fmod.fmod.Audio audio,
  float targetVolume,
  float blendSpeedAlpha)`

  `void`

  `CacheSound(String file)`

  `void`

  `CheckDoMusic()`

  `void`

  `debugScriptSounds()`

  `void`

  `DoMusic(String name,
  boolean bLoop)`

  `void`

  `dumpEventInstancesToTextFile()`

  `void`

  `FadeOutMusic(String name,
  int milli)`

  `ArrayList<fmod.fmod.Audio>`

  `getAmbientPieces()`

  `float`

  `getAmbientVolume()`

  `String`

  `getCurrentMusicLibrary()`

  `String`

  `getCurrentMusicName()`

  `float`

  `getMusicPosition()`

  `float`

  `getMusicVolume()`

  `float`

  `getSoundVolume()`

  `float`

  `getVehicleEngineVolume()`

  `protected boolean`

  `HasMusic(fmod.fmod.Audio musicTrack)`

  `boolean`

  `isListenerInRange(float x,
  float y,
  float range)`

  `boolean`

  `IsMusicPlaying()`

  `boolean`

  `isPlayingMusic()`

  `boolean`

  `isPlayingUISound(long eventInstance)`

  `boolean`

  `isPlayingUISound(String name)`

  `boolean`

  `isRemastered()`

  `void`

  `pauseSoundAndMusic()`

  `void`

  `pauseSoundAndMusic(boolean bOptionallyKeepMusicPlaying)`

  `void`

  `playAmbient(String name)`

  `void`

  `PlayAsMusic(String name,
  fmod.fmod.Audio musicTrack,
  boolean loop,
  float volume)`

  `void`

  `PlayAsMusic(String name,
  fmod.fmod.Audio musicTrack,
  float volume,
  boolean bloop)`

  `void`

  `playDamageSound(IsoGridSquare isoGridSquare,
  zombie.iso.enums.MaterialType materialType)`

  `void`

  `playDestructionSound(IsoGridSquare isoGridSquare,
  zombie.iso.enums.MaterialType materialType)`

  `void`

  `playImpactSound(IsoGridSquare isoGridSquare,
  AmmoType ammoType)`

  `void`

  `playImpactSound(IsoGridSquare isoGridSquare,
  AmmoType ammoType,
  zombie.iso.enums.MaterialType materialType)`

  `fmod.fmod.Audio`

  `PlayJukeboxSound(String name,
  boolean loop,
  float maxGain)`

  `void`

  `playMusic(String name)`

  `fmod.fmod.Audio`

  `PlayMusic(String n,
  String name,
  boolean loop,
  float maxGain)`

  `void`

  `playMusicNonTriggered(String name,
  float gain)`

  `void`

  `playNightAmbient(String choice)`

  `fmod.fmod.Audio`

  `PlaySound(String name,
  boolean loop,
  float maxGain)`

  `fmod.fmod.Audio`

  `PlaySound(String name,
  boolean loop,
  float pitchVar,
  float maxGain)`

  `fmod.fmod.Audio`

  `PlaySoundEvenSilent(String name,
  boolean loop,
  float maxGain)`

  `fmod.fmod.Audio`

  `PlaySoundWav(String name,
  boolean loop,
  float maxGain)`

  `fmod.fmod.Audio`

  `PlaySoundWav(String name,
  boolean loop,
  float maxGain,
  float pitchVar)`

  `fmod.fmod.Audio`

  `PlaySoundWav(String name,
  int variations,
  boolean loop,
  float maxGain)`

  `long`

  `playUISound(String name)`

  `fmod.fmod.Audio`

  `PlayWorldSound(String name,
  boolean loop,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `fmod.fmod.Audio`

  `PlayWorldSound(String name,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `fmod.fmod.Audio`

  `PlayWorldSound(String name,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  int choices,
  boolean ignoreOutside)`

  `fmod.fmod.Audio`

  `PlayWorldSoundImpl(String name,
  boolean loop,
  int sx,
  int sy,
  int sz,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `fmod.fmod.Audio`

  `PlayWorldSoundWav(String name,
  boolean loop,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `fmod.fmod.Audio`

  `PlayWorldSoundWav(String name,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `void`

  `PlayWorldSoundWav(String name,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  int choices,
  boolean ignoreOutside)`

  `fmod.fmod.Audio`

  `PlayWorldSoundWavImpl(String name,
  boolean loop,
  IsoGridSquare source,
  float pitchVar,
  float radius,
  float maxGain,
  boolean ignoreOutside)`

  `fmod.fmod.Audio`

  `PrepareMusic(String name)`

  `void`

  `Purge()`

  `void`

  `registerEmitter(BaseSoundEmitter emitter)`

  `void`

  `resumeSoundAndMusic()`

  `void`

  `setAmbientVolume(float volume)`

  `void`

  `setMusicState(String stateName)`

  `void`

  `setMusicVolume(float volume)`

  `void`

  `setMusicWakeState(IsoPlayer player,
  String stateName)`

  `void`

  `setSoundVolume(float volume)`

  `void`

  `setVehicleEngineVolume(float volume)`

  `fmod.fmod.Audio`

  `Start(fmod.fmod.Audio musicTrack,
  float f,
  String prefMusic)`

  `void`

  `stop()`

  `void`

  `stopMusic(String name)`

  `void`

  `StopMusic()`

  `void`

  `StopSound(fmod.fmod.Audio soundEffect)`

  `void`

  `stopUISound(long eventInstance)`

  `void`

  `unregisterEmitter(BaseSoundEmitter emitter)`

  `void`

  `Update()`

  `void`

  `update1()`

  `void`

  `update2()`

  `void`

  `update3()`

  `void`

  `update3D()`

  `void`

  `update4()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### ambientPieces

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<fmod.fmod.Audio> ambientPieces
* Constructor Details
  -------------------

  + ### DummySoundManager

    public DummySoundManager()
* Method Details
  --------------

  + ### isRemastered

    public boolean isRemastered()

    Specified by:
    :   `isRemastered` in class `BaseSoundManager`
  + ### update1

    public void update1()

    Specified by:
    :   `update1` in class `BaseSoundManager`
  + ### update3

    public void update3()

    Specified by:
    :   `update3` in class `BaseSoundManager`
  + ### update2

    public void update2()

    Specified by:
    :   `update2` in class `BaseSoundManager`
  + ### update4

    public void update4()

    Specified by:
    :   `update4` in class `BaseSoundManager`
  + ### CacheSound

    public void CacheSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `CacheSound` in class `BaseSoundManager`
  + ### StopSound

    public void StopSound(fmod.fmod.Audio soundEffect)

    Specified by:
    :   `StopSound` in class `BaseSoundManager`
  + ### StopMusic

    public void StopMusic()

    Specified by:
    :   `StopMusic` in class `BaseSoundManager`
  + ### Purge

    public void Purge()

    Specified by:
    :   `Purge` in class `BaseSoundManager`
  + ### stop

    public void stop()

    Specified by:
    :   `stop` in class `BaseSoundManager`
  + ### HasMusic

    protected boolean HasMusic(fmod.fmod.Audio musicTrack)

    Specified by:
    :   `HasMusic` in class `BaseSoundManager`
  + ### Update

    public void Update()

    Specified by:
    :   `Update` in class `BaseSoundManager`
  + ### Start

    public fmod.fmod.Audio Start(fmod.fmod.Audio musicTrack,
    float f,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefMusic)

    Specified by:
    :   `Start` in class `BaseSoundManager`
  + ### PrepareMusic

    public fmod.fmod.Audio PrepareMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `PrepareMusic` in class `BaseSoundManager`
  + ### PlayWorldSoundWav

    public void PlayWorldSoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    int choices,
    boolean ignoreOutside)

    Specified by:
    :   `PlayWorldSoundWav` in class `BaseSoundManager`
  + ### PlayWorldSoundWav

    public fmod.fmod.Audio PlayWorldSoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)

    Specified by:
    :   `PlayWorldSoundWav` in class `BaseSoundManager`
  + ### PlayWorldSoundWav

    public fmod.fmod.Audio PlayWorldSoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)

    Specified by:
    :   `PlayWorldSoundWav` in class `BaseSoundManager`
  + ### PlayWorldSound

    public fmod.fmod.Audio PlayWorldSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    int choices,
    boolean ignoreOutside)

    Specified by:
    :   `PlayWorldSound` in class `BaseSoundManager`
  + ### PlayWorldSound

    public fmod.fmod.Audio PlayWorldSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)

    Specified by:
    :   `PlayWorldSound` in class `BaseSoundManager`
  + ### PlayWorldSoundImpl

    public fmod.fmod.Audio PlayWorldSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    int sx,
    int sy,
    int sz,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)

    Specified by:
    :   `PlayWorldSoundImpl` in class `BaseSoundManager`
  + ### PlayWorldSound

    public fmod.fmod.Audio PlayWorldSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)

    Specified by:
    :   `PlayWorldSound` in class `BaseSoundManager`
  + ### update3D

    public void update3D()

    Specified by:
    :   `update3D` in class `BaseSoundManager`
  + ### PlaySoundWav

    public fmod.fmod.Audio PlaySoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int variations,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlaySoundWav` in class `BaseSoundManager`
  + ### PlaySoundWav

    public fmod.fmod.Audio PlaySoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlaySoundWav` in class `BaseSoundManager`
  + ### PlaySoundWav

    public fmod.fmod.Audio PlaySoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain,
    float pitchVar)

    Specified by:
    :   `PlaySoundWav` in class `BaseSoundManager`
  + ### PlayJukeboxSound

    public fmod.fmod.Audio PlayJukeboxSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlayJukeboxSound` in class `BaseSoundManager`
  + ### PlaySoundEvenSilent

    public fmod.fmod.Audio PlaySoundEvenSilent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlaySoundEvenSilent` in class `BaseSoundManager`
  + ### PlaySound

    public fmod.fmod.Audio PlaySound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlaySound` in class `BaseSoundManager`
  + ### PlaySound

    public fmod.fmod.Audio PlaySound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float pitchVar,
    float maxGain)

    Specified by:
    :   `PlaySound` in class `BaseSoundManager`
  + ### PlayMusic

    public fmod.fmod.Audio PlayMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlayMusic` in class `BaseSoundManager`
  + ### PlayAsMusic

    public void PlayAsMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    fmod.fmod.Audio musicTrack,
    boolean loop,
    float volume)

    Specified by:
    :   `PlayAsMusic` in class `BaseSoundManager`
  + ### setMusicState

    public void setMusicState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stateName)

    Specified by:
    :   `setMusicState` in class `BaseSoundManager`
  + ### setMusicWakeState

    public void setMusicWakeState([IsoPlayer](characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stateName)

    Specified by:
    :   `setMusicWakeState` in class `BaseSoundManager`
  + ### DoMusic

    public void DoMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean bLoop)

    Specified by:
    :   `DoMusic` in class `BaseSoundManager`
  + ### getMusicPosition

    public float getMusicPosition()

    Specified by:
    :   `getMusicPosition` in class `BaseSoundManager`
  + ### CheckDoMusic

    public void CheckDoMusic()

    Specified by:
    :   `CheckDoMusic` in class `BaseSoundManager`
  + ### stopMusic

    public void stopMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `stopMusic` in class `BaseSoundManager`
  + ### playMusicNonTriggered

    public void playMusicNonTriggered([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float gain)

    Specified by:
    :   `playMusicNonTriggered` in class `BaseSoundManager`
  + ### playAmbient

    public void playAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `playAmbient` in class `BaseSoundManager`
  + ### playMusic

    public void playMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `playMusic` in class `BaseSoundManager`
  + ### isPlayingMusic

    public boolean isPlayingMusic()

    Specified by:
    :   `isPlayingMusic` in class `BaseSoundManager`
  + ### IsMusicPlaying

    public boolean IsMusicPlaying()

    Specified by:
    :   `IsMusicPlaying` in class `BaseSoundManager`
  + ### PlayAsMusic

    public void PlayAsMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    fmod.fmod.Audio musicTrack,
    float volume,
    boolean bloop)

    Specified by:
    :   `PlayAsMusic` in class `BaseSoundManager`
  + ### playUISound

    public long playUISound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `playUISound` in class `BaseSoundManager`
  + ### isPlayingUISound

    public boolean isPlayingUISound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `isPlayingUISound` in class `BaseSoundManager`
  + ### isPlayingUISound

    public boolean isPlayingUISound(long eventInstance)

    Specified by:
    :   `isPlayingUISound` in class `BaseSoundManager`
  + ### stopUISound

    public void stopUISound(long eventInstance)

    Specified by:
    :   `stopUISound` in class `BaseSoundManager`
  + ### FadeOutMusic

    public void FadeOutMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int milli)

    Specified by:
    :   `FadeOutMusic` in class `BaseSoundManager`
  + ### BlendThenStart

    public fmod.fmod.Audio BlendThenStart(fmod.fmod.Audio musicTrack,
    float f,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefMusic)

    Specified by:
    :   `BlendThenStart` in class `BaseSoundManager`
  + ### BlendVolume

    public void BlendVolume(fmod.fmod.Audio audio,
    float targetVolume,
    float blendSpeedAlpha)

    Specified by:
    :   `BlendVolume` in class `BaseSoundManager`
  + ### BlendVolume

    public void BlendVolume(fmod.fmod.Audio audio,
    float targetVolume)

    Specified by:
    :   `BlendVolume` in class `BaseSoundManager`
  + ### setSoundVolume

    public void setSoundVolume(float volume)

    Specified by:
    :   `setSoundVolume` in class `BaseSoundManager`
  + ### getSoundVolume

    public float getSoundVolume()

    Specified by:
    :   `getSoundVolume` in class `BaseSoundManager`
  + ### setMusicVolume

    public void setMusicVolume(float volume)

    Specified by:
    :   `setMusicVolume` in class `BaseSoundManager`
  + ### getMusicVolume

    public float getMusicVolume()

    Specified by:
    :   `getMusicVolume` in class `BaseSoundManager`
  + ### setVehicleEngineVolume

    public void setVehicleEngineVolume(float volume)

    Specified by:
    :   `setVehicleEngineVolume` in class `BaseSoundManager`
  + ### getVehicleEngineVolume

    public float getVehicleEngineVolume()

    Specified by:
    :   `getVehicleEngineVolume` in class `BaseSoundManager`
  + ### setAmbientVolume

    public void setAmbientVolume(float volume)

    Specified by:
    :   `setAmbientVolume` in class `BaseSoundManager`
  + ### getAmbientVolume

    public float getAmbientVolume()

    Specified by:
    :   `getAmbientVolume` in class `BaseSoundManager`
  + ### playNightAmbient

    public void playNightAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") choice)

    Specified by:
    :   `playNightAmbient` in class `BaseSoundManager`
  + ### getAmbientPieces

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<fmod.fmod.Audio> getAmbientPieces()

    Specified by:
    :   `getAmbientPieces` in class `BaseSoundManager`
  + ### pauseSoundAndMusic

    public void pauseSoundAndMusic()

    Specified by:
    :   `pauseSoundAndMusic` in class `BaseSoundManager`
  + ### pauseSoundAndMusic

    public void pauseSoundAndMusic(boolean bOptionallyKeepMusicPlaying)

    Specified by:
    :   `pauseSoundAndMusic` in class `BaseSoundManager`
  + ### resumeSoundAndMusic

    public void resumeSoundAndMusic()

    Specified by:
    :   `resumeSoundAndMusic` in class `BaseSoundManager`
  + ### debugScriptSounds

    public void debugScriptSounds()

    Specified by:
    :   `debugScriptSounds` in class `BaseSoundManager`
  + ### registerEmitter

    public void registerEmitter([BaseSoundEmitter](audio/BaseSoundEmitter.html "class in zombie.audio") emitter)

    Specified by:
    :   `registerEmitter` in class `BaseSoundManager`
  + ### unregisterEmitter

    public void unregisterEmitter([BaseSoundEmitter](audio/BaseSoundEmitter.html "class in zombie.audio") emitter)

    Specified by:
    :   `unregisterEmitter` in class `BaseSoundManager`
  + ### isListenerInRange

    public boolean isListenerInRange(float x,
    float y,
    float range)

    Specified by:
    :   `isListenerInRange` in class `BaseSoundManager`
  + ### PlayWorldSoundWavImpl

    public fmod.fmod.Audio PlayWorldSoundWavImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
    boolean ignoreOutside)

    Specified by:
    :   `PlayWorldSoundWavImpl` in class `BaseSoundManager`
  + ### getCurrentMusicName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentMusicName()

    Specified by:
    :   `getCurrentMusicName` in class `BaseSoundManager`
  + ### getCurrentMusicLibrary

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentMusicLibrary()

    Specified by:
    :   `getCurrentMusicLibrary` in class `BaseSoundManager`
  + ### playImpactSound

    public void playImpactSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    [AmmoType](scripting/objects/AmmoType.html "class in zombie.scripting.objects") ammoType)

    Specified by:
    :   `playImpactSound` in class `BaseSoundManager`
  + ### playImpactSound

    public void playImpactSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    [AmmoType](scripting/objects/AmmoType.html "class in zombie.scripting.objects") ammoType,
    zombie.iso.enums.MaterialType materialType)

    Specified by:
    :   `playImpactSound` in class `BaseSoundManager`
  + ### playDamageSound

    public void playDamageSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    zombie.iso.enums.MaterialType materialType)

    Specified by:
    :   `playDamageSound` in class `BaseSoundManager`
  + ### playDestructionSound

    public void playDestructionSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    zombie.iso.enums.MaterialType materialType)

    Specified by:
    :   `playDestructionSound` in class `BaseSoundManager`
  + ### dumpEventInstancesToTextFile

    public void dumpEventInstancesToTextFile()

    Specified by:
    :   `dumpEventInstancesToTextFile` in class `BaseSoundManager`