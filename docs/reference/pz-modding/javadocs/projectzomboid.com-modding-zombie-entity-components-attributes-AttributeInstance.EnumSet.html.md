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
3. [EnumSet](AttributeInstance.EnumSet.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
7. [Constructor Details](#constructor-detail)
   1. [EnumSet()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setType(AttributeType.EnumSet)](#setType(zombie.entity.components.attributes.AttributeType.EnumSet))
   2. [getValue()](#getValue())
   3. [setValue(EnumSet)](#setValue(java.util.EnumSet))
   4. [stringValue()](#stringValue())
   5. [setValueFromScriptString(String)](#setValueFromScriptString(java.lang.String))
   6. [addValueFromString(String)](#addValueFromString(java.lang.String))
   7. [removeValueFromString(String)](#removeValueFromString(java.lang.String))
   8. [clear()](#clear())
   9. [equalTo(AttributeInstance.EnumSet)](#equalTo(zombie.entity.components.attributes.AttributeInstance.EnumSet))
   10. [copy()](#copy())
   11. [release()](#release())
   12. [reset()](#reset())
   13. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   14. [load(ByteBuffer)](#load(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeInstance.EnumSet<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
==========================================================================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.EnumSet](AttributeInstance.EnumSet.html "class in zombie.entity.components.attributes")<E>, [AttributeType.EnumSet](AttributeType.EnumSet.html "class in zombie.entity.components.attributes")<E>>

zombie.entity.components.attributes.AttributeInstance.EnumSet<E>

Enclosing class:
:   `AttributeInstance<C extends AttributeInstance<C,T>, T extends AttributeType>`

---

public static class AttributeInstance.EnumSet<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
extends [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.EnumSet](AttributeInstance.EnumSet.html "class in zombie.entity.components.attributes")<E>, [AttributeType.EnumSet](AttributeType.EnumSet.html "class in zombie.entity.components.attributes")<E>>

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

  `private EnumSet<E>`

  `value`

  ### Fields inherited from class [AttributeInstance](AttributeInstance.html#field-summary "class in zombie.entity.components.attributes")

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `EnumSet()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addValueFromString(String val)`

  `void`

  `clear()`

  `AttributeInstance.EnumSet<E>`

  `copy()`

  `boolean`

  `equalTo(AttributeInstance.EnumSet<E> other)`

  `EnumSet<E>`

  `getValue()`

  `void`

  `load(ByteBuffer input)`

  `protected void`

  `release()`

  `boolean`

  `removeValueFromString(String val)`

  `protected void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  `protected void`

  `setType(AttributeType.EnumSet<E> type)`

  `void`

  `setValue(EnumSet<E> value)`

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

    private [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[E](#type-param-E "type parameter in AttributeInstance.EnumSet") extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[E](#type-param-E "type parameter in AttributeInstance.EnumSet")> & zombie.entity.util.enums.IOEnum> value
* Constructor Details
  -------------------

  + ### EnumSet

    public EnumSet()
* Method Details
  --------------

  + ### setType

    protected void setType([AttributeType.EnumSet](AttributeType.EnumSet.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.EnumSet")> type)

    Specified by:
    :   `setType` in class `AttributeInstance<AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### getValue

    public [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[E](#type-param-E "type parameter in AttributeInstance.EnumSet")> getValue()
  + ### setValue

    public void setValue([EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[E](#type-param-E "type parameter in AttributeInstance.EnumSet")> value)
  + ### stringValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stringValue()

    Specified by:
    :   `stringValue` in class `AttributeInstance<AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### setValueFromScriptString

    public boolean setValueFromScriptString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Enum values in script strings need to be prefixed by 'Enum.' indicating they are an enum.

    Specified by:
    :   `setValueFromScriptString` in class `AttributeInstance<AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### addValueFromString

    public void addValueFromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### removeValueFromString

    public boolean removeValueFromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### clear

    public void clear()
  + ### equalTo

    public boolean equalTo([AttributeInstance.EnumSet](AttributeInstance.EnumSet.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.EnumSet")> other)

    Specified by:
    :   `equalTo` in class `AttributeInstance<AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### copy

    public [AttributeInstance.EnumSet](AttributeInstance.EnumSet.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.EnumSet")> copy()

    Specified by:
    :   `copy` in class `AttributeInstance<AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### release

    protected void release()

    Specified by:
    :   `release` in class `AttributeInstance<AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `AttributeInstance<AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    Specified by:
    :   `save` in class `AttributeInstance<AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)

    Specified by:
    :   `load` in class `AttributeInstance<AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`