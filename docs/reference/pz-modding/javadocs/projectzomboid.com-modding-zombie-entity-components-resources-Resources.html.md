[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.resources](package-summary.html)
2. [Resources](Resources.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [defaultGroup](#defaultGroup)
   2. [\_emptyResources](#_emptyResources)
   3. [resources](#resources)
   4. [idToResourceMap](#idToResourceMap)
   5. [namedGroups](#namedGroups)
   6. [namedGroupMap](#namedGroupMap)
   7. [inputChannels](#inputChannels)
   8. [outputChannels](#outputChannels)
   9. [channelGroups](#channelGroups)
   10. [inputChannelMap](#inputChannelMap)
   11. [outputChannelMap](#outputChannelMap)
   12. [immutableResources](#immutableResources)
   13. [dirty](#dirty)
6. [Constructor Details](#constructor-detail)
   1. [Resources()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isDirty()](#isDirty())
   2. [setDirty()](#setDirty())
   3. [resetDirty()](#resetDirty())
   4. [readFromScript(ComponentScript)](#readFromScript(zombie.scripting.entity.ComponentScript))
   5. [reset()](#reset())
   6. [resetResources()](#resetResources())
   7. [getResources()](#getResources())
   8. [getResourceGroup(String)](#getResourceGroup(java.lang.String))
   9. [getResourcesForGroup(String)](#getResourcesForGroup(java.lang.String))
   10. [createResourceFromSerial(String)](#createResourceFromSerial(java.lang.String))
   11. [createResourceFromSerial(String, String)](#createResourceFromSerial(java.lang.String,java.lang.String))
   12. [createResource(ResourceBlueprint)](#createResource(zombie.entity.components.resources.ResourceBlueprint))
   13. [createResource(String, ResourceBlueprint)](#createResource(java.lang.String,zombie.entity.components.resources.ResourceBlueprint))
   14. [addResourceInternal(String, Resource)](#addResourceInternal(java.lang.String,zombie.entity.components.resources.Resource))
   15. [removeResourceGroup(String)](#removeResourceGroup(java.lang.String))
   16. [removeResourceGroup(ResourceGroup)](#removeResourceGroup(zombie.entity.components.resources.ResourceGroup))
   17. [removeResourceGroupInternal(ResourceGroup)](#removeResourceGroupInternal(zombie.entity.components.resources.ResourceGroup))
   18. [removeResource(String)](#removeResource(java.lang.String))
   19. [removeResource(Resource)](#removeResource(zombie.entity.components.resources.Resource))
   20. [removeResourceInternal(Resource, boolean)](#removeResourceInternal(zombie.entity.components.resources.Resource,boolean))
   21. [addChannelResource(Resource)](#addChannelResource(zombie.entity.components.resources.Resource))
   22. [removeChannelResource(Resource)](#removeChannelResource(zombie.entity.components.resources.Resource))
   23. [getResource(String)](#getResource(java.lang.String))
   24. [getResource(int)](#getResource(int))
   25. [getResourceIndex(Resource)](#getResourceIndex(zombie.entity.components.resources.Resource))
   26. [getResourceCount()](#getResourceCount())
   27. [getResources(List, ResourceIO)](#getResources(java.util.List,zombie.entity.components.resources.ResourceIO))
   28. [getResources(List, ResourceType)](#getResources(java.util.List,zombie.entity.components.resources.ResourceType))
   29. [getResources(List, ResourceIO, ResourceChannel)](#getResources(java.util.List,zombie.entity.components.resources.ResourceIO,zombie.entity.components.resources.ResourceChannel))
   30. [getResources(List, ResourceChannel)](#getResources(java.util.List,zombie.entity.components.resources.ResourceChannel))
   31. [getResources(List, ResourceIO, ResourceType)](#getResources(java.util.List,zombie.entity.components.resources.ResourceIO,zombie.entity.components.resources.ResourceType))
   32. [getResourcesFromGroup(String, List, ResourceIO)](#getResourcesFromGroup(java.lang.String,java.util.List,zombie.entity.components.resources.ResourceIO))
   33. [getResourcesFromGroup(String, List, ResourceType)](#getResourcesFromGroup(java.lang.String,java.util.List,zombie.entity.components.resources.ResourceType))
   34. [getResourcesFromGroup(String, List, ResourceIO, ResourceChannel)](#getResourcesFromGroup(java.lang.String,java.util.List,zombie.entity.components.resources.ResourceIO,zombie.entity.components.resources.ResourceChannel))
   35. [getResourcesFromGroup(String, List, ResourceChannel)](#getResourcesFromGroup(java.lang.String,java.util.List,zombie.entity.components.resources.ResourceChannel))
   36. [getResourcesFromGroup(String, List, ResourceIO, ResourceType)](#getResourcesFromGroup(java.lang.String,java.util.List,zombie.entity.components.resources.ResourceIO,zombie.entity.components.resources.ResourceType))
   37. [getResourcesFromGroup(String, List, ResourceIO, ResourceType, ResourceChannel, boolean)](#getResourcesFromGroup(java.lang.String,java.util.List,zombie.entity.components.resources.ResourceIO,zombie.entity.components.resources.ResourceType,zombie.entity.components.resources.ResourceChannel,boolean))
   38. [getResources(List, List, ResourceIO, ResourceType, ResourceChannel, boolean)](#getResources(java.util.List,java.util.List,zombie.entity.components.resources.ResourceIO,zombie.entity.components.resources.ResourceType,zombie.entity.components.resources.ResourceChannel,boolean))
   39. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   40. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   41. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   42. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   43. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   44. [dumpContentsInSquare()](#dumpContentsInSquare())
   45. [isNoContainerOrEmpty()](#isNoContainerOrEmpty())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class Resources
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.resources.Resources

---

public class Resources
extends [Component](../../Component.html "class in zombie.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final List<Resource>`

  `_emptyResources`

  `private final ArrayList<zombie.entity.components.resources.ResourceGroup>`

  `channelGroups`

  `static final String`

  `defaultGroup`

  `private boolean`

  `dirty`

  `private final Map<String,Resource>`

  `idToResourceMap`

  `private final List<Resource>`

  `immutableResources`

  `private final Map<ResourceChannel, zombie.entity.components.resources.ResourceGroup>`

  `inputChannelMap`

  `private final zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `inputChannels`

  `private final Map<String, zombie.entity.components.resources.ResourceGroup>`

  `namedGroupMap`

  `private final ArrayList<zombie.entity.components.resources.ResourceGroup>`

  `namedGroups`

  `private final Map<ResourceChannel, zombie.entity.components.resources.ResourceGroup>`

  `outputChannelMap`

  `private final zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `outputChannels`

  `private final ArrayList<Resource>`

  `resources`

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Resources()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addChannelResource(Resource resource)`

  `private void`

  `addResourceInternal(String groupName,
  Resource resource)`

  `void`

  `createResource(String groupName,
  ResourceBlueprint blueprint)`

  `void`

  `createResource(ResourceBlueprint blueprint)`

  `void`

  `createResourceFromSerial(String blueprintSerial)`

  `void`

  `createResourceFromSerial(String groupName,
  String blueprintSerial)`

  `void`

  `dumpContentsInSquare()`

  `Resource`

  `getResource(int index)`

  `Resource`

  `getResource(String nameId)`

  `int`

  `getResourceCount()`

  `zombie.entity.components.resources.ResourceGroup`

  `getResourceGroup(String name)`

  `int`

  `getResourceIndex(Resource resource)`

  `List<Resource>`

  `getResources()`

  `private List<Resource>`

  `getResources(List<Resource> sources,
  List<Resource> list,
  ResourceIO io,
  ResourceType type,
  ResourceChannel channel,
  boolean clear)`

  `List<Resource>`

  `getResources(List<Resource> list,
  ResourceChannel channel)`

  `List<Resource>`

  `getResources(List<Resource> list,
  ResourceIO io)`

  `List<Resource>`

  `getResources(List<Resource> list,
  ResourceIO io,
  ResourceChannel channel)`

  `List<Resource>`

  `getResources(List<Resource> list,
  ResourceIO io,
  ResourceType type)`

  `List<Resource>`

  `getResources(List<Resource> list,
  ResourceType type)`

  `List<Resource>`

  `getResourcesForGroup(String name)`

  `List<Resource>`

  `getResourcesFromGroup(String group,
  List<Resource> list,
  ResourceChannel channel)`

  `List<Resource>`

  `getResourcesFromGroup(String group,
  List<Resource> list,
  ResourceIO io)`

  `List<Resource>`

  `getResourcesFromGroup(String group,
  List<Resource> list,
  ResourceIO io,
  ResourceChannel channel)`

  `List<Resource>`

  `getResourcesFromGroup(String group,
  List<Resource> list,
  ResourceIO io,
  ResourceType type)`

  `private List<Resource>`

  `getResourcesFromGroup(String group,
  List<Resource> list,
  ResourceIO io,
  ResourceType type,
  ResourceChannel channel,
  boolean clear)`

  `List<Resource>`

  `getResourcesFromGroup(String group,
  List<Resource> list,
  ResourceType type)`

  `(package private) boolean`

  `isDirty()`

  `boolean`

  `isNoContainerOrEmpty()`

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

  `private void`

  `removeChannelResource(Resource resource)`

  `void`

  `removeResource(String resourceID)`

  `void`

  `removeResource(Resource resource)`

  `void`

  `removeResourceGroup(String groupName)`

  `void`

  `removeResourceGroup(zombie.entity.components.resources.ResourceGroup group)`

  `private void`

  `removeResourceGroupInternal(zombie.entity.components.resources.ResourceGroup group)`

  `private void`

  `removeResourceInternal(Resource resource,
  boolean removeFromGroup)`

  `protected void`

  `reset()`

  `(package private) void`

  `resetDirty()`

  `private void`

  `resetResources()`

  `protected void`

  `save(ByteBuffer output)`

  `protected void`

  `saveSyncData(ByteBuffer output)`

  `(package private) void`

  `setDirty()`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, DoTooltip, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValid, isValidOwnerType, onAddedToOwner, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### defaultGroup

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultGroup

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.resources.Resources.defaultGroup)
  + ### \_emptyResources

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> \_emptyResources
  + ### resources

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> resources
  + ### idToResourceMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Resource](Resource.html "class in zombie.entity.components.resources")> idToResourceMap
  + ### namedGroups

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.entity.components.resources.ResourceGroup> namedGroups
  + ### namedGroupMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.entity.components.resources.ResourceGroup> namedGroupMap
  + ### inputChannels

    private final zombie.entity.util.enums.EnumBitStore<[ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources")> inputChannels
  + ### outputChannels

    private final zombie.entity.util.enums.EnumBitStore<[ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources")> outputChannels
  + ### channelGroups

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.entity.components.resources.ResourceGroup> channelGroups
  + ### inputChannelMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources"), zombie.entity.components.resources.ResourceGroup> inputChannelMap
  + ### outputChannelMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources"), zombie.entity.components.resources.ResourceGroup> outputChannelMap
  + ### immutableResources

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> immutableResources
  + ### dirty

    private boolean dirty
* Constructor Details
  -------------------

  + ### Resources

    private Resources()
* Method Details
  --------------

  + ### isDirty

    boolean isDirty()
  + ### setDirty

    void setDirty()
  + ### resetDirty

    void resetDirty()
  + ### readFromScript

    protected void readFromScript([ComponentScript](../../../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") componentScript)

    Overrides:
    :   `readFromScript` in class `Component`
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `Component`
  + ### resetResources

    private void resetResources()
  + ### getResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResources()
  + ### getResourceGroup

    public zombie.entity.components.resources.ResourceGroup getResourceGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getResourcesForGroup

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResourcesForGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### createResourceFromSerial

    public void createResourceFromSerial([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") blueprintSerial)
  + ### createResourceFromSerial

    public void createResourceFromSerial([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") groupName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") blueprintSerial)
  + ### createResource

    public void createResource([ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") blueprint)
  + ### createResource

    public void createResource([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") groupName,
    [ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") blueprint)
  + ### addResourceInternal

    private void addResourceInternal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") groupName,
    [Resource](Resource.html "class in zombie.entity.components.resources") resource)
  + ### removeResourceGroup

    public void removeResourceGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") groupName)
  + ### removeResourceGroup

    public void removeResourceGroup(zombie.entity.components.resources.ResourceGroup group)
  + ### removeResourceGroupInternal

    private void removeResourceGroupInternal(zombie.entity.components.resources.ResourceGroup group)
  + ### removeResource

    public void removeResource([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") resourceID)
  + ### removeResource

    public void removeResource([Resource](Resource.html "class in zombie.entity.components.resources") resource)
  + ### removeResourceInternal

    private void removeResourceInternal([Resource](Resource.html "class in zombie.entity.components.resources") resource,
    boolean removeFromGroup)
  + ### addChannelResource

    private void addChannelResource([Resource](Resource.html "class in zombie.entity.components.resources") resource)
  + ### removeChannelResource

    private void removeChannelResource([Resource](Resource.html "class in zombie.entity.components.resources") resource)
  + ### getResource

    public [Resource](Resource.html "class in zombie.entity.components.resources") getResource([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nameId)
  + ### getResource

    public [Resource](Resource.html "class in zombie.entity.components.resources") getResource(int index)
  + ### getResourceIndex

    public int getResourceIndex([Resource](Resource.html "class in zombie.entity.components.resources") resource)
  + ### getResourceCount

    public int getResourceCount()
  + ### getResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io)
  + ### getResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") type)
  + ### getResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io,
    [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel)
  + ### getResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel)
  + ### getResources

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io,
    [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") type)
  + ### getResourcesFromGroup

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResourcesFromGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") group,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io)
  + ### getResourcesFromGroup

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResourcesFromGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") group,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") type)
  + ### getResourcesFromGroup

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResourcesFromGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") group,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io,
    [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel)
  + ### getResourcesFromGroup

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResourcesFromGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") group,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel)
  + ### getResourcesFromGroup

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResourcesFromGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") group,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io,
    [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") type)
  + ### getResourcesFromGroup

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResourcesFromGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") group,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io,
    [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") type,
    [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel,
    boolean clear)
  + ### getResources

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> getResources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> sources,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](Resource.html "class in zombie.entity.components.resources")> list,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io,
    [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") type,
    [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel,
    boolean clear)
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
  + ### dumpContentsInSquare

    public void dumpContentsInSquare()

    Overrides:
    :   `dumpContentsInSquare` in class `Component`
  + ### isNoContainerOrEmpty

    public boolean isNoContainerOrEmpty()

    Overrides:
    :   `isNoContainerOrEmpty` in class `Component`