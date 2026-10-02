[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [AttributeUtil](AttributeUtil.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [enum\_prefix](#enum_prefix)
   2. [itemListPool](#itemListPool)
   3. [doubleListPool](#doubleListPool)
6. [Constructor Details](#constructor-detail)
   1. [AttributeUtil()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isEnumString(String)](#isEnumString(java.lang.String))
   2. [getSanitizedEnumString(String)](#getSanitizedEnumString(java.lang.String))
   3. [enumValueFromScriptString(Class, String)](#enumValueFromScriptString(java.lang.Class,java.lang.String))
   4. [tryEnumValueFromScriptString(Class, String)](#tryEnumValueFromScriptString(java.lang.Class,java.lang.String))
   5. [allocItemList()](#allocItemList())
   6. [releaseItemList(ArrayList)](#releaseItemList(java.util.ArrayList))
   7. [getItemsFromList(String, ArrayList, ArrayList)](#getItemsFromList(java.lang.String,java.util.ArrayList,java.util.ArrayList))
   8. [getAttributeAverage(ArrayList, AttributeType)](#getAttributeAverage(java.util.ArrayList,zombie.entity.components.attributes.AttributeType))
   9. [convertAttributeToUnit(InventoryItem, AttributeType)](#convertAttributeToUnit(zombie.inventory.InventoryItem,zombie.entity.components.attributes.AttributeType))
   10. [convertAttribute(InventoryItem, AttributeType, AttributeType)](#convertAttribute(zombie.inventory.InventoryItem,zombie.entity.components.attributes.AttributeType,zombie.entity.components.attributes.AttributeType))
   11. [convertAttributeToRange(InventoryItem, AttributeType, float, float)](#convertAttributeToRange(zombie.inventory.InventoryItem,zombie.entity.components.attributes.AttributeType,float,float))
   12. [allocDoubleList()](#allocDoubleList())
   13. [releaseDoubleList(ArrayList)](#releaseDoubleList(java.util.ArrayList))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeUtil
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.attributes.AttributeUtil

---

public class AttributeUtil
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayDeque<ArrayList<Double>>`

  `doubleListPool`

  `static final String`

  `enum_prefix`

  `private static final ArrayDeque<ArrayList<InventoryItem>>`

  `itemListPool`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AttributeUtil()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<Double>`

  `allocDoubleList()`

  `static ArrayList<InventoryItem>`

  `allocItemList()`

  `static float`

  `convertAttribute(InventoryItem item,
  AttributeType attribute,
  AttributeType target)`

  Converts the value of the attribute to fit the range of the target attribute.

  `static float`

  `convertAttributeToRange(InventoryItem item,
  AttributeType attribute,
  float rangeMin,
  float rangeMax)`

  Converts the value of the attribute to fit the defined range.

  `static float`

  `convertAttributeToUnit(InventoryItem item,
  AttributeType attribute)`

  Converts the value of the attribute to a unit (0.0-1.0) based on the attribute Min and Max value.

  `static <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  E`

  `enumValueFromScriptString(Class<E> enumClass,
  String s)`

  Tries to convert string to enum, verbose errors

  `static float`

  `getAttributeAverage(ArrayList<InventoryItem> items,
  AttributeType attribute)`

  Gets the average value of a numeric attribute on a set of items.

  `static ArrayList<InventoryItem>`

  `getItemsFromList(String itemString,
  ArrayList<InventoryItem> sources,
  ArrayList<InventoryItem> outputlist)`

  `private static String`

  `getSanitizedEnumString(String s)`

  `static boolean`

  `isEnumString(String s)`

  `static void`

  `releaseDoubleList(ArrayList<Double> list)`

  `static void`

  `releaseItemList(ArrayList<InventoryItem> list)`

  `static <E extends Enum<E> & zombie.entity.util.enums.IOEnum>  
  E`

  `tryEnumValueFromScriptString(Class<E> enumClass,
  String s)`

  Tries to convert string to enum, silent errors

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### enum\_prefix

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") enum\_prefix

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.attributes.AttributeUtil.enum_prefix)
  + ### itemListPool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")>> itemListPool
  + ### doubleListPool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> doubleListPool
* Constructor Details
  -------------------

  + ### AttributeUtil

    public AttributeUtil()
* Method Details
  --------------

  + ### isEnumString

    public static boolean isEnumString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getSanitizedEnumString

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSanitizedEnumString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### enumValueFromScriptString

    public static <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    E enumValueFromScriptString([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<E> enumClass,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)

    Tries to convert string to enum, verbose errors
  + ### tryEnumValueFromScriptString

    public static <E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
    E tryEnumValueFromScriptString([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<E> enumClass,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)

    Tries to convert string to enum, silent errors
  + ### allocItemList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> allocItemList()
  + ### releaseItemList

    public static void releaseItemList([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> list)
  + ### getItemsFromList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> getItemsFromList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemString,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> sources,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> outputlist)
  + ### getAttributeAverage

    public static float getAttributeAverage([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory")> items,
    [AttributeType](AttributeType.html "class in zombie.entity.components.attributes") attribute)

    Gets the average value of a numeric attribute on a set of items.
  + ### convertAttributeToUnit

    public static float convertAttributeToUnit([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [AttributeType](AttributeType.html "class in zombie.entity.components.attributes") attribute)

    Converts the value of the attribute to a unit (0.0-1.0) based on the attribute Min and Max value.
    Requires the attribute to be numeric and have bounds defined.
  + ### convertAttribute

    public static float convertAttribute([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [AttributeType](AttributeType.html "class in zombie.entity.components.attributes") attribute,
    [AttributeType](AttributeType.html "class in zombie.entity.components.attributes") target)

    Converts the value of the attribute to fit the range of the target attribute.
    Requires both the attribute and target attribute to be numeric and have bounds defined.
  + ### convertAttributeToRange

    public static float convertAttributeToRange([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [AttributeType](AttributeType.html "class in zombie.entity.components.attributes") attribute,
    float rangeMin,
    float rangeMax)

    Converts the value of the attribute to fit the defined range.
    Requires both the attribute and target attribute to be numeric and have bounds defined.
  + ### allocDoubleList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")> allocDoubleList()
  + ### releaseDoubleList

    public static void releaseDoubleList([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")> list)