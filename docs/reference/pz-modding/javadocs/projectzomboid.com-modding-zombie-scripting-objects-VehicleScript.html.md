[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [VehicleScript](VehicleScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [fileName](#fileName)
   2. [name](#name)
   3. [models](#models)
   4. [attachments](#attachments)
   5. [mass](#mass)
   6. [centerOfMassOffset](#centerOfMassOffset)
   7. [engineForce](#engineForce)
   8. [engineIdleSpeed](#engineIdleSpeed)
   9. [steeringIncrement](#steeringIncrement)
   10. [steeringClamp](#steeringClamp)
   11. [steeringClampMax](#steeringClampMax)
   12. [wheelFriction](#wheelFriction)
   13. [stoppingMovementForce](#stoppingMovementForce)
   14. [animalTrailerSize](#animalTrailerSize)
   15. [suspensionStiffness](#suspensionStiffness)
   16. [suspensionDamping](#suspensionDamping)
   17. [suspensionCompression](#suspensionCompression)
   18. [suspensionRestLength](#suspensionRestLength)
   19. [maxSuspensionTravelCm](#maxSuspensionTravelCm)
   20. [rollInfluence](#rollInfluence)
   21. [extents](#extents)
   22. [shadowExtents](#shadowExtents)
   23. [shadowOffset](#shadowOffset)
   24. [hadShadowOExtents](#hadShadowOExtents)
   25. [hadShadowOffset](#hadShadowOffset)
   26. [extentsOffset](#extentsOffset)
   27. [physicsChassisShape](#physicsChassisShape)
   28. [physicsShapes](#physicsShapes)
   29. [wheels](#wheels)
   30. [crawlThroughWheels](#crawlThroughWheels)
   31. [passengers](#passengers)
   32. [maxSpeed](#maxSpeed)
   33. [useChassisPhysicsCollision](#useChassisPhysicsCollision)
   34. [maxSpeedReverse](#maxSpeedReverse)
   35. [isSmallVehicle](#isSmallVehicle)
   36. [frontEndHealth](#frontEndHealth)
   37. [rearEndHealth](#rearEndHealth)
   38. [storageCapacity](#storageCapacity)
   39. [engineLoudness](#engineLoudness)
   40. [engineQuality](#engineQuality)
   41. [seats](#seats)
   42. [mechanicType](#mechanicType)
   43. [engineRepairLevel](#engineRepairLevel)
   44. [playerDamageProtection](#playerDamageProtection)
   45. [forcedHue](#forcedHue)
   46. [forcedSat](#forcedSat)
   47. [forcedVal](#forcedVal)
   48. [leftSirenCol](#leftSirenCol)
   49. [rightSirenCol](#rightSirenCol)
   50. [engineRpmType](#engineRpmType)
   51. [offroadEfficiency](#offroadEfficiency)
   52. [crawlOffsets](#crawlOffsets)
   53. [zombieType](#zombieType)
   54. [specialKeyRing](#specialKeyRing)
   55. [notKillCrops](#notKillCrops)
   56. [hasLighter](#hasLighter)
   57. [carMechanicsOverlay](#carMechanicsOverlay)
   58. [carModelName](#carModelName)
   59. [specialLootChance](#specialLootChance)
   60. [specialKeyRingChance](#specialKeyRingChance)
   61. [neverSpawnKey](#neverSpawnKey)
   62. [gearRatioCount](#gearRatioCount)
   63. [gearRatio](#gearRatio)
   64. [textures](#textures)
   65. [skins](#skins)
   66. [areas](#areas)
   67. [parts](#parts)
   68. [hasSiren](#hasSiren)
   69. [lightbar](#lightbar)
   70. [sound](#sound)
   71. [textureMaskEnable](#textureMaskEnable)
   72. [PHYSICS\_SHAPE\_BOX](#PHYSICS_SHAPE_BOX)
   73. [PHYSICS\_SHAPE\_SPHERE](#PHYSICS_SHAPE_SPHERE)
   74. [PHYSICS\_SHAPE\_MESH](#PHYSICS_SHAPE_MESH)
7. [Constructor Details](#constructor-detail)
   1. [VehicleScript()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [InitLoadPP(String)](#InitLoadPP(java.lang.String))
   2. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   3. [getFileName()](#getFileName())
   4. [Loaded()](#Loaded())
   5. [compact()](#compact())
   6. [toBullet()](#toBullet())
   7. [LoadVector2f(String, Vector2f)](#LoadVector2f(java.lang.String,org.joml.Vector2f))
   8. [LoadVector3f(String, Vector3f)](#LoadVector3f(java.lang.String,org.joml.Vector3f))
   9. [LoadVector4f(String, Vector4f)](#LoadVector4f(java.lang.String,org.joml.Vector4f))
   10. [LoadVector2i(String, Vector2i)](#LoadVector2i(java.lang.String,org.joml.Vector2i))
   11. [LoadAttachment(ScriptParser.Block)](#LoadAttachment(zombie.scripting.ScriptParser.Block))
   12. [LoadModel(ScriptParser.Block, ArrayList)](#LoadModel(zombie.scripting.ScriptParser.Block,java.util.ArrayList))
   13. [LoadSkin(ScriptParser.Block)](#LoadSkin(zombie.scripting.ScriptParser.Block))
   14. [LoadWheel(ScriptParser.Block, boolean)](#LoadWheel(zombie.scripting.ScriptParser.Block,boolean))
   15. [LoadPassenger(ScriptParser.Block)](#LoadPassenger(zombie.scripting.ScriptParser.Block))
   16. [LoadAnim(ScriptParser.Block, ArrayList)](#LoadAnim(zombie.scripting.ScriptParser.Block,java.util.ArrayList))
   17. [LoadPassengerSwitchSeat(ScriptParser.Block, VehicleScript.Passenger)](#LoadPassengerSwitchSeat(zombie.scripting.ScriptParser.Block,zombie.scripting.objects.VehicleScript.Passenger))
   18. [LoadArea(ScriptParser.Block)](#LoadArea(zombie.scripting.ScriptParser.Block))
   19. [LoadPart(ScriptParser.Block)](#LoadPart(zombie.scripting.ScriptParser.Block))
   20. [LoadPhysicsShape(ScriptParser.Block)](#LoadPhysicsShape(zombie.scripting.ScriptParser.Block))
   21. [LoadDoor(ScriptParser.Block)](#LoadDoor(zombie.scripting.ScriptParser.Block))
   22. [LoadWindow(ScriptParser.Block)](#LoadWindow(zombie.scripting.ScriptParser.Block))
   23. [LoadContainer(ScriptParser.Block, VehicleScript.Container)](#LoadContainer(zombie.scripting.ScriptParser.Block,zombie.scripting.objects.VehicleScript.Container))
   24. [LoadLuaFunctions(ScriptParser.Block)](#LoadLuaFunctions(zombie.scripting.ScriptParser.Block))
   25. [checkIntegerKey(Object)](#checkIntegerKey(java.lang.Object))
   26. [LoadTable(ScriptParser.Block, KahluaTable)](#LoadTable(zombie.scripting.ScriptParser.Block,se.krka.kahlua.vm.KahluaTable))
   27. [LoadTemplate(String)](#LoadTemplate(java.lang.String))
   28. [copyAreasFrom(VehicleScript, String)](#copyAreasFrom(zombie.scripting.objects.VehicleScript,java.lang.String))
   29. [copyPartsFrom(VehicleScript, String)](#copyPartsFrom(zombie.scripting.objects.VehicleScript,java.lang.String))
   30. [copyPhysicsFrom(VehicleScript, String)](#copyPhysicsFrom(zombie.scripting.objects.VehicleScript,java.lang.String))
   31. [copyPassengersFrom(VehicleScript, String)](#copyPassengersFrom(zombie.scripting.objects.VehicleScript,java.lang.String))
   32. [copySoundFrom(VehicleScript, String)](#copySoundFrom(zombie.scripting.objects.VehicleScript,java.lang.String))
   33. [copyWheelsFrom(VehicleScript, String)](#copyWheelsFrom(zombie.scripting.objects.VehicleScript,java.lang.String))
   34. [LoadPosition(ScriptParser.Block, ArrayList)](#LoadPosition(zombie.scripting.ScriptParser.Block,java.util.ArrayList))
   35. [initCrawlOffsets()](#initCrawlOffsets())
   36. [initCrawlOffsets(VehicleScript.Wheel)](#initCrawlOffsets(zombie.scripting.objects.VehicleScript.Wheel))
   37. [isOverlappingWheel(float)](#isOverlappingWheel(float))
   38. [getName()](#getName())
   39. [getFullName()](#getFullName())
   40. [getFullType()](#getFullType())
   41. [getModel()](#getModel())
   42. [getModelOffset()](#getModelOffset())
   43. [getModelScale()](#getModelScale())
   44. [setModelScale(float)](#setModelScale(float))
   45. [getModelCount()](#getModelCount())
   46. [getModelByIndex(int)](#getModelByIndex(int))
   47. [getModelById(String, ArrayList)](#getModelById(java.lang.String,java.util.ArrayList))
   48. [getModelById(String)](#getModelById(java.lang.String))
   49. [getAttachmentCount()](#getAttachmentCount())
   50. [getAttachment(int)](#getAttachment(int))
   51. [getAttachmentById(String)](#getAttachmentById(java.lang.String))
   52. [addAttachment(ModelAttachment)](#addAttachment(zombie.scripting.objects.ModelAttachment))
   53. [removeAttachment(ModelAttachment)](#removeAttachment(zombie.scripting.objects.ModelAttachment))
   54. [addAttachmentAt(int, ModelAttachment)](#addAttachmentAt(int,zombie.scripting.objects.ModelAttachment))
   55. [removeAttachment(int)](#removeAttachment(int))
   56. [beforeRenameAttachment(ModelAttachment)](#beforeRenameAttachment(zombie.scripting.objects.ModelAttachment))
   57. [afterRenameAttachment(ModelAttachment)](#afterRenameAttachment(zombie.scripting.objects.ModelAttachment))
   58. [getLightbar()](#getLightbar())
   59. [getSounds()](#getSounds())
   60. [getHasSiren()](#getHasSiren())
   61. [getExtents()](#getExtents())
   62. [getPhysicsChassisShape()](#getPhysicsChassisShape())
   63. [hasPhysicsChassisShape()](#hasPhysicsChassisShape())
   64. [useChassisPhysicsCollision()](#useChassisPhysicsCollision())
   65. [getShadowExtents()](#getShadowExtents())
   66. [getShadowOffset()](#getShadowOffset())
   67. [getExtentsOffset()](#getExtentsOffset())
   68. [getMass()](#getMass())
   69. [getCenterOfMassOffset()](#getCenterOfMassOffset())
   70. [getEngineForce()](#getEngineForce())
   71. [getEngineIdleSpeed()](#getEngineIdleSpeed())
   72. [getEngineQuality()](#getEngineQuality())
   73. [getEngineLoudness()](#getEngineLoudness())
   74. [getRollInfluence()](#getRollInfluence())
   75. [getSteeringIncrement()](#getSteeringIncrement())
   76. [getSteeringClamp(float)](#getSteeringClamp(float))
   77. [getSuspensionStiffness()](#getSuspensionStiffness())
   78. [getSuspensionDamping()](#getSuspensionDamping())
   79. [getSuspensionCompression()](#getSuspensionCompression())
   80. [getSuspensionRestLength()](#getSuspensionRestLength())
   81. [getSuspensionTravel()](#getSuspensionTravel())
   82. [getWheelFriction()](#getWheelFriction())
   83. [getWheelCount()](#getWheelCount())
   84. [getCrawlThroughWheel()](#getCrawlThroughWheel())
   85. [getWheel(int)](#getWheel(int))
   86. [getCrawlThroughWheel(int)](#getCrawlThroughWheel(int))
   87. [getWheelById(String)](#getWheelById(java.lang.String))
   88. [getIndexOfWheelById(String)](#getIndexOfWheelById(java.lang.String))
   89. [getPassengerCount()](#getPassengerCount())
   90. [getPassenger(int)](#getPassenger(int))
   91. [getPassengerById(String)](#getPassengerById(java.lang.String))
   92. [getPassengerIndex(String)](#getPassengerIndex(java.lang.String))
   93. [getPhysicsShapeCount()](#getPhysicsShapeCount())
   94. [getPhysicsShape(int)](#getPhysicsShape(int))
   95. [addPhysicsShape(String)](#addPhysicsShape(java.lang.String))
   96. [removePhysicsShape(int)](#removePhysicsShape(int))
   97. [getFrontEndHealth()](#getFrontEndHealth())
   98. [getRearEndHealth()](#getRearEndHealth())
   99. [getStorageCapacity()](#getStorageCapacity())
   100. [getTextures()](#getTextures())
   101. [getSkinCount()](#getSkinCount())
   102. [getSkin(int)](#getSkin(int))
   103. [getAreaCount()](#getAreaCount())
   104. [getArea(int)](#getArea(int))
   105. [getAreaById(String)](#getAreaById(java.lang.String))
   106. [getIndexOfAreaById(String)](#getIndexOfAreaById(java.lang.String))
   107. [getPartCount()](#getPartCount())
   108. [getPart(int)](#getPart(int))
   109. [getPartById(String)](#getPartById(java.lang.String))
   110. [getIndexOfPartById(String)](#getIndexOfPartById(java.lang.String))
   111. [getAnimationById(String, ArrayList)](#getAnimationById(java.lang.String,java.util.ArrayList))
   112. [getPositionById(String, ArrayList)](#getPositionById(java.lang.String,java.util.ArrayList))
   113. [globMatch(String, String)](#globMatch(java.lang.String,java.lang.String))
   114. [getGearRatioCount()](#getGearRatioCount())
   115. [getSeats()](#getSeats())
   116. [setSeats(int)](#setSeats(int))
   117. [getMechanicType()](#getMechanicType())
   118. [setMechanicType(int)](#setMechanicType(int))
   119. [getEngineRepairLevel()](#getEngineRepairLevel())
   120. [getHeadlightConfigLevel()](#getHeadlightConfigLevel())
   121. [setEngineRepairLevel(int)](#setEngineRepairLevel(int))
   122. [getPlayerDamageProtection()](#getPlayerDamageProtection())
   123. [setPlayerDamageProtection(float)](#setPlayerDamageProtection(float))
   124. [getForcedHue()](#getForcedHue())
   125. [setForcedHue(float)](#setForcedHue(float))
   126. [getForcedSat()](#getForcedSat())
   127. [setForcedSat(float)](#setForcedSat(float))
   128. [getForcedVal()](#getForcedVal())
   129. [setForcedVal(float)](#setForcedVal(float))
   130. [getEngineRPMType()](#getEngineRPMType())
   131. [setEngineRPMType(String)](#setEngineRPMType(java.lang.String))
   132. [getOffroadEfficiency()](#getOffroadEfficiency())
   133. [setOffroadEfficiency(float)](#setOffroadEfficiency(float))
   134. [getCrawlOffsets()](#getCrawlOffsets())
   135. [getAnimalTrailerSize()](#getAnimalTrailerSize())
   136. [getZombieType()](#getZombieType())
   137. [getSpecialKeyRing()](#getSpecialKeyRing())
   138. [getRandomZombieType()](#getRandomZombieType())
   139. [getRandomSpecialKeyRing()](#getRandomSpecialKeyRing())
   140. [hasSpecialKeyRing()](#hasSpecialKeyRing())
   141. [getFirstZombieType()](#getFirstZombieType())
   142. [hasZombieType(String)](#hasZombieType(java.lang.String))
   143. [notKillCrops()](#notKillCrops())
   144. [hasLighter()](#hasLighter())
   145. [getCarMechanicsOverlay()](#getCarMechanicsOverlay())
   146. [setCarMechanicsOverlay(String)](#setCarMechanicsOverlay(java.lang.String))
   147. [getCarModelName()](#getCarModelName())
   148. [setCarModelName(String)](#setCarModelName(java.lang.String))
   149. [getSpecialLootChance()](#getSpecialLootChance())
   150. [getSpecialKeyRingChance()](#getSpecialKeyRingChance())
   151. [neverSpawnKey()](#neverSpawnKey())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VehicleScript
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.VehicleScript

All Implemented Interfaces:
:   `zombie.scripting.objects.IModelAttachmentOwner`

---

public final class VehicleScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")
implements zombie.scripting.objects.IModelAttachmentOwner

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `VehicleScript.Anim`

  `static final class`

  `VehicleScript.Area`

  `static final class`

  `VehicleScript.Container`

  `static final class`

  `VehicleScript.Door`

  `static final class`

  `VehicleScript.LightBar`

  `static final class`

  `VehicleScript.Model`

  `static final class`

  `VehicleScript.Part`

  `static final class`

  `VehicleScript.Passenger`

  `static final class`

  `VehicleScript.PhysicsShape`

  `static final class`

  `VehicleScript.Position`

  `static final class`

  `VehicleScript.Skin`

  `static final class`

  `VehicleScript.Sounds`

  `static final class`

  `VehicleScript.Wheel`

  `static final class`

  `VehicleScript.Window`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `animalTrailerSize`

  `private final ArrayList<VehicleScript.Area>`

  `areas`

  `final ArrayList<ModelAttachment>`

  `attachments`

  `private String`

  `carMechanicsOverlay`

  `private String`

  `carModelName`

  `private final Vector3f`

  `centerOfMassOffset`

  `private final gnu.trove.list.array.TFloatArrayList`

  `crawlOffsets`

  `private final List<VehicleScript.Wheel>`

  `crawlThroughWheels`

  `private float`

  `engineForce`

  `private float`

  `engineIdleSpeed`

  `private int`

  `engineLoudness`

  `private int`

  `engineQuality`

  `private int`

  `engineRepairLevel`

  `private String`

  `engineRpmType`

  `private final Vector3f`

  `extents`

  `private final Vector2f`

  `extentsOffset`

  `private String`

  `fileName`

  `private float`

  `forcedHue`

  `private float`

  `forcedSat`

  `private float`

  `forcedVal`

  `private int`

  `frontEndHealth`

  `final float[]`

  `gearRatio`

  `int`

  `gearRatioCount`

  `private boolean`

  `hadShadowOExtents`

  `private boolean`

  `hadShadowOffset`

  `private boolean`

  `hasLighter`

  `private boolean`

  `hasSiren`

  `boolean`

  `isSmallVehicle`

  `ImmutableColor`

  `leftSirenCol`

  `private final VehicleScript.LightBar`

  `lightbar`

  `private float`

  `mass`

  `float`

  `maxSpeed`

  `float`

  `maxSpeedReverse`

  `private float`

  `maxSuspensionTravelCm`

  `private int`

  `mechanicType`

  `private final ArrayList<VehicleScript.Model>`

  `models`

  `private String`

  `name`

  `private boolean`

  `neverSpawnKey`

  `private boolean`

  `notKillCrops`

  `private float`

  `offroadEfficiency`

  `private final ArrayList<VehicleScript.Part>`

  `parts`

  `private final ArrayList<VehicleScript.Passenger>`

  `passengers`

  `static final int`

  `PHYSICS_SHAPE_BOX`

  `static final int`

  `PHYSICS_SHAPE_MESH`

  `static final int`

  `PHYSICS_SHAPE_SPHERE`

  `private final Vector3f`

  `physicsChassisShape`

  `private final ArrayList<VehicleScript.PhysicsShape>`

  `physicsShapes`

  `private float`

  `playerDamageProtection`

  `private int`

  `rearEndHealth`

  `ImmutableColor`

  `rightSirenCol`

  `private float`

  `rollInfluence`

  `private int`

  `seats`

  `private final Vector2f`

  `shadowExtents`

  `private final Vector2f`

  `shadowOffset`

  `private final ArrayList<VehicleScript.Skin>`

  `skins`

  `private final VehicleScript.Sounds`

  `sound`

  `private ArrayList<String>`

  `specialKeyRing`

  `private int`

  `specialKeyRingChance`

  `private int`

  `specialLootChance`

  `private float`

  `steeringClamp`

  `private final float`

  `steeringClampMax`

  `private float`

  `steeringIncrement`

  `private float`

  `stoppingMovementForce`

  `private int`

  `storageCapacity`

  `private float`

  `suspensionCompression`

  `private float`

  `suspensionDamping`

  `private float`

  `suspensionRestLength`

  `private float`

  `suspensionStiffness`

  `boolean`

  `textureMaskEnable`

  `private final VehicleScript.Skin`

  `textures`

  `private boolean`

  `useChassisPhysicsCollision`

  `private float`

  `wheelFriction`

  `private final ArrayList<VehicleScript.Wheel>`

  `wheels`

  `private ArrayList<String>`

  `zombieType`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehicleScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ModelAttachment`

  `addAttachment(ModelAttachment attach)`

  `ModelAttachment`

  `addAttachmentAt(int index,
  ModelAttachment attach)`

  `VehicleScript.PhysicsShape`

  `addPhysicsShape(String type)`

  `void`

  `afterRenameAttachment(ModelAttachment attachment)`

  `void`

  `beforeRenameAttachment(ModelAttachment attachment)`

  `private Object`

  `checkIntegerKey(Object key)`

  `private void`

  `compact()`

  `void`

  `copyAreasFrom(VehicleScript other,
  String spec)`

  `void`

  `copyPartsFrom(VehicleScript other,
  String spec)`

  `void`

  `copyPassengersFrom(VehicleScript other,
  String spec)`

  `void`

  `copyPhysicsFrom(VehicleScript other,
  String spec)`

  `void`

  `copySoundFrom(VehicleScript other,
  String spec)`

  `void`

  `copyWheelsFrom(VehicleScript other,
  String spec)`

  `float`

  `getAnimalTrailerSize()`

  `private VehicleScript.Anim`

  `getAnimationById(String id,
  ArrayList<VehicleScript.Anim> anims)`

  `VehicleScript.Area`

  `getArea(int index)`

  `VehicleScript.Area`

  `getAreaById(String id)`

  `int`

  `getAreaCount()`

  `ModelAttachment`

  `getAttachment(int index)`

  `ModelAttachment`

  `getAttachmentById(String id)`

  `int`

  `getAttachmentCount()`

  `String`

  `getCarMechanicsOverlay()`

  `String`

  `getCarModelName()`

  `Vector3f`

  `getCenterOfMassOffset()`

  `gnu.trove.list.array.TFloatArrayList`

  `getCrawlOffsets()`

  `int`

  `getCrawlThroughWheel()`

  `VehicleScript.Wheel`

  `getCrawlThroughWheel(int index)`

  `float`

  `getEngineForce()`

  `float`

  `getEngineIdleSpeed()`

  `int`

  `getEngineLoudness()`

  `int`

  `getEngineQuality()`

  `int`

  `getEngineRepairLevel()`

  `String`

  `getEngineRPMType()`

  `Vector3f`

  `getExtents()`

  `Vector2f`

  `getExtentsOffset()`

  `String`

  `getFileName()`

  `String`

  `getFirstZombieType()`

  `float`

  `getForcedHue()`

  `float`

  `getForcedSat()`

  `float`

  `getForcedVal()`

  `int`

  `getFrontEndHealth()`

  `String`

  `getFullName()`

  `String`

  `getFullType()`

  `int`

  `getGearRatioCount()`

  `boolean`

  `getHasSiren()`

  `int`

  `getHeadlightConfigLevel()`

  `int`

  `getIndexOfAreaById(String id)`

  `int`

  `getIndexOfPartById(String id)`

  `int`

  `getIndexOfWheelById(String id)`

  `VehicleScript.LightBar`

  `getLightbar()`

  `float`

  `getMass()`

  `int`

  `getMechanicType()`

  `VehicleScript.Model`

  `getModel()`

  `VehicleScript.Model`

  `getModelById(String id)`

  `VehicleScript.Model`

  `getModelById(String id,
  ArrayList<VehicleScript.Model> models)`

  `VehicleScript.Model`

  `getModelByIndex(int index)`

  `int`

  `getModelCount()`

  `Vector3f`

  `getModelOffset()`

  `float`

  `getModelScale()`

  `String`

  `getName()`

  `float`

  `getOffroadEfficiency()`

  `VehicleScript.Part`

  `getPart(int index)`

  `VehicleScript.Part`

  `getPartById(String id)`

  `int`

  `getPartCount()`

  `VehicleScript.Passenger`

  `getPassenger(int index)`

  `VehicleScript.Passenger`

  `getPassengerById(String id)`

  `int`

  `getPassengerCount()`

  `int`

  `getPassengerIndex(String id)`

  `Vector3f`

  `getPhysicsChassisShape()`

  `VehicleScript.PhysicsShape`

  `getPhysicsShape(int index)`

  `int`

  `getPhysicsShapeCount()`

  `float`

  `getPlayerDamageProtection()`

  `private VehicleScript.Position`

  `getPositionById(String id,
  ArrayList<VehicleScript.Position> positions)`

  `String`

  `getRandomSpecialKeyRing()`

  `String`

  `getRandomZombieType()`

  `int`

  `getRearEndHealth()`

  `float`

  `getRollInfluence()`

  `int`

  `getSeats()`

  `Vector2f`

  `getShadowExtents()`

  `Vector2f`

  `getShadowOffset()`

  `VehicleScript.Skin`

  `getSkin(int index)`

  `int`

  `getSkinCount()`

  `VehicleScript.Sounds`

  `getSounds()`

  `ArrayList<String>`

  `getSpecialKeyRing()`

  `int`

  `getSpecialKeyRingChance()`

  `int`

  `getSpecialLootChance()`

  `float`

  `getSteeringClamp(float speed)`

  `float`

  `getSteeringIncrement()`

  `int`

  `getStorageCapacity()`

  `float`

  `getSuspensionCompression()`

  `float`

  `getSuspensionDamping()`

  `float`

  `getSuspensionRestLength()`

  `float`

  `getSuspensionStiffness()`

  `float`

  `getSuspensionTravel()`

  `VehicleScript.Skin`

  `getTextures()`

  `VehicleScript.Wheel`

  `getWheel(int index)`

  `VehicleScript.Wheel`

  `getWheelById(String id)`

  `int`

  `getWheelCount()`

  `float`

  `getWheelFriction()`

  `ArrayList<String>`

  `getZombieType()`

  `boolean`

  `globMatch(String pattern,
  String str)`

  `boolean`

  `hasLighter()`

  `boolean`

  `hasPhysicsChassisShape()`

  `boolean`

  `hasSpecialKeyRing()`

  `boolean`

  `hasZombieType(String outfit)`

  `private void`

  `initCrawlOffsets()`

  `private void`

  `initCrawlOffsets(VehicleScript.Wheel wheel)`

  `void`

  `InitLoadPP(String name)`

  `private boolean`

  `isOverlappingWheel(float zOffset)`

  `void`

  `Load(String name,
  String totalFile)`

  `private VehicleScript.Anim`

  `LoadAnim(zombie.scripting.ScriptParser.Block block,
  ArrayList<VehicleScript.Anim> anims)`

  `private VehicleScript.Area`

  `LoadArea(zombie.scripting.ScriptParser.Block block)`

  `private ModelAttachment`

  `LoadAttachment(zombie.scripting.ScriptParser.Block block)`

  `private VehicleScript.Container`

  `LoadContainer(zombie.scripting.ScriptParser.Block block,
  VehicleScript.Container existing)`

  `private VehicleScript.Door`

  `LoadDoor(zombie.scripting.ScriptParser.Block block)`

  `void`

  `Loaded()`

  `private gnu.trove.map.hash.THashMap<String,String>`

  `LoadLuaFunctions(zombie.scripting.ScriptParser.Block block)`

  `private VehicleScript.Model`

  `LoadModel(zombie.scripting.ScriptParser.Block block,
  ArrayList<VehicleScript.Model> models)`

  `private VehicleScript.Part`

  `LoadPart(zombie.scripting.ScriptParser.Block block)`

  `private VehicleScript.Passenger`

  `LoadPassenger(zombie.scripting.ScriptParser.Block block)`

  `private VehicleScript.Passenger.SwitchSeat`

  `LoadPassengerSwitchSeat(zombie.scripting.ScriptParser.Block block,
  VehicleScript.Passenger passenger)`

  `private VehicleScript.PhysicsShape`

  `LoadPhysicsShape(zombie.scripting.ScriptParser.Block block)`

  `private VehicleScript.Position`

  `LoadPosition(zombie.scripting.ScriptParser.Block block,
  ArrayList<VehicleScript.Position> positions)`

  `private VehicleScript.Skin`

  `LoadSkin(zombie.scripting.ScriptParser.Block block)`

  `private se.krka.kahlua.vm.KahluaTable`

  `LoadTable(zombie.scripting.ScriptParser.Block block,
  se.krka.kahlua.vm.KahluaTable existing)`

  `private void`

  `LoadTemplate(String str)`

  `private void`

  `LoadVector2f(String s,
  Vector2f v)`

  `private void`

  `LoadVector2i(String s,
  org.joml.Vector2i v)`

  `private void`

  `LoadVector3f(String s,
  Vector3f v)`

  `private void`

  `LoadVector4f(String s,
  org.joml.Vector4f v)`

  `private VehicleScript.Wheel`

  `LoadWheel(zombie.scripting.ScriptParser.Block block,
  boolean crawlThroughWheel)`

  `private VehicleScript.Window`

  `LoadWindow(zombie.scripting.ScriptParser.Block block)`

  `boolean`

  `neverSpawnKey()`

  `boolean`

  `notKillCrops()`

  `ModelAttachment`

  `removeAttachment(int index)`

  `ModelAttachment`

  `removeAttachment(ModelAttachment attach)`

  `VehicleScript.PhysicsShape`

  `removePhysicsShape(int index)`

  `void`

  `setCarMechanicsOverlay(String overlay)`

  `void`

  `setCarModelName(String overlay)`

  `void`

  `setEngineRepairLevel(int engineRepairLevel)`

  `void`

  `setEngineRPMType(String engineRpmType)`

  `void`

  `setForcedHue(float forcedHue)`

  `void`

  `setForcedSat(float forcedSat)`

  `void`

  `setForcedVal(float forcedVal)`

  `void`

  `setMechanicType(int mechanicType)`

  `void`

  `setModelScale(float scale)`

  `void`

  `setOffroadEfficiency(float offroadEfficiency)`

  `void`

  `setPlayerDamageProtection(float playerDamageProtection)`

  `void`

  `setSeats(int seats)`

  `void`

  `toBullet()`

  `boolean`

  `useChassisPhysicsCollision()`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fileName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### models

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects")> models
  + ### attachments

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects")> attachments
  + ### mass

    private float mass
  + ### centerOfMassOffset

    private final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") centerOfMassOffset
  + ### engineForce

    private float engineForce
  + ### engineIdleSpeed

    private float engineIdleSpeed
  + ### steeringIncrement

    private float steeringIncrement
  + ### steeringClamp

    private float steeringClamp
  + ### steeringClampMax

    private final float steeringClampMax

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.VehicleScript.steeringClampMax)
  + ### wheelFriction

    private float wheelFriction
  + ### stoppingMovementForce

    private float stoppingMovementForce
  + ### animalTrailerSize

    private float animalTrailerSize
  + ### suspensionStiffness

    private float suspensionStiffness
  + ### suspensionDamping

    private float suspensionDamping
  + ### suspensionCompression

    private float suspensionCompression
  + ### suspensionRestLength

    private float suspensionRestLength
  + ### maxSuspensionTravelCm

    private float maxSuspensionTravelCm
  + ### rollInfluence

    private float rollInfluence
  + ### extents

    private final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") extents
  + ### shadowExtents

    private final [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") shadowExtents
  + ### shadowOffset

    private final [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") shadowOffset
  + ### hadShadowOExtents

    private boolean hadShadowOExtents
  + ### hadShadowOffset

    private boolean hadShadowOffset
  + ### extentsOffset

    private final [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") extentsOffset
  + ### physicsChassisShape

    private final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") physicsChassisShape
  + ### physicsShapes

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.PhysicsShape](VehicleScript.PhysicsShape.html "class in zombie.scripting.objects")> physicsShapes
  + ### wheels

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Wheel](VehicleScript.Wheel.html "class in zombie.scripting.objects")> wheels
  + ### crawlThroughWheels

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[VehicleScript.Wheel](VehicleScript.Wheel.html "class in zombie.scripting.objects")> crawlThroughWheels
  + ### passengers

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Passenger](VehicleScript.Passenger.html "class in zombie.scripting.objects")> passengers
  + ### maxSpeed

    public float maxSpeed
  + ### useChassisPhysicsCollision

    private boolean useChassisPhysicsCollision
  + ### maxSpeedReverse

    public float maxSpeedReverse
  + ### isSmallVehicle

    public boolean isSmallVehicle
  + ### frontEndHealth

    private int frontEndHealth
  + ### rearEndHealth

    private int rearEndHealth
  + ### storageCapacity

    private int storageCapacity
  + ### engineLoudness

    private int engineLoudness
  + ### engineQuality

    private int engineQuality
  + ### seats

    private int seats
  + ### mechanicType

    private int mechanicType
  + ### engineRepairLevel

    private int engineRepairLevel
  + ### playerDamageProtection

    private float playerDamageProtection
  + ### forcedHue

    private float forcedHue
  + ### forcedSat

    private float forcedSat
  + ### forcedVal

    private float forcedVal
  + ### leftSirenCol

    public [ImmutableColor](../../core/ImmutableColor.html "class in zombie.core") leftSirenCol
  + ### rightSirenCol

    public [ImmutableColor](../../core/ImmutableColor.html "class in zombie.core") rightSirenCol
  + ### engineRpmType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") engineRpmType
  + ### offroadEfficiency

    private float offroadEfficiency
  + ### crawlOffsets

    private final gnu.trove.list.array.TFloatArrayList crawlOffsets
  + ### zombieType

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> zombieType
  + ### specialKeyRing

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> specialKeyRing
  + ### notKillCrops

    private boolean notKillCrops
  + ### hasLighter

    private boolean hasLighter
  + ### carMechanicsOverlay

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") carMechanicsOverlay
  + ### carModelName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") carModelName
  + ### specialLootChance

    private int specialLootChance
  + ### specialKeyRingChance

    private int specialKeyRingChance
  + ### neverSpawnKey

    private boolean neverSpawnKey
  + ### gearRatioCount

    public int gearRatioCount
  + ### gearRatio

    public final float[] gearRatio
  + ### textures

    private final [VehicleScript.Skin](VehicleScript.Skin.html "class in zombie.scripting.objects") textures
  + ### skins

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Skin](VehicleScript.Skin.html "class in zombie.scripting.objects")> skins
  + ### areas

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Area](VehicleScript.Area.html "class in zombie.scripting.objects")> areas
  + ### parts

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Part](VehicleScript.Part.html "class in zombie.scripting.objects")> parts
  + ### hasSiren

    private boolean hasSiren
  + ### lightbar

    private final [VehicleScript.LightBar](VehicleScript.LightBar.html "class in zombie.scripting.objects") lightbar
  + ### sound

    private final [VehicleScript.Sounds](VehicleScript.Sounds.html "class in zombie.scripting.objects") sound
  + ### textureMaskEnable

    public boolean textureMaskEnable
  + ### PHYSICS\_SHAPE\_BOX

    public static final int PHYSICS\_SHAPE\_BOX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.VehicleScript.PHYSICS_SHAPE_BOX)
  + ### PHYSICS\_SHAPE\_SPHERE

    public static final int PHYSICS\_SHAPE\_SPHERE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.VehicleScript.PHYSICS_SHAPE_SPHERE)
  + ### PHYSICS\_SHAPE\_MESH

    public static final int PHYSICS\_SHAPE\_MESH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.VehicleScript.PHYSICS_SHAPE_MESH)
* Constructor Details
  -------------------

  + ### VehicleScript

    public VehicleScript()
* Method Details
  --------------

  + ### InitLoadPP

    public void InitLoadPP([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Overrides:
    :   `InitLoadPP` in class `BaseScriptObject`
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### getFileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFileName()
  + ### Loaded

    public void Loaded()
  + ### compact

    private void compact()
  + ### toBullet

    public void toBullet()
  + ### LoadVector2f

    private void LoadVector2f([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") v)
  + ### LoadVector3f

    private void LoadVector3f([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") v)
  + ### LoadVector4f

    private void LoadVector4f([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    org.joml.Vector4f v)
  + ### LoadVector2i

    private void LoadVector2i([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    org.joml.Vector2i v)
  + ### LoadAttachment

    private [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") LoadAttachment(zombie.scripting.ScriptParser.Block block)
  + ### LoadModel

    private [VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects") LoadModel(zombie.scripting.ScriptParser.Block block,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects")> models)
  + ### LoadSkin

    private [VehicleScript.Skin](VehicleScript.Skin.html "class in zombie.scripting.objects") LoadSkin(zombie.scripting.ScriptParser.Block block)
  + ### LoadWheel

    private [VehicleScript.Wheel](VehicleScript.Wheel.html "class in zombie.scripting.objects") LoadWheel(zombie.scripting.ScriptParser.Block block,
    boolean crawlThroughWheel)
  + ### LoadPassenger

    private [VehicleScript.Passenger](VehicleScript.Passenger.html "class in zombie.scripting.objects") LoadPassenger(zombie.scripting.ScriptParser.Block block)
  + ### LoadAnim

    private [VehicleScript.Anim](VehicleScript.Anim.html "class in zombie.scripting.objects") LoadAnim(zombie.scripting.ScriptParser.Block block,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Anim](VehicleScript.Anim.html "class in zombie.scripting.objects")> anims)
  + ### LoadPassengerSwitchSeat

    private [VehicleScript.Passenger.SwitchSeat](VehicleScript.Passenger.SwitchSeat.html "class in zombie.scripting.objects") LoadPassengerSwitchSeat(zombie.scripting.ScriptParser.Block block,
    [VehicleScript.Passenger](VehicleScript.Passenger.html "class in zombie.scripting.objects") passenger)
  + ### LoadArea

    private [VehicleScript.Area](VehicleScript.Area.html "class in zombie.scripting.objects") LoadArea(zombie.scripting.ScriptParser.Block block)
  + ### LoadPart

    private [VehicleScript.Part](VehicleScript.Part.html "class in zombie.scripting.objects") LoadPart(zombie.scripting.ScriptParser.Block block)
  + ### LoadPhysicsShape

    private [VehicleScript.PhysicsShape](VehicleScript.PhysicsShape.html "class in zombie.scripting.objects") LoadPhysicsShape(zombie.scripting.ScriptParser.Block block)
  + ### LoadDoor

    private [VehicleScript.Door](VehicleScript.Door.html "class in zombie.scripting.objects") LoadDoor(zombie.scripting.ScriptParser.Block block)
  + ### LoadWindow

    private [VehicleScript.Window](VehicleScript.Window.html "class in zombie.scripting.objects") LoadWindow(zombie.scripting.ScriptParser.Block block)
  + ### LoadContainer

    private [VehicleScript.Container](VehicleScript.Container.html "class in zombie.scripting.objects") LoadContainer(zombie.scripting.ScriptParser.Block block,
    [VehicleScript.Container](VehicleScript.Container.html "class in zombie.scripting.objects") existing)
  + ### LoadLuaFunctions

    private gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> LoadLuaFunctions(zombie.scripting.ScriptParser.Block block)
  + ### checkIntegerKey

    private [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") checkIntegerKey([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### LoadTable

    private se.krka.kahlua.vm.KahluaTable LoadTable(zombie.scripting.ScriptParser.Block block,
    se.krka.kahlua.vm.KahluaTable existing)
  + ### LoadTemplate

    private void LoadTemplate([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### copyAreasFrom

    public void copyAreasFrom([VehicleScript](VehicleScript.html "class in zombie.scripting.objects") other,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spec)
  + ### copyPartsFrom

    public void copyPartsFrom([VehicleScript](VehicleScript.html "class in zombie.scripting.objects") other,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spec)
  + ### copyPhysicsFrom

    public void copyPhysicsFrom([VehicleScript](VehicleScript.html "class in zombie.scripting.objects") other,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spec)
  + ### copyPassengersFrom

    public void copyPassengersFrom([VehicleScript](VehicleScript.html "class in zombie.scripting.objects") other,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spec)
  + ### copySoundFrom

    public void copySoundFrom([VehicleScript](VehicleScript.html "class in zombie.scripting.objects") other,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spec)
  + ### copyWheelsFrom

    public void copyWheelsFrom([VehicleScript](VehicleScript.html "class in zombie.scripting.objects") other,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spec)
  + ### LoadPosition

    private [VehicleScript.Position](VehicleScript.Position.html "class in zombie.scripting.objects") LoadPosition(zombie.scripting.ScriptParser.Block block,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Position](VehicleScript.Position.html "class in zombie.scripting.objects")> positions)
  + ### initCrawlOffsets

    private void initCrawlOffsets()
  + ### initCrawlOffsets

    private void initCrawlOffsets([VehicleScript.Wheel](VehicleScript.Wheel.html "class in zombie.scripting.objects") wheel)
  + ### isOverlappingWheel

    private boolean isOverlappingWheel(float zOffset)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getFullName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullName()
  + ### getFullType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullType()
  + ### getModel

    public [VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects") getModel()
  + ### getModelOffset

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getModelOffset()
  + ### getModelScale

    public float getModelScale()
  + ### setModelScale

    public void setModelScale(float scale)
  + ### getModelCount

    public int getModelCount()
  + ### getModelByIndex

    public [VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects") getModelByIndex(int index)
  + ### getModelById

    public [VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects") getModelById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects")> models)
  + ### getModelById

    public [VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects") getModelById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getAttachmentCount

    public int getAttachmentCount()
  + ### getAttachment

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") getAttachment(int index)
  + ### getAttachmentById

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") getAttachmentById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### addAttachment

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") addAttachment([ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attach)
  + ### removeAttachment

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") removeAttachment([ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attach)
  + ### addAttachmentAt

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") addAttachmentAt(int index,
    [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attach)
  + ### removeAttachment

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") removeAttachment(int index)
  + ### beforeRenameAttachment

    public void beforeRenameAttachment([ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attachment)

    Specified by:
    :   `beforeRenameAttachment` in interface `zombie.scripting.objects.IModelAttachmentOwner`
  + ### afterRenameAttachment

    public void afterRenameAttachment([ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attachment)

    Specified by:
    :   `afterRenameAttachment` in interface `zombie.scripting.objects.IModelAttachmentOwner`
  + ### getLightbar

    public [VehicleScript.LightBar](VehicleScript.LightBar.html "class in zombie.scripting.objects") getLightbar()
  + ### getSounds

    public [VehicleScript.Sounds](VehicleScript.Sounds.html "class in zombie.scripting.objects") getSounds()
  + ### getHasSiren

    public boolean getHasSiren()
  + ### getExtents

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getExtents()
  + ### getPhysicsChassisShape

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getPhysicsChassisShape()
  + ### hasPhysicsChassisShape

    public boolean hasPhysicsChassisShape()
  + ### useChassisPhysicsCollision

    public boolean useChassisPhysicsCollision()
  + ### getShadowExtents

    public [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") getShadowExtents()
  + ### getShadowOffset

    public [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") getShadowOffset()
  + ### getExtentsOffset

    public [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") getExtentsOffset()
  + ### getMass

    public float getMass()
  + ### getCenterOfMassOffset

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getCenterOfMassOffset()
  + ### getEngineForce

    public float getEngineForce()
  + ### getEngineIdleSpeed

    public float getEngineIdleSpeed()
  + ### getEngineQuality

    public int getEngineQuality()
  + ### getEngineLoudness

    public int getEngineLoudness()
  + ### getRollInfluence

    public float getRollInfluence()
  + ### getSteeringIncrement

    public float getSteeringIncrement()
  + ### getSteeringClamp

    public float getSteeringClamp(float speed)
  + ### getSuspensionStiffness

    public float getSuspensionStiffness()
  + ### getSuspensionDamping

    public float getSuspensionDamping()
  + ### getSuspensionCompression

    public float getSuspensionCompression()
  + ### getSuspensionRestLength

    public float getSuspensionRestLength()
  + ### getSuspensionTravel

    public float getSuspensionTravel()
  + ### getWheelFriction

    public float getWheelFriction()
  + ### getWheelCount

    public int getWheelCount()
  + ### getCrawlThroughWheel

    public int getCrawlThroughWheel()
  + ### getWheel

    public [VehicleScript.Wheel](VehicleScript.Wheel.html "class in zombie.scripting.objects") getWheel(int index)
  + ### getCrawlThroughWheel

    public [VehicleScript.Wheel](VehicleScript.Wheel.html "class in zombie.scripting.objects") getCrawlThroughWheel(int index)
  + ### getWheelById

    public [VehicleScript.Wheel](VehicleScript.Wheel.html "class in zombie.scripting.objects") getWheelById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getIndexOfWheelById

    public int getIndexOfWheelById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getPassengerCount

    public int getPassengerCount()
  + ### getPassenger

    public [VehicleScript.Passenger](VehicleScript.Passenger.html "class in zombie.scripting.objects") getPassenger(int index)
  + ### getPassengerById

    public [VehicleScript.Passenger](VehicleScript.Passenger.html "class in zombie.scripting.objects") getPassengerById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getPassengerIndex

    public int getPassengerIndex([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getPhysicsShapeCount

    public int getPhysicsShapeCount()
  + ### getPhysicsShape

    public [VehicleScript.PhysicsShape](VehicleScript.PhysicsShape.html "class in zombie.scripting.objects") getPhysicsShape(int index)
  + ### addPhysicsShape

    public [VehicleScript.PhysicsShape](VehicleScript.PhysicsShape.html "class in zombie.scripting.objects") addPhysicsShape([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### removePhysicsShape

    public [VehicleScript.PhysicsShape](VehicleScript.PhysicsShape.html "class in zombie.scripting.objects") removePhysicsShape(int index)
  + ### getFrontEndHealth

    public int getFrontEndHealth()
  + ### getRearEndHealth

    public int getRearEndHealth()
  + ### getStorageCapacity

    public int getStorageCapacity()
  + ### getTextures

    public [VehicleScript.Skin](VehicleScript.Skin.html "class in zombie.scripting.objects") getTextures()
  + ### getSkinCount

    public int getSkinCount()
  + ### getSkin

    public [VehicleScript.Skin](VehicleScript.Skin.html "class in zombie.scripting.objects") getSkin(int index)
  + ### getAreaCount

    public int getAreaCount()
  + ### getArea

    public [VehicleScript.Area](VehicleScript.Area.html "class in zombie.scripting.objects") getArea(int index)
  + ### getAreaById

    public [VehicleScript.Area](VehicleScript.Area.html "class in zombie.scripting.objects") getAreaById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getIndexOfAreaById

    public int getIndexOfAreaById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getPartCount

    public int getPartCount()
  + ### getPart

    public [VehicleScript.Part](VehicleScript.Part.html "class in zombie.scripting.objects") getPart(int index)
  + ### getPartById

    public [VehicleScript.Part](VehicleScript.Part.html "class in zombie.scripting.objects") getPartById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getIndexOfPartById

    public int getIndexOfPartById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getAnimationById

    private [VehicleScript.Anim](VehicleScript.Anim.html "class in zombie.scripting.objects") getAnimationById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Anim](VehicleScript.Anim.html "class in zombie.scripting.objects")> anims)
  + ### getPositionById

    private [VehicleScript.Position](VehicleScript.Position.html "class in zombie.scripting.objects") getPositionById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Position](VehicleScript.Position.html "class in zombie.scripting.objects")> positions)
  + ### globMatch

    public boolean globMatch([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pattern,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getGearRatioCount

    public int getGearRatioCount()
  + ### getSeats

    public int getSeats()
  + ### setSeats

    public void setSeats(int seats)
  + ### getMechanicType

    public int getMechanicType()
  + ### setMechanicType

    public void setMechanicType(int mechanicType)
  + ### getEngineRepairLevel

    public int getEngineRepairLevel()
  + ### getHeadlightConfigLevel

    public int getHeadlightConfigLevel()
  + ### setEngineRepairLevel

    public void setEngineRepairLevel(int engineRepairLevel)
  + ### getPlayerDamageProtection

    public float getPlayerDamageProtection()
  + ### setPlayerDamageProtection

    public void setPlayerDamageProtection(float playerDamageProtection)
  + ### getForcedHue

    public float getForcedHue()
  + ### setForcedHue

    public void setForcedHue(float forcedHue)
  + ### getForcedSat

    public float getForcedSat()
  + ### setForcedSat

    public void setForcedSat(float forcedSat)
  + ### getForcedVal

    public float getForcedVal()
  + ### setForcedVal

    public void setForcedVal(float forcedVal)
  + ### getEngineRPMType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEngineRPMType()
  + ### setEngineRPMType

    public void setEngineRPMType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") engineRpmType)
  + ### getOffroadEfficiency

    public float getOffroadEfficiency()
  + ### setOffroadEfficiency

    public void setOffroadEfficiency(float offroadEfficiency)
  + ### getCrawlOffsets

    public gnu.trove.list.array.TFloatArrayList getCrawlOffsets()
  + ### getAnimalTrailerSize

    public float getAnimalTrailerSize()
  + ### getZombieType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getZombieType()
  + ### getSpecialKeyRing

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSpecialKeyRing()
  + ### getRandomZombieType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomZombieType()
  + ### getRandomSpecialKeyRing

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomSpecialKeyRing()
  + ### hasSpecialKeyRing

    public boolean hasSpecialKeyRing()
  + ### getFirstZombieType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFirstZombieType()
  + ### hasZombieType

    public boolean hasZombieType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit)
  + ### notKillCrops

    public boolean notKillCrops()
  + ### hasLighter

    public boolean hasLighter()
  + ### getCarMechanicsOverlay

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCarMechanicsOverlay()
  + ### setCarMechanicsOverlay

    public void setCarMechanicsOverlay([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overlay)
  + ### getCarModelName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCarModelName()
  + ### setCarModelName

    public void setCarModelName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overlay)
  + ### getSpecialLootChance

    public int getSpecialLootChance()
  + ### getSpecialKeyRingChance

    public int getSpecialKeyRingChance()
  + ### neverSpawnKey

    public boolean neverSpawnKey()