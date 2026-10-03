[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [CraftRecipeGroup](CraftRecipeGroup.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [OPEN\_BOX](#OPEN_BOX)
8. [Field Details](#field-detail)
   1. [id](#id)
   2. [iconPath](#iconPath)
   3. [iconTexture](#iconTexture)
9. [Constructor Details](#constructor-detail)
   1. [CraftRecipeGroup(String, String)](#%3Cinit%3E(java.lang.String,java.lang.String))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [fromString(String)](#fromString(java.lang.String))
    4. [toString()](#toString())
    5. [getTranslationName()](#getTranslationName())
    6. [getIconTexture()](#getIconTexture())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class CraftRecipeGroup
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CraftRecipeGroup](CraftRecipeGroup.html "enum class in zombie.scripting.objects")>

zombie.scripting.objects.CraftRecipeGroup

All Implemented Interfaces:
:   `Serializable, Comparable<CraftRecipeGroup>, Constable`

---

public enum CraftRecipeGroup
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CraftRecipeGroup](CraftRecipeGroup.html "enum class in zombie.scripting.objects")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `OPEN_BOX`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `iconPath`

  `private Texture`

  `iconTexture`

  `private final String`

  `id`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CraftRecipeGroup(String id,
  String iconPath)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static CraftRecipeGroup`

  `fromString(String id)`

  `Texture`

  `getIconTexture()`

  `String`

  `getTranslationName()`

  `String`

  `toString()`

  `static CraftRecipeGroup`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static CraftRecipeGroup[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### OPEN\_BOX

    public static final [CraftRecipeGroup](CraftRecipeGroup.html "enum class in zombie.scripting.objects") OPEN\_BOX
* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### iconPath

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") iconPath
  + ### iconTexture

    private [Texture](../../core/textures/Texture.html "class in zombie.core.textures") iconTexture
* Constructor Details
  -------------------

  + ### CraftRecipeGroup

    private CraftRecipeGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") iconPath)
* Method Details
  --------------

  + ### values

    public static [CraftRecipeGroup](CraftRecipeGroup.html "enum class in zombie.scripting.objects")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [CraftRecipeGroup](CraftRecipeGroup.html "enum class in zombie.scripting.objects") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### fromString

    public static [CraftRecipeGroup](CraftRecipeGroup.html "enum class in zombie.scripting.objects") fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Enum<CraftRecipeGroup>`
  + ### getTranslationName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationName()
  + ### getIconTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getIconTexture()