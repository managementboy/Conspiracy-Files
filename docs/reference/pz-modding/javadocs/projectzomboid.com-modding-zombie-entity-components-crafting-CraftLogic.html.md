[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [CraftLogic](CraftLogic.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [\_emptyRecipeList](#_emptyRecipeList)
   2. [\_emptyResourceList](#_emptyResourceList)
   3. [recipeTagQuery](#recipeTagQuery)
   4. [recipes](#recipes)
   5. [startMode](#startMode)
   6. [doAutomaticCraftCheck](#doAutomaticCraftCheck)
   7. [startRequested](#startRequested)
   8. [stopRequested](#stopRequested)
   9. [requestingPlayer](#requestingPlayer)
   10. [craftData](#craftData)
   11. [craftTestData](#craftTestData)
   12. [inputsGroupName](#inputsGroupName)
   13. [outputsGroupName](#outputsGroupName)
   14. [actionAnimOverride](#actionAnimOverride)
   15. [craftDataInProgress](#craftDataInProgress)
   16. [limit](#limit)
6. [Constructor Details](#constructor-detail)
   1. [CraftLogic()](#%3Cinit%3E())
   2. [CraftLogic(ComponentType)](#%3Cinit%3E(zombie.entity.ComponentType))
7. [Method Details](#method-detail)
   1. [readFromScript(ComponentScript)](#readFromScript(zombie.scripting.entity.ComponentScript))
   2. [isValid()](#isValid())
   3. [reset()](#reset())
   4. [getStartMode()](#getStartMode())
   5. [isStartRequested()](#isStartRequested())
   6. [setStartRequested(boolean)](#setStartRequested(boolean))
   7. [isStopRequested()](#isStopRequested())
   8. [setStopRequested(boolean)](#setStopRequested(boolean))
   9. [getRequestingPlayer()](#getRequestingPlayer())
   10. [setRequestingPlayer(IsoPlayer)](#setRequestingPlayer(zombie.characters.IsoPlayer))
   11. [isDoAutomaticCraftCheck()](#isDoAutomaticCraftCheck())
   12. [setDoAutomaticCraftCheck(boolean)](#setDoAutomaticCraftCheck(boolean))
   13. [getPendingCraftData()](#getPendingCraftData())
   14. [getFirstInProgressCraftData()](#getFirstInProgressCraftData())
   15. [getAllInProgressCraftData()](#getAllInProgressCraftData())
   16. [isCraftingMixedRecipes()](#isCraftingMixedRecipes())
   17. [getActiveCraftCount()](#getActiveCraftCount())
   18. [getCraftTestData()](#getCraftTestData())
   19. [getInputsGroupName()](#getInputsGroupName())
   20. [getOutputsGroupName()](#getOutputsGroupName())
   21. [getActionAnimOverride()](#getActionAnimOverride())
   22. [getRecipeTagQuery()](#getRecipeTagQuery())
   23. [setRecipeTagQuery(String)](#setRecipeTagQuery(java.lang.String))
   24. [getRecipes(ArrayList)](#getRecipes(java.util.ArrayList))
   25. [getRecipes()](#getRecipes())
   26. [getInputResources()](#getInputResources())
   27. [getOutputResources()](#getOutputResources())
   28. [isRunning()](#isRunning())
   29. [getCurrentRecipe()](#getCurrentRecipe())
   30. [getProgress(CraftRecipeData)](#getProgress(zombie.entity.components.crafting.recipe.CraftRecipeData))
   31. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   32. [getPossibleRecipe()](#getPossibleRecipe())
   33. [debugCanStart(IsoPlayer)](#debugCanStart(zombie.characters.IsoPlayer))
   34. [canStart(IsoPlayer)](#canStart(zombie.characters.IsoPlayer))
   35. [canStart(StartMode, IsoPlayer)](#canStart(zombie.entity.components.crafting.StartMode,zombie.characters.IsoPlayer))
   36. [isInvalidStartMode(StartMode, IsoPlayer)](#isInvalidStartMode(zombie.entity.components.crafting.StartMode,zombie.characters.IsoPlayer))
   37. [canStartWithInventoryItems(IsoPlayer, List)](#canStartWithInventoryItems(zombie.characters.IsoPlayer,java.util.List))
   38. [willInputsAccommodate(List)](#willInputsAccommodate(java.util.List))
   39. [canStackItem(ResourceItem, Item, Item)](#canStackItem(zombie.entity.components.resources.ResourceItem,zombie.scripting.objects.Item,zombie.scripting.objects.Item))
   40. [willOutputsAccommodate(ItemDataList)](#willOutputsAccommodate(zombie.entity.components.crafting.recipe.ItemDataList))
   41. [getFreeOutputSlotCount()](#getFreeOutputSlotCount())
   42. [start(IsoPlayer)](#start(zombie.characters.IsoPlayer))
   43. [stop(IsoPlayer)](#stop(zombie.characters.IsoPlayer))
   44. [stop(IsoPlayer, boolean)](#stop(zombie.characters.IsoPlayer,boolean))
   45. [forceStopInternal()](#forceStopInternal())
   46. [onStart()](#onStart())
   47. [onUpdate(CraftRecipeData)](#onUpdate(zombie.entity.components.crafting.recipe.CraftRecipeData))
   48. [onStop(CraftRecipeData, boolean)](#onStop(zombie.entity.components.crafting.recipe.CraftRecipeData,boolean))
   49. [finaliseRecipe(CraftRecipeData)](#finaliseRecipe(zombie.entity.components.crafting.recipe.CraftRecipeData))
   50. [onComponentEvent(ComponentEvent)](#onComponentEvent(zombie.entity.events.ComponentEvent))
   51. [clearSpriteOverlay()](#clearSpriteOverlay())
   52. [updateSpriteOverlay(int)](#updateSpriteOverlay(int))
   53. [getBestStyleName(List)](#getBestStyleName(java.util.List))
   54. [getBestStyle(int, List)](#getBestStyle(int,java.util.List))
   55. [dumpContentsInSquare()](#dumpContentsInSquare())
   56. [returnConsumedItemsToResourcesOrSquare(CraftRecipeData)](#returnConsumedItemsToResourcesOrSquare(zombie.entity.components.crafting.recipe.CraftRecipeData))
   57. [isNoContainerOrEmpty()](#isNoContainerOrEmpty())
   58. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   59. [sendStartRequest(IsoPlayer)](#sendStartRequest(zombie.characters.IsoPlayer))
   60. [receiveStartRequest(ByteBufferReader, IConnection)](#receiveStartRequest(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   61. [sendStopRequest(IsoPlayer)](#sendStopRequest(zombie.characters.IsoPlayer))
   62. [receiveStopRequest(ByteBufferReader, IConnection)](#receiveStopRequest(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   63. [sendCraftLogicSync()](#sendCraftLogicSync())
   64. [receiveCraftLogicSync(ByteBufferReader, IConnection)](#receiveCraftLogicSync(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   65. [doProgressTooltip(ObjectTooltip.Layout, Resource, CraftRecipeData)](#doProgressTooltip(zombie.ui.ObjectTooltip.Layout,zombie.entity.components.resources.Resource,zombie.entity.components.crafting.recipe.CraftRecipeData))
   66. [getStatusIconsForInputItem(InventoryItem, CraftRecipeData)](#getStatusIconsForInputItem(zombie.inventory.InventoryItem,zombie.entity.components.crafting.recipe.CraftRecipeData))
   67. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   68. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   69. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   70. [saveInProgessCraftData(ByteBuffer)](#saveInProgessCraftData(java.nio.ByteBuffer))
   71. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   72. [loadInProgressCraftData(ByteBuffer, int)](#loadInProgressCraftData(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class CraftLogic
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.crafting.CraftLogic

Direct Known Subclasses:
:   `DryingCraftLogic`

---

public class CraftLogic
extends [Component](../../Component.html "class in zombie.entity")

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

  `private String`

  `actionAnimOverride`

  `protected CraftRecipeData`

  `craftData`

  `private final ArrayList<CraftRecipeData>`

  `craftDataInProgress`

  `private final CraftRecipeData`

  `craftTestData`

  `private boolean`

  `doAutomaticCraftCheck`

  `private String`

  `inputsGroupName`

  `(package private) zombie.core.utils.UpdateLimit`

  `limit`

  `private String`

  `outputsGroupName`

  `private List<CraftRecipe>`

  `recipes`

  `private String`

  `recipeTagQuery`

  `private IsoPlayer`

  `requestingPlayer`

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

  `CraftLogic()`

  `protected`

  `CraftLogic(ComponentType type)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private boolean`

  `canStackItem(ResourceItem resource,
  Item firstItem,
  Item newItem)`

  `boolean`

  `canStart(IsoPlayer player)`

  `protected boolean`

  `canStart(StartMode startMode,
  IsoPlayer player)`

  `boolean`

  `canStartWithInventoryItems(IsoPlayer player,
  List<InventoryItem> selectedInventoryItems)`

  `private void`

  `clearSpriteOverlay()`

  `CraftRecipeMonitor`

  `debugCanStart(IsoPlayer player)`

  `void`

  `doProgressTooltip(ObjectTooltip.Layout layout,
  Resource resource,
  CraftRecipeData craftRecipeData)`

  `void`

  `dumpContentsInSquare()`

  `void`

  `finaliseRecipe(CraftRecipeData craftRecipeData)`

  `protected void`

  `forceStopInternal()`

  `String`

  `getActionAnimOverride()`

  `int`

  `getActiveCraftCount()`

  `(package private) ArrayList<CraftRecipeData>`

  `getAllInProgressCraftData()`

  `private String`

  `getBestStyle(int percentageComplete,
  List<String> availableStyles)`

  `private String`

  `getBestStyleName(List<String> availableStyles)`

  `(package private) CraftRecipeData`

  `getCraftTestData()`

  `CraftRecipe`

  `getCurrentRecipe()`

  `(package private) CraftRecipeData`

  `getFirstInProgressCraftData()`

  `int`

  `getFreeOutputSlotCount()`

  `List<Resource>`

  `getInputResources()`

  `String`

  `getInputsGroupName()`

  `List<Resource>`

  `getOutputResources()`

  `String`

  `getOutputsGroupName()`

  `(package private) CraftRecipeData`

  `getPendingCraftData()`

  `CraftRecipe`

  `getPossibleRecipe()`

  `double`

  `getProgress(CraftRecipeData craftRecipeData)`

  `List<CraftRecipe>`

  `getRecipes()`

  `ArrayList<CraftRecipe>`

  `getRecipes(ArrayList<CraftRecipe> list)`

  `String`

  `getRecipeTagQuery()`

  `IsoPlayer`

  `getRequestingPlayer()`

  `StartMode`

  `getStartMode()`

  `ArrayList<Texture>`

  `getStatusIconsForInputItem(InventoryItem item,
  CraftRecipeData craftRecipeData)`

  `(package private) boolean`

  `isCraftingMixedRecipes()`

  `boolean`

  `isDoAutomaticCraftCheck()`

  `private boolean`

  `isInvalidStartMode(StartMode startMode,
  IsoPlayer player)`

  `boolean`

  `isNoContainerOrEmpty()`

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

  `loadInProgressCraftData(ByteBuffer input,
  int worldVersion)`

  `protected void`

  `loadSyncData(ByteBuffer input)`

  `protected void`

  `onComponentEvent(ComponentEvent event)`

  `protected boolean`

  `onReceivePacket(zombie.core.network.ByteBufferReader input,
  zombie.entity.network.EntityPacketType type,
  zombie.network.IConnection senderConnection)`

  `void`

  `onStart()`

  `void`

  `onStop(CraftRecipeData craftRecipeData,
  boolean isCancelled)`

  `void`

  `onUpdate(CraftRecipeData craftRecipeData)`

  `protected void`

  `readFromScript(ComponentScript componentScript)`

  `protected void`

  `receiveCraftLogicSync(zombie.core.network.ByteBufferReader input,
  zombie.network.IConnection senderConnection)`

  `protected void`

  `receiveStartRequest(zombie.core.network.ByteBufferReader input,
  zombie.network.IConnection senderConnection)`

  `protected void`

  `receiveStopRequest(zombie.core.network.ByteBufferReader input,
  zombie.network.IConnection senderConnection)`

  `protected void`

  `reset()`

  `void`

  `returnConsumedItemsToResourcesOrSquare(CraftRecipeData craftRecipeData)`

  `protected void`

  `save(ByteBuffer output)`

  `protected void`

  `saveInProgessCraftData(ByteBuffer output)`

  `protected void`

  `saveSyncData(ByteBuffer output)`

  `void`

  `sendCraftLogicSync()`

  `void`

  `sendStartRequest(IsoPlayer player)`

  `void`

  `sendStopRequest(IsoPlayer player)`

  `(package private) void`

  `setDoAutomaticCraftCheck(boolean b)`

  `void`

  `setRecipe(CraftRecipe recipe)`

  `void`

  `setRecipeTagQuery(String recipeTagQuery)`

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

  `private void`

  `updateSpriteOverlay(int percentageComplete)`

  `boolean`

  `willInputsAccommodate(List<InventoryItem> inventoryItems)`

  `private boolean`

  `willOutputsAccommodate(ItemDataList pendingItems)`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValidOwnerType, onAddedToOwner, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### \_emptyRecipeList

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> \_emptyRecipeList
  + ### \_emptyResourceList

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> \_emptyResourceList
  + ### recipeTagQuery

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeTagQuery
  + ### recipes

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipes
  + ### startMode

    private [StartMode](StartMode.html "enum class in zombie.entity.components.crafting") startMode
  + ### doAutomaticCraftCheck

    private boolean doAutomaticCraftCheck
  + ### startRequested

    private boolean startRequested
  + ### stopRequested

    private boolean stopRequested
  + ### requestingPlayer

    private [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") requestingPlayer
  + ### craftData

    protected [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftData
  + ### craftTestData

    private final [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData
  + ### inputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inputsGroupName
  + ### outputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outputsGroupName
  + ### actionAnimOverride

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") actionAnimOverride
  + ### craftDataInProgress

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe")> craftDataInProgress
  + ### limit

    zombie.core.utils.UpdateLimit limit
* Constructor Details
  -------------------

  + ### CraftLogic

    private CraftLogic()
  + ### CraftLogic

    protected CraftLogic([ComponentType](../../ComponentType.html "enum class in zombie.entity") type)
* Method Details
  --------------

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
  + ### getStartMode

    public [StartMode](StartMode.html "enum class in zombie.entity.components.crafting") getStartMode()
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
  + ### getPendingCraftData

    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getPendingCraftData()
  + ### getFirstInProgressCraftData

    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getFirstInProgressCraftData()
  + ### getAllInProgressCraftData

    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe")> getAllInProgressCraftData()
  + ### isCraftingMixedRecipes

    boolean isCraftingMixedRecipes()
  + ### getActiveCraftCount

    public int getActiveCraftCount()
  + ### getCraftTestData

    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getCraftTestData()
  + ### getInputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInputsGroupName()
  + ### getOutputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOutputsGroupName()
  + ### getActionAnimOverride

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getActionAnimOverride()
  + ### getRecipeTagQuery

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeTagQuery()
  + ### setRecipeTagQuery

    public void setRecipeTagQuery([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeTagQuery)
  + ### getRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getRecipes([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> list)
  + ### getRecipes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getRecipes()
  + ### getInputResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getInputResources()
  + ### getOutputResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getOutputResources()
  + ### isRunning

    public boolean isRunning()
  + ### getCurrentRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getCurrentRecipe()
  + ### getProgress

    public double getProgress([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)
  + ### setRecipe

    public void setRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getPossibleRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getPossibleRecipe()
  + ### debugCanStart

    public [CraftRecipeMonitor](CraftRecipeMonitor.html "class in zombie.entity.components.crafting") debugCanStart([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### canStart

    public boolean canStart([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### canStart

    protected boolean canStart([StartMode](StartMode.html "enum class in zombie.entity.components.crafting") startMode,
    [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### isInvalidStartMode

    private boolean isInvalidStartMode([StartMode](StartMode.html "enum class in zombie.entity.components.crafting") startMode,
    [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### canStartWithInventoryItems

    public boolean canStartWithInventoryItems([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> selectedInventoryItems)
  + ### willInputsAccommodate

    public boolean willInputsAccommodate([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> inventoryItems)
  + ### canStackItem

    private boolean canStackItem([ResourceItem](../resources/ResourceItem.html "class in zombie.entity.components.resources") resource,
    [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") firstItem,
    [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") newItem)
  + ### willOutputsAccommodate

    private boolean willOutputsAccommodate([ItemDataList](recipe/ItemDataList.html "class in zombie.entity.components.crafting.recipe") pendingItems)
  + ### getFreeOutputSlotCount

    public int getFreeOutputSlotCount()
  + ### start

    public void start([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### stop

    public void stop([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### stop

    public void stop([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player,
    boolean force)
  + ### forceStopInternal

    protected void forceStopInternal()
  + ### onStart

    public void onStart()
  + ### onUpdate

    public void onUpdate([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)
  + ### onStop

    public void onStop([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData,
    boolean isCancelled)
  + ### finaliseRecipe

    public void finaliseRecipe([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)
  + ### onComponentEvent

    protected void onComponentEvent([ComponentEvent](../../events/ComponentEvent.html "class in zombie.entity.events") event)

    Overrides:
    :   `onComponentEvent` in class `Component`
  + ### clearSpriteOverlay

    private void clearSpriteOverlay()
  + ### updateSpriteOverlay

    private void updateSpriteOverlay(int percentageComplete)
  + ### getBestStyleName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBestStyleName([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> availableStyles)
  + ### getBestStyle

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBestStyle(int percentageComplete,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> availableStyles)
  + ### dumpContentsInSquare

    public void dumpContentsInSquare()

    Overrides:
    :   `dumpContentsInSquare` in class `Component`
  + ### returnConsumedItemsToResourcesOrSquare

    public void returnConsumedItemsToResourcesOrSquare([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)
  + ### isNoContainerOrEmpty

    public boolean isNoContainerOrEmpty()

    Overrides:
    :   `isNoContainerOrEmpty` in class `Component`
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
  + ### sendCraftLogicSync

    public void sendCraftLogicSync()
  + ### receiveCraftLogicSync

    protected void receiveCraftLogicSync(zombie.core.network.ByteBufferReader input,
    zombie.network.IConnection senderConnection)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### doProgressTooltip

    public void doProgressTooltip([ObjectTooltip.Layout](../../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout,
    [Resource](../resources/Resource.html "class in zombie.entity.components.resources") resource,
    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)
  + ### getStatusIconsForInputItem

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Texture](../../../core/textures/Texture.html "class in zombie.core.textures")> getStatusIconsForInputItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)
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
  + ### saveInProgessCraftData

    protected void saveInProgessCraftData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

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
  + ### loadInProgressCraftData

    protected void loadInProgressCraftData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`