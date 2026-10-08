[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [DryingCraftLogic](DryingCraftLogic.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [previousTickElapsedTimes](#previousTickElapsedTimes)
   2. [temporaryWetnesses](#temporaryWetnesses)
   3. [activeStatusIcons](#activeStatusIcons)
   4. [WET\_ICON](#WET_ICON)
   5. [HOT\_ICON](#HOT_ICON)
   6. [COLD\_ICON](#COLD_ICON)
6. [Constructor Details](#constructor-detail)
   1. [DryingCraftLogic()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getIconSize(String)](#getIconSize(java.lang.String))
   2. [onStart()](#onStart())
   3. [onUpdate(CraftRecipeData)](#onUpdate(zombie.entity.components.crafting.recipe.CraftRecipeData))
   4. [getDryingFactor()](#getDryingFactor())
   5. [doProgressTooltip(ObjectTooltip.Layout, Resource, CraftRecipeData)](#doProgressTooltip(zombie.ui.ObjectTooltip.Layout,zombie.entity.components.resources.Resource,zombie.entity.components.crafting.recipe.CraftRecipeData))
   6. [getStatusIconsForInputItem(InventoryItem, CraftRecipeData)](#getStatusIconsForInputItem(zombie.inventory.InventoryItem,zombie.entity.components.crafting.recipe.CraftRecipeData))
   7. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   8. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class DryingCraftLogic
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

[zombie.entity.components.crafting.CraftLogic](CraftLogic.html "class in zombie.entity.components.crafting")

zombie.entity.components.crafting.DryingCraftLogic

---

public class DryingCraftLogic
extends [CraftLogic](CraftLogic.html "class in zombie.entity.components.crafting")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<Texture>`

  `activeStatusIcons`

  `private static final Texture`

  `COLD_ICON`

  `private static final Texture`

  `HOT_ICON`

  `private final HashMap<CraftRecipeData, Double>`

  `previousTickElapsedTimes`

  `private final HashMap<CraftRecipeData, Double>`

  `temporaryWetnesses`

  `private static final Texture`

  `WET_ICON`

  ### Fields inherited from class [CraftLogic](CraftLogic.html#field-summary "class in zombie.entity.components.crafting")

  `craftData, limit`

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `DryingCraftLogic()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `doProgressTooltip(ObjectTooltip.Layout layout,
  Resource resource,
  CraftRecipeData craftRecipeData)`

  `private float`

  `getDryingFactor()`

  Drying factor value is 0.0 to 2.0
  Below 20 degrees temperature factor is exponential
  Above 20 degrees temperature factor is linear

  `private static String`

  `getIconSize(String path)`

  `ArrayList<Texture>`

  `getStatusIconsForInputItem(InventoryItem item,
  CraftRecipeData craftRecipeData)`

  `protected void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `onStart()`

  `void`

  `onUpdate(CraftRecipeData craftRecipeData)`

  `protected void`

  `save(ByteBuffer output)`

  ### Methods inherited from class [CraftLogic](CraftLogic.html#method-summary "class in zombie.entity.components.crafting")

  `canStart, canStart, canStartWithInventoryItems, debugCanStart, dumpContentsInSquare, finaliseRecipe, forceStopInternal, getActionAnimOverride, getActiveCraftCount, getAllInProgressCraftData, getCraftTestData, getCurrentRecipe, getFirstInProgressCraftData, getFreeOutputSlotCount, getInputResources, getInputsGroupName, getOutputResources, getOutputsGroupName, getPendingCraftData, getPossibleRecipe, getProgress, getRecipes, getRecipes, getRecipeTagQuery, getRequestingPlayer, getStartMode, isCraftingMixedRecipes, isDoAutomaticCraftCheck, isNoContainerOrEmpty, isRunning, isStartRequested, isStopRequested, isValid, loadInProgressCraftData, loadSyncData, onComponentEvent, onReceivePacket, onStop, readFromScript, receiveCraftLogicSync, receiveStartRequest, receiveStopRequest, reset, returnConsumedItemsToResourcesOrSquare, saveInProgessCraftData, saveSyncData, sendCraftLogicSync, sendStartRequest, sendStopRequest, setDoAutomaticCraftCheck, setRecipe, setRecipeTagQuery, setRequestingPlayer, setStartRequested, setStopRequested, start, stop, stop, willInputsAccommodate`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValidOwnerType, onAddedToOwner, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### previousTickElapsedTimes

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe"), [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")> previousTickElapsedTimes
  + ### temporaryWetnesses

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe"), [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")> temporaryWetnesses
  + ### activeStatusIcons

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Texture](../../../core/textures/Texture.html "class in zombie.core.textures")> activeStatusIcons
  + ### WET\_ICON

    private static final [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") WET\_ICON
  + ### HOT\_ICON

    private static final [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") HOT\_ICON
  + ### COLD\_ICON

    private static final [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") COLD\_ICON
* Constructor Details
  -------------------

  + ### DryingCraftLogic

    private DryingCraftLogic()
* Method Details
  --------------

  + ### getIconSize

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIconSize([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### onStart

    public void onStart()

    Overrides:
    :   `onStart` in class `CraftLogic`
  + ### onUpdate

    public void onUpdate([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)

    Overrides:
    :   `onUpdate` in class `CraftLogic`
  + ### getDryingFactor

    private float getDryingFactor()

    Drying factor value is 0.0 to 2.0
    Below 20 degrees temperature factor is exponential
    Above 20 degrees temperature factor is linear
  + ### doProgressTooltip

    public void doProgressTooltip([ObjectTooltip.Layout](../../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout,
    [Resource](../resources/Resource.html "class in zombie.entity.components.resources") resource,
    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)

    Overrides:
    :   `doProgressTooltip` in class `CraftLogic`
  + ### getStatusIconsForInputItem

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Texture](../../../core/textures/Texture.html "class in zombie.core.textures")> getStatusIconsForInputItem([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftRecipeData)

    Overrides:
    :   `getStatusIconsForInputItem` in class `CraftLogic`
  + ### save

    protected void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `save` in class `CraftLogic`

    Throws:
    :   `IOException`
  + ### load

    protected void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `CraftLogic`

    Throws:
    :   `IOException`