[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.weather.fx](package-summary.html)
2. [IsoWeatherFX](IsoWeatherFX.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [VERBOSE](#VERBOSE)
   2. [debugBounds](#debugBounds)
   3. [delta](#delta)
   4. [cloudParticles](#cloudParticles)
   5. [fogParticles](#fogParticles)
   6. [snowParticles](#snowParticles)
   7. [rainParticles](#rainParticles)
   8. [cloudId](#cloudId)
   9. [fogId](#fogId)
   10. [snowId](#snowId)
   11. [rainId](#rainId)
   12. [zoomMod](#zoomMod)
   13. [playerIndoors](#playerIndoors)
   14. [windPrecipIntensity](#windPrecipIntensity)
   15. [windIntensity](#windIntensity)
   16. [windAngleIntensity](#windAngleIntensity)
   17. [precipitationIntensity](#precipitationIntensity)
   18. [precipitationIntensitySnow](#precipitationIntensitySnow)
   19. [precipitationIntensityRain](#precipitationIntensityRain)
   20. [cloudIntensity](#cloudIntensity)
   21. [fogIntensity](#fogIntensity)
   22. [windAngleMod](#windAngleMod)
   23. [precipitationIsSnow](#precipitationIsSnow)
   24. [fogOverlayAlpha](#fogOverlayAlpha)
   25. [windSpeedMax](#windSpeedMax)
   26. [windSpeed](#windSpeed)
   27. [windSpeedFog](#windSpeedFog)
   28. [windAngle](#windAngle)
   29. [windAngleClouds](#windAngleClouds)
   30. [texFogCircle](#texFogCircle)
   31. [texFogWhite](#texFogWhite)
   32. [fogColor](#fogColor)
   33. [indoorsAlphaMod](#indoorsAlphaMod)
   34. [particleRectangles](#particleRectangles)
   35. [drawers](#drawers)
   36. [instance](#instance)
   37. [windUpdCounter](#windUpdCounter)
   38. [shader](#shader)
   39. [s\_drawer](#s_drawer)
7. [Constructor Details](#constructor-detail)
   1. [IsoWeatherFX()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [init()](#init())
   2. [update()](#update())
   3. [setDebugBounds(boolean)](#setDebugBounds(boolean))
   4. [isDebugBounds()](#isDebugBounds())
   5. [setWindAngleIntensity(float)](#setWindAngleIntensity(float))
   6. [getWindAngleIntensity()](#getWindAngleIntensity())
   7. [getRenderWindAngleRain()](#getRenderWindAngleRain())
   8. [setWindPrecipIntensity(float)](#setWindPrecipIntensity(float))
   9. [getWindPrecipIntensity()](#getWindPrecipIntensity())
   10. [setWindIntensity(float)](#setWindIntensity(float))
   11. [getWindIntensity()](#getWindIntensity())
   12. [setFogIntensity(float)](#setFogIntensity(float))
   13. [getFogIntensity()](#getFogIntensity())
   14. [setCloudIntensity(float)](#setCloudIntensity(float))
   15. [getCloudIntensity()](#getCloudIntensity())
   16. [setPrecipitationIntensity(float)](#setPrecipitationIntensity(float))
   17. [getPrecipitationIntensity()](#getPrecipitationIntensity())
   18. [setPrecipitationIsSnow(boolean)](#setPrecipitationIsSnow(boolean))
   19. [getPrecipitationIsSnow()](#getPrecipitationIsSnow())
   20. [hasCloudsToRender()](#hasCloudsToRender())
   21. [hasPrecipitationToRender()](#hasPrecipitationToRender())
   22. [hasFogToRender()](#hasFogToRender())
   23. [render()](#render())
   24. [renderLayered(boolean, boolean, boolean)](#renderLayered(boolean,boolean,boolean))
   25. [renderClouds()](#renderClouds())
   26. [renderFog()](#renderFog())
   27. [renderPrecipitation()](#renderPrecipitation())
   28. [renderFogCircle()](#renderFogCircle())
   29. [clamp(float, float, float)](#clamp(float,float,float))
   30. [lerp(float, float, float)](#lerp(float,float,float))
   31. [clerp(float, float, float)](#clerp(float,float,float))
   32. [getDrawer(int)](#getDrawer(int))
   33. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class IsoWeatherFX
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.fx.IsoWeatherFX

---

public class IsoWeatherFX
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `IsoWeatherFX.Drawer`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static int`

  `cloudId`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `cloudIntensity`

  `private zombie.iso.weather.fx.ParticleRectangle`

  `cloudParticles`

  `protected static boolean`

  `debugBounds`

  `private static float`

  `delta`

  `private final zombie.iso.weather.fx.WeatherParticleDrawer[][][]`

  `drawers`

  `private final Color`

  `fogColor`

  `static int`

  `fogId`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `fogIntensity`

  `private float`

  `fogOverlayAlpha`

  `private zombie.iso.weather.fx.ParticleRectangle`

  `fogParticles`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `indoorsAlphaMod`

  `protected static IsoWeatherFX`

  `instance`

  `private final ArrayList<zombie.iso.weather.fx.ParticleRectangle>`

  `particleRectangles`

  `protected boolean`

  `playerIndoors`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `precipitationIntensity`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `precipitationIntensityRain`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `precipitationIntensitySnow`

  `protected boolean`

  `precipitationIsSnow`

  `static int`

  `rainId`

  `private zombie.iso.weather.fx.ParticleRectangle`

  `rainParticles`

  `(package private) static final IsoWeatherFX.Drawer[][]`

  `s_drawer`

  `(package private) static zombie.core.skinnedmodel.shader.Shader`

  `shader`

  `static int`

  `snowId`

  `private zombie.iso.weather.fx.ParticleRectangle`

  `snowParticles`

  `private Texture`

  `texFogCircle`

  `private Texture`

  `texFogWhite`

  `private static final boolean`

  `VERBOSE`

  `protected float`

  `windAngle`

  `protected float`

  `windAngleClouds`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `windAngleIntensity`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `windAngleMod`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `windIntensity`

  `protected zombie.iso.weather.fx.SteppedUpdateFloat`

  `windPrecipIntensity`

  `protected float`

  `windSpeed`

  `protected float`

  `windSpeedFog`

  `private final float`

  `windSpeedMax`

  `private float`

  `windUpdCounter`

  `static float`

  `zoomMod`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoWeatherFX()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static float`

  `clamp(float min,
  float max,
  float val)`

  `static float`

  `clerp(float t,
  float a,
  float b)`

  `float`

  `getCloudIntensity()`

  `zombie.iso.weather.fx.WeatherParticleDrawer`

  `getDrawer(int id)`

  `float`

  `getFogIntensity()`

  `float`

  `getPrecipitationIntensity()`

  `boolean`

  `getPrecipitationIsSnow()`

  `float`

  `getRenderWindAngleRain()`

  `float`

  `getWindAngleIntensity()`

  `float`

  `getWindIntensity()`

  `float`

  `getWindPrecipIntensity()`

  `boolean`

  `hasCloudsToRender()`

  `boolean`

  `hasFogToRender()`

  `boolean`

  `hasPrecipitationToRender()`

  `void`

  `init()`

  `boolean`

  `isDebugBounds()`

  `static float`

  `lerp(float t,
  float a,
  float b)`

  `void`

  `render()`

  `void`

  `renderClouds()`

  `void`

  `renderFog()`

  `private void`

  `renderFogCircle()`

  `void`

  `renderLayered(boolean doClouds,
  boolean doFog,
  boolean doPrecip)`

  `void`

  `renderPrecipitation()`

  `void`

  `Reset()`

  `void`

  `setCloudIntensity(float intensity)`

  `void`

  `setDebugBounds(boolean b)`

  `void`

  `setFogIntensity(float intensity)`

  `void`

  `setPrecipitationIntensity(float intensity)`

  `void`

  `setPrecipitationIsSnow(boolean b)`

  `void`

  `setWindAngleIntensity(float intensity)`

  `void`

  `setWindIntensity(float intensity)`

  `void`

  `setWindPrecipIntensity(float intensity)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### VERBOSE

    private static final boolean VERBOSE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.weather.fx.IsoWeatherFX.VERBOSE)
  + ### debugBounds

    protected static boolean debugBounds
  + ### delta

    private static float delta
  + ### cloudParticles

    private zombie.iso.weather.fx.ParticleRectangle cloudParticles
  + ### fogParticles

    private zombie.iso.weather.fx.ParticleRectangle fogParticles
  + ### snowParticles

    private zombie.iso.weather.fx.ParticleRectangle snowParticles
  + ### rainParticles

    private zombie.iso.weather.fx.ParticleRectangle rainParticles
  + ### cloudId

    public static int cloudId
  + ### fogId

    public static int fogId
  + ### snowId

    public static int snowId
  + ### rainId

    public static int rainId
  + ### zoomMod

    public static float zoomMod
  + ### playerIndoors

    protected boolean playerIndoors
  + ### windPrecipIntensity

    protected zombie.iso.weather.fx.SteppedUpdateFloat windPrecipIntensity
  + ### windIntensity

    protected zombie.iso.weather.fx.SteppedUpdateFloat windIntensity
  + ### windAngleIntensity

    protected zombie.iso.weather.fx.SteppedUpdateFloat windAngleIntensity
  + ### precipitationIntensity

    protected zombie.iso.weather.fx.SteppedUpdateFloat precipitationIntensity
  + ### precipitationIntensitySnow

    protected zombie.iso.weather.fx.SteppedUpdateFloat precipitationIntensitySnow
  + ### precipitationIntensityRain

    protected zombie.iso.weather.fx.SteppedUpdateFloat precipitationIntensityRain
  + ### cloudIntensity

    protected zombie.iso.weather.fx.SteppedUpdateFloat cloudIntensity
  + ### fogIntensity

    protected zombie.iso.weather.fx.SteppedUpdateFloat fogIntensity
  + ### windAngleMod

    protected zombie.iso.weather.fx.SteppedUpdateFloat windAngleMod
  + ### precipitationIsSnow

    protected boolean precipitationIsSnow
  + ### fogOverlayAlpha

    private float fogOverlayAlpha
  + ### windSpeedMax

    private final float windSpeedMax

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.weather.fx.IsoWeatherFX.windSpeedMax)
  + ### windSpeed

    protected float windSpeed
  + ### windSpeedFog

    protected float windSpeedFog
  + ### windAngle

    protected float windAngle
  + ### windAngleClouds

    protected float windAngleClouds
  + ### texFogCircle

    private [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") texFogCircle
  + ### texFogWhite

    private [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") texFogWhite
  + ### fogColor

    private final [Color](../../../core/Color.html "class in zombie.core") fogColor
  + ### indoorsAlphaMod

    protected zombie.iso.weather.fx.SteppedUpdateFloat indoorsAlphaMod
  + ### particleRectangles

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.weather.fx.ParticleRectangle> particleRectangles
  + ### drawers

    private final zombie.iso.weather.fx.WeatherParticleDrawer[][][] drawers
  + ### instance

    protected static [IsoWeatherFX](IsoWeatherFX.html "class in zombie.iso.weather.fx") instance
  + ### windUpdCounter

    private float windUpdCounter
  + ### shader

    static zombie.core.skinnedmodel.shader.Shader shader
  + ### s\_drawer

    static final [IsoWeatherFX.Drawer](IsoWeatherFX.Drawer.html "class in zombie.iso.weather.fx")[][] s\_drawer
* Constructor Details
  -------------------

  + ### IsoWeatherFX

    public IsoWeatherFX()
* Method Details
  --------------

  + ### init

    public void init()
  + ### update

    public void update()
  + ### setDebugBounds

    public void setDebugBounds(boolean b)
  + ### isDebugBounds

    public boolean isDebugBounds()
  + ### setWindAngleIntensity

    public void setWindAngleIntensity(float intensity)
  + ### getWindAngleIntensity

    public float getWindAngleIntensity()
  + ### getRenderWindAngleRain

    public float getRenderWindAngleRain()
  + ### setWindPrecipIntensity

    public void setWindPrecipIntensity(float intensity)
  + ### getWindPrecipIntensity

    public float getWindPrecipIntensity()
  + ### setWindIntensity

    public void setWindIntensity(float intensity)
  + ### getWindIntensity

    public float getWindIntensity()
  + ### setFogIntensity

    public void setFogIntensity(float intensity)
  + ### getFogIntensity

    public float getFogIntensity()
  + ### setCloudIntensity

    public void setCloudIntensity(float intensity)
  + ### getCloudIntensity

    public float getCloudIntensity()
  + ### setPrecipitationIntensity

    public void setPrecipitationIntensity(float intensity)
  + ### getPrecipitationIntensity

    public float getPrecipitationIntensity()
  + ### setPrecipitationIsSnow

    public void setPrecipitationIsSnow(boolean b)
  + ### getPrecipitationIsSnow

    public boolean getPrecipitationIsSnow()
  + ### hasCloudsToRender

    public boolean hasCloudsToRender()
  + ### hasPrecipitationToRender

    public boolean hasPrecipitationToRender()
  + ### hasFogToRender

    public boolean hasFogToRender()
  + ### render

    public void render()
  + ### renderLayered

    public void renderLayered(boolean doClouds,
    boolean doFog,
    boolean doPrecip)
  + ### renderClouds

    public void renderClouds()
  + ### renderFog

    public void renderFog()
  + ### renderPrecipitation

    public void renderPrecipitation()
  + ### renderFogCircle

    private void renderFogCircle()
  + ### clamp

    public static float clamp(float min,
    float max,
    float val)
  + ### lerp

    public static float lerp(float t,
    float a,
    float b)
  + ### clerp

    public static float clerp(float t,
    float a,
    float b)
  + ### getDrawer

    public zombie.iso.weather.fx.WeatherParticleDrawer getDrawer(int id)
  + ### Reset

    public void Reset()