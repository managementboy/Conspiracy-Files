[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [BaseAmbientStreamManager](BaseAmbientStreamManager.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [BaseAmbientStreamManager()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [stop()](#stop())
   2. [doAlarm(RoomDef)](#doAlarm(zombie.iso.RoomDef))
   3. [doGunEvent()](#doGunEvent())
   4. [handleThunderEvent(int, int)](#handleThunderEvent(int,int))
   5. [init()](#init())
   6. [addBlend(String, float, boolean, boolean, boolean, boolean)](#addBlend(java.lang.String,float,boolean,boolean,boolean,boolean))
   7. [addRandomAmbient()](#addRandomAmbient())
   8. [doOneShotAmbients()](#doOneShotAmbients())
   9. [update()](#update())
   10. [addAmbient(String, int, int, int, float)](#addAmbient(java.lang.String,int,int,int,float))
   11. [addAmbientEmitter(float, float, int, String)](#addAmbientEmitter(float,float,int,java.lang.String))
   12. [addDaytimeAmbientEmitter(float, float, int, String)](#addDaytimeAmbientEmitter(float,float,int,java.lang.String))
   13. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   14. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   15. [checkHaveElectricity()](#checkHaveElectricity())
   16. [isParameterInsideTrue()](#isParameterInsideTrue())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class BaseAmbientStreamManager
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.BaseAmbientStreamManager

Direct Known Subclasses:
:   `AmbientSoundManager, AmbientStreamManager, DummyAmbientStreamManager`

---

public abstract class BaseAmbientStreamManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BaseAmbientStreamManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `abstract void`

  `addAmbient(String name,
  int x,
  int y,
  int radius,
  float volume)`

  `abstract void`

  `addAmbientEmitter(float x,
  float y,
  int z,
  String name)`

  `abstract void`

  `addBlend(String name,
  float vol,
  boolean bIndoors,
  boolean bRain,
  boolean bNight,
  boolean bDay)`

  `abstract void`

  `addDaytimeAmbientEmitter(float x,
  float y,
  int z,
  String name)`

  `protected abstract void`

  `addRandomAmbient()`

  `abstract void`

  `checkHaveElectricity()`

  `abstract void`

  `doAlarm(RoomDef room)`

  `abstract void`

  `doGunEvent()`

  `abstract void`

  `doOneShotAmbients()`

  `abstract void`

  `handleThunderEvent(int x,
  int y)`

  `abstract void`

  `init()`

  `abstract boolean`

  `isParameterInsideTrue()`

  `abstract void`

  `load(ByteBuffer bb,
  int worldVersion)`

  `abstract void`

  `save(ByteBuffer bb)`

  `abstract void`

  `stop()`

  `abstract void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### BaseAmbientStreamManager

    public BaseAmbientStreamManager()
* Method Details
  --------------

  + ### stop

    public abstract void stop()
  + ### doAlarm

    public abstract void doAlarm([RoomDef](iso/RoomDef.html "class in zombie.iso") room)
  + ### doGunEvent

    public abstract void doGunEvent()
  + ### handleThunderEvent

    public abstract void handleThunderEvent(int x,
    int y)
  + ### init

    public abstract void init()
  + ### addBlend

    public abstract void addBlend([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float vol,
    boolean bIndoors,
    boolean bRain,
    boolean bNight,
    boolean bDay)
  + ### addRandomAmbient

    protected abstract void addRandomAmbient()
  + ### doOneShotAmbients

    public abstract void doOneShotAmbients()
  + ### update

    public abstract void update()
  + ### addAmbient

    public abstract void addAmbient([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int x,
    int y,
    int radius,
    float volume)
  + ### addAmbientEmitter

    public abstract void addAmbientEmitter(float x,
    float y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### addDaytimeAmbientEmitter

    public abstract void addDaytimeAmbientEmitter(float x,
    float y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### save

    public abstract void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
  + ### load

    public abstract void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion)
  + ### checkHaveElectricity

    public abstract void checkHaveElectricity()
  + ### isParameterInsideTrue

    public abstract boolean isParameterInsideTrue()