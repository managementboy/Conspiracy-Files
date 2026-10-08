[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.Moodles](package-summary.html)
2. [Moodle](Moodle.html)
3. [MoodleLevel](Moodle.MoodleLevel.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [MinMoodleLevel](#MinMoodleLevel)
   2. [LowMoodleLevel](#LowMoodleLevel)
   3. [ModerateMoodleLevel](#ModerateMoodleLevel)
   4. [HighMoodleLevel](#HighMoodleLevel)
   5. [MaxMoodleLevel](#MaxMoodleLevel)
7. [Constructor Details](#constructor-detail)
   1. [MoodleLevel()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class Moodle.MoodleLevel
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Moodle.MoodleLevel](Moodle.MoodleLevel.html "enum class in zombie.characters.Moodles")>

zombie.characters.Moodles.Moodle.MoodleLevel

All Implemented Interfaces:
:   `Serializable, Comparable<Moodle.MoodleLevel>, Constable`

Enclosing class:
:   `Moodle`

---

public static enum Moodle.MoodleLevel
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Moodle.MoodleLevel](Moodle.MoodleLevel.html "enum class in zombie.characters.Moodles")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `HighMoodleLevel`

  `LowMoodleLevel`

  `MaxMoodleLevel`

  `MinMoodleLevel`

  `ModerateMoodleLevel`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `MoodleLevel()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static Moodle.MoodleLevel`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static Moodle.MoodleLevel[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### MinMoodleLevel

    public static final [Moodle.MoodleLevel](Moodle.MoodleLevel.html "enum class in zombie.characters.Moodles") MinMoodleLevel
  + ### LowMoodleLevel

    public static final [Moodle.MoodleLevel](Moodle.MoodleLevel.html "enum class in zombie.characters.Moodles") LowMoodleLevel
  + ### ModerateMoodleLevel

    public static final [Moodle.MoodleLevel](Moodle.MoodleLevel.html "enum class in zombie.characters.Moodles") ModerateMoodleLevel
  + ### HighMoodleLevel

    public static final [Moodle.MoodleLevel](Moodle.MoodleLevel.html "enum class in zombie.characters.Moodles") HighMoodleLevel
  + ### MaxMoodleLevel

    public static final [Moodle.MoodleLevel](Moodle.MoodleLevel.html "enum class in zombie.characters.Moodles") MaxMoodleLevel
* Constructor Details
  -------------------

  + ### MoodleLevel

    private MoodleLevel()
* Method Details
  --------------

  + ### values

    public static [Moodle.MoodleLevel](Moodle.MoodleLevel.html "enum class in zombie.characters.Moodles")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [Moodle.MoodleLevel](Moodle.MoodleLevel.html "enum class in zombie.characters.Moodles") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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