[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [AttributeType](AttributeType.html)
3. [Enum](AttributeType.Enum.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [enumClass](#enumClass)
   2. [initialValue](#initialValue)
7. [Constructor Details](#constructor-detail)
   1. [Enum(short, String, E)](#%3Cinit%3E(short,java.lang.String,E))
   2. [Enum(short, String, E, boolean, Attribute.UI.Display, String)](#%3Cinit%3E(short,java.lang.String,E,boolean,zombie.entity.components.attributes.Attribute.UI.Display,java.lang.String))
8. [Method Details](#method-detail)
   1. [getValueType()](#getValueType())
   2. [getInitialValue()](#getInitialValue())
   3. [enumValueFromString(String)](#enumValueFromString(java.lang.String))
   4. [enumValueFromByteID(byte)](#enumValueFromByteID(byte))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeType.Enum<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
===================================================================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeType](AttributeType.html "class in zombie.entity.components.attributes")

zombie.entity.components.attributes.AttributeType.Enum<E>

Enclosing class:
:   `AttributeType`

---

public static class AttributeType.Enum<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
extends [AttributeType](AttributeType.html "class in zombie.entity.components.attributes")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [AttributeType](AttributeType.html#nested-class-summary "class in zombie.entity.components.attributes")

  `AttributeType.Bool, AttributeType.Byte, AttributeType.Double, AttributeType.Enum<E>, AttributeType.EnumSet<E>, AttributeType.EnumStringSet<E>, AttributeType.Float, AttributeType.Int, AttributeType.Long, AttributeType.Numeric<C,T>, AttributeType.Short, AttributeType.String`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Class<E>`

  `enumClass`

  `private final E`

  `initialValue`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `Enum(short id,
  String name,
  E initialValue)`

  `protected`

  `Enum(short id,
  String name,
  E initialValue,
  boolean readOnly,
  Attribute.UI.Display display,
  String tooltipOverride)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `E`

  `enumValueFromByteID(byte id)`

  `E`

  `enumValueFromString(String s)`

  `E`

  `getInitialValue()`

  `AttributeValueType`

  `getValueType()`

  ### Methods inherited from class [AttributeType](AttributeType.html#method-summary "class in zombie.entity.components.attributes")

  `getDisplayAsBar, getName, getNameUI, getTranslateKey, id, isDecimal, isHiddenUI, isNumeric, isReadOnly, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### enumClass

    private final [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<[E](#type-param-E "type parameter in AttributeType.Enum") extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[E](#type-param-E "type parameter in AttributeType.Enum")> & zombie.entity.util.enums.IOEnum> enumClass
  + ### initialValue

    private final [E](#type-param-E "type parameter in AttributeType.Enum") extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[E](#type-param-E "type parameter in AttributeType.Enum")> & zombie.entity.util.enums.IOEnum initialValue
* Constructor Details
  -------------------

  + ### Enum

    protected Enum(short id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [E](#type-param-E "type parameter in AttributeType.Enum") initialValue)
  + ### Enum

    protected Enum(short id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [E](#type-param-E "type parameter in AttributeType.Enum") initialValue,
    boolean readOnly,
    [Attribute.UI.Display](Attribute.UI.Display.html "enum class in zombie.entity.components.attributes") display,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltipOverride)
* Method Details
  --------------

  + ### getValueType

    public [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") getValueType()

    Specified by:
    :   `getValueType` in class `AttributeType`
  + ### getInitialValue

    public [E](#type-param-E "type parameter in AttributeType.Enum") getInitialValue()
  + ### enumValueFromString

    public [E](#type-param-E "type parameter in AttributeType.Enum") enumValueFromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### enumValueFromByteID

    public [E](#type-param-E "type parameter in AttributeType.Enum") enumValueFromByteID(byte id)