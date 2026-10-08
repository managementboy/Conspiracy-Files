[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.script](package-summary.html)
2. [EntityScriptInfo](EntityScriptInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [script](#script)
   2. [originalScript](#originalScript)
   3. [originalIsItem](#originalIsItem)
6. [Constructor Details](#constructor-detail)
   1. [EntityScriptInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setOriginalScript(GameEntityScript)](#setOriginalScript(zombie.scripting.entity.GameEntityScript))
   2. [isOriginalIsItem()](#isOriginalIsItem())
   3. [getOriginalScript()](#getOriginalScript())
   4. [getScript()](#getScript())
   5. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   6. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   7. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   8. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   9. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class EntityScriptInfo
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.script.EntityScriptInfo

---

public class EntityScriptInfo
extends [Component](../../Component.html "class in zombie.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `originalIsItem`

  `private String`

  `originalScript`

  `private GameEntityScript`

  `script`

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `EntityScriptInfo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getOriginalScript()`

  `GameEntityScript`

  `getScript()`

  `boolean`

  `isOriginalIsItem()`

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

  `save(ByteBuffer output)`

  `protected void`

  `saveSyncData(ByteBuffer output)`

  `void`

  `setOriginalScript(GameEntityScript entityScript)`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, dumpContentsInSquare, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isNoContainerOrEmpty, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValid, isValidOwnerType, onAddedToOwner, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, readFromScript, renderlast, reset, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### script

    private [GameEntityScript](../../../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") script
  + ### originalScript

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalScript
  + ### originalIsItem

    private boolean originalIsItem
* Constructor Details
  -------------------

  + ### EntityScriptInfo

    private EntityScriptInfo()
* Method Details
  --------------

  + ### setOriginalScript

    public void setOriginalScript([GameEntityScript](../../../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") entityScript)
  + ### isOriginalIsItem

    public boolean isOriginalIsItem()
  + ### getOriginalScript

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOriginalScript()
  + ### getScript

    public [GameEntityScript](../../../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") getScript()
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