[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [Attribute](Attribute.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [attributeTypeNameMap](#attributeTypeNameMap)
   2. [attributeTypeIdMap](#attributeTypeIdMap)
   3. [attributeTypes](#attributeTypes)
   4. [TestQuality](#TestQuality)
   5. [TestUses](#TestUses)
   6. [TestCondition](#TestCondition)
   7. [TestBool](#TestBool)
   8. [TestString](#TestString)
   9. [TestString2](#TestString2)
   10. [TestItemType](#TestItemType)
   11. [TestCategories](#TestCategories)
   12. [TestTags](#TestTags)
   13. [Sharpness](#Sharpness)
   14. [HeadCondition](#HeadCondition)
   15. [HeadConditionMax](#HeadConditionMax)
   16. [TimesHeadRepaired](#TimesHeadRepaired)
   17. [Quality](#Quality)
   18. [OriginX](#OriginX)
   19. [OriginY](#OriginY)
   20. [OriginZ](#OriginZ)
7. [Constructor Details](#constructor-detail)
   1. [Attribute()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [registerType(E)](#registerType(E))
   2. [TypeFromName(String)](#TypeFromName(java.lang.String))
   3. [TypeFromId(short)](#TypeFromId(short))
   4. [GetAllTypes()](#GetAllTypes())
   5. [init()](#init())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class Attribute
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.attributes.Attribute

---

public abstract class Attribute
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `Attribute.UI`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final HashMap<Short, AttributeType>`

  `attributeTypeIdMap`

  `private static final HashMap<String, AttributeType>`

  `attributeTypeNameMap`

  `private static final ArrayList<AttributeType>`

  `attributeTypes`

  `static final AttributeType.Int`

  `HeadCondition`

  `static final AttributeType.Int`

  `HeadConditionMax`

  `static final AttributeType.Int`

  `OriginX`

  `static final AttributeType.Int`

  `OriginY`

  `static final AttributeType.Int`

  `OriginZ`

  `static final AttributeType.Int`

  `Quality`

  `static final AttributeType.Float`

  `Sharpness`

  `static final AttributeType.Bool`

  `TestBool`

  `static final AttributeType.EnumSet<zombie.entity.components.attributes.TestEnum>`

  `TestCategories`

  `static final AttributeType.Float`

  `TestCondition`

  `static final AttributeType.Enum<zombie.entity.components.attributes.TestEnum>`

  `TestItemType`

  `static final AttributeType.Float`

  `TestQuality`

  AttributeType Definitions

  `static final AttributeType.String`

  `TestString`

  `static final AttributeType.String`

  `TestString2`

  `static final AttributeType.EnumStringSet<zombie.entity.components.attributes.TestEnum>`

  `TestTags`

  `static final AttributeType.Int`

  `TestUses`

  `static final AttributeType.Int`

  `TimesHeadRepaired`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Attribute()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<AttributeType>`

  `GetAllTypes()`

  `static void`

  `init()`

  `private static <E extends AttributeType>  
  E`

  `registerType(E type)`

  `static AttributeType`

  `TypeFromId(short value)`

  `static AttributeType`

  `TypeFromName(String name)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### attributeTypeNameMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AttributeType](AttributeType.html "class in zombie.entity.components.attributes")> attributeTypeNameMap
  + ### attributeTypeIdMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang"), [AttributeType](AttributeType.html "class in zombie.entity.components.attributes")> attributeTypeIdMap
  + ### attributeTypes

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AttributeType](AttributeType.html "class in zombie.entity.components.attributes")> attributeTypes
  + ### TestQuality

    public static final [AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes") TestQuality

    AttributeType Definitions
  + ### TestUses

    public static final [AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") TestUses
  + ### TestCondition

    public static final [AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes") TestCondition
  + ### TestBool

    public static final [AttributeType.Bool](AttributeType.Bool.html "class in zombie.entity.components.attributes") TestBool
  + ### TestString

    public static final [AttributeType.String](AttributeType.String.html "class in zombie.entity.components.attributes") TestString
  + ### TestString2

    public static final [AttributeType.String](AttributeType.String.html "class in zombie.entity.components.attributes") TestString2
  + ### TestItemType

    public static final [AttributeType.Enum](AttributeType.Enum.html "class in zombie.entity.components.attributes")<zombie.entity.components.attributes.TestEnum> TestItemType
  + ### TestCategories

    public static final [AttributeType.EnumSet](AttributeType.EnumSet.html "class in zombie.entity.components.attributes")<zombie.entity.components.attributes.TestEnum> TestCategories
  + ### TestTags

    public static final [AttributeType.EnumStringSet](AttributeType.EnumStringSet.html "class in zombie.entity.components.attributes")<zombie.entity.components.attributes.TestEnum> TestTags
  + ### Sharpness

    public static final [AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes") Sharpness
  + ### HeadCondition

    public static final [AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") HeadCondition
  + ### HeadConditionMax

    public static final [AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") HeadConditionMax
  + ### TimesHeadRepaired

    public static final [AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") TimesHeadRepaired
  + ### Quality

    public static final [AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") Quality
  + ### OriginX

    public static final [AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") OriginX
  + ### OriginY

    public static final [AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") OriginY
  + ### OriginZ

    public static final [AttributeType.Int](AttributeType.Int.html "class in zombie.entity.components.attributes") OriginZ
* Constructor Details
  -------------------

  + ### Attribute

    public Attribute()
* Method Details
  --------------

  + ### registerType

    private static <E extends [AttributeType](AttributeType.html "class in zombie.entity.components.attributes")> E registerType(E type)
  + ### TypeFromName

    public static [AttributeType](AttributeType.html "class in zombie.entity.components.attributes") TypeFromName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### TypeFromId

    public static [AttributeType](AttributeType.html "class in zombie.entity.components.attributes") TypeFromId(short value)
  + ### GetAllTypes

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[AttributeType](AttributeType.html "class in zombie.entity.components.attributes")> GetAllTypes()
  + ### init

    public static void init()