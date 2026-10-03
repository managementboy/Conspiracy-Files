[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [InputFlag](InputFlag.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Enum Constant Details](#enum-constant-detail)
   1. [HandcraftOnly](#HandcraftOnly)
   2. [AutomationOnly](#AutomationOnly)
   3. [IsFull](#IsFull)
   4. [NotFull](#NotFull)
   5. [ItemIsUses](#ItemIsUses)
   6. [ItemIsFluid](#ItemIsFluid)
   7. [ItemIsEnergy](#ItemIsEnergy)
   8. [IsEmpty](#IsEmpty)
   9. [NotEmpty](#NotEmpty)
   10. [Prop1](#Prop1)
   11. [Prop2](#Prop2)
   12. [ToolLeft](#ToolLeft)
   13. [ToolRight](#ToolRight)
   14. [IsDamaged](#IsDamaged)
   15. [IsUndamaged](#IsUndamaged)
   16. [IsWholeFoodItem](#IsWholeFoodItem)
   17. [IsEmptyContainer](#IsEmptyContainer)
   18. [IsUncookedFoodItem](#IsUncookedFoodItem)
   19. [IsCookedFoodItem](#IsCookedFoodItem)
   20. [IsNotDull](#IsNotDull)
   21. [IsHeadPart](#IsHeadPart)
   22. [IsSharpenable](#IsSharpenable)
   23. [DontPutBack](#DontPutBack)
   24. [InheritColor](#InheritColor)
   25. [InheritCondition](#InheritCondition)
   26. [InheritEquipped](#InheritEquipped)
   27. [InheritSharpness](#InheritSharpness)
   28. [InheritHeadCondition](#InheritHeadCondition)
   29. [MayDegrade](#MayDegrade)
   30. [MayDegradeLight](#MayDegradeLight)
   31. [MayDegradeVeryLight](#MayDegradeVeryLight)
   32. [MayDegradeHeavy](#MayDegradeHeavy)
   33. [SharpnessCheck](#SharpnessCheck)
   34. [InheritUses](#InheritUses)
   35. [InheritUsesAndEmpty](#InheritUsesAndEmpty)
   36. [InheritFood](#InheritFood)
   37. [InheritFoodAge](#InheritFoodAge)
   38. [InheritCooked](#InheritCooked)
   39. [InheritModelVariation](#InheritModelVariation)
   40. [InheritWeight](#InheritWeight)
   41. [InheritName](#InheritName)
   42. [InheritFreezingTime](#InheritFreezingTime)
   43. [DontInheritCondition](#DontInheritCondition)
   44. [AllowFrozenItem](#AllowFrozenItem)
   45. [AllowRottenItem](#AllowRottenItem)
   46. [NoBrokenItems](#NoBrokenItems)
   47. [AllowDestroyedItem](#AllowDestroyedItem)
   48. [IsWorn](#IsWorn)
   49. [IsNotWorn](#IsNotWorn)
   50. [InheritAmmunition](#InheritAmmunition)
   51. [CopyClothing](#CopyClothing)
   52. [AllowFavorite](#AllowFavorite)
   53. [InheritFavorite](#InheritFavorite)
   54. [FakeOutput](#FakeOutput)
   55. [DontReplace](#DontReplace)
   56. [CanBeDoneFromFloor](#CanBeDoneFromFloor)
   57. [ItemCount](#ItemCount)
   58. [IsExclusive](#IsExclusive)
   59. [RecordInput](#RecordInput)
   60. [DontRecordInput](#DontRecordInput)
   61. [ResearchInput](#ResearchInput)
   62. [IsBlunt](#IsBlunt)
   63. [HasOneUse](#HasOneUse)
   64. [HasNoUses](#HasNoUses)
   65. [IsSealed](#IsSealed)
   66. [IsNotSealed](#IsNotSealed)
   67. [Unseal](#Unseal)
   68. [EquipSecondary](#EquipSecondary)
   69. [SetActivated](#SetActivated)
7. [Constructor Details](#constructor-detail)
   1. [InputFlag()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [values()](#values())
   2. [valueOf(String)](#valueOf(java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Enum Class InputFlag
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting")>

zombie.entity.components.crafting.InputFlag

All Implemented Interfaces:
:   `Serializable, Comparable<InputFlag>, Constable`

---

public enum InputFlag
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `AllowDestroyedItem`

  `AllowFavorite`

  `AllowFrozenItem`

  `AllowRottenItem`

  `AutomationOnly`

  `CanBeDoneFromFloor`

  `CopyClothing`

  `DontInheritCondition`

  `DontPutBack`

  `DontRecordInput`

  `DontReplace`

  `EquipSecondary`

  `FakeOutput`

  `HandcraftOnly`

  `HasNoUses`

  `HasOneUse`

  `InheritAmmunition`

  `InheritColor`

  `InheritCondition`

  `InheritCooked`

  `InheritEquipped`

  `InheritFavorite`

  `InheritFood`

  `InheritFoodAge`

  `InheritFreezingTime`

  `InheritHeadCondition`

  `InheritModelVariation`

  `InheritName`

  `InheritSharpness`

  `InheritUses`

  `InheritUsesAndEmpty`

  `InheritWeight`

  `IsBlunt`

  `IsCookedFoodItem`

  `IsDamaged`

  `IsEmpty`

  `IsEmptyContainer`

  `IsExclusive`

  `IsFull`

  `IsHeadPart`

  `IsNotDull`

  `IsNotSealed`

  `IsNotWorn`

  `IsSealed`

  `IsSharpenable`

  `IsUncookedFoodItem`

  `IsUndamaged`

  `IsWholeFoodItem`

  `IsWorn`

  `ItemCount`

  `ItemIsEnergy`

  `ItemIsFluid`

  `ItemIsUses`

  `MayDegrade`

  `MayDegradeHeavy`

  `MayDegradeLight`

  `MayDegradeVeryLight`

  `NoBrokenItems`

  `NotEmpty`

  `NotFull`

  `Prop1`

  `Prop2`

  `RecordInput`

  `ResearchInput`

  `SetActivated`

  `SharpnessCheck`

  `ToolLeft`

  `ToolRight`

  `Unseal`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `InputFlag()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static InputFlag`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static InputFlag[]`

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

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") HandcraftOnly
  + ### AutomationOnly

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") AutomationOnly
  + ### IsFull

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsFull
  + ### NotFull

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") NotFull
  + ### ItemIsUses

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") ItemIsUses
  + ### ItemIsFluid

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") ItemIsFluid
  + ### ItemIsEnergy

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") ItemIsEnergy
  + ### IsEmpty

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsEmpty
  + ### NotEmpty

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") NotEmpty
  + ### Prop1

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") Prop1
  + ### Prop2

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") Prop2
  + ### ToolLeft

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") ToolLeft
  + ### ToolRight

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") ToolRight
  + ### IsDamaged

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsDamaged
  + ### IsUndamaged

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsUndamaged
  + ### IsWholeFoodItem

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsWholeFoodItem
  + ### IsEmptyContainer

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsEmptyContainer
  + ### IsUncookedFoodItem

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsUncookedFoodItem
  + ### IsCookedFoodItem

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsCookedFoodItem
  + ### IsNotDull

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsNotDull
  + ### IsHeadPart

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsHeadPart
  + ### IsSharpenable

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsSharpenable
  + ### DontPutBack

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") DontPutBack
  + ### InheritColor

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritColor
  + ### InheritCondition

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritCondition
  + ### InheritEquipped

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritEquipped
  + ### InheritSharpness

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritSharpness
  + ### InheritHeadCondition

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritHeadCondition
  + ### MayDegrade

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") MayDegrade
  + ### MayDegradeLight

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") MayDegradeLight
  + ### MayDegradeVeryLight

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") MayDegradeVeryLight
  + ### MayDegradeHeavy

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") MayDegradeHeavy
  + ### SharpnessCheck

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") SharpnessCheck
  + ### InheritUses

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritUses
  + ### InheritUsesAndEmpty

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritUsesAndEmpty
  + ### InheritFood

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritFood
  + ### InheritFoodAge

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritFoodAge
  + ### InheritCooked

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritCooked
  + ### InheritModelVariation

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritModelVariation
  + ### InheritWeight

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritWeight
  + ### InheritName

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritName
  + ### InheritFreezingTime

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritFreezingTime
  + ### DontInheritCondition

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") DontInheritCondition
  + ### AllowFrozenItem

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") AllowFrozenItem
  + ### AllowRottenItem

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") AllowRottenItem
  + ### NoBrokenItems

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") NoBrokenItems
  + ### AllowDestroyedItem

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") AllowDestroyedItem
  + ### IsWorn

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsWorn
  + ### IsNotWorn

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsNotWorn
  + ### InheritAmmunition

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritAmmunition
  + ### CopyClothing

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") CopyClothing
  + ### AllowFavorite

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") AllowFavorite
  + ### InheritFavorite

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") InheritFavorite
  + ### FakeOutput

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") FakeOutput
  + ### DontReplace

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") DontReplace
  + ### CanBeDoneFromFloor

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") CanBeDoneFromFloor
  + ### ItemCount

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") ItemCount
  + ### IsExclusive

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsExclusive
  + ### RecordInput

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") RecordInput
  + ### DontRecordInput

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") DontRecordInput
  + ### ResearchInput

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") ResearchInput
  + ### IsBlunt

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsBlunt
  + ### HasOneUse

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") HasOneUse
  + ### HasNoUses

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") HasNoUses
  + ### IsSealed

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsSealed
  + ### IsNotSealed

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") IsNotSealed
  + ### Unseal

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") Unseal
  + ### EquipSecondary

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") EquipSecondary
  + ### SetActivated

    public static final [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") SetActivated
* Constructor Details
  -------------------

  + ### InputFlag

    private InputFlag()
* Method Details
  --------------

  + ### values

    public static [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [InputFlag](InputFlag.html "enum class in zombie.entity.components.crafting") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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