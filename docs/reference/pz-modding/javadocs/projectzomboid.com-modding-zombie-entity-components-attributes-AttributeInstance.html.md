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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [type](#type)
7. [Constructor Details](#constructor-detail)
   1. [AttributeInstance()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setType(T)](#setType(T))
   2. [getType()](#getType())
   3. [getValueType()](#getValueType())
   4. [getNameUI()](#getNameUI())
   5. [isHiddenUI()](#isHiddenUI())
   6. [isRequiresValidation()](#isRequiresValidation())
   7. [isReadOnly()](#isReadOnly())
   8. [canSetValue()](#canSetValue())
   9. [stringValue()](#stringValue())
   10. [setValueFromScriptString(String)](#setValueFromScriptString(java.lang.String))
   11. [equalTo(C)](#equalTo(C))
   12. [copy()](#copy())
   13. [isDisplayAsBar()](#isDisplayAsBar())
   14. [getDisplayAsBarUnit()](#getDisplayAsBarUnit())
   15. [getFloatValue()](#getFloatValue())
   16. [getIntValue()](#getIntValue())
   17. [reset()](#reset())
   18. [release()](#release())
   19. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   20. [load(ByteBuffer)](#load(java.nio.ByteBuffer))
   21. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeInstance<C extends AttributeInstance<C,T>, T extends [AttributeType](AttributeType.html "class in zombie.entity.components.attributes")>
=======================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.attributes.AttributeInstance<C,T>

Direct Known Subclasses:
:   `AttributeInstance.Bool, AttributeInstance.Enum, AttributeInstance.EnumSet, AttributeInstance.EnumStringSet, AttributeInstance.Numeric, AttributeInstance.String`

---

public abstract class AttributeInstance<C extends AttributeInstance<C,T>, T extends [AttributeType](AttributeType.html "class in zombie.entity.components.attributes")>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `AttributeInstance.Bool`

  `static class`

  `AttributeInstance.Byte`

  Byte

  `static class`

  `AttributeInstance.Double`

  `static class`

  `AttributeInstance.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>`

  `static class`

  `AttributeInstance.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>`

  `static class`

  `AttributeInstance.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>`

  `static class`

  `AttributeInstance.Float`

  `static class`

  `AttributeInstance.Int`

  Int

  `static class`

  `AttributeInstance.Long`

  Long

  `static class`

  `AttributeInstance.Numeric<C extends AttributeInstance.Numeric<C,T>, T extends AttributeType.Numeric<T,?>>`

  `static class`

  `AttributeInstance.Short`

  `static class`

  `AttributeInstance.String`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected T`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `AttributeInstance()`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected boolean`

  `canSetValue()`

  `abstract C`

  `copy()`

  `abstract boolean`

  `equalTo(C other)`

  `float`

  `getDisplayAsBarUnit()`

  `float`

  `getFloatValue()`

  `int`

  `getIntValue()`

  `final String`

  `getNameUI()`

  `final T`

  `getType()`

  `final AttributeValueType`

  `getValueType()`

  `boolean`

  `isDisplayAsBar()`

  `final boolean`

  `isHiddenUI()`

  `final boolean`

  `isReadOnly()`

  `boolean`

  `isRequiresValidation()`

  `abstract void`

  `load(ByteBuffer input)`

  `protected abstract void`

  `release()`

  `protected void`

  `reset()`

  `abstract void`

  `save(ByteBuffer output)`

  `protected abstract void`

  `setType(T type)`

  `abstract boolean`

  `setValueFromScriptString(String val)`

  `abstract String`

  `stringValue()`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### type

    protected [T](#type-param-T "type parameter in AttributeInstance") extends [AttributeType](AttributeType.html "class in zombie.entity.components.attributes") type
* Constructor Details
  -------------------

  + ### AttributeInstance

    protected AttributeInstance()
* Method Details
  --------------

  + ### setType

    protected abstract void setType([T](#type-param-T "type parameter in AttributeInstance") type)
  + ### getType

    public final [T](#type-param-T "type parameter in AttributeInstance") getType()
  + ### getValueType

    public final [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") getValueType()
  + ### getNameUI

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNameUI()
  + ### isHiddenUI

    public final boolean isHiddenUI()
  + ### isRequiresValidation

    public boolean isRequiresValidation()
  + ### isReadOnly

    public final boolean isReadOnly()
  + ### canSetValue

    protected boolean canSetValue()
  + ### stringValue

    public abstract [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stringValue()
  + ### setValueFromScriptString

    public abstract boolean setValueFromScriptString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### equalTo

    public abstract boolean equalTo([C](#type-param-C "type parameter in AttributeInstance") other)
  + ### copy

    public abstract [C](#type-param-C "type parameter in AttributeInstance") copy()
  + ### isDisplayAsBar

    public boolean isDisplayAsBar()
  + ### getDisplayAsBarUnit

    public float getDisplayAsBarUnit()
  + ### getFloatValue

    public float getFloatValue()
  + ### getIntValue

    public int getIntValue()
  + ### reset

    protected void reset()
  + ### release

    protected abstract void release()
  + ### save

    public abstract void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### load

    public abstract void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`