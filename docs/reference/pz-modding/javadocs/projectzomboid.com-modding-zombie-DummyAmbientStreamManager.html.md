[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [DummyAmbientStreamManager](DummyAmbientStreamManager.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [DummyAmbientStreamManager()](#%3Cinit%3E())
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

Class DummyAmbientStreamManager
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.BaseAmbientStreamManager](BaseAmbientStreamManager.html "class in zombie")

zombie.DummyAmbientStreamManager

---

public final class DummyAmbientStreamManager
extends [BaseAmbientStreamManager](BaseAmbientStreamManager.html "class in zombie")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DummyAmbientStreamManager()`
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

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### DummyAmbientStreamManager

    public DummyAmbientStreamManager()
* Method Details
  --------------

  + ### stop

    public void stop()

    Specified by:
    :   `stop` in class `BaseAmbientStreamManager`
  + ### doAlarm

    public void doAlarm([RoomDef](iso/RoomDef.html "class in zombie.iso") room)

    Specified by:
    :   `doAlarm` in class `BaseAmbientStreamManager`
  + ### doGunEvent

    public void doGunEvent()

    Specified by:
    :   `doGunEvent` in class `BaseAmbientStreamManager`
  + ### handleThunderEvent

    public void handleThunderEvent(int x,
    int y)

    Specified by:
    :   `handleThunderEvent` in class `BaseAmbientStreamManager`
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
  + ### doOneShotAmbients

    public void doOneShotAmbients()

    Specified by:
    :   `doOneShotAmbients` in class `BaseAmbientStreamManager`
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
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)

    Specified by:
    :   `save` in class `BaseAmbientStreamManager`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb,
    int worldVersion)

    Specified by:
    :   `load` in class `BaseAmbientStreamManager`
  + ### checkHaveElectricity

    public void checkHaveElectricity()

    Specified by:
    :   `checkHaveElectricity` in class `BaseAmbientStreamManager`
  + ### isParameterInsideTrue

    public boolean isParameterInsideTrue()

    Specified by:
    :   `isParameterInsideTrue` in class `BaseAmbientStreamManager`