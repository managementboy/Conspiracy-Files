[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.config](package-summary.html)
2. [ArrayConfigOption](ArrayConfigOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
   2. [defaultValue](#defaultValue)
   3. [separator](#separator)
   4. [elementHandler](#elementHandler)
   5. [fixedSize](#fixedSize)
   6. [multiLine](#multiLine)
7. [Constructor Details](#constructor-detail)
   1. [ArrayConfigOption(String, ConfigOption, String, String)](#%3Cinit%3E(java.lang.String,zombie.config.ConfigOption,java.lang.String,java.lang.String))
8. [Method Details](#method-detail)
   1. [setFixedSize(int)](#setFixedSize(int))
   2. [setMultiLine(boolean)](#setMultiLine(boolean))
   3. [isMultiLine()](#isMultiLine())
   4. [clear()](#clear())
   5. [getType()](#getType())
   6. [resetToDefault()](#resetToDefault())
   7. [setDefaultToCurrentValue()](#setDefaultToCurrentValue())
   8. [parse(String)](#parse(java.lang.String))
   9. [getValueAsString()](#getValueAsString())
   10. [setValueFromObject(Object)](#setValueFromObject(java.lang.Object))
   11. [getValueAsObject()](#getValueAsObject())
   12. [isValidString(String)](#isValidString(java.lang.String))
   13. [getTooltip()](#getTooltip())
   14. [makeCopy()](#makeCopy())
   15. [size()](#size())
   16. [getElement(int)](#getElement(int))
   17. [setValueVarArgs(Object...)](#setValueVarArgs(java.lang.Object...))
   18. [copyValue(ArrayList, ArrayList)](#copyValue(java.util.ArrayList,java.util.ArrayList))
   19. [getValueAsString(ArrayList)](#getValueAsString(java.util.ArrayList))
   20. [resize(ArrayList, int)](#resize(java.util.ArrayList,int))
   21. [getValueAsColorInfo(ColorInfo)](#getValueAsColorInfo(zombie.core.textures.ColorInfo))
   22. [getElementAsDouble(int, float)](#getElementAsDouble(int,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ArrayConfigOption
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](ConfigOption.html "class in zombie.config")

zombie.config.ArrayConfigOption

---

public class ArrayConfigOption
extends [ConfigOption](ConfigOption.html "class in zombie.config")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final ArrayList<ConfigOption>`

  `defaultValue`

  `protected final ConfigOption`

  `elementHandler`

  `protected int`

  `fixedSize`

  `protected boolean`

  `multiLine`

  `protected final String`

  `separator`

  `protected final ArrayList<ConfigOption>`

  `value`

  ### Fields inherited from class [ConfigOption](ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ArrayConfigOption(String name,
  ConfigOption elementHandler,
  String separator,
  String defaultValue)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `clear()`

  `private void`

  `copyValue(ArrayList<ConfigOption> from,
  ArrayList<ConfigOption> to)`

  `ConfigOption`

  `getElement(int index)`

  `double`

  `getElementAsDouble(int index,
  float defaultValue)`

  `String`

  `getTooltip()`

  `String`

  `getType()`

  `ColorInfo`

  `getValueAsColorInfo(ColorInfo colorInfo)`

  `Object`

  `getValueAsObject()`

  `String`

  `getValueAsString()`

  `private String`

  `getValueAsString(ArrayList<ConfigOption> value)`

  `boolean`

  `isMultiLine()`

  `boolean`

  `isValidString(String s)`

  `ConfigOption`

  `makeCopy()`

  `void`

  `parse(String s)`

  `void`

  `resetToDefault()`

  `private void`

  `resize(ArrayList<ConfigOption> value,
  int newSize)`

  `void`

  `setDefaultToCurrentValue()`

  `ArrayConfigOption`

  `setFixedSize(int size)`

  `ArrayConfigOption`

  `setMultiLine(boolean bMultiLine)`

  `void`

  `setValueFromObject(Object o)`

  `ArrayConfigOption`

  `setValueVarArgs(Object... args)`

  `int`

  `size()`

  ### Methods inherited from class [ConfigOption](ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### value

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](ConfigOption.html "class in zombie.config")> value
  + ### defaultValue

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](ConfigOption.html "class in zombie.config")> defaultValue
  + ### separator

    protected final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator
  + ### elementHandler

    protected final [ConfigOption](ConfigOption.html "class in zombie.config") elementHandler
  + ### fixedSize

    protected int fixedSize
  + ### multiLine

    protected boolean multiLine
* Constructor Details
  -------------------

  + ### ArrayConfigOption

    public ArrayConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [ConfigOption](ConfigOption.html "class in zombie.config") elementHandler,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue)
* Method Details
  --------------

  + ### setFixedSize

    public [ArrayConfigOption](ArrayConfigOption.html "class in zombie.config") setFixedSize(int size)
  + ### setMultiLine

    public [ArrayConfigOption](ArrayConfigOption.html "class in zombie.config") setMultiLine(boolean bMultiLine)
  + ### isMultiLine

    public boolean isMultiLine()
  + ### clear

    public void clear()
  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()

    Specified by:
    :   `getType` in class `ConfigOption`
  + ### resetToDefault

    public void resetToDefault()

    Specified by:
    :   `resetToDefault` in class `ConfigOption`
  + ### setDefaultToCurrentValue

    public void setDefaultToCurrentValue()

    Specified by:
    :   `setDefaultToCurrentValue` in class `ConfigOption`
  + ### parse

    public void parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)

    Specified by:
    :   `parse` in class `ConfigOption`
  + ### getValueAsString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueAsString()

    Specified by:
    :   `getValueAsString` in class `ConfigOption`
  + ### setValueFromObject

    public void setValueFromObject([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `setValueFromObject` in class `ConfigOption`
  + ### getValueAsObject

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getValueAsObject()

    Specified by:
    :   `getValueAsObject` in class `ConfigOption`
  + ### isValidString

    public boolean isValidString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)

    Specified by:
    :   `isValidString` in class `ConfigOption`
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()

    Specified by:
    :   `getTooltip` in class `ConfigOption`
  + ### makeCopy

    public [ConfigOption](ConfigOption.html "class in zombie.config") makeCopy()

    Specified by:
    :   `makeCopy` in class `ConfigOption`
  + ### size

    public int size()
  + ### getElement

    public [ConfigOption](ConfigOption.html "class in zombie.config") getElement(int index)
  + ### setValueVarArgs

    public [ArrayConfigOption](ArrayConfigOption.html "class in zombie.config") setValueVarArgs([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... args)
  + ### copyValue

    private void copyValue([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](ConfigOption.html "class in zombie.config")> from,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](ConfigOption.html "class in zombie.config")> to)
  + ### getValueAsString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueAsString([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](ConfigOption.html "class in zombie.config")> value)
  + ### resize

    private void resize([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](ConfigOption.html "class in zombie.config")> value,
    int newSize)
  + ### getValueAsColorInfo

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getValueAsColorInfo([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") colorInfo)
  + ### getElementAsDouble

    public double getElementAsDouble(int index,
    float defaultValue)