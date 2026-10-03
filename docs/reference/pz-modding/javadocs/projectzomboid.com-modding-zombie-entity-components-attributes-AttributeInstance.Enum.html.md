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
3. [Enum](AttributeInstance.Enum.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
7. [Constructor Details](#constructor-detail)
   1. [Enum()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setType(AttributeType.Enum)](#setType(zombie.entity.components.attributes.AttributeType.Enum))
   2. [getValue()](#getValue())
   3. [setValue(E)](#setValue(E))
   4. [stringValue()](#stringValue())
   5. [setValueFromScriptString(String)](#setValueFromScriptString(java.lang.String))
   6. [equalTo(AttributeInstance.Enum)](#equalTo(zombie.entity.components.attributes.AttributeInstance.Enum))
   7. [copy()](#copy())
   8. [release()](#release())
   9. [reset()](#reset())
   10. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   11. [load(ByteBuffer)](#load(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeInstance.Enum<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
=======================================================================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.Enum](AttributeInstance.Enum.html "class in zombie.entity.components.attributes")<E>, [AttributeType.Enum](AttributeType.Enum.html "class in zombie.entity.components.attributes")<E>>

zombie.entity.components.attributes.AttributeInstance.Enum<E>

Enclosing class:
:   `AttributeInstance<C extends AttributeInstance<C,T>, T extends AttributeType>`

---

public static class AttributeInstance.Enum<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
extends [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<[AttributeInstance.Enum](AttributeInstance.Enum.html "class in zombie.entity.components.attributes")<E>, [AttributeType.Enum](AttributeType.Enum.html "class in zombie.entity.components.attributes")<E>>

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

  `private E`

  `value`

  ### Fields inherited from class [AttributeInstance](AttributeInstance.html#field-summary "class in zombie.entity.components.attributes")

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Enum()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `AttributeInstance.Enum<E>`

  `copy()`

  `boolean`

  `equalTo(AttributeInstance.Enum<E> other)`

  `E`

  `getValue()`

  `void`

  `load(ByteBuffer input)`

  `protected void`

  `release()`

  `protected void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  `protected void`

  `setType(AttributeType.Enum<E> type)`

  `void`

  `setValue(E value)`

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

    private [E](#type-param-E "type parameter in AttributeInstance.Enum") extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[E](#type-param-E "type parameter in AttributeInstance.Enum")> & zombie.entity.util.enums.IOEnum value
* Constructor Details
  -------------------

  + ### Enum

    public Enum()
* Method Details
  --------------

  + ### setType

    protected void setType([AttributeType.Enum](AttributeType.Enum.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.Enum")> type)

    Specified by:
    :   `setType` in class `AttributeInstance<AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### getValue

    public [E](#type-param-E "type parameter in AttributeInstance.Enum") getValue()
  + ### setValue

    public void setValue([E](#type-param-E "type parameter in AttributeInstance.Enum") value)
  + ### stringValue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stringValue()

    Specified by:
    :   `stringValue` in class `AttributeInstance<AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### setValueFromScriptString

    public boolean setValueFromScriptString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)

    Enum values in script strings need to be prefixed by 'Enum.' indicating they are an enum.

    Specified by:
    :   `setValueFromScriptString` in class `AttributeInstance<AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### equalTo

    public boolean equalTo([AttributeInstance.Enum](AttributeInstance.Enum.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.Enum")> other)

    Specified by:
    :   `equalTo` in class `AttributeInstance<AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### copy

    public [AttributeInstance.Enum](AttributeInstance.Enum.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in AttributeInstance.Enum")> copy()

    Specified by:
    :   `copy` in class `AttributeInstance<AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### release

    protected void release()

    Specified by:
    :   `release` in class `AttributeInstance<AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### reset

    protected void reset()

    Overrides:
    :   `reset` in class `AttributeInstance<AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    Specified by:
    :   `save` in class `AttributeInstance<AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)

    Specified by:
    :   `load` in class `AttributeInstance<AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>, AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>>`