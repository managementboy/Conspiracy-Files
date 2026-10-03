[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoDeadBody](IsoDeadBody.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [tempBodies](#tempBodies)
   2. [id](#id)
   3. [MAX\_ROT\_STAGES](#MAX_ROT_STAGES)
   4. [MAX\_ROT\_STAGES\_ANIMALS](#MAX_ROT_STAGES_ANIMALS)
   5. [VISUAL\_TYPE\_HUMAN](#VISUAL_TYPE_HUMAN)
   6. [VISUAL\_TYPE\_ANIMAL](#VISUAL_TYPE_ANIMAL)
   7. [ZOMBIE\_SKELETON\_WEIGHT](#ZOMBIE_SKELETON_WEIGHT)
   8. [female](#female)
   9. [wasZombie](#wasZombie)
   10. [fakeDead](#fakeDead)
   11. [crawling](#crawling)
   12. [speakColor](#speakColor)
   13. [speakTime](#speakTime)
   14. [persistentOutfitId](#persistentOutfitId)
   15. [desc](#desc)
   16. [baseVisual](#baseVisual)
   17. [animalType](#animalType)
   18. [animalSize](#animalSize)
   19. [animalGenome](#animalGenome)
   20. [animalGeneticDisorder](#animalGeneticDisorder)
   21. [wornItems](#wornItems)
   22. [attachedItems](#attachedItems)
   23. [deathTime](#deathTime)
   24. [reanimateTime](#reanimateTime)
   25. [player](#player)
   26. [fallOnFront](#fallOnFront)
   27. [killedByFall](#killedByFall)
   28. [wasSkeleton](#wasSkeleton)
   29. [primaryHandItem](#primaryHandItem)
   30. [secondaryHandItem](#secondaryHandItem)
   31. [angle](#angle)
   32. [forwardDirection](#forwardDirection)
   33. [zombieRotStageAtDeath](#zombieRotStageAtDeath)
   34. [animalRotStageAtDeath](#animalRotStageAtDeath)
   35. [characterOnlineId](#characterOnlineId)
   36. [animalAnimSet](#animalAnimSet)
   37. [weight](#weight)
   38. [corpseItem](#corpseItem)
   39. [customName](#customName)
   40. [invIcon](#invIcon)
   41. [shadowParams](#shadowParams)
   42. [grappleable](#grappleable)
   43. [ragdollFall](#ragdollFall)
   44. [diedBoneTransforms](#diedBoneTransforms)
   45. [animationPlayer](#animationPlayer)
   46. [invalidateNextRender](#invalidateNextRender)
   47. [rottenTexture](#rottenTexture)
   48. [skelInvIcon](#skelInvIcon)
   49. [isOnHook](#isOnHook)
   50. [killedBy](#killedBy)
   51. [createdCorpseItem](#createdCorpseItem)
   52. [tempZombie](#tempZombie)
   53. [inf](#inf)
   54. [atlasTex](#atlasTex)
   55. [dropShadow](#dropShadow)
   56. [HIT\_TEST\_WIDTH](#HIT_TEST_WIDTH)
   57. [HIT\_TEST\_HEIGHT](#HIT_TEST_HEIGHT)
   58. [\_rotation](#_rotation)
   59. [\_transform](#_transform)
   60. [\_UNIT\_Z](#_UNIT_Z)
   61. [\_tempVec3f\_1](#_tempVec3f_1)
   62. [\_tempVec3f\_2](#_tempVec3f_2)
   63. [burnTimer](#burnTimer)
   64. [speaking](#speaking)
   65. [sayLine](#sayLine)
7. [Constructor Details](#constructor-detail)
   1. [IsoDeadBody(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
   2. [IsoDeadBody(IsoGameCharacter, boolean)](#%3Cinit%3E(zombie.characters.IsoGameCharacter,boolean))
   3. [IsoDeadBody(IsoGameCharacter, boolean, boolean)](#%3Cinit%3E(zombie.characters.IsoGameCharacter,boolean,boolean))
   4. [IsoDeadBody(IsoCell)](#%3Cinit%3E(zombie.iso.IsoCell))
8. [Method Details](#method-detail)
   1. [getObjectID()](#getObjectID())
   2. [getObjectIDAsLong()](#getObjectIDAsLong())
   3. [isDead(short)](#isDead(short))
   4. [getObjectName()](#getObjectName())
   5. [toString()](#toString())
   6. [getVisual()](#getVisual())
   7. [getHumanVisual()](#getHumanVisual())
   8. [getAnimalVisual()](#getAnimalVisual())
   9. [getAnimalType()](#getAnimalType())
   10. [getAnimalSize()](#getAnimalSize())
   11. [getAnimalGenome()](#getAnimalGenome())
   12. [getAnimalGeneticDisorder()](#getAnimalGeneticDisorder())
   13. [getItemVisuals(ItemVisuals)](#getItemVisuals(zombie.core.skinnedmodel.visual.ItemVisuals))
   14. [isFemale()](#isFemale())
   15. [isZombie()](#isZombie())
   16. [isCrawling()](#isCrawling())
   17. [setCrawling(boolean)](#setCrawling(boolean))
   18. [isFakeDead()](#isFakeDead())
   19. [setFakeDead(boolean)](#setFakeDead(boolean))
   20. [isSkeleton()](#isSkeleton())
   21. [setWornItems(WornItems)](#setWornItems(zombie.characters.WornItems.WornItems))
   22. [getWornItems()](#getWornItems())
   23. [setAttachedItems(AttachedItems)](#setAttachedItems(zombie.characters.AttachedItems.AttachedItems))
   24. [getAttachedItems()](#getAttachedItems())
   25. [isEquipped(InventoryItem)](#isEquipped(zombie.inventory.InventoryItem))
   26. [isEquippedClothing(InventoryItem)](#isEquippedClothing(zombie.inventory.InventoryItem))
   27. [isAttachedItem(InventoryItem)](#isAttachedItem(zombie.inventory.InventoryItem))
   28. [isHandItem(InventoryItem)](#isHandItem(zombie.inventory.InventoryItem))
   29. [isPrimaryHandItem(InventoryItem)](#isPrimaryHandItem(zombie.inventory.InventoryItem))
   30. [isSecondaryHandItem(InventoryItem)](#isSecondaryHandItem(zombie.inventory.InventoryItem))
   31. [getInventoryWeight()](#getInventoryWeight())
   32. [getItem()](#getItem())
   33. [getCorpseItemType()](#getCorpseItemType())
   34. [getInitialItemAge(InventoryItem)](#getInitialItemAge(zombie.inventory.InventoryItem))
   35. [getDeathTime()](#getDeathTime())
   36. [setDeathTime(float)](#setDeathTime(float))
   37. [getDeadAnimalIcon(IsoAnimal)](#getDeadAnimalIcon(zombie.characters.animals.IsoAnimal))
   38. [loadSprite(ByteBuffer)](#loadSprite(java.nio.ByteBuffer))
   39. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   40. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   41. [saveAnimalGenetics(ByteBuffer, boolean)](#saveAnimalGenetics(java.nio.ByteBuffer,boolean))
   42. [loadAnimalGenetics(ByteBuffer, int, boolean)](#loadAnimalGenetics(java.nio.ByteBuffer,int,boolean))
   43. [softReset()](#softReset())
   44. [saveChange(IsoObjectChange, KahluaTable, ByteBufferWriter)](#saveChange(zombie.core.properties.IsoObjectChange,se.krka.kahlua.vm.KahluaTable,zombie.core.network.ByteBufferWriter))
   45. [loadChange(IsoObjectChange, ByteBufferReader)](#loadChange(zombie.core.properties.IsoObjectChange,zombie.core.network.ByteBufferReader))
   46. [renderlast()](#renderlast())
   47. [getAtlasTexture()](#getAtlasTexture())
   48. [render(float, float, float, ColorInfo, boolean, boolean, Shader)](#render(float,float,float,zombie.core.textures.ColorInfo,boolean,boolean,zombie.core.opengl.Shader))
   49. [renderShadow()](#renderShadow())
   50. [renderShadow(float, float, float, Vector3f, float, float, float, ColorInfo, float)](#renderShadow(float,float,float,org.joml.Vector3f,float,float,float,zombie.core.textures.ColorInfo,float))
   51. [renderShadow(float, float, float, Vector3f, float, float, float, ColorInfo, float, boolean)](#renderShadow(float,float,float,org.joml.Vector3f,float,float,float,zombie.core.textures.ColorInfo,float,boolean))
   52. [getShadowParams()](#getShadowParams())
   53. [renderObjectPicker(float, float, float, ColorInfo)](#renderObjectPicker(float,float,float,zombie.core.textures.ColorInfo))
   54. [isMouseOver(float, float)](#isMouseOver(float,float))
   55. [getGrabHeadPosition(Vector2f)](#getGrabHeadPosition(org.joml.Vector2f))
   56. [getGrabLegsPosition(Vector2f)](#getGrabLegsPosition(org.joml.Vector2f))
   57. [Burn()](#Burn())
   58. [setContainer(ItemContainer)](#setContainer(zombie.inventory.ItemContainer))
   59. [checkClothing(InventoryItem)](#checkClothing(zombie.inventory.InventoryItem))
   60. [IsSpeaking()](#IsSpeaking())
   61. [Say(String)](#Say(java.lang.String))
   62. [getSayLine()](#getSayLine())
   63. [getTalkerType()](#getTalkerType())
   64. [addToWorld()](#addToWorld())
   65. [removeFromWorld()](#removeFromWorld())
   66. [updateBodies()](#updateBodies())
   67. [changeRotStage(int)](#changeRotStage(int))
   68. [updateAnimalRotting(float, float)](#updateAnimalRotting(float,float))
   69. [updateRotting(float, float)](#updateRotting(float,float))
   70. [updateFakeDead()](#updateFakeDead())
   71. [getFakeDeadWakeupHours()](#getFakeDeadWakeupHours())
   72. [isPlayerNearby()](#isPlayerNearby())
   73. [isPlayerNearby(IsoPlayer, boolean)](#isPlayerNearby(zombie.characters.IsoPlayer,boolean))
   74. [getReanimateTime()](#getReanimateTime())
   75. [setReanimateTime(float)](#setReanimateTime(float))
   76. [getReanimateDelay()](#getReanimateDelay())
   77. [reanimateLater()](#reanimateLater())
   78. [reanimateNow()](#reanimateNow())
   79. [update()](#update())
   80. [Grappled(IGrappleable, HandWeapon, float, String)](#Grappled(zombie.core.skinnedmodel.IGrappleable,zombie.inventory.types.HandWeapon,float,java.lang.String))
   81. [reanimateZombieForGrapple()](#reanimateZombieForGrapple())
   82. [reanimate()](#reanimate())
   83. [reanimateAnimal()](#reanimateAnimal())
   84. [Reset()](#Reset())
   85. [Collision(Vector2, IsoObject)](#Collision(zombie.iso.Vector2,zombie.iso.IsoObject))
   86. [isFallOnFront()](#isFallOnFront())
   87. [setFallOnFront(boolean)](#setFallOnFront(boolean))
   88. [isKilledByFall()](#isKilledByFall())
   89. [setKilledByFall(boolean)](#setKilledByFall(boolean))
   90. [getPrimaryHandItem()](#getPrimaryHandItem())
   91. [setPrimaryHandItem(InventoryItem)](#setPrimaryHandItem(zombie.inventory.InventoryItem))
   92. [updateContainerWithHandItems()](#updateContainerWithHandItems())
   93. [getSecondaryHandItem()](#getSecondaryHandItem())
   94. [setSecondaryHandItem(InventoryItem)](#setSecondaryHandItem(zombie.inventory.InventoryItem))
   95. [getAngle()](#getAngle())
   96. [getOutfitName()](#getOutfitName())
   97. [getDescription()](#getDescription())
   98. [readInventory(ByteBuffer)](#readInventory(java.nio.ByteBuffer))
   99. [getCharacterOnlineID()](#getCharacterOnlineID())
   100. [setCharacterOnlineID(short)](#setCharacterOnlineID(short))
   101. [isPlayer()](#isPlayer())
   102. [removeDeadBody(ObjectID)](#removeDeadBody(zombie.network.id.ObjectID))
   103. [getRenderSquare()](#getRenderSquare())
   104. [renderDebugData()](#renderDebugData())
   105. [isAnimal()](#isAnimal())
   106. [getWeight()](#getWeight())
   107. [getCorpseItem()](#getCorpseItem())
   108. [getCustomName()](#getCustomName())
   109. [setAnimalData(IsoAnimal)](#setAnimalData(zombie.characters.animals.IsoAnimal))
   110. [getDescriptor()](#getDescriptor())
   111. [getAnimForwardDirection(Vector2)](#getAnimForwardDirection(zombie.iso.Vector2))
   112. [setForwardDirection(float, float)](#setForwardDirection(float,float))
   113. [isPerformingGrappleAnimation()](#isPerformingGrappleAnimation())
   114. [setForwardDirectionAngle(float)](#setForwardDirectionAngle(float))
   115. [getAnimatable()](#getAnimatable())
   116. [getWrappedGrappleable()](#getWrappedGrappleable())
   117. [getDiedBoneTransforms()](#getDiedBoneTransforms())
   118. [getCarcassName()](#getCarcassName())
   119. [getBreed()](#getBreed())
   120. [hasAnimalParts()](#hasAnimalParts())
   121. [isAnimalSkeleton()](#isAnimalSkeleton())
   122. [invalidateCorpse()](#invalidateCorpse())
   123. [setInvalidateNextRender(boolean)](#setInvalidateNextRender(boolean))
   124. [getInvIcon()](#getInvIcon())
   125. [getPickUpSound()](#getPickUpSound())
   126. [setOnHook(boolean)](#setOnHook(boolean))
   127. [isOnHook()](#isOnHook())
   128. [getKilledBy()](#getKilledBy())
   129. [setKilledBy(IsoGameCharacter)](#setKilledBy(zombie.characters.IsoGameCharacter))
   130. [removeDeadBodies(UdpConnection)](#removeDeadBodies(zombie.core.raknet.UdpConnection))
   131. [writeInventory(ByteBufferWriter)](#writeInventory(zombie.core.network.ByteBufferWriter))
   132. [becomeCorpseItem(boolean)](#becomeCorpseItem(boolean))
   133. [setDoRender(boolean)](#setDoRender(boolean))
   134. [canBeGrabbedFrom(float, float)](#canBeGrabbedFrom(float,float))
   135. [canBeGrabbed()](#canBeGrabbed())
   136. [canPickUpBodyFromSquare(IsoGridSquare, IsoGridSquare)](#canPickUpBodyFromSquare(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoDeadBody
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../../entity/GameEntity.html "class in zombie.entity")

[zombie.iso.IsoObject](../IsoObject.html "class in zombie.iso")

[zombie.iso.IsoMovingObject](../IsoMovingObject.html "class in zombie.iso")

zombie.iso.objects.IsoDeadBody

All Implemented Interfaces:
:   `Serializable, zombie.ai.astar.Mover, zombie.characters.ecs.ECSEntity, zombie.characters.Talker, zombie.core.skinnedmodel.IGrappleable, zombie.core.skinnedmodel.IGrappleableWrapper, IAnimalVisual, IHumanVisual, zombie.iso.IItemProvider, ILuaIsoObject, zombie.iso.IsoRenderable, zombie.iso.objects.interfaces.Thumpable, zombie.network.fields.IPositional, zombie.network.id.IIdentifiable`

---

public final class IsoDeadBody
extends [IsoMovingObject](../IsoMovingObject.html "class in zombie.iso")
implements zombie.characters.Talker, [IAnimalVisual](../../core/skinnedmodel/visual/IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual"), [IHumanVisual](../../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual"), zombie.network.id.IIdentifiable, zombie.core.skinnedmodel.IGrappleableWrapper, zombie.iso.IItemProvider, zombie.network.fields.IPositional

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.iso.objects.IsoDeadBody)

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [IsoObject](../IsoObject.html#nested-class-summary "class in zombie.iso")

  `IsoObject.IsoObjectFactory, IsoObject.OutlineShader, IsoObject.VisionResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final org.joml.Quaternionf`

  `_rotation`

  `private static final Vector3f`

  `_tempVec3f_1`

  `private static final Vector3f`

  `_tempVec3f_2`

  `private static final Transform`

  `_transform`

  `private static final Vector3f`

  `_UNIT_Z`

  `private float`

  `angle`

  `String`

  `animalAnimSet`

  `private final List<String>`

  `animalGeneticDisorder`

  `private final List<AnimalGene>`

  `animalGenome`

  `private int`

  `animalRotStageAtDeath`

  `private float`

  `animalSize`

  `private String`

  `animalType`

  `zombie.core.skinnedmodel.animation.AnimationPlayer`

  `animationPlayer`

  `private zombie.core.skinnedmodel.DeadBodyAtlas.BodyTexture`

  `atlasTex`

  `private AttachedItems`

  `attachedItems`

  `private zombie.core.skinnedmodel.visual.BaseVisual`

  `baseVisual`

  `private float`

  `burnTimer`

  `private short`

  `characterOnlineId`

  `String`

  `corpseItem`

  `private boolean`

  `crawling`

  `private InventoryItem`

  `createdCorpseItem`

  `String`

  `customName`

  `private float`

  `deathTime`

  `private SurvivorDesc`

  `desc`

  `private TwistableBoneTransform[]`

  `diedBoneTransforms`

  `private static Texture`

  `dropShadow`

  `private boolean`

  `fakeDead`

  `private boolean`

  `fallOnFront`

  `private boolean`

  `female`

  `private final Vector2`

  `forwardDirection`

  `private final zombie.core.skinnedmodel.BaseGrappleable`

  `grappleable`

  `private static final float`

  `HIT_TEST_HEIGHT`

  `private static final float`

  `HIT_TEST_WIDTH`

  `private final zombie.network.id.ObjectID`

  `id`

  `private static final ColorInfo`

  `inf`

  `private boolean`

  `invalidateNextRender`

  `String`

  `invIcon`

  `private boolean`

  `isOnHook`

  `private IsoGameCharacter`

  `killedBy`

  `private boolean`

  `killedByFall`

  `static final int`

  `MAX_ROT_STAGES`

  `static final int`

  `MAX_ROT_STAGES_ANIMALS`

  `private int`

  `persistentOutfitId`

  `private IsoPlayer`

  `player`

  `private InventoryItem`

  `primaryHandItem`

  `boolean`

  `ragdollFall`

  `private float`

  `reanimateTime`

  `String`

  `rottenTexture`

  `String`

  `sayLine`

  `private InventoryItem`

  `secondaryHandItem`

  `private final zombie.iso.objects.ShadowParams`

  `shadowParams`

  `String`

  `skelInvIcon`

  `private final Color`

  `speakColor`

  `boolean`

  `speaking`

  `private float`

  `speakTime`

  `private static final ArrayList<zombie.network.id.IIdentifiable>`

  `tempBodies`

  `private static final ThreadLocal<IsoZombie>`

  `tempZombie`

  `private static final int`

  `VISUAL_TYPE_ANIMAL`

  `private static final int`

  `VISUAL_TYPE_HUMAN`

  `private boolean`

  `wasSkeleton`

  `private boolean`

  `wasZombie`

  `float`

  `weight`

  `private WornItems`

  `wornItems`

  `private static final float`

  `ZOMBIE_SKELETON_WEIGHT`

  `private int`

  `zombieRotStageAtDeath`

  ### Fields inherited from class [IsoMovingObject](../IsoMovingObject.html#field-summary "class in zombie.iso")

  `collidable, current, def, hitDir, last, MAX_ZOMBIES_EATING, movementLastFrame, movingSq, noDamage, reqMovement, shootable, solid, treeSoundMgr, width`

  ### Fields inherited from class [IsoObject](../IsoObject.html#field-summary "class in zombie.iso")

  `alpha, alphaForced, animating, attachedAnimSprite, bmod, children, container, damage, doNotSync, emitter, externalWaterSource, fireColor, gmod, isOutlineHighlight, isOutlineHlAttached, isOutlineHlBlink, keyId, lastRendered, lastRenderedRendered, lowLightingQualityHack, MAX_WALL_SPLATS, movedThumpable, name, neverDoneAlpha, noPicking, objectRenderEffects, offsetX, offsetY, outlineHighlightCol, outlineOnMouseover, overlaySprite, overlaySpriteColor, partialThumpDmg, ppfBlink, ppfHighlighted, ppfHighlightRenderOnce, renderDepthAdjust, renderInfo, renderSquareOverride, renderSquareOverride2, rerouteCollide, rerouteMask, rmod, satChair, sheetRope, sheetRopeHealth, sprite, spriteModel, spriteModelInit, spriteModelName, spriteName, square, sx, sy, table, targetAlpha, THUMP_STRESS_DEFAULT, THUMP_STRESS_FENCES, THUMP_STRESS_THUMPABLE, THUMP_STRESS_TRANSPARENT_FENCES, tintb, tintg, tintr, usesExternalWaterSource, wallBloodSplats, windRenderEffects`

  ### Fields inherited from class [GameEntity](../../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoDeadBody(IsoGameCharacter died)`

  `IsoDeadBody(IsoGameCharacter died,
  boolean wasCorpseAlready)`

  `IsoDeadBody(IsoGameCharacter died,
  boolean wasCorpseAlready,
  boolean bAddToSquareAndWorld)`

  `IsoDeadBody(IsoCell cell)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addToWorld()`

  `InventoryItem`

  `becomeCorpseItem(boolean isRemote)`

  `void`

  `Burn()`

  `boolean`

  `canBeGrabbed()`

  `boolean`

  `canBeGrabbedFrom(float x,
  float y)`

  `static boolean`

  `canPickUpBodyFromSquare(IsoGridSquare fromSquare,
  IsoGridSquare toSquare)`

  `void`

  `changeRotStage(int newStage)`

  `void`

  `checkClothing(InventoryItem removedItem)`

  `void`

  `Collision(Vector2 collision,
  IsoObject object)`

  `float`

  `getAngle()`

  `List<String>`

  `getAnimalGeneticDisorder()`

  `List<AnimalGene>`

  `getAnimalGenome()`

  `float`

  `getAnimalSize()`

  `String`

  `getAnimalType()`

  `AnimalVisual`

  `getAnimalVisual()`

  `zombie.core.skinnedmodel.advancedanimation.IAnimatable`

  `getAnimatable()`

  `Vector2`

  `getAnimForwardDirection(Vector2 forwardDirection)`

  `zombie.core.skinnedmodel.DeadBodyAtlas.BodyTexture`

  `getAtlasTexture()`

  `AttachedItems`

  `getAttachedItems()`

  `String`

  `getBreed()`

  `String`

  `getCarcassName()`

  `short`

  `getCharacterOnlineID()`

  `String`

  `getCorpseItem()`

  `private String`

  `getCorpseItemType()`

  `String`

  `getCustomName()`

  `private String`

  `getDeadAnimalIcon(IsoAnimal dead)`

  `float`

  `getDeathTime()`

  `String`

  `getDescription()`

  `SurvivorDesc`

  `getDescriptor()`

  `TwistableBoneTransform[]`

  `getDiedBoneTransforms()`

  `private float`

  `getFakeDeadWakeupHours()`

  `Vector2f`

  `getGrabHeadPosition(Vector2f out)`

  `Vector2f`

  `getGrabLegsPosition(Vector2f out)`

  `HumanVisual`

  `getHumanVisual()`

  `float`

  `getInitialItemAge(InventoryItem item)`

  `float`

  `getInventoryWeight()`

  `String`

  `getInvIcon()`

  `InventoryItem`

  `getItem()`

  `void`

  `getItemVisuals(ItemVisuals itemVisuals)`

  `IsoGameCharacter`

  `getKilledBy()`

  `zombie.network.id.ObjectID`

  `getObjectID()`

  `long`

  `getObjectIDAsLong()`

  `String`

  `getObjectName()`

  `String`

  `getOutfitName()`

  `String`

  `getPickUpSound()`

  `InventoryItem`

  `getPrimaryHandItem()`

  `private float`

  `getReanimateDelay()`

  `float`

  `getReanimateTime()`

  `IsoGridSquare`

  `getRenderSquare()`

  `String`

  `getSayLine()`

  `InventoryItem`

  `getSecondaryHandItem()`

  `zombie.iso.objects.ShadowParams`

  `getShadowParams()`

  `String`

  `getTalkerType()`

  `zombie.core.skinnedmodel.visual.BaseVisual`

  `getVisual()`

  `float`

  `getWeight()`

  `WornItems`

  `getWornItems()`

  `zombie.core.skinnedmodel.IGrappleable`

  `getWrappedGrappleable()`

  `void`

  `Grappled(zombie.core.skinnedmodel.IGrappleable grappler,
  HandWeapon weapon,
  float grappleEffectiveness,
  String grappleType)`

  This character is determined that it is about to be grappled.

  `boolean`

  `hasAnimalParts()`

  `void`

  `invalidateCorpse()`

  `boolean`

  `isAnimal()`

  `boolean`

  `isAnimalSkeleton()`

  `boolean`

  `isAttachedItem(InventoryItem item)`

  `boolean`

  `isCrawling()`

  `static boolean`

  `isDead(short characterOnlineID)`

  `boolean`

  `isEquipped(InventoryItem item)`

  `boolean`

  `isEquippedClothing(InventoryItem item)`

  `boolean`

  `isFakeDead()`

  `boolean`

  `isFallOnFront()`

  `boolean`

  `isFemale()`

  `boolean`

  `isHandItem(InventoryItem item)`

  `boolean`

  `isKilledByFall()`

  `boolean`

  `isMouseOver(float screenX,
  float screenY)`

  `boolean`

  `isOnHook()`

  `boolean`

  `isPerformingGrappleAnimation()`

  `boolean`

  `isPlayer()`

  `private boolean`

  `isPlayerNearby()`

  `private boolean`

  `isPlayerNearby(IsoPlayer player,
  boolean isCanSee)`

  `boolean`

  `isPrimaryHandItem(InventoryItem item)`

  `boolean`

  `isSecondaryHandItem(InventoryItem item)`

  `boolean`

  `isSkeleton()`

  `boolean`

  `IsSpeaking()`

  `boolean`

  `isZombie()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `private void`

  `loadAnimalGenetics(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `loadChange(IsoObjectChange change,
  zombie.core.network.ByteBufferReader bb)`

  `private IsoSprite`

  `loadSprite(ByteBuffer input)`

  `String`

  `readInventory(ByteBuffer b)`

  `IsoGameCharacter`

  `reanimate()`

  `private IsoAnimal`

  `reanimateAnimal()`

  `void`

  `reanimateLater()`

  `void`

  `reanimateNow()`

  `private IsoZombie`

  `reanimateZombieForGrapple()`

  `static void`

  `removeDeadBodies(zombie.core.raknet.UdpConnection removeCorpsesConnection)`

  `static void`

  `removeDeadBody(zombie.network.id.ObjectID id)`

  `void`

  `removeFromWorld()`

  Remove Object from world, no entity to meta offloading.

  `void`

  `render(float x,
  float y,
  float z,
  ColorInfo col,
  boolean bDoChild,
  boolean bWallLightingPass,
  zombie.core.opengl.Shader shader)`

  Attempt to render this Renderable.

  `void`

  `renderDebugData()`

  `void`

  `renderlast()`

  `void`

  `renderObjectPicker(float x,
  float y,
  float z,
  ColorInfo lightInfo)`

  `void`

  `renderShadow()`

  `static void`

  `renderShadow(float x,
  float y,
  float z,
  Vector3f forward,
  float w,
  float fm,
  float bm,
  ColorInfo lightInfo,
  float alpha)`

  `static void`

  `renderShadow(float x,
  float y,
  float z,
  Vector3f forward,
  float w,
  float fm,
  float bm,
  ColorInfo lightInfo,
  float alpha,
  boolean isAnimal)`

  `static void`

  `Reset()`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `private void`

  `saveAnimalGenetics(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `saveChange(IsoObjectChange change,
  se.krka.kahlua.vm.KahluaTable tbl,
  zombie.core.network.ByteBufferWriter bb)`

  `void`

  `Say(String line)`

  `void`

  `setAnimalData(IsoAnimal died)`

  `void`

  `setAttachedItems(AttachedItems other)`

  `void`

  `setCharacterOnlineID(short onlineID)`

  `void`

  `setContainer(ItemContainer container)`

  `void`

  `setCrawling(boolean crawling)`

  `void`

  `setDeathTime(float worldAgeHours)`

  `void`

  `setDoRender(boolean doRender)`

  Set this Renderable's visible flag.

  `void`

  `setFakeDead(boolean fakeDead)`

  `void`

  `setFallOnFront(boolean fallOnFront)`

  `void`

  `setForwardDirection(float directionX,
  float directionY)`

  `void`

  `setForwardDirectionAngle(float angle)`

  `void`

  `setInvalidateNextRender(boolean invalidate)`

  `void`

  `setKilledBy(IsoGameCharacter killedBy)`

  `void`

  `setKilledByFall(boolean killedByFall)`

  `void`

  `setOnHook(boolean value)`

  `void`

  `setPrimaryHandItem(InventoryItem item)`

  `void`

  `setReanimateTime(float hours)`

  `void`

  `setSecondaryHandItem(InventoryItem item)`

  `void`

  `setWornItems(WornItems other)`

  `void`

  `softReset()`

  `String`

  `toString()`

  `void`

  `update()`

  `private void`

  `updateAnimalRotting(float worldAge,
  float hoursPerRotStage)`

  `static void`

  `updateBodies()`

  `private void`

  `updateContainerWithHandItems()`

  `private boolean`

  `updateFakeDead()`

  `private void`

  `updateRotting(float worldAge,
  float hoursPerRotStage)`

  `void`

  `writeInventory(zombie.core.network.ByteBufferWriter b)`

  ### Methods inherited from class [IsoMovingObject](../IsoMovingObject.html#method-summary "class in zombie.iso")

  `closeAnimationRecorder, collideWith, compareToY, Despawn, DistTo, DistTo, distToNearestCamCharacter, DistToProper, DistToSquared, DistToSquared, DoCollideNorS, DoCollideWorE, doStairs, doTreeNoises, ensureOnTile, findCurrentGridSquare, getAnimationRecorder, getBuilding, getBumpedType, getClosestObject, getClosestStaticMovingObjectInNearbySquares, getCollidedObject, getCollideType, getCurrentBuilding, getCurrentSimulationLevel, getCurrentSquare, getCurrentZone, getDescription, getDistanceSq, getEatingZombies, getFacingPosition, getFeelersize, getFeelerTile, getFuturWalkedSquare, getGlobalMovementMod, getGlobalMovementMod, getHitDir, getHitForce, getHitFromAngle, getID, getIDCount, getImpulsex, getImpulsey, getLastCollideTime, getLastSquare, getLastTargettedBy, getLastX, getLastY, getLastZ, getLimpulsex, getLimpulsey, getMasterRegion, getMinimumSimulationLevel, getMovementLastFrame, getMovingSquare, getNextX, getNextXi, getNextY, getNextYi, getNoDamage, getPathFindIndex, getPosition, getPosition, getPosition, getScreenX, getScreenY, getSquare, getStateEventDelayTimer, getSurroundingThumpers, getThumpTarget, getTimeSinceZombieAttack, getUID, getVectorFromDirection, getVectorFromDirection, getWeight, getWidth, getX, getY, getZ, Hit, isAnimationRecorderActive, isbAltCollide, isCharacter, isCloseKilled, isCollidable, isCollided, isCollidedE, isCollidedN, isCollidedS, isCollidedThisFrame, isCollidedW, isCollidedWithDoor, isCollidedWithVehicle, isDestroyed, isEatingOther, isExistInTheWorld, isFirstUpdate, isGettingUp, isOnFloor, isProne, isPushableForSeparate, isPushedByForSeparate, isShootable, isSolid, isSolidForSeparate, isStanding, isWithinRange, moveUnmodded, moveUnmoddedInternal, onMouseRightClick, postupdate, preupdate, removeFromSquare, separate, setAnimRecorderActive, setbAltCollide, setCloseKilled, setCollidable, setCollidedE, setCollidedN, setCollidedObject, setCollidedS, setCollidedThisFrame, setCollidedW, setCollidedWithDoor, setCollideType, setCurrent, setCurrentSimulationLevel, setCurrentSquare, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setCurrentSquareFromPosition, setDestroyed, setEatingZombies, setFeelersize, setFirstUpdate, setForceX, setForceY, setHitDir, setHitForce, setHitFromAngle, setIDCount, setImpulsex, setImpulsey, setLast, setLastCollideTime, setLastTargettedBy, setLastX, setLastY, setLastZ, setLimpulsex, setLimpulsey, setMovementLastFrame, setMovingSquare, setMovingSquareNow, setNextX, setNextY, setNoDamage, setOnFloor, setPathFindIndex, setPosition, setPosition, setPosition, setShootable, setSolid, setStateEventDelayTimer, setThumpTarget, setTimeSinceZombieAttack, setWeight, setWidth, setX, setY, setZ, shouldAnimRecorderBeActive, shouldIgnoreCollisionWithSquare, shouldSlideHeadAwayFromWalls, shouldSnapZToCurrentSquare, slideAwayFromWalls, slideAwayToCollisionPos, slideHeadAwayFromWalls, snapZToCurrentSquare, snapZToCurrentSquareExact, spotted, updateAnimation`

  ### Methods inherited from class [IsoObject](../IsoObject.html#method-summary "class in zombie.iso")

  `addAttachedAnimSprite, addAttachedAnimSpriteByName, addAttachedAnimSpriteInstance, addChild, addFluid, addItemsFromProperties, addItemToObjectSurface, addItemToObjectSurface, addItemToObjectSurface, addLightSourceToWorld, addObjectAmbientEmitter, addSecondaryContainer, addSheetRope, afterRotated, AttachAnim, AttachAnim, AttachExistingAnim, AttachExistingAnim, AttackObject, canAddSheetRope, canTransferFluidFrom, canTransferFluidTo, checkAmbientSound, checkHaveElectricity, checkLightSourceActive, checkMoveWithWind, checkMoveWithWind, checkObjectPowered, cleanWallBlood, clearAttachedAnimSprite, clearOnOverlay, couldBePoweredByGenerator, countAddSheetRope, createContainersFromSpriteProperties, createFluidContainersFromSpriteProperties, customHashCode, Damage, debugPrintout, destroyFence, DirtySlice, doFindExternalWaterSource, DoSpecialTooltip, DoTooltip, dumpContentsInSquare, emptyFluid, factoryClassFromFileInput, factoryFromFileInput, factoryFromFileInput, factoryFromFileInput_OLD, factoryGetClassID, FindExternalWaterSource, FindExternalWaterSource, FindExternalWaterSource, FindWaterSourceOnSquare, flagForHotSave, getAlpha, getAlpha, getAlphaUpdateRateDiv, getAlphaUpdateRateMul, getAttachedAnimSprite, getAttachedAnimSpriteCount, getCell, getChildSprites, getChunk, getClosestSpriteGridObject, getContainer, getContainerByEitherType, getContainerByIndex, getContainerByType, getContainerClickedOn, getContainerCount, getContainerIndex, getContainers, getCurrentFrameTex, getCustomColor, getDamage, getDir, getDoRender, getECSComponentMap, getEntityNetID, getFacing, getFacingPositionAlt, getFactoryVehicle, getFasciaAttachedSquare, getFluidAmount, getFluidCapacity, getFluidUiName, getForwardIsoDirection, getForwardMovementIsoDirection, getGameEntityType, getGeneratorPowerConsumption, getHighlightColor, getHighlightColor, getIsSurfaceNormalOffset, getItemContainer, getKeyId, getLastRendered, getLastRenderedRendered, getLightSource, getMaskClickedY, getMasterObject, getModData, getMovingObjectIndex, getName, getNew, getNew, getObjectIndex, getObjectRenderEffects, getObjectRenderEffectsToApply, getOffsetX, getOffsetY, getOnOverlay, getOutlineHighlightCol, getOutlineThickness, getOverlaySprite, getOverlaySpriteColor, getPipedFuelAmount, getPrimaryFluid, getProperties, getProperty, getProperty, getRenderEffectMaster, getRenderEffectObjectByIndex, getRenderEffectObjectCount, getRenderInfo, getRenderYOffset, getRerouteCollide, getRerouteMask, getRerouteMaskObject, getScriptName, getSpecialObjectIndex, getSprite, getSpriteGrid, getSpriteGridObjects, getSpriteGridObjects, getSpriteGridObjectsExcludingSelf, getSpriteGridObjectsIncludingSelf, getSpriteModel, getSpriteName, getStaticMovingObjectIndex, getStressModFromThumping, getSurfaceNormalOffset, getSurfaceOffset, getSurfaceOffsetNoTable, getTable, getTargetAlpha, getTargetAlpha, getTextureName, getThumpableFor, getThumpableFor, getThumpCondition, getTile, getTileName, getType, getUsesExternalWaterSource, GetVehicleSlowFactor, getWindRenderEffects, getWorldObjectIndex, handleBurning, hasAdjacentCanStandSquare, hasAnimatedAttachments, hasAttachedAnimSprites, hasExternalWaterSource, hasFluid, hasGridPower, hasModData, hasObjectAmbientEmitter, hasOverlaySprite, hasPropaneTank, hasProperty, hasProperty, hasProperty, hasSpriteGrid, HasTooltip, hasWater, haveSheetRope, haveSpecialTooltip, Hit, HitByVehicle, invalidateRenderChunkLevel, invalidateVispolyChunkLevel, isAlphaAndTargetZero, isAlphaAndTargetZero, isAlphaZero, isAlphaZero, isAnimating, isAttachedAnimSprite, isAttachedOrOverlaySprite, isBlink, isBlink, isBush, isCanPath, isConnectedSpriteGridObject, isEntityValid, isFascia, isFireInteractionObject, isFloor, isFluidInputLocked, isFurnitureOccupied, isGenericCraftingSurface, isGrass, isGrassLike, isGrave, isHighlighted, isHighlighted, isHighlightRenderOnce, isHighlightRenderOnce, isHoppable, isItemAllowedInContainer, isLit, isMaskClicked, isMaskClicked, isMovedThumpable, isNoPicking, isNorthBlocked, isNorthHoppable, isObjectNoContainerOrEmpty, isOnScreen, isOre, isOres, isOutlineHighlight, isOutlineHighlight, isOutlineHlAttached, isOutlineHlAttached, isOutlineHlBlink, isOutlineHlBlink, isOutlineOnMouseover, isPropaneBBQ, isRemoveItemAllowedFromContainer, isSatChair, isSceneCulled, isSpriteInvisible, isStairsNorth, isStairsObject, isStairsWest, isStump, isTableSurface, isTableTopObject, isTaintedWater, isTallHoppable, isTargetAlphaZero, isTent, isUpdateAlphaDuringRender, isUpdateAlphaEnabled, isUseSnowSprite, isWall, isWallN, isWallSE, isWallW, isWindow, load, loadFromRemoteBuffer, loadFromRemoteBuffer, loadState, moveFluidToTemporaryContainer, onAnimationFinished, onMouseLeftClick, onMouseRightReleased, propertyEquals, propertyEqualsIgnoreCase, removeAllContainers, RemoveAttachedAnim, RemoveAttachedAnims, removeFromWorldToMeta, removeLightSourceFromWorld, removeRenderEffect, removeSheetRope, renderAnimatedAttachments, renderAttachedAndOverlaySprites, renderFloorTile, renderFxMask, renderModel, renderWallTile, renderWallTileDepth, renderWallTileOnly, replaceItem, reset, reuseGridSquare, save, saveState, sendObjectChange, sendObjectChange, sendObjectChange, Serialize, setAlpha, setAlpha, setAlphaAndTarget, setAlphaAndTarget, setAlphaToTarget, setAnimating, setAttachedAnimSprite, setBlink, setBlink, setChildSprites, setCustomColor, setCustomColor, setDamage, setDir, setExplored, setForwardIsoDirection, setForwardIsoDirection, setHighlightColor, setHighlightColor, setHighlightColor, setHighlightColor, setHighlighted, setHighlighted, setHighlighted, setHighlighted, setHighlightRenderOnce, setHighlightRenderOnce, setKeyId, setLastRendered, setLastRenderedRendered, setLightSource, setLit, setModData, setMovedThumpable, setName, SetName, setNoPicking, setOffsetX, setOffsetY, setOnOverlay, setOutlineHighlight, setOutlineHighlight, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHighlightCol, setOutlineHlAttached, setOutlineHlAttached, setOutlineHlBlink, setOutlineHlBlink, setOutlineOnMouseover, setOutlineThickness, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySprite, setOverlaySpriteColor, setPipedFuelAmount, setRenderEffect, setRenderEffect, setRenderYOffset, setRerouteCollide, setRerouteMask, setSatChair, setSceneCulled, setSpecialTooltip, setSprite, setSprite, setSpriteFromName, setSpriteModelName, setSquare, setTable, setTargetAlpha, setTargetAlpha, setTile, setType, setUsesExternalWaterSource, shouldLightSourceBeActive, shouldShowOnOverlay, spawnItemToObjectSurface, spawnItemToObjectSurface, spawnItemToObjectSurface, sync, sync, syncFluidContainerReceive, syncFluidContainerSend, syncIsoObject, syncIsoObjectReceive, syncIsoObjectSend, TestCollide, TestPathfindCollide, TestVision, Thump, transferFluidFrom, transferFluidTo, transmitCompleteItemToClients, transmitCustomColorToClients, transmitModData, transmitUpdatedSprite, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToClients, transmitUpdatedSpriteToServer, turnOn, UnCollision, unsetOutlineHighlight, updateAlpha, updateAlpha, updateAlpha, updateRenderInfoForObjectPicker, useFluid, useItemOn, WeaponHit, writeToRemoteBuffer`

  ### Methods inherited from class [GameEntity](../../entity/GameEntity.html#method-summary "class in zombie.entity")

  `attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, renderlastComponents, requiresEntitySave, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface zombie.characters.ecs.ECSEntity

  `frameStep, getECSComponent, getFrameNo, hasECSComponent, hasECSComponent, onGameLoadingStateEnter, onInGameStateEnter, registerECSComponents, removeECSComponent, removeECSComponent, setECSComponent, tryGetECSComponent, visitAllComponents, visitAllComponents`

  ### Methods inherited from interface zombie.core.skinnedmodel.IGrappleable

  `getID, getPosition, getPosition, isMoving, setDoGrappleLetGo, setGrappleDeferredOffset, setGrappleDeferredOffset, setPosition, setPosition, setTargetGrapplePos, setTargetGrapplePos, setTargetGrappleRotation`

  ### Methods inherited from interface zombie.core.skinnedmodel.IGrappleableWrapper

  `AcceptGrapple, canBeGrappled, getBearingFromGrappledTarget, getBearingToGrappledTarget, getGrappledBy, getGrappledByString, getGrappledByType, getGrappleOffset, getGrappleOffset, getGrappleOffsetBehaviour, getGrapplePosOffsetForward, getGrappleResult, getGrappleRotOffsetYaw, getGrapplingTarget, getSharedGrappleAnimFraction, getSharedGrappleAnimNode, getSharedGrappleAnimTime, getSharedGrappleType, getTargetGrapplePos, getTargetGrapplePos, getTargetGrappleRotation, GrapplerLetGo, isBeingGrappled, isBeingGrappledBy, isDoContinueGrapple, isDoGrapple, isGrappling, isGrapplingTarget, isOnFloor, isPerformingAnyGrappleAnimation, isPerformingGrappleGrabAnimation, LetGoOfGrappled, RejectGrapple, resetGrappleStateToDefault, setDoContinueGrapple, setDoGrapple, setGrappleDeferredOffset, setGrappleoffsetBehaviour, setGrapplePosOffsetForward, setGrappleResult, setGrappleRotOffsetYaw, setOnFloor, setPerformingGrappleGrabAnimation, setSharedGrappleAnimFraction, setSharedGrappleAnimNode, setSharedGrappleAnimTime, setSharedGrappleType, setTargetAndCurrentDirection, setTargetGrapplePos, setTargetGrappleRotation`

  ### Methods inherited from interface [ILuaIsoObject](../ILuaIsoObject.html#method-summary "interface in zombie.iso")

  `setDir`

  ### Methods inherited from interface zombie.network.fields.IPositional

  `getX, getY, getZ, isInRange`

  ### Methods inherited from interface zombie.iso.objects.interfaces.Thumpable

  `Thump`

* Field Details
  -------------

  + ### tempBodies

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.network.id.IIdentifiable> tempBodies
  + ### id

    private final zombie.network.id.ObjectID id
  + ### MAX\_ROT\_STAGES

    public static final int MAX\_ROT\_STAGES

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoDeadBody.MAX_ROT_STAGES)
  + ### MAX\_ROT\_STAGES\_ANIMALS

    public static final int MAX\_ROT\_STAGES\_ANIMALS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoDeadBody.MAX_ROT_STAGES_ANIMALS)
  + ### VISUAL\_TYPE\_HUMAN

    private static final int VISUAL\_TYPE\_HUMAN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoDeadBody.VISUAL_TYPE_HUMAN)
  + ### VISUAL\_TYPE\_ANIMAL

    private static final int VISUAL\_TYPE\_ANIMAL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoDeadBody.VISUAL_TYPE_ANIMAL)
  + ### ZOMBIE\_SKELETON\_WEIGHT

    private static final float ZOMBIE\_SKELETON\_WEIGHT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoDeadBody.ZOMBIE_SKELETON_WEIGHT)
  + ### female

    private boolean female
  + ### wasZombie

    private boolean wasZombie
  + ### fakeDead

    private boolean fakeDead
  + ### crawling

    private boolean crawling
  + ### speakColor

    private final [Color](../../core/Color.html "class in zombie.core") speakColor
  + ### speakTime

    private float speakTime
  + ### persistentOutfitId

    private int persistentOutfitId
  + ### desc

    private [SurvivorDesc](../../characters/SurvivorDesc.html "class in zombie.characters") desc
  + ### baseVisual

    private zombie.core.skinnedmodel.visual.BaseVisual baseVisual
  + ### animalType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType
  + ### animalSize

    private float animalSize
  + ### animalGenome

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[AnimalGene](../../characters/animals/AnimalGene.html "class in zombie.characters.animals")> animalGenome
  + ### animalGeneticDisorder

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> animalGeneticDisorder
  + ### wornItems

    private [WornItems](../../characters/WornItems/WornItems.html "class in zombie.characters.WornItems") wornItems
  + ### attachedItems

    private [AttachedItems](../../characters/AttachedItems/AttachedItems.html "class in zombie.characters.AttachedItems") attachedItems
  + ### deathTime

    private float deathTime
  + ### reanimateTime

    private float reanimateTime
  + ### player

    private [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player
  + ### fallOnFront

    private boolean fallOnFront
  + ### killedByFall

    private boolean killedByFall
  + ### wasSkeleton

    private boolean wasSkeleton
  + ### primaryHandItem

    private [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") primaryHandItem
  + ### secondaryHandItem

    private [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") secondaryHandItem
  + ### angle

    private float angle
  + ### forwardDirection

    private final [Vector2](../Vector2.html "class in zombie.iso") forwardDirection
  + ### zombieRotStageAtDeath

    private int zombieRotStageAtDeath
  + ### animalRotStageAtDeath

    private int animalRotStageAtDeath
  + ### characterOnlineId

    private short characterOnlineId
  + ### animalAnimSet

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalAnimSet
  + ### weight

    public float weight
  + ### corpseItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") corpseItem
  + ### customName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customName
  + ### invIcon

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIcon
  + ### shadowParams

    private final zombie.iso.objects.ShadowParams shadowParams
  + ### grappleable

    private final zombie.core.skinnedmodel.BaseGrappleable grappleable
  + ### ragdollFall

    public boolean ragdollFall
  + ### diedBoneTransforms

    private [TwistableBoneTransform](../../core/skinnedmodel/animation/TwistableBoneTransform.html "class in zombie.core.skinnedmodel.animation")[] diedBoneTransforms
  + ### animationPlayer

    public zombie.core.skinnedmodel.animation.AnimationPlayer animationPlayer
  + ### invalidateNextRender

    private boolean invalidateNextRender
  + ### rottenTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rottenTexture
  + ### skelInvIcon

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") skelInvIcon
  + ### isOnHook

    private boolean isOnHook
  + ### killedBy

    private [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") killedBy
  + ### createdCorpseItem

    private [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") createdCorpseItem
  + ### tempZombie

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[IsoZombie](../../characters/IsoZombie.html "class in zombie.characters")> tempZombie
  + ### inf

    private static final [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") inf
  + ### atlasTex

    private zombie.core.skinnedmodel.DeadBodyAtlas.BodyTexture atlasTex
  + ### dropShadow

    private static [Texture](../../core/textures/Texture.html "class in zombie.core.textures") dropShadow
  + ### HIT\_TEST\_WIDTH

    private static final float HIT\_TEST\_WIDTH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoDeadBody.HIT_TEST_WIDTH)
  + ### HIT\_TEST\_HEIGHT

    private static final float HIT\_TEST\_HEIGHT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoDeadBody.HIT_TEST_HEIGHT)
  + ### \_rotation

    private static final org.joml.Quaternionf \_rotation
  + ### \_transform

    private static final [Transform](../../core/physics/Transform.html "class in zombie.core.physics") \_transform
  + ### \_UNIT\_Z

    private static final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") \_UNIT\_Z
  + ### \_tempVec3f\_1

    private static final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") \_tempVec3f\_1
  + ### \_tempVec3f\_2

    private static final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") \_tempVec3f\_2
  + ### burnTimer

    private float burnTimer
  + ### speaking

    public boolean speaking
  + ### sayLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sayLine
* Constructor Details
  -------------------

  + ### IsoDeadBody

    public IsoDeadBody([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") died)
  + ### IsoDeadBody

    public IsoDeadBody([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") died,
    boolean wasCorpseAlready)
  + ### IsoDeadBody

    public IsoDeadBody([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") died,
    boolean wasCorpseAlready,
    boolean bAddToSquareAndWorld)
  + ### IsoDeadBody

    public IsoDeadBody([IsoCell](../IsoCell.html "class in zombie.iso") cell)
* Method Details
  --------------

  + ### getObjectID

    public zombie.network.id.ObjectID getObjectID()

    Specified by:
    :   `getObjectID` in interface `zombie.network.id.IIdentifiable`
  + ### getObjectIDAsLong

    public long getObjectIDAsLong()
  + ### isDead

    public static boolean isDead(short characterOnlineID)
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()

    Overrides:
    :   `getObjectName` in class `IsoMovingObject`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `IsoMovingObject`
  + ### getVisual

    public zombie.core.skinnedmodel.visual.BaseVisual getVisual()
  + ### getHumanVisual

    public [HumanVisual](../../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") getHumanVisual()

    Specified by:
    :   `getHumanVisual` in interface `IHumanVisual`
  + ### getAnimalVisual

    public [AnimalVisual](../../core/skinnedmodel/visual/AnimalVisual.html "class in zombie.core.skinnedmodel.visual") getAnimalVisual()

    Specified by:
    :   `getAnimalVisual` in interface `IAnimalVisual`
  + ### getAnimalType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalType()

    Specified by:
    :   `getAnimalType` in interface `IAnimalVisual`
  + ### getAnimalSize

    public float getAnimalSize()

    Specified by:
    :   `getAnimalSize` in interface `IAnimalVisual`
  + ### getAnimalGenome

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[AnimalGene](../../characters/animals/AnimalGene.html "class in zombie.characters.animals")> getAnimalGenome()
  + ### getAnimalGeneticDisorder

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAnimalGeneticDisorder()
  + ### getItemVisuals

    public void getItemVisuals([ItemVisuals](../../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)

    Specified by:
    :   `getItemVisuals` in interface `IHumanVisual`
  + ### isFemale

    public boolean isFemale()

    Specified by:
    :   `isFemale` in interface `IHumanVisual`
  + ### isZombie

    public boolean isZombie()

    Specified by:
    :   `isZombie` in interface `IHumanVisual`

    Overrides:
    :   `isZombie` in class `IsoObject`
  + ### isCrawling

    public boolean isCrawling()

    Overrides:
    :   `isCrawling` in class `IsoMovingObject`
  + ### setCrawling

    public void setCrawling(boolean crawling)
  + ### isFakeDead

    public boolean isFakeDead()
  + ### setFakeDead

    public void setFakeDead(boolean fakeDead)
  + ### isSkeleton

    public boolean isSkeleton()

    Specified by:
    :   `isSkeleton` in interface `IHumanVisual`
  + ### setWornItems

    public void setWornItems([WornItems](../../characters/WornItems/WornItems.html "class in zombie.characters.WornItems") other)
  + ### getWornItems

    public [WornItems](../../characters/WornItems/WornItems.html "class in zombie.characters.WornItems") getWornItems()
  + ### setAttachedItems

    public void setAttachedItems([AttachedItems](../../characters/AttachedItems/AttachedItems.html "class in zombie.characters.AttachedItems") other)
  + ### getAttachedItems

    public [AttachedItems](../../characters/AttachedItems/AttachedItems.html "class in zombie.characters.AttachedItems") getAttachedItems()
  + ### isEquipped

    public boolean isEquipped([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isEquippedClothing

    public boolean isEquippedClothing([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isAttachedItem

    public boolean isAttachedItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isHandItem

    public boolean isHandItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isPrimaryHandItem

    public boolean isPrimaryHandItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isSecondaryHandItem

    public boolean isSecondaryHandItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getInventoryWeight

    public float getInventoryWeight()
  + ### getItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getItem()

    Specified by:
    :   `getItem` in interface `zombie.iso.IItemProvider`
  + ### getCorpseItemType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCorpseItemType()
  + ### getInitialItemAge

    public float getInitialItemAge([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getDeathTime

    public float getDeathTime()
  + ### setDeathTime

    public void setDeathTime(float worldAgeHours)
  + ### getDeadAnimalIcon

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDeadAnimalIcon([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") dead)
  + ### loadSprite

    private [IsoSprite](../sprite/IsoSprite.html "class in zombie.iso.sprite") loadSprite([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `IsoMovingObject`

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `IsoMovingObject`

    Throws:
    :   `IOException`
  + ### saveAnimalGenetics

    private void saveAnimalGenetics([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadAnimalGenetics

    private void loadAnimalGenetics([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### softReset

    public void softReset()

    Overrides:
    :   `softReset` in class `IsoObject`
  + ### saveChange

    public void saveChange([IsoObjectChange](../../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    se.krka.kahlua.vm.KahluaTable tbl,
    zombie.core.network.ByteBufferWriter bb)

    Overrides:
    :   `saveChange` in class `IsoObject`
  + ### loadChange

    public void loadChange([IsoObjectChange](../../core/properties/IsoObjectChange.html "enum class in zombie.core.properties") change,
    zombie.core.network.ByteBufferReader bb)

    Overrides:
    :   `loadChange` in class `IsoObject`
  + ### renderlast

    public void renderlast()

    Overrides:
    :   `renderlast` in class `IsoMovingObject`
  + ### getAtlasTexture

    public zombie.core.skinnedmodel.DeadBodyAtlas.BodyTexture getAtlasTexture()
  + ### render

    public void render(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") col,
    boolean bDoChild,
    boolean bWallLightingPass,
    zombie.core.opengl.Shader shader)

    Description copied from interface: `zombie.iso.IsoRenderable`

    Attempt to render this Renderable.   
    It will not draw if isSceneCulled == TRUE,   
    or if isDoRender == FALSE

    Specified by:
    :   `render` in interface `zombie.iso.IsoRenderable`

    Overrides:
    :   `render` in class `IsoObject`
  + ### renderShadow

    public void renderShadow()
  + ### renderShadow

    public static void renderShadow(float x,
    float y,
    float z,
    [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") forward,
    float w,
    float fm,
    float bm,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo,
    float alpha)
  + ### renderShadow

    public static void renderShadow(float x,
    float y,
    float z,
    [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") forward,
    float w,
    float fm,
    float bm,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo,
    float alpha,
    boolean isAnimal)
  + ### getShadowParams

    public zombie.iso.objects.ShadowParams getShadowParams()
  + ### renderObjectPicker

    public void renderObjectPicker(float x,
    float y,
    float z,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo)

    Overrides:
    :   `renderObjectPicker` in class `IsoObject`
  + ### isMouseOver

    public boolean isMouseOver(float screenX,
    float screenY)
  + ### getGrabHeadPosition

    public [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") getGrabHeadPosition([Vector2f](../../../org/joml/Vector2f.html "class in org.joml") out)
  + ### getGrabLegsPosition

    public [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") getGrabLegsPosition([Vector2f](../../../org/joml/Vector2f.html "class in org.joml") out)
  + ### Burn

    public void Burn()
  + ### setContainer

    public void setContainer([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container)

    Overrides:
    :   `setContainer` in class `IsoObject`
  + ### checkClothing

    public void checkClothing([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") removedItem)
  + ### IsSpeaking

    public boolean IsSpeaking()

    Specified by:
    :   `IsSpeaking` in interface `zombie.characters.Talker`
  + ### Say

    public void Say([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)

    Specified by:
    :   `Say` in interface `zombie.characters.Talker`
  + ### getSayLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSayLine()

    Specified by:
    :   `getSayLine` in interface `zombie.characters.Talker`
  + ### getTalkerType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTalkerType()

    Specified by:
    :   `getTalkerType` in interface `zombie.characters.Talker`
  + ### addToWorld

    public void addToWorld()

    Overrides:
    :   `addToWorld` in class `IsoObject`
  + ### removeFromWorld

    public void removeFromWorld()

    Description copied from class: `GameEntity`

    Remove Object from world, no entity to meta offloading.
    See removeFromWorld(boolean) for entity meta.

    Overrides:
    :   `removeFromWorld` in class `IsoMovingObject`
  + ### updateBodies

    public static void updateBodies()
  + ### changeRotStage

    public void changeRotStage(int newStage)
  + ### updateAnimalRotting

    private void updateAnimalRotting(float worldAge,
    float hoursPerRotStage)
  + ### updateRotting

    private void updateRotting(float worldAge,
    float hoursPerRotStage)
  + ### updateFakeDead

    private boolean updateFakeDead()
  + ### getFakeDeadWakeupHours

    private float getFakeDeadWakeupHours()
  + ### isPlayerNearby

    private boolean isPlayerNearby()
  + ### isPlayerNearby

    private boolean isPlayerNearby([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    boolean isCanSee)
  + ### getReanimateTime

    public float getReanimateTime()
  + ### setReanimateTime

    public void setReanimateTime(float hours)
  + ### getReanimateDelay

    private float getReanimateDelay()
  + ### reanimateLater

    public void reanimateLater()
  + ### reanimateNow

    public void reanimateNow()
  + ### update

    public void update()

    Overrides:
    :   `update` in class `IsoMovingObject`
  + ### Grappled

    public void Grappled(zombie.core.skinnedmodel.IGrappleable grappler,
    [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    float grappleEffectiveness,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") grappleType)

    This character is determined that it is about to be grappled.

    Specified by:
    :   `Grappled` in interface `zombie.core.skinnedmodel.IGrappleable`

    Specified by:
    :   `Grappled` in interface `zombie.core.skinnedmodel.IGrappleableWrapper`
  + ### reanimateZombieForGrapple

    private [IsoZombie](../../characters/IsoZombie.html "class in zombie.characters") reanimateZombieForGrapple()
  + ### reanimate

    public [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") reanimate()
  + ### reanimateAnimal

    private [IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") reanimateAnimal()
  + ### Reset

    public static void Reset()
  + ### Collision

    public void Collision([Vector2](../Vector2.html "class in zombie.iso") collision,
    [IsoObject](../IsoObject.html "class in zombie.iso") object)

    Overrides:
    :   `Collision` in class `IsoObject`
  + ### isFallOnFront

    public boolean isFallOnFront()

    Specified by:
    :   `isFallOnFront` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### setFallOnFront

    public void setFallOnFront(boolean fallOnFront)

    Specified by:
    :   `setFallOnFront` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### isKilledByFall

    public boolean isKilledByFall()

    Specified by:
    :   `isKilledByFall` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### setKilledByFall

    public void setKilledByFall(boolean killedByFall)

    Specified by:
    :   `setKilledByFall` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### getPrimaryHandItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getPrimaryHandItem()
  + ### setPrimaryHandItem

    public void setPrimaryHandItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### updateContainerWithHandItems

    private void updateContainerWithHandItems()
  + ### getSecondaryHandItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") getSecondaryHandItem()
  + ### setSecondaryHandItem

    public void setSecondaryHandItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getAngle

    public float getAngle()
  + ### getOutfitName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOutfitName()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### readInventory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") readInventory([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") b)
  + ### getCharacterOnlineID

    public short getCharacterOnlineID()
  + ### setCharacterOnlineID

    public void setCharacterOnlineID(short onlineID)
  + ### isPlayer

    public boolean isPlayer()
  + ### removeDeadBody

    public static void removeDeadBody(zombie.network.id.ObjectID id)
  + ### getRenderSquare

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRenderSquare()

    Overrides:
    :   `getRenderSquare` in class `IsoObject`
  + ### renderDebugData

    public void renderDebugData()
  + ### isAnimal

    public boolean isAnimal()
  + ### getWeight

    public float getWeight()

    Overrides:
    :   `getWeight` in class `IsoMovingObject`
  + ### getCorpseItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCorpseItem()
  + ### getCustomName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomName()
  + ### setAnimalData

    public void setAnimalData([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") died)
  + ### getDescriptor

    public [SurvivorDesc](../../characters/SurvivorDesc.html "class in zombie.characters") getDescriptor()
  + ### getAnimForwardDirection

    public [Vector2](../Vector2.html "class in zombie.iso") getAnimForwardDirection([Vector2](../Vector2.html "class in zombie.iso") forwardDirection)

    Specified by:
    :   `getAnimForwardDirection` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### setForwardDirection

    public void setForwardDirection(float directionX,
    float directionY)

    Specified by:
    :   `setForwardDirection` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### isPerformingGrappleAnimation

    public boolean isPerformingGrappleAnimation()

    Specified by:
    :   `isPerformingGrappleAnimation` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### setForwardDirectionAngle

    public void setForwardDirectionAngle(float angle)
  + ### getAnimatable

    public zombie.core.skinnedmodel.advancedanimation.IAnimatable getAnimatable()

    Specified by:
    :   `getAnimatable` in interface `zombie.core.skinnedmodel.IGrappleable`
  + ### getWrappedGrappleable

    public zombie.core.skinnedmodel.IGrappleable getWrappedGrappleable()

    Specified by:
    :   `getWrappedGrappleable` in interface `zombie.core.skinnedmodel.IGrappleableWrapper`
  + ### getDiedBoneTransforms

    public [TwistableBoneTransform](../../core/skinnedmodel/animation/TwistableBoneTransform.html "class in zombie.core.skinnedmodel.animation")[] getDiedBoneTransforms()
  + ### getCarcassName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCarcassName()
  + ### getBreed

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBreed()
  + ### hasAnimalParts

    public boolean hasAnimalParts()
  + ### isAnimalSkeleton

    public boolean isAnimalSkeleton()
  + ### invalidateCorpse

    public void invalidateCorpse()
  + ### setInvalidateNextRender

    public void setInvalidateNextRender(boolean invalidate)
  + ### getInvIcon

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInvIcon()
  + ### getPickUpSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPickUpSound()
  + ### setOnHook

    public void setOnHook(boolean value)
  + ### isOnHook

    public boolean isOnHook()
  + ### getKilledBy

    public [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") getKilledBy()
  + ### setKilledBy

    public void setKilledBy([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") killedBy)
  + ### removeDeadBodies

    public static void removeDeadBodies(zombie.core.raknet.UdpConnection removeCorpsesConnection)
  + ### writeInventory

    public void writeInventory(zombie.core.network.ByteBufferWriter b)
  + ### becomeCorpseItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") becomeCorpseItem(boolean isRemote)
  + ### setDoRender

    public void setDoRender(boolean doRender)

    Description copied from interface: `zombie.iso.IsoRenderable`

    Set this Renderable's visible flag.   
    If FALSE, the render() function will not draw.   
      
    The Renderable may still get culled from the scene, but it will always attempt to draw.

    Specified by:
    :   `setDoRender` in interface `zombie.iso.IsoRenderable`

    Overrides:
    :   `setDoRender` in class `IsoObject`
  + ### canBeGrabbedFrom

    public boolean canBeGrabbedFrom(float x,
    float y)
  + ### canBeGrabbed

    public boolean canBeGrabbed()
  + ### canPickUpBodyFromSquare

    public static boolean canPickUpBodyFromSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") fromSquare,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") toSquare)