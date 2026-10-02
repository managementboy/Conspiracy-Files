[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ThunderStorm](ThunderStorm.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [mapMinX](#mapMinX)
   2. [mapMinY](#mapMinY)
   3. [mapMaxX](#mapMaxX)
   4. [mapMaxY](#mapMaxY)
   5. [hasActiveThunderClouds](#hasActiveThunderClouds)
   6. [cloudMaxRadius](#cloudMaxRadius)
   7. [events](#events)
   8. [clouds](#clouds)
   9. [climateManager](#climateManager)
   10. [cloudCache](#cloudCache)
   11. [donoise](#donoise)
   12. [strikeRadius](#strikeRadius)
   13. [lightningInfos](#lightningInfos)
   14. [networkThunderEvent](#networkThunderEvent)
   15. [dummyCloud](#dummyCloud)
7. [Constructor Details](#constructor-detail)
   1. [ThunderStorm(ClimateManager)](#%3Cinit%3E(zombie.iso.weather.ClimateManager))
8. [Method Details](#method-detail)
   1. [getClouds()](#getClouds())
   2. [getFreeEvent()](#getFreeEvent())
   3. [getFreeCloud()](#getFreeCloud())
   4. [getCloud(int)](#getCloud(int))
   5. [HasActiveThunderClouds()](#HasActiveThunderClouds())
   6. [noise(String)](#noise(java.lang.String))
   7. [stopAllClouds()](#stopAllClouds())
   8. [stopCloud(int)](#stopCloud(int))
   9. [addToAngle(float, float)](#addToAngle(float,float))
   10. [getMapDiagonal()](#getMapDiagonal())
   11. [startThunderCloud(float, float, float, float, float, double, boolean)](#startThunderCloud(float,float,float,float,float,double,boolean))
   12. [startThunderCloud(float, float, float, float, float, double, boolean, float)](#startThunderCloud(float,float,float,float,float,double,boolean,float))
   13. [update(double)](#update(double))
   14. [applyLightningForPlayer(RenderSettings.PlayerRenderSettings, int, IsoPlayer)](#applyLightningForPlayer(zombie.core.opengl.RenderSettings.PlayerRenderSettings,int,zombie.characters.IsoPlayer))
   15. [isModifyingNight()](#isModifyingNight())
   16. [triggerThunderEvent(int, int, boolean, boolean, boolean)](#triggerThunderEvent(int,int,boolean,boolean,boolean))
   17. [writeNetThunderEvent(ByteBufferWriter)](#writeNetThunderEvent(zombie.core.network.ByteBufferWriter))
   18. [readNetThunderEvent(ByteBufferReader)](#readNetThunderEvent(zombie.core.network.ByteBufferReader))
   19. [enqueueThunderEvent(int, int, boolean, boolean, boolean)](#enqueueThunderEvent(int,int,boolean,boolean,boolean))
   20. [GetDistance(int, int, int, int)](#GetDistance(int,int,int,int))
   21. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   22. [load(DataInputStream)](#load(java.io.DataInputStream))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ThunderStorm
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ThunderStorm

---

public class ThunderStorm
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static enum`

  `ThunderStorm.LightningState`

  `private class`

  `ThunderStorm.PlayerLightningInfo`

  `static class`

  `ThunderStorm.ThunderCloud`

  `private static class`

  `ThunderStorm.ThunderEvent`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ClimateManager`

  `climateManager`

  `private ArrayList<ThunderStorm.ThunderCloud>`

  `cloudCache`

  `private final float`

  `cloudMaxRadius`

  `private final ThunderStorm.ThunderCloud[]`

  `clouds`

  `private final boolean`

  `donoise`

  `private ThunderStorm.ThunderCloud`

  `dummyCloud`

  `private final ThunderStorm.ThunderEvent[]`

  `events`

  `private boolean`

  `hasActiveThunderClouds`

  `private final ThunderStorm.PlayerLightningInfo[]`

  `lightningInfos`

  `static int`

  `mapMaxX`

  `static int`

  `mapMaxY`

  `static int`

  `mapMinX`

  `static int`

  `mapMinY`

  `private final ThunderStorm.ThunderEvent`

  `networkThunderEvent`

  `private int`

  `strikeRadius`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ThunderStorm(ClimateManager climmgr)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static float`

  `addToAngle(float angle,
  float addition)`

  `void`

  `applyLightningForPlayer(zombie.core.opengl.RenderSettings.PlayerRenderSettings renderSettings,
  int plrIndex,
  IsoPlayer player)`

  `void`

  `enqueueThunderEvent(int x,
  int y,
  boolean doStrike,
  boolean doLightning,
  boolean doRumble)`

  `private ThunderStorm.ThunderCloud`

  `getCloud(int id)`

  `ArrayList<ThunderStorm.ThunderCloud>`

  `getClouds()`

  `private int`

  `GetDistance(int dx,
  int dy,
  int sx,
  int sy)`

  `private ThunderStorm.ThunderCloud`

  `getFreeCloud()`

  `private ThunderStorm.ThunderEvent`

  `getFreeEvent()`

  `static int`

  `getMapDiagonal()`

  `boolean`

  `HasActiveThunderClouds()`

  `boolean`

  `isModifyingNight()`

  `void`

  `load(DataInputStream input)`

  `void`

  `noise(String s)`

  `void`

  `readNetThunderEvent(zombie.core.network.ByteBufferReader input)`

  `void`

  `save(DataOutputStream output)`

  `void`

  `startThunderCloud(float str,
  float angle,
  float radius,
  float eventFreq,
  float thunderRatio,
  double duration,
  boolean targetRandomPlayer)`

  `ThunderStorm.ThunderCloud`

  `startThunderCloud(float str,
  float angle,
  float radius,
  float eventFreq,
  float thunderRatio,
  double duration,
  boolean targetRandomPlayer,
  float percentageOffset)`

  `void`

  `stopAllClouds()`

  `void`

  `stopCloud(int id)`

  `void`

  `triggerThunderEvent(int x,
  int y,
  boolean doStrike,
  boolean doLightning,
  boolean doRumble)`

  `void`

  `update(double currentTime)`

  `void`

  `writeNetThunderEvent(zombie.core.network.ByteBufferWriter output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### mapMinX

    public static int mapMinX
  + ### mapMinY

    public static int mapMinY
  + ### mapMaxX

    public static int mapMaxX
  + ### mapMaxY

    public static int mapMaxY
  + ### hasActiveThunderClouds

    private boolean hasActiveThunderClouds
  + ### cloudMaxRadius

    private final float cloudMaxRadius

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ThunderStorm.cloudMaxRadius)
  + ### events

    private final [ThunderStorm.ThunderEvent](ThunderStorm.ThunderEvent.html "class in zombie.iso.weather")[] events
  + ### clouds

    private final [ThunderStorm.ThunderCloud](ThunderStorm.ThunderCloud.html "class in zombie.iso.weather")[] clouds
  + ### climateManager

    private final [ClimateManager](ClimateManager.html "class in zombie.iso.weather") climateManager
  + ### cloudCache

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ThunderStorm.ThunderCloud](ThunderStorm.ThunderCloud.html "class in zombie.iso.weather")> cloudCache
  + ### donoise

    private final boolean donoise

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ThunderStorm.donoise)
  + ### strikeRadius

    private int strikeRadius
  + ### lightningInfos

    private final [ThunderStorm.PlayerLightningInfo](ThunderStorm.PlayerLightningInfo.html "class in zombie.iso.weather")[] lightningInfos
  + ### networkThunderEvent

    private final [ThunderStorm.ThunderEvent](ThunderStorm.ThunderEvent.html "class in zombie.iso.weather") networkThunderEvent
  + ### dummyCloud

    private [ThunderStorm.ThunderCloud](ThunderStorm.ThunderCloud.html "class in zombie.iso.weather") dummyCloud
* Constructor Details
  -------------------

  + ### ThunderStorm

    public ThunderStorm([ClimateManager](ClimateManager.html "class in zombie.iso.weather") climmgr)
* Method Details
  --------------

  + ### getClouds

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ThunderStorm.ThunderCloud](ThunderStorm.ThunderCloud.html "class in zombie.iso.weather")> getClouds()
  + ### getFreeEvent

    private [ThunderStorm.ThunderEvent](ThunderStorm.ThunderEvent.html "class in zombie.iso.weather") getFreeEvent()
  + ### getFreeCloud

    private [ThunderStorm.ThunderCloud](ThunderStorm.ThunderCloud.html "class in zombie.iso.weather") getFreeCloud()
  + ### getCloud

    private [ThunderStorm.ThunderCloud](ThunderStorm.ThunderCloud.html "class in zombie.iso.weather") getCloud(int id)
  + ### HasActiveThunderClouds

    public boolean HasActiveThunderClouds()
  + ### noise

    public void noise([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### stopAllClouds

    public void stopAllClouds()
  + ### stopCloud

    public void stopCloud(int id)
  + ### addToAngle

    private static float addToAngle(float angle,
    float addition)
  + ### getMapDiagonal

    public static int getMapDiagonal()
  + ### startThunderCloud

    public void startThunderCloud(float str,
    float angle,
    float radius,
    float eventFreq,
    float thunderRatio,
    double duration,
    boolean targetRandomPlayer)
  + ### startThunderCloud

    public [ThunderStorm.ThunderCloud](ThunderStorm.ThunderCloud.html "class in zombie.iso.weather") startThunderCloud(float str,
    float angle,
    float radius,
    float eventFreq,
    float thunderRatio,
    double duration,
    boolean targetRandomPlayer,
    float percentageOffset)
  + ### update

    public void update(double currentTime)
  + ### applyLightningForPlayer

    public void applyLightningForPlayer(zombie.core.opengl.RenderSettings.PlayerRenderSettings renderSettings,
    int plrIndex,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### isModifyingNight

    public boolean isModifyingNight()
  + ### triggerThunderEvent

    public void triggerThunderEvent(int x,
    int y,
    boolean doStrike,
    boolean doLightning,
    boolean doRumble)
  + ### writeNetThunderEvent

    public void writeNetThunderEvent(zombie.core.network.ByteBufferWriter output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### readNetThunderEvent

    public void readNetThunderEvent(zombie.core.network.ByteBufferReader input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### enqueueThunderEvent

    public void enqueueThunderEvent(int x,
    int y,
    boolean doStrike,
    boolean doLightning,
    boolean doRumble)
  + ### GetDistance

    private int GetDistance(int dx,
    int dy,
    int sx,
    int sy)
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`