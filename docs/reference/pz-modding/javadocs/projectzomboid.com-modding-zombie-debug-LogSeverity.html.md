[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.debug](package-summary.html)
2. [LogSeverity](LogSeverity.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Trace](#Trace)
   2. [Noise](#Noise)
   3. [Debug](#Debug)
   4. [General](#General)
   5. [Warning](#Warning)
   6. [Error](#Error)
   7. [Off](#Off)
8. [Field Details](#field-detail)
   1. [All](#All)
   2. [logPrefix](#logPrefix)
9. [Constructor Details](#constructor-detail)
   1. [LogSeverity(String)](#%3Cinit%3E(java.lang.String))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [isLogEnabled(LogSeverity)](#isLogEnabled(zombie.debug.LogSeverity))
    4. [getValueList()](#getValueList())
    5. [isName(String)](#isName(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class LogSeverity
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[LogSeverity](LogSeverity.html "enum class in zombie.debug")>

zombie.debug.LogSeverity

All Implemented Interfaces:
:   `Serializable, Comparable<LogSeverity>, Constable`

---

public enum LogSeverity
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[LogSeverity](LogSeverity.html "enum class in zombie.debug")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Debug`

  `Error`

  `General`

  `Noise`

  `Off`

  `Trace`

  `Warning`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final LogSeverity`

  `All`

  `final String`

  `logPrefix`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `LogSeverity(String logPrefix)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<LogSeverity>`

  `getValueList()`

  Returns a list of all DebugType's, in alphabetical order.

  `boolean`

  `isLogEnabled(LogSeverity logSeverity)`

  `boolean`

  `isName(String str)`

  `static LogSeverity`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static LogSeverity[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Trace

    public static final [LogSeverity](LogSeverity.html "enum class in zombie.debug") Trace
  + ### Noise

    public static final [LogSeverity](LogSeverity.html "enum class in zombie.debug") Noise
  + ### Debug

    public static final [LogSeverity](LogSeverity.html "enum class in zombie.debug") Debug
  + ### General

    public static final [LogSeverity](LogSeverity.html "enum class in zombie.debug") General
  + ### Warning

    public static final [LogSeverity](LogSeverity.html "enum class in zombie.debug") Warning
  + ### Error

    public static final [LogSeverity](LogSeverity.html "enum class in zombie.debug") Error
  + ### Off

    public static final [LogSeverity](LogSeverity.html "enum class in zombie.debug") Off
* Field Details
  -------------

  + ### All

    public static final [LogSeverity](LogSeverity.html "enum class in zombie.debug") All
  + ### logPrefix

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logPrefix
* Constructor Details
  -------------------

  + ### LogSeverity

    private LogSeverity([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logPrefix)
* Method Details
  --------------

  + ### values

    public static [LogSeverity](LogSeverity.html "enum class in zombie.debug")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [LogSeverity](LogSeverity.html "enum class in zombie.debug") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `name` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null
  + ### isLogEnabled

    public boolean isLogEnabled([LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity)
  + ### getValueList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[LogSeverity](LogSeverity.html "enum class in zombie.debug")> getValueList()

    Returns a list of all DebugType's, in alphabetical order.
  + ### isName

    public boolean isName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)