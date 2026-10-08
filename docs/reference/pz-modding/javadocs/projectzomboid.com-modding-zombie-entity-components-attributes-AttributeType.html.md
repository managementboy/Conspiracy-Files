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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MAX\_ID](#MAX_ID)
   2. [id](#id)
   3. [name](#name)
   4. [translateKey](#translateKey)
   5. [tooltipOverride](#tooltipOverride)
   6. [optionDisplay](#optionDisplay)
   7. [optionDisplayAsBar](#optionDisplayAsBar)
   8. [readOnly](#readOnly)
7. [Constructor Details](#constructor-detail)
   1. [AttributeType(short, String, boolean, Attribute.UI.Display, String)](#%3Cinit%3E(short,java.lang.String,boolean,zombie.entity.components.attributes.Attribute.UI.Display,java.lang.String))
   2. [AttributeType(short, String, boolean, Attribute.UI.Display, Attribute.UI.DisplayAsBar, String)](#%3Cinit%3E(short,java.lang.String,boolean,zombie.entity.components.attributes.Attribute.UI.Display,zombie.entity.components.attributes.Attribute.UI.DisplayAsBar,java.lang.String))
8. [Method Details](#method-detail)
   1. [id()](#id())
   2. [isReadOnly()](#isReadOnly())
   3. [toString()](#toString())
   4. [getName()](#getName())
   5. [getValueType()](#getValueType())
   6. [isNumeric()](#isNumeric())
   7. [isDecimal()](#isDecimal())
   8. [isHiddenUI()](#isHiddenUI())
   9. [getDisplayAsBar()](#getDisplayAsBar())
   10. [getTranslateKey()](#getTranslateKey())
   11. [getTranslatedName()](#getTranslatedName())
   12. [getNameUI()](#getNameUI())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeType
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.attributes.AttributeType

Direct Known Subclasses:
:   `AttributeType.Bool, AttributeType.Enum, AttributeType.EnumSet, AttributeType.EnumStringSet, AttributeType.Numeric, AttributeType.String`

---

public abstract class AttributeType
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `AttributeType.Bool`

  `static class`

  `AttributeType.Byte`

  `static class`

  `AttributeType.Double`

  `static class`

  `AttributeType.Enum<E extends Enum<E> & zombie.entity.util.enums.IOEnum>`

  `static class`

  `AttributeType.EnumSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>`

  `static class`

  `AttributeType.EnumStringSet<E extends Enum<E> & zombie.entity.util.enums.IOEnum>`

  `static class`

  `AttributeType.Float`

  `static class`

  `AttributeType.Int`

  `static class`

  `AttributeType.Long`

  `static class`

  `AttributeType.Numeric<C extends AttributeType.Numeric<C,T>, T extends Number>`

  `static class`

  `AttributeType.Short`

  `static class`

  `AttributeType.String`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final short`

  `id`

  `private static final int`

  `MAX_ID`

  `private final String`

  `name`

  `private final Attribute.UI.Display`

  `optionDisplay`

  `private final Attribute.UI.DisplayAsBar`

  `optionDisplayAsBar`

  `private final boolean`

  `readOnly`

  `private final String`

  `tooltipOverride`

  `private final String`

  `translateKey`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `AttributeType(short id,
  String name,
  boolean readOnly,
  Attribute.UI.Display display,
  String tooltipOverride)`

  `protected`

  `AttributeType(short id,
  String name,
  boolean readOnly,
  Attribute.UI.Display display,
  Attribute.UI.DisplayAsBar asBar,
  String tooltipOverride)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected Attribute.UI.DisplayAsBar`

  `getDisplayAsBar()`

  `String`

  `getName()`

  `String`

  `getNameUI()`

  `private String`

  `getTranslatedName()`

  `String`

  `getTranslateKey()`

  `abstract AttributeValueType`

  `getValueType()`

  `short`

  `id()`

  `boolean`

  `isDecimal()`

  `boolean`

  `isHiddenUI()`

  `boolean`

  `isNumeric()`

  `boolean`

  `isReadOnly()`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### MAX\_ID

    private static final int MAX\_ID

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.attributes.AttributeType.MAX_ID)
  + ### id

    private final short id
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### translateKey

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translateKey
  + ### tooltipOverride

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltipOverride
  + ### optionDisplay

    private final [Attribute.UI.Display](Attribute.UI.Display.html "enum class in zombie.entity.components.attributes") optionDisplay
  + ### optionDisplayAsBar

    private final [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes") optionDisplayAsBar
  + ### readOnly

    private final boolean readOnly
* Constructor Details
  -------------------

  + ### AttributeType

    protected AttributeType(short id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean readOnly,
    [Attribute.UI.Display](Attribute.UI.Display.html "enum class in zombie.entity.components.attributes") display,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltipOverride)
  + ### AttributeType

    protected AttributeType(short id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean readOnly,
    [Attribute.UI.Display](Attribute.UI.Display.html "enum class in zombie.entity.components.attributes") display,
    [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes") asBar,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltipOverride)
* Method Details
  --------------

  + ### id

    public short id()
  + ### isReadOnly

    public boolean isReadOnly()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getValueType

    public abstract [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") getValueType()
  + ### isNumeric

    public boolean isNumeric()
  + ### isDecimal

    public boolean isDecimal()
  + ### isHiddenUI

    public boolean isHiddenUI()
  + ### getDisplayAsBar

    protected [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes") getDisplayAsBar()
  + ### getTranslateKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslateKey()
  + ### getTranslatedName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedName()
  + ### getNameUI

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNameUI()