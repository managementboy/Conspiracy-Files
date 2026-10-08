[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [CreditsRoleGroup](CreditsRoleGroup.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [EXECUTIVES\_AND\_LEADERSHIP](#EXECUTIVES_AND_LEADERSHIP)
   2. [MUSIC\_BY](#MUSIC_BY)
   3. [PROGRAMMING\_TEAM](#PROGRAMMING_TEAM)
   4. [CREATIVE\_TEAM](#CREATIVE_TEAM)
   5. [RESEARCH\_AND\_DEVELOPMENT](#RESEARCH_AND_DEVELOPMENT)
   6. [PRODUCTION](#PRODUCTION)
   7. [QUALITY\_ASSURANCE](#QUALITY_ASSURANCE)
   8. [ADMINISTRATION](#ADMINISTRATION)
   9. [VERTEX\_BREAK](#VERTEX_BREAK)
   10. [SOUND\_ARRIVAL](#SOUND_ARRIVAL)
   11. [GENERAL\_ARCADE](#GENERAL_ARCADE)
   12. [TEA](#TEA)
   13. [CONTRIBUTORS](#CONTRIBUTORS)
   14. [LOCALIZATION](#LOCALIZATION)
   15. [TMG](#TMG)
   16. [TOOLS](#TOOLS)
   17. [IN\_LOVING\_MEMORY\_OF](#IN_LOVING_MEMORY_OF)
8. [Field Details](#field-detail)
   1. [title](#title)
   2. [logo](#logo)
   3. [roles](#roles)
9. [Constructor Details](#constructor-detail)
   1. [CreditsRoleGroup(CreditsRole...)](#%3Cinit%3E(zombie.core.CreditsRole...))
   2. [CreditsRoleGroup(String, CreditsRole...)](#%3Cinit%3E(java.lang.String,zombie.core.CreditsRole...))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getAll()](#getAll())
    4. [getTitle()](#getTitle())
    5. [getLogo()](#getLogo())
    6. [getRoles()](#getRoles())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class CreditsRoleGroup
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core")>

zombie.core.CreditsRoleGroup

All Implemented Interfaces:
:   `Serializable, Comparable<CreditsRoleGroup>, Constable`

---

public enum CreditsRoleGroup
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ADMINISTRATION`

  `CONTRIBUTORS`

  `CREATIVE_TEAM`

  `EXECUTIVES_AND_LEADERSHIP`

  `GENERAL_ARCADE`

  `IN_LOVING_MEMORY_OF`

  `LOCALIZATION`

  `MUSIC_BY`

  `PRODUCTION`

  `PROGRAMMING_TEAM`

  `QUALITY_ASSURANCE`

  `RESEARCH_AND_DEVELOPMENT`

  `SOUND_ARRIVAL`

  `TEA`

  `TMG`

  `TOOLS`

  `VERTEX_BREAK`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `logo`

  `private final List<CreditsRole>`

  `roles`

  `private final String`

  `title`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CreditsRoleGroup(String logo,
  CreditsRole... roles)`

  `private`

  `CreditsRoleGroup(CreditsRole... roles)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static List<CreditsRoleGroup>`

  `getAll()`

  `String`

  `getLogo()`

  `List<CreditsRole>`

  `getRoles()`

  `String`

  `getTitle()`

  `static CreditsRoleGroup`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static CreditsRoleGroup[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### EXECUTIVES\_AND\_LEADERSHIP

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") EXECUTIVES\_AND\_LEADERSHIP
  + ### MUSIC\_BY

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") MUSIC\_BY
  + ### PROGRAMMING\_TEAM

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") PROGRAMMING\_TEAM
  + ### CREATIVE\_TEAM

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") CREATIVE\_TEAM
  + ### RESEARCH\_AND\_DEVELOPMENT

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") RESEARCH\_AND\_DEVELOPMENT
  + ### PRODUCTION

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") PRODUCTION
  + ### QUALITY\_ASSURANCE

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") QUALITY\_ASSURANCE
  + ### ADMINISTRATION

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") ADMINISTRATION
  + ### VERTEX\_BREAK

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") VERTEX\_BREAK
  + ### SOUND\_ARRIVAL

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") SOUND\_ARRIVAL
  + ### GENERAL\_ARCADE

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") GENERAL\_ARCADE
  + ### TEA

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") TEA
  + ### CONTRIBUTORS

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") CONTRIBUTORS
  + ### LOCALIZATION

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") LOCALIZATION
  + ### TMG

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") TMG
  + ### TOOLS

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") TOOLS
  + ### IN\_LOVING\_MEMORY\_OF

    public static final [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") IN\_LOVING\_MEMORY\_OF
* Field Details
  -------------

  + ### title

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### logo

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logo
  + ### roles

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CreditsRole](CreditsRole.html "enum class in zombie.core")> roles
* Constructor Details
  -------------------

  + ### CreditsRoleGroup

    private CreditsRoleGroup([CreditsRole](CreditsRole.html "enum class in zombie.core")... roles)
  + ### CreditsRoleGroup

    private CreditsRoleGroup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logo,
    [CreditsRole](CreditsRole.html "enum class in zombie.core")... roles)
* Method Details
  --------------

  + ### values

    public static [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getAll

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CreditsRoleGroup](CreditsRoleGroup.html "enum class in zombie.core")> getAll()
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### getLogo

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLogo()
  + ### getRoles

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CreditsRole](CreditsRole.html "enum class in zombie.core")> getRoles()