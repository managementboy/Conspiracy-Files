[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.properties](package-summary.html)
2. [PropertyContainer](PropertyContainer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [spriteFlags1](#spriteFlags1)
   2. [spriteFlags2](#spriteFlags2)
   3. [keyArray](#keyArray)
   4. [sorted](#sorted)
   5. [surface](#surface)
   6. [surfaceFlags](#surfaceFlags)
   7. [stackReplaceTileOffset](#stackReplaceTileOffset)
   8. [itemHeight](#itemHeight)
   9. [slopedSurfaceDirection](#slopedSurfaceDirection)
   10. [slopedSurfaceHeightMin](#slopedSurfaceHeightMin)
   11. [slopedSurfaceHeightMax](#slopedSurfaceHeightMax)
   12. [SURFACE\_VALID](#SURFACE_VALID)
   13. [SURFACE\_ISOFFSET](#SURFACE_ISOFFSET)
   14. [SURFACE\_ISTABLE](#SURFACE_ISTABLE)
   15. [SURFACE\_ISTABLETOP](#SURFACE_ISTABLETOP)
7. [Constructor Details](#constructor-detail)
   1. [PropertyContainer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [CreateKeySet()](#CreateKeySet())
   2. [recreateKeyArray()](#recreateKeyArray())
   3. [AddProperties(PropertyContainer)](#AddProperties(zombie.core.properties.PropertyContainer))
   4. [Clear()](#Clear())
   5. [has(IsoFlagType)](#has(zombie.iso.SpriteDetails.IsoFlagType))
   6. [has(Double)](#has(java.lang.Double))
   7. [set(String)](#set(java.lang.String))
   8. [set(IsoPropertyType, String)](#set(zombie.core.properties.IsoPropertyType,java.lang.String))
   9. [set(String, String)](#set(java.lang.String,java.lang.String))
   10. [set(IsoPropertyType, String, boolean)](#set(zombie.core.properties.IsoPropertyType,java.lang.String,boolean))
   11. [set(String, String, boolean)](#set(java.lang.String,java.lang.String,boolean))
   12. [set(IsoFlagType)](#set(zombie.iso.SpriteDetails.IsoFlagType))
   13. [set(IsoFlagType, String)](#set(zombie.iso.SpriteDetails.IsoFlagType,java.lang.String))
   14. [unset(String)](#unset(java.lang.String))
   15. [unset(IsoFlagType)](#unset(zombie.iso.SpriteDetails.IsoFlagType))
   16. [get(IsoPropertyType)](#get(zombie.core.properties.IsoPropertyType))
   17. [get(String)](#get(java.lang.String))
   18. [propertyEquals(IsoPropertyType, String)](#propertyEquals(zombie.core.properties.IsoPropertyType,java.lang.String))
   19. [propertyEquals(String, String)](#propertyEquals(java.lang.String,java.lang.String))
   20. [has(IsoPropertyType)](#has(zombie.core.properties.IsoPropertyType))
   21. [has(IsoPropertyType...)](#has(zombie.core.properties.IsoPropertyType...))
   22. [has(String)](#has(java.lang.String))
   23. [getFlagsList()](#getFlagsList())
   24. [getPropertyNames()](#getPropertyNames())
   25. [initSurface()](#initSurface())
   26. [getSurface()](#getSurface())
   27. [isSurfaceOffset()](#isSurfaceOffset())
   28. [isTable()](#isTable())
   29. [isTableTop()](#isTableTop())
   30. [getStackReplaceTileOffset()](#getStackReplaceTileOffset())
   31. [getItemHeight()](#getItemHeight())
   32. [getSlopedSurfaceDirection()](#getSlopedSurfaceDirection())
   33. [getSlopedSurfaceHeightMin()](#getSlopedSurfaceHeightMin())
   34. [getSlopedSurfaceHeightMax()](#getSlopedSurfaceHeightMax())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PropertyContainer
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

gnu.trove.impl.hash.THash

gnu.trove.impl.hash.TPrimitiveHash

gnu.trove.impl.hash.TShortShortHash

gnu.trove.map.hash.TShortShortHashMap

zombie.core.properties.PropertyContainer

All Implemented Interfaces:
:   `gnu.trove.map.TShortShortMap, Externalizable, Serializable`

---

public final class PropertyContainer
extends gnu.trove.map.hash.TShortShortHashMap

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.core.properties.PropertyContainer)

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `PropertyContainer.MostTested`

  `private static class`

  `PropertyContainer.ProfileEntryComparitor`

  ### Nested classes/interfaces inherited from class gnu.trove.map.hash.TShortShortHashMap

  `gnu.trove.map.hash.TShortShortHashMap.TKeyView, gnu.trove.map.hash.TShortShortHashMap.TValueView`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private byte`

  `itemHeight`

  `private short[]`

  `keyArray`

  `private IsoDirections`

  `slopedSurfaceDirection`

  `private byte`

  `slopedSurfaceHeightMax`

  `private byte`

  `slopedSurfaceHeightMin`

  `static List<Object>`

  `sorted`

  `private long`

  `spriteFlags1`

  `private long`

  `spriteFlags2`

  `private short`

  `stackReplaceTileOffset`

  `private byte`

  `surface`

  `private static final byte`

  `SURFACE_ISOFFSET`

  `private static final byte`

  `SURFACE_ISTABLE`

  `private static final byte`

  `SURFACE_ISTABLETOP`

  `private static final byte`

  `SURFACE_VALID`

  `private byte`

  `surfaceFlags`

  ### Fields inherited from class gnu.trove.map.hash.TShortShortHashMap

  `_values`

  ### Fields inherited from class gnu.trove.impl.hash.TShortShortHash

  `_set, consumeFreeSlot, no_entry_key, no_entry_value`

  ### Fields inherited from class gnu.trove.impl.hash.TPrimitiveHash

  `_states, FREE, FULL, REMOVED`

  ### Fields inherited from class gnu.trove.impl.hash.THash

  `_autoCompactionFactor, _autoCompactRemovesRemaining, _autoCompactTemporaryDisable, _free, _loadFactor, _maxSize, _size, DEFAULT_CAPACITY, DEFAULT_LOAD_FACTOR`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PropertyContainer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddProperties(PropertyContainer other)`

  `void`

  `Clear()`

  `void`

  `CreateKeySet()`

  `String`

  `get(String name)`

  `String`

  `get(IsoPropertyType type)`

  `ArrayList<IsoFlagType>`

  `getFlagsList()`

  `int`

  `getItemHeight()`

  `ArrayList<String>`

  `getPropertyNames()`

  `IsoDirections`

  `getSlopedSurfaceDirection()`

  `int`

  `getSlopedSurfaceHeightMax()`

  `int`

  `getSlopedSurfaceHeightMin()`

  `int`

  `getStackReplaceTileOffset()`

  `int`

  `getSurface()`

  `boolean`

  `has(Double flag)`

  `boolean`

  `has(String isoPropertyType)`

  `boolean`

  `has(IsoPropertyType isoPropertyType)`

  `boolean`

  `has(IsoPropertyType... isoPropertyType)`

  `boolean`

  `has(IsoFlagType flag)`

  `private void`

  `initSurface()`

  `boolean`

  `isSurfaceOffset()`

  `boolean`

  `isTable()`

  `boolean`

  `isTableTop()`

  `boolean`

  `propertyEquals(String name,
  String value)`

  `boolean`

  `propertyEquals(IsoPropertyType type,
  String value)`

  `private void`

  `recreateKeyArray()`

  `void`

  `set(String tilePropertyKey)`

  `void`

  `set(String propName,
  String propValue)`

  `void`

  `set(String propName,
  String propValue,
  boolean checkIsoFlagType)`

  `void`

  `set(IsoPropertyType type,
  String propValue)`

  `void`

  `set(IsoPropertyType type,
  String propValue,
  boolean checkIsoFlagType)`

  `void`

  `set(IsoFlagType flag)`

  `void`

  `set(IsoFlagType flag,
  String ignored)`

  `void`

  `unset(String propName)`

  `void`

  `unset(IsoFlagType flag)`

  ### Methods inherited from class gnu.trove.map.hash.TShortShortHashMap

  `adjustOrPutValue, adjustValue, clear, containsKey, containsValue, equals, forEachEntry, forEachKey, forEachValue, get, hashCode, increment, isEmpty, iterator, keys, keys, keySet, put, putAll, putAll, putIfAbsent, readExternal, rehash, remove, removeAt, retainEntries, setUp, toString, transformValues, valueCollection, values, values, writeExternal`

  ### Methods inherited from class gnu.trove.impl.hash.TShortShortHash

  `contains, forEach, getNoEntryKey, getNoEntryValue, index, insertKey, XinsertKey`

  ### Methods inherited from class gnu.trove.impl.hash.TPrimitiveHash

  `capacity`

  ### Methods inherited from class gnu.trove.impl.hash.THash

  `calculateGrownCapacity, compact, computeMaxSize, computeNextAutoCompactionAmount, ensureCapacity, getAutoCompactionFactor, postInsertHook, reenableAutoCompaction, setAutoCompactionFactor, size, tempDisableAutoCompaction, trimToSize`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface gnu.trove.map.TShortShortMap

  `getNoEntryKey, getNoEntryValue, size`

* Field Details
  -------------

  + ### spriteFlags1

    private long spriteFlags1
  + ### spriteFlags2

    private long spriteFlags2
  + ### keyArray

    private short[] keyArray
  + ### sorted

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> sorted
  + ### surface

    private byte surface
  + ### surfaceFlags

    private byte surfaceFlags
  + ### stackReplaceTileOffset

    private short stackReplaceTileOffset
  + ### itemHeight

    private byte itemHeight
  + ### slopedSurfaceDirection

    private [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") slopedSurfaceDirection
  + ### slopedSurfaceHeightMin

    private byte slopedSurfaceHeightMin
  + ### slopedSurfaceHeightMax

    private byte slopedSurfaceHeightMax
  + ### SURFACE\_VALID

    private static final byte SURFACE\_VALID

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.properties.PropertyContainer.SURFACE_VALID)
  + ### SURFACE\_ISOFFSET

    private static final byte SURFACE\_ISOFFSET

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.properties.PropertyContainer.SURFACE_ISOFFSET)
  + ### SURFACE\_ISTABLE

    private static final byte SURFACE\_ISTABLE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.properties.PropertyContainer.SURFACE_ISTABLE)
  + ### SURFACE\_ISTABLETOP

    private static final byte SURFACE\_ISTABLETOP

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.properties.PropertyContainer.SURFACE_ISTABLETOP)
* Constructor Details
  -------------------

  + ### PropertyContainer

    public PropertyContainer()
* Method Details
  --------------

  + ### CreateKeySet

    public void CreateKeySet()
  + ### recreateKeyArray

    private void recreateKeyArray()
  + ### AddProperties

    public void AddProperties([PropertyContainer](PropertyContainer.html "class in zombie.core.properties") other)
  + ### Clear

    public void Clear()
  + ### has

    public boolean has([IsoFlagType](../../iso/SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") flag)
  + ### has

    public boolean has([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") flag)
  + ### set

    public void set([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilePropertyKey)
  + ### set

    public void set([IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") propValue)
  + ### set

    public void set([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") propName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") propValue)
  + ### set

    public void set([IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") propValue,
    boolean checkIsoFlagType)
  + ### set

    public void set([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") propName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") propValue,
    boolean checkIsoFlagType)
  + ### set

    public void set([IsoFlagType](../../iso/SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") flag)
  + ### set

    public void set([IsoFlagType](../../iso/SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") flag,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ignored)
  + ### unset

    public void unset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") propName)
  + ### unset

    public void unset([IsoFlagType](../../iso/SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails") flag)
  + ### get

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") get([IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") type)
  + ### get

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") get([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### propertyEquals

    public boolean propertyEquals([IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### propertyEquals

    public boolean propertyEquals([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### has

    public boolean has([IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") isoPropertyType)
  + ### has

    public boolean has([IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties")... isoPropertyType)
  + ### has

    public boolean has([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") isoPropertyType)
  + ### getFlagsList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFlagType](../../iso/SpriteDetails/IsoFlagType.html "enum class in zombie.iso.SpriteDetails")> getFlagsList()
  + ### getPropertyNames

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getPropertyNames()
  + ### initSurface

    private void initSurface()
  + ### getSurface

    public int getSurface()
  + ### isSurfaceOffset

    public boolean isSurfaceOffset()
  + ### isTable

    public boolean isTable()
  + ### isTableTop

    public boolean isTableTop()
  + ### getStackReplaceTileOffset

    public int getStackReplaceTileOffset()
  + ### getItemHeight

    public int getItemHeight()
  + ### getSlopedSurfaceDirection

    public [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") getSlopedSurfaceDirection()
  + ### getSlopedSurfaceHeightMin

    public int getSlopedSurfaceHeightMin()
  + ### getSlopedSurfaceHeightMax

    public int getSlopedSurfaceHeightMax()