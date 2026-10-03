[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [SoundManager](SoundManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [soundVolume](#soundVolume)
   2. [musicVolume](#musicVolume)
   3. [ambientVolume](#ambientVolume)
   4. [vehicleEngineVolume](#vehicleEngineVolume)
   5. [parameterMusicActionStyle](#parameterMusicActionStyle)
   6. [parameterMusicIntensity](#parameterMusicIntensity)
   7. [parameterMusicThreat](#parameterMusicThreat)
   8. [parameterMusicLibrary](#parameterMusicLibrary)
   9. [parameterMusicState](#parameterMusicState)
   10. [parameterMusicToggleMute](#parameterMusicToggleMute)
   11. [parameterMusicWakeState](#parameterMusicWakeState)
   12. [parameterMusicZombiesTargeting](#parameterMusicZombiesTargeting)
   13. [parameterMusicZombiesVisible](#parameterMusicZombiesVisible)
   14. [fmodParameters](#fmodParameters)
   15. [initialized](#initialized)
   16. [inGameGroupBus](#inGameGroupBus)
   17. [musicGroupBus](#musicGroupBus)
   18. [musicEmitter](#musicEmitter)
   19. [musicCombinedEvent](#musicCombinedEvent)
   20. [uiEmitter](#uiEmitter)
   21. [uiSoundMuted](#uiSoundMuted)
   22. [music](#music)
   23. [ambientPieces](#ambientPieces)
   24. [muted](#muted)
   25. [bankList](#bankList)
   26. [eventDescList](#eventDescList)
   27. [eventInstList](#eventInstList)
   28. [pausedEventInstances](#pausedEventInstances)
   29. [pausedEventVolumes](#pausedEventVolumes)
   30. [pausedEventCount](#pausedEventCount)
   31. [emitters](#emitters)
   32. [ambientSoundEffects](#ambientSoundEffects)
   33. [instance](#instance)
   34. [currentMusicName](#currentMusicName)
   35. [currentMusicLibrary](#currentMusicLibrary)
   36. [musicEventCallback](#musicEventCallback)
   37. [impactSounds](#impactSounds)
7. [Constructor Details](#constructor-detail)
   1. [SoundManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getFMODParameters()](#getFMODParameters())
   2. [startEvent(long, GameSoundClip, boolean, BitSet)](#startEvent(long,zombie.audio.GameSoundClip,boolean,java.util.BitSet))
   3. [updateEvent(long, GameSoundClip)](#updateEvent(long,zombie.audio.GameSoundClip))
   4. [stopEvent(long, GameSoundClip, boolean, BitSet)](#stopEvent(long,zombie.audio.GameSoundClip,boolean,java.util.BitSet))
   5. [setUiSoundMuted(boolean)](#setUiSoundMuted(boolean))
   6. [isUiSoundMuted()](#isUiSoundMuted())
   7. [isRemastered()](#isRemastered())
   8. [BlendVolume(Audio, float)](#BlendVolume(fmod.fmod.Audio,float))
   9. [BlendVolume(Audio, float, float)](#BlendVolume(fmod.fmod.Audio,float,float))
   10. [BlendThenStart(Audio, float, String)](#BlendThenStart(fmod.fmod.Audio,float,java.lang.String))
   11. [FadeOutMusic(String, int)](#FadeOutMusic(java.lang.String,int))
   12. [PlayAsMusic(String, Audio, float, boolean)](#PlayAsMusic(java.lang.String,fmod.fmod.Audio,float,boolean))
   13. [playUISound(String)](#playUISound(java.lang.String))
   14. [isPlayingUISound(String)](#isPlayingUISound(java.lang.String))
   15. [isPlayingUISound(long)](#isPlayingUISound(long))
   16. [stopUISound(long)](#stopUISound(long))
   17. [IsMusicPlaying()](#IsMusicPlaying())
   18. [isPlayingMusic()](#isPlayingMusic())
   19. [getAmbientPieces()](#getAmbientPieces())
   20. [gatherInGameEventInstances()](#gatherInGameEventInstances())
   21. [pauseSoundAndMusic()](#pauseSoundAndMusic())
   22. [pauseSoundAndMusic(boolean)](#pauseSoundAndMusic(boolean))
   23. [resumeSoundAndMusic()](#resumeSoundAndMusic())
   24. [debugScriptSound(Item, String)](#debugScriptSound(zombie.scripting.objects.Item,java.lang.String))
   25. [debugScriptSounds()](#debugScriptSounds())
   26. [registerEmitter(BaseSoundEmitter)](#registerEmitter(zombie.audio.BaseSoundEmitter))
   27. [unregisterEmitter(BaseSoundEmitter)](#unregisterEmitter(zombie.audio.BaseSoundEmitter))
   28. [isListenerInRange(float, float, float)](#isListenerInRange(float,float,float))
   29. [playNightAmbient(String)](#playNightAmbient(java.lang.String))
   30. [playMusic(String)](#playMusic(java.lang.String))
   31. [playAmbient(String)](#playAmbient(java.lang.String))
   32. [playMusicNonTriggered(String, float)](#playMusicNonTriggered(java.lang.String,float))
   33. [stopMusic(String)](#stopMusic(java.lang.String))
   34. [CheckDoMusic()](#CheckDoMusic())
   35. [getMusicPosition()](#getMusicPosition())
   36. [DoMusic(String, boolean)](#DoMusic(java.lang.String,boolean))
   37. [PlayAsMusic(String, Audio, boolean, float)](#PlayAsMusic(java.lang.String,fmod.fmod.Audio,boolean,float))
   38. [setMusicState(String)](#setMusicState(java.lang.String))
   39. [setMusicWakeState(IsoPlayer, String)](#setMusicWakeState(zombie.characters.IsoPlayer,java.lang.String))
   40. [PlayMusic(String, String, boolean, float)](#PlayMusic(java.lang.String,java.lang.String,boolean,float))
   41. [PlaySound(String, boolean, float, float)](#PlaySound(java.lang.String,boolean,float,float))
   42. [PlaySound(String, boolean, float)](#PlaySound(java.lang.String,boolean,float))
   43. [PlaySoundEvenSilent(String, boolean, float)](#PlaySoundEvenSilent(java.lang.String,boolean,float))
   44. [PlayJukeboxSound(String, boolean, float)](#PlayJukeboxSound(java.lang.String,boolean,float))
   45. [PlaySoundWav(String, boolean, float, float)](#PlaySoundWav(java.lang.String,boolean,float,float))
   46. [PlaySoundWav(String, boolean, float)](#PlaySoundWav(java.lang.String,boolean,float))
   47. [PlaySoundWav(String, int, boolean, float)](#PlaySoundWav(java.lang.String,int,boolean,float))
   48. [update3D()](#update3D())
   49. [PlayWorldSound(String, IsoGridSquare, float, float, float, boolean)](#PlayWorldSound(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,boolean))
   50. [PlayWorldSound(String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSound(java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   51. [PlayWorldSoundImpl(String, boolean, int, int, int, float, float, float, boolean)](#PlayWorldSoundImpl(java.lang.String,boolean,int,int,int,float,float,float,boolean))
   52. [PlayWorldSound(String, IsoGridSquare, float, float, float, int, boolean)](#PlayWorldSound(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,int,boolean))
   53. [PlayWorldSoundWav(String, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundWav(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,boolean))
   54. [PlayWorldSoundWav(String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundWav(java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   55. [PlayWorldSoundWavImpl(String, boolean, IsoGridSquare, float, float, float, boolean)](#PlayWorldSoundWavImpl(java.lang.String,boolean,zombie.iso.IsoGridSquare,float,float,float,boolean))
   56. [PlayWorldSoundWav(String, IsoGridSquare, float, float, float, int, boolean)](#PlayWorldSoundWav(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,int,boolean))
   57. [PrepareMusic(String)](#PrepareMusic(java.lang.String))
   58. [Start(Audio, float, String)](#Start(fmod.fmod.Audio,float,java.lang.String))
   59. [Update()](#Update())
   60. [HasMusic(Audio)](#HasMusic(fmod.fmod.Audio))
   61. [Purge()](#Purge())
   62. [stop()](#stop())
   63. [StopMusic()](#StopMusic())
   64. [StopSound(Audio)](#StopSound(fmod.fmod.Audio))
   65. [CacheSound(String)](#CacheSound(java.lang.String))
   66. [update4()](#update4())
   67. [update2()](#update2())
   68. [update3()](#update3())
   69. [update1()](#update1())
   70. [setSoundVolume(float)](#setSoundVolume(float))
   71. [getSoundVolume()](#getSoundVolume())
   72. [setAmbientVolume(float)](#setAmbientVolume(float))
   73. [getAmbientVolume()](#getAmbientVolume())
   74. [setMusicVolume(float)](#setMusicVolume(float))
   75. [getMusicVolume()](#getMusicVolume())
   76. [setVehicleEngineVolume(float)](#setVehicleEngineVolume(float))
   77. [getVehicleEngineVolume()](#getVehicleEngineVolume())
   78. [getCurrentMusicName()](#getCurrentMusicName())
   79. [getCurrentMusicLibrary()](#getCurrentMusicLibrary())
   80. [updateMusic()](#updateMusic())
   81. [getUIEmitter()](#getUIEmitter())
   82. [playImpactSound(IsoGridSquare, AmmoType)](#playImpactSound(zombie.iso.IsoGridSquare,zombie.scripting.objects.AmmoType))
   83. [playImpactSound(IsoGridSquare, AmmoType, MaterialType)](#playImpactSound(zombie.iso.IsoGridSquare,zombie.scripting.objects.AmmoType,zombie.iso.enums.MaterialType))
   84. [playDamageSound(IsoGridSquare, MaterialType)](#playDamageSound(zombie.iso.IsoGridSquare,zombie.iso.enums.MaterialType))
   85. [playDestructionSound(IsoGridSquare, MaterialType)](#playDestructionSound(zombie.iso.IsoGridSquare,zombie.iso.enums.MaterialType))
   86. [playImpactSound(IsoGridSquare, AmmoType, String)](#playImpactSound(zombie.iso.IsoGridSquare,zombie.scripting.objects.AmmoType,java.lang.String))
   87. [playDamageSound(IsoGridSquare, String)](#playDamageSound(zombie.iso.IsoGridSquare,java.lang.String))
   88. [playDestructionSound(IsoGridSquare, String)](#playDestructionSound(zombie.iso.IsoGridSquare,java.lang.String))
   89. [recordImpactSound(String, int, int, int)](#recordImpactSound(java.lang.String,int,int,int))
   90. [isPlayingImpactSound(String, int, int, int)](#isPlayingImpactSound(java.lang.String,int,int,int))
   91. [dumpEventInstancesToTextFile()](#dumpEventInstancesToTextFile())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class SoundManager
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.BaseSoundManager](BaseSoundManager.html "class in zombie")

zombie.SoundManager

All Implemented Interfaces:
:   `fmod.fmod.IFMODParameterUpdater`

---

public final class SoundManager
extends [BaseSoundManager](BaseSoundManager.html "class in zombie")
implements fmod.fmod.IFMODParameterUpdater

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `SoundManager.AmbientSoundEffect`

  `private static final class`

  `SoundManager.ImpactSound`

  `private static final class`

  `SoundManager.Music`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `ArrayList<fmod.fmod.Audio>`

  `ambientPieces`

  `private static final ArrayList<SoundManager.AmbientSoundEffect>`

  `ambientSoundEffects`

  `float`

  `ambientVolume`

  `private long[]`

  `bankList`

  `private String`

  `currentMusicLibrary`

  `private String`

  `currentMusicName`

  `private final HashSet<BaseSoundEmitter>`

  `emitters`

  `private long[]`

  `eventDescList`

  `private long[]`

  `eventInstList`

  `private final zombie.audio.FMODParameterList`

  `fmodParameters`

  `private final ArrayList<SoundManager.ImpactSound>`

  `impactSounds`

  `private long`

  `inGameGroupBus`

  `private boolean`

  `initialized`

  `static BaseSoundManager`

  `instance`

  `private final SoundManager.Music`

  `music`

  `private long`

  `musicCombinedEvent`

  `private FMODSoundEmitter`

  `musicEmitter`

  `private final fmod.fmod.FMOD_STUDIO_EVENT_CALLBACK`

  `musicEventCallback`

  `private long`

  `musicGroupBus`

  `float`

  `musicVolume`

  `private boolean`

  `muted`

  `private final zombie.audio.parameters.ParameterMusicActionStyle`

  `parameterMusicActionStyle`

  `private final zombie.audio.parameters.ParameterMusicIntensity`

  `parameterMusicIntensity`

  `private final zombie.audio.parameters.ParameterMusicLibrary`

  `parameterMusicLibrary`

  `private final zombie.audio.parameters.ParameterMusicState`

  `parameterMusicState`

  `private final zombie.audio.parameters.ParameterMusicThreat`

  `parameterMusicThreat`

  `private final zombie.audio.parameters.ParameterMusicToggleMute`

  `parameterMusicToggleMute`

  `private final zombie.audio.parameters.ParameterMusicWakeState`

  `parameterMusicWakeState`

  `private final zombie.audio.parameters.ParameterMusicZombiesTargeting`

  `parameterMusicZombiesTargeting`

  `private final zombie.audio.parameters.ParameterMusicZombiesVisible`

  `parameterMusicZombiesVisible`

  `private int`

  `pausedEventCount`

  `private long[]`

  `pausedEventInstances`

  `private float[]`

  `pausedEventVolumes`

  `float`

  `soundVolume`

  `private FMODSoundEmitter`

  `uiEmitter`

  `private boolean`

  `uiSoundMuted`

  `float`

  `vehicleEngineVolume`

  ### Fields inherited from class [BaseSoundManager](BaseSoundManager.html#field-summary "class in zombie")

  `allowMusic`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SoundManager()`
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

  `private void`

  `debugScriptSound(Item item,
  String sound)`

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

  `private void`

  `gatherInGameEventInstances()`

  `ArrayList<fmod.fmod.Audio>`

  `getAmbientPieces()`

  `float`

  `getAmbientVolume()`

  `String`

  `getCurrentMusicLibrary()`

  `String`

  `getCurrentMusicName()`

  `zombie.audio.FMODParameterList`

  `getFMODParameters()`

  `float`

  `getMusicPosition()`

  `float`

  `getMusicVolume()`

  `float`

  `getSoundVolume()`

  `FMODSoundEmitter`

  `getUIEmitter()`

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

  `private boolean`

  `isPlayingImpactSound(String soundName,
  int x,
  int y,
  int z)`

  `boolean`

  `isPlayingMusic()`

  `boolean`

  `isPlayingUISound(long eventInstance)`

  `boolean`

  `isPlayingUISound(String name)`

  `boolean`

  `isRemastered()`

  `boolean`

  `isUiSoundMuted()`

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

  `private void`

  `playDamageSound(IsoGridSquare isoGridSquare,
  String materialTypeString)`

  `void`

  `playDamageSound(IsoGridSquare isoGridSquare,
  zombie.iso.enums.MaterialType materialType)`

  `private void`

  `playDestructionSound(IsoGridSquare isoGridSquare,
  String materialTypeString)`

  `void`

  `playDestructionSound(IsoGridSquare isoGridSquare,
  zombie.iso.enums.MaterialType materialType)`

  `void`

  `playImpactSound(IsoGridSquare isoGridSquare,
  AmmoType ammoType)`

  `private void`

  `playImpactSound(IsoGridSquare isoGridSquare,
  AmmoType ammoType,
  String materialTypeString)`

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
  float maxGain,
  float pitchVar)`

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

  `private void`

  `recordImpactSound(String soundName,
  int x,
  int y,
  int z)`

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

  `setUiSoundMuted(boolean uiSoundMuted)`

  `void`

  `setVehicleEngineVolume(float volume)`

  `fmod.fmod.Audio`

  `Start(fmod.fmod.Audio musicTrack,
  float f,
  String prefMusic)`

  `void`

  `startEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote,
  BitSet parameterSet)`

  `void`

  `stop()`

  `void`

  `stopEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote,
  BitSet parameterSet)`

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

  `void`

  `updateEvent(long eventInstance,
  GameSoundClip clip)`

  `private void`

  `updateMusic()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### soundVolume

    public float soundVolume
  + ### musicVolume

    public float musicVolume
  + ### ambientVolume

    public float ambientVolume
  + ### vehicleEngineVolume

    public float vehicleEngineVolume
  + ### parameterMusicActionStyle

    private final zombie.audio.parameters.ParameterMusicActionStyle parameterMusicActionStyle
  + ### parameterMusicIntensity

    private final zombie.audio.parameters.ParameterMusicIntensity parameterMusicIntensity
  + ### parameterMusicThreat

    private final zombie.audio.parameters.ParameterMusicThreat parameterMusicThreat
  + ### parameterMusicLibrary

    private final zombie.audio.parameters.ParameterMusicLibrary parameterMusicLibrary
  + ### parameterMusicState

    private final zombie.audio.parameters.ParameterMusicState parameterMusicState
  + ### parameterMusicToggleMute

    private final zombie.audio.parameters.ParameterMusicToggleMute parameterMusicToggleMute
  + ### parameterMusicWakeState

    private final zombie.audio.parameters.ParameterMusicWakeState parameterMusicWakeState
  + ### parameterMusicZombiesTargeting

    private final zombie.audio.parameters.ParameterMusicZombiesTargeting parameterMusicZombiesTargeting
  + ### parameterMusicZombiesVisible

    private final zombie.audio.parameters.ParameterMusicZombiesVisible parameterMusicZombiesVisible
  + ### fmodParameters

    private final zombie.audio.FMODParameterList fmodParameters
  + ### initialized

    private boolean initialized
  + ### inGameGroupBus

    private long inGameGroupBus
  + ### musicGroupBus

    private long musicGroupBus
  + ### musicEmitter

    private [FMODSoundEmitter](../fmod/fmod/FMODSoundEmitter.html "class in fmod.fmod") musicEmitter
  + ### musicCombinedEvent

    private long musicCombinedEvent
  + ### uiEmitter

    private [FMODSoundEmitter](../fmod/fmod/FMODSoundEmitter.html "class in fmod.fmod") uiEmitter
  + ### uiSoundMuted

    private boolean uiSoundMuted
  + ### music

    private final [SoundManager.Music](SoundManager.Music.html "class in zombie") music
  + ### ambientPieces

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<fmod.fmod.Audio> ambientPieces
  + ### muted

    private boolean muted
  + ### bankList

    private long[] bankList
  + ### eventDescList

    private long[] eventDescList
  + ### eventInstList

    private long[] eventInstList
  + ### pausedEventInstances

    private long[] pausedEventInstances
  + ### pausedEventVolumes

    private float[] pausedEventVolumes
  + ### pausedEventCount

    private int pausedEventCount
  + ### emitters

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[BaseSoundEmitter](audio/BaseSoundEmitter.html "class in zombie.audio")> emitters
  + ### ambientSoundEffects

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SoundManager.AmbientSoundEffect](SoundManager.AmbientSoundEffect.html "class in zombie")> ambientSoundEffects
  + ### instance

    public static [BaseSoundManager](BaseSoundManager.html "class in zombie") instance
  + ### currentMusicName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentMusicName
  + ### currentMusicLibrary

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentMusicLibrary
  + ### musicEventCallback

    private final fmod.fmod.FMOD\_STUDIO\_EVENT\_CALLBACK musicEventCallback
  + ### impactSounds

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SoundManager.ImpactSound](SoundManager.ImpactSound.html "class in zombie")> impactSounds
* Constructor Details
  -------------------

  + ### SoundManager

    public SoundManager()
* Method Details
  --------------

  + ### getFMODParameters

    public zombie.audio.FMODParameterList getFMODParameters()

    Specified by:
    :   `getFMODParameters` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### startEvent

    public void startEvent(long eventInstance,
    [GameSoundClip](audio/GameSoundClip.html "class in zombie.audio") clip,
    boolean remote,
    [BitSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/BitSet.html "class or interface in java.util") parameterSet)

    Specified by:
    :   `startEvent` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### updateEvent

    public void updateEvent(long eventInstance,
    [GameSoundClip](audio/GameSoundClip.html "class in zombie.audio") clip)

    Specified by:
    :   `updateEvent` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### stopEvent

    public void stopEvent(long eventInstance,
    [GameSoundClip](audio/GameSoundClip.html "class in zombie.audio") clip,
    boolean remote,
    [BitSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/BitSet.html "class or interface in java.util") parameterSet)

    Specified by:
    :   `stopEvent` in interface `fmod.fmod.IFMODParameterUpdater`
  + ### setUiSoundMuted

    public void setUiSoundMuted(boolean uiSoundMuted)
  + ### isUiSoundMuted

    public boolean isUiSoundMuted()
  + ### isRemastered

    public boolean isRemastered()

    Specified by:
    :   `isRemastered` in class `BaseSoundManager`
  + ### BlendVolume

    public void BlendVolume(fmod.fmod.Audio audio,
    float targetVolume)

    Specified by:
    :   `BlendVolume` in class `BaseSoundManager`
  + ### BlendVolume

    public void BlendVolume(fmod.fmod.Audio audio,
    float targetVolume,
    float blendSpeedAlpha)

    Specified by:
    :   `BlendVolume` in class `BaseSoundManager`
  + ### BlendThenStart

    public fmod.fmod.Audio BlendThenStart(fmod.fmod.Audio musicTrack,
    float f,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefMusic)

    Specified by:
    :   `BlendThenStart` in class `BaseSoundManager`
  + ### FadeOutMusic

    public void FadeOutMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int milli)

    Specified by:
    :   `FadeOutMusic` in class `BaseSoundManager`
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
  + ### IsMusicPlaying

    public boolean IsMusicPlaying()

    Specified by:
    :   `IsMusicPlaying` in class `BaseSoundManager`
  + ### isPlayingMusic

    public boolean isPlayingMusic()

    Specified by:
    :   `isPlayingMusic` in class `BaseSoundManager`
  + ### getAmbientPieces

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<fmod.fmod.Audio> getAmbientPieces()

    Specified by:
    :   `getAmbientPieces` in class `BaseSoundManager`
  + ### gatherInGameEventInstances

    private void gatherInGameEventInstances()
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
  + ### debugScriptSound

    private void debugScriptSound([Item](scripting/objects/Item.html "class in zombie.scripting.objects") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound)
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
  + ### playNightAmbient

    public void playNightAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") choice)

    Specified by:
    :   `playNightAmbient` in class `BaseSoundManager`
  + ### playMusic

    public void playMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `playMusic` in class `BaseSoundManager`
  + ### playAmbient

    public void playAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `playAmbient` in class `BaseSoundManager`
  + ### playMusicNonTriggered

    public void playMusicNonTriggered([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float gain)

    Specified by:
    :   `playMusicNonTriggered` in class `BaseSoundManager`
  + ### stopMusic

    public void stopMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `stopMusic` in class `BaseSoundManager`
  + ### CheckDoMusic

    public void CheckDoMusic()

    Specified by:
    :   `CheckDoMusic` in class `BaseSoundManager`
  + ### getMusicPosition

    public float getMusicPosition()

    Specified by:
    :   `getMusicPosition` in class `BaseSoundManager`
  + ### DoMusic

    public void DoMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean bLoop)

    Specified by:
    :   `DoMusic` in class `BaseSoundManager`
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
  + ### PlayMusic

    public fmod.fmod.Audio PlayMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlayMusic` in class `BaseSoundManager`
  + ### PlaySound

    public fmod.fmod.Audio PlaySound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain,
    float pitchVar)

    Specified by:
    :   `PlaySound` in class `BaseSoundManager`
  + ### PlaySound

    public fmod.fmod.Audio PlaySound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlaySound` in class `BaseSoundManager`
  + ### PlaySoundEvenSilent

    public fmod.fmod.Audio PlaySoundEvenSilent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlaySoundEvenSilent` in class `BaseSoundManager`
  + ### PlayJukeboxSound

    public fmod.fmod.Audio PlayJukeboxSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlayJukeboxSound` in class `BaseSoundManager`
  + ### PlaySoundWav

    public fmod.fmod.Audio PlaySoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean loop,
    float maxGain,
    float pitchVar)

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
    int variations,
    boolean loop,
    float maxGain)

    Specified by:
    :   `PlaySoundWav` in class `BaseSoundManager`
  + ### update3D

    public void update3D()

    Specified by:
    :   `update3D` in class `BaseSoundManager`
  + ### PlayWorldSound

    public fmod.fmod.Audio PlayWorldSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
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
    int choices,
    boolean ignoreOutside)

    Specified by:
    :   `PlayWorldSound` in class `BaseSoundManager`
  + ### PlayWorldSoundWav

    public fmod.fmod.Audio PlayWorldSoundWav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") source,
    float pitchVar,
    float radius,
    float maxGain,
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
  + ### PrepareMusic

    public fmod.fmod.Audio PrepareMusic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `PrepareMusic` in class `BaseSoundManager`
  + ### Start

    public fmod.fmod.Audio Start(fmod.fmod.Audio musicTrack,
    float f,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefMusic)

    Specified by:
    :   `Start` in class `BaseSoundManager`
  + ### Update

    public void Update()

    Specified by:
    :   `Update` in class `BaseSoundManager`
  + ### HasMusic

    protected boolean HasMusic(fmod.fmod.Audio musicTrack)

    Specified by:
    :   `HasMusic` in class `BaseSoundManager`
  + ### Purge

    public void Purge()

    Specified by:
    :   `Purge` in class `BaseSoundManager`
  + ### stop

    public void stop()

    Specified by:
    :   `stop` in class `BaseSoundManager`
  + ### StopMusic

    public void StopMusic()

    Specified by:
    :   `StopMusic` in class `BaseSoundManager`
  + ### StopSound

    public void StopSound(fmod.fmod.Audio soundEffect)

    Specified by:
    :   `StopSound` in class `BaseSoundManager`
  + ### CacheSound

    public void CacheSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `CacheSound` in class `BaseSoundManager`
  + ### update4

    public void update4()

    Specified by:
    :   `update4` in class `BaseSoundManager`
  + ### update2

    public void update2()

    Specified by:
    :   `update2` in class `BaseSoundManager`
  + ### update3

    public void update3()

    Specified by:
    :   `update3` in class `BaseSoundManager`
  + ### update1

    public void update1()

    Specified by:
    :   `update1` in class `BaseSoundManager`
  + ### setSoundVolume

    public void setSoundVolume(float volume)

    Specified by:
    :   `setSoundVolume` in class `BaseSoundManager`
  + ### getSoundVolume

    public float getSoundVolume()

    Specified by:
    :   `getSoundVolume` in class `BaseSoundManager`
  + ### setAmbientVolume

    public void setAmbientVolume(float volume)

    Specified by:
    :   `setAmbientVolume` in class `BaseSoundManager`
  + ### getAmbientVolume

    public float getAmbientVolume()

    Specified by:
    :   `getAmbientVolume` in class `BaseSoundManager`
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
  + ### getCurrentMusicName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentMusicName()

    Specified by:
    :   `getCurrentMusicName` in class `BaseSoundManager`
  + ### getCurrentMusicLibrary

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentMusicLibrary()

    Specified by:
    :   `getCurrentMusicLibrary` in class `BaseSoundManager`
  + ### updateMusic

    private void updateMusic()
  + ### getUIEmitter

    public [FMODSoundEmitter](../fmod/fmod/FMODSoundEmitter.html "class in fmod.fmod") getUIEmitter()
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
  + ### playImpactSound

    private void playImpactSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    [AmmoType](scripting/objects/AmmoType.html "class in zombie.scripting.objects") ammoType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") materialTypeString)
  + ### playDamageSound

    private void playDamageSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") materialTypeString)
  + ### playDestructionSound

    private void playDestructionSound([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") isoGridSquare,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") materialTypeString)
  + ### recordImpactSound

    private void recordImpactSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName,
    int x,
    int y,
    int z)
  + ### isPlayingImpactSound

    private boolean isPlayingImpactSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName,
    int x,
    int y,
    int z)
  + ### dumpEventInstancesToTextFile

    public void dumpEventInstancesToTextFile()

    Specified by:
    :   `dumpEventInstancesToTextFile` in class `BaseSoundManager`