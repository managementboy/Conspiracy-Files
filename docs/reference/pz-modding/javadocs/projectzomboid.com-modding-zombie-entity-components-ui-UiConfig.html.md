[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.ui](package-summary.html)
2. [UiConfig](UiConfig.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [xuiSkinName](#xuiSkinName)
   2. [skin](#skin)
   3. [entityStyleName](#entityStyleName)
   4. [uiEnabled](#uiEnabled)
6. [Constructor Details](#constructor-detail)
   1. [UiConfig()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [readFromScript(ComponentScript)](#readFromScript(zombie.scripting.entity.ComponentScript))
   2. [setSkin(String)](#setSkin(java.lang.String))
   3. [getSkin()](#getSkin())
   4. [getSkinOrDefault()](#getSkinOrDefault())
   5. [getSkin(boolean)](#getSkin(boolean))
   6. [getEntityUiStyle()](#getEntityUiStyle())
   7. [getEntityStyleName()](#getEntityStyleName())
   8. [isUiEnabled()](#isUiEnabled())
   9. [getEntityDisplayName()](#getEntityDisplayName())
   10. [reset()](#reset())
   11. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   12. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   13. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   14. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   15. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class UiConfig
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.ui.UiConfig

---

public class UiConfig
extends [Component](../../Component.html "class in zombie.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `entityStyleName`

  `private XuiSkin`

  `skin`

  `private boolean`

  `uiEnabled`

  `private String`

  `xuiSkinName`

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `UiConfig()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getEntityDisplayName()`

  `String`

  `getEntityStyleName()`

  `XuiSkin.EntityUiStyle`

  `getEntityUiStyle()`

  `XuiSkin`

  `getSkin()`

  `XuiSkin`

  `getSkin(boolean doDefault)`

  `XuiSkin`

  `getSkinOrDefault()`

  `boolean`

  `isUiEnabled()`

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

  `private void`

  `setSkin(String skinName)`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, dumpContentsInSquare, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isNoContainerOrEmpty, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValid, isValidOwnerType, onAddedToOwner, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### xuiSkinName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiSkinName
  + ### skin

    private [XuiSkin](../../../scripting/ui/XuiSkin.html "class in zombie.scripting.ui") skin
  + ### entityStyleName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") entityStyleName
  + ### uiEnabled

    private boolean uiEnabled
* Constructor Details
  -------------------

  + ### UiConfig

    private UiConfig()
* Method Details
  --------------

  + ### readFromScript

    protected void readFromScript([ComponentScript](../../../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") componentScript)

    Overrides:
    :   `readFromScript` in class `Component`
  + ### setSkin

    private void setSkin([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") skinName)
  + ### getSkin

    public [XuiSkin](../../../scripting/ui/XuiSkin.html "class in zombie.scripting.ui") getSkin()
  + ### getSkinOrDefault

    public [XuiSkin](../../../scripting/ui/XuiSkin.html "class in zombie.scripting.ui") getSkinOrDefault()
  + ### getSkin

    public [XuiSkin](../../../scripting/ui/XuiSkin.html "class in zombie.scripting.ui") getSkin(boolean doDefault)
  + ### getEntityUiStyle

    public [XuiSkin.EntityUiStyle](../../../scripting/ui/XuiSkin.EntityUiStyle.html "class in zombie.scripting.ui") getEntityUiStyle()
  + ### getEntityStyleName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEntityStyleName()
  + ### isUiEnabled

    public boolean isUiEnabled()
  + ### getEntityDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEntityDisplayName()
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