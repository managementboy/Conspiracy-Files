[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.contextmenuconfig](package-summary.html)
2. [ContextMenuConfig](ContextMenuConfig.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [ContextMenuConfig()](#%3Cinit%3E())
6. [Method Details](#method-detail)
   1. [isQualifiesForMetaStorage()](#isQualifiesForMetaStorage())
   2. [getEntries()](#getEntries())
   3. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   4. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   5. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class ContextMenuConfig
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.contextmenuconfig.ContextMenuConfig

---

public class ContextMenuConfig
extends [Component](../../Component.html "class in zombie.entity")

* Field Summary
  -------------

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ContextMenuConfig()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ArrayList<ContextMenuConfigScript.EntryScript>`

  `getEntries()`

  `boolean`

  `isQualifiesForMetaStorage()`

  Defaults true, can be overridden.

  `protected void`

  `loadSyncData(ByteBuffer input)`

  `protected boolean`

  `onReceivePacket(zombie.core.network.ByteBufferReader input,
  zombie.entity.network.EntityPacketType type,
  zombie.network.IConnection senderConnection)`

  `protected void`

  `saveSyncData(ByteBuffer output)`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, dumpContentsInSquare, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isNoContainerOrEmpty, isRenderLast, isRunningInMeta, isUsingPlayer, isValid, isValidOwnerType, load, onAddedToOwner, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, readFromScript, renderlast, reset, save, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Constructor Details
  -------------------

  + ### ContextMenuConfig

    private ContextMenuConfig()
* Method Details
  --------------

  + ### isQualifiesForMetaStorage

    public boolean isQualifiesForMetaStorage()

    Description copied from class: `Component`

    Defaults true, can be overridden.
    Should return true if the component has the conditions required for it to require meta updating.
    This can be used to limit the amount of meta entities stored in meta system.
    For example a craft station that is not running and has no logistic connections could be omitted.

    Overrides:
    :   `isQualifiesForMetaStorage` in class `Component`
  + ### getEntries

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ContextMenuConfigScript.EntryScript](../../../scripting/entity/components/contextmenuconfig/ContextMenuConfigScript.EntryScript.html "class in zombie.scripting.entity.components.contextmenuconfig")> getEntries()
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