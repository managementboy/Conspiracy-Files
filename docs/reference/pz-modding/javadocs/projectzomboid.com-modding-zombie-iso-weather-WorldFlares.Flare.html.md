[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [WorldFlares](WorldFlares.html)
3. [Flare](WorldFlares.Flare.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [x](#x)
   3. [y](#y)
   4. [range](#range)
   5. [windSpeed](#windSpeed)
   6. [color](#color)
   7. [hasLaunched](#hasLaunched)
   8. [intensity](#intensity)
   9. [maxLifeTime](#maxLifeTime)
   10. [lifeTime](#lifeTime)
   11. [nextRandomTargetIntens](#nextRandomTargetIntens)
   12. [perc](#perc)
   13. [infos](#infos)
6. [Constructor Details](#constructor-detail)
   1. [Flare()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getId()](#getId())
   2. [getX()](#getX())
   3. [getY()](#getY())
   4. [getRange()](#getRange())
   5. [getWindSpeed()](#getWindSpeed())
   6. [getColor()](#getColor())
   7. [isHasLaunched()](#isHasLaunched())
   8. [getIntensity()](#getIntensity())
   9. [getMaxLifeTime()](#getMaxLifeTime())
   10. [getLifeTime()](#getLifeTime())
   11. [getPercent()](#getPercent())
   12. [getIntensityPlayer(int)](#getIntensityPlayer(int))
   13. [getLerpPlayer(int)](#getLerpPlayer(int))
   14. [getDistModPlayer(int)](#getDistModPlayer(int))
   15. [getColorPlayer(int)](#getColorPlayer(int))
   16. [getOutColorPlayer(int)](#getOutColorPlayer(int))
   17. [GetDistance(int, int, int, int)](#GetDistance(int,int,int,int))
   18. [update()](#update())
   19. [applyFlare(RenderSettings.PlayerRenderSettings, int, IsoPlayer)](#applyFlare(zombie.core.opengl.RenderSettings.PlayerRenderSettings,int,zombie.characters.IsoPlayer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WorldFlares.Flare
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.WorldFlares.Flare

Enclosing class:
:   `WorldFlares`

---

public static class WorldFlares.Flare
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ClimateColorInfo`

  `color`

  `private boolean`

  `hasLaunched`

  `private int`

  `id`

  `private final WorldFlares.PlayerFlareLightInfo[]`

  `infos`

  `private final zombie.iso.weather.fx.SteppedUpdateFloat`

  `intensity`

  `private float`

  `lifeTime`

  `private float`

  `maxLifeTime`

  `private int`

  `nextRandomTargetIntens`

  `private float`

  `perc`

  `private int`

  `range`

  `private float`

  `windSpeed`

  `private float`

  `x`

  `private float`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Flare()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `applyFlare(zombie.core.opengl.RenderSettings.PlayerRenderSettings renderSettings,
  int plrIndex,
  IsoPlayer player)`

  `ClimateColorInfo`

  `getColor()`

  `ClimateColorInfo`

  `getColorPlayer(int index)`

  `private int`

  `GetDistance(int dx,
  int dy,
  int sx,
  int sy)`

  `float`

  `getDistModPlayer(int index)`

  `int`

  `getId()`

  `float`

  `getIntensity()`

  `float`

  `getIntensityPlayer(int index)`

  `float`

  `getLerpPlayer(int index)`

  `float`

  `getLifeTime()`

  `float`

  `getMaxLifeTime()`

  `ClimateColorInfo`

  `getOutColorPlayer(int index)`

  `float`

  `getPercent()`

  `int`

  `getRange()`

  `float`

  `getWindSpeed()`

  `float`

  `getX()`

  `float`

  `getY()`

  `boolean`

  `isHasLaunched()`

  `private void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private int id
  + ### x

    private float x
  + ### y

    private float y
  + ### range

    private int range
  + ### windSpeed

    private float windSpeed
  + ### color

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") color
  + ### hasLaunched

    private boolean hasLaunched
  + ### intensity

    private final zombie.iso.weather.fx.SteppedUpdateFloat intensity
  + ### maxLifeTime

    private float maxLifeTime
  + ### lifeTime

    private float lifeTime
  + ### nextRandomTargetIntens

    private int nextRandomTargetIntens
  + ### perc

    private float perc
  + ### infos

    private final [WorldFlares.PlayerFlareLightInfo](WorldFlares.PlayerFlareLightInfo.html "class in zombie.iso.weather")[] infos
* Constructor Details
  -------------------

  + ### Flare

    public Flare()
* Method Details
  --------------

  + ### getId

    public int getId()
  + ### getX

    public float getX()
  + ### getY

    public float getY()
  + ### getRange

    public int getRange()
  + ### getWindSpeed

    public float getWindSpeed()
  + ### getColor

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColor()
  + ### isHasLaunched

    public boolean isHasLaunched()
  + ### getIntensity

    public float getIntensity()
  + ### getMaxLifeTime

    public float getMaxLifeTime()
  + ### getLifeTime

    public float getLifeTime()
  + ### getPercent

    public float getPercent()
  + ### getIntensityPlayer

    public float getIntensityPlayer(int index)
  + ### getLerpPlayer

    public float getLerpPlayer(int index)
  + ### getDistModPlayer

    public float getDistModPlayer(int index)
  + ### getColorPlayer

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColorPlayer(int index)
  + ### getOutColorPlayer

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getOutColorPlayer(int index)
  + ### GetDistance

    private int GetDistance(int dx,
    int dy,
    int sx,
    int sy)
  + ### update

    private void update()
  + ### applyFlare

    private void applyFlare(zombie.core.opengl.RenderSettings.PlayerRenderSettings renderSettings,
    int plrIndex,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)