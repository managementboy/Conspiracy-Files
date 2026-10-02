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
3. [EnumStringSet](AttributeInstance.EnumStringSet.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
7. [Constructor Details](#constructor-detail)
   1. [EnumStringSet()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setType(AttributeType.EnumStringSet)](#setType(zombie.entity.components.attributes.AttributeType.EnumStringSet))
   2. [getValue()](#getValue())
   3. [setValue(EnumStringObj)](#setValue(zombie.entity.components.attributes.EnumStringObj))
   4. [stringValue()](#stringValue())
   5. [setValueFromScriptString(String)](#setValueFromScriptString(java.lang.String))
   6. [addEnumValueFromString(String)](#addEnumValueFromString(java.lang.String))
   7. [removeEnumValueFromString(String)](#removeEnumValueFromString(java.lang.String))
   8. [addStringValue(String)](#addStringValue(java.lang.String))
   9. [removeStringValue(String)](#removeStringValue(java.lang.String))
   10. [clear()](#clear())
   11. [equalTo(AttributeInstance.EnumStringSet)](#equalTo(zombie.entity.components.attributes.AttributeInstance.EnumStringSet))
   12. [copy()](#copy())
   13. [release()](#release())
   14. [reset()](#reset())
   15. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   16. [load(ByteBuffer)](#load(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeInstance.EnumStringSet<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
================================================================================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.EnumStringSet](AttributeInstance.EnumStringSet.html "class in zombie.entity.components.attributes")<E>, [AttributeType.EnumStringSet](AttributeType.EnumStringSet.html "class in zombie.entity.components.attributes")<E>>

zombie.entity.components.attributes.AttributeInstance.EnumStringSet<E>

Enclosing class:
:   `AttributeInstance<C extends AttributeInstance<C,T>, T extends AttributeType>`

---

public static class AttributeInstance.EnumStringSet<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
extends [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.EnumStringSet](AttributeInstance.EnumStringSet.html "class in zombie.entity.components.attributes")<E>, [AttributeType.EnumStringSet](AttributeType.EnumStringSet.html "class in zombie.entity.components.attributes")<E>>

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

  `private final EnumStringObj<E>`

  `value`

  ### Fields inherited from class [AttributeInstance](AttributeInstance.html#field-summary "class in zombie.entity.components.attributes")

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `EnumStringSet()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addEnumValueFromString(String val)`

  `void`

  `addStringValue(String val)`

  `void`

  `clear()`

  `AttributeInstance.EnumStringSet<E>`

  `copy()`

  `boolean`

  `equalTo(AttributeInstance.EnumStringSet<E> other)`

  `EnumStringObj<E>`

  `getValue()`

  `void`

  `load(ByteBuffer input)`

  `protected void`

  `release()`

  `boolean`

  `removeEnumValueFromString(String val)`

  `boolean`

  `removeStringValue(String val)`

  `protected void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  `protected void`

  `setType(AttributeType.EnumStringSet<E> type)`

  `void`

  `setValue(EnumStringObj<E> value)`

  `boolean`

  `setValueFromScriptString(String val)`

  Enum values in script strings need to be prefixed by 'Enum.' indicating they are an enum.

  `String`

  `stringValue()`

  ### Methods inherited from class [AttributeInstance](AttributeInstance.html#method-summary "class in zombie.entity.components.attributes")

  `canSetValue, getDisplayAsBarUnit, getFloatValue, getIntValue, getNameUI, getType, getValueType, isDisplayAsBar, isHiddenUI, isReadOnly, isRequiresValidation, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### value

    private final [EnumStringObj](EnumStringObj.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.EnumStringSet") extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[E](#type-param-E "type parameter in AttributeInstance.EnumStringSet")> & zombie.entity.util.enums.IOEnum> value
* Constructor Details
  -------------------

  + ### EnumStringSet

    public EnumStringSet()
* Method Details
  --------------

  + ### setType

    protected void setType([AttributeType.EnumStringSet](AttributeType.EnumStringSet.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.EnumStringSet")> type)

    Specified by:
    :   `setType` in class `AttributeInstance<AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### getValue

    public [EnumStringObj](EnumStringObj.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.EnumStringSet")> getValue()
  + ### setValue

    public void setValue([EnumStringObj](EnumStringObj.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.EnumStringSet")> value)
  + ### stringValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stringValue()

    Specified by:
    :   `stringValue` in class `AttributeInstance<AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### setValueFromScriptString

    public boolean setValueFromScriptString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Enum values in script strings need to be prefixed by 'Enum.' indicating they are an enum.

    Specified by:
    :   `setValueFromScriptString` in class `AttributeInstance<AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### addEnumValueFromString

    public void addEnumValueFromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### removeEnumValueFromString

    public boolean removeEnumValueFromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### addStringValue

    public void addStringValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### removeStringValue

    public boolean removeStringValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### clear

    public void clear()
  + ### equalTo

    public boolean equalTo([AttributeInstance.EnumStringSet](AttributeInstance.EnumStringSet.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.EnumStringSet")> other)

    Specified by:
    :   `equalTo` in class `AttributeInstance<AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### copy

    public [AttributeInstance.EnumStringSet](AttributeInstance.EnumStringSet.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.EnumStringSet")> copy()

    Specified by:
    :   `copy` in class `AttributeInstance<AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### release

    protected void release()

    Specified by:
    :   `release` in class `AttributeInstance<AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `AttributeInstance<AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    Specified by:
    :   `save` in class `AttributeInstance<AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)

    Specified by:
    :   `load` in class `AttributeInstance<AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`