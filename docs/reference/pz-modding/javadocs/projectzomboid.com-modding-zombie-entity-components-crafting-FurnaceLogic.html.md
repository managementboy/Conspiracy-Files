[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [FurnaceLogic](FurnaceLogic.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [SLOT\_POOL](#SLOT_POOL)
   2. [\_emptyRecipeList](#_emptyRecipeList)
   3. [\_emptyResourceList](#_emptyResourceList)
   4. [furnaceRecipeTagQuery](#furnaceRecipeTagQuery)
   5. [fuelRecipeTagQuery](#fuelRecipeTagQuery)
   6. [furnaceRecipes](#furnaceRecipes)
   7. [fuelRecipes](#fuelRecipes)
   8. [startMode](#startMode)
   9. [currentRecipe](#currentRecipe)
   10. [elapsedTime](#elapsedTime)
   11. [doAutomaticCraftCheck](#doAutomaticCraftCheck)
   12. [startRequested](#startRequested)
   13. [stopRequested](#stopRequested)
   14. [requestingPlayer](#requestingPlayer)
   15. [craftData](#craftData)
   16. [craftTestData](#craftTestData)
   17. [furnaceInputsGroupName](#furnaceInputsGroupName)
   18. [furnaceOutputsGroupName](#furnaceOutputsGroupName)
   19. [fuelInputsGroupName](#fuelInputsGroupName)
   20. [fuelOutputsGroupName](#fuelOutputsGroupName)
   21. [furnaceSlots](#furnaceSlots)
   22. [furnaceSlotSize](#furnaceSlotSize)
7. [Constructor Details](#constructor-detail)
   1. [FurnaceLogic()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [allocFurnaceSlot(int)](#allocFurnaceSlot(int))
   2. [releaseFurnaceSlot(FurnaceLogic.FurnaceSlot)](#releaseFurnaceSlot(zombie.entity.components.crafting.FurnaceLogic.FurnaceSlot))
   3. [readFromScript(ComponentScript)](#readFromScript(zombie.scripting.entity.ComponentScript))
   4. [isValid()](#isValid())
   5. [reset()](#reset())
   6. [clearRecipe()](#clearRecipe())
   7. [clearSlots()](#clearSlots())
   8. [getSlotSize()](#getSlotSize())
   9. [getSlot(int)](#getSlot(int))
   10. [createSlot(int)](#createSlot(int))
   11. [getInputSlotResource(int)](#getInputSlotResource(int))
   12. [getOutputSlotResource(int)](#getOutputSlotResource(int))
   13. [getStartMode()](#getStartMode())
   14. [getElapsedTime()](#getElapsedTime())
   15. [setElapsedTime(int)](#setElapsedTime(int))
   16. [isStartRequested()](#isStartRequested())
   17. [setStartRequested(boolean)](#setStartRequested(boolean))
   18. [isStopRequested()](#isStopRequested())
   19. [setStopRequested(boolean)](#setStopRequested(boolean))
   20. [getRequestingPlayer()](#getRequestingPlayer())
   21. [setRequestingPlayer(IsoPlayer)](#setRequestingPlayer(zombie.characters.IsoPlayer))
   22. [isDoAutomaticCraftCheck()](#isDoAutomaticCraftCheck())
   23. [setDoAutomaticCraftCheck(boolean)](#setDoAutomaticCraftCheck(boolean))
   24. [getCraftData()](#getCraftData())
   25. [getCraftTestData()](#getCraftTestData())
   26. [getFurnaceInputsGroupName()](#getFurnaceInputsGroupName())
   27. [getFurnaceOutputsGroupName()](#getFurnaceOutputsGroupName())
   28. [getFuelInputsGroupName()](#getFuelInputsGroupName())
   29. [getFuelOutputsGroupName()](#getFuelOutputsGroupName())
   30. [getFurnaceRecipeTagQuery()](#getFurnaceRecipeTagQuery())
   31. [setFurnaceRecipeTagQuery(String)](#setFurnaceRecipeTagQuery(java.lang.String))
   32. [getFuelRecipeTagQuery()](#getFuelRecipeTagQuery())
   33. [setFuelRecipeTagQuery(String)](#setFuelRecipeTagQuery(java.lang.String))
   34. [getFurnaceRecipes(ArrayList)](#getFurnaceRecipes(java.util.ArrayList))
   35. [getFurnaceRecipes()](#getFurnaceRecipes())
   36. [getFuelRecipes(ArrayList)](#getFuelRecipes(java.util.ArrayList))
   37. [getFuelRecipes()](#getFuelRecipes())
   38. [getFurnaceInputResources()](#getFurnaceInputResources())
   39. [getFurnaceOutputResources()](#getFurnaceOutputResources())
   40. [getFuelInputResources()](#getFuelInputResources())
   41. [getFuelOutputResources()](#getFuelOutputResources())
   42. [isRunning()](#isRunning())
   43. [isFinished()](#isFinished())
   44. [getCurrentRecipe()](#getCurrentRecipe())
   45. [getProgress()](#getProgress())
   46. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   47. [getPossibleRecipe()](#getPossibleRecipe())
   48. [debugCanStart(IsoPlayer)](#debugCanStart(zombie.characters.IsoPlayer))
   49. [canStart(IsoPlayer)](#canStart(zombie.characters.IsoPlayer))
   50. [canStart(StartMode, IsoPlayer)](#canStart(zombie.entity.components.crafting.StartMode,zombie.characters.IsoPlayer))
   51. [start(IsoPlayer)](#start(zombie.characters.IsoPlayer))
   52. [stop(IsoPlayer)](#stop(zombie.characters.IsoPlayer))
   53. [stop(IsoPlayer, boolean)](#stop(zombie.characters.IsoPlayer,boolean))
   54. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   55. [sendStartRequest(IsoPlayer)](#sendStartRequest(zombie.characters.IsoPlayer))
   56. [receiveStartRequest(ByteBufferReader, IConnection)](#receiveStartRequest(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   57. [sendStopRequest(IsoPlayer)](#sendStopRequest(zombie.characters.IsoPlayer))
   58. [receiveStopRequest(ByteBufferReader, IConnection)](#receiveStopRequest(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   59. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   60. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   61. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   62. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class FurnaceLogic
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.crafting.FurnaceLogic

---

public class FurnaceLogic
extends [Component](../../Component.html "class in zombie.entity")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `FurnaceLogic.FurnaceSlot`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final List<CraftRecipe>`

  `_emptyRecipeList`

  `private static final List<Resource>`

  `_emptyResourceList`

  `private final CraftRecipeData`

  `craftData`

  `private final CraftRecipeData`

  `craftTestData`

  `private CraftRecipe`

  `currentRecipe`

  `private boolean`

  `doAutomaticCraftCheck`

  `private int`

  `elapsedTime`

  `private String`

  `fuelInputsGroupName`

  `private String`

  `fuelOutputsGroupName`

  `private List<CraftRecipe>`

  `fuelRecipes`

  `private String`

  `fuelRecipeTagQuery`

  `private String`

  `furnaceInputsGroupName`

  `private String`

  `furnaceOutputsGroupName`

  `private List<CraftRecipe>`

  `furnaceRecipes`

  `private String`

  `furnaceRecipeTagQuery`

  `private final FurnaceLogic.FurnaceSlot[]`

  `furnaceSlots`

  `private int`

  `furnaceSlotSize`

  `private IsoPlayer`

  `requestingPlayer`

  `private static final ConcurrentLinkedDeque<FurnaceLogic.FurnaceSlot>`

  `SLOT_POOL`

  `private StartMode`

  `startMode`

  `private boolean`

  `startRequested`

  `private boolean`

  `stopRequested`

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FurnaceLogic()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static FurnaceLogic.FurnaceSlot`

  `allocFurnaceSlot(int index)`

  `boolean`

  `canStart(IsoPlayer player)`

  `protected boolean`

  `canStart(StartMode startMode,
  IsoPlayer player)`

  `private void`

  `clearRecipe()`

  `protected void`

  `clearSlots()`

  `protected FurnaceLogic.FurnaceSlot`

  `createSlot(int index)`

  `CraftRecipeMonitor`

  `debugCanStart(IsoPlayer player)`

  `(package private) CraftRecipeData`

  `getCraftData()`

  `(package private) CraftRecipeData`

  `getCraftTestData()`

  `CraftRecipe`

  `getCurrentRecipe()`

  `int`

  `getElapsedTime()`

  `List<Resource>`

  `getFuelInputResources()`

  `String`

  `getFuelInputsGroupName()`

  `List<Resource>`

  `getFuelOutputResources()`

  `String`

  `getFuelOutputsGroupName()`

  `protected List<CraftRecipe>`

  `getFuelRecipes()`

  `ArrayList<CraftRecipe>`

  `getFuelRecipes(ArrayList<CraftRecipe> list)`

  `String`

  `getFuelRecipeTagQuery()`

  `List<Resource>`

  `getFurnaceInputResources()`

  `String`

  `getFurnaceInputsGroupName()`

  `List<Resource>`

  `getFurnaceOutputResources()`

  `String`

  `getFurnaceOutputsGroupName()`

  `protected List<CraftRecipe>`

  `getFurnaceRecipes()`

  `ArrayList<CraftRecipe>`

  `getFurnaceRecipes(ArrayList<CraftRecipe> list)`

  `String`

  `getFurnaceRecipeTagQuery()`

  `ResourceItem`

  `getInputSlotResource(int index)`

  `ResourceItem`

  `getOutputSlotResource(int index)`

  `CraftRecipe`

  `getPossibleRecipe()`

  `double`

  `getProgress()`

  `IsoPlayer`

  `getRequestingPlayer()`

  `FurnaceLogic.FurnaceSlot`

  `getSlot(int index)`

  `int`

  `getSlotSize()`

  `StartMode`

  `getStartMode()`

  `boolean`

  `isDoAutomaticCraftCheck()`

  `boolean`

  `isFinished()`

  `boolean`

  `isRunning()`

  `boolean`

  `isStartRequested()`

  `boolean`

  `isStopRequested()`

  `boolean`

  `isValid()`

  `protected void`

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

  `protected void`

  `receiveStartRequest(zombie.core.network.ByteBufferReader input,
  zombie.network.IConnection senderConnection)`

  `protected void`

  `receiveStopRequest(zombie.core.network.ByteBufferReader input,
  zombie.network.IConnection senderConnection)`

  `private static void`

  `releaseFurnaceSlot(FurnaceLogic.FurnaceSlot o)`

  `protected void`

  `reset()`

  `protected void`

  `save(ByteBuffer output)`

  `protected void`

  `saveSyncData(ByteBuffer output)`

  `void`

  `sendStartRequest(IsoPlayer player)`

  `void`

  `sendStopRequest(IsoPlayer player)`

  `(package private) void`

  `setDoAutomaticCraftCheck(boolean b)`

  `(package private) void`

  `setElapsedTime(int elapsedTime)`

  `void`

  `setFuelRecipeTagQuery(String recipeTagQuery)`

  `void`

  `setFurnaceRecipeTagQuery(String recipeTagQuery)`

  `protected void`

  `setRecipe(CraftRecipe recipe)`

  `(package private) void`

  `setRequestingPlayer(IsoPlayer player)`

  `(package private) void`

  `setStartRequested(boolean b)`

  `(package private) void`

  `setStopRequested(boolean b)`

  `void`

  `start(IsoPlayer player)`

  `void`

  `stop(IsoPlayer player)`

  `void`

  `stop(IsoPlayer player,
  boolean force)`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, dumpContentsInSquare, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isNoContainerOrEmpty, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValidOwnerType, onAddedToOwner, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### SLOT\_POOL

    private static final [ConcurrentLinkedDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedDeque.html "class or interface in java.util.concurrent")<[FurnaceLogic.FurnaceSlot](FurnaceLogic.FurnaceSlot.html "class in zombie.entity.components.crafting")> SLOT\_POOL
  + ### \_emptyRecipeList

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> \_emptyRecipeList
  + ### \_emptyResourceList

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> \_emptyResourceList
  + ### furnaceRecipeTagQuery

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") furnaceRecipeTagQuery
  + ### fuelRecipeTagQuery

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fuelRecipeTagQuery
  + ### furnaceRecipes

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> furnaceRecipes
  + ### fuelRecipes

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> fuelRecipes
  + ### startMode

    private [StartMode](StartMode.html "enum class in zombie.entity.components.crafting") startMode
  + ### currentRecipe

    private [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") currentRecipe
  + ### elapsedTime

    private int elapsedTime
  + ### doAutomaticCraftCheck

    private boolean doAutomaticCraftCheck
  + ### startRequested

    private boolean startRequested
  + ### stopRequested

    private boolean stopRequested
  + ### requestingPlayer

    private [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") requestingPlayer
  + ### craftData

    private final [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftData
  + ### craftTestData

    private final [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData
  + ### furnaceInputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") furnaceInputsGroupName
  + ### furnaceOutputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") furnaceOutputsGroupName
  + ### fuelInputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fuelInputsGroupName
  + ### fuelOutputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fuelOutputsGroupName
  + ### furnaceSlots

    private final [FurnaceLogic.FurnaceSlot](FurnaceLogic.FurnaceSlot.html "class in zombie.entity.components.crafting")[] furnaceSlots
  + ### furnaceSlotSize

    private int furnaceSlotSize
* Constructor Details
  -------------------

  + ### FurnaceLogic

    private FurnaceLogic()
* Method Details
  --------------

  + ### allocFurnaceSlot

    private static [FurnaceLogic.FurnaceSlot](FurnaceLogic.FurnaceSlot.html "class in zombie.entity.components.crafting") allocFurnaceSlot(int index)
  + ### releaseFurnaceSlot

    private static void releaseFurnaceSlot([FurnaceLogic.FurnaceSlot](FurnaceLogic.FurnaceSlot.html "class in zombie.entity.components.crafting") o)
  + ### readFromScript

    protected void readFromScript([ComponentScript](../../../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") componentScript)

    Overrides:
    :   `readFromScript` in class `Component`
  + ### isValid

    public boolean isValid()

    Overrides:
    :   `isValid` in class `Component`
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `Component`
  + ### clearRecipe

    private void clearRecipe()
  + ### clearSlots

    protected void clearSlots()
  + ### getSlotSize

    public int getSlotSize()
  + ### getSlot

    public [FurnaceLogic.FurnaceSlot](FurnaceLogic.FurnaceSlot.html "class in zombie.entity.components.crafting") getSlot(int index)
  + ### createSlot

    protected [FurnaceLogic.FurnaceSlot](FurnaceLogic.FurnaceSlot.html "class in zombie.entity.components.crafting") createSlot(int index)
  + ### getInputSlotResource

    public [ResourceItem](../resources/ResourceItem.html "class in zombie.entity.components.resources") getInputSlotResource(int index)
  + ### getOutputSlotResource

    public [ResourceItem](../resources/ResourceItem.html "class in zombie.entity.components.resources") getOutputSlotResource(int index)
  + ### getStartMode

    public [StartMode](StartMode.html "enum class in zombie.entity.components.crafting") getStartMode()
  + ### getElapsedTime

    public int getElapsedTime()
  + ### setElapsedTime

    void setElapsedTime(int elapsedTime)
  + ### isStartRequested

    public boolean isStartRequested()
  + ### setStartRequested

    void setStartRequested(boolean b)
  + ### isStopRequested

    public boolean isStopRequested()
  + ### setStopRequested

    void setStopRequested(boolean b)
  + ### getRequestingPlayer

    public [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") getRequestingPlayer()
  + ### setRequestingPlayer

    void setRequestingPlayer([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### isDoAutomaticCraftCheck

    public boolean isDoAutomaticCraftCheck()
  + ### setDoAutomaticCraftCheck

    void setDoAutomaticCraftCheck(boolean b)
  + ### getCraftData

    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getCraftData()
  + ### getCraftTestData

    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getCraftTestData()
  + ### getFurnaceInputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFurnaceInputsGroupName()
  + ### getFurnaceOutputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFurnaceOutputsGroupName()
  + ### getFuelInputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFuelInputsGroupName()
  + ### getFuelOutputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFuelOutputsGroupName()
  + ### getFurnaceRecipeTagQuery

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFurnaceRecipeTagQuery()
  + ### setFurnaceRecipeTagQuery

    public void setFurnaceRecipeTagQuery([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeTagQuery)
  + ### getFuelRecipeTagQuery

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFuelRecipeTagQuery()
  + ### setFuelRecipeTagQuery

    public void setFuelRecipeTagQuery([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeTagQuery)
  + ### getFurnaceRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getFurnaceRecipes([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> list)
  + ### getFurnaceRecipes

    protected [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getFurnaceRecipes()
  + ### getFuelRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getFuelRecipes([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> list)
  + ### getFuelRecipes

    protected [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getFuelRecipes()
  + ### getFurnaceInputResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getFurnaceInputResources()
  + ### getFurnaceOutputResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getFurnaceOutputResources()
  + ### getFuelInputResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getFuelInputResources()
  + ### getFuelOutputResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getFuelOutputResources()
  + ### isRunning

    public boolean isRunning()
  + ### isFinished

    public boolean isFinished()
  + ### getCurrentRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getCurrentRecipe()
  + ### getProgress

    public double getProgress()
  + ### setRecipe

    protected void setRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getPossibleRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getPossibleRecipe()
  + ### debugCanStart

    public [CraftRecipeMonitor](CraftRecipeMonitor.html "class in zombie.entity.components.crafting") debugCanStart([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### canStart

    public boolean canStart([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### canStart

    protected boolean canStart([StartMode](StartMode.html "enum class in zombie.entity.components.crafting") startMode,
    [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### start

    public void start([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### stop

    public void stop([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### stop

    public void stop([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player,
    boolean force)
  + ### onReceivePacket

    protected boolean onReceivePacket(zombie.core.network.ByteBufferReader input,
    zombie.entity.network.EntityPacketType type,
    zombie.network.IConnection senderConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `onReceivePacket` in class `Component`

    Throws:
    :   `IOException`
  + ### sendStartRequest

    public void sendStartRequest([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### receiveStartRequest

    protected void receiveStartRequest(zombie.core.network.ByteBufferReader input,
    zombie.network.IConnection senderConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### sendStopRequest

    public void sendStopRequest([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### receiveStopRequest

    protected void receiveStopRequest(zombie.core.network.ByteBufferReader input,
    zombie.network.IConnection senderConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

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

    protected void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `Component`

    Throws:
    :   `IOException`
  + ### load

    protected void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `Component`

    Throws:
    :   `IOException`