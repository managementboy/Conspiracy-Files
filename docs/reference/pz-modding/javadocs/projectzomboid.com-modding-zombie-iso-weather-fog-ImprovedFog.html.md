[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.weather.fog](package-summary.html)
2. [ImprovedFog](ImprovedFog.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MAX\_FOG\_Z](#MAX_FOG_Z)
   2. [rectangleIter](#rectangleIter)
   3. [rectangleMatrixPos](#rectangleMatrixPos)
   4. [chunkMap](#chunkMap)
   5. [minY](#minY)
   6. [maxY](#maxY)
   7. [minX](#minX)
   8. [maxX](#maxX)
   9. [zLayer](#zLayer)
   10. [lastIterPos](#lastIterPos)
   11. [fogRectangle](#fogRectangle)
   12. [drawingThisLayer](#drawingThisLayer)
   13. [zoom](#zoom)
   14. [playerIndex](#playerIndex)
   15. [playerRow](#playerRow)
   16. [screenWidth](#screenWidth)
   17. [screenHeight](#screenHeight)
   18. [worldOffsetX](#worldOffsetX)
   19. [worldOffsetY](#worldOffsetY)
   20. [topAlphaHeight](#topAlphaHeight)
   21. [bottomAlphaHeight](#bottomAlphaHeight)
   22. [secondLayerAlpha](#secondLayerAlpha)
   23. [scalingX](#scalingX)
   24. [scalingY](#scalingY)
   25. [colorR](#colorR)
   26. [colorG](#colorG)
   27. [colorB](#colorB)
   28. [drawDebugColors](#drawDebugColors)
   29. [octaves](#octaves)
   30. [highQuality](#highQuality)
   31. [enableEditing](#enableEditing)
   32. [alphaCircleAlpha](#alphaCircleAlpha)
   33. [alphaCircleRad](#alphaCircleRad)
   34. [lastRow](#lastRow)
   35. [climateManager](#climateManager)
   36. [noiseTexture](#noiseTexture)
   37. [renderOnlyOneRow](#renderOnlyOneRow)
   38. [baseAlpha](#baseAlpha)
   39. [renderEveryXRow](#renderEveryXRow)
   40. [renderXRowsFromCenter](#renderXRowsFromCenter)
   41. [renderCurrentLayerOnly](#renderCurrentLayerOnly)
   42. [rightClickOffX](#rightClickOffX)
   43. [rightClickOffY](#rightClickOffY)
   44. [cameraOffscreenLeft](#cameraOffscreenLeft)
   45. [cameraOffscreenTop](#cameraOffscreenTop)
   46. [cameraZoom](#cameraZoom)
   47. [minXOffset](#minXOffset)
   48. [maxXOffset](#maxXOffset)
   49. [maxYOffset](#maxYOffset)
   50. [renderEndOnly](#renderEndOnly)
   51. [fogIntensity](#fogIntensity)
   52. [drawers](#drawers)
   53. [keyPause](#keyPause)
   54. [offsets](#offsets)
7. [Constructor Details](#constructor-detail)
   1. [ImprovedFog()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getMinXOffset()](#getMinXOffset())
   2. [setMinXOffset(int)](#setMinXOffset(int))
   3. [getMaxXOffset()](#getMaxXOffset())
   4. [setMaxXOffset(int)](#setMaxXOffset(int))
   5. [getMaxYOffset()](#getMaxYOffset())
   6. [setMaxYOffset(int)](#setMaxYOffset(int))
   7. [isRenderEndOnly()](#isRenderEndOnly())
   8. [setRenderEndOnly(boolean)](#setRenderEndOnly(boolean))
   9. [getAlphaCircleAlpha()](#getAlphaCircleAlpha())
   10. [setAlphaCircleAlpha(float)](#setAlphaCircleAlpha(float))
   11. [getAlphaCircleRad()](#getAlphaCircleRad())
   12. [setAlphaCircleRad(float)](#setAlphaCircleRad(float))
   13. [isHighQuality()](#isHighQuality())
   14. [setHighQuality(boolean)](#setHighQuality(boolean))
   15. [isEnableEditing()](#isEnableEditing())
   16. [setEnableEditing(boolean)](#setEnableEditing(boolean))
   17. [getTopAlphaHeight()](#getTopAlphaHeight())
   18. [setTopAlphaHeight(float)](#setTopAlphaHeight(float))
   19. [getBottomAlphaHeight()](#getBottomAlphaHeight())
   20. [setBottomAlphaHeight(float)](#setBottomAlphaHeight(float))
   21. [isDrawDebugColors()](#isDrawDebugColors())
   22. [setDrawDebugColors(boolean)](#setDrawDebugColors(boolean))
   23. [getOctaves()](#getOctaves())
   24. [setOctaves(float)](#setOctaves(float))
   25. [getColorR()](#getColorR())
   26. [setColorR(float)](#setColorR(float))
   27. [getColorG()](#getColorG())
   28. [setColorG(float)](#setColorG(float))
   29. [getColorB()](#getColorB())
   30. [setColorB(float)](#setColorB(float))
   31. [getSecondLayerAlpha()](#getSecondLayerAlpha())
   32. [setSecondLayerAlpha(float)](#setSecondLayerAlpha(float))
   33. [getScalingX()](#getScalingX())
   34. [setScalingX(float)](#setScalingX(float))
   35. [getScalingY()](#getScalingY())
   36. [setScalingY(float)](#setScalingY(float))
   37. [isRenderOnlyOneRow()](#isRenderOnlyOneRow())
   38. [setRenderOnlyOneRow(boolean)](#setRenderOnlyOneRow(boolean))
   39. [getBaseAlpha()](#getBaseAlpha())
   40. [setBaseAlpha(float)](#setBaseAlpha(float))
   41. [getRenderEveryXRow()](#getRenderEveryXRow())
   42. [setRenderEveryXRow(int)](#setRenderEveryXRow(int))
   43. [isRenderCurrentLayerOnly()](#isRenderCurrentLayerOnly())
   44. [setRenderCurrentLayerOnly(boolean)](#setRenderCurrentLayerOnly(boolean))
   45. [getRenderXRowsFromCenter()](#getRenderXRowsFromCenter())
   46. [setRenderXRowsFromCenter(int)](#setRenderXRowsFromCenter(int))
   47. [getNoiseTexture()](#getNoiseTexture())
   48. [update()](#update())
   49. [startRender(int, int)](#startRender(int,int))
   50. [renderRowsBehind(IsoGridSquare)](#renderRowsBehind(zombie.iso.IsoGridSquare))
   51. [endRender()](#endRender())
   52. [startFogRectangle(int, int, int)](#startFogRectangle(int,int,int))
   53. [endFogRectangle(int, int, int)](#endFogRectangle(int,int,int))
   54. [renderFogSegmentOld()](#renderFogSegmentOld())
   55. [renderFogSegment()](#renderFogSegment())
   56. [DrawSubTextureRGBA(Texture, double, double, double, double, double, double, double, double, double, double, double, double)](#DrawSubTextureRGBA(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,double,double,double,double))
   57. [updateKeys()](#updateKeys())
   58. [getDrawer()](#getDrawer())
   59. [startFrame(ImprovedFogDrawer)](#startFrame(zombie.iso.weather.fog.ImprovedFogDrawer))
   60. [init()](#init())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class ImprovedFog
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.fog.ImprovedFog

---

public class ImprovedFog
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `ImprovedFog.FogRectangle`

  `private static class`

  `ImprovedFog.RectangleIterator`

  Similar as diamond matrix iterator but instead does a rectangle.
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static float`

  `alphaCircleAlpha`

  `private static float`

  `alphaCircleRad`

  `private static float`

  `baseAlpha`

  `private static float`

  `bottomAlphaHeight`

  `private static float`

  `cameraOffscreenLeft`

  `private static float`

  `cameraOffscreenTop`

  `private static float`

  `cameraZoom`

  `private static IsoChunkMap`

  `chunkMap`

  `private static ClimateManager`

  `climateManager`

  `private static float`

  `colorB`

  `private static float`

  `colorG`

  `private static float`

  `colorR`

  `private static boolean`

  `drawDebugColors`

  `private static final zombie.iso.weather.fog.ImprovedFogDrawer[][]`

  `drawers`

  `private static boolean`

  `drawingThisLayer`

  `private static boolean`

  `enableEditing`

  `private static final zombie.iso.weather.fx.SteppedUpdateFloat`

  `fogIntensity`

  `private static final ImprovedFog.FogRectangle`

  `fogRectangle`

  `private static boolean`

  `highQuality`

  `private static int`

  `keyPause`

  `private static final org.joml.Vector2i`

  `lastIterPos`

  `private static int`

  `lastRow`

  `static final int`

  `MAX_FOG_Z`

  `private static int`

  `maxX`

  `private static int`

  `maxXOffset`

  `private static int`

  `maxY`

  `private static int`

  `maxYOffset`

  `private static int`

  `minX`

  `private static int`

  `minXOffset`

  `private static int`

  `minY`

  `private static Texture`

  `noiseTexture`

  `private static float`

  `octaves`

  `private static final float[]`

  `offsets`

  `private static int`

  `playerIndex`

  `private static int`

  `playerRow`

  `private static final ImprovedFog.RectangleIterator`

  `rectangleIter`

  `private static final org.joml.Vector2i`

  `rectangleMatrixPos`

  `private static boolean`

  `renderCurrentLayerOnly`

  `private static boolean`

  `renderEndOnly`

  `private static int`

  `renderEveryXRow`

  `private static boolean`

  `renderOnlyOneRow`

  `private static int`

  `renderXRowsFromCenter`

  `private static float`

  `rightClickOffX`

  `private static float`

  `rightClickOffY`

  `private static float`

  `scalingX`

  `private static float`

  `scalingY`

  `private static float`

  `screenHeight`

  `private static float`

  `screenWidth`

  `private static float`

  `secondLayerAlpha`

  `private static float`

  `topAlphaHeight`

  `private static float`

  `worldOffsetX`

  `private static float`

  `worldOffsetY`

  `private static int`

  `zLayer`

  `private static float`

  `zoom`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ImprovedFog()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `DrawSubTextureRGBA(Texture tex,
  double subX,
  double subY,
  double subW,
  double subH,
  double x,
  double y,
  double w,
  double h,
  double r,
  double g,
  double b,
  double a)`

  `private static void`

  `endFogRectangle(int x,
  int y,
  int z)`

  `static void`

  `endRender()`

  `static float`

  `getAlphaCircleAlpha()`

  `static float`

  `getAlphaCircleRad()`

  `static float`

  `getBaseAlpha()`

  `static float`

  `getBottomAlphaHeight()`

  `static float`

  `getColorB()`

  `static float`

  `getColorG()`

  `static float`

  `getColorR()`

  `static zombie.iso.weather.fog.ImprovedFogDrawer`

  `getDrawer()`

  `static int`

  `getMaxXOffset()`

  `static int`

  `getMaxYOffset()`

  `static int`

  `getMinXOffset()`

  `static Texture`

  `getNoiseTexture()`

  `static float`

  `getOctaves()`

  `static int`

  `getRenderEveryXRow()`

  `static int`

  `getRenderXRowsFromCenter()`

  `static float`

  `getScalingX()`

  `static float`

  `getScalingY()`

  `static float`

  `getSecondLayerAlpha()`

  `static float`

  `getTopAlphaHeight()`

  `static void`

  `init()`

  `static boolean`

  `isDrawDebugColors()`

  `static boolean`

  `isEnableEditing()`

  `static boolean`

  `isHighQuality()`

  `static boolean`

  `isRenderCurrentLayerOnly()`

  `static boolean`

  `isRenderEndOnly()`

  `static boolean`

  `isRenderOnlyOneRow()`

  `private static void`

  `renderFogSegment()`

  `private static void`

  `renderFogSegmentOld()`

  `static void`

  `renderRowsBehind(IsoGridSquare squareMax)`

  `static void`

  `setAlphaCircleAlpha(float alphaCircleAlpha)`

  `static void`

  `setAlphaCircleRad(float alphaCircleRad)`

  `static void`

  `setBaseAlpha(float baseAlpha)`

  `static void`

  `setBottomAlphaHeight(float bottomAlphaHeight)`

  `static void`

  `setColorB(float colorB)`

  `static void`

  `setColorG(float colorG)`

  `static void`

  `setColorR(float colorR)`

  `static void`

  `setDrawDebugColors(boolean drawDebugColors)`

  `static void`

  `setEnableEditing(boolean enableEditing)`

  `static void`

  `setHighQuality(boolean highQuality)`

  `static void`

  `setMaxXOffset(int maxXOffset)`

  `static void`

  `setMaxYOffset(int maxYOffset)`

  `static void`

  `setMinXOffset(int minXOffset)`

  `static void`

  `setOctaves(float octaves)`

  `static void`

  `setRenderCurrentLayerOnly(boolean renderCurrentLayerOnly)`

  `static void`

  `setRenderEndOnly(boolean renderEndOnly)`

  `static void`

  `setRenderEveryXRow(int renderEveryXRow)`

  `static void`

  `setRenderOnlyOneRow(boolean renderOnlyOneRow)`

  `static void`

  `setRenderXRowsFromCenter(int renderXRowsFromCenter)`

  `static void`

  `setScalingX(float scalingX)`

  `static void`

  `setScalingY(float scalingY)`

  `static void`

  `setSecondLayerAlpha(float secondLayerAlpha)`

  `static void`

  `setTopAlphaHeight(float topAlphaHeight)`

  `private static void`

  `startFogRectangle(int x,
  int y,
  int z)`

  `static void`

  `startFrame(zombie.iso.weather.fog.ImprovedFogDrawer drawer)`

  `static boolean`

  `startRender(int nPlayer,
  int z)`

  `static void`

  `update()`

  `static void`

  `updateKeys()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### MAX\_FOG\_Z

    public static final int MAX\_FOG\_Z

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.weather.fog.ImprovedFog.MAX_FOG_Z)
  + ### rectangleIter

    private static final [ImprovedFog.RectangleIterator](ImprovedFog.RectangleIterator.html "class in zombie.iso.weather.fog") rectangleIter
  + ### rectangleMatrixPos

    private static final org.joml.Vector2i rectangleMatrixPos
  + ### chunkMap

    private static [IsoChunkMap](../../IsoChunkMap.html "class in zombie.iso") chunkMap
  + ### minY

    private static int minY
  + ### maxY

    private static int maxY
  + ### minX

    private static int minX
  + ### maxX

    private static int maxX
  + ### zLayer

    private static int zLayer
  + ### lastIterPos

    private static final org.joml.Vector2i lastIterPos
  + ### fogRectangle

    private static final [ImprovedFog.FogRectangle](ImprovedFog.FogRectangle.html "class in zombie.iso.weather.fog") fogRectangle
  + ### drawingThisLayer

    private static boolean drawingThisLayer
  + ### zoom

    private static float zoom
  + ### playerIndex

    private static int playerIndex
  + ### playerRow

    private static int playerRow
  + ### screenWidth

    private static float screenWidth
  + ### screenHeight

    private static float screenHeight
  + ### worldOffsetX

    private static float worldOffsetX
  + ### worldOffsetY

    private static float worldOffsetY
  + ### topAlphaHeight

    private static float topAlphaHeight
  + ### bottomAlphaHeight

    private static float bottomAlphaHeight
  + ### secondLayerAlpha

    private static float secondLayerAlpha
  + ### scalingX

    private static float scalingX
  + ### scalingY

    private static float scalingY
  + ### colorR

    private static float colorR
  + ### colorG

    private static float colorG
  + ### colorB

    private static float colorB
  + ### drawDebugColors

    private static boolean drawDebugColors
  + ### octaves

    private static float octaves
  + ### highQuality

    private static boolean highQuality
  + ### enableEditing

    private static boolean enableEditing
  + ### alphaCircleAlpha

    private static float alphaCircleAlpha
  + ### alphaCircleRad

    private static float alphaCircleRad
  + ### lastRow

    private static int lastRow
  + ### climateManager

    private static [ClimateManager](../ClimateManager.html "class in zombie.iso.weather") climateManager
  + ### noiseTexture

    private static [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") noiseTexture
  + ### renderOnlyOneRow

    private static boolean renderOnlyOneRow
  + ### baseAlpha

    private static float baseAlpha
  + ### renderEveryXRow

    private static int renderEveryXRow
  + ### renderXRowsFromCenter

    private static int renderXRowsFromCenter
  + ### renderCurrentLayerOnly

    private static boolean renderCurrentLayerOnly
  + ### rightClickOffX

    private static float rightClickOffX
  + ### rightClickOffY

    private static float rightClickOffY
  + ### cameraOffscreenLeft

    private static float cameraOffscreenLeft
  + ### cameraOffscreenTop

    private static float cameraOffscreenTop
  + ### cameraZoom

    private static float cameraZoom
  + ### minXOffset

    private static int minXOffset
  + ### maxXOffset

    private static int maxXOffset
  + ### maxYOffset

    private static int maxYOffset
  + ### renderEndOnly

    private static boolean renderEndOnly
  + ### fogIntensity

    private static final zombie.iso.weather.fx.SteppedUpdateFloat fogIntensity
  + ### drawers

    private static final zombie.iso.weather.fog.ImprovedFogDrawer[][] drawers
  + ### keyPause

    private static int keyPause
  + ### offsets

    private static final float[] offsets
* Constructor Details
  -------------------

  + ### ImprovedFog

    public ImprovedFog()
* Method Details
  --------------

  + ### getMinXOffset

    public static int getMinXOffset()
  + ### setMinXOffset

    public static void setMinXOffset(int minXOffset)
  + ### getMaxXOffset

    public static int getMaxXOffset()
  + ### setMaxXOffset

    public static void setMaxXOffset(int maxXOffset)
  + ### getMaxYOffset

    public static int getMaxYOffset()
  + ### setMaxYOffset

    public static void setMaxYOffset(int maxYOffset)
  + ### isRenderEndOnly

    public static boolean isRenderEndOnly()
  + ### setRenderEndOnly

    public static void setRenderEndOnly(boolean renderEndOnly)
  + ### getAlphaCircleAlpha

    public static float getAlphaCircleAlpha()
  + ### setAlphaCircleAlpha

    public static void setAlphaCircleAlpha(float alphaCircleAlpha)
  + ### getAlphaCircleRad

    public static float getAlphaCircleRad()
  + ### setAlphaCircleRad

    public static void setAlphaCircleRad(float alphaCircleRad)
  + ### isHighQuality

    public static boolean isHighQuality()
  + ### setHighQuality

    public static void setHighQuality(boolean highQuality)
  + ### isEnableEditing

    public static boolean isEnableEditing()
  + ### setEnableEditing

    public static void setEnableEditing(boolean enableEditing)
  + ### getTopAlphaHeight

    public static float getTopAlphaHeight()
  + ### setTopAlphaHeight

    public static void setTopAlphaHeight(float topAlphaHeight)
  + ### getBottomAlphaHeight

    public static float getBottomAlphaHeight()
  + ### setBottomAlphaHeight

    public static void setBottomAlphaHeight(float bottomAlphaHeight)
  + ### isDrawDebugColors

    public static boolean isDrawDebugColors()
  + ### setDrawDebugColors

    public static void setDrawDebugColors(boolean drawDebugColors)
  + ### getOctaves

    public static float getOctaves()
  + ### setOctaves

    public static void setOctaves(float octaves)
  + ### getColorR

    public static float getColorR()
  + ### setColorR

    public static void setColorR(float colorR)
  + ### getColorG

    public static float getColorG()
  + ### setColorG

    public static void setColorG(float colorG)
  + ### getColorB

    public static float getColorB()
  + ### setColorB

    public static void setColorB(float colorB)
  + ### getSecondLayerAlpha

    public static float getSecondLayerAlpha()
  + ### setSecondLayerAlpha

    public static void setSecondLayerAlpha(float secondLayerAlpha)
  + ### getScalingX

    public static float getScalingX()
  + ### setScalingX

    public static void setScalingX(float scalingX)
  + ### getScalingY

    public static float getScalingY()
  + ### setScalingY

    public static void setScalingY(float scalingY)
  + ### isRenderOnlyOneRow

    public static boolean isRenderOnlyOneRow()
  + ### setRenderOnlyOneRow

    public static void setRenderOnlyOneRow(boolean renderOnlyOneRow)
  + ### getBaseAlpha

    public static float getBaseAlpha()
  + ### setBaseAlpha

    public static void setBaseAlpha(float baseAlpha)
  + ### getRenderEveryXRow

    public static int getRenderEveryXRow()
  + ### setRenderEveryXRow

    public static void setRenderEveryXRow(int renderEveryXRow)
  + ### isRenderCurrentLayerOnly

    public static boolean isRenderCurrentLayerOnly()
  + ### setRenderCurrentLayerOnly

    public static void setRenderCurrentLayerOnly(boolean renderCurrentLayerOnly)
  + ### getRenderXRowsFromCenter

    public static int getRenderXRowsFromCenter()
  + ### setRenderXRowsFromCenter

    public static void setRenderXRowsFromCenter(int renderXRowsFromCenter)
  + ### getNoiseTexture

    public static [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") getNoiseTexture()
  + ### update

    public static void update()
  + ### startRender

    public static boolean startRender(int nPlayer,
    int z)
  + ### renderRowsBehind

    public static void renderRowsBehind([IsoGridSquare](../../IsoGridSquare.html "class in zombie.iso") squareMax)
  + ### endRender

    public static void endRender()
  + ### startFogRectangle

    private static void startFogRectangle(int x,
    int y,
    int z)
  + ### endFogRectangle

    private static void endFogRectangle(int x,
    int y,
    int z)
  + ### renderFogSegmentOld

    private static void renderFogSegmentOld()
  + ### renderFogSegment

    private static void renderFogSegment()
  + ### DrawSubTextureRGBA

    public static void DrawSubTextureRGBA([Texture](../../../core/textures/Texture.html "class in zombie.core.textures") tex,
    double subX,
    double subY,
    double subW,
    double subH,
    double x,
    double y,
    double w,
    double h,
    double r,
    double g,
    double b,
    double a)
  + ### updateKeys

    public static void updateKeys()
  + ### getDrawer

    public static zombie.iso.weather.fog.ImprovedFogDrawer getDrawer()
  + ### startFrame

    public static void startFrame(zombie.iso.weather.fog.ImprovedFogDrawer drawer)
  + ### init

    public static void init()