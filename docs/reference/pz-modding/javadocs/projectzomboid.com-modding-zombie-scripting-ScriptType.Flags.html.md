[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.scripting](package-summary.html)
2. [ScriptType](ScriptType.html)
3. [Flags](ScriptType.Flags.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [Clear](#Clear)
   2. [FromList](#FromList)
   3. [CacheFullType](#CacheFullType)
   4. [ResetExisting](#ResetExisting)
   5. [RemoveLoadError](#RemoveLoadError)
   6. [SeekImports](#SeekImports)
   7. [ResetOnceOnReload](#ResetOnceOnReload)
   8. [AllowNewScriptDiscoveryOnReload](#AllowNewScriptDiscoveryOnReload)
   9. [NewInstanceOnReload](#NewInstanceOnReload)
7. [Constructor Details](#constructor-detail)
   1. [Flags()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class ScriptType.Flags
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting")>

zombie.scripting.ScriptType.Flags

All Implemented Interfaces:
:   `Serializable, Comparable<ScriptType.Flags>, Constable`

Enclosing class:
:   `ScriptType`

---

public static enum ScriptType.Flags
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `AllowNewScriptDiscoveryOnReload`

  `CacheFullType`

  `Clear`

  `FromList`

  `NewInstanceOnReload`

  `RemoveLoadError`

  `ResetExisting`

  `ResetOnceOnReload`

  `SeekImports`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Flags()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ScriptType.Flags`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static ScriptType.Flags[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Clear

    public static final [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") Clear
  + ### FromList

    public static final [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") FromList
  + ### CacheFullType

    public static final [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") CacheFullType
  + ### ResetExisting

    public static final [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") ResetExisting
  + ### RemoveLoadError

    public static final [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") RemoveLoadError
  + ### SeekImports

    public static final [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") SeekImports
  + ### ResetOnceOnReload

    public static final [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") ResetOnceOnReload
  + ### AllowNewScriptDiscoveryOnReload

    public static final [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") AllowNewScriptDiscoveryOnReload
  + ### NewInstanceOnReload

    public static final [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") NewInstanceOnReload
* Constructor Details
  -------------------

  + ### Flags

    private Flags()
* Method Details
  --------------

  + ### values

    public static [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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