[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [MashingLogic](MashingLogic.html)

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
   5. [craftData](#craftData)
   6. [craftTestData](#craftTestData)
   7. [currentRecipe](#currentRecipe)
   8. [resourceFluidId](#resourceFluidId)
   9. [inputsGroupName](#inputsGroupName)
   10. [elapsedTime](#elapsedTime)
   11. [lastWorldAge](#lastWorldAge)
   12. [internalResourceList](#internalResourceList)
   13. [startRequested](#startRequested)
   14. [stopRequested](#stopRequested)
   15. [requestingPlayer](#requestingPlayer)
   16. [barrelConsumedAmount](#barrelConsumedAmount)
6. [Constructor Details](#constructor-detail)
   1. [MashingLogic()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [readFromScript(ComponentScript)](#readFromScript(zombie.scripting.entity.ComponentScript))
   2. [reset()](#reset())
   3. [clearRecipe()](#clearRecipe())
   4. [getElapsedTime()](#getElapsedTime())
   5. [setElapsedTime(double)](#setElapsedTime(double))
   6. [getLastWorldAge()](#getLastWorldAge())
   7. [setLastWorldAge(double)](#setLastWorldAge(double))
   8. [isStartRequested()](#isStartRequested())
   9. [setStartRequested(boolean)](#setStartRequested(boolean))
   10. [isStopRequested()](#isStopRequested())
   11. [setStopRequested(boolean)](#setStopRequested(boolean))
   12. [getRequestingPlayer()](#getRequestingPlayer())
   13. [setRequestingPlayer(IsoPlayer)](#setRequestingPlayer(zombie.characters.IsoPlayer))
   14. [getCraftData()](#getCraftData())
   15. [getCraftTestData()](#getCraftTestData())
   16. [getInputsGroupName()](#getInputsGroupName())
   17. [getResourceFluidID()](#getResourceFluidID())
   18. [getBarrelConsumedAmount()](#getBarrelConsumedAmount())
   19. [setBarrelConsumedAmount(float)](#setBarrelConsumedAmount(float))
   20. [getRecipeTagQuery()](#getRecipeTagQuery())
   21. [setRecipeTagQuery(String)](#setRecipeTagQuery(java.lang.String))
   22. [getRecipes(List)](#getRecipes(java.util.List))
   23. [getRecipes()](#getRecipes())
   24. [getInputResources(List)](#getInputResources(java.util.List))
   25. [getFluidBarrel()](#getFluidBarrel())
   26. [isRunning()](#isRunning())
   27. [isFinished()](#isFinished())
   28. [getCurrentRecipe()](#getCurrentRecipe())
   29. [getProgress()](#getProgress())
   30. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   31. [getPossibleRecipe()](#getPossibleRecipe())
   32. [debugCanStart(IsoPlayer)](#debugCanStart(zombie.characters.IsoPlayer))
   33. [canStart(IsoPlayer)](#canStart(zombie.characters.IsoPlayer))
   34. [canStart(StartMode, IsoPlayer)](#canStart(zombie.entity.components.crafting.StartMode,zombie.characters.IsoPlayer))
   35. [start(IsoPlayer)](#start(zombie.characters.IsoPlayer))
   36. [stop(IsoPlayer)](#stop(zombie.characters.IsoPlayer))
   37. [stop(IsoPlayer, boolean)](#stop(zombie.characters.IsoPlayer,boolean))
   38. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   39. [sendStartRequest(IsoPlayer)](#sendStartRequest(zombie.characters.IsoPlayer))
   40. [receiveStartRequest(ByteBufferReader, IConnection)](#receiveStartRequest(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   41. [sendStopRequest(IsoPlayer)](#sendStopRequest(zombie.characters.IsoPlayer))
   42. [receiveStopRequest(ByteBufferReader, IConnection)](#receiveStopRequest(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   43. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   44. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   45. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   46. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class MashingLogic
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.crafting.MashingLogic

---

public class MashingLogic
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

  `private float`

  `barrelConsumedAmount`

  `private final CraftRecipeData`

  `craftData`

  `private final CraftRecipeData`

  `craftTestData`

  `private CraftRecipe`

  `currentRecipe`

  `private double`

  `elapsedTime`

  `private String`

  `inputsGroupName`

  `private final List<Resource>`

  `internalResourceList`

  `private double`

  `lastWorldAge`

  `private List<CraftRecipe>`

  `recipes`

  `private String`

  `recipeTagQuery`

  `private IsoPlayer`

  `requestingPlayer`

  `private String`

  `resourceFluidId`

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

  `MashingLogic()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canStart(IsoPlayer player)`

  `protected boolean`

  `canStart(StartMode startMode,
  IsoPlayer player)`

  `private void`

  `clearRecipe()`

  `CraftRecipeMonitor`

  `debugCanStart(IsoPlayer player)`

  `float`

  `getBarrelConsumedAmount()`

  `(package private) CraftRecipeData`

  `getCraftData()`

  `(package private) CraftRecipeData`

  `getCraftTestData()`

  `CraftRecipe`

  `getCurrentRecipe()`

  `double`

  `getElapsedTime()`

  `ResourceFluid`

  `getFluidBarrel()`

  `List<Resource>`

  `getInputResources(List<Resource> list)`

  `String`

  `getInputsGroupName()`

  `double`

  `getLastWorldAge()`

  `CraftRecipe`

  `getPossibleRecipe()`

  `double`

  `getProgress()`

  `protected List<CraftRecipe>`

  `getRecipes()`

  `List<CraftRecipe>`

  `getRecipes(List<CraftRecipe> list)`

  `String`

  `getRecipeTagQuery()`

  `IsoPlayer`

  `getRequestingPlayer()`

  `String`

  `getResourceFluidID()`

  `boolean`

  `isFinished()`

  `boolean`

  `isRunning()`

  `boolean`

  `isStartRequested()`

  `boolean`

  `isStopRequested()`

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

  `protected void`

  `setBarrelConsumedAmount(float amount)`

  `void`

  `setElapsedTime(double time)`

  `void`

  `setLastWorldAge(double time)`

  `protected void`

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

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, dumpContentsInSquare, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isNoContainerOrEmpty, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValid, isValidOwnerType, onAddedToOwner, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

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
  + ### craftData

    private final [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftData
  + ### craftTestData

    private final [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData
  + ### currentRecipe

    private [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") currentRecipe
  + ### resourceFluidId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") resourceFluidId
  + ### inputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inputsGroupName
  + ### elapsedTime

    private double elapsedTime
  + ### lastWorldAge

    private double lastWorldAge
  + ### internalResourceList

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> internalResourceList
  + ### startRequested

    private boolean startRequested
  + ### stopRequested

    private boolean stopRequested
  + ### requestingPlayer

    private [IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") requestingPlayer
  + ### barrelConsumedAmount

    private float barrelConsumedAmount
* Constructor Details
  -------------------

  + ### MashingLogic

    private MashingLogic()
* Method Details
  --------------

  + ### readFromScript

    protected void readFromScript([ComponentScript](../../../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") componentScript)

    Overrides:
    :   `readFromScript` in class `Component`
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `Component`
  + ### clearRecipe

    private void clearRecipe()
  + ### getElapsedTime

    public double getElapsedTime()
  + ### setElapsedTime

    public void setElapsedTime(double time)
  + ### getLastWorldAge

    public double getLastWorldAge()
  + ### setLastWorldAge

    public void setLastWorldAge(double time)
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
  + ### getCraftData

    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getCraftData()
  + ### getCraftTestData

    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") getCraftTestData()
  + ### getInputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInputsGroupName()
  + ### getResourceFluidID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getResourceFluidID()
  + ### getBarrelConsumedAmount

    public float getBarrelConsumedAmount()
  + ### setBarrelConsumedAmount

    protected void setBarrelConsumedAmount(float amount)
  + ### getRecipeTagQuery

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeTagQuery()
  + ### setRecipeTagQuery

    public void setRecipeTagQuery([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeTagQuery)
  + ### getRecipes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getRecipes([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> list)
  + ### getRecipes

    protected [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getRecipes()
  + ### getInputResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getInputResources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> list)
  + ### getFluidBarrel

    public [ResourceFluid](../resources/ResourceFluid.html "class in zombie.entity.components.resources") getFluidBarrel()
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