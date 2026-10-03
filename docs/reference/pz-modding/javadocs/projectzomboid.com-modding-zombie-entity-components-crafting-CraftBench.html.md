[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [CraftBench](CraftBench.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fluidInputChannels](#fluidInputChannels)
   2. [energyInputChannels](#energyInputChannels)
   3. [recipeTagQuery](#recipeTagQuery)
6. [Constructor Details](#constructor-detail)
   1. [CraftBench()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [readFromScript(ComponentScript)](#readFromScript(zombie.scripting.entity.ComponentScript))
   2. [getFluidInputChannels()](#getFluidInputChannels())
   3. [getEnergyInputChannels()](#getEnergyInputChannels())
   4. [getRecipeTagQuery()](#getRecipeTagQuery())
   5. [setRecipeTagQuery(String)](#setRecipeTagQuery(java.lang.String))
   6. [getRecipes()](#getRecipes())
   7. [getResources()](#getResources())
   8. [reset()](#reset())
   9. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   10. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   11. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   12. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   13. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class CraftBench
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.crafting.CraftBench

---

public class CraftBench
extends [Component](../../Component.html "class in zombie.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `energyInputChannels`

  `private final zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `fluidInputChannels`

  `private String`

  `recipeTagQuery`

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CraftBench()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `getEnergyInputChannels()`

  `zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `getFluidInputChannels()`

  `List<CraftRecipe>`

  `getRecipes()`

  `String`

  `getRecipeTagQuery()`

  `ArrayList<Resource>`

  `getResources()`

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

  `reset()`

  `protected void`

  `save(ByteBuffer output)`

  `protected void`

  `saveSyncData(ByteBuffer output)`

  `void`

  `setRecipeTagQuery(String recipeTagQuery)`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, dumpContentsInSquare, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isNoContainerOrEmpty, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValid, isValidOwnerType, onAddedToOwner, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### fluidInputChannels

    private final zombie.entity.util.enums.EnumBitStore<[ResourceChannel](../resources/ResourceChannel.html "enum class in zombie.entity.components.resources")> fluidInputChannels
  + ### energyInputChannels

    private final zombie.entity.util.enums.EnumBitStore<[ResourceChannel](../resources/ResourceChannel.html "enum class in zombie.entity.components.resources")> energyInputChannels
  + ### recipeTagQuery

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeTagQuery
* Constructor Details
  -------------------

  + ### CraftBench

    private CraftBench()
* Method Details
  --------------

  + ### readFromScript

    protected void readFromScript([ComponentScript](../../../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") componentScript)

    Overrides:
    :   `readFromScript` in class `Component`
  + ### getFluidInputChannels

    public zombie.entity.util.enums.EnumBitStore<[ResourceChannel](../resources/ResourceChannel.html "enum class in zombie.entity.components.resources")> getFluidInputChannels()
  + ### getEnergyInputChannels

    public zombie.entity.util.enums.EnumBitStore<[ResourceChannel](../resources/ResourceChannel.html "enum class in zombie.entity.components.resources")> getEnergyInputChannels()
  + ### getRecipeTagQuery

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeTagQuery()
  + ### setRecipeTagQuery

    public void setRecipeTagQuery([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeTagQuery)
  + ### getRecipes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getRecipes()
  + ### getResources

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> getResources()
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `Component`
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