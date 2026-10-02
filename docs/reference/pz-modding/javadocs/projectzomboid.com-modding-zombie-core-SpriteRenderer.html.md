[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [SpriteRenderer](SpriteRenderer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [TEXTURE0\_COORD\_OFFSET](#TEXTURE0_COORD_OFFSET)
   3. [COLOR\_OFFSET](#COLOR_OFFSET)
   4. [TEXTURE1\_COORD\_OFFSET](#TEXTURE1_COORD_OFFSET)
   5. [TEXTURE2\_COORD\_OFFSET](#TEXTURE2_COORD_OFFSET)
   6. [VERTEX\_SIZE](#VERTEX_SIZE)
   7. [ringBuffer](#ringBuffer)
   8. [NUM\_RENDER\_STATES](#NUM_RENDER_STATES)
   9. [states](#states)
   10. [waitingForRenderState](#waitingForRenderState)
   11. [glBlendfuncEnabled](#glBlendfuncEnabled)
   12. [buildStateDrawBuffer](#buildStateDrawBuffer)
   13. [buildStateUiDrawBuffer](#buildStateUiDrawBuffer)
   14. [waitTime](#waitTime)
   15. [waitForReadyState](#waitForReadyState)
   16. [waitForReadySlotToOpen](#waitForReadySlotToOpen)
7. [Constructor Details](#constructor-detail)
   1. [SpriteRenderer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [create()](#create())
   2. [clearSprites()](#clearSprites())
   3. [glDepthMask(boolean)](#glDepthMask(boolean))
   4. [renderflipped(Texture, float, float, float, float, float, float, float, float, Consumer)](#renderflipped(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,java.util.function.Consumer))
   5. [drawModel(ModelManager.ModelSlot)](#drawModel(zombie.core.skinnedmodel.ModelManager.ModelSlot))
   6. [renderQueued()](#renderQueued())
   7. [beginProfile(PerformanceProfileProbe)](#beginProfile(zombie.core.profiling.PerformanceProfileProbe))
   8. [endProfile(PerformanceProfileProbe)](#endProfile(zombie.core.profiling.PerformanceProfileProbe))
   9. [drawSkyBox(Shader, int, int, int)](#drawSkyBox(zombie.core.opengl.Shader,int,int,int))
   10. [drawWater(Shader, int, int, int, boolean)](#drawWater(zombie.core.opengl.Shader,int,int,int,boolean))
   11. [drawPuddles(int, int, int, int)](#drawPuddles(int,int,int,int))
   12. [drawParticles(int, int, int)](#drawParticles(int,int,int))
   13. [drawGeneric(TextureDraw.GenericDrawer)](#drawGeneric(zombie.core.textures.TextureDraw.GenericDrawer))
   14. [glDisable(int)](#glDisable(int))
   15. [glEnable(int)](#glEnable(int))
   16. [NewFrame()](#NewFrame())
   17. [glDepthFunc(int)](#glDepthFunc(int))
   18. [glStencilMask(int)](#glStencilMask(int))
   19. [glClear(int)](#glClear(int))
   20. [glBindFramebuffer(int, int)](#glBindFramebuffer(int,int))
   21. [glClearColor(int, int, int, int)](#glClearColor(int,int,int,int))
   22. [glClearDepth(float)](#glClearDepth(float))
   23. [glStencilFunc(int, int, int)](#glStencilFunc(int,int,int))
   24. [glStencilOp(int, int, int)](#glStencilOp(int,int,int))
   25. [glColorMask(int, int, int, int)](#glColorMask(int,int,int,int))
   26. [glAlphaFunc(int, float)](#glAlphaFunc(int,float))
   27. [glBlendFunc(int, int)](#glBlendFunc(int,int))
   28. [glBlendFuncSeparate(int, int, int, int)](#glBlendFuncSeparate(int,int,int,int))
   29. [glBlendEquation(int)](#glBlendEquation(int))
   30. [render(Texture, double, double, double, double, double, double, double, double, float, float, float, float, Consumer)](#render(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,float,float,float,float,java.util.function.Consumer))
   31. [render(Texture, double, double, double, double, double, double, double, double, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, Consumer)](#render(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,java.util.function.Consumer))
   32. [render(Texture, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, double, float, float, float, float)](#render(zombie.core.textures.Texture,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,double,float,float,float,float))
   33. [renderdebug(Texture, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, Consumer)](#renderdebug(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,java.util.function.Consumer))
   34. [renderline(Texture, int, int, int, int, float, float, float, float, float)](#renderline(zombie.core.textures.Texture,int,int,int,int,float,float,float,float,float))
   35. [renderline(Texture, int, int, int, int, float, float, float, float)](#renderline(zombie.core.textures.Texture,int,int,int,int,float,float,float,float))
   36. [renderlinef(Texture, float, float, float, float, float, float, float, float, int)](#renderlinef(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,int))
   37. [renderlinef(Texture, float, float, float, float, float, float, float, float, float, float)](#renderlinef(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,float,float))
   38. [render(Texture, float, float, float, float, float, float, float, float, int, int, int, int)](#render(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,int,int,int,int))
   39. [render(Texture, float, float, float, float, float, float, float, float, Consumer)](#render(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,java.util.function.Consumer))
   40. [render(Texture, Texture, float, float, float, float, float, float, float, float, Consumer)](#render(zombie.core.textures.Texture,zombie.core.textures.Texture,float,float,float,float,float,float,float,float,java.util.function.Consumer))
   41. [renderi(Texture, int, int, int, int, float, float, float, float, Consumer)](#renderi(zombie.core.textures.Texture,int,int,int,int,float,float,float,float,java.util.function.Consumer))
   42. [renderClamped(Texture, int, int, int, int, int, int, int, int, float, float, float, float, Consumer)](#renderClamped(zombie.core.textures.Texture,int,int,int,int,int,int,int,int,float,float,float,float,java.util.function.Consumer))
   43. [renderRect(int, int, int, int, float, float, float, float)](#renderRect(int,int,int,int,float,float,float,float))
   44. [renderPoly(float, float, float, float, float, float, float, float, float, float, float, float)](#renderPoly(float,float,float,float,float,float,float,float,float,float,float,float))
   45. [renderPoly(Texture, float, float, float, float, float, float, float, float, float, float, float, float)](#renderPoly(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,float,float,float,float))
   46. [renderPoly(Texture, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float)](#renderPoly(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float))
   47. [render(Texture, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float)](#render(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float))
   48. [render(Texture, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, Consumer)](#render(zombie.core.textures.Texture,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,java.util.function.Consumer))
   49. [buildDrawBuffer(TextureDraw[], Style[], int)](#buildDrawBuffer(zombie.core.textures.TextureDraw%5B%5D,zombie.core.Styles.Style%5B%5D,int))
   50. [prePopulating()](#prePopulating())
   51. [postRender()](#postRender())
   52. [buildStateDrawBuffer(SpriteRenderState)](#buildStateDrawBuffer(zombie.core.sprite.SpriteRenderState))
   53. [buildStateUIDrawBuffer(SpriteRenderState)](#buildStateUIDrawBuffer(zombie.core.sprite.SpriteRenderState))
   54. [notifyRenderStateQueue()](#notifyRenderStateQueue())
   55. [glBuffer(int, int)](#glBuffer(int,int))
   56. [glDoStartFrame(int, int, float, int)](#glDoStartFrame(int,int,float,int))
   57. [FBORenderChunkStart(int, boolean)](#FBORenderChunkStart(int,boolean))
   58. [FBORenderChunkEnd()](#FBORenderChunkEnd())
   59. [glDoStartFrame(int, int, float, int, boolean)](#glDoStartFrame(int,int,float,int,boolean))
   60. [glDoStartFrameFlipY(int, int, float, int)](#glDoStartFrameFlipY(int,int,float,int))
   61. [glDoStartFrameNoZoom(int, int, float, int)](#glDoStartFrameNoZoom(int,int,float,int))
   62. [glDoStartFrameFx(int, int, int)](#glDoStartFrameFx(int,int,int))
   63. [glIgnoreStyles(boolean)](#glIgnoreStyles(boolean))
   64. [glDoEndFrame()](#glDoEndFrame())
   65. [pushIsoView(float, float, float, float, boolean)](#pushIsoView(float,float,float,float,boolean))
   66. [popIsoView()](#popIsoView())
   67. [glDoEndFrameFx(int)](#glDoEndFrameFx(int))
   68. [doCoreIntParam(int, float)](#doCoreIntParam(int,float))
   69. [glTexParameteri(int, int, int)](#glTexParameteri(int,int,int))
   70. [StartShader(int, int)](#StartShader(int,int))
   71. [StartShader(int, int, ShaderUniformSetter)](#StartShader(int,int,zombie.core.opengl.ShaderUniformSetter))
   72. [EndShader()](#EndShader())
   73. [setCutawayTexture(Texture, int, int, int, int)](#setCutawayTexture(zombie.core.textures.Texture,int,int,int,int))
   74. [clearCutawayTexture()](#clearCutawayTexture())
   75. [setCutawayTexture2(Texture, int, int, int, int)](#setCutawayTexture2(zombie.core.textures.Texture,int,int,int,int))
   76. [setUseVertColorsArray(byte, int, int, int, int)](#setUseVertColorsArray(byte,int,int,int,int))
   77. [clearUseVertColorsArray()](#clearUseVertColorsArray())
   78. [setExtraWallShaderParams(SpriteRenderer.WallShaderTexRender)](#setExtraWallShaderParams(zombie.core.SpriteRenderer.WallShaderTexRender))
   79. [ShaderUpdate1i(int, int, int)](#ShaderUpdate1i(int,int,int))
   80. [ShaderUpdate1f(int, int, float)](#ShaderUpdate1f(int,int,float))
   81. [ShaderUpdate2f(int, int, float, float)](#ShaderUpdate2f(int,int,float,float))
   82. [ShaderUpdate3f(int, int, float, float, float)](#ShaderUpdate3f(int,int,float,float,float))
   83. [ShaderUpdate4f(int, int, float, float, float, float)](#ShaderUpdate4f(int,int,float,float,float,float))
   84. [glLoadIdentity()](#glLoadIdentity())
   85. [glGenerateMipMaps(int)](#glGenerateMipMaps(int))
   86. [glBind(int)](#glBind(int))
   87. [releaseFBORenderChunkLock()](#releaseFBORenderChunkLock())
   88. [glViewport(int, int, int, int)](#glViewport(int,int,int,int))
   89. [render(ImDrawData)](#render(imgui.ImDrawData))
   90. [startOffscreenUI()](#startOffscreenUI())
   91. [stopOffscreenUI()](#stopOffscreenUI())
   92. [getWaitTime()](#getWaitTime())
   93. [pushFrameDown()](#pushFrameDown())
   94. [acquireStateForRendering(BooleanSupplier)](#acquireStateForRendering(java.util.function.BooleanSupplier))
   95. [waitForReadyState(BooleanSupplier)](#waitForReadyState(java.util.function.BooleanSupplier))
   96. [waitForReadySlotToOpen()](#waitForReadySlotToOpen())
   97. [getMainStateIndex()](#getMainStateIndex())
   98. [getRenderStateIndex()](#getRenderStateIndex())
   99. [getDoAdditive()](#getDoAdditive())
   100. [setDefaultStyle(AbstractStyle)](#setDefaultStyle(zombie.core.Styles.AbstractStyle))
   101. [setDoAdditive(boolean)](#setDoAdditive(boolean))
   102. [initFromIsoCamera(int)](#initFromIsoCamera(int))
   103. [setRenderingPlayerIndex(int)](#setRenderingPlayerIndex(int))
   104. [getRenderingPlayerIndex()](#getRenderingPlayerIndex())
   105. [getRenderingPlayerCamera(int)](#getRenderingPlayerCamera(int))
   106. [getRenderingState()](#getRenderingState())
   107. [getPopulatingState()](#getPopulatingState())
   108. [isMaxZoomLevel()](#isMaxZoomLevel())
   109. [isMinZoomLevel()](#isMinZoomLevel())
   110. [getPlayerZoomLevel()](#getPlayerZoomLevel())
   111. [getPlayerMaxZoom()](#getPlayerMaxZoom())
   112. [getPlayerMinZoom()](#getPlayerMinZoom())
   113. [isWaitingForRenderState()](#isWaitingForRenderState())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SpriteRenderer
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.SpriteRenderer

---

public final class SpriteRenderer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `SpriteRenderer.RingBuffer`

  `private static final class`

  `SpriteRenderer.s_performance`

  `static enum`

  `SpriteRenderer.WallShaderTexRender`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.core.profiling.PerformanceProfileProbe`

  `buildStateDrawBuffer`

  `private final zombie.core.profiling.PerformanceProfileProbe`

  `buildStateUiDrawBuffer`

  `(package private) static final int`

  `COLOR_OFFSET`

  `static boolean`

  `glBlendfuncEnabled`

  `static final SpriteRenderer`

  `instance`

  `static final int`

  `NUM_RENDER_STATES`

  `static final SpriteRenderer.RingBuffer`

  `ringBuffer`

  `final zombie.core.sprite.SpriteRendererStates`

  `states`

  `(package private) static final int`

  `TEXTURE0_COORD_OFFSET`

  The size of a single vertex in bytes: x,y,s0,t0,r,g,b,a,s1,t1,s2,t2

  `(package private) static final int`

  `TEXTURE1_COORD_OFFSET`

  `(package private) static final int`

  `TEXTURE2_COORD_OFFSET`

  `(package private) static final int`

  `VERTEX_SIZE`

  `private final zombie.core.profiling.PerformanceProfileProbe`

  `waitForReadySlotToOpen`

  `private final zombie.core.profiling.PerformanceProfileProbe`

  `waitForReadyState`

  `private boolean`

  `waitingForRenderState`

  `private static long`

  `waitTime`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SpriteRenderer()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.core.sprite.SpriteRenderState`

  `acquireStateForRendering(BooleanSupplier waitCallback)`

  `void`

  `beginProfile(zombie.core.profiling.PerformanceProfileProbe probe)`

  `private void`

  `buildDrawBuffer(zombie.core.textures.TextureDraw[] sprites,
  zombie.core.Styles.Style[] styles,
  int numSprites)`

  `private void`

  `buildStateDrawBuffer(zombie.core.sprite.SpriteRenderState renderState)`

  `private void`

  `buildStateUIDrawBuffer(zombie.core.sprite.SpriteRenderState renderState)`

  `void`

  `clearCutawayTexture()`

  `void`

  `clearSprites()`

  `void`

  `clearUseVertColorsArray()`

  `void`

  `create()`

  `void`

  `doCoreIntParam(int id,
  float val)`

  `zombie.core.textures.TextureDraw`

  `drawGeneric(zombie.core.textures.TextureDraw.GenericDrawer gd)`

  `void`

  `drawModel(zombie.core.skinnedmodel.ModelManager.ModelSlot model)`

  `void`

  `drawParticles(int playerIndex,
  int var1,
  int var2)`

  `void`

  `drawPuddles(int playerIndex,
  int z,
  int firstSquare,
  int numSquares)`

  `void`

  `drawSkyBox(zombie.core.opengl.Shader shader,
  int playerIndex,
  int apiId,
  int bufferId)`

  `void`

  `drawWater(zombie.core.opengl.Shader shader,
  int playerIndex,
  int firstSquare,
  int numSquares,
  boolean bShore)`

  `void`

  `endProfile(zombie.core.profiling.PerformanceProfileProbe probe)`

  `void`

  `EndShader()`

  `void`

  `FBORenderChunkEnd()`

  `void`

  `FBORenderChunkStart(int index,
  boolean bClear)`

  `boolean`

  `getDoAdditive()`

  `int`

  `getMainStateIndex()`

  `float`

  `getPlayerMaxZoom()`

  `float`

  `getPlayerMinZoom()`

  `float`

  `getPlayerZoomLevel()`

  `zombie.core.sprite.SpriteRenderState`

  `getPopulatingState()`

  `zombie.iso.PlayerCamera`

  `getRenderingPlayerCamera(int userId)`

  `int`

  `getRenderingPlayerIndex()`

  `zombie.core.sprite.SpriteRenderState`

  `getRenderingState()`

  `int`

  `getRenderStateIndex()`

  `static long`

  `getWaitTime()`

  `void`

  `glAlphaFunc(int a,
  float b)`

  `void`

  `glBind(int a)`

  `void`

  `glBindFramebuffer(int binding,
  int fbo)`

  `void`

  `glBlendEquation(int a)`

  `void`

  `glBlendFunc(int a,
  int b)`

  `void`

  `glBlendFuncSeparate(int a,
  int b,
  int c,
  int d)`

  `void`

  `glBuffer(int i,
  int p)`

  `void`

  `glClear(int a)`

  `void`

  `glClearColor(int r,
  int g,
  int b,
  int a)`

  `void`

  `glClearDepth(float d)`

  `void`

  `glColorMask(int a,
  int b,
  int c,
  int d)`

  `void`

  `glDepthFunc(int a)`

  `void`

  `glDepthMask(boolean b)`

  `void`

  `glDisable(int a)`

  `void`

  `glDoEndFrame()`

  `void`

  `glDoEndFrameFx(int player)`

  `void`

  `glDoStartFrame(int w,
  int h,
  float zoom,
  int player)`

  `void`

  `glDoStartFrame(int w,
  int h,
  float zoom,
  int player,
  boolean isTextFrame)`

  `void`

  `glDoStartFrameFlipY(int w,
  int h,
  float zoom,
  int player)`

  `void`

  `glDoStartFrameFx(int w,
  int h,
  int player)`

  `void`

  `glDoStartFrameNoZoom(int w,
  int h,
  float zoom,
  int player)`

  `void`

  `glEnable(int a)`

  `void`

  `glGenerateMipMaps(int a)`

  `void`

  `glIgnoreStyles(boolean b)`

  `void`

  `glLoadIdentity()`

  `void`

  `glStencilFunc(int a,
  int b,
  int c)`

  `void`

  `glStencilMask(int a)`

  `void`

  `glStencilOp(int a,
  int b,
  int c)`

  `void`

  `glTexParameteri(int a,
  int b,
  int c)`

  `void`

  `glViewport(int x,
  int y,
  int width,
  int height)`

  `void`

  `initFromIsoCamera(int nPlayer)`

  `boolean`

  `isMaxZoomLevel()`

  `boolean`

  `isMinZoomLevel()`

  `boolean`

  `isWaitingForRenderState()`

  `void`

  `NewFrame()`

  `void`

  `notifyRenderStateQueue()`

  `void`

  `popIsoView()`

  `void`

  `postRender()`

  `void`

  `prePopulating()`

  `void`

  `pushFrameDown()`

  `void`

  `pushIsoView(float ox,
  float oy,
  float oz,
  float useangle,
  boolean vehicle)`

  `void`

  `releaseFBORenderChunkLock()`

  `void`

  `render(imgui.ImDrawData drawData)`

  `void`

  `render(Texture tex,
  double x1,
  double y1,
  double x2,
  double y2,
  double x3,
  double y3,
  double x4,
  double y4,
  double u1,
  double v1,
  double u2,
  double v2,
  double u3,
  double v3,
  double u4,
  double v4,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `render(Texture tex,
  double x1,
  double y1,
  double x2,
  double y2,
  double x3,
  double y3,
  double x4,
  double y4,
  float r1,
  float g1,
  float b1,
  float a1,
  float r2,
  float g2,
  float b2,
  float a2,
  float r3,
  float g3,
  float b3,
  float a3,
  float r4,
  float g4,
  float b4,
  float a4,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `render(Texture tex,
  double x1,
  double y1,
  double x2,
  double y2,
  double x3,
  double y3,
  double x4,
  double y4,
  float r,
  float g,
  float b,
  float a,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `render(Texture tex,
  float x,
  float y,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a,
  float u1,
  float v1,
  float u2,
  float v2,
  float u3,
  float v3,
  float u4,
  float v4)`

  `void`

  `render(Texture tex,
  float x,
  float y,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a,
  float u1,
  float v1,
  float u2,
  float v2,
  float u3,
  float v3,
  float u4,
  float v4,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `render(Texture tex,
  float x1,
  float y1,
  float x2,
  float y2,
  float x3,
  float y3,
  float x4,
  float y4,
  int c1,
  int c2,
  int c3,
  int c4)`

  `void`

  `render(Texture tex,
  float x,
  float y,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `render(Texture tex,
  Texture tex2,
  float x,
  float y,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderClamped(Texture tex,
  int x,
  int y,
  int width,
  int height,
  int clampMinX,
  int clampMinY,
  int clampWidth,
  int clampHeight,
  float r,
  float g,
  float b,
  float a,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderdebug(Texture tex,
  float x1,
  float y1,
  float x2,
  float y2,
  float x3,
  float y3,
  float x4,
  float y4,
  float r1,
  float g1,
  float b1,
  float a1,
  float r2,
  float g2,
  float b2,
  float a2,
  float r3,
  float g3,
  float b3,
  float a3,
  float r4,
  float g4,
  float b4,
  float a4,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderflipped(Texture tex,
  float x,
  float y,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderi(Texture tex,
  int x,
  int y,
  int width,
  int height,
  float r,
  float g,
  float b,
  float a,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderline(Texture tex,
  int x1,
  int y1,
  int x2,
  int y2,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `renderline(Texture tex,
  int x1,
  int y1,
  int x2,
  int y2,
  float r,
  float g,
  float b,
  float a,
  float thickness)`

  `void`

  `renderlinef(Texture tex,
  float x1,
  float y1,
  float x2,
  float y2,
  float r,
  float g,
  float b,
  float a,
  float baseThickness,
  float topThickness)`

  `void`

  `renderlinef(Texture tex,
  float x1,
  float y1,
  float x2,
  float y2,
  float r,
  float g,
  float b,
  float a,
  int thickness)`

  `void`

  `renderPoly(float x1,
  float y1,
  float x2,
  float y2,
  float x3,
  float y3,
  float x4,
  float y4,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `renderPoly(Texture tex,
  float x1,
  float y1,
  float x2,
  float y2,
  float x3,
  float y3,
  float x4,
  float y4,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `renderPoly(Texture tex,
  float x1,
  float y1,
  float x2,
  float y2,
  float x3,
  float y3,
  float x4,
  float y4,
  float r,
  float g,
  float b,
  float a,
  float u1,
  float v1,
  float u2,
  float v2,
  float u3,
  float v3,
  float u4,
  float v4)`

  `void`

  `renderQueued()`

  `void`

  `renderRect(int x,
  int y,
  int width,
  int height,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `setCutawayTexture(Texture tex,
  int x,
  int y,
  int w,
  int h)`

  `void`

  `setCutawayTexture2(Texture tex,
  int x,
  int y,
  int w,
  int h)`

  `void`

  `setDefaultStyle(zombie.core.Styles.AbstractStyle style)`

  `void`

  `setDoAdditive(boolean bDoAdditive)`

  `void`

  `setExtraWallShaderParams(SpriteRenderer.WallShaderTexRender wallTexRender)`

  `void`

  `setRenderingPlayerIndex(int player)`

  `void`

  `setUseVertColorsArray(byte whichShader,
  int c0,
  int c1,
  int c2,
  int c3)`

  `void`

  `ShaderUpdate1f(int shaderID,
  int uniform,
  float uniformValue)`

  `void`

  `ShaderUpdate1i(int shaderID,
  int uniform,
  int uniformValue)`

  `void`

  `ShaderUpdate2f(int shaderID,
  int uniform,
  float value1,
  float value2)`

  `void`

  `ShaderUpdate3f(int shaderID,
  int uniform,
  float value1,
  float value2,
  float value3)`

  `void`

  `ShaderUpdate4f(int shaderID,
  int uniform,
  float value1,
  float value2,
  float value3,
  float value4)`

  `void`

  `startOffscreenUI()`

  `void`

  `StartShader(int iD,
  int playerIndex)`

  `void`

  `StartShader(int iD,
  int playerIndex,
  zombie.core.opengl.ShaderUniformSetter uniforms)`

  `void`

  `stopOffscreenUI()`

  `private void`

  `waitForReadySlotToOpen()`

  `private boolean`

  `waitForReadyState(BooleanSupplier waitCallback)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [SpriteRenderer](SpriteRenderer.html "class in zombie.core") instance
  + ### TEXTURE0\_COORD\_OFFSET

    static final int TEXTURE0\_COORD\_OFFSET

    The size of a single vertex in bytes: x,y,s0,t0,r,g,b,a,s1,t1,s2,t2

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.SpriteRenderer.TEXTURE0_COORD_OFFSET)
  + ### COLOR\_OFFSET

    static final int COLOR\_OFFSET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.SpriteRenderer.COLOR_OFFSET)
  + ### TEXTURE1\_COORD\_OFFSET

    static final int TEXTURE1\_COORD\_OFFSET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.SpriteRenderer.TEXTURE1_COORD_OFFSET)
  + ### TEXTURE2\_COORD\_OFFSET

    static final int TEXTURE2\_COORD\_OFFSET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.SpriteRenderer.TEXTURE2_COORD_OFFSET)
  + ### VERTEX\_SIZE

    static final int VERTEX\_SIZE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.SpriteRenderer.VERTEX_SIZE)
  + ### ringBuffer

    public static final [SpriteRenderer.RingBuffer](SpriteRenderer.RingBuffer.html "class in zombie.core") ringBuffer
  + ### NUM\_RENDER\_STATES

    public static final int NUM\_RENDER\_STATES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.SpriteRenderer.NUM_RENDER_STATES)
  + ### states

    public final zombie.core.sprite.SpriteRendererStates states
  + ### waitingForRenderState

    private volatile boolean waitingForRenderState
  + ### glBlendfuncEnabled

    public static boolean glBlendfuncEnabled
  + ### buildStateDrawBuffer

    private final zombie.core.profiling.PerformanceProfileProbe buildStateDrawBuffer
  + ### buildStateUiDrawBuffer

    private final zombie.core.profiling.PerformanceProfileProbe buildStateUiDrawBuffer
  + ### waitTime

    private static long waitTime
  + ### waitForReadyState

    private final zombie.core.profiling.PerformanceProfileProbe waitForReadyState
  + ### waitForReadySlotToOpen

    private final zombie.core.profiling.PerformanceProfileProbe waitForReadySlotToOpen
* Constructor Details
  -------------------

  + ### SpriteRenderer

    public SpriteRenderer()
* Method Details
  --------------

  + ### create

    public void create()
  + ### clearSprites

    public void clearSprites()
  + ### glDepthMask

    public void glDepthMask(boolean b)
  + ### renderflipped

    public void renderflipped([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### drawModel

    public void drawModel(zombie.core.skinnedmodel.ModelManager.ModelSlot model)
  + ### renderQueued

    public void renderQueued()
  + ### beginProfile

    public void beginProfile(zombie.core.profiling.PerformanceProfileProbe probe)
  + ### endProfile

    public void endProfile(zombie.core.profiling.PerformanceProfileProbe probe)
  + ### drawSkyBox

    public void drawSkyBox(zombie.core.opengl.Shader shader,
    int playerIndex,
    int apiId,
    int bufferId)
  + ### drawWater

    public void drawWater(zombie.core.opengl.Shader shader,
    int playerIndex,
    int firstSquare,
    int numSquares,
    boolean bShore)
  + ### drawPuddles

    public void drawPuddles(int playerIndex,
    int z,
    int firstSquare,
    int numSquares)
  + ### drawParticles

    public void drawParticles(int playerIndex,
    int var1,
    int var2)
  + ### drawGeneric

    public zombie.core.textures.TextureDraw drawGeneric(zombie.core.textures.TextureDraw.GenericDrawer gd)
  + ### glDisable

    public void glDisable(int a)
  + ### glEnable

    public void glEnable(int a)
  + ### NewFrame

    public void NewFrame()
  + ### glDepthFunc

    public void glDepthFunc(int a)
  + ### glStencilMask

    public void glStencilMask(int a)
  + ### glClear

    public void glClear(int a)
  + ### glBindFramebuffer

    public void glBindFramebuffer(int binding,
    int fbo)
  + ### glClearColor

    public void glClearColor(int r,
    int g,
    int b,
    int a)
  + ### glClearDepth

    public void glClearDepth(float d)
  + ### glStencilFunc

    public void glStencilFunc(int a,
    int b,
    int c)
  + ### glStencilOp

    public void glStencilOp(int a,
    int b,
    int c)
  + ### glColorMask

    public void glColorMask(int a,
    int b,
    int c,
    int d)
  + ### glAlphaFunc

    public void glAlphaFunc(int a,
    float b)
  + ### glBlendFunc

    public void glBlendFunc(int a,
    int b)
  + ### glBlendFuncSeparate

    public void glBlendFuncSeparate(int a,
    int b,
    int c,
    int d)
  + ### glBlendEquation

    public void glBlendEquation(int a)
  + ### render

    public void render([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
    double x4,
    double y4,
    float r,
    float g,
    float b,
    float a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### render

    public void render([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
    double x4,
    double y4,
    float r1,
    float g1,
    float b1,
    float a1,
    float r2,
    float g2,
    float b2,
    float a2,
    float r3,
    float g3,
    float b3,
    float a3,
    float r4,
    float g4,
    float b4,
    float a4,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### render

    public void render([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
    double x4,
    double y4,
    double u1,
    double v1,
    double u2,
    double v2,
    double u3,
    double v3,
    double u4,
    double v4,
    float r,
    float g,
    float b,
    float a)
  + ### renderdebug

    public void renderdebug([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x1,
    float y1,
    float x2,
    float y2,
    float x3,
    float y3,
    float x4,
    float y4,
    float r1,
    float g1,
    float b1,
    float a1,
    float r2,
    float g2,
    float b2,
    float a2,
    float r3,
    float g3,
    float b3,
    float a3,
    float r4,
    float g4,
    float b4,
    float a4,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderline

    public void renderline([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    int x1,
    int y1,
    int x2,
    int y2,
    float r,
    float g,
    float b,
    float a,
    float thickness)
  + ### renderline

    public void renderline([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    int x1,
    int y1,
    int x2,
    int y2,
    float r,
    float g,
    float b,
    float a)
  + ### renderlinef

    public void renderlinef([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x1,
    float y1,
    float x2,
    float y2,
    float r,
    float g,
    float b,
    float a,
    int thickness)
  + ### renderlinef

    public void renderlinef([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x1,
    float y1,
    float x2,
    float y2,
    float r,
    float g,
    float b,
    float a,
    float baseThickness,
    float topThickness)
  + ### render

    public void render([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x1,
    float y1,
    float x2,
    float y2,
    float x3,
    float y3,
    float x4,
    float y4,
    int c1,
    int c2,
    int c3,
    int c4)
  + ### render

    public void render([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### render

    public void render([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    [Texture](textures/Texture.html "class in zombie.core.textures") tex2,
    float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderi

    public void renderi([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    int x,
    int y,
    int width,
    int height,
    float r,
    float g,
    float b,
    float a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderClamped

    public void renderClamped([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    int x,
    int y,
    int width,
    int height,
    int clampMinX,
    int clampMinY,
    int clampWidth,
    int clampHeight,
    float r,
    float g,
    float b,
    float a,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderRect

    public void renderRect(int x,
    int y,
    int width,
    int height,
    float r,
    float g,
    float b,
    float a)
  + ### renderPoly

    public void renderPoly(float x1,
    float y1,
    float x2,
    float y2,
    float x3,
    float y3,
    float x4,
    float y4,
    float r,
    float g,
    float b,
    float a)
  + ### renderPoly

    public void renderPoly([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x1,
    float y1,
    float x2,
    float y2,
    float x3,
    float y3,
    float x4,
    float y4,
    float r,
    float g,
    float b,
    float a)
  + ### renderPoly

    public void renderPoly([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x1,
    float y1,
    float x2,
    float y2,
    float x3,
    float y3,
    float x4,
    float y4,
    float r,
    float g,
    float b,
    float a,
    float u1,
    float v1,
    float u2,
    float v2,
    float u3,
    float v3,
    float u4,
    float v4)
  + ### render

    public void render([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    float u1,
    float v1,
    float u2,
    float v2,
    float u3,
    float v3,
    float u4,
    float v4)
  + ### render

    public void render([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    float u1,
    float v1,
    float u2,
    float v2,
    float u3,
    float v3,
    float u4,
    float v4,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### buildDrawBuffer

    private void buildDrawBuffer(zombie.core.textures.TextureDraw[] sprites,
    zombie.core.Styles.Style[] styles,
    int numSprites)
  + ### prePopulating

    public void prePopulating()
  + ### postRender

    public void postRender()
  + ### buildStateDrawBuffer

    private void buildStateDrawBuffer(zombie.core.sprite.SpriteRenderState renderState)
  + ### buildStateUIDrawBuffer

    private void buildStateUIDrawBuffer(zombie.core.sprite.SpriteRenderState renderState)
  + ### notifyRenderStateQueue

    public void notifyRenderStateQueue()
  + ### glBuffer

    public void glBuffer(int i,
    int p)
  + ### glDoStartFrame

    public void glDoStartFrame(int w,
    int h,
    float zoom,
    int player)
  + ### FBORenderChunkStart

    public void FBORenderChunkStart(int index,
    boolean bClear)
  + ### FBORenderChunkEnd

    public void FBORenderChunkEnd()
  + ### glDoStartFrame

    public void glDoStartFrame(int w,
    int h,
    float zoom,
    int player,
    boolean isTextFrame)
  + ### glDoStartFrameFlipY

    public void glDoStartFrameFlipY(int w,
    int h,
    float zoom,
    int player)
  + ### glDoStartFrameNoZoom

    public void glDoStartFrameNoZoom(int w,
    int h,
    float zoom,
    int player)
  + ### glDoStartFrameFx

    public void glDoStartFrameFx(int w,
    int h,
    int player)
  + ### glIgnoreStyles

    public void glIgnoreStyles(boolean b)
  + ### glDoEndFrame

    public void glDoEndFrame()
  + ### pushIsoView

    public void pushIsoView(float ox,
    float oy,
    float oz,
    float useangle,
    boolean vehicle)
  + ### popIsoView

    public void popIsoView()
  + ### glDoEndFrameFx

    public void glDoEndFrameFx(int player)
  + ### doCoreIntParam

    public void doCoreIntParam(int id,
    float val)
  + ### glTexParameteri

    public void glTexParameteri(int a,
    int b,
    int c)
  + ### StartShader

    public void StartShader(int iD,
    int playerIndex)
  + ### StartShader

    public void StartShader(int iD,
    int playerIndex,
    zombie.core.opengl.ShaderUniformSetter uniforms)
  + ### EndShader

    public void EndShader()
  + ### setCutawayTexture

    public void setCutawayTexture([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    int x,
    int y,
    int w,
    int h)
  + ### clearCutawayTexture

    public void clearCutawayTexture()
  + ### setCutawayTexture2

    public void setCutawayTexture2([Texture](textures/Texture.html "class in zombie.core.textures") tex,
    int x,
    int y,
    int w,
    int h)
  + ### setUseVertColorsArray

    public void setUseVertColorsArray(byte whichShader,
    int c0,
    int c1,
    int c2,
    int c3)
  + ### clearUseVertColorsArray

    public void clearUseVertColorsArray()
  + ### setExtraWallShaderParams

    public void setExtraWallShaderParams([SpriteRenderer.WallShaderTexRender](SpriteRenderer.WallShaderTexRender.html "enum class in zombie.core") wallTexRender)
  + ### ShaderUpdate1i

    public void ShaderUpdate1i(int shaderID,
    int uniform,
    int uniformValue)
  + ### ShaderUpdate1f

    public void ShaderUpdate1f(int shaderID,
    int uniform,
    float uniformValue)
  + ### ShaderUpdate2f

    public void ShaderUpdate2f(int shaderID,
    int uniform,
    float value1,
    float value2)
  + ### ShaderUpdate3f

    public void ShaderUpdate3f(int shaderID,
    int uniform,
    float value1,
    float value2,
    float value3)
  + ### ShaderUpdate4f

    public void ShaderUpdate4f(int shaderID,
    int uniform,
    float value1,
    float value2,
    float value3,
    float value4)
  + ### glLoadIdentity

    public void glLoadIdentity()
  + ### glGenerateMipMaps

    public void glGenerateMipMaps(int a)
  + ### glBind

    public void glBind(int a)
  + ### releaseFBORenderChunkLock

    public void releaseFBORenderChunkLock()
  + ### glViewport

    public void glViewport(int x,
    int y,
    int width,
    int height)
  + ### render

    public void render(imgui.ImDrawData drawData)
  + ### startOffscreenUI

    public void startOffscreenUI()
  + ### stopOffscreenUI

    public void stopOffscreenUI()
  + ### getWaitTime

    public static long getWaitTime()
  + ### pushFrameDown

    public void pushFrameDown()
  + ### acquireStateForRendering

    public zombie.core.sprite.SpriteRenderState acquireStateForRendering([BooleanSupplier](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BooleanSupplier.html "class or interface in java.util.function") waitCallback)
  + ### waitForReadyState

    private boolean waitForReadyState([BooleanSupplier](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BooleanSupplier.html "class or interface in java.util.function") waitCallback)
  + ### waitForReadySlotToOpen

    private void waitForReadySlotToOpen()
  + ### getMainStateIndex

    public int getMainStateIndex()
  + ### getRenderStateIndex

    public int getRenderStateIndex()
  + ### getDoAdditive

    public boolean getDoAdditive()
  + ### setDefaultStyle

    public void setDefaultStyle(zombie.core.Styles.AbstractStyle style)
  + ### setDoAdditive

    public void setDoAdditive(boolean bDoAdditive)
  + ### initFromIsoCamera

    public void initFromIsoCamera(int nPlayer)
  + ### setRenderingPlayerIndex

    public void setRenderingPlayerIndex(int player)
  + ### getRenderingPlayerIndex

    public int getRenderingPlayerIndex()
  + ### getRenderingPlayerCamera

    public zombie.iso.PlayerCamera getRenderingPlayerCamera(int userId)
  + ### getRenderingState

    public zombie.core.sprite.SpriteRenderState getRenderingState()
  + ### getPopulatingState

    public zombie.core.sprite.SpriteRenderState getPopulatingState()
  + ### isMaxZoomLevel

    public boolean isMaxZoomLevel()
  + ### isMinZoomLevel

    public boolean isMinZoomLevel()
  + ### getPlayerZoomLevel

    public float getPlayerZoomLevel()
  + ### getPlayerMaxZoom

    public float getPlayerMaxZoom()
  + ### getPlayerMinZoom

    public float getPlayerMinZoom()
  + ### isWaitingForRenderState

    public boolean isWaitingForRenderState()