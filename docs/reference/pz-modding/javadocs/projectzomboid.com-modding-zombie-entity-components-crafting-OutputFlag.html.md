[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [OutputFlag](OutputFlag.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [HandcraftOnly](#HandcraftOnly)
   2. [AutomationOnly](#AutomationOnly)
   3. [IsEmpty](#IsEmpty)
   4. [ForceEmpty](#ForceEmpty)
   5. [AlwaysFill](#AlwaysFill)
   6. [RespectCapacity](#RespectCapacity)
   7. [IsBlunt](#IsBlunt)
   8. [HasOneUse](#HasOneUse)
   9. [HasNoUses](#HasNoUses)
   10. [DontInheritCondition](#DontInheritCondition)
   11. [EquipSecondary](#EquipSecondary)
   12. [SetActivated](#SetActivated)
7. [Constructor Details](#constructor-detail)
   1. [OutputFlag()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class OutputFlag
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting")>

zombie.entity.components.crafting.OutputFlag

All Implemented Interfaces:
:   `Serializable, Comparable<OutputFlag>, Constable`

---

public enum OutputFlag
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `AlwaysFill`

  `AutomationOnly`

  `DontInheritCondition`

  `EquipSecondary`

  `ForceEmpty`

  `HandcraftOnly`

  `HasNoUses`

  `HasOneUse`

  `IsBlunt`

  `IsEmpty`

  `RespectCapacity`

  `SetActivated`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `OutputFlag()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static OutputFlag`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static OutputFlag[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### HandcraftOnly

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") HandcraftOnly
  + ### AutomationOnly

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") AutomationOnly
  + ### IsEmpty

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") IsEmpty
  + ### ForceEmpty

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") ForceEmpty
  + ### AlwaysFill

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") AlwaysFill
  + ### RespectCapacity

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") RespectCapacity
  + ### IsBlunt

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") IsBlunt
  + ### HasOneUse

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") HasOneUse
  + ### HasNoUses

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") HasNoUses
  + ### DontInheritCondition

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") DontInheritCondition
  + ### EquipSecondary

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") EquipSecondary
  + ### SetActivated

    public static final [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") SetActivated
* Constructor Details
  -------------------

  + ### OutputFlag

    private OutputFlag()
* Method Details
  --------------

  + ### values

    public static [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [OutputFlag](OutputFlag.html "enum class in zombie.entity.components.crafting") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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