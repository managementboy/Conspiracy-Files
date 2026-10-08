[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [WeatherPeriod](WeatherPeriod.html)
3. [WeatherStage](WeatherPeriod.WeatherStage.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [previousStage](#previousStage)
   2. [nextStage](#nextStage)
   3. [stageStart](#stageStart)
   4. [stageEnd](#stageEnd)
   5. [stageDuration](#stageDuration)
   6. [stageId](#stageId)
   7. [entryStrength](#entryStrength)
   8. [exitStrength](#exitStrength)
   9. [targetStrength](#targetStrength)
   10. [lerpMidVal](#lerpMidVal)
   11. [lerpEndVal](#lerpEndVal)
   12. [hasStartedCloud](#hasStartedCloud)
   13. [fogStrength](#fogStrength)
   14. [linearT](#linearT)
   15. [parabolicT](#parabolicT)
   16. [isCycleFirstHalf](#isCycleFirstHalf)
   17. [creationFinished](#creationFinished)
   18. [modId](#modId)
   19. [m](#m)
   20. [e](#e)
6. [Constructor Details](#constructor-detail)
   1. [WeatherStage()](#%3Cinit%3E())
   2. [WeatherStage(int)](#%3Cinit%3E(int))
7. [Method Details](#method-detail)
   1. [setStageID(int)](#setStageID(int))
   2. [getStageStart()](#getStageStart())
   3. [getStageEnd()](#getStageEnd())
   4. [getStageDuration()](#getStageDuration())
   5. [getStageID()](#getStageID())
   6. [getModID()](#getModID())
   7. [getLinearT()](#getLinearT())
   8. [getParabolicT()](#getParabolicT())
   9. [setTargetStrength(float)](#setTargetStrength(float))
   10. [getHasStartedCloud()](#getHasStartedCloud())
   11. [setHasStartedCloud(boolean)](#setHasStartedCloud(boolean))
   12. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   13. [load(DataInputStream, int)](#load(java.io.DataInputStream,int))
   14. [reset()](#reset())
   15. [startStage(double)](#startStage(double))
   16. [setStageStart(double)](#setStageStart(double))
   17. [setStageDuration(double)](#setStageDuration(double))
   18. [overrideStageDuration(double)](#overrideStageDuration(double))
   19. [lerpEntryTo(int, int)](#lerpEntryTo(int,int))
   20. [lerpEntryTo(WeatherPeriod.StrLerpVal)](#lerpEntryTo(zombie.iso.weather.WeatherPeriod.StrLerpVal))
   21. [lerpEntryTo(WeatherPeriod.StrLerpVal, WeatherPeriod.StrLerpVal)](#lerpEntryTo(zombie.iso.weather.WeatherPeriod.StrLerpVal,zombie.iso.weather.WeatherPeriod.StrLerpVal))
   22. [getStageCurrentStrength()](#getStageCurrentStrength())
   23. [getLerpValue(WeatherPeriod.StrLerpVal)](#getLerpValue(zombie.iso.weather.WeatherPeriod.StrLerpVal))
   24. [updateT(double)](#updateT(double))
   25. [getPeriodLerpT(double)](#getPeriodLerpT(double))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WeatherPeriod.WeatherStage
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.WeatherPeriod.WeatherStage

Enclosing class:
:   `WeatherPeriod`

---

public static class WeatherPeriod.WeatherStage
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected boolean`

  `creationFinished`

  `private float`

  `e`

  `protected float`

  `entryStrength`

  `protected float`

  `exitStrength`

  `protected float`

  `fogStrength`

  `protected boolean`

  `hasStartedCloud`

  `protected boolean`

  `isCycleFirstHalf`

  `protected WeatherPeriod.StrLerpVal`

  `lerpEndVal`

  `protected WeatherPeriod.StrLerpVal`

  `lerpMidVal`

  `protected float`

  `linearT`

  `private float`

  `m`

  `protected String`

  `modId`

  `protected WeatherPeriod.WeatherStage`

  `nextStage`

  `protected float`

  `parabolicT`

  `protected WeatherPeriod.WeatherStage`

  `previousStage`

  `private double`

  `stageDuration`

  `private double`

  `stageEnd`

  `protected int`

  `stageId`

  `private double`

  `stageStart`

  `protected float`

  `targetStrength`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WeatherStage()`

  `WeatherStage(int id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `getHasStartedCloud()`

  `private float`

  `getLerpValue(WeatherPeriod.StrLerpVal lerpVal)`

  `float`

  `getLinearT()`

  `String`

  `getModID()`

  `float`

  `getParabolicT()`

  `private float`

  `getPeriodLerpT(double hour)`

  `float`

  `getStageCurrentStrength()`

  `double`

  `getStageDuration()`

  `double`

  `getStageEnd()`

  `int`

  `getStageID()`

  `double`

  `getStageStart()`

  `void`

  `lerpEntryTo(int mid,
  int end)`

  `protected void`

  `lerpEntryTo(WeatherPeriod.StrLerpVal end)`

  `protected void`

  `lerpEntryTo(WeatherPeriod.StrLerpVal mid,
  WeatherPeriod.StrLerpVal end)`

  `void`

  `load(DataInputStream input,
  int worldVersion)`

  `protected WeatherPeriod.WeatherStage`

  `overrideStageDuration(double time)`

  `protected void`

  `reset()`

  `void`

  `save(DataOutputStream output)`

  `void`

  `setHasStartedCloud(boolean b)`

  `protected WeatherPeriod.WeatherStage`

  `setStageDuration(double time)`

  `void`

  `setStageID(int id)`

  `protected double`

  `setStageStart(double worldAgeHours)`

  `void`

  `setTargetStrength(float t)`

  `protected WeatherPeriod.WeatherStage`

  `startStage(double exitTime)`

  `private WeatherPeriod.WeatherStage`

  `updateT(double hour)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### previousStage

    protected [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") previousStage
  + ### nextStage

    protected [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") nextStage
  + ### stageStart

    private double stageStart
  + ### stageEnd

    private double stageEnd
  + ### stageDuration

    private double stageDuration
  + ### stageId

    protected int stageId
  + ### entryStrength

    protected float entryStrength
  + ### exitStrength

    protected float exitStrength
  + ### targetStrength

    protected float targetStrength
  + ### lerpMidVal

    protected [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") lerpMidVal
  + ### lerpEndVal

    protected [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") lerpEndVal
  + ### hasStartedCloud

    protected boolean hasStartedCloud
  + ### fogStrength

    protected float fogStrength
  + ### linearT

    protected float linearT
  + ### parabolicT

    protected float parabolicT
  + ### isCycleFirstHalf

    protected boolean isCycleFirstHalf
  + ### creationFinished

    protected boolean creationFinished
  + ### modId

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId
  + ### m

    private float m
  + ### e

    private float e
* Constructor Details
  -------------------

  + ### WeatherStage

    public WeatherStage()
  + ### WeatherStage

    public WeatherStage(int id)
* Method Details
  --------------

  + ### setStageID

    public void setStageID(int id)
  + ### getStageStart

    public double getStageStart()
  + ### getStageEnd

    public double getStageEnd()
  + ### getStageDuration

    public double getStageDuration()
  + ### getStageID

    public int getStageID()
  + ### getModID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModID()
  + ### getLinearT

    public float getLinearT()
  + ### getParabolicT

    public float getParabolicT()
  + ### setTargetStrength

    public void setTargetStrength(float t)
  + ### getHasStartedCloud

    public boolean getHasStartedCloud()
  + ### setHasStartedCloud

    public void setHasStartedCloud(boolean b)
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### reset

    protected void reset()
  + ### startStage

    protected [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") startStage(double exitTime)
  + ### setStageStart

    protected double setStageStart(double worldAgeHours)
  + ### setStageDuration

    protected [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") setStageDuration(double time)
  + ### overrideStageDuration

    protected [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") overrideStageDuration(double time)
  + ### lerpEntryTo

    public void lerpEntryTo(int mid,
    int end)
  + ### lerpEntryTo

    protected void lerpEntryTo([WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") end)
  + ### lerpEntryTo

    protected void lerpEntryTo([WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") mid,
    [WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") end)
  + ### getStageCurrentStrength

    public float getStageCurrentStrength()
  + ### getLerpValue

    private float getLerpValue([WeatherPeriod.StrLerpVal](WeatherPeriod.StrLerpVal.html "enum class in zombie.iso.weather") lerpVal)
  + ### updateT

    private [WeatherPeriod.WeatherStage](WeatherPeriod.WeatherStage.html "class in zombie.iso.weather") updateT(double hour)
  + ### getPeriodLerpT

    private float getPeriodLerpT(double hour)