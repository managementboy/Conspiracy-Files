[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [AmbientSoundManager](AmbientSoundManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [ambient](#ambient)
   2. [tempo](#tempo)
   3. [electricityShutOffState](#electricityShutOffState)
   4. [electricityShutOffTime](#electricityShutOffTime)
   5. [initialized](#initialized)
7. [Constructor Details](#constructor-detail)
   1. [AmbientSoundManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [update()](#update())
   2. [addAmbient(String, int, int, int, float)](#addAmbient(java.lang.String,int,int,int,float))
   3. [addAmbientEmitter(float, float, int, String)](#addAmbientEmitter(float,float,int,java.lang.String))
   4. [addDaytimeAmbientEmitter(float, float, int, String)](#addDaytimeAmbientEmitter(float,float,int,java.lang.String))
   5. [doOneShotAmbients()](#doOneShotAmbients())
   6. [init()](#init())
   7. [addBlend(String, float, boolean, boolean, boolean, boolean)](#addBlend(java.lang.String,float,boolean,boolean,boolean,boolean))
   8. [addRandomAmbient()](#addRandomAmbient())
   9. [doGunEvent()](#doGunEvent())
   10. [doAlarm(RoomDef)](#doAlarm(zombie.iso.RoomDef))
   11. [GetDistance(int, int, int, int)](#GetDistance(int,int,int,int))
   12. [handleThunderEvent(int, int)](#handleThunderEvent(int,int))
   13. [stop()](#stop())
   14. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   15. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   16. [updatePowerSupply()](#updatePowerSupply())
   17. [checkHaveElectricity()](#checkHaveElectricity())
   18. [isParameterInsideTrue()](#isParameterInsideTrue())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class AmbientSoundManager
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.BaseAmbientStreamManager](BaseAmbientStreamManager.html "class in zombie")

zombie.AmbientSoundManager

---

public final class AmbientSoundManager
extends [BaseAmbientStreamManager](BaseAmbientStreamManager.html "class in zombie")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `class`

  `AmbientSoundManager.Ambient`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ArrayList<AmbientSoundManager.Ambient>`

  `ambient`

  `private int`

  `electricityShutOffState`

  `private long`

  `electricityShutOffTime`

  `boolean`

  `initialized`

  `private final Vector2`

  `tempo`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AmbientSoundManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAmbient(String name,
  int x,
  int y,
  int radius,
  float volume)`

  `void`

  `addAmbientEmitter(float x,
  float y,
  int z,
  String name)`

  `void`

  `addBlend(String name,
  float vol,
  boolean bIndoors,
  boolean bRain,
  boolean bNight,
  boolean bDay)`

  `void`

  `addDaytimeAmbientEmitter(float x,
  float y,
  int z,
  String name)`

  `protected void`

  `addRandomAmbient()`

  `void`

  `checkHaveElectricity()`

  `void`

  `doAlarm(RoomDef room)`

  `void`

  `doGunEvent()`

  `void`

  `doOneShotAmbients()`

  `private int`

  `GetDistance(int dx,
  int dy,
  int sx,
  int sy)`

  `void`

  `handleThunderEvent(int x,
  int y)`

  `void`

  `init()`

  `boolean`

  `isParameterInsideTrue()`

  `void`

  `load(ByteBuffer bb,
  int worldVersion)`

  `void`

  `save(ByteBuffer bb)`

  `void`

  `stop()`

  `void`

  `update()`

  `private void`

  `updatePowerSupply()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### ambient

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AmbientSoundManager.Ambient](AmbientSoundManager.Ambient.html "class in zombie")> ambient
  + ### tempo

    private final [Vector2](iso/Vector2.html "class in zombie.iso") tempo
  + ### electricityShutOffState

    private int electricityShutOffState
  + ### electricityShutOffTime

    private long electricityShutOffTime
  + ### initialized

    public boolean initialized
* Constructor Details
  -------------------

  + ### AmbientSoundManager

    public AmbientSoundManager()
* Method Details
  --------------

  + ### update

    public void update()

    Specified by:
    :   `update` in class `BaseAmbientStreamManager`
  + ### addAmbient

    public void addAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int x,
    int y,
    int radius,
    float volume)

    Specified by:
    :   `addAmbient` in class `BaseAmbientStreamManager`
  + ### addAmbientEmitter

    public void addAmbientEmitter(float x,
    float y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `addAmbientEmitter` in class `BaseAmbientStreamManager`
  + ### addDaytimeAmbientEmitter

    public void addDaytimeAmbientEmitter(float x,
    float y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Specified by:
    :   `addDaytimeAmbientEmitter` in class `BaseAmbientStreamManager`
  + ### doOneShotAmbients

    public void doOneShotAmbients()

    Specified by:
    :   `doOneShotAmbients` in class `BaseAmbientStreamManager`
  + ### init

    public void init()

    Specified by:
    :   `init` in class `BaseAmbientStreamManager`
  + ### addBlend

    public void addBlend([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float vol,
    boolean bIndoors,
    boolean bRain,
    boolean bNight,
    boolean bDay)

    Specified by:
    :   `addBlend` in class `BaseAmbientStreamManager`
  + ### addRandomAmbient

    protected void addRandomAmbient()

    Specified by:
    :   `addRandomAmbient` in class `BaseAmbientStreamManager`
  + ### doGunEvent

    public void doGunEvent()

    Specified by:
    :   `doGunEvent` in class `BaseAmbientStreamManager`
  + ### doAlarm

    public void doAlarm([RoomDef](iso/RoomDef.html "class in zombie.iso") room)

    Specified by:
    :   `doAlarm` in class `BaseAmbientStreamManager`
  + ### GetDistance

    private int GetDistance(int dx,
    int dy,
    int sx,
    int sy)
  + ### handleThunderEvent

    public void handleThunderEvent(int x,
    int y)

    Specified by:
    :   `handleThunderEvent` in class `BaseAmbientStreamManager`
  + ### stop

    public void stop()

    Specified by:
    :   `stop` in class `BaseAmbientStreamManager`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)

    Specified by:
    :   `save` in class `BaseAmbientStreamManager`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion)

    Specified by:
    :   `load` in class `BaseAmbientStreamManager`
  + ### updatePowerSupply

    private void updatePowerSupply()
  + ### checkHaveElectricity

    public void checkHaveElectricity()

    Specified by:
    :   `checkHaveElectricity` in class `BaseAmbientStreamManager`
  + ### isParameterInsideTrue

    public boolean isParameterInsideTrue()

    Specified by:
    :   `isParameterInsideTrue` in class `BaseAmbientStreamManager`