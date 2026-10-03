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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [ENABLED](#ENABLED)
   2. [debugDraw](#debugDraw)
   3. [nextId](#nextId)
   4. [flares](#flares)
7. [Constructor Details](#constructor-detail)
   1. [WorldFlares()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [Clear()](#Clear())
   2. [getFlareCount()](#getFlareCount())
   3. [getFlare(int)](#getFlare(int))
   4. [getFlareID(int)](#getFlareID(int))
   5. [launchFlare(float, int, int, int, float, float, float, float, float, float, float)](#launchFlare(float,int,int,int,float,float,float,float,float,float,float))
   6. [update()](#update())
   7. [applyFlaresForPlayer(RenderSettings.PlayerRenderSettings, int, IsoPlayer)](#applyFlaresForPlayer(zombie.core.opengl.RenderSettings.PlayerRenderSettings,int,zombie.characters.IsoPlayer))
   8. [setDebugDraw(boolean)](#setDebugDraw(boolean))
   9. [getDebugDraw()](#getDebugDraw())
   10. [debugRender()](#debugRender())
   11. [DrawIsoLine(float, float, float, float, float, float, float, float, float, int)](#DrawIsoLine(float,float,float,float,float,float,float,float,float,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WorldFlares
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.WorldFlares

---

public class WorldFlares
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `WorldFlares.Flare`

  `private static class`

  `WorldFlares.PlayerFlareLightInfo`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static boolean`

  `debugDraw`

  `static final boolean`

  `ENABLED`

  `private static final ArrayList<WorldFlares.Flare>`

  `flares`

  `static int`

  `nextId`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WorldFlares()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `applyFlaresForPlayer(zombie.core.opengl.RenderSettings.PlayerRenderSettings renderSettings,
  int plrIndex,
  IsoPlayer player)`

  `static void`

  `Clear()`

  `static void`

  `debugRender()`

  `private static void`

  `DrawIsoLine(float x,
  float y,
  float x2,
  float y2,
  float z,
  float r,
  float g,
  float b,
  float a,
  int thickness)`

  `static boolean`

  `getDebugDraw()`

  `static WorldFlares.Flare`

  `getFlare(int index)`

  `static int`

  `getFlareCount()`

  `static WorldFlares.Flare`

  `getFlareID(int id)`

  `static void`

  `launchFlare(float lifetime,
  int x,
  int y,
  int range,
  float windSpeed,
  float r,
  float g,
  float b,
  float ri,
  float gi,
  float bi)`

  `static void`

  `setDebugDraw(boolean b)`

  `static void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### ENABLED

    public static final boolean ENABLED

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.WorldFlares.ENABLED)
  + ### debugDraw

    public static boolean debugDraw
  + ### nextId

    public static int nextId
  + ### flares

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WorldFlares.Flare](WorldFlares.Flare.html "class in zombie.iso.weather")> flares
* Constructor Details
  -------------------

  + ### WorldFlares

    public WorldFlares()
* Method Details
  --------------

  + ### Clear

    public static void Clear()
  + ### getFlareCount

    public static int getFlareCount()
  + ### getFlare

    public static [WorldFlares.Flare](WorldFlares.Flare.html "class in zombie.iso.weather") getFlare(int index)
  + ### getFlareID

    public static [WorldFlares.Flare](WorldFlares.Flare.html "class in zombie.iso.weather") getFlareID(int id)
  + ### launchFlare

    public static void launchFlare(float lifetime,
    int x,
    int y,
    int range,
    float windSpeed,
    float r,
    float g,
    float b,
    float ri,
    float gi,
    float bi)
  + ### update

    public static void update()
  + ### applyFlaresForPlayer

    public static void applyFlaresForPlayer(zombie.core.opengl.RenderSettings.PlayerRenderSettings renderSettings,
    int plrIndex,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### setDebugDraw

    public static void setDebugDraw(boolean b)
  + ### getDebugDraw

    public static boolean getDebugDraw()
  + ### debugRender

    public static void debugRender()
  + ### DrawIsoLine

    private static void DrawIsoLine(float x,
    float y,
    float x2,
    float y2,
    float z,
    float r,
    float g,
    float b,
    float a,
    int thickness)