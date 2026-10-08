[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [VehiclePart](VehiclePart.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [vehicle](#vehicle)
   2. [created](#created)
   3. [partId](#partId)
   4. [scriptPart](#scriptPart)
   5. [container](#container)
   6. [item](#item)
   7. [modData](#modData)
   8. [lastUpdated](#lastUpdated)
   9. [updateFlags](#updateFlags)
   10. [parent](#parent)
   11. [door](#door)
   12. [engine](#engine)
   13. [window](#window)
   14. [children](#children)
   15. [category](#category)
   16. [condition](#condition)
   17. [specificItem](#specificItem)
   18. [wheelFriction](#wheelFriction)
   19. [mechanicSkillInstaller](#mechanicSkillInstaller)
   20. [suspensionDamping](#suspensionDamping)
   21. [suspensionCompression](#suspensionCompression)
   22. [engineLoudness](#engineLoudness)
   23. [durability](#durability)
   24. [light](#light)
   25. [deviceData](#deviceData)
   26. [chatElement](#chatElement)
   27. [hasPlayerInRange](#hasPlayerInRange)
6. [Constructor Details](#constructor-detail)
   1. [VehiclePart(VehiclePartOwner)](#%3Cinit%3E(zombie.vehicles.VehiclePartOwner))
7. [Method Details](#method-detail)
   1. [getOwner()](#getOwner())
   2. [getVehicle()](#getVehicle())
   3. [setScriptPart(VehicleScript.Part)](#setScriptPart(zombie.scripting.objects.VehicleScript.Part))
   4. [getScriptPart()](#getScriptPart())
   5. [getItemContainer()](#getItemContainer())
   6. [setItemContainer(ItemContainer)](#setItemContainer(zombie.inventory.ItemContainer))
   7. [hasModData()](#hasModData())
   8. [getModData()](#getModData())
   9. [getLastUpdated()](#getLastUpdated())
   10. [setLastUpdated(float)](#setLastUpdated(float))
   11. [getId()](#getId())
   12. [getIndex()](#getIndex())
   13. [getArea()](#getArea())
   14. [getItemType()](#getItemType())
   15. [getTable(String)](#getTable(java.lang.String))
   16. [getInventoryItem()](#getInventoryItem())
   17. [setInventoryItem(InventoryItem, int)](#setInventoryItem(zombie.inventory.InventoryItem,int))
   18. [setInventoryItem(InventoryItem)](#setInventoryItem(zombie.inventory.InventoryItem))
   19. [isInventoryItemUninstalled()](#isInventoryItemUninstalled())
   20. [isSetAllModelsVisible()](#isSetAllModelsVisible())
   21. [setAllModelsVisible(boolean)](#setAllModelsVisible(boolean))
   22. [doInventoryItemStats(InventoryItem, int)](#doInventoryItemStats(zombie.inventory.InventoryItem,int))
   23. [setRandomCondition(InventoryItem)](#setRandomCondition(zombie.inventory.InventoryItem))
   24. [setGeneralCondition(InventoryItem, float, float)](#setGeneralCondition(zombie.inventory.InventoryItem,float,float))
   25. [getNumberByCondition(float, float, float)](#getNumberByCondition(float,float,float))
   26. [isContainer()](#isContainer())
   27. [getContainerCapacity()](#getContainerCapacity())
   28. [getContainerCapacity(IsoGameCharacter)](#getContainerCapacity(zombie.characters.IsoGameCharacter))
   29. [setContainerCapacity(int)](#setContainerCapacity(int))
   30. [getContainerContentType()](#getContainerContentType())
   31. [getContainerContentAmount()](#getContainerContentAmount())
   32. [setContainerContentAmount(float)](#setContainerContentAmount(float))
   33. [setContainerContentAmount(float, boolean, boolean)](#setContainerContentAmount(float,boolean,boolean))
   34. [getContainerSeatNumber()](#getContainerSeatNumber())
   35. [getContainerCloseSound()](#getContainerCloseSound())
   36. [getContainerOpenSound()](#getContainerOpenSound())
   37. [getContainerPutSound()](#getContainerPutSound())
   38. [getContainerTakeSound()](#getContainerTakeSound())
   39. [isSeat()](#isSeat())
   40. [isVehicleTrunk()](#isVehicleTrunk())
   41. [getLuaFunction(String)](#getLuaFunction(java.lang.String))
   42. [getScriptModelById(String)](#getScriptModelById(java.lang.String))
   43. [setModelVisible(String, boolean)](#setModelVisible(java.lang.String,boolean))
   44. [getParent()](#getParent())
   45. [addChild(VehiclePart)](#addChild(zombie.vehicles.VehiclePart))
   46. [getChildCount()](#getChildCount())
   47. [getChild(int)](#getChild(int))
   48. [getDoor()](#getDoor())
   49. [getEnclosingDoor()](#getEnclosingDoor())
   50. [getVehicleEngine()](#getVehicleEngine())
   51. [getWindow()](#getWindow())
   52. [getChildWindow()](#getChildWindow())
   53. [findWindow()](#findWindow())
   54. [getAnimById(String)](#getAnimById(java.lang.String))
   55. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   56. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   57. [getWheelIndex()](#getWheelIndex())
   58. [createSpotLight(float, float, float, float, float, int)](#createSpotLight(float,float,float,float,float,int))
   59. [createSpotLightColor(float, float, float, float, float, int, float, float, float)](#createSpotLightColor(float,float,float,float,float,int,float,float,float))
   60. [getLight()](#getLight())
   61. [getLightDistance()](#getLightDistance())
   62. [getLightIntensity()](#getLightIntensity())
   63. [getLightFocusing()](#getLightFocusing())
   64. [setLightActive(boolean)](#setLightActive(boolean))
   65. [createSignalDevice()](#createSignalDevice())
   66. [hasDevicePower()](#hasDevicePower())
   67. [getDeviceData()](#getDeviceData())
   68. [setDeviceData(DeviceData)](#setDeviceData(zombie.radio.devices.DeviceData))
   69. [getDelta()](#getDelta())
   70. [setDelta(float)](#setDelta(float))
   71. [getX()](#getX())
   72. [getY()](#getY())
   73. [getZ()](#getZ())
   74. [getSquare()](#getSquare())
   75. [AddDeviceText(String, float, float, float, String, String, int)](#AddDeviceText(java.lang.String,float,float,float,java.lang.String,java.lang.String,int))
   76. [HasPlayerInRange()](#HasPlayerInRange())
   77. [playerWithinBounds(IsoPlayer, float)](#playerWithinBounds(zombie.characters.IsoPlayer,float))
   78. [updateSignalDevice()](#updateSignalDevice())
   79. [getCategory()](#getCategory())
   80. [setCategory(String)](#setCategory(java.lang.String))
   81. [getCondition()](#getCondition())
   82. [setCondition(int)](#setCondition(int))
   83. [damage(int)](#damage(int))
   84. [isSpecificItem()](#isSpecificItem())
   85. [setSpecificItem(boolean)](#setSpecificItem(boolean))
   86. [getWheelFriction()](#getWheelFriction())
   87. [setWheelFriction(float)](#setWheelFriction(float))
   88. [getMechanicSkillInstaller()](#getMechanicSkillInstaller())
   89. [setMechanicSkillInstaller(int)](#setMechanicSkillInstaller(int))
   90. [getSuspensionDamping()](#getSuspensionDamping())
   91. [setSuspensionDamping(float)](#setSuspensionDamping(float))
   92. [getSuspensionCompression()](#getSuspensionCompression())
   93. [setSuspensionCompression(float)](#setSuspensionCompression(float))
   94. [getEngineLoudness()](#getEngineLoudness())
   95. [setEngineLoudness(float)](#setEngineLoudness(float))
   96. [repair()](#repair())
   97. [callLuaVoid(String, Object, Object)](#callLuaVoid(java.lang.String,java.lang.Object,java.lang.Object))
   98. [getChatElement()](#getChatElement())
   99. [getGameEntityType()](#getGameEntityType())
   100. [isEntityValid()](#isEntityValid())
   101. [getEntityNetID()](#getEntityNetID())
   102. [setDurability(float)](#setDurability(float))
   103. [getDurability()](#getDurability())
   104. [getMechanicArea()](#getMechanicArea())
   105. [setFlag(short)](#setFlag(short))
   106. [getFlag(short)](#getFlag(short))
   107. [clearFlags()](#clearFlags())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class VehiclePart
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.GameEntity](../entity/GameEntity.html "class in zombie.entity")

zombie.vehicles.VehiclePart

All Implemented Interfaces:
:   `zombie.chat.ChatElementOwner, WaveSignalDevice`

---

public final class VehiclePart
extends [GameEntity](../entity/GameEntity.html "class in zombie.entity")
implements zombie.chat.ChatElementOwner, [WaveSignalDevice](../radio/devices/WaveSignalDevice.html "interface in zombie.radio.devices")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected String`

  `category`

  `protected zombie.chat.ChatElement`

  `chatElement`

  `protected ArrayList<VehiclePart>`

  `children`

  `protected int`

  `condition`

  `protected ItemContainer`

  `container`

  `protected boolean`

  `created`

  `protected DeviceData`

  `deviceData`

  `protected VehicleDoor`

  `door`

  `private float`

  `durability`

  `protected zombie.vehicles.VehicleEngine`

  `engine`

  `private float`

  `engineLoudness`

  `private boolean`

  `hasPlayerInRange`

  `protected InventoryItem`

  `item`

  `private float`

  `lastUpdated`

  `protected VehicleLight`

  `light`

  `private int`

  `mechanicSkillInstaller`

  `private se.krka.kahlua.vm.KahluaTable`

  `modData`

  `protected VehiclePart`

  `parent`

  `protected String`

  `partId`

  `protected VehicleScript.Part`

  `scriptPart`

  `protected boolean`

  `specificItem`

  `private float`

  `suspensionCompression`

  `private float`

  `suspensionDamping`

  `protected short`

  `updateFlags`

  `protected zombie.vehicles.VehiclePartOwner`

  `vehicle`

  `private float`

  `wheelFriction`

  `protected VehicleWindow`

  `window`

  ### Fields inherited from class [GameEntity](../entity/GameEntity.html#field-summary "class in zombie.entity")

  `DEFAULT_ENTITY_DISPLAY_NAME`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehiclePart(zombie.vehicles.VehiclePartOwner vehicle)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addChild(VehiclePart child)`

  `void`

  `AddDeviceText(String line,
  float r,
  float g,
  float b,
  String guid,
  String codes,
  int distance)`

  `private void`

  `callLuaVoid(String functionName,
  Object arg1,
  Object arg2)`

  `void`

  `clearFlags()`

  `DeviceData`

  `createSignalDevice()`

  `void`

  `createSpotLight(float xOffset,
  float yOffset,
  float dist,
  float intensity,
  float dot,
  int focusing)`

  `void`

  `createSpotLightColor(float xOffset,
  float yOffset,
  float dist,
  float intensity,
  float dot,
  int focusing,
  float r,
  float g,
  float b)`

  `void`

  `damage(int amount)`

  `void`

  `doInventoryItemStats(InventoryItem newItem,
  int mechanicSkill)`

  `VehicleWindow`

  `findWindow()`

  `VehicleScript.Anim`

  `getAnimById(String id)`

  `String`

  `getArea()`

  `String`

  `getCategory()`

  `zombie.chat.ChatElement`

  `getChatElement()`

  `VehiclePart`

  `getChild(int index)`

  `int`

  `getChildCount()`

  `VehiclePart`

  `getChildWindow()`

  `int`

  `getCondition()`

  `int`

  `getContainerCapacity()`

  `int`

  `getContainerCapacity(IsoGameCharacter chr)`

  `String`

  `getContainerCloseSound()`

  `float`

  `getContainerContentAmount()`

  `String`

  `getContainerContentType()`

  `String`

  `getContainerOpenSound()`

  `String`

  `getContainerPutSound()`

  `int`

  `getContainerSeatNumber()`

  `String`

  `getContainerTakeSound()`

  `float`

  `getDelta()`

  `DeviceData`

  `getDeviceData()`

  `VehicleDoor`

  `getDoor()`

  `float`

  `getDurability()`

  `VehicleDoor`

  `getEnclosingDoor()`

  `float`

  `getEngineLoudness()`

  `long`

  `getEntityNetID()`

  `boolean`

  `getFlag(short flag)`

  `GameEntityType`

  `getGameEntityType()`

  `String`

  `getId()`

  `int`

  `getIndex()`

  `<T extends InventoryItem>  
  T`

  `getInventoryItem()`

  `ItemContainer`

  `getItemContainer()`

  `ArrayList<String>`

  `getItemType()`

  `float`

  `getLastUpdated()`

  `VehicleLight`

  `getLight()`

  `float`

  `getLightDistance()`

  `float`

  `getLightFocusing()`

  `float`

  `getLightIntensity()`

  `String`

  `getLuaFunction(String name)`

  `String`

  `getMechanicArea()`

  `int`

  `getMechanicSkillInstaller()`

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

  `static float`

  `getNumberByCondition(float number,
  float cond,
  float min)`

  `zombie.vehicles.VehiclePartOwner`

  `getOwner()`

  `VehiclePart`

  `getParent()`

  `protected VehicleScript.Model`

  `getScriptModelById(String id)`

  `VehicleScript.Part`

  `getScriptPart()`

  `IsoGridSquare`

  `getSquare()`

  `float`

  `getSuspensionCompression()`

  `float`

  `getSuspensionDamping()`

  `se.krka.kahlua.vm.KahluaTable`

  `getTable(String id)`

  `BaseVehicle`

  `getVehicle()`

  `zombie.vehicles.VehicleEngine`

  `getVehicleEngine()`

  `float`

  `getWheelFriction()`

  `int`

  `getWheelIndex()`

  `VehicleWindow`

  `getWindow()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `boolean`

  `hasDevicePower()`

  `boolean`

  `hasModData()`

  `boolean`

  `HasPlayerInRange()`

  `boolean`

  `isContainer()`

  `boolean`

  `isEntityValid()`

  `boolean`

  `isInventoryItemUninstalled()`

  `boolean`

  `isSeat()`

  `boolean`

  `isSetAllModelsVisible()`

  `boolean`

  `isSpecificItem()`

  `boolean`

  `isVehicleTrunk()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `private boolean`

  `playerWithinBounds(IsoPlayer player,
  float dist)`

  `void`

  `repair()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setAllModelsVisible(boolean visible)`

  `void`

  `setCategory(String category)`

  `void`

  `setCondition(int condition)`

  `void`

  `setContainerCapacity(int cap)`

  `void`

  `setContainerContentAmount(float amount)`

  `void`

  `setContainerContentAmount(float amount,
  boolean force,
  boolean noUpdateMass)`

  `void`

  `setDelta(float d)`

  `void`

  `setDeviceData(DeviceData data)`

  `void`

  `setDurability(float durability)`

  `void`

  `setEngineLoudness(float engineLoudness)`

  `void`

  `setFlag(short flag)`

  `void`

  `setGeneralCondition(InventoryItem item,
  float baseQuality,
  float chanceToSpawnDamaged)`

  `void`

  `setInventoryItem(InventoryItem item)`

  `void`

  `setInventoryItem(InventoryItem item,
  int mechanicSkill)`

  `void`

  `setItemContainer(ItemContainer container)`

  `void`

  `setLastUpdated(float hours)`

  `void`

  `setLightActive(boolean active)`

  `void`

  `setMechanicSkillInstaller(int mechanicSkillInstaller)`

  `void`

  `setModelVisible(String id,
  boolean visible)`

  `void`

  `setRandomCondition(InventoryItem item)`

  `void`

  `setScriptPart(VehicleScript.Part scriptPart)`

  `void`

  `setSpecificItem(boolean specificItem)`

  `void`

  `setSuspensionCompression(float suspensionCompression)`

  `void`

  `setSuspensionDamping(float suspensionDamping)`

  `void`

  `setWheelFriction(float wheelFriction)`

  `void`

  `updateSignalDevice()`

  ### Methods inherited from class [GameEntity](../entity/GameEntity.html#method-summary "class in zombie.entity")

  `addToWorld, attrib, componentSize, connectComponents, containsComponent, getAttributes, getComponent, getComponentAny, getComponentForIndex, getComponentFromID, getDefaultEntityDisplayName, getDurabilityComponent, getEntityDisplayName, getEntityFullTypeDebug, getEntityScript, getExceptionCompatibleString, getFluidContainer, getSpriteConfig, getUsingPlayer, getXi, getYi, getZi, hasComponent, hasComponentAny, hasComponents, hasRenderers, isAddedToEngine, isMeta, isOutside, isRemovingFromEngine, isScheduledForBucketUpdate, isScheduledForEngineRemoval, isUsingPlayer, isValidEngineEntity, loadEntity, loadEntity, onEquip, onEquip, onFirstCreation, onFluidContainerUpdate, onReceiveEntityPacket, onUnEquip, receiveRequestSyncGameEntity, receiveSyncEntity, receiveUpdateUsingPlayer, removeFromWorld, removeFromWorld, renderlast, renderlastComponents, requiresEntitySave, reset, saveEntity, sendClientEntityPacket, sendComponentEvent, sendComponentEvent, sendEntityEvent, sendEntityEvent, sendRequestSyncGameEntity, sendServerEntityPacket, sendServerEntityPacketTo, sendSyncEntity, sendUpdateUsingPlayer, setUsingPlayer`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [WaveSignalDevice](../radio/devices/WaveSignalDevice.html#method-summary "interface in zombie.radio.devices")

  `AddDeviceText`

* Field Details
  -------------

  + ### vehicle

    protected zombie.vehicles.VehiclePartOwner vehicle
  + ### created

    protected boolean created
  + ### partId

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partId
  + ### scriptPart

    protected [VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") scriptPart
  + ### container

    protected [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container
  + ### item

    protected [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item
  + ### modData

    private se.krka.kahlua.vm.KahluaTable modData
  + ### lastUpdated

    private float lastUpdated
  + ### updateFlags

    protected short updateFlags
  + ### parent

    protected [VehiclePart](VehiclePart.html "class in zombie.vehicles") parent
  + ### door

    protected [VehicleDoor](VehicleDoor.html "class in zombie.vehicles") door
  + ### engine

    protected zombie.vehicles.VehicleEngine engine
  + ### window

    protected [VehicleWindow](VehicleWindow.html "class in zombie.vehicles") window
  + ### children

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehiclePart](VehiclePart.html "class in zombie.vehicles")> children
  + ### category

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category
  + ### condition

    protected int condition
  + ### specificItem

    protected boolean specificItem
  + ### wheelFriction

    private float wheelFriction
  + ### mechanicSkillInstaller

    private int mechanicSkillInstaller
  + ### suspensionDamping

    private float suspensionDamping
  + ### suspensionCompression

    private float suspensionCompression
  + ### engineLoudness

    private float engineLoudness
  + ### durability

    private float durability
  + ### light

    protected [VehicleLight](VehicleLight.html "class in zombie.vehicles") light
  + ### deviceData

    protected [DeviceData](../radio/devices/DeviceData.html "class in zombie.radio.devices") deviceData
  + ### chatElement

    protected zombie.chat.ChatElement chatElement
  + ### hasPlayerInRange

    private boolean hasPlayerInRange
* Constructor Details
  -------------------

  + ### VehiclePart

    public VehiclePart(zombie.vehicles.VehiclePartOwner vehicle)
* Method Details
  --------------

  + ### getOwner

    public zombie.vehicles.VehiclePartOwner getOwner()
  + ### getVehicle

    public [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") getVehicle()
  + ### setScriptPart

    public void setScriptPart([VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") scriptPart)
  + ### getScriptPart

    public [VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") getScriptPart()
  + ### getItemContainer

    public [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") getItemContainer()
  + ### setItemContainer

    public void setItemContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### hasModData

    public boolean hasModData()
  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()
  + ### getLastUpdated

    public float getLastUpdated()
  + ### setLastUpdated

    public void setLastUpdated(float hours)
  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getIndex

    public int getIndex()
  + ### getArea

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getArea()
  + ### getItemType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getItemType()
  + ### getTable

    public se.krka.kahlua.vm.KahluaTable getTable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getInventoryItem

    public <T extends [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> T getInventoryItem()
  + ### setInventoryItem

    public void setInventoryItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    int mechanicSkill)
  + ### setInventoryItem

    public void setInventoryItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isInventoryItemUninstalled

    public boolean isInventoryItemUninstalled()
  + ### isSetAllModelsVisible

    public boolean isSetAllModelsVisible()
  + ### setAllModelsVisible

    public void setAllModelsVisible(boolean visible)
  + ### doInventoryItemStats

    public void doInventoryItemStats([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") newItem,
    int mechanicSkill)
  + ### setRandomCondition

    public void setRandomCondition([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setGeneralCondition

    public void setGeneralCondition([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    float baseQuality,
    float chanceToSpawnDamaged)
  + ### getNumberByCondition

    public static float getNumberByCondition(float number,
    float cond,
    float min)
  + ### isContainer

    public boolean isContainer()
  + ### getContainerCapacity

    public int getContainerCapacity()
  + ### getContainerCapacity

    public int getContainerCapacity([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### setContainerCapacity

    public void setContainerCapacity(int cap)
  + ### getContainerContentType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerContentType()
  + ### getContainerContentAmount

    public float getContainerContentAmount()
  + ### setContainerContentAmount

    public void setContainerContentAmount(float amount)
  + ### setContainerContentAmount

    public void setContainerContentAmount(float amount,
    boolean force,
    boolean noUpdateMass)
  + ### getContainerSeatNumber

    public int getContainerSeatNumber()
  + ### getContainerCloseSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerCloseSound()
  + ### getContainerOpenSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerOpenSound()
  + ### getContainerPutSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerPutSound()
  + ### getContainerTakeSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerTakeSound()
  + ### isSeat

    public boolean isSeat()
  + ### isVehicleTrunk

    public boolean isVehicleTrunk()
  + ### getLuaFunction

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaFunction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getScriptModelById

    protected [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") getScriptModelById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### setModelVisible

    public void setModelVisible([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    boolean visible)
  + ### getParent

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getParent()
  + ### addChild

    public void addChild([VehiclePart](VehiclePart.html "class in zombie.vehicles") child)
  + ### getChildCount

    public int getChildCount()
  + ### getChild

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getChild(int index)
  + ### getDoor

    public [VehicleDoor](VehicleDoor.html "class in zombie.vehicles") getDoor()
  + ### getEnclosingDoor

    public [VehicleDoor](VehicleDoor.html "class in zombie.vehicles") getEnclosingDoor()
  + ### getVehicleEngine

    public zombie.vehicles.VehicleEngine getVehicleEngine()
  + ### getWindow

    public [VehicleWindow](VehicleWindow.html "class in zombie.vehicles") getWindow()
  + ### getChildWindow

    public [VehiclePart](VehiclePart.html "class in zombie.vehicles") getChildWindow()
  + ### findWindow

    public [VehicleWindow](VehicleWindow.html "class in zombie.vehicles") findWindow()
  + ### getAnimById

    public [VehicleScript.Anim](../scripting/objects/VehicleScript.Anim.html "class in zombie.scripting.objects") getAnimById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getWheelIndex

    public int getWheelIndex()
  + ### createSpotLight

    public void createSpotLight(float xOffset,
    float yOffset,
    float dist,
    float intensity,
    float dot,
    int focusing)
  + ### createSpotLightColor

    public void createSpotLightColor(float xOffset,
    float yOffset,
    float dist,
    float intensity,
    float dot,
    int focusing,
    float r,
    float g,
    float b)
  + ### getLight

    public [VehicleLight](VehicleLight.html "class in zombie.vehicles") getLight()
  + ### getLightDistance

    public float getLightDistance()
  + ### getLightIntensity

    public float getLightIntensity()
  + ### getLightFocusing

    public float getLightFocusing()
  + ### setLightActive

    public void setLightActive(boolean active)
  + ### createSignalDevice

    public [DeviceData](../radio/devices/DeviceData.html "class in zombie.radio.devices") createSignalDevice()
  + ### hasDevicePower

    public boolean hasDevicePower()
  + ### getDeviceData

    public [DeviceData](../radio/devices/DeviceData.html "class in zombie.radio.devices") getDeviceData()

    Specified by:
    :   `getDeviceData` in interface `WaveSignalDevice`
  + ### setDeviceData

    public void setDeviceData([DeviceData](../radio/devices/DeviceData.html "class in zombie.radio.devices") data)

    Specified by:
    :   `setDeviceData` in interface `WaveSignalDevice`
  + ### getDelta

    public float getDelta()

    Specified by:
    :   `getDelta` in interface `WaveSignalDevice`
  + ### setDelta

    public void setDelta(float d)

    Specified by:
    :   `setDelta` in interface `WaveSignalDevice`
  + ### getX

    public float getX()

    Specified by:
    :   `getX` in interface `zombie.chat.ChatElementOwner`

    Specified by:
    :   `getX` in interface `WaveSignalDevice`

    Specified by:
    :   `getX` in class `GameEntity`
  + ### getY

    public float getY()

    Specified by:
    :   `getY` in interface `zombie.chat.ChatElementOwner`

    Specified by:
    :   `getY` in interface `WaveSignalDevice`

    Specified by:
    :   `getY` in class `GameEntity`
  + ### getZ

    public float getZ()

    Specified by:
    :   `getZ` in interface `zombie.chat.ChatElementOwner`

    Specified by:
    :   `getZ` in interface `WaveSignalDevice`

    Specified by:
    :   `getZ` in class `GameEntity`
  + ### getSquare

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquare()

    Specified by:
    :   `getSquare` in interface `zombie.chat.ChatElementOwner`

    Specified by:
    :   `getSquare` in interface `WaveSignalDevice`

    Specified by:
    :   `getSquare` in class `GameEntity`
  + ### AddDeviceText

    public void AddDeviceText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    int distance)

    Specified by:
    :   `AddDeviceText` in interface `WaveSignalDevice`
  + ### HasPlayerInRange

    public boolean HasPlayerInRange()

    Specified by:
    :   `HasPlayerInRange` in interface `WaveSignalDevice`
  + ### playerWithinBounds

    private boolean playerWithinBounds([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    float dist)
  + ### updateSignalDevice

    public void updateSignalDevice()
  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()
  + ### setCategory

    public void setCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getCondition

    public int getCondition()
  + ### setCondition

    public void setCondition(int condition)
  + ### damage

    public void damage(int amount)
  + ### isSpecificItem

    public boolean isSpecificItem()
  + ### setSpecificItem

    public void setSpecificItem(boolean specificItem)
  + ### getWheelFriction

    public float getWheelFriction()
  + ### setWheelFriction

    public void setWheelFriction(float wheelFriction)
  + ### getMechanicSkillInstaller

    public int getMechanicSkillInstaller()
  + ### setMechanicSkillInstaller

    public void setMechanicSkillInstaller(int mechanicSkillInstaller)
  + ### getSuspensionDamping

    public float getSuspensionDamping()
  + ### setSuspensionDamping

    public void setSuspensionDamping(float suspensionDamping)
  + ### getSuspensionCompression

    public float getSuspensionCompression()
  + ### setSuspensionCompression

    public void setSuspensionCompression(float suspensionCompression)
  + ### getEngineLoudness

    public float getEngineLoudness()
  + ### setEngineLoudness

    public void setEngineLoudness(float engineLoudness)
  + ### repair

    public void repair()
  + ### callLuaVoid

    private void callLuaVoid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2)
  + ### getChatElement

    public zombie.chat.ChatElement getChatElement()
  + ### getGameEntityType

    public [GameEntityType](../entity/GameEntityType.html "enum class in zombie.entity") getGameEntityType()

    Specified by:
    :   `getGameEntityType` in class `GameEntity`
  + ### isEntityValid

    public boolean isEntityValid()

    Specified by:
    :   `isEntityValid` in class `GameEntity`
  + ### getEntityNetID

    public long getEntityNetID()

    Specified by:
    :   `getEntityNetID` in class `GameEntity`
  + ### setDurability

    public void setDurability(float durability)
  + ### getDurability

    public float getDurability()
  + ### getMechanicArea

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMechanicArea()
  + ### setFlag

    public void setFlag(short flag)
  + ### getFlag

    public boolean getFlag(short flag)
  + ### clearFlags

    public void clearFlags()