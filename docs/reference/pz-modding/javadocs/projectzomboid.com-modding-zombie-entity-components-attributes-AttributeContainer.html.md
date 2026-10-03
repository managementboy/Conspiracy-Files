[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [AttributeContainer](AttributeContainer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [maxAttributeId](#maxAttributeId)
   2. [attributes](#attributes)
   3. [STORAGE\_SIZE](#STORAGE_SIZE)
   4. [SAVE\_EMPTY](#SAVE_EMPTY)
   5. [SAVE\_COMPRESSED](#SAVE_COMPRESSED)
   6. [SAVE\_UNCOMPRESSED\_8](#SAVE_UNCOMPRESSED_8)
   7. [SAVE\_UNCOMPRESSED\_16](#SAVE_UNCOMPRESSED_16)
6. [Constructor Details](#constructor-detail)
   1. [AttributeContainer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [readFromScript(ComponentScript)](#readFromScript(zombie.scripting.entity.ComponentScript))
   2. [toString()](#toString())
   3. [size()](#size())
   4. [forEach(BiConsumer)](#forEach(java.util.function.BiConsumer))
   5. [contains(AttributeType)](#contains(zombie.entity.components.attributes.AttributeType))
   6. [remove(AttributeType)](#remove(zombie.entity.components.attributes.AttributeType))
   7. [removeAndRelease(AttributeType)](#removeAndRelease(zombie.entity.components.attributes.AttributeType))
   8. [getOrAdd(AttributeType)](#getOrAdd(zombie.entity.components.attributes.AttributeType))
   9. [add(AttributeType)](#add(zombie.entity.components.attributes.AttributeType))
   10. [putFromScript(AttributeType, String)](#putFromScript(zombie.entity.components.attributes.AttributeType,java.lang.String))
   11. [put(AttributeType.Enum, E)](#put(zombie.entity.components.attributes.AttributeType.Enum,E))
   12. [set(AttributeType.Enum, E)](#set(zombie.entity.components.attributes.AttributeType.Enum,E))
   13. [get(AttributeType.Enum)](#get(zombie.entity.components.attributes.AttributeType.Enum))
   14. [get(AttributeType.Enum, E)](#get(zombie.entity.components.attributes.AttributeType.Enum,E))
   15. [put(AttributeType.EnumSet, EnumSet)](#put(zombie.entity.components.attributes.AttributeType.EnumSet,java.util.EnumSet))
   16. [set(AttributeType.EnumSet, EnumSet)](#set(zombie.entity.components.attributes.AttributeType.EnumSet,java.util.EnumSet))
   17. [get(AttributeType.EnumSet)](#get(zombie.entity.components.attributes.AttributeType.EnumSet))
   18. [put(AttributeType.EnumStringSet, EnumStringObj)](#put(zombie.entity.components.attributes.AttributeType.EnumStringSet,zombie.entity.components.attributes.EnumStringObj))
   19. [set(AttributeType.EnumStringSet, EnumStringObj)](#set(zombie.entity.components.attributes.AttributeType.EnumStringSet,zombie.entity.components.attributes.EnumStringObj))
   20. [get(AttributeType.EnumStringSet)](#get(zombie.entity.components.attributes.AttributeType.EnumStringSet))
   21. [put(AttributeType.String, String)](#put(zombie.entity.components.attributes.AttributeType.String,java.lang.String))
   22. [set(AttributeType.String, String)](#set(zombie.entity.components.attributes.AttributeType.String,java.lang.String))
   23. [get(AttributeType.String)](#get(zombie.entity.components.attributes.AttributeType.String))
   24. [get(AttributeType.String, String)](#get(zombie.entity.components.attributes.AttributeType.String,java.lang.String))
   25. [put(AttributeType.Bool, boolean)](#put(zombie.entity.components.attributes.AttributeType.Bool,boolean))
   26. [set(AttributeType.Bool, boolean)](#set(zombie.entity.components.attributes.AttributeType.Bool,boolean))
   27. [get(AttributeType.Bool)](#get(zombie.entity.components.attributes.AttributeType.Bool))
   28. [get(AttributeType.Bool, boolean)](#get(zombie.entity.components.attributes.AttributeType.Bool,boolean))
   29. [putFloatValue(AttributeType.Numeric, float)](#putFloatValue(zombie.entity.components.attributes.AttributeType.Numeric,float))
   30. [setFloatValue(AttributeType.Numeric, float)](#setFloatValue(zombie.entity.components.attributes.AttributeType.Numeric,float))
   31. [getFloatValue(AttributeType.Numeric)](#getFloatValue(zombie.entity.components.attributes.AttributeType.Numeric))
   32. [getFloatValue(AttributeType.Numeric, float)](#getFloatValue(zombie.entity.components.attributes.AttributeType.Numeric,float))
   33. [put(AttributeType.Float, float)](#put(zombie.entity.components.attributes.AttributeType.Float,float))
   34. [set(AttributeType.Float, float)](#set(zombie.entity.components.attributes.AttributeType.Float,float))
   35. [get(AttributeType.Float)](#get(zombie.entity.components.attributes.AttributeType.Float))
   36. [get(AttributeType.Float, float)](#get(zombie.entity.components.attributes.AttributeType.Float,float))
   37. [put(AttributeType.Double, double)](#put(zombie.entity.components.attributes.AttributeType.Double,double))
   38. [set(AttributeType.Double, double)](#set(zombie.entity.components.attributes.AttributeType.Double,double))
   39. [get(AttributeType.Double)](#get(zombie.entity.components.attributes.AttributeType.Double))
   40. [get(AttributeType.Double, double)](#get(zombie.entity.components.attributes.AttributeType.Double,double))
   41. [put(AttributeType.Byte, byte)](#put(zombie.entity.components.attributes.AttributeType.Byte,byte))
   42. [set(AttributeType.Byte, byte)](#set(zombie.entity.components.attributes.AttributeType.Byte,byte))
   43. [get(AttributeType.Byte)](#get(zombie.entity.components.attributes.AttributeType.Byte))
   44. [get(AttributeType.Byte, byte)](#get(zombie.entity.components.attributes.AttributeType.Byte,byte))
   45. [put(AttributeType.Short, short)](#put(zombie.entity.components.attributes.AttributeType.Short,short))
   46. [set(AttributeType.Short, short)](#set(zombie.entity.components.attributes.AttributeType.Short,short))
   47. [get(AttributeType.Short)](#get(zombie.entity.components.attributes.AttributeType.Short))
   48. [get(AttributeType.Short, short)](#get(zombie.entity.components.attributes.AttributeType.Short,short))
   49. [put(AttributeType.Int, int)](#put(zombie.entity.components.attributes.AttributeType.Int,int))
   50. [set(AttributeType.Int, int)](#set(zombie.entity.components.attributes.AttributeType.Int,int))
   51. [get(AttributeType.Int)](#get(zombie.entity.components.attributes.AttributeType.Int))
   52. [get(AttributeType.Int, int)](#get(zombie.entity.components.attributes.AttributeType.Int,int))
   53. [put(AttributeType.Long, long)](#put(zombie.entity.components.attributes.AttributeType.Long,long))
   54. [set(AttributeType.Long, long)](#set(zombie.entity.components.attributes.AttributeType.Long,long))
   55. [get(AttributeType.Long)](#get(zombie.entity.components.attributes.AttributeType.Long))
   56. [get(AttributeType.Long, long)](#get(zombie.entity.components.attributes.AttributeType.Long,long))
   57. [getKey(int)](#getKey(int))
   58. [getAttribute(int)](#getAttribute(int))
   59. [getAttribute(AttributeType)](#getAttribute(zombie.entity.components.attributes.AttributeType))
   60. [recalculateMaxId()](#recalculateMaxId())
   61. [reset()](#reset())
   62. [clear()](#clear())
   63. [Copy(AttributeContainer, AttributeContainer)](#Copy(zombie.entity.components.attributes.AttributeContainer,zombie.entity.components.attributes.AttributeContainer))
   64. [Merge(AttributeContainer, AttributeContainer)](#Merge(zombie.entity.components.attributes.AttributeContainer,zombie.entity.components.attributes.AttributeContainer))
   65. [copy()](#copy())
   66. [isIdenticalTo(AttributeContainer)](#isIdenticalTo(zombie.entity.components.attributes.AttributeContainer))
   67. [onReceivePacket(ByteBufferReader, EntityPacketType, IConnection)](#onReceivePacket(zombie.core.network.ByteBufferReader,zombie.entity.network.EntityPacketType,zombie.network.IConnection))
   68. [saveSyncData(ByteBuffer)](#saveSyncData(java.nio.ByteBuffer))
   69. [loadSyncData(ByteBuffer)](#loadSyncData(java.nio.ByteBuffer))
   70. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   71. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   72. [DoTooltip(ObjectTooltip, ObjectTooltip.Layout)](#DoTooltip(zombie.ui.ObjectTooltip,zombie.ui.ObjectTooltip.Layout))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeContainer
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.Component](../../Component.html "class in zombie.entity")

zombie.entity.components.attributes.AttributeContainer

---

public class AttributeContainer
extends [Component](../../Component.html "class in zombie.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final AssocArray<AttributeType, AttributeInstance<?,?>>`

  `attributes`

  `private short`

  `maxAttributeId`

  `private static final byte`

  `SAVE_COMPRESSED`

  `private static final byte`

  `SAVE_EMPTY`

  `private static final byte`

  `SAVE_UNCOMPRESSED_16`

  `private static final byte`

  `SAVE_UNCOMPRESSED_8`

  `static final short`

  `STORAGE_SIZE`

  ### Fields inherited from class [Component](../../Component.html#field-summary "class in zombie.entity")

  `owner`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `AttributeContainer()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `add(AttributeType type)`

  `void`

  `clear()`

  `boolean`

  `contains(AttributeType type)`

  `AttributeContainer`

  `copy()`

  `static void`

  `Copy(AttributeContainer source,
  AttributeContainer target)`

  Clears the target container and copies all attributes from the source container.

  `void`

  `DoTooltip(ObjectTooltip tooltipUI,
  ObjectTooltip.Layout layout)`

  `void`

  `forEach(BiConsumer<AttributeType, AttributeInstance> action)`

  `final boolean`

  `get(AttributeType.Bool type)`

  `final boolean`

  `get(AttributeType.Bool type,
  boolean defaultTo)`

  `final byte`

  `get(AttributeType.Byte type)`

  `final byte`

  `get(AttributeType.Byte type,
  byte defaultTo)`

  `final double`

  `get(AttributeType.Double type)`

  `final double`

  `get(AttributeType.Double type,
  double defaultTo)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  E`

  `get(AttributeType.Enum<E> type)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  E`

  `get(AttributeType.Enum<E> type,
  E defaultTo)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  EnumSet<E>`

  `get(AttributeType.EnumSet<E> type)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  EnumStringObj<E>`

  `get(AttributeType.EnumStringSet<E> type)`

  `final float`

  `get(AttributeType.Float type)`

  `final float`

  `get(AttributeType.Float type,
  float defaultTo)`

  `final int`

  `get(AttributeType.Int type)`

  `final int`

  `get(AttributeType.Int type,
  int defaultTo)`

  `final long`

  `get(AttributeType.Long type)`

  `final long`

  `get(AttributeType.Long type,
  long defaultTo)`

  `final short`

  `get(AttributeType.Short type)`

  `final short`

  `get(AttributeType.Short type,
  short defaultTo)`

  `final String`

  `get(AttributeType.String type)`

  `final String`

  `get(AttributeType.String type,
  String defaultTo)`

  `AttributeInstance`

  `getAttribute(int index)`

  `AttributeInstance`

  `getAttribute(AttributeType type)`

  `final float`

  `getFloatValue(AttributeType.Numeric type)`

  `final float`

  `getFloatValue(AttributeType.Numeric type,
  float defaultTo)`

  `AttributeType`

  `getKey(int index)`

  `protected AttributeInstance<?,?>`

  `getOrAdd(AttributeType type)`

  `boolean`

  `isIdenticalTo(AttributeContainer other)`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `protected void`

  `loadSyncData(ByteBuffer input)`

  `static void`

  `Merge(AttributeContainer source,
  AttributeContainer target)`

  Merges the source container into the target container.

  `protected boolean`

  `onReceivePacket(zombie.core.network.ByteBufferReader input,
  zombie.entity.network.EntityPacketType type,
  zombie.network.IConnection senderConnection)`

  `final void`

  `put(AttributeType.Bool type,
  boolean value)`

  `final void`

  `put(AttributeType.Byte type,
  byte value)`

  `final void`

  `put(AttributeType.Double type,
  double value)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  void`

  `put(AttributeType.Enum<E> type,
  E value)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  void`

  `put(AttributeType.EnumSet<E> type,
  EnumSet<E> value)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  void`

  `put(AttributeType.EnumStringSet<E> type,
  EnumStringObj<E> value)`

  `final void`

  `put(AttributeType.Float type,
  float value)`

  `final void`

  `put(AttributeType.Int type,
  int value)`

  `final void`

  `put(AttributeType.Long type,
  long value)`

  `final void`

  `put(AttributeType.Short type,
  short value)`

  `final void`

  `put(AttributeType.String type,
  String value)`

  `final void`

  `putFloatValue(AttributeType.Numeric type,
  float value)`

  `final boolean`

  `putFromScript(AttributeType type,
  String scriptVal)`

  `protected void`

  `readFromScript(ComponentScript componentScript)`

  `private void`

  `recalculateMaxId()`

  `void`

  `remove(AttributeType type)`

  `private AttributeInstance`

  `removeAndRelease(AttributeType type)`

  `protected void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  This function saves attributes by whichever method produces the smallest size for the save.

  `protected void`

  `saveSyncData(ByteBuffer output)`

  `final void`

  `set(AttributeType.Bool type,
  boolean value)`

  `final void`

  `set(AttributeType.Byte type,
  byte value)`

  `final void`

  `set(AttributeType.Double type,
  double value)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  void`

  `set(AttributeType.Enum<E> type,
  E value)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  void`

  `set(AttributeType.EnumSet<E> type,
  EnumSet<E> value)`

  `final <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  void`

  `set(AttributeType.EnumStringSet<E> type,
  EnumStringObj<E> value)`

  `final void`

  `set(AttributeType.Float type,
  float value)`

  `final void`

  `set(AttributeType.Int type,
  int value)`

  `final void`

  `set(AttributeType.Long type,
  long value)`

  `final void`

  `set(AttributeType.Short type,
  short value)`

  `final void`

  `set(AttributeType.String type,
  String value)`

  `final void`

  `setFloatValue(AttributeType.Numeric type,
  float value)`

  `int`

  `size()`

  `String`

  `toString()`

  ### Methods inherited from class [Component](../../Component.html#method-summary "class in zombie.entity")

  `DoTooltip, dumpContentsInSquare, getComponent, getComponentType, getGameEntity, getOwner, getRenderLastPriority, getUsingPlayer, isAddedToEngine, isNoContainerOrEmpty, isQualifiesForMetaStorage, isRenderLast, isRunningInMeta, isUsingPlayer, isValid, isValidOwnerType, onAddedToOwner, onComponentEvent, onConnectComponents, onEntityEvent, onFirstCreation, onRemovedFromOwner, renderlast, sendClientPacket, sendComponentEvent, sendComponentEvent, sendServerPacket, sendServerPacketTo, setOwner`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### maxAttributeId

    private short maxAttributeId
  + ### attributes

    private final [AssocArray](../../util/assoc/AssocArray.html "class in zombie.entity.util.assoc")<[AttributeType](AttributeType.html "class in zombie.entity.components.attributes"), [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<?,?>> attributes
  + ### STORAGE\_SIZE

    public static final short STORAGE\_SIZE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.attributes.AttributeContainer.STORAGE_SIZE)
  + ### SAVE\_EMPTY

    private static final byte SAVE\_EMPTY

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.attributes.AttributeContainer.SAVE_EMPTY)
  + ### SAVE\_COMPRESSED

    private static final byte SAVE\_COMPRESSED

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.attributes.AttributeContainer.SAVE_COMPRESSED)
  + ### SAVE\_UNCOMPRESSED\_8

    private static final byte SAVE\_UNCOMPRESSED\_8

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.attributes.AttributeContainer.SAVE_UNCOMPRESSED_8)
  + ### SAVE\_UNCOMPRESSED\_16

    private static final byte SAVE\_UNCOMPRESSED\_16

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.attributes.AttributeContainer.SAVE_UNCOMPRESSED_16)
* Constructor Details
  -------------------

  + ### AttributeContainer

    private AttributeContainer()
* Method Details
  --------------

  + ### readFromScript

    protected void readFromScript([ComponentScript](../../../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") componentScript)

    Overrides:
    :   `readFromScript` in class `Component`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Component`
  + ### size

    public int size()
  + ### forEach

    public void forEach([BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<[AttributeType](AttributeType.html "class in zombie.entity.components.attributes"), [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")> action)
  + ### contains

    public boolean contains([AttributeType](AttributeType.html "class in zombie.entity.components.attributes") type)
  + ### remove

    public void remove([AttributeType](AttributeType.html "class in zombie.entity.components.attributes") type)
  + ### removeAndRelease

    private [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes") removeAndRelease([AttributeType](AttributeType.html "class in zombie.entity.components.attributes") type)
  + ### getOrAdd

    protected [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<?,?> getOrAdd([AttributeType](AttributeType.html "class in zombie.entity.components.attributes") type)
  + ### add

    public boolean add([AttributeType](AttributeType.html "class in zombie.entity.components.attributes") type)
  + ### putFromScript

    public final boolean putFromScript([AttributeType](AttributeType.html "class in zombie.entity.components.attributes") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptVal)
  + ### put

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    void put([AttributeType.Enum](AttributeType.Enum.html "class in zombie.entity.components.attributes")<E> type,
    E value)
  + ### set

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    void set([AttributeType.Enum](AttributeType.Enum.html "class in zombie.entity.components.attributes")<E> type,
    E value)
  + ### get

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    E get([AttributeType.Enum](AttributeType.Enum.html "class in zombie.entity.components.attributes")<E> type)
  + ### get

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    E get([AttributeType.Enum](AttributeType.Enum.html "class in zombie.entity.components.attributes")<E> type,
    E defaultTo)
  + ### put

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    void put([AttributeType.EnumSet](AttributeType.EnumSet.html "class in zombie.entity.components.attributes")<E> type,
    [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<E> value)
  + ### set

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    void set([AttributeType.EnumSet](AttributeType.EnumSet.html "class in zombie.entity.components.attributes")<E> type,
    [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<E> value)
  + ### get

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<E> get([AttributeType.EnumSet](AttributeType.EnumSet.html "class in zombie.entity.components.attributes")<E> type)
  + ### put

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    void put([AttributeType.EnumStringSet](AttributeType.EnumStringSet.html "class in zombie.entity.components.attributes")<E> type,
    [EnumStringObj](EnumStringObj.html "class in zombie.entity.components.attributes")<E> value)
  + ### set

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    void set([AttributeType.EnumStringSet](AttributeType.EnumStringSet.html "class in zombie.entity.components.attributes")<E> type,
    [EnumStringObj](EnumStringObj.html "class in zombie.entity.components.attributes")<E> value)
  + ### get

    public final <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    [EnumStringObj](EnumStringObj.html "class in zombie.entity.components.attributes")<E> get([AttributeType.EnumStringSet](AttributeType.EnumStringSet.html "class in zombie.entity.components.attributes")<E> type)
  + ### put

    public final void put([AttributeType.String](AttributeType.String.html "class in zombie.entity.components.attributes") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### set

    public final void set([AttributeType.String](AttributeType.String.html "class in zombie.entity.components.attributes") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### get

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") get([AttributeType.String](AttributeType.String.html "class in zombie.entity.components.attributes") type)
  + ### get

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") get([AttributeType.String](AttributeType.String.html "class in zombie.entity.components.attributes") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultTo)
  + ### put

    public final void put([AttributeType.Bool](AttributeType.Bool.html "class in zombie.entity.components.attributes") type,
    boolean value)
  + ### set

    public final void set([AttributeType.Bool](AttributeType.Bool.html "class in zombie.entity.components.attributes") type,
    boolean value)
  + ### get

    public final boolean get([AttributeType.Bool](AttributeType.Bool.html "class in zombie.entity.components.attributes") type)
  + ### get

    public final boolean get([AttributeType.Bool](AttributeType.Bool.html "class in zombie.entity.components.attributes") type,
    boolean defaultTo)
  + ### putFloatValue

    public final void putFloatValue([AttributeType.Numeric](AttributeType.Numeric.html "class in zombie.entity.components.attributes") type,
    float value)
  + ### setFloatValue

    public final void setFloatValue([AttributeType.Numeric](AttributeType.Numeric.html "class in zombie.entity.components.attributes") type,
    float value)
  + ### getFloatValue

    public final float getFloatValue([AttributeType.Numeric](AttributeType.Numeric.html "class in zombie.entity.components.attributes") type)
  + ### getFloatValue

    public final float getFloatValue([AttributeType.Numeric](AttributeType.Numeric.html "class in zombie.entity.components.attributes") type,
    float defaultTo)
  + ### put

    public final void put([AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes") type,
    float value)
  + ### set

    public final void set([AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes") type,
    float value)
  + ### get

    public final float get([AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes") type)
  + ### get

    public final float get([AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes") type,
    float defaultTo)
  + ### put

    public final void put([AttributeType.Double](AttributeType.Double.html "class in zombie.entity.components.attributes") type,
    double value)
  + ### set

    public final void set([AttributeType.Double](AttributeType.Double.html "class in zombie.entity.components.attributes") type,
    double value)
  + ### get

    public final double get([AttributeType.Double](AttributeType.Double.html "class in zombie.entity.components.attributes") type)
  + ### get

    public final double get([AttributeType.Double](AttributeType.Double.html "class in zombie.entity.components.attributes") type,
    double defaultTo)
  + ### put

    public final void put([AttributeType.Byte](AttributeType.Byte.html "class in zombie.entity.components.attributes") type,
    byte value)
  + ### set

    public final void set([AttributeType.Byte](AttributeType.Byte.html "class in zombie.entity.components.attributes") type,
    byte value)
  + ### get

    public final byte get([AttributeType.Byte](AttributeType.Byte.html "class in zombie.entity.components.attributes") type)
  + ### get

    public final byte get([AttributeType.Byte](AttributeType.Byte.html "class in zombie.entity.components.attributes") type,
    byte defaultTo)
  + ### put

    public final void put([AttributeType.Short](AttributeType.Short.html "class in zombie.entity.components.attributes") type,
    short value)
  + ### set

    public final void set([AttributeType.Short](AttributeType.Short.html "class in zombie.entity.components.attributes") type,
    short value)
  + ### get

    public final short get([AttributeType.Short](AttributeType.Short.html "class in zombie.entity.components.attributes") type)
  + ### get

    public final short get([AttributeType.Short](AttributeType.Short.html "class in zombie.entity.components.attributes") type,
    short defaultTo)
  + ### put

    public final void put([AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") type,
    int value)
  + ### set

    public final void set([AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") type,
    int value)
  + ### get

    public final int get([AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") type)
  + ### get

    public final int get([AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") type,
    int defaultTo)
  + ### put

    public final void put([AttributeType.Long](AttributeType.Long.html "class in zombie.entity.components.attributes") type,
    long value)
  + ### set

    public final void set([AttributeType.Long](AttributeType.Long.html "class in zombie.entity.components.attributes") type,
    long value)
  + ### get

    public final long get([AttributeType.Long](AttributeType.Long.html "class in zombie.entity.components.attributes") type)
  + ### get

    public final long get([AttributeType.Long](AttributeType.Long.html "class in zombie.entity.components.attributes") type,
    long defaultTo)
  + ### getKey

    public [AttributeType](AttributeType.html "class in zombie.entity.components.attributes") getKey(int index)
  + ### getAttribute

    public [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes") getAttribute(int index)
  + ### getAttribute

    public [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes") getAttribute([AttributeType](AttributeType.html "class in zombie.entity.components.attributes") type)
  + ### recalculateMaxId

    private void recalculateMaxId()
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `Component`
  + ### clear

    public void clear()
  + ### Copy

    public static void Copy([AttributeContainer](AttributeContainer.html "class in zombie.entity.components.attributes") source,
    [AttributeContainer](AttributeContainer.html "class in zombie.entity.components.attributes") target)

    Clears the target container and copies all attributes from the source container.
    Note: This will NOT copy flags!
  + ### Merge

    public static void Merge([AttributeContainer](AttributeContainer.html "class in zombie.entity.components.attributes") source,
    [AttributeContainer](AttributeContainer.html "class in zombie.entity.components.attributes") target)

    Merges the source container into the target container.
    When attributes exist in both containers the target attribute gets replaced with the source attribute.
    Note: This will NOT merge flags!
  + ### copy

    public [AttributeContainer](AttributeContainer.html "class in zombie.entity.components.attributes") copy()
  + ### isIdenticalTo

    public boolean isIdenticalTo([AttributeContainer](AttributeContainer.html "class in zombie.entity.components.attributes") other)
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

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    This function saves attributes by whichever method produces the smallest size for the save.
    SAVE\_COMPRESSED
    This saves the AttributeType's as bits in long values.
    Compressed will reduce some bytes if many attributes are to be saved.
    SAVE\_UNCOMPRESSED\_8 invalid input: '&' SAVE\_UNCOMPRESSED\_16
    This saves the AttributeType's by their ID either as byte of short.

    Overrides:
    :   `save` in class `Component`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `load` in class `Component`

    Throws:
    :   `IOException`
  + ### DoTooltip

    public void DoTooltip([ObjectTooltip](../../../ui/ObjectTooltip.html "class in zombie.ui") tooltipUI,
    [ObjectTooltip.Layout](../../../ui/ObjectTooltip.Layout.html "class in zombie.ui") layout)

    Overrides:
    :   `DoTooltip` in class `Component`