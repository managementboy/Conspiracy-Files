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
3. [Bool](AttributeInstance.Bool.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
7. [Constructor Details](#constructor-detail)
   1. [Bool()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setType(AttributeType.Bool)](#setType(zombie.entity.components.attributes.AttributeType.Bool))
   2. [getValue()](#getValue())
   3. [setValue(boolean)](#setValue(boolean))
   4. [stringValue()](#stringValue())
   5. [setValueFromScriptString(String)](#setValueFromScriptString(java.lang.String))
   6. [equalTo(AttributeInstance.Bool)](#equalTo(zombie.entity.components.attributes.AttributeInstance.Bool))
   7. [copy()](#copy())
   8. [release()](#release())
   9. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   10. [load(ByteBuffer)](#load(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeInstance.Bool
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.Bool](AttributeInstance.Bool.html "class in zombie.entity.components.attributes"), [AttributeType.Bool](AttributeType.Bool.html "class in zombie.entity.components.attributes")>

zombie.entity.components.attributes.AttributeInstance.Bool

Enclosing class:
:   `AttributeInstance<C extends AttributeInstance<C,T>, T extends AttributeType>`

---

public static class AttributeInstance.Bool
extends [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.Bool](AttributeInstance.Bool.html "class in zombie.entity.components.attributes"), [AttributeType.Bool](AttributeType.Bool.html "class in zombie.entity.components.attributes")>

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

  `private boolean`

  `value`

  ### Fields inherited from class [AttributeInstance](AttributeInstance.html#field-summary "class in zombie.entity.components.attributes")

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Bool()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `AttributeInstance.Bool`

  `copy()`

  `boolean`

  `equalTo(AttributeInstance.Bool other)`

  `boolean`

  `getValue()`

  `void`

  `load(ByteBuffer input)`

  `protected void`

  `release()`

  `void`

  `save(ByteBuffer output)`

  `protected void`

  `setType(AttributeType.Bool type)`

  `void`

  `setValue(boolean value)`

  `boolean`

  `setValueFromScriptString(String val)`

  `String`

  `stringValue()`

  ### Methods inherited from class [AttributeInstance](AttributeInstance.html#method-summary "class in zombie.entity.components.attributes")

  `canSetValue, getDisplayAsBarUnit, getFloatValue, getIntValue, getNameUI, getType, getValueType, isDisplayAsBar, isHiddenUI, isReadOnly, isRequiresValidation, reset, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### value

    private boolean value
* Constructor Details
  -------------------

  + ### Bool

    public Bool()
* Method Details
  --------------

  + ### setType

    protected void setType([AttributeType.Bool](AttributeType.Bool.html "class in zombie.entity.components.attributes") type)

    Specified by:
    :   `setType` in class `AttributeInstance<AttributeInstance.Bool, AttributeType.Bool>`
  + ### getValue

    public boolean getValue()
  + ### setValue

    public void setValue(boolean value)
  + ### stringValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stringValue()

    Specified by:
    :   `stringValue` in class `AttributeInstance<AttributeInstance.Bool, AttributeType.Bool>`
  + ### setValueFromScriptString

    public boolean setValueFromScriptString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Specified by:
    :   `setValueFromScriptString` in class `AttributeInstance<AttributeInstance.Bool, AttributeType.Bool>`
  + ### equalTo

    public boolean equalTo([AttributeInstance.Bool](AttributeInstance.Bool.html "class in zombie.entity.components.attributes") other)

    Specified by:
    :   `equalTo` in class `AttributeInstance<AttributeInstance.Bool, AttributeType.Bool>`
  + ### copy

    public [AttributeInstance.Bool](AttributeInstance.Bool.html "class in zombie.entity.components.attributes") copy()

    Specified by:
    :   `copy` in class `AttributeInstance<AttributeInstance.Bool, AttributeType.Bool>`
  + ### release

    protected void release()

    Specified by:
    :   `release` in class `AttributeInstance<AttributeInstance.Bool, AttributeType.Bool>`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    Specified by:
    :   `save` in class `AttributeInstance<AttributeInstance.Bool, AttributeType.Bool>`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)

    Specified by:
    :   `load` in class `AttributeInstance<AttributeInstance.Bool, AttributeType.Bool>`