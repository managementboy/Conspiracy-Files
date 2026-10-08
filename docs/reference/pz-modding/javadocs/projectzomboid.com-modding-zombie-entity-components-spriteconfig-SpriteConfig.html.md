[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.spriteconfig](package-summary.html)
2. [SpriteConfig](SpriteConfig.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [configScript](#configScript)
   2. [wasLoadedAsMaster](#wasLoadedAsMaster)
   3. [tileInfo](#tileInfo)
   4. [faceInfo](#faceInfo)
   5. [objectInfo](#objectInfo)
6. [Constructor Details](#constructor-detail)
   1. [SpriteConfig()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [readFromScript(ComponentScript)](#readFromScript(zombie.scripting.entity.ComponentScript))
   2. [onAddedToOwner()](#onAddedToOwner())
   3. [onRemovedFromOwner()](#onRemovedFromOwner())
   4. [initObjectInfo()](#initObjectInfo())
   5. [resetObjectInfo()](#resetObjectInfo())
   6. [reset()](#reset())
   7. [getTileInfo()](#getTileInfo())
   8. [getFaceInfo()](#getFaceInfo())
   9. [getObjectInfo()](#getObjectInfo())
   10. [isValid()](#isValid())
   11. [isCanRotate()](#isCanRotate())
   12. [isValidMultiSquare()](#isValidMultiSquare())
   13. [isMultiSquareMaster()](#isMultiSquareMaster())
   14. [isMultiSquareSlave()](#isMultiSquareSlave())
   15. [getMasterOffsetX()](#getMasterOffsetX())
   16. [getMasterOffsetY()](#getMasterOffsetY())
   17. [getMasterOffsetZ()](#getMasterOffsetZ())
   18. [getMultiSquareMaster()](#getMultiSquareMaster())
   19. [isMultiSquareFullyLoaded()](#isMultiSquareFullyLoaded())
   20. [getAllMultiSquareObjects(ArrayList)](#getAllMultiSquareObjects(java.util.ArrayList))
   21. [findAllMultiSquareObjects(ArrayList)](#findAllMultiSquareObjects(java.util.ArrayList))
   22. [isWasLoadedAsMaster()](#isWasLoadedAsMaster())
   23. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   24. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   25. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   26. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   27. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class SpriteConfig
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.spriteconfig.SpriteConfig

---

public class SpriteConfig
extends [Component](../../Component.html "class in zombie.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private SpriteConfigScript`

  `configScript`

  `private SpriteConfigManager.FaceInfo`

  `faceInfo`

  `private SpriteConfigManager.ObjectInfo`

  `objectInfo`

  `private SpriteConfigManager.TileInfo`

  `tileInfo`

  `private boolean`

  `wasLoadedAsMaster`

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SpriteConfig()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private boolean`

  `findAllMultiSquareObjects(ArrayList<IsoObject> outlist)`

  `boolean`

  `getAllMultiSquareObjects(ArrayList<IsoObject> outlist)`

  `SpriteConfigManager.FaceInfo`

  `getFaceInfo()`

  `int`

  `getMasterOffsetX()`

  `int`

  `getMasterOffsetY()`

  `int`

  `getMasterOffsetZ()`

  `IsoObject`

  `getMultiSquareMaster()`

  `SpriteConfigManager.ObjectInfo`

  `getObjectInfo()`

  `SpriteConfigManager.TileInfo`

  `getTileInfo()`

  `private void`

  `initObjectInfo()`

  `boolean`

  `isCanRotate()`

  `boolean`

  `isMultiSquareFullyLoaded()`

  `boolean`

  `isMultiSquareMaster()`

  `boolean`

  `isMultiSquareSlave()`

  `boolean`

  `isValid()`

  `boolean`

  `isValidMultiSquare()`

  `boolean`

  `isWasLoadedAsMaster()`

  `protected void`

  `load(ByteBuffer input,
  int worldVersion)`

  `protected void`

  `loadSyncData(ByteBuffer input)`

  `protected void`

  `onAddedToOwner()`

  `protected boolean`

  `onReceivePacket(zombie.core.network.ByteBufferReader input,
  zombie.entity.network.EntityPacketType type,
  zombie.network.IConnection senderConnection)`

  `protected void`

  `onRemovedFromOwner()`

  `protected void`

  `readFromScript(ComponentScript script)`

  `protected void`

  `reset()`

  `private void`

  `resetObjectInfo()`

  `protected void`

  `save(ByteBuffer output)`

  `protected void`

  `saveSyncData(ByteBuffer output)`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, dumpContentsInSquare, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isNoContainerOrEmpty, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValidOwnerType, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### configScript

    private [SpriteConfigScript](../../../scripting/entity/components/spriteconfig/SpriteConfigScript.html "class in zombie.scripting.entity.components.spriteconfig") configScript
  + ### wasLoadedAsMaster

    private boolean wasLoadedAsMaster
  + ### tileInfo

    private [SpriteConfigManager.TileInfo](SpriteConfigManager.TileInfo.html "class in zombie.entity.components.spriteconfig") tileInfo
  + ### faceInfo

    private [SpriteConfigManager.FaceInfo](SpriteConfigManager.FaceInfo.html "class in zombie.entity.components.spriteconfig") faceInfo
  + ### objectInfo

    private [SpriteConfigManager.ObjectInfo](SpriteConfigManager.ObjectInfo.html "class in zombie.entity.components.spriteconfig") objectInfo
* Constructor Details
  -------------------

  + ### SpriteConfig

    private SpriteConfig()
* Method Details
  --------------

  + ### readFromScript

    protected void readFromScript([ComponentScript](../../../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") script)

    Overrides:
    :   `readFromScript` in class `Component`
  + ### onAddedToOwner

    protected void onAddedToOwner()

    Overrides:
    :   `onAddedToOwner` in class `Component`
  + ### onRemovedFromOwner

    protected void onRemovedFromOwner()

    Overrides:
    :   `onRemovedFromOwner` in class `Component`
  + ### initObjectInfo

    private void initObjectInfo()
  + ### resetObjectInfo

    private void resetObjectInfo()
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `Component`
  + ### getTileInfo

    public [SpriteConfigManager.TileInfo](SpriteConfigManager.TileInfo.html "class in zombie.entity.components.spriteconfig") getTileInfo()
  + ### getFaceInfo

    public [SpriteConfigManager.FaceInfo](SpriteConfigManager.FaceInfo.html "class in zombie.entity.components.spriteconfig") getFaceInfo()
  + ### getObjectInfo

    public [SpriteConfigManager.ObjectInfo](SpriteConfigManager.ObjectInfo.html "class in zombie.entity.components.spriteconfig") getObjectInfo()
  + ### isValid

    public boolean isValid()

    Overrides:
    :   `isValid` in class `Component`
  + ### isCanRotate

    public boolean isCanRotate()
  + ### isValidMultiSquare

    public boolean isValidMultiSquare()
  + ### isMultiSquareMaster

    public boolean isMultiSquareMaster()
  + ### isMultiSquareSlave

    public boolean isMultiSquareSlave()
  + ### getMasterOffsetX

    public int getMasterOffsetX()
  + ### getMasterOffsetY

    public int getMasterOffsetY()
  + ### getMasterOffsetZ

    public int getMasterOffsetZ()
  + ### getMultiSquareMaster

    public [IsoObject](../../../iso/IsoObject.html "class in zombie.iso") getMultiSquareMaster()
  + ### isMultiSquareFullyLoaded

    public boolean isMultiSquareFullyLoaded()
  + ### getAllMultiSquareObjects

    public boolean getAllMultiSquareObjects([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../../../iso/IsoObject.html "class in zombie.iso")> outlist)
  + ### findAllMultiSquareObjects

    private boolean findAllMultiSquareObjects([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../../../iso/IsoObject.html "class in zombie.iso")> outlist)
  + ### isWasLoadedAsMaster

    public boolean isWasLoadedAsMaster()
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