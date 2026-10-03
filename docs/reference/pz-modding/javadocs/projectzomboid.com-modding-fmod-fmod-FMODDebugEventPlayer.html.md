[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [fmod.fmod](package-summary.html)
2. [FMODDebugEventPlayer](FMODDebugEventPlayer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [eventPath](#eventPath)
   2. [eventDescription](#eventDescription)
   3. [eventInstance](#eventInstance)
   4. [durationMs](#durationMs)
   5. [startTimeMs](#startTimeMs)
   6. [loop](#loop)
   7. [volume](#volume)
   8. [timelinePosition](#timelinePosition)
   9. [setVolume](#setVolume)
   10. [setOcclusion](#setOcclusion)
   11. [followPlayer](#followPlayer)
   12. [triggeredCue](#triggeredCue)
   13. [checkTimeMs](#checkTimeMs)
   14. [x](#x)
   15. [y](#y)
   16. [z](#z)
   17. [parameterValues](#parameterValues)
   18. [parameterValuePool](#parameterValuePool)
7. [Constructor Details](#constructor-detail)
   1. [FMODDebugEventPlayer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [play(String)](#play(java.lang.String))
   2. [stop()](#stop())
   3. [stop(boolean)](#stop(boolean))
   4. [setDurationMillis(long)](#setDurationMillis(long))
   5. [setLoop(boolean)](#setLoop(boolean))
   6. [setFollowPlayer(boolean)](#setFollowPlayer(boolean))
   7. [setVolume(float)](#setVolume(float))
   8. [setTimelinePosition(int)](#setTimelinePosition(int))
   9. [updateOcclusion()](#updateOcclusion())
   10. [calculateValueForPlayer(int)](#calculateValueForPlayer(int))
   11. [update()](#update())
   12. [isPlaying()](#isPlaying())
   13. [initParameterValues(String)](#initParameterValues(java.lang.String))
   14. [setPreviousValue(FMODDebugEventPlayer.ParameterValue, ArrayList)](#setPreviousValue(fmod.fmod.FMODDebugEventPlayer.ParameterValue,java.util.ArrayList))
   15. [getParameterCount(String)](#getParameterCount(java.lang.String))
   16. [getParameterName(String, int)](#getParameterName(java.lang.String,int))
   17. [setParameterValue(int, float)](#setParameterValue(int,float))
   18. [clearParameterValue(int)](#clearParameterValue(int))
   19. [getParameterValue(int)](#getParameterValue(int))
   20. [isGlobalParameter(String, int)](#isGlobalParameter(java.lang.String,int))
   21. [getGlobalParameterValue(String, int)](#getGlobalParameterValue(java.lang.String,int))
   22. [updateParameterValues()](#updateParameterValues())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FMODDebugEventPlayer
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

fmod.fmod.FMODDebugEventPlayer

---

public final class FMODDebugEventPlayer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `FMODDebugEventPlayer.ParameterValue`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private long`

  `checkTimeMs`

  `private long`

  `durationMs`

  `(package private) fmod.fmod.FMOD_STUDIO_EVENT_DESCRIPTION`

  `eventDescription`

  `private long`

  `eventInstance`

  `private String`

  `eventPath`

  `private boolean`

  `followPlayer`

  `private boolean`

  `loop`

  `private final zombie.popman.ObjectPool<FMODDebugEventPlayer.ParameterValue>`

  `parameterValuePool`

  `private final ArrayList<FMODDebugEventPlayer.ParameterValue>`

  `parameterValues`

  `private float`

  `setOcclusion`

  `private float`

  `setVolume`

  `private long`

  `startTimeMs`

  `private int`

  `timelinePosition`

  `private boolean`

  `triggeredCue`

  `private float`

  `volume`

  `private float`

  `x`

  `private float`

  `y`

  `private float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FMODDebugEventPlayer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private float`

  `calculateValueForPlayer(int playerIndex)`

  `void`

  `clearParameterValue(int index)`

  `float`

  `getGlobalParameterValue(String eventPath,
  int index)`

  `int`

  `getParameterCount(String eventPath)`

  `String`

  `getParameterName(String eventPath,
  int index)`

  `float`

  `getParameterValue(int index)`

  `void`

  `initParameterValues(String eventPath)`

  `boolean`

  `isGlobalParameter(String eventPath,
  int index)`

  `boolean`

  `isPlaying()`

  `void`

  `play(String eventPath)`

  `void`

  `setDurationMillis(long ms)`

  `void`

  `setFollowPlayer(boolean bFollowPlayer)`

  `void`

  `setLoop(boolean bLoop)`

  `void`

  `setParameterValue(int index,
  float value)`

  `private void`

  `setPreviousValue(FMODDebugEventPlayer.ParameterValue parameterValue,
  ArrayList<FMODDebugEventPlayer.ParameterValue> previousValues)`

  `void`

  `setTimelinePosition(int ms)`

  `void`

  `setVolume(float volume)`

  `void`

  `stop()`

  `void`

  `stop(boolean bTriggerCue)`

  `void`

  `update()`

  `private void`

  `updateOcclusion()`

  `private void`

  `updateParameterValues()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### eventPath

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventPath
  + ### eventDescription

    fmod.fmod.FMOD\_STUDIO\_EVENT\_DESCRIPTION eventDescription
  + ### eventInstance

    private long eventInstance
  + ### durationMs

    private long durationMs
  + ### startTimeMs

    private long startTimeMs
  + ### loop

    private boolean loop
  + ### volume

    private float volume
  + ### timelinePosition

    private int timelinePosition
  + ### setVolume

    private float setVolume
  + ### setOcclusion

    private float setOcclusion
  + ### followPlayer

    private boolean followPlayer
  + ### triggeredCue

    private boolean triggeredCue
  + ### checkTimeMs

    private long checkTimeMs
  + ### x

    private float x
  + ### y

    private float y
  + ### z

    private float z
  + ### parameterValues

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FMODDebugEventPlayer.ParameterValue](FMODDebugEventPlayer.ParameterValue.html "class in fmod.fmod")> parameterValues
  + ### parameterValuePool

    private final zombie.popman.ObjectPool<[FMODDebugEventPlayer.ParameterValue](FMODDebugEventPlayer.ParameterValue.html "class in fmod.fmod")> parameterValuePool
* Constructor Details
  -------------------

  + ### FMODDebugEventPlayer

    public FMODDebugEventPlayer()
* Method Details
  --------------

  + ### play

    public void play([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventPath)
  + ### stop

    public void stop()
  + ### stop

    public void stop(boolean bTriggerCue)
  + ### setDurationMillis

    public void setDurationMillis(long ms)
  + ### setLoop

    public void setLoop(boolean bLoop)
  + ### setFollowPlayer

    public void setFollowPlayer(boolean bFollowPlayer)
  + ### setVolume

    public void setVolume(float volume)
  + ### setTimelinePosition

    public void setTimelinePosition(int ms)
  + ### updateOcclusion

    private void updateOcclusion()
  + ### calculateValueForPlayer

    private float calculateValueForPlayer(int playerIndex)
  + ### update

    public void update()
  + ### isPlaying

    public boolean isPlaying()
  + ### initParameterValues

    public void initParameterValues([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventPath)
  + ### setPreviousValue

    private void setPreviousValue([FMODDebugEventPlayer.ParameterValue](FMODDebugEventPlayer.ParameterValue.html "class in fmod.fmod") parameterValue,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FMODDebugEventPlayer.ParameterValue](FMODDebugEventPlayer.ParameterValue.html "class in fmod.fmod")> previousValues)
  + ### getParameterCount

    public int getParameterCount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventPath)
  + ### getParameterName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getParameterName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventPath,
    int index)
  + ### setParameterValue

    public void setParameterValue(int index,
    float value)
  + ### clearParameterValue

    public void clearParameterValue(int index)
  + ### getParameterValue

    public float getParameterValue(int index)
  + ### isGlobalParameter

    public boolean isGlobalParameter([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventPath,
    int index)
  + ### getGlobalParameterValue

    public float getGlobalParameterValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") eventPath,
    int index)
  + ### updateParameterValues

    private void updateParameterValues()