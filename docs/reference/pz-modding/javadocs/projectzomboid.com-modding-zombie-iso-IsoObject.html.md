[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoObject](IsoObject.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MAX\_WALL\_SPLATS](#MAX_WALL_SPLATS)
   2. [THUMP\_STRESS\_THUMPABLE](#THUMP_STRESS_THUMPABLE)
   3. [THUMP\_STRESS\_DEFAULT](#THUMP_STRESS_DEFAULT)
   4. [THUMP\_STRESS\_FENCES](#THUMP_STRESS_FENCES)
   5. [THUMP\_STRESS\_TRANSPARENT\_FENCES](#THUMP_STRESS_TRANSPARENT_FENCES)
   6. [lastRendered](#lastRendered)
   7. [lastRenderedRendered](#lastRenderedRendered)
   8. [stCol](#stCol)
   9. [rmod](#rmod)
   10. [gmod](#gmod)
   11. [bmod](#bmod)
   12. [doRender](#doRender)
   13. [isSceneCulled](#isSceneCulled)
   14. [lowLightingQualityHack](#lowLightingQualityHack)
   15. [stCol2](#stCol2)
   16. [colFxMask](#colFxMask)
   17. [fireColor](#fireColor)
   18. [ppfHighlighted](#ppfHighlighted)
   19. [ppfHighlightRenderOnce](#ppfHighlightRenderOnce)
   20. [ppfBlink](#ppfBlink)
   21. [satChair](#satChair)
   22. [keyId](#keyId)
   23. [emitter](#emitter)
   24. [sheetRopeHealth](#sheetRopeHealth)
   25. [sheetRope](#sheetRope)
   26. [neverDoneAlpha](#neverDoneAlpha)
   27. [alphaForced](#alphaForced)
   28. [attachedAnimSprite](#attachedAnimSprite)
   29. [wallBloodSplats](#wallBloodSplats)
   30. [container](#container)
   31. [dir](#dir)
   32. [damage](#damage)
   33. [partialThumpDmg](#partialThumpDmg)
   34. [noPicking](#noPicking)
   35. [offsetX](#offsetX)
   36. [offsetY](#offsetY)
   37. [outlineOnMouseover](#outlineOnMouseover)
   38. [rerouteMask](#rerouteMask)
   39. [sprite](#sprite)
   40. [overlaySprite](#overlaySprite)
   41. [overlaySpriteColor](#overlaySpriteColor)
   42. [square](#square)
   43. [alpha](#alpha)
   44. [targetAlpha](#targetAlpha)
   45. [renderInfo](#renderInfo)
   46. [rerouteCollide](#rerouteCollide)
   47. [table](#table)
   48. [name](#name)
   49. [tintr](#tintr)
   50. [tintg](#tintg)
   51. [tintb](#tintb)
   52. [spriteName](#spriteName)
   53. [sx](#sx)
   54. [sy](#sy)
   55. [doNotSync](#doNotSync)
   56. [windRenderEffects](#windRenderEffects)
   57. [objectRenderEffects](#objectRenderEffects)
   58. [externalWaterSource](#externalWaterSource)
   59. [usesExternalWaterSource](#usesExternalWaterSource)
   60. [children](#children)
   61. [tile](#tile)
   62. [specialTooltip](#specialTooltip)
   63. [highlightColor](#highlightColor)
   64. [secondaryContainers](#secondaryContainers)
   65. [customColor](#customColor)
   66. [renderYOffset](#renderYOffset)
   67. [isOutlineHighlight](#isOutlineHighlight)
   68. [isOutlineHlAttached](#isOutlineHlAttached)
   69. [isOutlineHlBlink](#isOutlineHlBlink)
   70. [outlineHighlightCol](#outlineHighlightCol)
   71. [outlineThickness](#outlineThickness)
   72. [movedThumpable](#movedThumpable)
   73. [spriteModelName](#spriteModelName)
   74. [spriteModel](#spriteModel)
   75. [spriteModelInit](#spriteModelInit)
   76. [animating](#animating)
   77. [lightSource](#lightSource)
   78. [onOverlay](#onOverlay)
   79. [renderSquareOverride](#renderSquareOverride)
   80. [renderSquareOverride2](#renderSquareOverride2)
   81. [renderDepthAdjust](#renderDepthAdjust)
   82. [clockScript](#clockScript)
   83. [clockScriptInit](#clockScriptInit)
   84. [hasPowerTick](#hasPowerTick)
   85. [hasPower](#hasPower)
   86. [byteToObjectMap](#byteToObjectMap)
   87. [hashCodeToObjectMap](#hashCodeToObjectMap)
   88. [nameToObjectMap](#nameToObjectMap)
   89. [removeFromWorldToMeta](#removeFromWorldToMeta)
   90. [isoEntityNetId](#isoEntityNetId)
   91. [lastObjectIndex](#lastObjectIndex)
   92. [ecsComponentMap](#ecsComponentMap)
   93. [factoryIsoObject](#factoryIsoObject)
   94. [factoryVehicle](#factoryVehicle)
   95. [NORTH\_FLAGS](#NORTH_FLAGS)
7. [Constructor Details](#constructor-detail)
   1. [IsoObject(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
   2. [IsoObject()](#%3Cinit%3E())
   3. [IsoObject(IsoCell, IsoGridSquare, IsoSprite)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,zombie.iso.sprite.IsoSprite))
   4. [IsoObject(IsoCell, IsoGridSquare, String)](#%3Cinit%3E(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,java.lang.String))
   5. [IsoObject(IsoGridSquare, String, String)](#%3Cinit%3E(zombie.iso.IsoGridSquare,java.lang.String,java.lang.String))
   6. [IsoObject(IsoGridSquare, String, String, boolean)](#%3Cinit%3E(zombie.iso.IsoGridSquare,java.lang.String,java.lang.String,boolean))
   7. [IsoObject(IsoGridSquare, String, boolean)](#%3Cinit%3E(zombie.iso.IsoGridSquare,java.lang.String,boolean))
   8. [IsoObject(IsoGridSquare, String)](#%3Cinit%3E(zombie.iso.IsoGridSquare,java.lang.String))
8. [Method Details](#method-detail)
   1. [isFloor()](#isFloor())
   2. [getNew(IsoGridSquare, String, String, boolean)](#getNew(zombie.iso.IsoGridSquare,java.lang.String,java.lang.String,boolean))
   3. [getLastRendered()](#getLastRendered())
   4. [setLastRendered(IsoObject)](#setLastRendered(zombie.iso.IsoObject))
   5. [getLastRenderedRendered()](#getLastRenderedRendered())
   6. [setLastRenderedRendered(IsoObject)](#setLastRenderedRendered(zombie.iso.IsoObject))
   7. [getNew()](#getNew())
   8. [getECSComponentMap()](#getECSComponentMap())
   9. [addIsoObjectFactory(IsoObject.IsoObjectFactory)](#addIsoObjectFactory(zombie.iso.IsoObject.IsoObjectFactory))
   10. [getFactoryVehicle()](#getFactoryVehicle())
   11. [initFactory()](#initFactory())
   12. [factoryGetClassID(String)](#factoryGetClassID(java.lang.String))
   13. [factoryFromFileInput(IsoCell, byte)](#factoryFromFileInput(zombie.iso.IsoCell,byte))
   14. [factoryFromFileInput\_OLD(IsoCell, int)](#factoryFromFileInput_OLD(zombie.iso.IsoCell,int))
   15. [factoryClassFromFileInput(IsoCell, int)](#factoryClassFromFileInput(zombie.iso.IsoCell,int))
   16. [factoryFromFileInput(IsoCell, DataInputStream)](#factoryFromFileInput(zombie.iso.IsoCell,java.io.DataInputStream))
   17. [factoryFromFileInput(IsoCell, ByteBuffer)](#factoryFromFileInput(zombie.iso.IsoCell,java.nio.ByteBuffer))
   18. [sync()](#sync())
   19. [sync(int)](#sync(int))
   20. [syncIsoObject(boolean, byte, UdpConnection, ByteBufferReader)](#syncIsoObject(boolean,byte,zombie.core.raknet.UdpConnection,zombie.core.network.ByteBufferReader))
   21. [syncIsoObjectSend(ByteBufferWriter)](#syncIsoObjectSend(zombie.core.network.ByteBufferWriter))
   22. [syncIsoObjectReceive(ByteBufferReader)](#syncIsoObjectReceive(zombie.core.network.ByteBufferReader))
   23. [syncFluidContainerReceive(ByteBufferReader)](#syncFluidContainerReceive(zombie.core.network.ByteBufferReader))
   24. [syncFluidContainerSend(ByteBufferWriter)](#syncFluidContainerSend(zombie.core.network.ByteBufferWriter))
   25. [getTextureName()](#getTextureName())
   26. [Serialize()](#Serialize())
   27. [getModData()](#getModData())
   28. [setModData(KahluaTable)](#setModData(se.krka.kahlua.vm.KahluaTable))
   29. [hasModData()](#hasModData())
   30. [getSquare()](#getSquare())
   31. [setSquare(IsoGridSquare)](#setSquare(zombie.iso.IsoGridSquare))
   32. [getChunk()](#getChunk())
   33. [update()](#update())
   34. [DirtySlice()](#DirtySlice())
   35. [getObjectName()](#getObjectName())
   36. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   37. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   38. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   39. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   40. [saveState(ByteBuffer)](#saveState(java.nio.ByteBuffer))
   41. [loadState(ByteBuffer)](#loadState(java.nio.ByteBuffer))
   42. [softReset()](#softReset())
   43. [AttackObject(IsoGameCharacter)](#AttackObject(zombie.characters.IsoGameCharacter))
   44. [onMouseRightClick(int, int)](#onMouseRightClick(int,int))
   45. [onMouseRightReleased()](#onMouseRightReleased())
   46. [Hit(Vector2, IsoObject, float)](#Hit(zombie.iso.Vector2,zombie.iso.IsoObject,float))
   47. [Damage(float)](#Damage(float))
   48. [HitByVehicle(BaseVehicle, float)](#HitByVehicle(zombie.vehicles.BaseVehicle,float))
   49. [Collision(Vector2, IsoObject)](#Collision(zombie.iso.Vector2,zombie.iso.IsoObject))
   50. [UnCollision(IsoObject)](#UnCollision(zombie.iso.IsoObject))
   51. [GetVehicleSlowFactor(BaseVehicle)](#GetVehicleSlowFactor(zombie.vehicles.BaseVehicle))
   52. [getRerouteCollide()](#getRerouteCollide())
   53. [setRerouteCollide(IsoObject)](#setRerouteCollide(zombie.iso.IsoObject))
   54. [getTable()](#getTable())
   55. [setTable(KahluaTable)](#setTable(se.krka.kahlua.vm.KahluaTable))
   56. [setAlpha(float)](#setAlpha(float))
   57. [setAlpha(int, float)](#setAlpha(int,float))
   58. [setAlphaToTarget(int)](#setAlphaToTarget(int))
   59. [setAlphaAndTarget(float)](#setAlphaAndTarget(float))
   60. [setAlphaAndTarget(int, float)](#setAlphaAndTarget(int,float))
   61. [getAlpha()](#getAlpha())
   62. [getAlpha(int)](#getAlpha(int))
   63. [getAttachedAnimSprite()](#getAttachedAnimSprite())
   64. [setAttachedAnimSprite(ArrayList)](#setAttachedAnimSprite(java.util.ArrayList))
   65. [getAttachedAnimSpriteCount()](#getAttachedAnimSpriteCount())
   66. [hasAttachedAnimSprites()](#hasAttachedAnimSprites())
   67. [addAttachedAnimSpriteInstance(IsoSpriteInstance)](#addAttachedAnimSpriteInstance(zombie.iso.sprite.IsoSpriteInstance))
   68. [addAttachedAnimSprite(IsoSprite)](#addAttachedAnimSprite(zombie.iso.sprite.IsoSprite))
   69. [addAttachedAnimSpriteByName(String)](#addAttachedAnimSpriteByName(java.lang.String))
   70. [isAttachedAnimSprite(IsoSprite)](#isAttachedAnimSprite(zombie.iso.sprite.IsoSprite))
   71. [isAttachedOrOverlaySprite(IsoSprite)](#isAttachedOrOverlaySprite(zombie.iso.sprite.IsoSprite))
   72. [getCell()](#getCell())
   73. [getChildSprites()](#getChildSprites())
   74. [setChildSprites(ArrayList)](#setChildSprites(java.util.ArrayList))
   75. [clearAttachedAnimSprite()](#clearAttachedAnimSprite())
   76. [getContainer()](#getContainer())
   77. [setContainer(ItemContainer)](#setContainer(zombie.inventory.ItemContainer))
   78. [getContainers(T, Invokers.Params2.Boolean.ICallback, PZArrayList)](#getContainers(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,zombie.util.list.PZArrayList))
   79. [getContainerClickedOn(int, int)](#getContainerClickedOn(int,int))
   80. [getDir()](#getDir())
   81. [setDir(int)](#setDir(int))
   82. [setForwardIsoDirection(IsoDirections)](#setForwardIsoDirection(zombie.iso.IsoDirections))
   83. [setForwardIsoDirection(int)](#setForwardIsoDirection(int))
   84. [getForwardIsoDirection()](#getForwardIsoDirection())
   85. [getForwardMovementIsoDirection()](#getForwardMovementIsoDirection())
   86. [getDamage()](#getDamage())
   87. [setDamage(short)](#setDamage(short))
   88. [isNoPicking()](#isNoPicking())
   89. [setNoPicking(boolean)](#setNoPicking(boolean))
   90. [isOutlineOnMouseover()](#isOutlineOnMouseover())
   91. [setOutlineOnMouseover(boolean)](#setOutlineOnMouseover(boolean))
   92. [getRerouteMask()](#getRerouteMask())
   93. [setRerouteMask(IsoObject)](#setRerouteMask(zombie.iso.IsoObject))
   94. [getSprite()](#getSprite())
   95. [setSprite(IsoSprite)](#setSprite(zombie.iso.sprite.IsoSprite))
   96. [setSprite(String)](#setSprite(java.lang.String))
   97. [setSpriteFromName(String)](#setSpriteFromName(java.lang.String))
   98. [getSpriteGrid()](#getSpriteGrid())
   99. [hasSpriteGrid()](#hasSpriteGrid())
   100. [getTargetAlpha()](#getTargetAlpha())
   101. [setTargetAlpha(float)](#setTargetAlpha(float))
   102. [setTargetAlpha(int, float)](#setTargetAlpha(int,float))
   103. [getTargetAlpha(int)](#getTargetAlpha(int))
   104. [isAlphaAndTargetZero()](#isAlphaAndTargetZero())
   105. [isAlphaAndTargetZero(int)](#isAlphaAndTargetZero(int))
   106. [isAlphaZero()](#isAlphaZero())
   107. [isAlphaZero(int)](#isAlphaZero(int))
   108. [isTargetAlphaZero(int)](#isTargetAlphaZero(int))
   109. [getType()](#getType())
   110. [setType(IsoObjectType)](#setType(zombie.iso.SpriteDetails.IsoObjectType))
   111. [addChild(IsoObject)](#addChild(zombie.iso.IsoObject))
   112. [debugPrintout()](#debugPrintout())
   113. [checkMoveWithWind()](#checkMoveWithWind())
   114. [checkMoveWithWind(boolean)](#checkMoveWithWind(boolean))
   115. [reset()](#reset())
   116. [customHashCode()](#customHashCode())
   117. [SetName(String)](#SetName(java.lang.String))
   118. [getName()](#getName())
   119. [setName(String)](#setName(java.lang.String))
   120. [getSpriteName()](#getSpriteName())
   121. [getTile()](#getTile())
   122. [setTile(String)](#setTile(java.lang.String))
   123. [isCharacter()](#isCharacter())
   124. [isZombie()](#isZombie())
   125. [getScriptName()](#getScriptName())
   126. [AttachAnim(String, String, int, float, int, int, boolean, int, boolean, float, ColorInfo)](#AttachAnim(java.lang.String,java.lang.String,int,float,int,int,boolean,int,boolean,float,zombie.core.textures.ColorInfo))
   127. [AttachAnim(String, String, int, float, int, int, boolean, int, boolean, float, ColorInfo, boolean)](#AttachAnim(java.lang.String,java.lang.String,int,float,int,int,boolean,int,boolean,float,zombie.core.textures.ColorInfo,boolean))
   128. [AttachExistingAnim(IsoSprite, int, int, boolean, int, boolean, float, ColorInfo)](#AttachExistingAnim(zombie.iso.sprite.IsoSprite,int,int,boolean,int,boolean,float,zombie.core.textures.ColorInfo))
   129. [AttachExistingAnim(IsoSprite, int, int, boolean, int, boolean, float)](#AttachExistingAnim(zombie.iso.sprite.IsoSprite,int,int,boolean,int,boolean,float))
   130. [DoTooltip(ObjectTooltip)](#DoTooltip(zombie.ui.ObjectTooltip))
   131. [DoSpecialTooltip(ObjectTooltip, IsoGridSquare)](#DoSpecialTooltip(zombie.ui.ObjectTooltip,zombie.iso.IsoGridSquare))
   132. [getItemContainer()](#getItemContainer())
   133. [getOffsetX()](#getOffsetX())
   134. [setOffsetX(float)](#setOffsetX(float))
   135. [getOffsetY()](#getOffsetY())
   136. [setOffsetY(float)](#setOffsetY(float))
   137. [getRerouteMaskObject()](#getRerouteMaskObject())
   138. [HasTooltip()](#HasTooltip())
   139. [getUsesExternalWaterSource()](#getUsesExternalWaterSource())
   140. [setUsesExternalWaterSource(boolean)](#setUsesExternalWaterSource(boolean))
   141. [hasExternalWaterSource()](#hasExternalWaterSource())
   142. [doFindExternalWaterSource()](#doFindExternalWaterSource())
   143. [FindExternalWaterSource()](#FindExternalWaterSource())
   144. [FindExternalWaterSource(IsoGridSquare)](#FindExternalWaterSource(zombie.iso.IsoGridSquare))
   145. [FindExternalWaterSource(int, int, int)](#FindExternalWaterSource(int,int,int))
   146. [FindWaterSourceOnSquare(IsoGridSquare)](#FindWaterSourceOnSquare(zombie.iso.IsoGridSquare))
   147. [getPipedFuelAmount()](#getPipedFuelAmount())
   148. [setPipedFuelAmount(int)](#setPipedFuelAmount(int))
   149. [isWaterInfinite()](#isWaterInfinite())
   150. [getInfiniteWaterType()](#getInfiniteWaterType())
   151. [isUnmovedPipedWaterSource()](#isUnmovedPipedWaterSource())
   152. [checkExternalFluidSource()](#checkExternalFluidSource())
   153. [getFluidAmount()](#getFluidAmount())
   154. [emptyFluid()](#emptyFluid())
   155. [getFluidCapacity()](#getFluidCapacity())
   156. [useFluid(float)](#useFluid(float))
   157. [addFluid(FluidType, float)](#addFluid(zombie.entity.components.fluids.FluidType,float))
   158. [canTransferFluidFrom(FluidContainer)](#canTransferFluidFrom(zombie.entity.components.fluids.FluidContainer))
   159. [canTransferFluidTo(FluidContainer)](#canTransferFluidTo(zombie.entity.components.fluids.FluidContainer))
   160. [createSampleAndPurifyWater(FluidContainer, float)](#createSampleAndPurifyWater(zombie.entity.components.fluids.FluidContainer,float))
   161. [transferFluidTo(FluidContainer, float)](#transferFluidTo(zombie.entity.components.fluids.FluidContainer,float))
   162. [transferFluidFrom(FluidContainer, float)](#transferFluidFrom(zombie.entity.components.fluids.FluidContainer,float))
   163. [moveFluidToTemporaryContainer(float)](#moveFluidToTemporaryContainer(float))
   164. [purifyExternalWaterSample(FluidContainer)](#purifyExternalWaterSample(zombie.entity.components.fluids.FluidContainer))
   165. [getPrimaryFluid()](#getPrimaryFluid())
   166. [getFluidUiName()](#getFluidUiName())
   167. [hasFluid()](#hasFluid())
   168. [hasWater()](#hasWater())
   169. [isFluidInputLocked()](#isFluidInputLocked())
   170. [isTaintedWater()](#isTaintedWater())
   171. [hasReserveWater()](#hasReserveWater())
   172. [getReserveWaterAmount()](#getReserveWaterAmount())
   173. [getReserveWaterMax()](#getReserveWaterMax())
   174. [setReserveWaterAmount(float)](#setReserveWaterAmount(float))
   175. [replaceItem(InventoryItem)](#replaceItem(zombie.inventory.InventoryItem))
   176. [useItemOn(InventoryItem)](#useItemOn(zombie.inventory.InventoryItem))
   177. [isCanPath()](#isCanPath())
   178. [getX()](#getX())
   179. [getY()](#getY())
   180. [getZ()](#getZ())
   181. [getPosition(Vector3)](#getPosition(zombie.iso.Vector3))
   182. [getPosition(Vector3f)](#getPosition(org.lwjgl.util.vector.Vector3f))
   183. [onMouseLeftClick(int, int)](#onMouseLeftClick(int,int))
   184. [getProperties()](#getProperties())
   185. [hasProperty(IsoPropertyType)](#hasProperty(zombie.core.properties.IsoPropertyType))
   186. [hasProperty(IsoFlagType)](#hasProperty(zombie.iso.SpriteDetails.IsoFlagType))
   187. [hasProperty(String)](#hasProperty(java.lang.String))
   188. [getProperty(IsoPropertyType)](#getProperty(zombie.core.properties.IsoPropertyType))
   189. [getProperty(String)](#getProperty(java.lang.String))
   190. [propertyEquals(String, String)](#propertyEquals(java.lang.String,java.lang.String))
   191. [propertyEqualsIgnoreCase(String, String)](#propertyEqualsIgnoreCase(java.lang.String,java.lang.String))
   192. [RemoveAttachedAnims()](#RemoveAttachedAnims())
   193. [RemoveAttachedAnim(int)](#RemoveAttachedAnim(int))
   194. [afterRotated()](#afterRotated())
   195. [getFacingPosition(Vector2)](#getFacingPosition(zombie.iso.Vector2))
   196. [getFacingPositionAlt(Vector2)](#getFacingPositionAlt(zombie.iso.Vector2))
   197. [getRenderYOffset()](#getRenderYOffset())
   198. [setRenderYOffset(float)](#setRenderYOffset(float))
   199. [isTableSurface()](#isTableSurface())
   200. [isTableTopObject()](#isTableTopObject())
   201. [getIsSurfaceNormalOffset()](#getIsSurfaceNormalOffset())
   202. [getSurfaceNormalOffset()](#getSurfaceNormalOffset())
   203. [getSurfaceOffsetNoTable()](#getSurfaceOffsetNoTable())
   204. [getSurfaceOffset()](#getSurfaceOffset())
   205. [isStairsNorth()](#isStairsNorth())
   206. [isStairsWest()](#isStairsWest())
   207. [isStairsObject()](#isStairsObject())
   208. [isHoppable()](#isHoppable())
   209. [isTallHoppable()](#isTallHoppable())
   210. [isNorthHoppable()](#isNorthHoppable())
   211. [isWall()](#isWall())
   212. [isWallN()](#isWallN())
   213. [isWallW()](#isWallW())
   214. [isWallSE()](#isWallSE())
   215. [haveSheetRope()](#haveSheetRope())
   216. [countAddSheetRope()](#countAddSheetRope())
   217. [canAddSheetRope()](#canAddSheetRope())
   218. [addSheetRope(IsoPlayer, String)](#addSheetRope(zombie.characters.IsoPlayer,java.lang.String))
   219. [removeSheetRope(IsoPlayer)](#removeSheetRope(zombie.characters.IsoPlayer))
   220. [setDoRender(boolean)](#setDoRender(boolean))
   221. [getDoRender()](#getDoRender())
   222. [isSceneCulled()](#isSceneCulled())
   223. [setSceneCulled(boolean)](#setSceneCulled(boolean))
   224. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   225. [debugRenderItemHeight(float, float, float)](#debugRenderItemHeight(float,float,float))
   226. [debugRenderSurface(float, float, float)](#debugRenderSurface(float,float,float))
   227. [renderFloorTile(float, float, float, ColorInfo, boolean, boolean, Shader, Consumer, Consumer)](#renderFloorTile(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader,java.util.function.Consumer,java.util.function.Consumer))
   228. [renderWallTile(IsoDirections, float, float, float, ColorInfo, boolean, boolean, Shader, Consumer)](#renderWallTile(zombie.iso.IsoDirections,float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader,java.util.function.Consumer))
   229. [renderWallTileDepth(IsoDirections, boolean, boolean, boolean, int, float, float, float, ColorInfo, Shader, Consumer)](#renderWallTileDepth(zombie.iso.IsoDirections,boolean,boolean,boolean,int,float,float,float,zombie.core.textures.ColorInfo,zombie.core.opengl.Shader,java.util.function.Consumer))
   230. [renderWallTileOnly(IsoDirections, float, float, float, ColorInfo, Shader, Consumer)](#renderWallTileOnly(zombie.iso.IsoDirections,float,float,float,zombie.core.textures.ColorInfo,zombie.core.opengl.Shader,java.util.function.Consumer))
   231. [shouldDrawMainSprite()](#shouldDrawMainSprite())
   232. [renderAttachedAndOverlaySprites(IsoDirections, float, float, float, ColorInfo, boolean, boolean, Shader, Consumer)](#renderAttachedAndOverlaySprites(zombie.iso.IsoDirections,float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader,java.util.function.Consumer))
   233. [renderAttachedAndOverlaySpritesInternal(IsoDirections, float, float, float, ColorInfo, boolean, boolean, Shader, Consumer)](#renderAttachedAndOverlaySpritesInternal(zombie.iso.IsoDirections,float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader,java.util.function.Consumer))
   234. [prepareToRender(ColorInfo)](#prepareToRender(zombie.core.textures.ColorInfo))
   235. [getAlphaUpdateRateDiv()](#getAlphaUpdateRateDiv())
   236. [getAlphaUpdateRateMul()](#getAlphaUpdateRateMul())
   237. [isUpdateAlphaEnabled()](#isUpdateAlphaEnabled())
   238. [isUpdateAlphaDuringRender()](#isUpdateAlphaDuringRender())
   239. [updateAlpha()](#updateAlpha())
   240. [updateAlpha(int)](#updateAlpha(int))
   241. [updateAlpha(int, float, float)](#updateAlpha(int,float,float))
   242. [renderOverlaySprites(float, float, float, ColorInfo, Shader, Consumer)](#renderOverlaySprites(float,float,float,zombie.core.textures.ColorInfo,zombie.core.opengl.Shader,java.util.function.Consumer))
   243. [renderAttachedSprites(IsoDirections, float, float, float, ColorInfo, boolean, Shader, Consumer)](#renderAttachedSprites(zombie.iso.IsoDirections,float,float,float,zombie.core.textures.ColorInfo,boolean,zombie.core.opengl.Shader,java.util.function.Consumer))
   244. [isSpriteInvisible()](#isSpriteInvisible())
   245. [renderFxMask(float, float, float, boolean)](#renderFxMask(float,float,float,boolean))
   246. [renderObjectPicker(float, float, float, ColorInfo)](#renderObjectPicker(float,float,float,zombie.core.textures.ColorInfo))
   247. [TestPathfindCollide(IsoMovingObject, IsoGridSquare, IsoGridSquare)](#TestPathfindCollide(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   248. [TestCollide(IsoMovingObject, IsoGridSquare, IsoGridSquare)](#TestCollide(zombie.iso.IsoMovingObject,zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   249. [TestVision(IsoGridSquare, IsoGridSquare)](#TestVision(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))
   250. [getCurrentFrameTex()](#getCurrentFrameTex())
   251. [isMaskClicked(int, int)](#isMaskClicked(int,int))
   252. [isMaskClicked(int, int, boolean)](#isMaskClicked(int,int,boolean))
   253. [getMaskClickedY(int, int, boolean)](#getMaskClickedY(int,int,boolean))
   254. [getCustomColor()](#getCustomColor())
   255. [setCustomColor(ColorInfo)](#setCustomColor(zombie.core.textures.ColorInfo))
   256. [setCustomColor(float, float, float, float)](#setCustomColor(float,float,float,float))
   257. [loadFromRemoteBuffer(ByteBufferReader)](#loadFromRemoteBuffer(zombie.core.network.ByteBufferReader))
   258. [loadFromRemoteBuffer(ByteBufferReader, boolean)](#loadFromRemoteBuffer(zombie.core.network.ByteBufferReader,boolean))
   259. [hasObjectAmbientEmitter()](#hasObjectAmbientEmitter())
   260. [addObjectAmbientEmitter(ObjectAmbientEmitters.PerObjectLogic)](#addObjectAmbientEmitter(zombie.audio.ObjectAmbientEmitters.PerObjectLogic))
   261. [addToWorld()](#addToWorld())
   262. [removeFromWorld()](#removeFromWorld())
   263. [removeFromWorldToMeta()](#removeFromWorldToMeta())
   264. [reuseGridSquare()](#reuseGridSquare())
   265. [removeFromSquare()](#removeFromSquare())
   266. [transmitCustomColorToClients()](#transmitCustomColorToClients())
   267. [transmitCompleteItemToClients()](#transmitCompleteItemToClients())
   268. [transmitUpdatedSpriteToClients(UdpConnection)](#transmitUpdatedSpriteToClients(zombie.core.raknet.UdpConnection))
   269. [transmitUpdatedSpriteToClients()](#transmitUpdatedSpriteToClients())
   270. [transmitUpdatedSprite()](#transmitUpdatedSprite())
   271. [sendObjectChange(IsoObjectChange)](#sendObjectChange(zombie.core.properties.IsoObjectChange))
   272. [sendObjectChange(IsoObjectChange, KahluaTable)](#sendObjectChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable))
   273. [sendObjectChange(IsoObjectChange, Object...)](#sendObjectChange(zombie.core.properties.IsoObjectChange,java.lang.Object...))
   274. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   275. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   276. [transmitUpdatedSpriteToServer()](#transmitUpdatedSpriteToServer())
   277. [transmitModData()](#transmitModData())
   278. [writeToRemoteBuffer(ByteBufferWriter)](#writeToRemoteBuffer(zombie.core.network.ByteBufferWriter))
   279. [getObjectIndex()](#getObjectIndex())
   280. [getMovingObjectIndex()](#getMovingObjectIndex())
   281. [getSpecialObjectIndex()](#getSpecialObjectIndex())
   282. [getStaticMovingObjectIndex()](#getStaticMovingObjectIndex())
   283. [getWorldObjectIndex()](#getWorldObjectIndex())
   284. [getOverlaySprite()](#getOverlaySprite())
   285. [setOverlaySprite(String)](#setOverlaySprite(java.lang.String))
   286. [setOverlaySprite(String, boolean)](#setOverlaySprite(java.lang.String,boolean))
   287. [setOverlaySpriteColor(float, float, float, float)](#setOverlaySpriteColor(float,float,float,float))
   288. [getOverlaySpriteColor()](#getOverlaySpriteColor())
   289. [setOverlaySprite(String, float, float, float, float)](#setOverlaySprite(java.lang.String,float,float,float,float))
   290. [setOverlaySprite(String, float, float, float, float, boolean)](#setOverlaySprite(java.lang.String,float,float,float,float,boolean))
   291. [hasOverlaySprite()](#hasOverlaySprite())
   292. [haveSpecialTooltip()](#haveSpecialTooltip())
   293. [setSpecialTooltip(boolean)](#setSpecialTooltip(boolean))
   294. [getKeyId()](#getKeyId())
   295. [setKeyId(int)](#setKeyId(int))
   296. [isHighlighted()](#isHighlighted())
   297. [setHighlighted(boolean)](#setHighlighted(boolean))
   298. [setHighlighted(boolean, boolean)](#setHighlighted(boolean,boolean))
   299. [isHighlightRenderOnce()](#isHighlightRenderOnce())
   300. [setHighlightRenderOnce(boolean)](#setHighlightRenderOnce(boolean))
   301. [isHighlighted(int)](#isHighlighted(int))
   302. [setHighlighted(int, boolean)](#setHighlighted(int,boolean))
   303. [setHighlighted(int, boolean, boolean)](#setHighlighted(int,boolean,boolean))
   304. [isHighlightRenderOnce(int)](#isHighlightRenderOnce(int))
   305. [setHighlightRenderOnce(int, boolean)](#setHighlightRenderOnce(int,boolean))
   306. [getHighlightColor()](#getHighlightColor())
   307. [setHighlightColor(ColorInfo)](#setHighlightColor(zombie.core.textures.ColorInfo))
   308. [setHighlightColor(float, float, float, float)](#setHighlightColor(float,float,float,float))
   309. [getOrCreateHighlightColor(int)](#getOrCreateHighlightColor(int))
   310. [getHighlightColor(int)](#getHighlightColor(int))
   311. [setHighlightColor(int, ColorInfo)](#setHighlightColor(int,zombie.core.textures.ColorInfo))
   312. [setHighlightColor(int, float, float, float, float)](#setHighlightColor(int,float,float,float,float))
   313. [isBlink()](#isBlink())
   314. [setBlink(boolean)](#setBlink(boolean))
   315. [isBlink(int)](#isBlink(int))
   316. [setBlink(int, boolean)](#setBlink(int,boolean))
   317. [isSatChair()](#isSatChair())
   318. [setSatChair(boolean)](#setSatChair(boolean))
   319. [couldBePoweredByGenerator()](#couldBePoweredByGenerator())
   320. [getGeneratorPowerConsumption()](#getGeneratorPowerConsumption())
   321. [checkHaveElectricity()](#checkHaveElectricity())
   322. [checkAmbientSound()](#checkAmbientSound())
   323. [getContainerCount()](#getContainerCount())
   324. [getContainerByIndex(int)](#getContainerByIndex(int))
   325. [getContainerByType(String)](#getContainerByType(java.lang.String))
   326. [getContainerByEitherType(String, String)](#getContainerByEitherType(java.lang.String,java.lang.String))
   327. [addSecondaryContainer(ItemContainer)](#addSecondaryContainer(zombie.inventory.ItemContainer))
   328. [getContainerIndex(ItemContainer)](#getContainerIndex(zombie.inventory.ItemContainer))
   329. [removeAllContainers()](#removeAllContainers())
   330. [createFluidContainersFromSpriteProperties()](#createFluidContainersFromSpriteProperties())
   331. [createContainersFromSpriteProperties()](#createContainersFromSpriteProperties())
   332. [isItemAllowedInContainer(ItemContainer, InventoryItem)](#isItemAllowedInContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem))
   333. [isRemoveItemAllowedFromContainer(ItemContainer, InventoryItem)](#isRemoveItemAllowedFromContainer(zombie.inventory.ItemContainer,zombie.inventory.InventoryItem))
   334. [cleanWallBlood()](#cleanWallBlood())
   335. [getWindRenderEffects()](#getWindRenderEffects())
   336. [getObjectRenderEffects()](#getObjectRenderEffects())
   337. [setRenderEffect(RenderEffectType)](#setRenderEffect(zombie.iso.objects.RenderEffectType))
   338. [getRenderEffectMaster()](#getRenderEffectMaster())
   339. [getRenderEffectObjectCount()](#getRenderEffectObjectCount())
   340. [getRenderEffectObjectByIndex(int)](#getRenderEffectObjectByIndex(int))
   341. [setRenderEffect(RenderEffectType, boolean)](#setRenderEffect(zombie.iso.objects.RenderEffectType,boolean))
   342. [removeRenderEffect(ObjectRenderEffects)](#removeRenderEffect(zombie.iso.objects.ObjectRenderEffects))
   343. [getObjectRenderEffectsToApply()](#getObjectRenderEffectsToApply())
   344. [destroyFence(IsoDirections)](#destroyFence(zombie.iso.IsoDirections))
   345. [getSpriteGridObjects(ArrayList)](#getSpriteGridObjects(java.util.ArrayList))
   346. [getSpriteGridObjectsExcludingSelf(ArrayList)](#getSpriteGridObjectsExcludingSelf(java.util.ArrayList))
   347. [getSpriteGridObjectsIncludingSelf(ArrayList)](#getSpriteGridObjectsIncludingSelf(java.util.ArrayList))
   348. [getSpriteGridObjects(ArrayList, boolean)](#getSpriteGridObjects(java.util.ArrayList,boolean))
   349. [isConnectedSpriteGridObject(IsoObject)](#isConnectedSpriteGridObject(zombie.iso.IsoObject))
   350. [getClosestSpriteGridObject(float, float)](#getClosestSpriteGridObject(float,float))
   351. [isOnScreen()](#isOnScreen())
   352. [setOutlineHighlightCol(ColorInfo)](#setOutlineHighlightCol(zombie.core.textures.ColorInfo))
   353. [getOutlineHighlightCol(int)](#getOutlineHighlightCol(int))
   354. [setOutlineHighlightCol(int, ColorInfo)](#setOutlineHighlightCol(int,zombie.core.textures.ColorInfo))
   355. [setOutlineHighlightCol(float, float, float, float)](#setOutlineHighlightCol(float,float,float,float))
   356. [setOutlineHighlightCol(int, float, float, float, float)](#setOutlineHighlightCol(int,float,float,float,float))
   357. [isOutlineHighlight()](#isOutlineHighlight())
   358. [isOutlineHighlight(int)](#isOutlineHighlight(int))
   359. [setOutlineHighlight(boolean)](#setOutlineHighlight(boolean))
   360. [setOutlineHighlight(int, boolean)](#setOutlineHighlight(int,boolean))
   361. [isOutlineHlAttached()](#isOutlineHlAttached())
   362. [isOutlineHlAttached(int)](#isOutlineHlAttached(int))
   363. [setOutlineHlAttached(boolean)](#setOutlineHlAttached(boolean))
   364. [setOutlineHlAttached(int, boolean)](#setOutlineHlAttached(int,boolean))
   365. [isOutlineHlBlink()](#isOutlineHlBlink())
   366. [isOutlineHlBlink(int)](#isOutlineHlBlink(int))
   367. [setOutlineHlBlink(boolean)](#setOutlineHlBlink(boolean))
   368. [setOutlineHlBlink(int, boolean)](#setOutlineHlBlink(int,boolean))
   369. [unsetOutlineHighlight()](#unsetOutlineHighlight())
   370. [getOutlineThickness()](#getOutlineThickness())
   371. [setOutlineThickness(float)](#setOutlineThickness(float))
   372. [addItemsFromProperties()](#addItemsFromProperties())
   373. [isDestroyed()](#isDestroyed())
   374. [getStressModFromThumping()](#getStressModFromThumping())
   375. [Thump(IsoMovingObject, int)](#Thump(zombie.iso.IsoMovingObject,int))
   376. [setMovedThumpable(boolean)](#setMovedThumpable(boolean))
   377. [isMovedThumpable()](#isMovedThumpable())
   378. [WeaponHit(IsoGameCharacter, HandWeapon)](#WeaponHit(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   379. [getThumpableFor(IsoGameCharacter)](#getThumpableFor(zombie.characters.IsoGameCharacter))
   380. [getThumpableFor(IsoGameCharacter, HandWeapon)](#getThumpableFor(zombie.characters.IsoGameCharacter,zombie.inventory.types.HandWeapon))
   381. [isExistInTheWorld()](#isExistInTheWorld())
   382. [getThumpCondition()](#getThumpCondition())
   383. [toString()](#toString())
   384. [getGameEntityType()](#getGameEntityType())
   385. [getEntityNetID()](#getEntityNetID())
   386. [isEntityValid()](#isEntityValid())
   387. [getMasterObject()](#getMasterObject())
   388. [isTent()](#isTent())
   389. [getFacing()](#getFacing())
   390. [getTileName()](#getTileName())
   391. [spawnItemToObjectSurface(String)](#spawnItemToObjectSurface(java.lang.String))
   392. [spawnItemToObjectSurface(String, boolean)](#spawnItemToObjectSurface(java.lang.String,boolean))
   393. [spawnItemToObjectSurface(String, boolean, boolean)](#spawnItemToObjectSurface(java.lang.String,boolean,boolean))
   394. [addItemToObjectSurface(String)](#addItemToObjectSurface(java.lang.String))
   395. [addItemToObjectSurface(String, boolean)](#addItemToObjectSurface(java.lang.String,boolean))
   396. [addItemToObjectSurface(String, boolean, boolean)](#addItemToObjectSurface(java.lang.String,boolean,boolean))
   397. [getRenderInfo(int)](#getRenderInfo(int))
   398. [invalidateRenderChunkLevel(long)](#invalidateRenderChunkLevel(long))
   399. [invalidateVispolyChunkLevel()](#invalidateVispolyChunkLevel())
   400. [hasAnimatedAttachments()](#hasAnimatedAttachments())
   401. [renderAnimatedAttachments(float, float, float, ColorInfo)](#renderAnimatedAttachments(float,float,float,zombie.core.textures.ColorInfo))
   402. [getClockScript()](#getClockScript())
   403. [checkClockTexture()](#checkClockTexture())
   404. [hasAnimatedClockHands()](#hasAnimatedClockHands())
   405. [renderClockHands(float, float, float, ColorInfo)](#renderClockHands(float,float,float,zombie.core.textures.ColorInfo))
   406. [renderClockHand(float, float, float, ColorInfo, ClockScript, ClockScript.HandScript, float, float, float, boolean)](#renderClockHand(float,float,float,zombie.core.textures.ColorInfo,zombie.scripting.objects.ClockScript,zombie.scripting.objects.ClockScript.HandScript,float,float,float,boolean))
   407. [getRenderSquare()](#getRenderSquare())
   408. [setSpriteModelName(String)](#setSpriteModelName(java.lang.String))
   409. [getSpriteModel()](#getSpriteModel())
   410. [renderModel(float, float, float, ColorInfo)](#renderModel(float,float,float,zombie.core.textures.ColorInfo))
   411. [isAnimating()](#isAnimating())
   412. [setAnimating(boolean)](#setAnimating(boolean))
   413. [onAnimationFinished()](#onAnimationFinished())
   414. [updateRenderInfoForObjectPicker(float, float, float, ColorInfo)](#updateRenderInfoForObjectPicker(float,float,float,zombie.core.textures.ColorInfo))
   415. [isGrave()](#isGrave())
   416. [getOnOverlay()](#getOnOverlay())
   417. [setOnOverlay(IsoSpriteInstance)](#setOnOverlay(zombie.iso.sprite.IsoSpriteInstance))
   418. [clearOnOverlay()](#clearOnOverlay())
   419. [shouldShowOnOverlay()](#shouldShowOnOverlay())
   420. [getLightSource()](#getLightSource())
   421. [setLightSource(IsoLightSource)](#setLightSource(zombie.iso.IsoLightSource))
   422. [shouldLightSourceBeActive()](#shouldLightSourceBeActive())
   423. [addLightSourceToWorld()](#addLightSourceToWorld())
   424. [removeLightSourceFromWorld()](#removeLightSourceFromWorld())
   425. [checkLightSourceActive()](#checkLightSourceActive())
   426. [isGenericCraftingSurface()](#isGenericCraftingSurface())
   427. [isBush()](#isBush())
   428. [isGrass()](#isGrass())
   429. [isGrassLike()](#isGrassLike())
   430. [isOres()](#isOres())
   431. [isFascia()](#isFascia())
   432. [getFasciaAttachedSquare()](#getFasciaAttachedSquare())
   433. [setExplored(boolean)](#setExplored(boolean))
   434. [flagForHotSave()](#flagForHotSave())
   435. [hasGridPower()](#hasGridPower())
   436. [isObjectNoContainerOrEmpty()](#isObjectNoContainerOrEmpty())
   437. [dumpContentsInSquare()](#dumpContentsInSquare())
   438. [isPropaneBBQ()](#isPropaneBBQ())
   439. [hasPropaneTank()](#hasPropaneTank())
   440. [isFireInteractionObject()](#isFireInteractionObject())
   441. [setLit(boolean)](#setLit(boolean))
   442. [isLit()](#isLit())
   443. [turnOn()](#turnOn())
   444. [checkObjectPowered()](#checkObjectPowered())
   445. [isStump()](#isStump())
   446. [isOre()](#isOre())
   447. [hasAdjacentCanStandSquare()](#hasAdjacentCanStandSquare())
   448. [isWindow()](#isWindow())
   449. [isNorthBlocked()](#isNorthBlocked())
   450. [isUseSnowSprite()](#isUseSnowSprite())
   451. [handleBurning()](#handleBurning())
   452. [isFurnitureOccupied(IsoGameCharacter)](#isFurnitureOccupied(zombie.characters.IsoGameCharacter))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoObject
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

zombie.iso.IsoObject

All Implemented Interfaces:
:   `Serializable, zombie.characters.ecs.ECSEntity, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable`

Direct Known Subclasses:
:   `IsoAnimalTrack, IsoBarbecue, IsoBarricade, IsoBrokenGlass, IsoButcherHook, IsoCarBatteryCharger, IsoClothingDryer, IsoClothingWasher, IsoCombinationWasherDryer, IsoCompost, IsoCurtain, IsoDoor, IsoFeedingTrough, IsoFire, IsoFireplace, IsoGenerator, IsoHutch, IsoJukebox, IsoLightSwitch, IsoMannequin, IsoMovingObject, IsoStackedWasherDryer, IsoStove, IsoThumpable, IsoTrap, IsoTree, IsoWaveSignal, IsoWindow, IsoWindowFrame, IsoWorldInventoryObject`

---

public class IsoObject
extends [GameEntity](../entity/GameEntity.html "class in zombie.entity")
implements [Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"), [ILuaIsoObject](ILuaIsoObject.html "interface in zombie.iso"), zombie.iso.objects.interfaces.Thumpable, zombie.iso.IsoRenderable, zombie.characters.ecs.ECSEntity

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.iso.IsoObject)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `IsoObject.IsoObjectFactory`

  `static class`

  `IsoObject.OutlineShader`

  `static enum`

  `IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float[]`

  `alpha`

  `boolean`

  `alphaForced`

  `protected boolean`

  `animating`

  `ArrayList<IsoSpriteInstance>`

  `attachedAnimSprite`

  `static float`

  `bmod`

  `private static final Map<Byte, IsoObject.IsoObjectFactory>`

  `byteToObjectMap`

  `protected ArrayList<IsoObject>`

  `children`

  `private zombie.scripting.objects.ClockScript`

  `clockScript`

  `private IsoSprite`

  `clockScriptInit`

  `private static final ColorInfo`

  `colFxMask`

  `ItemContainer`

  `container`

  `private ColorInfo`

  `customColor`

  `short`

  `damage`

  `private IsoDirections`

  `dir`

  `boolean`

  `doNotSync`

  `private boolean`

  `doRender`

  `private final HashMap<Class<? extends ECSComponent>, ECSComponent>`

  `ecsComponentMap`

  `BaseSoundEmitter`

  `emitter`

  `protected IsoObject`

  `externalWaterSource`

  `private static IsoObject.IsoObjectFactory`

  `factoryIsoObject`

  `private static IsoObject.IsoObjectFactory`

  `factoryVehicle`

  `static final ColorInfo`

  `fireColor`

  `static float`

  `gmod`

  `private static final Map<Integer, IsoObject.IsoObjectFactory>`

  `hashCodeToObjectMap`

  `private boolean`

  `hasPower`

  `private long`

  `hasPowerTick`

  `private ColorInfo[]`

  `highlightColor`

  `private long`

  `isoEntityNetId`

  `protected byte`

  `isOutlineHighlight`

  `protected byte`

  `isOutlineHlAttached`

  `protected byte`

  `isOutlineHlBlink`

  `private boolean`

  `isSceneCulled`

  `int`

  `keyId`

  `private int`

  `lastObjectIndex`

  `static IsoObject`

  `lastRendered`

  `static IsoObject`

  `lastRenderedRendered`

  `private IsoLightSource`

  `lightSource`

  `static boolean`

  `lowLightingQualityHack`

  `static final int`

  `MAX_WALL_SPLATS`

  `protected boolean`

  `movedThumpable`

  `String`

  `name`

  `private static final Map<String, IsoObject.IsoObjectFactory>`

  `nameToObjectMap`

  `boolean`

  `neverDoneAlpha`

  `boolean`

  `noPicking`

  `private static final Set<IsoFlagType>`

  `NORTH_FLAGS`

  `protected ObjectRenderEffects`

  `objectRenderEffects`

  `float`

  `offsetX`

  `float`

  `offsetY`

  `private IsoSpriteInstance`

  `onOverlay`

  `protected int[]`

  `outlineHighlightCol`

  `boolean`

  `outlineOnMouseover`

  `private float`

  `outlineThickness`

  `IsoSprite`

  `overlaySprite`

  `ColorInfo`

  `overlaySpriteColor`

  `float`

  `partialThumpDmg`

  `byte`

  `ppfBlink`

  `byte`

  `ppfHighlighted`

  `byte`

  `ppfHighlightRenderOnce`

  `private boolean`

  `removeFromWorldToMeta`

  `float`

  `renderDepthAdjust`

  `protected zombie.iso.fboRenderChunk.ObjectRenderInfo[]`

  `renderInfo`

  `IsoGridSquare`

  `renderSquareOverride`

  `IsoGridSquare`

  `renderSquareOverride2`

  `private float`

  `renderYOffset`

  `IsoObject`

  `rerouteCollide`

  `IsoObject`

  `rerouteMask`

  `static float`

  `rmod`

  `boolean`

  `satChair`

  `private ArrayList<ItemContainer>`

  `secondaryContainers`

  `boolean`

  `sheetRope`

  `float`

  `sheetRopeHealth`

  `private boolean`

  `specialTooltip`

  `IsoSprite`

  `sprite`

  `protected SpriteModel`

  `spriteModel`

  `protected IsoSprite`

  `spriteModelInit`

  `protected String`

  `spriteModelName`

  `String`

  `spriteName`

  `IsoGridSquare`

  `square`

  `private static final ColorInfo`

  `stCol`

  `private static final ColorInfo`

  `stCol2`

  `float`

  `sx`

  `float`

  `sy`

  `se.krka.kahlua.vm.KahluaTable`

  `table`

  `protected float[]`

  `targetAlpha`

  `static final float`

  `THUMP_STRESS_DEFAULT`

  `static final float`

  `THUMP_STRESS_FENCES`

  `static final float`

  `THUMP_STRESS_THUMPABLE`

  `static final float`

  `THUMP_STRESS_TRANSPARENT_FENCES`

  `private String`

  `tile`

  `float`

  `tintb`

  `float`

  `tintg`

  `float`

  `tintr`

  `protected boolean`

  `usesExternalWaterSource`

  `ArrayList<zombie.iso.IsoWallBloodSplat>`

  `wallBloodSplats`

  `protected ObjectRenderEffects`

  `windRenderEffects`

  ### Fields inherited from class [GameEntity](../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoObject()`

  `IsoObject(IsoCell cell)`

  `IsoObject(IsoCell cell,
  IsoGridSquare square,
  String gid)`

  `IsoObject(IsoCell cell,
  IsoGridSquare square,
  IsoSprite spr)`

  `IsoObject(IsoGridSquare square,
  String tile)`

  `IsoObject(IsoGridSquare square,
  String tile,
  boolean bShareTilesWithMap)`

  `IsoObject(IsoGridSquare square,
  String tile,
  String name)`

  `IsoObject(IsoGridSquare square,
  String tile,
  String name,
  boolean bShareTilesWithMap)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addAttachedAnimSprite(IsoSprite sprite)`

  `void`

  `addAttachedAnimSpriteByName(String spriteName)`

  `void`

  `addAttachedAnimSpriteInstance(IsoSpriteInstance inst)`

  `void`

  `addChild(IsoObject child)`

  `void`

  `addFluid(FluidType fluidType,
  float amount)`

  `private static IsoObject.IsoObjectFactory`

  `addIsoObjectFactory(IsoObject.IsoObjectFactory f)`

  `protected void`

  `addItemsFromProperties()`

  `InventoryItem`

  `addItemToObjectSurface(String item)`

  `InventoryItem`

  `addItemToObjectSurface(String item,
  boolean randomRotation)`

  `InventoryItem`

  `addItemToObjectSurface(String item,
  boolean randomRotation,
  boolean spawnChecks)`

  `protected void`

  `addLightSourceToWorld()`

  `protected void`

  `addObjectAmbientEmitter(zombie.audio.ObjectAmbientEmitters.PerObjectLogic logic)`

  `void`

  `addSecondaryContainer(ItemContainer container)`

  `boolean`

  `addSheetRope(IsoPlayer player,
  String itemType)`

  `void`

  `addToWorld()`

  `void`

  `afterRotated()`

  `IsoSpriteInstance`

  `AttachAnim(String objectName,
  String animName,
  int numFrames,
  float frameIncrease,
  int offsetX,
  int offsetY,
  boolean looping,
  int finishHoldFrameIndex,
  boolean deleteWhenFinished,
  float zBias,
  ColorInfo tintMod)`

  `IsoSpriteInstance`

  `AttachAnim(String objectName,
  String animName,
  int numFrames,
  float frameIncrease,
  int offsetX,
  int offsetY,
  boolean looping,
  int finishHoldFrameIndex,
  boolean deleteWhenFinished,
  float zBias,
  ColorInfo tintMod,
  boolean randomFrame)`

  `void`

  `AttachExistingAnim(IsoSprite spr,
  int offsetX,
  int offsetY,
  boolean looping,
  int finishHoldFrameIndex,
  boolean deleteWhenFinished,
  float zBias)`

  `void`

  `AttachExistingAnim(IsoSprite spr,
  int offsetX,
  int offsetY,
  boolean looping,
  int finishHoldFrameIndex,
  boolean deleteWhenFinished,
  float zBias,
  ColorInfo tintMod)`

  `void`

  `AttackObject(IsoGameCharacter owner)`

  `boolean`

  `canAddSheetRope()`

  `boolean`

  `canTransferFluidFrom(FluidContainer other)`

  `boolean`

  `canTransferFluidTo(FluidContainer other)`

  `void`

  `checkAmbientSound()`

  `private Texture`

  `checkClockTexture()`

  `private IsoObject`

  `checkExternalFluidSource()`

  `void`

  `checkHaveElectricity()`

  `void`

  `checkLightSourceActive()`

  `protected void`

  `checkMoveWithWind()`

  `protected void`

  `checkMoveWithWind(boolean isTreeLike)`

  `boolean`

  `checkObjectPowered()`

  `void`

  `cleanWallBlood()`

  `void`

  `clearAttachedAnimSprite()`

  `void`

  `clearOnOverlay()`

  `void`

  `Collision(Vector2 collision,
  IsoObject object)`

  `boolean`

  `couldBePoweredByGenerator()`

  `int`

  `countAddSheetRope()`

  `void`

  `createContainersFromSpriteProperties()`

  `void`

  `createFluidContainersFromSpriteProperties()`

  `private FluidContainer`

  `createSampleAndPurifyWater(FluidContainer source,
  float amount)`

  `long`

  `customHashCode()`

  `void`

  `Damage(float amount)`

  `void`

  `debugPrintout()`

  `private void`

  `debugRenderItemHeight(float x,
  float y,
  float z)`

  `private void`

  `debugRenderSurface(float x,
  float y,
  float z)`

  `void`

  `destroyFence(IsoDirections dir)`

  `void`

  `DirtySlice()`

  `void`

  `doFindExternalWaterSource()`

  `void`

  `DoSpecialTooltip(ObjectTooltip tooltipUI,
  IsoGridSquare square)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI)`

  `void`

  `dumpContentsInSquare()`

  `void`

  `emptyFluid()`

  `static Class<?>`

  `factoryClassFromFileInput(IsoCell cell,
  int classID)`

  Deprecated.

  `static IsoObject`

  `factoryFromFileInput(IsoCell cell,
  byte classID)`

  `private static IsoObject`

  `factoryFromFileInput(IsoCell cell,
  DataInputStream input)`

  Deprecated.

  `static IsoObject`

  `factoryFromFileInput(IsoCell cell,
  ByteBuffer b)`

  `static IsoObject`

  `factoryFromFileInput_OLD(IsoCell cell,
  int classID)`

  Deprecated.

  `static byte`

  `factoryGetClassID(String name)`

  `IsoObject`

  `FindExternalWaterSource()`

  `static IsoObject`

  `FindExternalWaterSource(int x,
  int y,
  int z)`

  `static IsoObject`

  `FindExternalWaterSource(IsoGridSquare square)`

  `static IsoObject`

  `FindWaterSourceOnSquare(IsoGridSquare square)`

  `void`

  `flagForHotSave()`

  `float`

  `getAlpha()`

  `float`

  `getAlpha(int playerIndex)`

  `protected float`

  `getAlphaUpdateRateDiv()`

  `protected float`

  `getAlphaUpdateRateMul()`

  `ArrayList<IsoSpriteInstance>`

  `getAttachedAnimSprite()`

  `int`

  `getAttachedAnimSpriteCount()`

  `IsoCell`

  `getCell()`

  `ArrayList<IsoSpriteInstance>`

  `getChildSprites()`

  `IsoChunk`

  `getChunk()`

  `private zombie.scripting.objects.ClockScript`

  `getClockScript()`

  `IsoObject`

  `getClosestSpriteGridObject(float toX,
  float toY)`

  `ItemContainer`

  `getContainer()`

  `ItemContainer`

  `getContainerByEitherType(String type1,
  String type2)`

  `ItemContainer`

  `getContainerByIndex(int index)`

  `ItemContainer`

  `getContainerByType(String type)`

  `ItemContainer`

  `getContainerClickedOn(int screenX,
  int screenY)`

  `int`

  `getContainerCount()`

  `int`

  `getContainerIndex(ItemContainer container)`

  `<T> PZArrayList<ItemContainer>`

  `getContainers(T paramToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, ItemContainer> isValidPredicate,
  PZArrayList<ItemContainer> containerList)`

  `Texture`

  `getCurrentFrameTex()`

  `ColorInfo`

  `getCustomColor()`

  `short`

  `getDamage()`

  `IsoDirections`

  `getDir()`

  `boolean`

  `getDoRender()`

  Is this Renderable visible.

  `HashMap<Class<? extends ECSComponent>, ECSComponent>`

  `getECSComponentMap()`

  `long`

  `getEntityNetID()`

  `IsoDirections`

  `getFacing()`

  `Vector2`

  `getFacingPosition(Vector2 pos)`

  `Vector2`

  `getFacingPositionAlt(Vector2 pos)`

  `static IsoObject.IsoObjectFactory`

  `getFactoryVehicle()`

  `IsoGridSquare`

  `getFasciaAttachedSquare()`

  `float`

  `getFluidAmount()`

  `float`

  `getFluidCapacity()`

  `String`

  `getFluidUiName()`

  `IsoDirections`

  `getForwardIsoDirection()`

  `IsoDirections`

  `getForwardMovementIsoDirection()`

  `GameEntityType`

  `getGameEntityType()`

  `float`

  `getGeneratorPowerConsumption()`

  `ColorInfo`

  `getHighlightColor()`

  `ColorInfo`

  `getHighlightColor(int playerIndex)`

  `private FluidType`

  `getInfiniteWaterType()`

  `boolean`

  `getIsSurfaceNormalOffset()`

  `ItemContainer`

  `getItemContainer()`

  `int`

  `getKeyId()`

  `static IsoObject`

  `getLastRendered()`

  `static IsoObject`

  `getLastRenderedRendered()`

  `IsoLightSource`

  `getLightSource()`

  `float`

  `getMaskClickedY(int x,
  int y,
  boolean flip)`

  `IsoObject`

  `getMasterObject()`

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

  `int`

  `getMovingObjectIndex()`

  `String`

  `getName()`

  `static IsoObject`

  `getNew()`

  `static IsoObject`

  `getNew(IsoGridSquare sq,
  String spriteName,
  String name,
  boolean bShareTilesWithMap)`

  `int`

  `getObjectIndex()`

  `String`

  `getObjectName()`

  `ObjectRenderEffects`

  `getObjectRenderEffects()`

  `ObjectRenderEffects`

  `getObjectRenderEffectsToApply()`

  `float`

  `getOffsetX()`

  `float`

  `getOffsetY()`

  `IsoSpriteInstance`

  `getOnOverlay()`

  `private ColorInfo`

  `getOrCreateHighlightColor(int playerIndex)`

  `final int`

  `getOutlineHighlightCol(int playerIndex)`

  `float`

  `getOutlineThickness()`

  `IsoSprite`

  `getOverlaySprite()`

  `ColorInfo`

  `getOverlaySpriteColor()`

  `int`

  `getPipedFuelAmount()`

  `org.lwjgl.util.vector.Vector3f`

  `getPosition(org.lwjgl.util.vector.Vector3f out)`

  `Vector3`

  `getPosition(Vector3 out)`

  `Fluid`

  `getPrimaryFluid()`

  `PropertyContainer`

  `getProperties()`

  `String`

  `getProperty(String p)`

  `String`

  `getProperty(IsoPropertyType p)`

  `IsoObject`

  `getRenderEffectMaster()`

  `IsoObject`

  `getRenderEffectObjectByIndex(int index)`

  `int`

  `getRenderEffectObjectCount()`

  `zombie.iso.fboRenderChunk.ObjectRenderInfo`

  `getRenderInfo(int playerIndex)`

  `IsoGridSquare`

  `getRenderSquare()`

  `float`

  `getRenderYOffset()`

  `IsoObject`

  `getRerouteCollide()`

  `IsoObject`

  `getRerouteMask()`

  `IsoObject`

  `getRerouteMaskObject()`

  `private float`

  `getReserveWaterAmount()`

  `private float`

  `getReserveWaterMax()`

  `String`

  `getScriptName()`

  `int`

  `getSpecialObjectIndex()`

  `IsoSprite`

  `getSprite()`

  `IsoSpriteGrid`

  `getSpriteGrid()`

  `ArrayList<IsoObject>`

  `getSpriteGridObjects(ArrayList<IsoObject> result)`

  `ArrayList<IsoObject>`

  `getSpriteGridObjects(ArrayList<IsoObject> result,
  boolean bAddSelf)`

  `ArrayList<IsoObject>`

  `getSpriteGridObjectsExcludingSelf(ArrayList<IsoObject> result)`

  `ArrayList<IsoObject>`

  `getSpriteGridObjectsIncludingSelf(ArrayList<IsoObject> result)`

  `SpriteModel`

  `getSpriteModel()`

  `String`

  `getSpriteName()`

  `IsoGridSquare`

  `getSquare()`

  `int`

  `getStaticMovingObjectIndex()`

  `float`

  `getStressModFromThumping()`

  `float`

  `getSurfaceNormalOffset()`

  `float`

  `getSurfaceOffset()`

  `float`

  `getSurfaceOffsetNoTable()`

  `se.krka.kahlua.vm.KahluaTable`

  `getTable()`

  `float`

  `getTargetAlpha()`

  `float`

  `getTargetAlpha(int playerIndex)`

  `String`

  `getTextureName()`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr)`

  `zombie.iso.objects.interfaces.Thumpable`

  `getThumpableFor(IsoGameCharacter chr,
  HandWeapon weapon)`

  `float`

  `getThumpCondition()`

  `String`

  `getTile()`

  `String`

  `getTileName()`

  `IsoObjectType`

  `getType()`

  `boolean`

  `getUsesExternalWaterSource()`

  `float`

  `GetVehicleSlowFactor(BaseVehicle vehicle)`

  `ObjectRenderEffects`

  `getWindRenderEffects()`

  `int`

  `getWorldObjectIndex()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `void`

  `handleBurning()`

  `boolean`

  `hasAdjacentCanStandSquare()`

  `boolean`

  `hasAnimatedAttachments()`

  `private boolean`

  `hasAnimatedClockHands()`

  `boolean`

  `hasAttachedAnimSprites()`

  `boolean`

  `hasExternalWaterSource()`

  `boolean`

  `hasFluid()`

  `boolean`

  `hasGridPower()`

  `boolean`

  `hasModData()`

  `protected boolean`

  `hasObjectAmbientEmitter()`

  `boolean`

  `hasOverlaySprite()`

  `boolean`

  `hasPropaneTank()`

  `boolean`

  `hasProperty(String p)`

  `boolean`

  `hasProperty(IsoPropertyType p)`

  `boolean`

  `hasProperty(IsoFlagType flag)`

  `private boolean`

  `hasReserveWater()`

  `boolean`

  `hasSpriteGrid()`

  `boolean`

  `HasTooltip()`

  `boolean`

  `hasWater()`

  `boolean`

  `haveSheetRope()`

  `boolean`

  `haveSpecialTooltip()`

  `void`

  `Hit(Vector2 collision,
  IsoObject obj,
  float damage)`

  `void`

  `HitByVehicle(BaseVehicle vehicle,
  float amount)`

  `private static void`

  `initFactory()`

  `void`

  `invalidateRenderChunkLevel(long dirtyFlags)`

  `void`

  `invalidateVispolyChunkLevel()`

  `boolean`

  `isAlphaAndTargetZero()`

  `boolean`

  `isAlphaAndTargetZero(int playerIndex)`

  `boolean`

  `isAlphaZero()`

  `boolean`

  `isAlphaZero(int playerIndex)`

  `boolean`

  `isAnimating()`

  `boolean`

  `isAttachedAnimSprite(IsoSprite sprite)`

  `boolean`

  `isAttachedOrOverlaySprite(IsoSprite sprite)`

  `boolean`

  `isBlink()`

  `boolean`

  `isBlink(int playerIndex)`

  `boolean`

  `isBush()`

  `boolean`

  `isCanPath()`

  `boolean`

  `isCharacter()`

  `boolean`

  `isConnectedSpriteGridObject(IsoObject object)`

  `boolean`

  `isDestroyed()`

  `boolean`

  `isEntityValid()`

  `boolean`

  `isExistInTheWorld()`

  `boolean`

  `isFascia()`

  `boolean`

  `isFireInteractionObject()`

  `boolean`

  `isFloor()`

  `boolean`

  `isFluidInputLocked()`

  `boolean`

  `isFurnitureOccupied(IsoGameCharacter localCharacter)`

  `boolean`

  `isGenericCraftingSurface()`

  `boolean`

  `isGrass()`

  `boolean`

  `isGrassLike()`

  `boolean`

  `isGrave()`

  `boolean`

  `isHighlighted()`

  `boolean`

  `isHighlighted(int playerIndex)`

  `boolean`

  `isHighlightRenderOnce()`

  `boolean`

  `isHighlightRenderOnce(int playerIndex)`

  `boolean`

  `isHoppable()`

  `boolean`

  `isItemAllowedInContainer(ItemContainer container,
  InventoryItem item)`

  `boolean`

  `isLit()`

  `boolean`

  `isMaskClicked(int x,
  int y)`

  `boolean`

  `isMaskClicked(int x,
  int y,
  boolean flip)`

  `boolean`

  `isMovedThumpable()`

  `boolean`

  `isNoPicking()`

  `boolean`

  `isNorthBlocked()`

  `boolean`

  `isNorthHoppable()`

  `boolean`

  `isObjectNoContainerOrEmpty()`

  `boolean`

  `isOnScreen()`

  `boolean`

  `isOre()`

  `boolean`

  `isOres()`

  `final boolean`

  `isOutlineHighlight()`

  `final boolean`

  `isOutlineHighlight(int playerIndex)`

  `final boolean`

  `isOutlineHlAttached()`

  `final boolean`

  `isOutlineHlAttached(int playerIndex)`

  `boolean`

  `isOutlineHlBlink()`

  `final boolean`

  `isOutlineHlBlink(int playerIndex)`

  `boolean`

  `isOutlineOnMouseover()`

  `boolean`

  `isPropaneBBQ()`

  `boolean`

  `isRemoveItemAllowedFromContainer(ItemContainer container,
  InventoryItem item)`

  `boolean`

  `isSatChair()`

  `boolean`

  `isSceneCulled()`

  Is this Renderable culled from the scene.

  `boolean`

  `isSpriteInvisible()`

  `boolean`

  `isStairsNorth()`

  `boolean`

  `isStairsObject()`

  `boolean`

  `isStairsWest()`

  `boolean`

  `isStump()`

  `boolean`

  `isTableSurface()`

  `boolean`

  `isTableTopObject()`

  `boolean`

  `isTaintedWater()`

  `boolean`

  `isTallHoppable()`

  `boolean`

  `isTargetAlphaZero(int playerIndex)`

  `boolean`

  `isTent()`

  `private boolean`

  `isUnmovedPipedWaterSource()`

  `protected boolean`

  `isUpdateAlphaDuringRender()`

  `protected boolean`

  `isUpdateAlphaEnabled()`

  `boolean`

  `isUseSnowSprite()`

  `boolean`

  `isWall()`

  `boolean`

  `isWallN()`

  `boolean`

  `isWallSE()`

  `boolean`

  `isWallW()`

  `private boolean`

  `isWaterInfinite()`

  `boolean`

  `isWindow()`

  `boolean`

  `isZombie()`

  `final void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `loadFromRemoteBuffer(zombie.core.network.ByteBufferReader b)`

  `void`

  `loadFromRemoteBuffer(zombie.core.network.ByteBufferReader b,
  boolean addToObjects)`

  `void`

  `loadState(ByteBuffer bb)`

  `FluidContainer`

  `moveFluidToTemporaryContainer(float amount)`

  `void`

  `onAnimationFinished()`

  `boolean`

  `onMouseLeftClick(int x,
  int y)`

  `void`

  `onMouseRightClick(int lx,
  int ly)`

  `void`

  `onMouseRightReleased()`

  `private void`

  `prepareToRender(ColorInfo col)`

  `boolean`

  `propertyEquals(String key,
  String value)`

  `boolean`

  `propertyEqualsIgnoreCase(String key,
  String value)`

  `private FluidContainer`

  `purifyExternalWaterSample(FluidContainer container)`

  `void`

  `removeAllContainers()`

  `void`

  `RemoveAttachedAnim(int index)`

  `void`

  `RemoveAttachedAnims()`

  `void`

  `removeFromSquare()`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `final void`

  `removeFromWorldToMeta()`

  `protected void`

  `removeLightSourceFromWorld()`

  `void`

  `removeRenderEffect(ObjectRenderEffects o)`

  `boolean`

  `removeSheetRope(IsoPlayer player)`

  `void`

  `render(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  Attempt to render this Renderable.

  `void`

  `renderAnimatedAttachments(float x,
  float y,
  float z,
  ColorInfo col)`

  `void`

  `renderAttachedAndOverlaySprites(IsoDirections dir,
  float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `private void`

  `renderAttachedAndOverlaySpritesInternal(IsoDirections dir,
  float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `private void`

  `renderAttachedSprites(IsoDirections dir,
  float x,
  float y,
  float z,
  ColorInfo col,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `private void`

  `renderClockHand(float x,
  float y,
  float z,
  ColorInfo col,
  zombie.scripting.objects.ClockScript clockScript,
  zombie.scripting.objects.ClockScript.HandScript handScript,
  float rx,
  float ry,
  float rz,
  boolean bNorth)`

  `private void`

  `renderClockHands(float x,
  float y,
  float z,
  ColorInfo col)`

  `void`

  `renderFloorTile(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader,
  Consumer<zombie.core.textures.TextureDraw> texdModifier,
  Consumer<zombie.core.textures.TextureDraw> attachedAndOverlayModifier)`

  `void`

  `renderFxMask(float x,
  float y,
  float z,
  boolean bDoAttached)`

  `protected boolean`

  `renderModel(float x,
  float y,
  float z,
  ColorInfo col)`

  `void`

  `renderObjectPicker(float x,
  float y,
  float z,
  ColorInfo lightInfo)`

  `private void`

  `renderOverlaySprites(float x,
  float y,
  float z,
  ColorInfo col,
  zombie.core.opengl.Shader shader,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderWallTile(IsoDirections dir,
  float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoAttached,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderWallTileDepth(IsoDirections dir,
  boolean cutawaySelf,
  boolean cutawayE,
  boolean cutawayS,
  int cutawaySEX,
  float x,
  float y,
  float z,
  ColorInfo col,
  zombie.core.opengl.Shader shader,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `renderWallTileOnly(IsoDirections dir,
  float x,
  float y,
  float z,
  ColorInfo col,
  zombie.core.opengl.Shader shader,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `InventoryItem`

  `replaceItem(InventoryItem item)`

  `void`

  `reset()`

  `void`

  `reuseGridSquare()`

  `final void`

  `save(ByteBuffer output)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl,
  zombie.core.network.ByteBufferWriter bb)`

  `void`

  `saveState(ByteBuffer bb)`

  `void`

  `sendObjectChange(IsoObjectChange change)`

  `void`

  `sendObjectChange(IsoObjectChange change,
  Object... args)`

  `void`

  `sendObjectChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl)`

  `boolean`

  `Serialize()`

  `void`

  `setAlpha(float alpha)`

  `void`

  `setAlpha(int playerIndex,
  float alpha)`

  `void`

  `setAlphaAndTarget(float alpha)`

  `void`

  `setAlphaAndTarget(int playerIndex,
  float alpha)`

  `void`

  `setAlphaToTarget(int playerIndex)`

  `void`

  `setAnimating(boolean bAnimating)`

  `void`

  `setAttachedAnimSprite(ArrayList<IsoSpriteInstance> attachedAnimSprite)`

  `void`

  `setBlink(boolean blink)`

  `void`

  `setBlink(int playerIndex,
  boolean blink)`

  `void`

  `setChildSprites(ArrayList<IsoSpriteInstance> attachedAnimSprite)`

  `void`

  `setContainer(ItemContainer container)`

  `void`

  `setCustomColor(float r,
  float g,
  float b,
  float a)`

  `void`

  `setCustomColor(ColorInfo col)`

  `void`

  `setDamage(short damage)`

  `void`

  `setDir(int dir)`

  `void`

  `setDoRender(boolean doRender)`

  Set this Renderable's visible flag.

  `void`

  `setExplored(boolean isExplored)`

  `void`

  `setForwardIsoDirection(int dir)`

  `void`

  `setForwardIsoDirection(IsoDirections dir)`

  `void`

  `setHighlightColor(float r,
  float g,
  float b,
  float a)`

  `void`

  `setHighlightColor(int playerIndex,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `setHighlightColor(int playerIndex,
  ColorInfo highlightColor)`

  `void`

  `setHighlightColor(ColorInfo highlightColor)`

  `void`

  `setHighlighted(boolean highlight)`

  `void`

  `setHighlighted(boolean highlight,
  boolean renderOnce)`

  `void`

  `setHighlighted(int playerIndex,
  boolean highlight)`

  `void`

  `setHighlighted(int playerIndex,
  boolean highlight,
  boolean renderOnce)`

  `void`

  `setHighlightRenderOnce(boolean highlight)`

  `void`

  `setHighlightRenderOnce(int playerIndex,
  boolean highlight)`

  `void`

  `setKeyId(int keyId)`

  `static void`

  `setLastRendered(IsoObject aLastRendered)`

  `static void`

  `setLastRenderedRendered(IsoObject aLastRenderedRendered)`

  `void`

  `setLightSource(IsoLightSource lightSource)`

  `void`

  `setLit(boolean lit)`

  `void`

  `setModData(se.krka.kahlua.vm.KahluaTable newDatas)`

  `void`

  `setMovedThumpable(boolean movedThumpable)`

  `void`

  `setName(String name)`

  `void`

  `SetName(String name)`

  `void`

  `setNoPicking(boolean noPicking)`

  `void`

  `setOffsetX(float offsetX)`

  `void`

  `setOffsetY(float offsetY)`

  `void`

  `setOnOverlay(IsoSpriteInstance inst)`

  `final void`

  `setOutlineHighlight(boolean isOutlineHighlight)`

  `final void`

  `setOutlineHighlight(int playerIndex,
  boolean isOutlineHighlight)`

  `final void`

  `setOutlineHighlightCol(float r,
  float g,
  float b,
  float a)`

  `final void`

  `setOutlineHighlightCol(int playerIndex,
  float r,
  float g,
  float b,
  float a)`

  `final void`

  `setOutlineHighlightCol(int playerIndex,
  ColorInfo outlineHighlightCol)`

  `final void`

  `setOutlineHighlightCol(ColorInfo outlineHighlightCol)`

  `void`

  `setOutlineHlAttached(boolean isOutlineHlAttached)`

  `final void`

  `setOutlineHlAttached(int playerIndex,
  boolean isOutlineHlAttached)`

  `void`

  `setOutlineHlBlink(boolean isOutlineHlBlink)`

  `final void`

  `setOutlineHlBlink(int playerIndex,
  boolean isOutlineHlBlink)`

  `void`

  `setOutlineOnMouseover(boolean outlineOnMouseover)`

  `void`

  `setOutlineThickness(float outlineThickness)`

  `void`

  `setOverlaySprite(String spriteName)`

  `void`

  `setOverlaySprite(String spriteName,
  boolean bTransmit)`

  `void`

  `setOverlaySprite(String spriteName,
  float r,
  float g,
  float b,
  float a)`

  `boolean`

  `setOverlaySprite(String spriteName,
  float r,
  float g,
  float b,
  float a,
  boolean bTransmit)`

  `void`

  `setOverlaySpriteColor(float r,
  float g,
  float b,
  float a)`

  `void`

  `setPipedFuelAmount(int units)`

  `void`

  `setRenderEffect(zombie.iso.objects.RenderEffectType type)`

  `void`

  `setRenderEffect(zombie.iso.objects.RenderEffectType type,
  boolean reuseEqualType)`

  `void`

  `setRenderYOffset(float f)`

  `void`

  `setRerouteCollide(IsoObject rerouteCollide)`

  `void`

  `setRerouteMask(IsoObject rerouteMask)`

  `private void`

  `setReserveWaterAmount(float amount)`

  `void`

  `setSatChair(boolean satChair)`

  `void`

  `setSceneCulled(boolean isCulled)`

  Is this Renderable culled from the scene.

  `void`

  `setSpecialTooltip(boolean specialTooltip)`

  `void`

  `setSprite(String name)`

  `void`

  `setSprite(IsoSprite sprite)`

  `void`

  `setSpriteFromName(String name)`

  `void`

  `setSpriteModelName(String spriteModelName)`

  `void`

  `setSquare(IsoGridSquare square)`

  `void`

  `setTable(se.krka.kahlua.vm.KahluaTable table)`

  `void`

  `setTargetAlpha(float targetAlpha)`

  `void`

  `setTargetAlpha(int playerIndex,
  float targetAlpha)`

  `void`

  `setTile(String tile)`

  `void`

  `setType(IsoObjectType type)`

  `void`

  `setUsesExternalWaterSource(boolean b)`

  `private boolean`

  `shouldDrawMainSprite()`

  `protected boolean`

  `shouldLightSourceBeActive()`

  `boolean`

  `shouldShowOnOverlay()`

  `void`

  `softReset()`

  `InventoryItem`

  `spawnItemToObjectSurface(String item)`

  `InventoryItem`

  `spawnItemToObjectSurface(String item,
  boolean randomRotation)`

  `InventoryItem`

  `spawnItemToObjectSurface(String item,
  boolean randomRotation,
  boolean checkForAdjacentCanStandSquare)`

  `void`

  `sync()`

  `void`

  `sync(int i)`

  `void`

  `syncFluidContainerReceive(zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncFluidContainerSend(zombie.core.network.ByteBufferWriter bb)`

  `void`

  `syncIsoObject(boolean bRemote,
  byte val,
  zombie.core.raknet.UdpConnection source,
  zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)`

  `void`

  `syncIsoObjectSend(zombie.core.network.ByteBufferWriter bb)`

  `boolean`

  `TestCollide(IsoMovingObject obj,
  IsoGridSquare from,
  IsoGridSquare to)`

  `boolean`

  `TestPathfindCollide(IsoMovingObject obj,
  IsoGridSquare from,
  IsoGridSquare to)`

  `IsoObject.VisionResult`

  `TestVision(IsoGridSquare from,
  IsoGridSquare to)`

  `void`

  `Thump(IsoMovingObject thumper,
  int thumpEventCount)`

  `String`

  `toString()`

  `float`

  `transferFluidFrom(FluidContainer source,
  float amount)`

  `float`

  `transferFluidTo(FluidContainer target,
  float amount)`

  `void`

  `transmitCompleteItemToClients()`

  `void`

  `transmitCustomColorToClients()`

  `void`

  `transmitModData()`

  `void`

  `transmitUpdatedSprite()`

  `void`

  `transmitUpdatedSpriteToClients()`

  `void`

  `transmitUpdatedSpriteToClients(zombie.core.raknet.UdpConnection connection)`

  `void`

  `transmitUpdatedSpriteToServer()`

  Deprecated.

  `void`

  `turnOn()`

  `void`

  `UnCollision(IsoObject object)`

  `void`

  `unsetOutlineHighlight()`

  `void`

  `update()`

  `protected final void`

  `updateAlpha()`

  `protected final void`

  `updateAlpha(int playerIndex)`

  `protected void`

  `updateAlpha(int playerIndex,
  float mul,
  float div)`

  `protected void`

  `updateRenderInfoForObjectPicker(float x,
  float y,
  float z,
  ColorInfo info)`

  `float`

  `useFluid(float amount)`

  `void`

  `useItemOn(InventoryItem item)`

  Deprecated.

  `void`

  `WeaponHit(IsoGameCharacter chr,
  HandWeapon weapon)`

  `void`

  `writeToRemoteBuffer(zombie.core.network.ByteBufferWriter b)`

  ### Methods inherited from class [GameEntity](../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, registerECSComponents, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface [ILuaIsoObject](ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

* Field Details
  -------------

  + ### MAX\_WALL\_SPLATS

    public static final int MAX\_WALL\_SPLATS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoObject.MAX_WALL_SPLATS)
  + ### THUMP\_STRESS\_THUMPABLE

    public static final float THUMP\_STRESS\_THUMPABLE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoObject.THUMP_STRESS_THUMPABLE)
  + ### THUMP\_STRESS\_DEFAULT

    public static final float THUMP\_STRESS\_DEFAULT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoObject.THUMP_STRESS_DEFAULT)
  + ### THUMP\_STRESS\_FENCES

    public static final float THUMP\_STRESS\_FENCES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoObject.THUMP_STRESS_FENCES)
  + ### THUMP\_STRESS\_TRANSPARENT\_FENCES

    public static final float THUMP\_STRESS\_TRANSPARENT\_FENCES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoObject.THUMP_STRESS_TRANSPARENT_FENCES)
  + ### lastRendered

    public static [IsoObject](IsoObject.html "class in zombie.iso") lastRendered
  + ### lastRenderedRendered

    public static [IsoObject](IsoObject.html "class in zombie.iso") lastRenderedRendered
  + ### stCol

    private static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") stCol
  + ### rmod

    public static float rmod
  + ### gmod

    public static float gmod
  + ### bmod

    public static float bmod
  + ### doRender

    private boolean doRender
  + ### isSceneCulled

    private boolean isSceneCulled
  + ### lowLightingQualityHack

    public static boolean lowLightingQualityHack
  + ### stCol2

    private static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") stCol2
  + ### colFxMask

    private static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") colFxMask
  + ### fireColor

    public static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") fireColor
  + ### ppfHighlighted

    public byte ppfHighlighted
  + ### ppfHighlightRenderOnce

    public byte ppfHighlightRenderOnce
  + ### ppfBlink

    public byte ppfBlink
  + ### satChair

    public boolean satChair
  + ### keyId

    public int keyId
  + ### emitter

    public [BaseSoundEmitter](../audio/BaseSoundEmitter.html "class in zombie.audio") emitter
  + ### sheetRopeHealth

    public float sheetRopeHealth
  + ### sheetRope

    public boolean sheetRope
  + ### neverDoneAlpha

    public boolean neverDoneAlpha
  + ### alphaForced

    public boolean alphaForced
  + ### attachedAnimSprite

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite")> attachedAnimSprite
  + ### wallBloodSplats

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.IsoWallBloodSplat> wallBloodSplats
  + ### container

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container
  + ### dir

    private [IsoDirections](IsoDirections.html "enum class in zombie.iso") dir
  + ### damage

    public short damage
  + ### partialThumpDmg

    public float partialThumpDmg
  + ### noPicking

    public boolean noPicking
  + ### offsetX

    public float offsetX
  + ### offsetY

    public float offsetY
  + ### outlineOnMouseover

    public boolean outlineOnMouseover
  + ### rerouteMask

    public [IsoObject](IsoObject.html "class in zombie.iso") rerouteMask
  + ### sprite

    public [IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") sprite
  + ### overlaySprite

    public [IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") overlaySprite
  + ### overlaySpriteColor

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") overlaySpriteColor
  + ### square

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square
  + ### alpha

    public float[] alpha
  + ### targetAlpha

    protected float[] targetAlpha
  + ### renderInfo

    protected zombie.iso.fboRenderChunk.ObjectRenderInfo[] renderInfo
  + ### rerouteCollide

    public [IsoObject](IsoObject.html "class in zombie.iso") rerouteCollide
  + ### table

    public se.krka.kahlua.vm.KahluaTable table
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### tintr

    public float tintr
  + ### tintg

    public float tintg
  + ### tintb

    public float tintb
  + ### spriteName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName
  + ### sx

    public float sx
  + ### sy

    public float sy
  + ### doNotSync

    public boolean doNotSync
  + ### windRenderEffects

    protected [ObjectRenderEffects](objects/ObjectRenderEffects.html "class in zombie.iso.objects") windRenderEffects
  + ### objectRenderEffects

    protected [ObjectRenderEffects](objects/ObjectRenderEffects.html "class in zombie.iso.objects") objectRenderEffects
  + ### externalWaterSource

    protected [IsoObject](IsoObject.html "class in zombie.iso") externalWaterSource
  + ### usesExternalWaterSource

    protected boolean usesExternalWaterSource
  + ### children

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> children
  + ### tile

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile
  + ### specialTooltip

    private boolean specialTooltip
  + ### highlightColor

    private [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures")[] highlightColor
  + ### secondaryContainers

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> secondaryContainers
  + ### customColor

    private [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") customColor
  + ### renderYOffset

    private float renderYOffset
  + ### isOutlineHighlight

    protected byte isOutlineHighlight
  + ### isOutlineHlAttached

    protected byte isOutlineHlAttached
  + ### isOutlineHlBlink

    protected byte isOutlineHlBlink
  + ### outlineHighlightCol

    protected int[] outlineHighlightCol
  + ### outlineThickness

    private float outlineThickness
  + ### movedThumpable

    protected boolean movedThumpable
  + ### spriteModelName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteModelName
  + ### spriteModel

    protected [SpriteModel](SpriteModel.html "class in zombie.iso") spriteModel
  + ### spriteModelInit

    protected [IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") spriteModelInit
  + ### animating

    protected boolean animating
  + ### lightSource

    private [IsoLightSource](IsoLightSource.html "class in zombie.iso") lightSource
  + ### onOverlay

    private [IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") onOverlay
  + ### renderSquareOverride

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") renderSquareOverride
  + ### renderSquareOverride2

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") renderSquareOverride2
  + ### renderDepthAdjust

    public float renderDepthAdjust
  + ### clockScript

    private zombie.scripting.objects.ClockScript clockScript
  + ### clockScriptInit

    private [IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") clockScriptInit
  + ### hasPowerTick

    private long hasPowerTick
  + ### hasPower

    private boolean hasPower
  + ### byteToObjectMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Byte](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Byte.html "class or interface in java.lang"), [IsoObject.IsoObjectFactory](IsoObject.IsoObjectFactory.html "class in zombie.iso")> byteToObjectMap
  + ### hashCodeToObjectMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [IsoObject.IsoObjectFactory](IsoObject.IsoObjectFactory.html "class in zombie.iso")> hashCodeToObjectMap
  + ### nameToObjectMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [IsoObject.IsoObjectFactory](IsoObject.IsoObjectFactory.html "class in zombie.iso")> nameToObjectMap
  + ### removeFromWorldToMeta

    private boolean removeFromWorldToMeta
  + ### isoEntityNetId

    private long isoEntityNetId
  + ### lastObjectIndex

    private int lastObjectIndex
  + ### ecsComponentMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [ECSComponent](../characters/ecs/ECSComponent.html "class in zombie.characters.ecs")>, [ECSComponent](../characters/ecs/ECSComponent.html "class in zombie.characters.ecs")> ecsComponentMap
  + ### factoryIsoObject

    private static [IsoObject.IsoObjectFactory](IsoObject.IsoObjectFactory.html "class in zombie.iso") factoryIsoObject
  + ### factoryVehicle

    private static [IsoObject.IsoObjectFactory](IsoObject.IsoObjectFactory.html "class in zombie.iso") factoryVehicle
  + ### NORTH\_FLAGS

    private static final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails")> NORTH\_FLAGS
* Constructor Details
  -------------------

  + ### IsoObject

    public IsoObject([IsoCell](IsoCell.html "class in zombie.iso") cell)
  + ### IsoObject

    public IsoObject()
  + ### IsoObject

    public IsoObject([IsoCell](IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") spr)
  + ### IsoObject

    public IsoObject([IsoCell](IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gid)
  + ### IsoObject

    public IsoObject([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### IsoObject

    public IsoObject([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean bShareTilesWithMap)
  + ### IsoObject

    public IsoObject([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile,
    boolean bShareTilesWithMap)
  + ### IsoObject

    public IsoObject([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile)
* Method Details
  --------------

  + ### isFloor

    public boolean isFloor()
  + ### getNew

    public static [IsoObject](IsoObject.html "class in zombie.iso") getNew([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") sq,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean bShareTilesWithMap)
  + ### getLastRendered

    public static [IsoObject](IsoObject.html "class in zombie.iso") getLastRendered()
  + ### setLastRendered

    public static void setLastRendered([IsoObject](IsoObject.html "class in zombie.iso") aLastRendered)
  + ### getLastRenderedRendered

    public static [IsoObject](IsoObject.html "class in zombie.iso") getLastRenderedRendered()
  + ### setLastRenderedRendered

    public static void setLastRenderedRendered([IsoObject](IsoObject.html "class in zombie.iso") aLastRenderedRendered)
  + ### getNew

    public static [IsoObject](IsoObject.html "class in zombie.iso") getNew()
  + ### getECSComponentMap

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [ECSComponent](../characters/ecs/ECSComponent.html "class in zombie.characters.ecs")>, [ECSComponent](../characters/ecs/ECSComponent.html "class in zombie.characters.ecs")> getECSComponentMap()

    Specified by:
    :   `getECSComponentMap` in interface `zombie.characters.ecs.ECSEntity`
  + ### addIsoObjectFactory

    private static [IsoObject.IsoObjectFactory](IsoObject.IsoObjectFactory.html "class in zombie.iso") addIsoObjectFactory([IsoObject.IsoObjectFactory](IsoObject.IsoObjectFactory.html "class in zombie.iso") f)
  + ### getFactoryVehicle

    public static [IsoObject.IsoObjectFactory](IsoObject.IsoObjectFactory.html "class in zombie.iso") getFactoryVehicle()
  + ### initFactory

    private static void initFactory()
  + ### factoryGetClassID

    public static byte factoryGetClassID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### factoryFromFileInput

    public static [IsoObject](IsoObject.html "class in zombie.iso") factoryFromFileInput([IsoCell](IsoCell.html "class in zombie.iso") cell,
    byte classID)
  + ### factoryFromFileInput\_OLD

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static [IsoObject](IsoObject.html "class in zombie.iso") factoryFromFileInput\_OLD([IsoCell](IsoCell.html "class in zombie.iso") cell,
    int classID)

    Deprecated.
  + ### factoryClassFromFileInput

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> factoryClassFromFileInput([IsoCell](IsoCell.html "class in zombie.iso") cell,
    int classID)

    Deprecated.
  + ### factoryFromFileInput

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    private static [IsoObject](IsoObject.html "class in zombie.iso") factoryFromFileInput([IsoCell](IsoCell.html "class in zombie.iso") cell,
    [DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Deprecated.

    Throws:
    :   `IOException`
  + ### factoryFromFileInput

    public static [IsoObject](IsoObject.html "class in zombie.iso") factoryFromFileInput([IsoCell](IsoCell.html "class in zombie.iso") cell,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") b)
  + ### sync

    public void sync()
  + ### sync

    public void sync(int i)
  + ### syncIsoObject

    public void syncIsoObject(boolean bRemote,
    byte val,
    zombie.core.raknet.UdpConnection source,
    zombie.core.network.ByteBufferReader bb)
  + ### syncIsoObjectSend

    public void syncIsoObjectSend(zombie.core.network.ByteBufferWriter bb)
  + ### syncIsoObjectReceive

    public void syncIsoObjectReceive(zombie.core.network.ByteBufferReader bb)
  + ### syncFluidContainerReceive

    public void syncFluidContainerReceive(zombie.core.network.ByteBufferReader bb)
  + ### syncFluidContainerSend

    public void syncFluidContainerSend(zombie.core.network.ByteBufferWriter bb)
  + ### getTextureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextureName()
  + ### Serialize

    public boolean Serialize()
  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()
  + ### setModData

    public void setModData(se.krka.kahlua.vm.KahluaTable newDatas)
  + ### hasModData

    public boolean hasModData()
  + ### getSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getSquare()

    Specified by:
    :   `getSquare` in class `GameEntity`
  + ### setSquare

    public void setSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### getChunk

    public [IsoChunk](IsoChunk.html "class in zombie.iso") getChunk()
  + ### update

    public void update()
  + ### DirtySlice

    public void DirtySlice()
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()
  + ### load

    public final void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public final void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### saveState

    public void saveState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadState

    public void loadState([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### softReset

    public void softReset()
  + ### AttackObject

    public void AttackObject([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") owner)
  + ### onMouseRightClick

    public void onMouseRightClick(int lx,
    int ly)
  + ### onMouseRightReleased

    public void onMouseRightReleased()
  + ### Hit

    public void Hit([Vector2](Vector2.html "class in zombie.iso") collision,
    [IsoObject](IsoObject.html "class in zombie.iso") obj,
    float damage)
  + ### Damage

    public void Damage(float amount)
  + ### HitByVehicle

    public void HitByVehicle([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    float amount)
  + ### Collision

    public void Collision([Vector2](Vector2.html "class in zombie.iso") collision,
    [IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### UnCollision

    public void UnCollision([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### GetVehicleSlowFactor

    public float GetVehicleSlowFactor([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### getRerouteCollide

    public [IsoObject](IsoObject.html "class in zombie.iso") getRerouteCollide()
  + ### setRerouteCollide

    public void setRerouteCollide([IsoObject](IsoObject.html "class in zombie.iso") rerouteCollide)
  + ### getTable

    public se.krka.kahlua.vm.KahluaTable getTable()
  + ### setTable

    public void setTable(se.krka.kahlua.vm.KahluaTable table)
  + ### setAlpha

    public void setAlpha(float alpha)
  + ### setAlpha

    public void setAlpha(int playerIndex,
    float alpha)
  + ### setAlphaToTarget

    public void setAlphaToTarget(int playerIndex)
  + ### setAlphaAndTarget

    public void setAlphaAndTarget(float alpha)
  + ### setAlphaAndTarget

    public void setAlphaAndTarget(int playerIndex,
    float alpha)
  + ### getAlpha

    public float getAlpha()
  + ### getAlpha

    public float getAlpha(int playerIndex)
  + ### getAttachedAnimSprite

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite")> getAttachedAnimSprite()
  + ### setAttachedAnimSprite

    public void setAttachedAnimSprite([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite")> attachedAnimSprite)
  + ### getAttachedAnimSpriteCount

    public int getAttachedAnimSpriteCount()
  + ### hasAttachedAnimSprites

    public boolean hasAttachedAnimSprites()
  + ### addAttachedAnimSpriteInstance

    public void addAttachedAnimSpriteInstance([IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") inst)
  + ### addAttachedAnimSprite

    public void addAttachedAnimSprite([IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### addAttachedAnimSpriteByName

    public void addAttachedAnimSpriteByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### isAttachedAnimSprite

    public boolean isAttachedAnimSprite([IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### isAttachedOrOverlaySprite

    public boolean isAttachedOrOverlaySprite([IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### getCell

    public [IsoCell](IsoCell.html "class in zombie.iso") getCell()
  + ### getChildSprites

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite")> getChildSprites()
  + ### setChildSprites

    public void setChildSprites([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite")> attachedAnimSprite)
  + ### clearAttachedAnimSprite

    public void clearAttachedAnimSprite()
  + ### getContainer

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") getContainer()
  + ### setContainer

    public void setContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### getContainers

    public <T> [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> getContainers(T paramToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> isValidPredicate,
    [PZArrayList](../util/list/PZArrayList.html "class in zombie.util.list")<[ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory")> containerList)
  + ### getContainerClickedOn

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") getContainerClickedOn(int screenX,
    int screenY)
  + ### getDir

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") getDir()
  + ### setDir

    public void setDir(int dir)
  + ### setForwardIsoDirection

    public void setForwardIsoDirection([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)

    Specified by:
    :   `setForwardIsoDirection` in interface `ILuaIsoObject`
  + ### setForwardIsoDirection

    public void setForwardIsoDirection(int dir)
  + ### getForwardIsoDirection

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") getForwardIsoDirection()
  + ### getForwardMovementIsoDirection

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") getForwardMovementIsoDirection()
  + ### getDamage

    public short getDamage()
  + ### setDamage

    public void setDamage(short damage)
  + ### isNoPicking

    public boolean isNoPicking()
  + ### setNoPicking

    public void setNoPicking(boolean noPicking)
  + ### isOutlineOnMouseover

    public boolean isOutlineOnMouseover()
  + ### setOutlineOnMouseover

    public void setOutlineOnMouseover(boolean outlineOnMouseover)
  + ### getRerouteMask

    public [IsoObject](IsoObject.html "class in zombie.iso") getRerouteMask()
  + ### setRerouteMask

    public void setRerouteMask([IsoObject](IsoObject.html "class in zombie.iso") rerouteMask)
  + ### getSprite

    public [IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") getSprite()
  + ### setSprite

    public void setSprite([IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### setSprite

    public void setSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setSpriteFromName

    public void setSpriteFromName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getSpriteGrid

    public [IsoSpriteGrid](sprite/IsoSpriteGrid.html "class in zombie.iso.sprite") getSpriteGrid()
  + ### hasSpriteGrid

    public boolean hasSpriteGrid()
  + ### getTargetAlpha

    public float getTargetAlpha()
  + ### setTargetAlpha

    public void setTargetAlpha(float targetAlpha)
  + ### setTargetAlpha

    public void setTargetAlpha(int playerIndex,
    float targetAlpha)
  + ### getTargetAlpha

    public float getTargetAlpha(int playerIndex)
  + ### isAlphaAndTargetZero

    public boolean isAlphaAndTargetZero()
  + ### isAlphaAndTargetZero

    public boolean isAlphaAndTargetZero(int playerIndex)
  + ### isAlphaZero

    public boolean isAlphaZero()
  + ### isAlphaZero

    public boolean isAlphaZero(int playerIndex)
  + ### isTargetAlphaZero

    public boolean isTargetAlphaZero(int playerIndex)
  + ### getType

    public [IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") getType()
  + ### setType

    public void setType([IsoObjectType](SpriteDetails/IsoObjectType.html "enum class in zombie.iso.SpriteDetails") type)
  + ### addChild

    public void addChild([IsoObject](IsoObject.html "class in zombie.iso") child)
  + ### debugPrintout

    public void debugPrintout()
  + ### checkMoveWithWind

    protected void checkMoveWithWind()
  + ### checkMoveWithWind

    protected void checkMoveWithWind(boolean isTreeLike)
  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `GameEntity`
  + ### customHashCode

    public long customHashCode()
  + ### SetName

    public void SetName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getSpriteName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSpriteName()
  + ### getTile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTile()
  + ### setTile

    public void setTile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tile)
  + ### isCharacter

    public boolean isCharacter()
  + ### isZombie

    public boolean isZombie()
  + ### getScriptName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getScriptName()
  + ### AttachAnim

    public [IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") AttachAnim([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animName,
    int numFrames,
    float frameIncrease,
    int offsetX,
    int offsetY,
    boolean looping,
    int finishHoldFrameIndex,
    boolean deleteWhenFinished,
    float zBias,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") tintMod)
  + ### AttachAnim

    public [IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") AttachAnim([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animName,
    int numFrames,
    float frameIncrease,
    int offsetX,
    int offsetY,
    boolean looping,
    int finishHoldFrameIndex,
    boolean deleteWhenFinished,
    float zBias,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") tintMod,
    boolean randomFrame)
  + ### AttachExistingAnim

    public void AttachExistingAnim([IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") spr,
    int offsetX,
    int offsetY,
    boolean looping,
    int finishHoldFrameIndex,
    boolean deleteWhenFinished,
    float zBias,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") tintMod)
  + ### AttachExistingAnim

    public void AttachExistingAnim([IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") spr,
    int offsetX,
    int offsetY,
    boolean looping,
    int finishHoldFrameIndex,
    boolean deleteWhenFinished,
    float zBias)
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI)
  + ### DoSpecialTooltip

    public void DoSpecialTooltip([ObjectTooltip](../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### getItemContainer

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") getItemContainer()
  + ### getOffsetX

    public float getOffsetX()
  + ### setOffsetX

    public void setOffsetX(float offsetX)
  + ### getOffsetY

    public float getOffsetY()
  + ### setOffsetY

    public void setOffsetY(float offsetY)
  + ### getRerouteMaskObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getRerouteMaskObject()
  + ### HasTooltip

    public boolean HasTooltip()
  + ### getUsesExternalWaterSource

    public boolean getUsesExternalWaterSource()
  + ### setUsesExternalWaterSource

    public void setUsesExternalWaterSource(boolean b)
  + ### hasExternalWaterSource

    public boolean hasExternalWaterSource()
  + ### doFindExternalWaterSource

    public void doFindExternalWaterSource()
  + ### FindExternalWaterSource

    public [IsoObject](IsoObject.html "class in zombie.iso") FindExternalWaterSource()
  + ### FindExternalWaterSource

    public static [IsoObject](IsoObject.html "class in zombie.iso") FindExternalWaterSource([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### FindExternalWaterSource

    public static [IsoObject](IsoObject.html "class in zombie.iso") FindExternalWaterSource(int x,
    int y,
    int z)
  + ### FindWaterSourceOnSquare

    public static [IsoObject](IsoObject.html "class in zombie.iso") FindWaterSourceOnSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### getPipedFuelAmount

    public int getPipedFuelAmount()
  + ### setPipedFuelAmount

    public void setPipedFuelAmount(int units)
  + ### isWaterInfinite

    private boolean isWaterInfinite()
  + ### getInfiniteWaterType

    private [FluidType](../entity/components/fluids/FluidType.html "enum class in zombie.entity.components.fluids") getInfiniteWaterType()
  + ### isUnmovedPipedWaterSource

    private boolean isUnmovedPipedWaterSource()
  + ### checkExternalFluidSource

    private [IsoObject](IsoObject.html "class in zombie.iso") checkExternalFluidSource()
  + ### getFluidAmount

    public float getFluidAmount()
  + ### emptyFluid

    public void emptyFluid()
  + ### getFluidCapacity

    public float getFluidCapacity()
  + ### useFluid

    public float useFluid(float amount)
  + ### addFluid

    public void addFluid([FluidType](../entity/components/fluids/FluidType.html "enum class in zombie.entity.components.fluids") fluidType,
    float amount)
  + ### canTransferFluidFrom

    public boolean canTransferFluidFrom([FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") other)
  + ### canTransferFluidTo

    public boolean canTransferFluidTo([FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") other)
  + ### createSampleAndPurifyWater

    private [FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") createSampleAndPurifyWater([FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") source,
    float amount)
  + ### transferFluidTo

    public float transferFluidTo([FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") target,
    float amount)
  + ### transferFluidFrom

    public float transferFluidFrom([FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") source,
    float amount)
  + ### moveFluidToTemporaryContainer

    public [FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") moveFluidToTemporaryContainer(float amount)
  + ### purifyExternalWaterSample

    private [FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") purifyExternalWaterSample([FluidContainer](../entity/components/fluids/FluidContainer.html "class in zombie.entity.components.fluids") container)
  + ### getPrimaryFluid

    public [Fluid](../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids") getPrimaryFluid()
  + ### getFluidUiName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFluidUiName()
  + ### hasFluid

    public boolean hasFluid()
  + ### hasWater

    public boolean hasWater()
  + ### isFluidInputLocked

    public boolean isFluidInputLocked()
  + ### isTaintedWater

    public boolean isTaintedWater()
  + ### hasReserveWater

    private boolean hasReserveWater()
  + ### getReserveWaterAmount

    private float getReserveWaterAmount()
  + ### getReserveWaterMax

    private float getReserveWaterMax()
  + ### setReserveWaterAmount

    private void setReserveWaterAmount(float amount)
  + ### replaceItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") replaceItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### useItemOn

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void useItemOn([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)

    Deprecated.
  + ### isCanPath

    public boolean isCanPath()
  + ### getX

    public float getX()

    Specified by:
    :   `getX` in class `GameEntity`
  + ### getY

    public float getY()

    Specified by:
    :   `getY` in class `GameEntity`
  + ### getZ

    public float getZ()

    Specified by:
    :   `getZ` in class `GameEntity`
  + ### getPosition

    public [Vector3](Vector3.html "class in zombie.iso") getPosition([Vector3](Vector3.html "class in zombie.iso") out)
  + ### getPosition

    public org.lwjgl.util.vector.Vector3f getPosition(org.lwjgl.util.vector.Vector3f out)
  + ### onMouseLeftClick

    public boolean onMouseLeftClick(int x,
    int y)
  + ### getProperties

    public [PropertyContainer](../core/properties/PropertyContainer.html "class in zombie.core.properties") getProperties()
  + ### hasProperty

    public boolean hasProperty([IsoPropertyType](../core/properties/IsoPropertyType.html "enum class in zombie.core.properties") p)
  + ### hasProperty

    public boolean hasProperty([IsoFlagType](SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") flag)
  + ### hasProperty

    public boolean hasProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") p)
  + ### getProperty

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getProperty([IsoPropertyType](../core/properties/IsoPropertyType.html "enum class in zombie.core.properties") p)
  + ### getProperty

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") p)
  + ### propertyEquals

    public boolean propertyEquals([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### propertyEqualsIgnoreCase

    public boolean propertyEqualsIgnoreCase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### RemoveAttachedAnims

    public void RemoveAttachedAnims()
  + ### RemoveAttachedAnim

    public void RemoveAttachedAnim(int index)
  + ### afterRotated

    public void afterRotated()
  + ### getFacingPosition

    public [Vector2](Vector2.html "class in zombie.iso") getFacingPosition([Vector2](Vector2.html "class in zombie.iso") pos)
  + ### getFacingPositionAlt

    public [Vector2](Vector2.html "class in zombie.iso") getFacingPositionAlt([Vector2](Vector2.html "class in zombie.iso") pos)
  + ### getRenderYOffset

    public float getRenderYOffset()
  + ### setRenderYOffset

    public void setRenderYOffset(float f)
  + ### isTableSurface

    public boolean isTableSurface()
  + ### isTableTopObject

    public boolean isTableTopObject()
  + ### getIsSurfaceNormalOffset

    public boolean getIsSurfaceNormalOffset()
  + ### getSurfaceNormalOffset

    public float getSurfaceNormalOffset()
  + ### getSurfaceOffsetNoTable

    public float getSurfaceOffsetNoTable()
  + ### getSurfaceOffset

    public float getSurfaceOffset()
  + ### isStairsNorth

    public boolean isStairsNorth()
  + ### isStairsWest

    public boolean isStairsWest()
  + ### isStairsObject

    public boolean isStairsObject()
  + ### isHoppable

    public boolean isHoppable()
  + ### isTallHoppable

    public boolean isTallHoppable()
  + ### isNorthHoppable

    public boolean isNorthHoppable()
  + ### isWall

    public boolean isWall()
  + ### isWallN

    public boolean isWallN()
  + ### isWallW

    public boolean isWallW()
  + ### isWallSE

    public boolean isWallSE()
  + ### haveSheetRope

    public boolean haveSheetRope()
  + ### countAddSheetRope

    public int countAddSheetRope()
  + ### canAddSheetRope

    public boolean canAddSheetRope()
  + ### addSheetRope

    public boolean addSheetRope([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### removeSheetRope

    public boolean removeSheetRope([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### setDoRender

    public void setDoRender(boolean doRender)

    Description copied from interface: `zombie.iso.IsoRenderable`

    Set this Renderable's visible flag.   
    If FALSE, the render() function will not draw.   
      
    The Renderable may still get culled from the scene, but it will always attempt to draw.

    Specified by:
    :   `setDoRender` in interface `zombie.iso.IsoRenderable`
  + ### getDoRender

    public boolean getDoRender()

    Description copied from interface: `zombie.iso.IsoRenderable`

    Is this Renderable visible.   
    If FALSE, the render() function will not draw.

    Specified by:
    :   `getDoRender` in interface `zombie.iso.IsoRenderable`
  + ### isSceneCulled

    public boolean isSceneCulled()

    Description copied from interface: `zombie.iso.IsoRenderable`

    Is this Renderable culled from the scene. Usually because it is outside visible range, or is hidden somehow, eg foliage or darkness.

    Specified by:
    :   `isSceneCulled` in interface `zombie.iso.IsoRenderable`
  + ### setSceneCulled

    public void setSceneCulled(boolean isCulled)

    Description copied from interface: `zombie.iso.IsoRenderable`

    Is this Renderable culled from the scene. Usually because it is outside visible range, or is hidden somehow, eg foliage or darkness.

    Specified by:
    :   `setSceneCulled` in interface `zombie.iso.IsoRenderable`
  + ### render

    public void render(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)

    Description copied from interface: `zombie.iso.IsoRenderable`

    Attempt to render this Renderable.   
    It will not draw if isSceneCulled == TRUE,   
    or if isDoRender == FALSE

    Specified by:
    :   `render` in interface `zombie.iso.IsoRenderable`
  + ### debugRenderItemHeight

    private void debugRenderItemHeight(float x,
    float y,
    float z)
  + ### debugRenderSurface

    private void debugRenderSurface(float x,
    float y,
    float z)
  + ### renderFloorTile

    public void renderFloorTile(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> attachedAndOverlayModifier)
  + ### renderWallTile

    public void renderWallTile([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderWallTileDepth

    public void renderWallTileDepth([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    boolean cutawaySelf,
    boolean cutawayE,
    boolean cutawayS,
    int cutawaySEX,
    float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    zombie.core.opengl.Shader shader,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderWallTileOnly

    public void renderWallTileOnly([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    zombie.core.opengl.Shader shader,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### shouldDrawMainSprite

    private boolean shouldDrawMainSprite()
  + ### renderAttachedAndOverlaySprites

    public void renderAttachedAndOverlaySprites([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderAttachedAndOverlaySpritesInternal

    private void renderAttachedAndOverlaySpritesInternal([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoAttached,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### prepareToRender

    private void prepareToRender([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col)
  + ### getAlphaUpdateRateDiv

    protected float getAlphaUpdateRateDiv()
  + ### getAlphaUpdateRateMul

    protected float getAlphaUpdateRateMul()
  + ### isUpdateAlphaEnabled

    protected boolean isUpdateAlphaEnabled()
  + ### isUpdateAlphaDuringRender

    protected boolean isUpdateAlphaDuringRender()
  + ### updateAlpha

    protected final void updateAlpha()
  + ### updateAlpha

    protected final void updateAlpha(int playerIndex)
  + ### updateAlpha

    protected void updateAlpha(int playerIndex,
    float mul,
    float div)
  + ### renderOverlaySprites

    private void renderOverlaySprites(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    zombie.core.opengl.Shader shader,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### renderAttachedSprites

    private void renderAttachedSprites([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### isSpriteInvisible

    public boolean isSpriteInvisible()
  + ### renderFxMask

    public void renderFxMask(float x,
    float y,
    float z,
    boolean bDoAttached)
  + ### renderObjectPicker

    public void renderObjectPicker(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo)
  + ### TestPathfindCollide

    public boolean TestPathfindCollide([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") obj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") from,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") to)
  + ### TestCollide

    public boolean TestCollide([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") obj,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") from,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") to)
  + ### TestVision

    public [IsoObject.VisionResult](IsoObject.VisionResult.html "enum class in zombie.iso") TestVision([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") from,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") to)
  + ### getCurrentFrameTex

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getCurrentFrameTex()
  + ### isMaskClicked

    public boolean isMaskClicked(int x,
    int y)
  + ### isMaskClicked

    public boolean isMaskClicked(int x,
    int y,
    boolean flip)
  + ### getMaskClickedY

    public float getMaskClickedY(int x,
    int y,
    boolean flip)
  + ### getCustomColor

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getCustomColor()
  + ### setCustomColor

    public void setCustomColor([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col)
  + ### setCustomColor

    public void setCustomColor(float r,
    float g,
    float b,
    float a)
  + ### loadFromRemoteBuffer

    public void loadFromRemoteBuffer(zombie.core.network.ByteBufferReader b)
  + ### loadFromRemoteBuffer

    public void loadFromRemoteBuffer(zombie.core.network.ByteBufferReader b,
    boolean addToObjects)
  + ### hasObjectAmbientEmitter

    protected boolean hasObjectAmbientEmitter()
  + ### addObjectAmbientEmitter

    protected void addObjectAmbientEmitter(zombie.audio.ObjectAmbientEmitters.PerObjectLogic logic)
  + ### addToWorld

    public void addToWorld()

    Overrides:
    :   `addToWorld` in class `GameEntity`
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `GameEntity`
  + ### removeFromWorldToMeta

    public final void removeFromWorldToMeta()
  + ### reuseGridSquare

    public void reuseGridSquare()
  + ### removeFromSquare

    public void removeFromSquare()
  + ### transmitCustomColorToClients

    public void transmitCustomColorToClients()
  + ### transmitCompleteItemToClients

    public void transmitCompleteItemToClients()
  + ### transmitUpdatedSpriteToClients

    public void transmitUpdatedSpriteToClients(zombie.core.raknet.UdpConnection connection)
  + ### transmitUpdatedSpriteToClients

    public void transmitUpdatedSpriteToClients()
  + ### transmitUpdatedSprite

    public void transmitUpdatedSprite()
  + ### sendObjectChange

    public void sendObjectChange([IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change)
  + ### sendObjectChange

    public void sendObjectChange([IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    se.krka.kahlua.vm.KahluaTable tbl)
  + ### sendObjectChange

    public void sendObjectChange([IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... args)
  + ### saveChange

    public void saveChange([IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    se.krka.kahlua.vm.KahluaTable tbl,
    zombie.core.network.ByteBufferWriter bb)
  + ### loadChange

    public void loadChange([IsoObjectChange](../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    zombie.core.network.ByteBufferReader bb)
  + ### transmitUpdatedSpriteToServer

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void transmitUpdatedSpriteToServer()

    Deprecated.
  + ### transmitModData

    public void transmitModData()
  + ### writeToRemoteBuffer

    public void writeToRemoteBuffer(zombie.core.network.ByteBufferWriter b)
  + ### getObjectIndex

    public int getObjectIndex()
  + ### getMovingObjectIndex

    public int getMovingObjectIndex()
  + ### getSpecialObjectIndex

    public int getSpecialObjectIndex()
  + ### getStaticMovingObjectIndex

    public int getStaticMovingObjectIndex()
  + ### getWorldObjectIndex

    public int getWorldObjectIndex()
  + ### getOverlaySprite

    public [IsoSprite](sprite/IsoSprite.html "class in zombie.iso.sprite") getOverlaySprite()
  + ### setOverlaySprite

    public void setOverlaySprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### setOverlaySprite

    public void setOverlaySprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    boolean bTransmit)
  + ### setOverlaySpriteColor

    public void setOverlaySpriteColor(float r,
    float g,
    float b,
    float a)
  + ### getOverlaySpriteColor

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getOverlaySpriteColor()
  + ### setOverlaySprite

    public void setOverlaySprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    float r,
    float g,
    float b,
    float a)
  + ### setOverlaySprite

    public boolean setOverlaySprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    float r,
    float g,
    float b,
    float a,
    boolean bTransmit)
  + ### hasOverlaySprite

    public boolean hasOverlaySprite()
  + ### haveSpecialTooltip

    public boolean haveSpecialTooltip()
  + ### setSpecialTooltip

    public void setSpecialTooltip(boolean specialTooltip)
  + ### getKeyId

    public int getKeyId()
  + ### setKeyId

    public void setKeyId(int keyId)
  + ### isHighlighted

    public boolean isHighlighted()
  + ### setHighlighted

    public void setHighlighted(boolean highlight)
  + ### setHighlighted

    public void setHighlighted(boolean highlight,
    boolean renderOnce)
  + ### isHighlightRenderOnce

    public boolean isHighlightRenderOnce()
  + ### setHighlightRenderOnce

    public void setHighlightRenderOnce(boolean highlight)
  + ### isHighlighted

    public boolean isHighlighted(int playerIndex)
  + ### setHighlighted

    public void setHighlighted(int playerIndex,
    boolean highlight)
  + ### setHighlighted

    public void setHighlighted(int playerIndex,
    boolean highlight,
    boolean renderOnce)
  + ### isHighlightRenderOnce

    public boolean isHighlightRenderOnce(int playerIndex)
  + ### setHighlightRenderOnce

    public void setHighlightRenderOnce(int playerIndex,
    boolean highlight)
  + ### getHighlightColor

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getHighlightColor()
  + ### setHighlightColor

    public void setHighlightColor([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") highlightColor)
  + ### setHighlightColor

    public void setHighlightColor(float r,
    float g,
    float b,
    float a)
  + ### getOrCreateHighlightColor

    private [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getOrCreateHighlightColor(int playerIndex)
  + ### getHighlightColor

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getHighlightColor(int playerIndex)
  + ### setHighlightColor

    public void setHighlightColor(int playerIndex,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") highlightColor)
  + ### setHighlightColor

    public void setHighlightColor(int playerIndex,
    float r,
    float g,
    float b,
    float a)
  + ### isBlink

    public boolean isBlink()
  + ### setBlink

    public void setBlink(boolean blink)
  + ### isBlink

    public boolean isBlink(int playerIndex)
  + ### setBlink

    public void setBlink(int playerIndex,
    boolean blink)
  + ### isSatChair

    public boolean isSatChair()
  + ### setSatChair

    public void setSatChair(boolean satChair)
  + ### couldBePoweredByGenerator

    public boolean couldBePoweredByGenerator()
  + ### getGeneratorPowerConsumption

    public float getGeneratorPowerConsumption()
  + ### checkHaveElectricity

    public void checkHaveElectricity()
  + ### checkAmbientSound

    public void checkAmbientSound()
  + ### getContainerCount

    public int getContainerCount()
  + ### getContainerByIndex

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") getContainerByIndex(int index)
  + ### getContainerByType

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") getContainerByType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getContainerByEitherType

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") getContainerByEitherType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type1,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type2)
  + ### addSecondaryContainer

    public void addSecondaryContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### getContainerIndex

    public int getContainerIndex([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### removeAllContainers

    public void removeAllContainers()
  + ### createFluidContainersFromSpriteProperties

    public void createFluidContainersFromSpriteProperties()
  + ### createContainersFromSpriteProperties

    public void createContainersFromSpriteProperties()
  + ### isItemAllowedInContainer

    public boolean isItemAllowedInContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isRemoveItemAllowedFromContainer

    public boolean isRemoveItemAllowedFromContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### cleanWallBlood

    public void cleanWallBlood()
  + ### getWindRenderEffects

    public [ObjectRenderEffects](objects/ObjectRenderEffects.html "class in zombie.iso.objects") getWindRenderEffects()
  + ### getObjectRenderEffects

    public [ObjectRenderEffects](objects/ObjectRenderEffects.html "class in zombie.iso.objects") getObjectRenderEffects()
  + ### setRenderEffect

    public void setRenderEffect(zombie.iso.objects.RenderEffectType type)
  + ### getRenderEffectMaster

    public [IsoObject](IsoObject.html "class in zombie.iso") getRenderEffectMaster()
  + ### getRenderEffectObjectCount

    public int getRenderEffectObjectCount()
  + ### getRenderEffectObjectByIndex

    public [IsoObject](IsoObject.html "class in zombie.iso") getRenderEffectObjectByIndex(int index)
  + ### setRenderEffect

    public void setRenderEffect(zombie.iso.objects.RenderEffectType type,
    boolean reuseEqualType)
  + ### removeRenderEffect

    public void removeRenderEffect([ObjectRenderEffects](objects/ObjectRenderEffects.html "class in zombie.iso.objects") o)
  + ### getObjectRenderEffectsToApply

    public [ObjectRenderEffects](objects/ObjectRenderEffects.html "class in zombie.iso.objects") getObjectRenderEffectsToApply()
  + ### destroyFence

    public void destroyFence([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)
  + ### getSpriteGridObjects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getSpriteGridObjects([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> result)
  + ### getSpriteGridObjectsExcludingSelf

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getSpriteGridObjectsExcludingSelf([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> result)
  + ### getSpriteGridObjectsIncludingSelf

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getSpriteGridObjectsIncludingSelf([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> result)
  + ### getSpriteGridObjects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getSpriteGridObjects([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> result,
    boolean bAddSelf)
  + ### isConnectedSpriteGridObject

    public boolean isConnectedSpriteGridObject([IsoObject](IsoObject.html "class in zombie.iso") object)
  + ### getClosestSpriteGridObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getClosestSpriteGridObject(float toX,
    float toY)
  + ### isOnScreen

    public boolean isOnScreen()
  + ### setOutlineHighlightCol

    public final void setOutlineHighlightCol([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") outlineHighlightCol)
  + ### getOutlineHighlightCol

    public final int getOutlineHighlightCol(int playerIndex)
  + ### setOutlineHighlightCol

    public final void setOutlineHighlightCol(int playerIndex,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") outlineHighlightCol)
  + ### setOutlineHighlightCol

    public final void setOutlineHighlightCol(float r,
    float g,
    float b,
    float a)
  + ### setOutlineHighlightCol

    public final void setOutlineHighlightCol(int playerIndex,
    float r,
    float g,
    float b,
    float a)
  + ### isOutlineHighlight

    public final boolean isOutlineHighlight()
  + ### isOutlineHighlight

    public final boolean isOutlineHighlight(int playerIndex)
  + ### setOutlineHighlight

    public final void setOutlineHighlight(boolean isOutlineHighlight)
  + ### setOutlineHighlight

    public final void setOutlineHighlight(int playerIndex,
    boolean isOutlineHighlight)
  + ### isOutlineHlAttached

    public final boolean isOutlineHlAttached()
  + ### isOutlineHlAttached

    public final boolean isOutlineHlAttached(int playerIndex)
  + ### setOutlineHlAttached

    public void setOutlineHlAttached(boolean isOutlineHlAttached)
  + ### setOutlineHlAttached

    public final void setOutlineHlAttached(int playerIndex,
    boolean isOutlineHlAttached)
  + ### isOutlineHlBlink

    public boolean isOutlineHlBlink()
  + ### isOutlineHlBlink

    public final boolean isOutlineHlBlink(int playerIndex)
  + ### setOutlineHlBlink

    public void setOutlineHlBlink(boolean isOutlineHlBlink)
  + ### setOutlineHlBlink

    public final void setOutlineHlBlink(int playerIndex,
    boolean isOutlineHlBlink)
  + ### unsetOutlineHighlight

    public void unsetOutlineHighlight()
  + ### getOutlineThickness

    public float getOutlineThickness()
  + ### setOutlineThickness

    public void setOutlineThickness(float outlineThickness)
  + ### addItemsFromProperties

    protected void addItemsFromProperties()
  + ### isDestroyed

    public boolean isDestroyed()

    Specified by:
    :   `isDestroyed` in interface `zombie.iso.objects.interfaces.Thumpable`
  + ### getStressModFromThumping

    public float getStressModFromThumping()
  + ### Thump

    public void Thump([IsoMovingObject](IsoMovingObject.html "class in zombie.iso") thumper,
    int thumpEventCount)

    Specified by:
    :   `Thump` in interface `zombie.iso.objects.interfaces.Thumpable`
  + ### setMovedThumpable

    public void setMovedThumpable(boolean movedThumpable)
  + ### isMovedThumpable

    public boolean isMovedThumpable()
  + ### WeaponHit

    public void WeaponHit([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `WeaponHit` in interface `zombie.iso.objects.interfaces.Thumpable`
  + ### getThumpableFor

    public zombie.iso.objects.interfaces.Thumpable getThumpableFor([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)

    Specified by:
    :   `getThumpableFor` in interface `zombie.iso.objects.interfaces.Thumpable`
  + ### getThumpableFor

    public zombie.iso.objects.interfaces.Thumpable getThumpableFor([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon)

    Specified by:
    :   `getThumpableFor` in interface `zombie.iso.objects.interfaces.Thumpable`
  + ### isExistInTheWorld

    public boolean isExistInTheWorld()
  + ### getThumpCondition

    public float getThumpCondition()

    Specified by:
    :   `getThumpCondition` in interface `zombie.iso.objects.interfaces.Thumpable`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getGameEntityType

    public [GameEntityType](../entity/GameEntityType.html "enum class in zombie.entity") getGameEntityType()

    Specified by:
    :   `getGameEntityType` in class `GameEntity`
  + ### getEntityNetID

    public long getEntityNetID()

    Specified by:
    :   `getEntityNetID` in class `GameEntity`
  + ### isEntityValid

    public boolean isEntityValid()

    Specified by:
    :   `isEntityValid` in class `GameEntity`
  + ### getMasterObject

    public [IsoObject](IsoObject.html "class in zombie.iso") getMasterObject()
  + ### isTent

    public boolean isTent()
  + ### getFacing

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") getFacing()
  + ### getTileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTileName()
  + ### spawnItemToObjectSurface

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") spawnItemToObjectSurface([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### spawnItemToObjectSurface

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") spawnItemToObjectSurface([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    boolean randomRotation)
  + ### spawnItemToObjectSurface

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") spawnItemToObjectSurface([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    boolean randomRotation,
    boolean checkForAdjacentCanStandSquare)
  + ### addItemToObjectSurface

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemToObjectSurface([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### addItemToObjectSurface

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemToObjectSurface([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    boolean randomRotation)
  + ### addItemToObjectSurface

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemToObjectSurface([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    boolean randomRotation,
    boolean spawnChecks)
  + ### getRenderInfo

    public zombie.iso.fboRenderChunk.ObjectRenderInfo getRenderInfo(int playerIndex)
  + ### invalidateRenderChunkLevel

    public void invalidateRenderChunkLevel(long dirtyFlags)
  + ### invalidateVispolyChunkLevel

    public void invalidateVispolyChunkLevel()
  + ### hasAnimatedAttachments

    public boolean hasAnimatedAttachments()
  + ### renderAnimatedAttachments

    public void renderAnimatedAttachments(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col)
  + ### getClockScript

    private zombie.scripting.objects.ClockScript getClockScript()
  + ### checkClockTexture

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") checkClockTexture()
  + ### hasAnimatedClockHands

    private boolean hasAnimatedClockHands()
  + ### renderClockHands

    private void renderClockHands(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col)
  + ### renderClockHand

    private void renderClockHand(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    zombie.scripting.objects.ClockScript clockScript,
    zombie.scripting.objects.ClockScript.HandScript handScript,
    float rx,
    float ry,
    float rz,
    boolean bNorth)
  + ### getRenderSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getRenderSquare()
  + ### setSpriteModelName

    public void setSpriteModelName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteModelName)
  + ### getSpriteModel

    public [SpriteModel](SpriteModel.html "class in zombie.iso") getSpriteModel()
  + ### renderModel

    protected boolean renderModel(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") col)
  + ### isAnimating

    public boolean isAnimating()
  + ### setAnimating

    public void setAnimating(boolean bAnimating)
  + ### onAnimationFinished

    public void onAnimationFinished()
  + ### updateRenderInfoForObjectPicker

    protected void updateRenderInfoForObjectPicker(float x,
    float y,
    float z,
    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") info)
  + ### isGrave

    public boolean isGrave()
  + ### getOnOverlay

    public [IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") getOnOverlay()
  + ### setOnOverlay

    public void setOnOverlay([IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") inst)
  + ### clearOnOverlay

    public void clearOnOverlay()
  + ### shouldShowOnOverlay

    public boolean shouldShowOnOverlay()
  + ### getLightSource

    public [IsoLightSource](IsoLightSource.html "class in zombie.iso") getLightSource()
  + ### setLightSource

    public void setLightSource([IsoLightSource](IsoLightSource.html "class in zombie.iso") lightSource)
  + ### shouldLightSourceBeActive

    protected boolean shouldLightSourceBeActive()
  + ### addLightSourceToWorld

    protected void addLightSourceToWorld()
  + ### removeLightSourceFromWorld

    protected void removeLightSourceFromWorld()
  + ### checkLightSourceActive

    public void checkLightSourceActive()
  + ### isGenericCraftingSurface

    public boolean isGenericCraftingSurface()
  + ### isBush

    public boolean isBush()
  + ### isGrass

    public boolean isGrass()
  + ### isGrassLike

    public boolean isGrassLike()
  + ### isOres

    public boolean isOres()
  + ### isFascia

    public boolean isFascia()
  + ### getFasciaAttachedSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getFasciaAttachedSquare()
  + ### setExplored

    public void setExplored(boolean isExplored)
  + ### flagForHotSave

    public void flagForHotSave()
  + ### hasGridPower

    public boolean hasGridPower()
  + ### isObjectNoContainerOrEmpty

    public boolean isObjectNoContainerOrEmpty()
  + ### dumpContentsInSquare

    public void dumpContentsInSquare()
  + ### isPropaneBBQ

    public boolean isPropaneBBQ()
  + ### hasPropaneTank

    public boolean hasPropaneTank()
  + ### isFireInteractionObject

    public boolean isFireInteractionObject()
  + ### setLit

    public void setLit(boolean lit)
  + ### isLit

    public boolean isLit()
  + ### turnOn

    public void turnOn()
  + ### checkObjectPowered

    public boolean checkObjectPowered()
  + ### isStump

    public boolean isStump()
  + ### isOre

    public boolean isOre()
  + ### hasAdjacentCanStandSquare

    public boolean hasAdjacentCanStandSquare()
  + ### isWindow

    public boolean isWindow()
  + ### isNorthBlocked

    public boolean isNorthBlocked()
  + ### isUseSnowSprite

    public boolean isUseSnowSprite()
  + ### handleBurning

    public void handleBurning()
  + ### isFurnitureOccupied

    public boolean isFurnitureOccupied([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") localCharacter)