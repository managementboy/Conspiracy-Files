[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [AttributeInstance](AttributeInstance.html)
3. [Short](AttributeInstance.Short.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
7. [Constructor Details](#constructor-detail)
   1. [Short()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setType(AttributeType.Short)](#setType(zombie.entity.components.attributes.AttributeType.Short))
   2. [getValue()](#getValue())
   3. [setValue(short)](#setValue(short))
   4. [floatValue()](#floatValue())
   5. [fromFloat(float)](#fromFloat(float))
   6. [stringValue()](#stringValue())
   7. [setValueFromScriptString(String)](#setValueFromScriptString(java.lang.String))
   8. [equalTo(AttributeInstance.Short)](#equalTo(zombie.entity.components.attributes.AttributeInstance.Short))
   9. [copy()](#copy())
   10. [release()](#release())
   11. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   12. [load(ByteBuffer)](#load(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeInstance.Short
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.Short](AttributeInstance.Short.html "class in zombie.entity.components.attributes"), [AttributeType.Short](AttributeType.Short.html "class in zombie.entity.components.attributes")>

[zombie.entity.components.attributes.AttributeInstance.Numeric](AttributeInstance.Numeric.html "class in zombie.entity.components.attributes")<[AttributeInstance.Short](AttributeInstance.Short.html "class in zombie.entity.components.attributes"), [AttributeType.Short](AttributeType.Short.html "class in zombie.entity.components.attributes")>

zombie.entity.components.attributes.AttributeInstance.Short

Enclosing class:
:   `AttributeInstance<C extends AttributeInstance<C,T>, T extends AttributeType>`

---

public static class AttributeInstance.Short
extends [AttributeInstance.Numeric](AttributeInstance.Numeric.html "class in zombie.entity.components.attributes")<[AttributeInstance.Short](AttributeInstance.Short.html "class in zombie.entity.components.attributes"), [AttributeType.Short](AttributeType.Short.html "class in zombie.entity.components.attributes")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [AttributeInstance](AttributeInstance.html#nested-class-summary "class in zombie.entity.components.attributes")

  `AttributeInstance.Bool, AttributeInstance.Byte, AttributeInstance.Double, AttributeInstance.Enum<E>, AttributeInstance.EnumSet<E>, AttributeInstance.EnumStringSet<E>, AttributeInstance.Float, AttributeInstance.Int, AttributeInstance.Long, AttributeInstance.Numeric<C,T>, AttributeInstance.Short, AttributeInstance.String`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private short`

  `value`

  ### Fields inherited from class [AttributeInstance](AttributeInstance.html#field-summary "class in zombie.entity.components.attributes")

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Short()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `AttributeInstance.Short`

  `copy()`

  `boolean`

  `equalTo(AttributeInstance.Short other)`

  `float`

  `floatValue()`

  `void`

  `fromFloat(float f)`

  `short`

  `getValue()`

  `void`

  `load(ByteBuffer input)`

  `protected void`

  `release()`

  `void`

  `save(ByteBuffer output)`

  `protected void`

  `setType(AttributeType.Short type)`

  `void`

  `setValue(short value)`

  `boolean`

  `setValueFromScriptString(String val)`

  `String`

  `stringValue()`

  ### Methods inherited from class [AttributeInstance.Numeric](AttributeInstance.Numeric.html#method-summary "class in zombie.entity.components.attributes")

  `getDisplayAsBarUnit, getFloatValue, getIntValue, isDisplayAsBar, isRequiresValidation`

  ### Methods inherited from class [AttributeInstance](AttributeInstance.html#method-summary "class in zombie.entity.components.attributes")

  `canSetValue, getNameUI, getType, getValueType, isHiddenUI, isReadOnly, reset, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### value

    private short value
* Constructor Details
  -------------------

  + ### Short

    public Short()
* Method Details
  --------------

  + ### setType

    protected void setType([AttributeType.Short](AttributeType.Short.html "class in zombie.entity.components.attributes") type)

    Specified by:
    :   `setType` in class `AttributeInstance<AttributeInstance.Short, AttributeType.Short>`
  + ### getValue

    public short getValue()
  + ### setValue

    public void setValue(short value)
  + ### floatValue

    public float floatValue()

    Specified by:
    :   `floatValue` in class `AttributeInstance.Numeric<AttributeInstance.Short, AttributeType.Short>`
  + ### fromFloat

    public void fromFloat(float f)

    Specified by:
    :   `fromFloat` in class `AttributeInstance.Numeric<AttributeInstance.Short, AttributeType.Short>`
  + ### stringValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stringValue()

    Specified by:
    :   `stringValue` in class `AttributeInstance<AttributeInstance.Short, AttributeType.Short>`
  + ### setValueFromScriptString

    public boolean setValueFromScriptString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `setValueFromScriptString` in class `AttributeInstance<AttributeInstance.Short, AttributeType.Short>`
  + ### equalTo

    public boolean equalTo([AttributeInstance.Short](AttributeInstance.Short.html "class in zombie.entity.components.attributes") other)

    Specified by:
    :   `equalTo` in class `AttributeInstance<AttributeInstance.Short, AttributeType.Short>`
  + ### copy

    public [AttributeInstance.Short](AttributeInstance.Short.html "class in zombie.entity.components.attributes") copy()

    Specified by:
    :   `copy` in class `AttributeInstance<AttributeInstance.Short, AttributeType.Short>`
  + ### release

    protected void release()

    Specified by:
    :   `release` in class `AttributeInstance<AttributeInstance.Short, AttributeType.Short>`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    Specified by:
    :   `save` in class `AttributeInstance<AttributeInstance.Short, AttributeType.Short>`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)

    Specified by:
    :   `load` in class `AttributeInstance<AttributeInstance.Short, AttributeType.Short>`