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
3. [String](AttributeType.String.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [initialValue](#initialValue)
7. [Constructor Details](#constructor-detail)
   1. [String(short, String, String)](#%3Cinit%3E(short,java.lang.String,java.lang.String))
   2. [String(short, String, String, boolean, Attribute.UI.Display, String)](#%3Cinit%3E(short,java.lang.String,java.lang.String,boolean,zombie.entity.components.attributes.Attribute.UI.Display,java.lang.String))
8. [Method Details](#method-detail)
   1. [getValueType()](#getValueType())
   2. [getInitialValue()](#getInitialValue())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeType.String
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeType](AttributeType.html "class in zombie.entity.components.attributes")

zombie.entity.components.attributes.AttributeType.String

Enclosing class:
:   `AttributeType`

---

public static class AttributeType.String
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

  `private final String`

  `initialValue`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `String(short id,
  String name,
  String initialValue)`

  `protected`

  `String(short id,
  String name,
  String initialValue,
  boolean readOnly,
  Attribute.UI.Display display,
  String tooltipOverride)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getInitialValue()`

  `AttributeValueType`

  `getValueType()`

  ### Methods inherited from class [AttributeType](AttributeType.html#method-summary "class in zombie.entity.components.attributes")

  `getDisplayAsBar, getName, getNameUI, getTranslateKey, id, isDecimal, isHiddenUI, isNumeric, isReadOnly, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### initialValue

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") initialValue
* Constructor Details
  -------------------

  + ### String

    protected String(short id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") initialValue)
  + ### String

    protected String(short id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") initialValue,
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

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInitialValue()