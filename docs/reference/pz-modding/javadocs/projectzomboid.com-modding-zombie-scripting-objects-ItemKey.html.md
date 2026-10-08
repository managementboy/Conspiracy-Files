[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [ItemKey](ItemKey.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [id](#id)
   2. [itemType](#itemType)
   3. [BY\_NAME](#BY_NAME)
7. [Constructor Details](#constructor-detail)
   1. [ItemKey(String, ItemType)](#%3Cinit%3E(java.lang.String,zombie.scripting.objects.ItemType))
8. [Method Details](#method-detail)
   1. [getByName(String)](#getByName(java.lang.String))
   2. [getByItemKeyValue(String)](#getByItemKeyValue(java.lang.String))
   3. [toString()](#toString())
   4. [hashCode()](#hashCode())
   5. [equals(Object)](#equals(java.lang.Object))
   6. [id()](#id())
   7. [itemType()](#itemType())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Record Class ItemKey
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

zombie.scripting.objects.ItemKey

---

public record ItemKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id, [ItemType](ItemType.html "class in zombie.scripting.objects") itemType)
extends [Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `ItemKey.AlarmClock`

  `static class`

  `ItemKey.AlarmClockClothing`

  `static class`

  `ItemKey.Animal`

  `static class`

  `ItemKey.Clothing`

  `static class`

  `ItemKey.Container`

  `static class`

  `ItemKey.Drainable`

  `static class`

  `ItemKey.Food`

  `static class`

  `ItemKey.Key`

  `static class`

  `ItemKey.Literature`

  `static class`

  `ItemKey.Map`

  `static class`

  `ItemKey.Moveable`

  `static class`

  `ItemKey.Normal`

  `static class`

  `ItemKey.Radio`

  `static class`

  `ItemKey.Weapon`

  `static class`

  `ItemKey.WeaponPart`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Map<String,ItemKey>`

  `BY_NAME`

  `private final String`

  `id`

  The field for the `id` record component.

  `private final ItemType`

  `itemType`

  The field for the `itemType` record component.
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemKey(String id,
  ItemType itemType)`

  Creates an instance of a `ItemKey` record class.
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `final boolean`

  `equals(Object o)`

  Indicates whether some other object is "equal to" this one.

  `static ItemKey`

  `getByItemKeyValue(String name)`

  `static Optional<ItemKey>`

  `getByName(String name)`

  `final int`

  `hashCode()`

  Returns a hash code value for this object.

  `String`

  `id()`

  Returns the value of the `id` record component.

  `ItemType`

  `itemType()`

  Returns the value of the `itemType` record component.

  `String`

  `toString()`

  Returns a string representation of this record class.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id

    The field for the `id` record component.
  + ### itemType

    private final [ItemType](ItemType.html "class in zombie.scripting.objects") itemType

    The field for the `itemType` record component.
  + ### BY\_NAME

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[ItemKey](ItemKey.html "class in zombie.scripting.objects")> BY\_NAME
* Constructor Details
  -------------------

  + ### ItemKey

    public ItemKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [ItemType](ItemType.html "class in zombie.scripting.objects") itemType)

    Creates an instance of a `ItemKey` record class.

    Parameters:
    :   `id` - the value for the `id` record component
    :   `itemType` - the value for the `itemType` record component
* Method Details
  --------------

  + ### getByName

    public static [Optional](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Optional.html "class or interface in java.util")<[ItemKey](ItemKey.html "class in zombie.scripting.objects")> getByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getByItemKeyValue

    public static [ItemKey](ItemKey.html "class in zombie.scripting.objects") getByItemKeyValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Returns a string representation of this record class. The representation contains the name of the class, followed by the name and value of each of the record components.

    Specified by:
    :   `toString` in class `Record`

    Returns:
    :   a string representation of this object
  + ### hashCode

    public final int hashCode()

    Returns a hash code value for this object. The value is derived from the hash code of each of the record components.

    Specified by:
    :   `hashCode` in class `Record`

    Returns:
    :   a hash code value for this object
  + ### equals

    public final boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Indicates whether some other object is "equal to" this one. The objects are equal if the other object is of the same class and if all the record components are equal. All components in this record class are compared with [`Objects::equals(Object,Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Objects.html#equals(java.lang.Object,java.lang.Object) "class or interface in java.util").

    Specified by:
    :   `equals` in class `Record`

    Parameters:
    :   `o` - the object with which to compare

    Returns:
    :   `true` if this object is the same as the `o` argument; `false` otherwise.
  + ### id

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id()

    Returns the value of the `id` record component.

    Returns:
    :   the value of the `id` record component
  + ### itemType

    public [ItemType](ItemType.html "class in zombie.scripting.objects") itemType()

    Returns the value of the `itemType` record component.

    Returns:
    :   the value of the `itemType` record component