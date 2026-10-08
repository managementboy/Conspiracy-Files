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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [toStart](#toStart)
   2. [instances](#instances)
   3. [stopped](#stopped)
   4. [x](#x)
   5. [y](#y)
   6. [z](#z)
   7. [emitterType](#emitterType)
   8. [parent](#parent)
   9. [playRemoteEvents](#playRemoteEvents)
   10. [occlusion](#occlusion)
   11. [parameters](#parameters)
   12. [parameterUpdater](#parameterUpdater)
   13. [parameterValues](#parameterValues)
   14. [parameterValuePool](#parameterValuePool)
   15. [parameterSet](#parameterSet)
   16. [eventSoundPool](#eventSoundPool)
   17. [fileSoundPool](#fileSoundPool)
   18. [currentTimeMs](#currentTimeMs)
7. [Constructor Details](#constructor-detail)
   1. [FMODSoundEmitter()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [randomStart()](#randomStart())
   2. [setPos(float, float, float)](#setPos(float,float,float))
   3. [stopSound(long)](#stopSound(long))
   4. [stopSoundDelayRelease(long)](#stopSoundDelayRelease(long))
   5. [stopSound(long, boolean)](#stopSound(long,boolean))
   6. [stopSoundLocal(long)](#stopSoundLocal(long))
   7. [stopOrTriggerSoundLocal(long)](#stopOrTriggerSoundLocal(long))
   8. [stopSoundByName(String)](#stopSoundByName(java.lang.String))
   9. [stopOrTriggerSound(long)](#stopOrTriggerSound(long))
   10. [stopOrTriggerSoundByName(String)](#stopOrTriggerSoundByName(java.lang.String))
   11. [limitSound(GameSound, int)](#limitSound(zombie.audio.GameSound,int))
   12. [setVolume(long, float)](#setVolume(long,float))
   13. [setPitch(long, float)](#setPitch(long,float))
   14. [hasSustainPoints(long)](#hasSustainPoints(long))
   15. [triggerCue(long)](#triggerCue(long))
   16. [setVolumeAll(float)](#setVolumeAll(float))
   17. [stopAll()](#stopAll())
   18. [playSound(String)](#playSound(java.lang.String))
   19. [playSound(String, IsoGameCharacter)](#playSound(java.lang.String,zombie.characters.IsoGameCharacter))
   20. [playSound(String, int, int, int)](#playSound(java.lang.String,int,int,int))
   21. [playSound(String, IsoGridSquare)](#playSound(java.lang.String,zombie.iso.IsoGridSquare))
   22. [playSoundImpl(String, IsoGridSquare)](#playSoundImpl(java.lang.String,zombie.iso.IsoGridSquare))
   23. [playSound(String, boolean)](#playSound(java.lang.String,boolean))
   24. [playSoundImpl(String, boolean, IsoObject)](#playSoundImpl(java.lang.String,boolean,zombie.iso.IsoObject))
   25. [playSoundLooped(String)](#playSoundLooped(java.lang.String))
   26. [playSoundLoopedImpl(String)](#playSoundLoopedImpl(java.lang.String))
   27. [playSound(String, IsoObject)](#playSound(java.lang.String,zombie.iso.IsoObject))
   28. [playSoundImpl(String, IsoObject)](#playSoundImpl(java.lang.String,zombie.iso.IsoObject))
   29. [playClip(GameSoundClip, IsoObject)](#playClip(zombie.audio.GameSoundClip,zombie.iso.IsoObject))
   30. [playAmbientSound(String)](#playAmbientSound(java.lang.String))
   31. [playAmbientLoopedImpl(String)](#playAmbientLoopedImpl(java.lang.String))
   32. [set3D(long, boolean)](#set3D(long,boolean))
   33. [tick()](#tick())
   34. [hasSoundsToStart()](#hasSoundsToStart())
   35. [isEmpty()](#isEmpty())
   36. [isPlaying(long)](#isPlaying(long))
   37. [isPlaying(String)](#isPlaying(java.lang.String))
   38. [restart(long)](#restart(long))
   39. [setPlayRemoteEvents(boolean)](#setPlayRemoteEvents(boolean))
   40. [findInstance(long)](#findInstance(long))
   41. [findInstance(String)](#findInstance(java.lang.String))
   42. [findToStart(long)](#findToStart(long))
   43. [findToStart(String)](#findToStart(java.lang.String))
   44. [findStopped(long)](#findStopped(long))
   45. [countToStart(GameSound)](#countToStart(zombie.audio.GameSound))
   46. [countInstances(GameSound)](#countInstances(zombie.audio.GameSound))
   47. [addParameter(FMODParameter)](#addParameter(zombie.audio.FMODParameter))
   48. [setParameterValue(long, FMOD\_STUDIO\_PARAMETER\_DESCRIPTION, float)](#setParameterValue(long,fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION,float))
   49. [setParameterValueByName(long, String, float)](#setParameterValueByName(long,java.lang.String,float))
   50. [isUsingParameter(long, String)](#isUsingParameter(long,java.lang.String))
   51. [setTimelinePosition(long, String)](#setTimelinePosition(long,java.lang.String))
   52. [findParameterValue(long, FMOD\_STUDIO\_PARAMETER\_DESCRIPTION)](#findParameterValue(long,fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION))
   53. [clearParameters()](#clearParameters())
   54. [startEvent(long, GameSoundClip, boolean)](#startEvent(long,zombie.audio.GameSoundClip,boolean))
   55. [updateEvent(long, GameSoundClip)](#updateEvent(long,zombie.audio.GameSoundClip))
   56. [stopEvent(long, GameSoundClip, boolean)](#stopEvent(long,zombie.audio.GameSoundClip,boolean))
   57. [allocEventSound()](#allocEventSound())
   58. [releaseEventSound(FMODSoundEmitter.EventSound)](#releaseEventSound(fmod.fmod.FMODSoundEmitter.EventSound))
   59. [allocFileSound()](#allocFileSound())
   60. [releaseFileSound(FMODSoundEmitter.FileSound)](#releaseFileSound(fmod.fmod.FMODSoundEmitter.FileSound))
   61. [addSound(GameSoundClip, float, IsoObject)](#addSound(zombie.audio.GameSoundClip,float,zombie.iso.IsoObject))
   62. [sendStopSound(String, boolean)](#sendStopSound(java.lang.String,boolean))
   63. [update()](#update())
   64. [shouldPlayRemoteEvents()](#shouldPlayRemoteEvents())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FMODSoundEmitter
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.audio.BaseSoundEmitter](../../zombie/audio/BaseSoundEmitter.html "class in zombie.audio")

fmod.fmod.FMODSoundEmitter

---

public final class FMODSoundEmitter
extends [BaseSoundEmitter](../../zombie/audio/BaseSoundEmitter.html "class in zombie.audio")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `FMODSoundEmitter.EventSound`

  `private static final class`

  `FMODSoundEmitter.FileSound`

  `private static final class`

  `FMODSoundEmitter.ParameterValue`

  `private static class`

  `FMODSoundEmitter.Sound`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static long`

  `currentTimeMs`

  `EmitterType`

  `emitterType`

  `private final ArrayDeque<FMODSoundEmitter.EventSound>`

  `eventSoundPool`

  `private final ArrayDeque<FMODSoundEmitter.FileSound>`

  `fileSoundPool`

  `private final ArrayList<FMODSoundEmitter.Sound>`

  `instances`

  `private final zombie.audio.parameters.ParameterOcclusion`

  `occlusion`

  `private final ArrayList<zombie.audio.FMODParameter>`

  `parameters`

  `private static BitSet`

  `parameterSet`

  `fmod.fmod.IFMODParameterUpdater`

  `parameterUpdater`

  `private static final zombie.popman.ObjectPool<FMODSoundEmitter.ParameterValue>`

  `parameterValuePool`

  `private final ArrayList<FMODSoundEmitter.ParameterValue>`

  `parameterValues`

  `IsoObject`

  `parent`

  `private boolean`

  `playRemoteEvents`

  `private final ArrayList<FMODSoundEmitter.Sound>`

  `stopped`

  `private final ArrayList<FMODSoundEmitter.Sound>`

  `toStart`

  `float`

  `x`

  `float`

  `y`

  `float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FMODSoundEmitter()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addParameter(zombie.audio.FMODParameter parameter)`

  `private FMODSoundEmitter.Sound`

  `addSound(GameSoundClip clip,
  float volume,
  IsoObject parent)`

  `private FMODSoundEmitter.EventSound`

  `allocEventSound()`

  `private FMODSoundEmitter.FileSound`

  `allocFileSound()`

  `void`

  `clearParameters()`

  `private int`

  `countInstances(GameSound gameSound)`

  `private int`

  `countToStart(GameSound gameSound)`

  `private int`

  `findInstance(long soundRef)`

  `private int`

  `findInstance(String name)`

  `private int`

  `findParameterValue(long soundRef,
  fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription)`

  `private int`

  `findStopped(long soundRef)`

  `private int`

  `findToStart(long soundRef)`

  `private int`

  `findToStart(String name)`

  `boolean`

  `hasSoundsToStart()`

  `boolean`

  `hasSustainPoints(long soundRef)`

  `boolean`

  `isEmpty()`

  `boolean`

  `isPlaying(long soundRef)`

  `boolean`

  `isPlaying(String alias)`

  `boolean`

  `isUsingParameter(long handle,
  String parameterName)`

  `private void`

  `limitSound(GameSound gameSound,
  int maxInstances)`

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

  `private void`

  `releaseEventSound(FMODSoundEmitter.EventSound sound)`

  `private void`

  `releaseFileSound(FMODSoundEmitter.FileSound sound)`

  `boolean`

  `restart(long handle)`

  `private void`

  `sendStopSound(String soundName,
  boolean triggerCue)`

  `void`

  `set3D(long soundRef,
  boolean is3D)`

  `void`

  `setParameterValue(long soundRef,
  fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION parameterDescription,
  float value)`

  `void`

  `setParameterValueByName(long soundRef,
  String parameterName,
  float value)`

  `void`

  `setPitch(long soundRef,
  float pitch)`

  `void`

  `setPlayRemoteEvents(boolean remote)`

  `void`

  `setPos(float x,
  float y,
  float z)`

  `void`

  `setTimelinePosition(long soundRef,
  String positionName)`

  `void`

  `setVolume(long soundRef,
  float volume)`

  `void`

  `setVolumeAll(float volume)`

  `private boolean`

  `shouldPlayRemoteEvents()`

  `private void`

  `startEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote)`

  `void`

  `stopAll()`

  `private void`

  `stopEvent(long eventInstance,
  GameSoundClip clip,
  boolean remote)`

  `void`

  `stopOrTriggerSound(long handle)`

  `void`

  `stopOrTriggerSoundByName(String name)`

  `void`

  `stopOrTriggerSoundLocal(long soundRef)`

  `int`

  `stopSound(long soundRef)`

  `private int`

  `stopSound(long soundRef,
  boolean bReleaseEvent)`

  `int`

  `stopSoundByName(String name)`

  `int`

  `stopSoundDelayRelease(long soundRef)`

  `void`

  `stopSoundLocal(long soundRef)`

  `void`

  `tick()`

  `void`

  `triggerCue(long soundRef)`

  `static void`

  `update()`

  `private void`

  `updateEvent(long eventInstance,
  GameSoundClip clip)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### toStart

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html "class in fmod.fmod")> toStart
  + ### instances

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html "class in fmod.fmod")> instances
  + ### stopped

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html "class in fmod.fmod")> stopped
  + ### x

    public float x
  + ### y

    public float y
  + ### z

    public float z
  + ### emitterType

    public [EmitterType](EmitterType.html "enum class in fmod.fmod") emitterType
  + ### parent

    public [IsoObject](../../zombie/iso/IsoObject.html "class in zombie.iso") parent
  + ### playRemoteEvents

    private boolean playRemoteEvents
  + ### occlusion

    private final zombie.audio.parameters.ParameterOcclusion occlusion
  + ### parameters

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.audio.FMODParameter> parameters
  + ### parameterUpdater

    public fmod.fmod.IFMODParameterUpdater parameterUpdater
  + ### parameterValues

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FMODSoundEmitter.ParameterValue](FMODSoundEmitter.ParameterValue.html "class in fmod.fmod")> parameterValues
  + ### parameterValuePool

    private static final zombie.popman.ObjectPool<[FMODSoundEmitter.ParameterValue](FMODSoundEmitter.ParameterValue.html "class in fmod.fmod")> parameterValuePool
  + ### parameterSet

    private static [BitSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/BitSet.html "class or interface in java.util") parameterSet
  + ### eventSoundPool

    private final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[FMODSoundEmitter.EventSound](FMODSoundEmitter.EventSound.html "class in fmod.fmod")> eventSoundPool
  + ### fileSoundPool

    private final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[FMODSoundEmitter.FileSound](FMODSoundEmitter.FileSound.html "class in fmod.fmod")> fileSoundPool
  + ### currentTimeMs

    private static long currentTimeMs
* Constructor Details
  -------------------

  + ### FMODSoundEmitter

    public FMODSoundEmitter()
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

    public int stopSound(long soundRef)

    Specified by:
    :   `stopSound` in class `BaseSoundEmitter`
  + ### stopSoundDelayRelease

    public int stopSoundDelayRelease(long soundRef)

    Specified by:
    :   `stopSoundDelayRelease` in class `BaseSoundEmitter`
  + ### stopSound

    private int stopSound(long soundRef,
    boolean bReleaseEvent)
  + ### stopSoundLocal

    public void stopSoundLocal(long soundRef)

    Specified by:
    :   `stopSoundLocal` in class `BaseSoundEmitter`
  + ### stopOrTriggerSoundLocal

    public void stopOrTriggerSoundLocal(long soundRef)

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
  + ### limitSound

    private void limitSound([GameSound](../../zombie/audio/GameSound.html "class in zombie.audio") gameSound,
    int maxInstances)
  + ### setVolume

    public void setVolume(long soundRef,
    float volume)

    Specified by:
    :   `setVolume` in class `BaseSoundEmitter`
  + ### setPitch

    public void setPitch(long soundRef,
    float pitch)

    Specified by:
    :   `setPitch` in class `BaseSoundEmitter`
  + ### hasSustainPoints

    public boolean hasSustainPoints(long soundRef)

    Specified by:
    :   `hasSustainPoints` in class `BaseSoundEmitter`
  + ### triggerCue

    public void triggerCue(long soundRef)

    Specified by:
    :   `triggerCue` in class `BaseSoundEmitter`
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
    [IsoGameCharacter](../../zombie/characters/IsoGameCharacter.html "class in zombie.characters") character)

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
    [IsoGridSquare](../../zombie/iso/IsoGridSquare.html "class in zombie.iso") square)

    Specified by:
    :   `playSound` in class `BaseSoundEmitter`
  + ### playSoundImpl

    public long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoGridSquare](../../zombie/iso/IsoGridSquare.html "class in zombie.iso") square)

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
    [IsoObject](../../zombie/iso/IsoObject.html "class in zombie.iso") parent)

    Specified by:
    :   `playSoundImpl` in class `BaseSoundEmitter`
  + ### playSoundLooped

    public long playSoundLooped([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playSoundLooped` in class `BaseSoundEmitter`
  + ### playSoundLoopedImpl

    public long playSoundLoopedImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playSoundLoopedImpl` in class `BaseSoundEmitter`
  + ### playSound

    public long playSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../../zombie/iso/IsoObject.html "class in zombie.iso") parent)

    Specified by:
    :   `playSound` in class `BaseSoundEmitter`
  + ### playSoundImpl

    public long playSoundImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    [IsoObject](../../zombie/iso/IsoObject.html "class in zombie.iso") parent)

    Specified by:
    :   `playSoundImpl` in class `BaseSoundEmitter`
  + ### playClip

    public long playClip([GameSoundClip](../../zombie/audio/GameSoundClip.html "class in zombie.audio") clip,
    [IsoObject](../../zombie/iso/IsoObject.html "class in zombie.iso") parent)

    Specified by:
    :   `playClip` in class `BaseSoundEmitter`
  + ### playAmbientSound

    public long playAmbientSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `playAmbientSound` in class `BaseSoundEmitter`
  + ### playAmbientLoopedImpl

    public long playAmbientLoopedImpl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)

    Specified by:
    :   `playAmbientLoopedImpl` in class `BaseSoundEmitter`
  + ### set3D

    public void set3D(long soundRef,
    boolean is3D)

    Specified by:
    :   `set3D` in class `BaseSoundEmitter`
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

    public boolean isPlaying(long soundRef)

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
  + ### findInstance

    private int findInstance(long soundRef)
  + ### findInstance

    private int findInstance([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### findToStart

    private int findToStart(long soundRef)
  + ### findToStart

    private int findToStart([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### findStopped

    private int findStopped(long soundRef)
  + ### countToStart

    private int countToStart([GameSound](../../zombie/audio/GameSound.html "class in zombie.audio") gameSound)
  + ### countInstances

    private int countInstances([GameSound](../../zombie/audio/GameSound.html "class in zombie.audio") gameSound)
  + ### addParameter

    public void addParameter(zombie.audio.FMODParameter parameter)
  + ### setParameterValue

    public void setParameterValue(long soundRef,
    fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription,
    float value)

    Specified by:
    :   `setParameterValue` in class `BaseSoundEmitter`
  + ### setParameterValueByName

    public void setParameterValueByName(long soundRef,
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

    public void setTimelinePosition(long soundRef,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") positionName)

    Specified by:
    :   `setTimelinePosition` in class `BaseSoundEmitter`
  + ### findParameterValue

    private int findParameterValue(long soundRef,
    fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription)
  + ### clearParameters

    public void clearParameters()
  + ### startEvent

    private void startEvent(long eventInstance,
    [GameSoundClip](../../zombie/audio/GameSoundClip.html "class in zombie.audio") clip,
    boolean remote)
  + ### updateEvent

    private void updateEvent(long eventInstance,
    [GameSoundClip](../../zombie/audio/GameSoundClip.html "class in zombie.audio") clip)
  + ### stopEvent

    private void stopEvent(long eventInstance,
    [GameSoundClip](../../zombie/audio/GameSoundClip.html "class in zombie.audio") clip,
    boolean remote)
  + ### allocEventSound

    private [FMODSoundEmitter.EventSound](FMODSoundEmitter.EventSound.html "class in fmod.fmod") allocEventSound()
  + ### releaseEventSound

    private void releaseEventSound([FMODSoundEmitter.EventSound](FMODSoundEmitter.EventSound.html "class in fmod.fmod") sound)
  + ### allocFileSound

    private [FMODSoundEmitter.FileSound](FMODSoundEmitter.FileSound.html "class in fmod.fmod") allocFileSound()
  + ### releaseFileSound

    private void releaseFileSound([FMODSoundEmitter.FileSound](FMODSoundEmitter.FileSound.html "class in fmod.fmod") sound)
  + ### addSound

    private [FMODSoundEmitter.Sound](FMODSoundEmitter.Sound.html "class in fmod.fmod") addSound([GameSoundClip](../../zombie/audio/GameSoundClip.html "class in zombie.audio") clip,
    float volume,
    [IsoObject](../../zombie/iso/IsoObject.html "class in zombie.iso") parent)
  + ### sendStopSound

    private void sendStopSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName,
    boolean triggerCue)
  + ### update

    public static void update()
  + ### shouldPlayRemoteEvents

    private boolean shouldPlayRemoteEvents()