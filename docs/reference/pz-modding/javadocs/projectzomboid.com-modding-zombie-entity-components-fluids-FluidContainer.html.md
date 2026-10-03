[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [FluidContainer](FluidContainer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [MAX\_FLUIDS](#MAX_FLUIDS)
   2. [DEF\_CONTAINER\_NAME](#DEF_CONTAINER_NAME)
   3. [colorDef](#colorDef)
   4. [DEFAULT\_TRANSFER\_RATE](#DEFAULT_TRANSFER_RATE)
   5. [capacity](#capacity)
   6. [whitelist](#whitelist)
   7. [blacklist](#blacklist)
   8. [temperature](#temperature)
   9. [fluids](#fluids)
   10. [propertiesCache](#propertiesCache)
   11. [amountCache](#amountCache)
   12. [color](#color)
   13. [containerName](#containerName)
   14. [translatedContainerName](#translatedContainerName)
   15. [nameCache](#nameCache)
   16. [customDrinkSound](#customDrinkSound)
   17. [cacheInvalidated](#cacheInvalidated)
   18. [inputLocked](#inputLocked)
   19. [canPlayerEmpty](#canPlayerEmpty)
   20. [hiddenAmount](#hiddenAmount)
   21. [rainCatcher](#rainCatcher)
   22. [fillsWithCleanWater](#fillsWithCleanWater)
   23. [tempFluidUI](#tempFluidUI)
   24. [df](#df)
6. [Constructor Details](#constructor-detail)
   1. [FluidContainer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [CreateContainer()](#CreateContainer())
   2. [DisposeContainer(FluidContainer)](#DisposeContainer(zombie.entity.components.fluids.FluidContainer))
   3. [readFromScript(ComponentScript)](#readFromScript(zombie.scripting.entity.ComponentScript))
   4. [addInitialFluid(float, FluidContainerScript.FluidScript, String)](#addInitialFluid(float,zombie.scripting.entity.components.fluids.FluidContainerScript.FluidScript,java.lang.String))
   5. [reset()](#reset())
   6. [copy()](#copy())
   7. [copyFluidsFrom(FluidContainer)](#copyFluidsFrom(zombie.entity.components.fluids.FluidContainer))
   8. [getCustomDrinkSound()](#getCustomDrinkSound())
   9. [setInputLocked(boolean)](#setInputLocked(boolean))
   10. [isInputLocked()](#isInputLocked())
   11. [canPlayerEmpty()](#canPlayerEmpty())
   12. [setCanPlayerEmpty(boolean)](#setCanPlayerEmpty(boolean))
   13. [getRainCatcher()](#getRainCatcher())
   14. [setRainCatcher(float)](#setRainCatcher(float))
   15. [isFilledWithCleanWater()](#isFilledWithCleanWater())
   16. [isHiddenAmount()](#isHiddenAmount())
   17. [DoTooltip(ObjectTooltip)](#DoTooltip(zombie.ui.ObjectTooltip))
   18. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))
   19. [doToolTipProp(ObjectTooltip.Layout, String, float)](#doToolTipProp(zombie.ui.ObjectTooltip.Layout,java.lang.String,float))
   20. [getContainerName()](#getContainerName())
   21. [setContainerName(String)](#setContainerName(java.lang.String))
   22. [getTranslatedContainerName()](#getTranslatedContainerName())
   23. [getUiName()](#getUiName())
   24. [getProperties()](#getProperties())
   25. [isEmpty()](#isEmpty())
   26. [isFull()](#isFull())
   27. [getCapacity()](#getCapacity())
   28. [getFreeCapacity()](#getFreeCapacity())
   29. [getFilledRatio()](#getFilledRatio())
   30. [invalidateColor()](#invalidateColor())
   31. [getColor()](#getColor())
   32. [getAmount()](#getAmount())
   33. [recalculateCaches()](#recalculateCaches())
   34. [recalculateCaches(boolean)](#recalculateCaches(boolean))
   35. [recalculateCaches(boolean, boolean)](#recalculateCaches(boolean,boolean))
   36. [getPoisonAmount()](#getPoisonAmount())
   37. [getPoisonRatio()](#getPoisonRatio())
   38. [isPoisonous()](#isPoisonous())
   39. [getPoisonEffect()](#getPoisonEffect())
   40. [isTainted()](#isTainted())
   41. [setCapacity(float)](#setCapacity(float))
   42. [adjustAmount(float)](#adjustAmount(float))
   43. [adjustSpecificFluidAmount(Fluid, float)](#adjustSpecificFluidAmount(zombie.entity.components.fluids.Fluid,float))
   44. [getSpecificFluidAmount(Fluid)](#getSpecificFluidAmount(zombie.entity.components.fluids.Fluid))
   45. [createFluidSample()](#createFluidSample())
   46. [createFluidSample(float)](#createFluidSample(float))
   47. [createFluidSample(FluidSample, float)](#createFluidSample(zombie.entity.components.fluids.FluidSample,float))
   48. [isPureFluid(Fluid)](#isPureFluid(zombie.entity.components.fluids.Fluid))
   49. [isPrimaryFluidType(FluidType)](#isPrimaryFluidType(zombie.entity.components.fluids.FluidType))
   50. [isPrimaryFluidType(String)](#isPrimaryFluidType(java.lang.String))
   51. [getPrimaryFluid()](#getPrimaryFluid())
   52. [getPrimaryFluidAmount()](#getPrimaryFluidAmount())
   53. [isPrimaryFluid(Fluid)](#isPrimaryFluid(zombie.entity.components.fluids.Fluid))
   54. [isWaterSource()](#isWaterSource())
   55. [isWaterOnlySource()](#isWaterOnlySource())
   56. [isPerceivedFluidToPlayer(Fluid, IsoGameCharacter)](#isPerceivedFluidToPlayer(zombie.entity.components.fluids.Fluid,zombie.characters.IsoGameCharacter))
   57. [isMixture()](#isMixture())
   58. [getWhitelist()](#getWhitelist())
   59. [getBlacklist()](#getBlacklist())
   60. [Empty()](#Empty())
   61. [Empty(boolean)](#Empty(boolean))
   62. [getFluidInstance(Fluid)](#getFluidInstance(zombie.entity.components.fluids.Fluid))
   63. [canAddFluid(Fluid)](#canAddFluid(zombie.entity.components.fluids.Fluid))
   64. [addFluid(String, float)](#addFluid(java.lang.String,float))
   65. [addFluid(FluidType, float)](#addFluid(zombie.entity.components.fluids.FluidType,float))
   66. [addFluid(Fluid, float)](#addFluid(zombie.entity.components.fluids.Fluid,float))
   67. [addFluid(FluidInstance, float)](#addFluid(zombie.entity.components.fluids.FluidInstance,float))
   68. [removeFluid()](#removeFluid())
   69. [removeFluid(boolean)](#removeFluid(boolean))
   70. [removeFluid(float)](#removeFluid(float))
   71. [removeFluid(float, boolean)](#removeFluid(float,boolean))
   72. [removeFluid(float, boolean, FluidConsume)](#removeFluid(float,boolean,zombie.entity.components.fluids.FluidConsume))
   73. [removeFluidInstanceIfEmpty(FluidInstance)](#removeFluidInstanceIfEmpty(zombie.entity.components.fluids.FluidInstance))
   74. [contains(Fluid)](#contains(zombie.entity.components.fluids.Fluid))
   75. [getRatioForFluid(Fluid)](#getRatioForFluid(zombie.entity.components.fluids.Fluid))
   76. [isCategory(FluidCategory)](#isCategory(zombie.entity.components.fluids.FluidCategory))
   77. [isAllCategory(FluidCategory)](#isAllCategory(zombie.entity.components.fluids.FluidCategory))
   78. [transferTo(FluidContainer)](#transferTo(zombie.entity.components.fluids.FluidContainer))
   79. [transferTo(FluidContainer, float)](#transferTo(zombie.entity.components.fluids.FluidContainer,float))
   80. [transferFrom(FluidContainer)](#transferFrom(zombie.entity.components.fluids.FluidContainer))
   81. [transferFrom(FluidContainer, float)](#transferFrom(zombie.entity.components.fluids.FluidContainer,float))
   82. [GetTransferReason(FluidContainer, FluidContainer)](#GetTransferReason(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer))
   83. [GetTransferReason(FluidContainer, FluidContainer, boolean)](#GetTransferReason(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,boolean))
   84. [CanTransfer(FluidContainer, FluidContainer)](#CanTransfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer))
   85. [Transfer(FluidContainer, FluidContainer)](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer))
   86. [Transfer(FluidContainer, FluidContainer, float)](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float))
   87. [Transfer(FluidContainer, FluidContainer, float, boolean)](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float,boolean))
   88. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   89. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   90. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   91. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   92. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   93. [unsealIfNotFull()](#unsealIfNotFull())
   94. [unseal()](#unseal())
   95. [isQualifiesForMetaStorage()](#isQualifiesForMetaStorage())
   96. [setWhitelist(FluidFilter)](#setWhitelist(zombie.entity.components.fluids.FluidFilter))
   97. [isTaintedStatusKnown()](#isTaintedStatusKnown())
   98. [setNonSavedFieldsFromItemScript(InventoryItem)](#setNonSavedFieldsFromItemScript(zombie.inventory.InventoryItem))
   99. [isMultiTileMoveable()](#isMultiTileMoveable())
   100. [getTransferRate()](#getTransferRate())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class FluidContainer
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.fluids.FluidContainer

---

public class FluidContainer
extends [Component](../../Component.html "class in zombie.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `amountCache`

  `private FluidFilter`

  `blacklist`

  `private boolean`

  `cacheInvalidated`

  `private boolean`

  `canPlayerEmpty`

  `private float`

  `capacity`

  `private final Color`

  `color`

  `private static final Color`

  `colorDef`

  `private String`

  `containerName`

  `private String`

  `customDrinkSound`

  `static final String`

  `DEF_CONTAINER_NAME`

  `static final float`

  `DEFAULT_TRANSFER_RATE`

  `private static final DecimalFormat`

  `df`

  `private boolean`

  `fillsWithCleanWater`

  `private final ArrayList<zombie.entity.components.fluids.FluidInstance>`

  `fluids`

  `private boolean`

  `hiddenAmount`

  `private boolean`

  `inputLocked`

  `static final int`

  `MAX_FLUIDS`

  `private String`

  `nameCache`

  `private final SealedFluidProperties`

  `propertiesCache`

  `private float`

  `rainCatcher`

  `private float`

  `temperature`

  `private static final ArrayList<zombie.entity.components.fluids.FluidInstance>`

  `tempFluidUI`

  `private String`

  `translatedContainerName`

  `private FluidFilter`

  `whitelist`

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FluidContainer()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addFluid(String fluidType,
  float amount)`

  Overload to [`addFluid(FluidInstance, float)`](#addFluid(zombie.entity.components.fluids.FluidInstance,float))

  `private void`

  `addFluid(zombie.entity.components.fluids.FluidInstance addInstance,
  float add)`

  Adds the specified fluid to this container with the specified amount.

  `void`

  `addFluid(Fluid fluid,
  float amount)`

  Overload to [`addFluid(FluidInstance, float)`](#addFluid(zombie.entity.components.fluids.FluidInstance,float))

  `void`

  `addFluid(FluidType fluidType,
  float amount)`

  Overload to [`addFluid(FluidInstance, float)`](#addFluid(zombie.entity.components.fluids.FluidInstance,float))

  `private void`

  `addInitialFluid(float initialAmount,
  FluidContainerScript.FluidScript fs,
  String scriptName)`

  `void`

  `adjustAmount(float newAmount)`

  `void`

  `adjustSpecificFluidAmount(Fluid fluid,
  float newAmount)`

  `boolean`

  `canAddFluid(Fluid fluid)`

  `boolean`

  `canPlayerEmpty()`

  `static boolean`

  `CanTransfer(FluidContainer source,
  FluidContainer target)`

  `boolean`

  `contains(Fluid fluid)`

  `FluidContainer`

  `copy()`

  `void`

  `copyFluidsFrom(FluidContainer other)`

  `static FluidContainer`

  `CreateContainer()`

  `FluidSample`

  `createFluidSample()`

  `FluidSample`

  `createFluidSample(float scaleAmount)`

  Creates a new fluid sample instance.

  `FluidSample`

  `createFluidSample(FluidSample sample,
  float scaleAmount)`

  Creates a fluid sample to existing FluidSample instance.

  `static void`

  `DisposeContainer(FluidContainer container)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI)`

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `private void`

  `doToolTipProp(ObjectTooltip.Layout layout,
  String transKey,
  float value)`

  `void`

  `Empty()`

  `void`

  `Empty(boolean bRecalculate)`

  `float`

  `getAmount()`

  `FluidFilter`

  `getBlacklist()`

  `float`

  `getCapacity()`

  `Color`

  `getColor()`

  `String`

  `getContainerName()`

  Container name serves as ID for this container, name contains no whitespaces.

  `String`

  `getCustomDrinkSound()`

  `float`

  `getFilledRatio()`

  `private zombie.entity.components.fluids.FluidInstance`

  `getFluidInstance(Fluid fluid)`

  `float`

  `getFreeCapacity()`

  `private float`

  `getPoisonAmount()`

  `PoisonEffect`

  `getPoisonEffect()`

  `float`

  `getPoisonRatio()`

  `Fluid`

  `getPrimaryFluid()`

  `float`

  `getPrimaryFluidAmount()`

  `SealedFluidProperties`

  `getProperties()`

  `float`

  `getRainCatcher()`

  `float`

  `getRatioForFluid(Fluid fluid)`

  `float`

  `getSpecificFluidAmount(Fluid fluid)`

  `float`

  `getTransferRate()`

  `static String`

  `GetTransferReason(FluidContainer source,
  FluidContainer target)`

  `static String`

  `GetTransferReason(FluidContainer source,
  FluidContainer target,
  boolean testFirst)`

  `String`

  `getTranslatedContainerName()`

  `String`

  `getUiName()`

  `FluidFilter`

  `getWhitelist()`

  `protected void`

  `invalidateColor()`

  `boolean`

  `isAllCategory(FluidCategory category)`

  `boolean`

  `isCategory(FluidCategory category)`

  `boolean`

  `isEmpty()`

  `boolean`

  `isFilledWithCleanWater()`

  `boolean`

  `isFull()`

  `boolean`

  `isHiddenAmount()`

  `boolean`

  `isInputLocked()`

  `boolean`

  `isMixture()`

  `boolean`

  `isMultiTileMoveable()`

  `boolean`

  `isPerceivedFluidToPlayer(Fluid fluid,
  IsoGameCharacter character)`

  Returns true if the contents seems like Fluid x to player.

  `boolean`

  `isPoisonous()`

  `boolean`

  `isPrimaryFluid(Fluid fluid)`

  `boolean`

  `isPrimaryFluidType(String fluidType)`

  `boolean`

  `isPrimaryFluidType(FluidType fluidType)`

  `boolean`

  `isPureFluid(Fluid fluid)`

  `boolean`

  `isQualifiesForMetaStorage()`

  Defaults true, can be overridden.

  `boolean`

  `isTainted()`

  `boolean`

  `isTaintedStatusKnown()`

  `boolean`

  `isWaterOnlySource()`

  `boolean`

  `isWaterSource()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `protected void`

  `loadSyncData(ByteBuffer input)`

  `protected boolean`

  `onReceivePacket(zombie.core.network.ByteBufferReader input,
  zombie.entity.network.EntityPacketType type,
  zombie.network.IConnection senderConnection)`

  `protected void`

  `readFromScript(ComponentScript componentScript)`

  `private void`

  `recalculateCaches()`

  `private void`

  `recalculateCaches(boolean force)`

  `private void`

  `recalculateCaches(boolean force,
  boolean removeInvalid)`

  `void`

  `removeFluid()`

  Removes all contained fluid (or mixture of fluids).

  `FluidConsume`

  `removeFluid(boolean createFluidConsume)`

  Removes all contained fluid (or mixture of fluids).

  `void`

  `removeFluid(float remove)`

  Removes a certain amount of the contained fluid (or mixture of fluids).

  `FluidConsume`

  `removeFluid(float remove,
  boolean createFluidConsume)`

  Removes a certain amount of the contained fluid (or mixture of fluids).

  `FluidConsume`

  `removeFluid(float remove,
  boolean createFluidConsume,
  FluidConsume fluidConsume)`

  Removes a certain amount of the contained fluid (or mixture of fluids).

  `private boolean`

  `removeFluidInstanceIfEmpty(zombie.entity.components.fluids.FluidInstance fluid)`

  `protected void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  `protected void`

  `saveSyncData(ByteBuffer output)`

  `void`

  `setCanPlayerEmpty(boolean b)`

  `void`

  `setCapacity(float capacity)`

  `void`

  `setContainerName(String name)`

  `void`

  `setInputLocked(boolean b)`

  `void`

  `setNonSavedFieldsFromItemScript(InventoryItem item)`

  `void`

  `setRainCatcher(float rainCatcher)`

  `void`

  `setWhitelist(FluidFilter ff)`

  `static void`

  `Transfer(FluidContainer source,
  FluidContainer target)`

  `static void`

  `Transfer(FluidContainer source,
  FluidContainer target,
  float amount)`

  `static void`

  `Transfer(FluidContainer source,
  FluidContainer target,
  float amount,
  boolean keepSource)`

  `void`

  `transferFrom(FluidContainer other)`

  `void`

  `transferFrom(FluidContainer other,
  float amount)`

  `void`

  `transferTo(FluidContainer other)`

  `void`

  `transferTo(FluidContainer other,
  float amount)`

  `void`

  `unseal()`

  `void`

  `unsealIfNotFull()`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `dumpContentsInSquare, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isNoContainerOrEmpty, isRenderLast, isRunningInMeta, isUsingPlayer, isValid, isValidOwnerType, onAddedToOwner, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### MAX\_FLUIDS

    public static final int MAX\_FLUIDS

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidContainer.MAX_FLUIDS)
  + ### DEF\_CONTAINER\_NAME

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") DEF\_CONTAINER\_NAME

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidContainer.DEF_CONTAINER_NAME)
  + ### colorDef

    private static final [Color](../../../core/Color.html "class in zombie.core") colorDef
  + ### DEFAULT\_TRANSFER\_RATE

    public static final float DEFAULT\_TRANSFER\_RATE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidContainer.DEFAULT_TRANSFER_RATE)
  + ### capacity

    private float capacity
  + ### whitelist

    private [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") whitelist
  + ### blacklist

    private [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") blacklist
  + ### temperature

    private float temperature
  + ### fluids

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.entity.components.fluids.FluidInstance> fluids
  + ### propertiesCache

    private final [SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids") propertiesCache
  + ### amountCache

    private float amountCache
  + ### color

    private final [Color](../../../core/Color.html "class in zombie.core") color
  + ### containerName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerName
  + ### translatedContainerName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translatedContainerName
  + ### nameCache

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nameCache
  + ### customDrinkSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customDrinkSound
  + ### cacheInvalidated

    private boolean cacheInvalidated
  + ### inputLocked

    private boolean inputLocked
  + ### canPlayerEmpty

    private boolean canPlayerEmpty
  + ### hiddenAmount

    private boolean hiddenAmount
  + ### rainCatcher

    private float rainCatcher
  + ### fillsWithCleanWater

    private boolean fillsWithCleanWater
  + ### tempFluidUI

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.entity.components.fluids.FluidInstance> tempFluidUI
  + ### df

    private static final [DecimalFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/DecimalFormat.html "class or interface in java.text") df
* Constructor Details
  -------------------

  + ### FluidContainer

    private FluidContainer()
* Method Details
  --------------

  + ### CreateContainer

    public static [FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") CreateContainer()
  + ### DisposeContainer

    public static void DisposeContainer([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") container)
  + ### readFromScript

    protected void readFromScript([ComponentScript](../../../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") componentScript)

    Overrides:
    :   `readFromScript` in class `Component`
  + ### addInitialFluid

    private void addInitialFluid(float initialAmount,
    [FluidContainerScript.FluidScript](../../../scripting/entity/components/fluids/FluidContainerScript.FluidScript.html "class in zombie.scripting.entity.components.fluids") fs,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName)
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `Component`
  + ### copy

    public [FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") copy()
  + ### copyFluidsFrom

    public void copyFluidsFrom([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") other)
  + ### getCustomDrinkSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomDrinkSound()
  + ### setInputLocked

    public void setInputLocked(boolean b)
  + ### isInputLocked

    public boolean isInputLocked()
  + ### canPlayerEmpty

    public boolean canPlayerEmpty()
  + ### setCanPlayerEmpty

    public void setCanPlayerEmpty(boolean b)
  + ### getRainCatcher

    public float getRainCatcher()
  + ### setRainCatcher

    public void setRainCatcher(float rainCatcher)
  + ### isFilledWithCleanWater

    public boolean isFilledWithCleanWater()
  + ### isHiddenAmount

    public boolean isHiddenAmount()
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI)

    Overrides:
    :   `DoTooltip` in class `Component`
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoTooltip` in class `Component`
  + ### doToolTipProp

    private void doToolTipProp([ObjectTooltip.Layout](../../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") transKey,
    float value)
  + ### getContainerName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerName()

    Container name serves as ID for this container, name contains no whitespaces.
    This name is used to for example to grab translated container name. Fluid\_Container\_
  + ### setContainerName

    public void setContainerName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getTranslatedContainerName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedContainerName()
  + ### getUiName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUiName()
  + ### getProperties

    public [SealedFluidProperties](SealedFluidProperties.html "class in zombie.entity.components.fluids") getProperties()
  + ### isEmpty

    public boolean isEmpty()
  + ### isFull

    public boolean isFull()
  + ### getCapacity

    public float getCapacity()
  + ### getFreeCapacity

    public float getFreeCapacity()
  + ### getFilledRatio

    public float getFilledRatio()
  + ### invalidateColor

    protected void invalidateColor()
  + ### getColor

    public [Color](../../../core/Color.html "class in zombie.core") getColor()
  + ### getAmount

    public float getAmount()
  + ### recalculateCaches

    private void recalculateCaches()
  + ### recalculateCaches

    private void recalculateCaches(boolean force)
  + ### recalculateCaches

    private void recalculateCaches(boolean force,
    boolean removeInvalid)
  + ### getPoisonAmount

    private float getPoisonAmount()
  + ### getPoisonRatio

    public float getPoisonRatio()
  + ### isPoisonous

    public boolean isPoisonous()
  + ### getPoisonEffect

    public [PoisonEffect](PoisonEffect.html "enum class in zombie.entity.components.fluids") getPoisonEffect()
  + ### isTainted

    public boolean isTainted()
  + ### setCapacity

    public void setCapacity(float capacity)
  + ### adjustAmount

    public void adjustAmount(float newAmount)
  + ### adjustSpecificFluidAmount

    public void adjustSpecificFluidAmount([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid,
    float newAmount)
  + ### getSpecificFluidAmount

    public float getSpecificFluidAmount([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### createFluidSample

    public [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") createFluidSample()
  + ### createFluidSample

    public [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") createFluidSample(float scaleAmount)

    Creates a new fluid sample instance.
    Fluid sample contains copies of the stored FluidInstance's state at the time the function is called.
    Scales the sample to provided amount.
  + ### createFluidSample

    public [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") createFluidSample([FluidSample](FluidSample.html "class in zombie.entity.components.fluids") sample,
    float scaleAmount)

    Creates a fluid sample to existing FluidSample instance.
    Fluid sample contains copies of the stored FluidInstance's state at the time the function is called.
    Scales the sample to provided amount.
  + ### isPureFluid

    public boolean isPureFluid([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### isPrimaryFluidType

    public boolean isPrimaryFluidType([FluidType](FluidType.html "enum class in zombie.entity.components.fluids") fluidType)
  + ### isPrimaryFluidType

    public boolean isPrimaryFluidType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidType)
  + ### getPrimaryFluid

    public [Fluid](Fluid.html "class in zombie.entity.components.fluids") getPrimaryFluid()
  + ### getPrimaryFluidAmount

    public float getPrimaryFluidAmount()
  + ### isPrimaryFluid

    public boolean isPrimaryFluid([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### isWaterSource

    public boolean isWaterSource()
  + ### isWaterOnlySource

    public boolean isWaterOnlySource()
  + ### isPerceivedFluidToPlayer

    public boolean isPerceivedFluidToPlayer([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid,
    [IsoGameCharacter](../../../characters/IsoGameCharacter.html "class in zombie.characters") character)

    Returns true if the contents seems like Fluid x to player.
    Used for example in recipes, where the recipe may require water.
    If the water is poisoned and the player does not notice it, the container can pass as 'water' container.
    However if the player has sufficient skill to perceive the poison it will not pass.
  + ### isMixture

    public boolean isMixture()
  + ### getWhitelist

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") getWhitelist()
  + ### getBlacklist

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") getBlacklist()
  + ### Empty

    public void Empty()
  + ### Empty

    public void Empty(boolean bRecalculate)
  + ### getFluidInstance

    private zombie.entity.components.fluids.FluidInstance getFluidInstance([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### canAddFluid

    public boolean canAddFluid([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### addFluid

    public void addFluid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidType,
    float amount)

    Overload to [`addFluid(FluidInstance, float)`](#addFluid(zombie.entity.components.fluids.FluidInstance,float))

    **NOTE: when transferring fluids between containers use the dedicated functions.**
    See for example: [`Transfer(FluidContainer, FluidContainer, float)`](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float))
  + ### addFluid

    public void addFluid([FluidType](FluidType.html "enum class in zombie.entity.components.fluids") fluidType,
    float amount)

    Overload to [`addFluid(FluidInstance, float)`](#addFluid(zombie.entity.components.fluids.FluidInstance,float))

    **NOTE: when transferring fluids between containers use the dedicated functions.**
    See for example: [`Transfer(FluidContainer, FluidContainer, float)`](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float))
  + ### addFluid

    public void addFluid([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid,
    float amount)

    Overload to [`addFluid(FluidInstance, float)`](#addFluid(zombie.entity.components.fluids.FluidInstance,float))

    **NOTE: when transferring fluids between containers use the dedicated functions.**
    See for example: [`Transfer(FluidContainer, FluidContainer, float)`](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float))
  + ### addFluid

    private void addFluid(zombie.entity.components.fluids.FluidInstance addInstance,
    float add)

    Adds the specified fluid to this container with the specified amount.

    Will fit as much as possible and discard the remainder amount.
  + ### removeFluid

    public void removeFluid()

    Removes all contained fluid (or mixture of fluids).
    Does **not** return a [`FluidConsume`](FluidConsume.html "class in zombie.entity.components.fluids") object containing consumption information.

    For consumption removal use [`removeFluid(float, boolean)`](#removeFluid(float,boolean))

    **NOTE: when transferring fluids between containers use the dedicated functions.**
    See for example: [`Transfer(FluidContainer, FluidContainer, float)`](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float))
  + ### removeFluid

    public [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") removeFluid(boolean createFluidConsume)

    Removes all contained fluid (or mixture of fluids).
    If `createFluidConsume` is true a [`FluidConsume`](FluidConsume.html "class in zombie.entity.components.fluids") object is returned containing consumption information.

    The FluidConsume object should be released after being processed with [`FluidConsume.release()`](FluidConsume.html#release())

    The consumption values get automatically calculated based on the amount removed.

    If this container has multiple [`Fluid`](Fluid.html "class in zombie.entity.components.fluids")'s the consumption info returned will be based on the percentages of each fluid.

    **NOTE: when transferring fluids between containers use the dedicated functions.**
    See for example: [`Transfer(FluidContainer, FluidContainer, float)`](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float))
  + ### removeFluid

    public void removeFluid(float remove)

    Removes a certain amount of the contained fluid (or mixture of fluids).
    Does **not** return a [`FluidConsume`](FluidConsume.html "class in zombie.entity.components.fluids") object containing consumption information.

    If this container has multiple [`Fluid`](Fluid.html "class in zombie.entity.components.fluids")'s the amount removed will be evenly distributed.

    For consumption removal use [`removeFluid(float, boolean)`](#removeFluid(float,boolean))

    **NOTE: when transferring fluids between containers use the dedicated functions.**
    See for example: [`Transfer(FluidContainer, FluidContainer, float)`](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float))
  + ### removeFluid

    public [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") removeFluid(float remove,
    boolean createFluidConsume)

    Removes a certain amount of the contained fluid (or mixture of fluids).
    If `createFluidConsume` is true a [`FluidConsume`](FluidConsume.html "class in zombie.entity.components.fluids") object is returned containing consumption information.

    The FluidConsume object should be released after being processed with [`FluidConsume.release()`](FluidConsume.html#release())

    The consumption values get automatically calculated based on the amount removed.

    If this container has multiple [`Fluid`](Fluid.html "class in zombie.entity.components.fluids")'s the amount removed will be evenly distributed.
    The consumption info returned will be based on the percentages of each fluid.

    **NOTE: when transferring fluids between containers use the dedicated functions.**
    See for example: [`Transfer(FluidContainer, FluidContainer, float)`](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float))
  + ### removeFluid

    public [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") removeFluid(float remove,
    boolean createFluidConsume,
    [FluidConsume](FluidConsume.html "class in zombie.entity.components.fluids") fluidConsume)

    Removes a certain amount of the contained fluid (or mixture of fluids).
    If `createFluidConsume` is true a [`FluidConsume`](FluidConsume.html "class in zombie.entity.components.fluids") object is created and returned containing consumption information.

    If created in function the FluidConsume object can be released after being processed, with [`FluidConsume.release()`](FluidConsume.html#release())

    If a [`FluidConsume`](FluidConsume.html "class in zombie.entity.components.fluids") instance is passed to `fluidConsume` that will be used instead.
    The consumption values get automatically calculated based on the amount removed.

    If this container has multiple [`Fluid`](Fluid.html "class in zombie.entity.components.fluids")'s the amount removed will be evenly distributed.
    The consumption info returned will be based on the percentages of each fluid.

    **NOTE: when transferring fluids between containers use the dedicated functions.**
    See for example: [`Transfer(FluidContainer, FluidContainer, float)`](#Transfer(zombie.entity.components.fluids.FluidContainer,zombie.entity.components.fluids.FluidContainer,float))
  + ### removeFluidInstanceIfEmpty

    private boolean removeFluidInstanceIfEmpty(zombie.entity.components.fluids.FluidInstance fluid)
  + ### contains

    public boolean contains([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### getRatioForFluid

    public float getRatioForFluid([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### isCategory

    public boolean isCategory([FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") category)
  + ### isAllCategory

    public boolean isAllCategory([FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") category)
  + ### transferTo

    public void transferTo([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") other)
  + ### transferTo

    public void transferTo([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") other,
    float amount)
  + ### transferFrom

    public void transferFrom([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") other)
  + ### transferFrom

    public void transferFrom([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") other,
    float amount)
  + ### GetTransferReason

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetTransferReason([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") source,
    [FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") target)
  + ### GetTransferReason

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GetTransferReason([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") source,
    [FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") target,
    boolean testFirst)
  + ### CanTransfer

    public static boolean CanTransfer([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") source,
    [FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") target)
  + ### Transfer

    public static void Transfer([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") source,
    [FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") target)
  + ### Transfer

    public static void Transfer([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") source,
    [FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") target,
    float amount)
  + ### Transfer

    public static void Transfer([FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") source,
    [FluidContainer](FluidContainer.html "class in zombie.entity.components.fluids") target,
    float amount,
    boolean keepSource)
  + ### onReceivePacket

    protected boolean onReceivePacket(zombie.core.network.ByteBufferReader input,
    zombie.entity.network.EntityPacketType type,
    zombie.network.IConnection senderConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `onReceivePacket` in class `Component`

    Throws:
    :   `IOException`
  + ### saveSyncData

    protected void saveSyncData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `saveSyncData` in class `Component`

    Throws:
    :   `IOException`
  + ### loadSyncData

    protected void loadSyncData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `loadSyncData` in class `Component`

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `Component`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `Component`

    Throws:
    :   `IOException`
  + ### unsealIfNotFull

    public void unsealIfNotFull()
  + ### unseal

    public void unseal()
  + ### isQualifiesForMetaStorage

    public boolean isQualifiesForMetaStorage()

    Description copied from class: `Component`

    Defaults true, can be overridden.
    Should return true if the component has the conditions required for it to require meta updating.
    This can be used to limit the amount of meta entities stored in meta system.
    For example a craft station that is not running and has no logistic connections could be omitted.

    Overrides:
    :   `isQualifiesForMetaStorage` in class `Component`
  + ### setWhitelist

    public void setWhitelist([FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") ff)
  + ### isTaintedStatusKnown

    public boolean isTaintedStatusKnown()
  + ### setNonSavedFieldsFromItemScript

    public void setNonSavedFieldsFromItemScript([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### isMultiTileMoveable

    public boolean isMultiTileMoveable()
  + ### getTransferRate

    public float getTransferRate()