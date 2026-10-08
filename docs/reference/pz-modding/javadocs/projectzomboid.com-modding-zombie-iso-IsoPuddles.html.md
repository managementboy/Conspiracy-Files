[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoPuddles](IsoPuddles.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [effect](#effect)
   2. [puddlesWindAngle](#puddlesWindAngle)
   3. [puddlesWindIntensity](#puddlesWindIntensity)
   4. [puddlesTime](#puddlesTime)
   5. [puddlesParamWindInt](#puddlesParamWindInt)
   6. [leakingPuddlesInTheRoom](#leakingPuddlesInTheRoom)
   7. [texHm](#texHm)
   8. [bufferHm](#bufferHm)
   9. [apiId](#apiId)
   10. [instance](#instance)
   11. [isShaderEnable](#isShaderEnable)
   12. [BYTES\_PER\_FLOAT](#BYTES_PER_FLOAT)
   13. [FLOATS\_PER\_VERTEX](#FLOATS_PER_VERTEX)
   14. [BYTES\_PER\_VERTEX](#BYTES_PER_VERTEX)
   15. [VERTICES\_PER\_SQUARE](#VERTICES_PER_SQUARE)
   16. [VBOs](#VBOs)
   17. [renderData](#renderData)
   18. [shaderOffset](#shaderOffset)
   19. [shaderOffsetMain](#shaderOffsetMain)
   20. [floatBuffer](#floatBuffer)
   21. [BOOL\_MAX](#BOOL_MAX)
   22. [FLOAT\_RAIN](#FLOAT_RAIN)
   23. [FLOAT\_WETGROUND](#FLOAT_WETGROUND)
   24. [FLOAT\_MUDDYPUDDLES](#FLOAT_MUDDYPUDDLES)
   25. [FLOAT\_PUDDLESSIZE](#FLOAT_PUDDLESSIZE)
   26. [FLOAT\_RAININTENSITY](#FLOAT_RAININTENSITY)
   27. [FLOAT\_MAX](#FLOAT_MAX)
   28. [rain](#rain)
   29. [wetGround](#wetGround)
   30. [muddyPuddles](#muddyPuddles)
   31. [puddlesSize](#puddlesSize)
   32. [rainIntensity](#rainIntensity)
   33. [lastDataTime](#lastDataTime)
   34. [wetGroundNetwork](#wetGroundNetwork)
   35. [muddyPuddlesNetwork](#muddyPuddlesNetwork)
   36. [puddlesSizeNetwork](#puddlesSizeNetwork)
   37. [wetGroundStart](#wetGroundStart)
   38. [muddyPuddlesStart](#muddyPuddlesStart)
   39. [puddlesSizeStart](#puddlesSizeStart)
   40. [climateFloats](#climateFloats)
   41. [renderToChunkTexturePool](#renderToChunkTexturePool)
7. [Constructor Details](#constructor-detail)
   1. [IsoPuddles()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [getShaderEnable()](#getShaderEnable())
   3. [applyPuddlesQuality()](#applyPuddlesQuality())
   4. [getShaderOffset()](#getShaderOffset())
   5. [getShaderOffsetMain()](#getShaderOffsetMain())
   6. [shouldRenderPuddles()](#shouldRenderPuddles())
   7. [render(ArrayList, int)](#render(java.util.ArrayList,int))
   8. [puddlesProjection(Matrix4f)](#puddlesProjection(org.joml.Matrix4f))
   9. [puddlesGeometry(int, int)](#puddlesGeometry(int,int))
   10. [renderSome(int, int, boolean)](#renderSome(int,int,boolean))
   11. [update(ClimateManager)](#update(zombie.iso.weather.ClimateManager))
   12. [applyNetworkUpdate(float, float, float)](#applyNetworkUpdate(float,float,float))
   13. [getMuddyPuddlesFinalValue()](#getMuddyPuddlesFinalValue())
   14. [getShaderTime()](#getShaderTime())
   15. [getPuddlesSize()](#getPuddlesSize())
   16. [getHMTexture()](#getHMTexture())
   17. [getHMTextureBuffer()](#getHMTextureBuffer())
   18. [updateHMTextureBuffer()](#updateHMTextureBuffer())
   19. [freeHMTextureBuffer()](#freeHMTextureBuffer())
   20. [getPuddlesParams(int)](#getPuddlesParams(int))
   21. [getRainIntensity()](#getRainIntensity())
   22. [getFloatMax()](#getFloatMax())
   23. [getBoolMax()](#getBoolMax())
   24. [getPuddlesFloat(int)](#getPuddlesFloat(int))
   25. [initClimateFloat(int, String)](#initClimateFloat(int,java.lang.String))
   26. [setup()](#setup())
   27. [clearThreadData()](#clearThreadData())
   28. [renderToChunkTexture(ArrayList, int)](#renderToChunkTexture(java.util.ArrayList,int))
   29. [getWetGroundFinalValue()](#getWetGroundFinalValue())
   30. [getPuddlesSizeFinalValue()](#getPuddlesSizeFinalValue())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoPuddles
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoPuddles

---

public final class IsoPuddles
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `IsoPuddles.PuddlesFloat`

  `private static final class`

  `IsoPuddles.RenderData`

  `private static final class`

  `IsoPuddles.RenderToChunkTexture`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `apiId`

  `static final int`

  `BOOL_MAX`

  `private ByteBuffer`

  `bufferHm`

  `(package private) static final int`

  `BYTES_PER_FLOAT`

  `(package private) static final int`

  `BYTES_PER_VERTEX`

  The size of a single vertex in bytes: DirNE,DirNW,DirAll,DirNone,XY,color,fragDepth

  `private final IsoPuddles.PuddlesFloat[]`

  `climateFloats`

  `zombie.core.opengl.Shader`

  `effect`

  `static final int`

  `FLOAT_MAX`

  `static final int`

  `FLOAT_MUDDYPUDDLES`

  `static final int`

  `FLOAT_PUDDLESSIZE`

  `static final int`

  `FLOAT_RAIN`

  `static final int`

  `FLOAT_RAININTENSITY`

  `static final int`

  `FLOAT_WETGROUND`

  `private final FloatBuffer`

  `floatBuffer`

  `(package private) static final int`

  `FLOATS_PER_VERTEX`

  `private static IsoPuddles`

  `instance`

  `private static boolean`

  `isShaderEnable`

  `private long`

  `lastDataTime`

  `static boolean`

  `leakingPuddlesInTheRoom`

  `private IsoPuddles.PuddlesFloat`

  `muddyPuddles`

  `private float`

  `muddyPuddlesNetwork`

  `private float`

  `muddyPuddlesStart`

  `private final Vector2f`

  `puddlesParamWindInt`

  `private IsoPuddles.PuddlesFloat`

  `puddlesSize`

  `private float`

  `puddlesSizeNetwork`

  `private float`

  `puddlesSizeStart`

  `private float`

  `puddlesTime`

  `private float`

  `puddlesWindAngle`

  `private float`

  `puddlesWindIntensity`

  `private IsoPuddles.PuddlesFloat`

  `rain`

  `private IsoPuddles.PuddlesFloat`

  `rainIntensity`

  `private final IsoPuddles.RenderData[][]`

  `renderData`

  `private final zombie.popman.ObjectPool<IsoPuddles.RenderToChunkTexture>`

  `renderToChunkTexturePool`

  `private final org.joml.Vector4f`

  `shaderOffset`

  `private final org.joml.Vector4f`

  `shaderOffsetMain`

  `private Texture`

  `texHm`

  `static final zombie.core.opengl.SharedVertexBufferObjects`

  `VBOs`

  `(package private) static final int`

  `VERTICES_PER_SQUARE`

  `private IsoPuddles.PuddlesFloat`

  `wetGround`

  `private float`

  `wetGroundNetwork`

  `private float`

  `wetGroundStart`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoPuddles()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `applyNetworkUpdate(float wetGroundValue,
  float puddlesSizeValue,
  float muddyPuddlesValue)`

  `void`

  `applyPuddlesQuality()`

  `void`

  `clearThreadData()`

  `void`

  `freeHMTextureBuffer()`

  `int`

  `getBoolMax()`

  `int`

  `getFloatMax()`

  `ITexture`

  `getHMTexture()`

  `ByteBuffer`

  `getHMTextureBuffer()`

  `static IsoPuddles`

  `getInstance()`

  `float`

  `getMuddyPuddlesFinalValue()`

  `IsoPuddles.PuddlesFloat`

  `getPuddlesFloat(int id)`

  `FloatBuffer`

  `getPuddlesParams(int z)`

  `float`

  `getPuddlesSize()`

  `float`

  `getPuddlesSizeFinalValue()`

  `float`

  `getRainIntensity()`

  `boolean`

  `getShaderEnable()`

  `org.joml.Vector4f`

  `getShaderOffset()`

  `org.joml.Vector4f`

  `getShaderOffsetMain()`

  `float`

  `getShaderTime()`

  `float`

  `getWetGroundFinalValue()`

  `private IsoPuddles.PuddlesFloat`

  `initClimateFloat(int id,
  String name)`

  `void`

  `puddlesGeometry(int firstSquare,
  int numSquares)`

  `void`

  `puddlesProjection(org.joml.Matrix4f projection)`

  `void`

  `render(ArrayList<IsoGridSquare> grid,
  int z)`

  `private int`

  `renderSome(int firstSquare,
  int numSquares,
  boolean bRenderToChunkTexture)`

  `void`

  `renderToChunkTexture(ArrayList<IsoGridSquare> squares,
  int z)`

  `private void`

  `setup()`

  `boolean`

  `shouldRenderPuddles()`

  `void`

  `update(ClimateManager cm)`

  `void`

  `updateHMTextureBuffer()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### effect

    public zombie.core.opengl.Shader effect
  + ### puddlesWindAngle

    private float puddlesWindAngle
  + ### puddlesWindIntensity

    private float puddlesWindIntensity
  + ### puddlesTime

    private float puddlesTime
  + ### puddlesParamWindInt

    private final [Vector2f](../../org/joml/Vector2f.html "class in org.joml") puddlesParamWindInt
  + ### leakingPuddlesInTheRoom

    public static boolean leakingPuddlesInTheRoom
  + ### texHm

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") texHm
  + ### bufferHm

    private [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bufferHm
  + ### apiId

    private int apiId
  + ### instance

    private static [IsoPuddles](IsoPuddles.html "class in zombie.iso") instance
  + ### isShaderEnable

    private static boolean isShaderEnable
  + ### BYTES\_PER\_FLOAT

    static final int BYTES\_PER\_FLOAT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.BYTES_PER_FLOAT)
  + ### FLOATS\_PER\_VERTEX

    static final int FLOATS\_PER\_VERTEX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.FLOATS_PER_VERTEX)
  + ### BYTES\_PER\_VERTEX

    static final int BYTES\_PER\_VERTEX

    The size of a single vertex in bytes: DirNE,DirNW,DirAll,DirNone,XY,color,fragDepth

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.BYTES_PER_VERTEX)
  + ### VERTICES\_PER\_SQUARE

    static final int VERTICES\_PER\_SQUARE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.VERTICES_PER_SQUARE)
  + ### VBOs

    public static final zombie.core.opengl.SharedVertexBufferObjects VBOs
  + ### renderData

    private final [IsoPuddles.RenderData](IsoPuddles.RenderData.html "class in zombie.iso")[][] renderData
  + ### shaderOffset

    private final org.joml.Vector4f shaderOffset
  + ### shaderOffsetMain

    private final org.joml.Vector4f shaderOffsetMain
  + ### floatBuffer

    private final [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") floatBuffer
  + ### BOOL\_MAX

    public static final int BOOL\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.BOOL_MAX)
  + ### FLOAT\_RAIN

    public static final int FLOAT\_RAIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.FLOAT_RAIN)
  + ### FLOAT\_WETGROUND

    public static final int FLOAT\_WETGROUND

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.FLOAT_WETGROUND)
  + ### FLOAT\_MUDDYPUDDLES

    public static final int FLOAT\_MUDDYPUDDLES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.FLOAT_MUDDYPUDDLES)
  + ### FLOAT\_PUDDLESSIZE

    public static final int FLOAT\_PUDDLESSIZE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.FLOAT_PUDDLESSIZE)
  + ### FLOAT\_RAININTENSITY

    public static final int FLOAT\_RAININTENSITY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.FLOAT_RAININTENSITY)
  + ### FLOAT\_MAX

    public static final int FLOAT\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.FLOAT_MAX)
  + ### rain

    private [IsoPuddles.PuddlesFloat](IsoPuddles.PuddlesFloat.html "class in zombie.iso") rain
  + ### wetGround

    private [IsoPuddles.PuddlesFloat](IsoPuddles.PuddlesFloat.html "class in zombie.iso") wetGround
  + ### muddyPuddles

    private [IsoPuddles.PuddlesFloat](IsoPuddles.PuddlesFloat.html "class in zombie.iso") muddyPuddles
  + ### puddlesSize

    private [IsoPuddles.PuddlesFloat](IsoPuddles.PuddlesFloat.html "class in zombie.iso") puddlesSize
  + ### rainIntensity

    private [IsoPuddles.PuddlesFloat](IsoPuddles.PuddlesFloat.html "class in zombie.iso") rainIntensity
  + ### lastDataTime

    private long lastDataTime
  + ### wetGroundNetwork

    private float wetGroundNetwork
  + ### muddyPuddlesNetwork

    private float muddyPuddlesNetwork
  + ### puddlesSizeNetwork

    private float puddlesSizeNetwork
  + ### wetGroundStart

    private float wetGroundStart
  + ### muddyPuddlesStart

    private float muddyPuddlesStart
  + ### puddlesSizeStart

    private float puddlesSizeStart
  + ### climateFloats

    private final [IsoPuddles.PuddlesFloat](IsoPuddles.PuddlesFloat.html "class in zombie.iso")[] climateFloats
  + ### renderToChunkTexturePool

    private final zombie.popman.ObjectPool<[IsoPuddles.RenderToChunkTexture](IsoPuddles.RenderToChunkTexture.html "class in zombie.iso")> renderToChunkTexturePool
* Constructor Details
  -------------------

  + ### IsoPuddles

    public IsoPuddles()
* Method Details
  --------------

  + ### getInstance

    public static [IsoPuddles](IsoPuddles.html "class in zombie.iso") getInstance()
  + ### getShaderEnable

    public boolean getShaderEnable()
  + ### applyPuddlesQuality

    public void applyPuddlesQuality()
  + ### getShaderOffset

    public org.joml.Vector4f getShaderOffset()
  + ### getShaderOffsetMain

    public org.joml.Vector4f getShaderOffsetMain()
  + ### shouldRenderPuddles

    public boolean shouldRenderPuddles()
  + ### render

    public void render([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> grid,
    int z)
  + ### puddlesProjection

    public void puddlesProjection(org.joml.Matrix4f projection)
  + ### puddlesGeometry

    public void puddlesGeometry(int firstSquare,
    int numSquares)
  + ### renderSome

    private int renderSome(int firstSquare,
    int numSquares,
    boolean bRenderToChunkTexture)
  + ### update

    public void update([ClimateManager](weather/ClimateManager.html "class in zombie.iso.weather") cm)
  + ### applyNetworkUpdate

    public void applyNetworkUpdate(float wetGroundValue,
    float puddlesSizeValue,
    float muddyPuddlesValue)
  + ### getMuddyPuddlesFinalValue

    public float getMuddyPuddlesFinalValue()
  + ### getShaderTime

    public float getShaderTime()
  + ### getPuddlesSize

    public float getPuddlesSize()
  + ### getHMTexture

    public [ITexture](../interfaces/ITexture.html "interface in zombie.interfaces") getHMTexture()
  + ### getHMTextureBuffer

    public [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") getHMTextureBuffer()
  + ### updateHMTextureBuffer

    public void updateHMTextureBuffer()
  + ### freeHMTextureBuffer

    public void freeHMTextureBuffer()
  + ### getPuddlesParams

    public [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") getPuddlesParams(int z)
  + ### getRainIntensity

    public float getRainIntensity()
  + ### getFloatMax

    public int getFloatMax()
  + ### getBoolMax

    public int getBoolMax()
  + ### getPuddlesFloat

    public [IsoPuddles.PuddlesFloat](IsoPuddles.PuddlesFloat.html "class in zombie.iso") getPuddlesFloat(int id)
  + ### initClimateFloat

    private [IsoPuddles.PuddlesFloat](IsoPuddles.PuddlesFloat.html "class in zombie.iso") initClimateFloat(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setup

    private void setup()
  + ### clearThreadData

    public void clearThreadData()
  + ### renderToChunkTexture

    public void renderToChunkTexture([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> squares,
    int z)
  + ### getWetGroundFinalValue

    public float getWetGroundFinalValue()
  + ### getPuddlesSizeFinalValue

    public float getPuddlesSizeFinalValue()