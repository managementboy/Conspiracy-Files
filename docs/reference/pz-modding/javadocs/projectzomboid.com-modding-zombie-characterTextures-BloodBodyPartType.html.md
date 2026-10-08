[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characterTextures](package-summary.html)
2. [BloodBodyPartType](BloodBodyPartType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Hand\_L](#Hand_L)
   2. [Hand\_R](#Hand_R)
   3. [ForeArm\_L](#ForeArm_L)
   4. [ForeArm\_R](#ForeArm_R)
   5. [UpperArm\_L](#UpperArm_L)
   6. [UpperArm\_R](#UpperArm_R)
   7. [Torso\_Upper](#Torso_Upper)
   8. [Torso\_Lower](#Torso_Lower)
   9. [Head](#Head)
   10. [Neck](#Neck)
   11. [Groin](#Groin)
   12. [UpperLeg\_L](#UpperLeg_L)
   13. [UpperLeg\_R](#UpperLeg_R)
   14. [LowerLeg\_L](#LowerLeg_L)
   15. [LowerLeg\_R](#LowerLeg_R)
   16. [Foot\_L](#Foot_L)
   17. [Foot\_R](#Foot_R)
   18. [Back](#Back)
   19. [MAX](#MAX)
8. [Field Details](#field-detail)
   1. [VALUES](#VALUES)
   2. [BY\_NAME](#BY_NAME)
   3. [translationKey](#translationKey)
   4. [characterMaskParts](#characterMaskParts)
9. [Constructor Details](#constructor-detail)
   1. [BloodBodyPartType(String, CharacterMask.Part...)](#%3Cinit%3E(java.lang.String,zombie.core.skinnedmodel.model.CharacterMask.Part...))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [index()](#index())
    4. [FromIndex(int)](#FromIndex(int))
    5. [ToIndex(BloodBodyPartType)](#ToIndex(zombie.characterTextures.BloodBodyPartType))
    6. [FromString(String)](#FromString(java.lang.String))
    7. [getCharacterMaskParts()](#getCharacterMaskParts())
    8. [getDisplayName()](#getDisplayName())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class BloodBodyPartType
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")>

zombie.characterTextures.BloodBodyPartType

All Implemented Interfaces:
:   `Serializable, Comparable<BloodBodyPartType>, Constable`

---

public enum BloodBodyPartType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Back`

  `Foot_L`

  `Foot_R`

  `ForeArm_L`

  `ForeArm_R`

  `Groin`

  `Hand_L`

  `Hand_R`

  `Head`

  `LowerLeg_L`

  `LowerLeg_R`

  `MAX`

  `Neck`

  `Torso_Lower`

  `Torso_Upper`

  `UpperArm_L`

  `UpperArm_R`

  `UpperLeg_L`

  `UpperLeg_R`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Map<String, BloodBodyPartType>`

  `BY_NAME`

  `private final zombie.core.skinnedmodel.model.CharacterMask.Part[]`

  `characterMaskParts`

  `private final String`

  `translationKey`

  `private static final BloodBodyPartType[]`

  `VALUES`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BloodBodyPartType(String translationKey,
  zombie.core.skinnedmodel.model.CharacterMask.Part... parts)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static BloodBodyPartType`

  `FromIndex(int index)`

  `static BloodBodyPartType`

  `FromString(String str)`

  `zombie.core.skinnedmodel.model.CharacterMask.Part[]`

  `getCharacterMaskParts()`

  `String`

  `getDisplayName()`

  `int`

  `index()`

  `static int`

  `ToIndex(BloodBodyPartType bpt)`

  `static BloodBodyPartType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static BloodBodyPartType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Hand\_L

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Hand\_L
  + ### Hand\_R

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Hand\_R
  + ### ForeArm\_L

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") ForeArm\_L
  + ### ForeArm\_R

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") ForeArm\_R
  + ### UpperArm\_L

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") UpperArm\_L
  + ### UpperArm\_R

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") UpperArm\_R
  + ### Torso\_Upper

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Torso\_Upper
  + ### Torso\_Lower

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Torso\_Lower
  + ### Head

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Head
  + ### Neck

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Neck
  + ### Groin

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Groin
  + ### UpperLeg\_L

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") UpperLeg\_L
  + ### UpperLeg\_R

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") UpperLeg\_R
  + ### LowerLeg\_L

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") LowerLeg\_L
  + ### LowerLeg\_R

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") LowerLeg\_R
  + ### Foot\_L

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Foot\_L
  + ### Foot\_R

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Foot\_R
  + ### Back

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") Back
  + ### MAX

    public static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") MAX
* Field Details
  -------------

  + ### VALUES

    private static final [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")[] VALUES
  + ### BY\_NAME

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")> BY\_NAME
  + ### translationKey

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationKey
  + ### characterMaskParts

    private final zombie.core.skinnedmodel.model.CharacterMask.Part[] characterMaskParts
* Constructor Details
  -------------------

  + ### BloodBodyPartType

    private BloodBodyPartType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationKey,
    zombie.core.skinnedmodel.model.CharacterMask.Part... parts)
* Method Details
  --------------

  + ### values

    public static [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### index

    public int index()
  + ### FromIndex

    public static [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") FromIndex(int index)
  + ### ToIndex

    public static int ToIndex([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") bpt)
  + ### FromString

    public static [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") FromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getCharacterMaskParts

    public zombie.core.skinnedmodel.model.CharacterMask.Part[] getCharacterMaskParts()
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()