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
3. [Float](AttributeInstance.Float.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
7. [Constructor Details](#constructor-detail)
   1. [Float()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setType(AttributeType.Float)](#setType(zombie.entity.components.attributes.AttributeType.Float))
   2. [getValue()](#getValue())
   3. [setValue(float)](#setValue(float))
   4. [floatValue()](#floatValue())
   5. [fromFloat(float)](#fromFloat(float))
   6. [stringValue()](#stringValue())
   7. [setValueFromScriptString(String)](#setValueFromScriptString(java.lang.String))
   8. [equalTo(AttributeInstance.Float)](#equalTo(zombie.entity.components.attributes.AttributeInstance.Float))
   9. [copy()](#copy())
   10. [release()](#release())
   11. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   12. [load(ByteBuffer)](#load(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeInstance.Float
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.Float](AttributeInstance.Float.html "class in zombie.entity.components.attributes"), [AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes")>

[zombie.entity.components.attributes.AttributeInstance.Numeric](AttributeInstance.Numeric.html "class in zombie.entity.components.attributes")<[AttributeInstance.Float](AttributeInstance.Float.html "class in zombie.entity.components.attributes"), [AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes")>

zombie.entity.components.attributes.AttributeInstance.Float

Enclosing class:
:   `AttributeInstance<C extends AttributeInstance<C,T>, T extends AttributeType>`

---

public static class AttributeInstance.Float
extends [AttributeInstance.Numeric](AttributeInstance.Numeric.html "class in zombie.entity.components.attributes")<[AttributeInstance.Float](AttributeInstance.Float.html "class in zombie.entity.components.attributes"), [AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes")>

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

  `private float`

  `value`

  ### Fields inherited from class [AttributeInstance](AttributeInstance.html#field-summary "class in zombie.entity.components.attributes")

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Float()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `AttributeInstance.Float`

  `copy()`

  `boolean`

  `equalTo(AttributeInstance.Float other)`

  `float`

  `floatValue()`

  `void`

  `fromFloat(float f)`

  `float`

  `getValue()`

  `void`

  `load(ByteBuffer input)`

  `protected void`

  `release()`

  `void`

  `save(ByteBuffer output)`

  `protected void`

  `setType(AttributeType.Float type)`

  `void`

  `setValue(float value)`

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

    private float value
* Constructor Details
  -------------------

  + ### Float

    public Float()
* Method Details
  --------------

  + ### setType

    protected void setType([AttributeType.Float](AttributeType.Float.html "class in zombie.entity.components.attributes") type)

    Specified by:
    :   `setType` in class `AttributeInstance<AttributeInstance.Float, AttributeType.Float>`
  + ### getValue

    public float getValue()
  + ### setValue

    public void setValue(float value)
  + ### floatValue

    public float floatValue()

    Specified by:
    :   `floatValue` in class `AttributeInstance.Numeric<AttributeInstance.Float, AttributeType.Float>`
  + ### fromFloat

    public void fromFloat(float f)

    Specified by:
    :   `fromFloat` in class `AttributeInstance.Numeric<AttributeInstance.Float, AttributeType.Float>`
  + ### stringValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stringValue()

    Specified by:
    :   `stringValue` in class `AttributeInstance<AttributeInstance.Float, AttributeType.Float>`
  + ### setValueFromScriptString

    public boolean setValueFromScriptString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `setValueFromScriptString` in class `AttributeInstance<AttributeInstance.Float, AttributeType.Float>`
  + ### equalTo

    public boolean equalTo([AttributeInstance.Float](AttributeInstance.Float.html "class in zombie.entity.components.attributes") other)

    Specified by:
    :   `equalTo` in class `AttributeInstance<AttributeInstance.Float, AttributeType.Float>`
  + ### copy

    public [AttributeInstance.Float](AttributeInstance.Float.html "class in zombie.entity.components.attributes") copy()

    Specified by:
    :   `copy` in class `AttributeInstance<AttributeInstance.Float, AttributeType.Float>`
  + ### release

    protected void release()

    Specified by:
    :   `release` in class `AttributeInstance<AttributeInstance.Float, AttributeType.Float>`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    Specified by:
    :   `save` in class `AttributeInstance<AttributeInstance.Float, AttributeType.Float>`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)

    Specified by:
    :   `load` in class `AttributeInstance<AttributeInstance.Float, AttributeType.Float>`