[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.resources](package-summary.html)
2. [ResourceBlueprint](ResourceBlueprint.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [serialElementSeparator](#serialElementSeparator)
   3. [serialSubSeparator](#serialSubSeparator)
   4. [str\_null](#str_null)
   5. [stackAnyItemIdentifier](#stackAnyItemIdentifier)
   6. [initialSerialLength](#initialSerialLength)
   7. [id](#id)
   8. [type](#type)
   9. [io](#io)
   10. [capacity](#capacity)
   11. [channel](#channel)
   12. [resourceFlags](#resourceFlags)
   13. [filter](#filter)
   14. [stackAnyItem](#stackAnyItem)
   15. [threadLocalSb](#threadLocalSb)
6. [Constructor Details](#constructor-detail)
   1. [ResourceBlueprint()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [alloc\_empty()](#alloc_empty())
   2. [alloc(String, ResourceType, ResourceIO, float, String, ResourceChannel, EnumBitStore)](#alloc(java.lang.String,zombie.entity.components.resources.ResourceType,zombie.entity.components.resources.ResourceIO,float,java.lang.String,zombie.entity.components.resources.ResourceChannel,zombie.entity.util.enums.EnumBitStore))
   3. [release(ResourceBlueprint)](#release(zombie.entity.components.resources.ResourceBlueprint))
   4. [getId()](#getId())
   5. [getType()](#getType())
   6. [getIO()](#getIO())
   7. [getCapacity()](#getCapacity())
   8. [isStackAnyItem()](#isStackAnyItem())
   9. [getChannel()](#getChannel())
   10. [hasFlag(ResourceFlag)](#hasFlag(zombie.entity.components.resources.ResourceFlag))
   11. [getFlagBits()](#getFlagBits())
   12. [getFilter()](#getFilter())
   13. [reset()](#reset())
   14. [checkCharacters(String)](#checkCharacters(java.lang.String))
   15. [Serialize(ResourceBlueprint)](#Serialize(zombie.entity.components.resources.ResourceBlueprint))
   16. [Serialize(String, ResourceType, ResourceIO, float, boolean, String, ResourceChannel, EnumBitStore)](#Serialize(java.lang.String,zombie.entity.components.resources.ResourceType,zombie.entity.components.resources.ResourceIO,float,boolean,java.lang.String,zombie.entity.components.resources.ResourceChannel,zombie.entity.util.enums.EnumBitStore))
   17. [DeserializeFromScript(String)](#DeserializeFromScript(java.lang.String))
   18. [Deserialize(String)](#Deserialize(java.lang.String))
   19. [Deserialize(ResourceBlueprint, String)](#Deserialize(zombie.entity.components.resources.ResourceBlueprint,java.lang.String))
   20. [Deserialize(ResourceBlueprint, String, boolean)](#Deserialize(zombie.entity.components.resources.ResourceBlueprint,java.lang.String,boolean))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class ResourceBlueprint
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.resources.ResourceBlueprint

---

public class ResourceBlueprint
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `capacity`

  `private ResourceChannel`

  `channel`

  `private String`

  `filter`

  `private String`

  `id`

  `private static final int`

  `initialSerialLength`

  `private ResourceIO`

  `io`

  `private static final ConcurrentLinkedDeque<ResourceBlueprint>`

  `pool`

  `private final zombie.entity.util.enums.EnumBitStore<ResourceFlag>`

  `resourceFlags`

  `static final String`

  `serialElementSeparator`

  `static final String`

  `serialSubSeparator`

  `private boolean`

  `stackAnyItem`

  `private static final String`

  `stackAnyItemIdentifier`

  `private static final String`

  `str_null`

  `private static final ThreadLocal<StringBuilder>`

  `threadLocalSb`

  `private ResourceType`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ResourceBlueprint()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ResourceBlueprint`

  `alloc(String id,
  ResourceType type,
  ResourceIO io,
  float capacity,
  String filter,
  ResourceChannel channel,
  zombie.entity.util.enums.EnumBitStore<ResourceFlag> flags)`

  `private static ResourceBlueprint`

  `alloc_empty()`

  `private static String`

  `checkCharacters(String s)`

  `static ResourceBlueprint`

  `Deserialize(String serial)`

  `static ResourceBlueprint`

  `Deserialize(ResourceBlueprint bp,
  String serial)`

  `static ResourceBlueprint`

  `Deserialize(ResourceBlueprint bp,
  String serial,
  boolean flagsAsString)`

  `static ResourceBlueprint`

  `DeserializeFromScript(String serial)`

  In script the flags are defined as strings.

  `float`

  `getCapacity()`

  `ResourceChannel`

  `getChannel()`

  `String`

  `getFilter()`

  `int`

  `getFlagBits()`

  `String`

  `getId()`

  `ResourceIO`

  `getIO()`

  `ResourceType`

  `getType()`

  `boolean`

  `hasFlag(ResourceFlag flag)`

  `boolean`

  `isStackAnyItem()`

  `static void`

  `release(ResourceBlueprint bp)`

  `private void`

  `reset()`

  `static String`

  `Serialize(String id,
  ResourceType type,
  ResourceIO io,
  float capacity,
  boolean stackAnyItem,
  String filter,
  ResourceChannel channel,
  zombie.entity.util.enums.EnumBitStore<ResourceFlag> flags)`

  `static String`

  `Serialize(ResourceBlueprint bp)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private static final [ConcurrentLinkedDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedDeque.html "class or interface in java.util.concurrent")<[ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources")> pool
  + ### serialElementSeparator

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serialElementSeparator

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.resources.ResourceBlueprint.serialElementSeparator)
  + ### serialSubSeparator

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serialSubSeparator

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.resources.ResourceBlueprint.serialSubSeparator)
  + ### str\_null

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str\_null

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.resources.ResourceBlueprint.str_null)
  + ### stackAnyItemIdentifier

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stackAnyItemIdentifier

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.resources.ResourceBlueprint.stackAnyItemIdentifier)
  + ### initialSerialLength

    private static final int initialSerialLength

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.resources.ResourceBlueprint.initialSerialLength)
  + ### id

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### type

    private [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") type
  + ### io

    private [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io
  + ### capacity

    private float capacity
  + ### channel

    private [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel
  + ### resourceFlags

    private final zombie.entity.util.enums.EnumBitStore<[ResourceFlag](ResourceFlag.html "enum class in zombie.entity.components.resources")> resourceFlags
  + ### filter

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter
  + ### stackAnyItem

    private boolean stackAnyItem
  + ### threadLocalSb

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang")> threadLocalSb
* Constructor Details
  -------------------

  + ### ResourceBlueprint

    private ResourceBlueprint()
* Method Details
  --------------

  + ### alloc\_empty

    private static [ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") alloc\_empty()
  + ### alloc

    public static [ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") alloc([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") type,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io,
    float capacity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel,
    zombie.entity.util.enums.EnumBitStore<[ResourceFlag](ResourceFlag.html "enum class in zombie.entity.components.resources")> flags)
  + ### release

    public static void release([ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") bp)
  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getType

    public [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") getType()
  + ### getIO

    public [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") getIO()
  + ### getCapacity

    public float getCapacity()
  + ### isStackAnyItem

    public boolean isStackAnyItem()
  + ### getChannel

    public [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") getChannel()
  + ### hasFlag

    public boolean hasFlag([ResourceFlag](ResourceFlag.html "enum class in zombie.entity.components.resources") flag)
  + ### getFlagBits

    public int getFlagBits()
  + ### getFilter

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFilter()
  + ### reset

    private void reset()
  + ### checkCharacters

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") checkCharacters([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### Serialize

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Serialize([ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") bp)
  + ### Serialize

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Serialize([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [ResourceType](ResourceType.html "enum class in zombie.entity.components.resources") type,
    [ResourceIO](ResourceIO.html "enum class in zombie.entity.components.resources") io,
    float capacity,
    boolean stackAnyItem,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    [ResourceChannel](ResourceChannel.html "enum class in zombie.entity.components.resources") channel,
    zombie.entity.util.enums.EnumBitStore<[ResourceFlag](ResourceFlag.html "enum class in zombie.entity.components.resources")> flags)
  + ### DeserializeFromScript

    public static [ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") DeserializeFromScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serial)

    In script the flags are defined as strings.
    Therefore needs a special function (the default flag encoding/decoding is using their bits)
  + ### Deserialize

    public static [ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") Deserialize([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serial)
  + ### Deserialize

    public static [ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") Deserialize([ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") bp,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serial)
  + ### Deserialize

    public static [ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") Deserialize([ResourceBlueprint](ResourceBlueprint.html "class in zombie.entity.components.resources") bp,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") serial,
    boolean flagsAsString)