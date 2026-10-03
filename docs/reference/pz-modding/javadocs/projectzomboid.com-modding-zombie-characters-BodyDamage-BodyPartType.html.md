[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.BodyDamage](package-summary.html)
2. [BodyPartType](BodyPartType.html)

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
   18. [MAX](#MAX)
8. [Field Details](#field-detail)
   1. [values](#values)
   2. [name](#name)
   3. [painModifier](#painModifier)
   4. [displayNameKey](#displayNameKey)
   5. [damageModifier](#damageModifier)
   6. [bleedingTimeModifier](#bleedingTimeModifier)
   7. [skinSurface](#skinSurface)
   8. [distToCore](#distToCore)
   9. [umbrellaMod](#umbrellaMod)
   10. [maxActionPenalty](#maxActionPenalty)
   11. [maxMovementPenalty](#maxMovementPenalty)
   12. [bandageModel](#bandageModel)
   13. [biteWoundModel](#biteWoundModel)
   14. [scratchWoundModel](#scratchWoundModel)
   15. [cutWoundModel](#cutWoundModel)
9. [Constructor Details](#constructor-detail)
   1. [BodyPartType(String, String, String, String, String, String, float, float, float, float, float, float, float, float)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,float,float,float,float,float,float,float,float))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [FromIndex(int)](#FromIndex(int))
    4. [index()](#index())
    5. [FromString(String)](#FromString(java.lang.String))
    6. [getPainModifyer(int)](#getPainModifyer(int))
    7. [getDisplayName(BodyPartType)](#getDisplayName(zombie.characters.BodyDamage.BodyPartType))
    8. [ToIndex(BodyPartType)](#ToIndex(zombie.characters.BodyDamage.BodyPartType))
    9. [ToString(BodyPartType)](#ToString(zombie.characters.BodyDamage.BodyPartType))
    10. [getDamageModifyer(int)](#getDamageModifyer(int))
    11. [getBleedingTimeModifyer(int)](#getBleedingTimeModifyer(int))
    12. [GetSkinSurface(BodyPartType)](#GetSkinSurface(zombie.characters.BodyDamage.BodyPartType))
    13. [GetDistToCore(BodyPartType)](#GetDistToCore(zombie.characters.BodyDamage.BodyPartType))
    14. [GetUmbrellaMod(BodyPartType)](#GetUmbrellaMod(zombie.characters.BodyDamage.BodyPartType))
    15. [GetMaxActionPenalty(BodyPartType)](#GetMaxActionPenalty(zombie.characters.BodyDamage.BodyPartType))
    16. [GetMaxMovementPenalty(BodyPartType)](#GetMaxMovementPenalty(zombie.characters.BodyDamage.BodyPartType))
    17. [getBandageModel()](#getBandageModel())
    18. [getBiteWoundModel(CharacterGender)](#getBiteWoundModel(zombie.characters.CharacterGender))
    19. [getScratchWoundModel(CharacterGender)](#getScratchWoundModel(zombie.characters.CharacterGender))
    20. [getCutWoundModel(CharacterGender)](#getCutWoundModel(zombie.characters.CharacterGender))
    21. [getRandom()](#getRandom())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class BodyPartType
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage")>

zombie.characters.BodyDamage.BodyPartType

All Implemented Interfaces:
:   `Serializable, Comparable<BodyPartType>, Constable`

---

public enum BodyPartType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

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

  `private final String`

  `bandageModel`

  `private final String`

  `biteWoundModel`

  `private final float`

  `bleedingTimeModifier`

  `private final String`

  `cutWoundModel`

  `private final float`

  `damageModifier`

  `private final String`

  `displayNameKey`

  `private final float`

  `distToCore`

  `private final float`

  `maxActionPenalty`

  `private final float`

  `maxMovementPenalty`

  `private final String`

  `name`

  `private final float`

  `painModifier`

  `private final String`

  `scratchWoundModel`

  `private final float`

  `skinSurface`

  `private final float`

  `umbrellaMod`

  `private static final BodyPartType[]`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BodyPartType(String name,
  String displayNameKey,
  String bandageModel,
  String biteWoundModel,
  String scratchWoundModel,
  String cutWoundModel,
  float painModifier,
  float damageModifier,
  float bleedingTimeModifier,
  float skinSurface,
  float distToCore,
  float umbrellaMod,
  float maxActionPenalty,
  float maxMovementPenalty)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static BodyPartType`

  `FromIndex(int index)`

  `static BodyPartType`

  `FromString(String str)`

  `String`

  `getBandageModel()`

  `String`

  `getBiteWoundModel(zombie.characters.CharacterGender gender)`

  `static float`

  `getBleedingTimeModifyer(int index)`

  `String`

  `getCutWoundModel(zombie.characters.CharacterGender gender)`

  `static float`

  `getDamageModifyer(int index)`

  `static String`

  `getDisplayName(BodyPartType bpt)`

  `static float`

  `GetDistToCore(BodyPartType bodyPartType)`

  `static float`

  `GetMaxActionPenalty(BodyPartType bodyPartType)`

  `static float`

  `GetMaxMovementPenalty(BodyPartType bodyPartType)`

  `static float`

  `getPainModifyer(int index)`

  `static BodyPartType`

  `getRandom()`

  `String`

  `getScratchWoundModel(zombie.characters.CharacterGender gender)`

  `static float`

  `GetSkinSurface(BodyPartType bodyPartType)`

  `static float`

  `GetUmbrellaMod(BodyPartType bodyPartType)`

  `int`

  `index()`

  `static int`

  `ToIndex(BodyPartType bpt)`

  `static String`

  `ToString(BodyPartType bpt)`

  `static BodyPartType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static BodyPartType[]`

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

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") Hand\_L
  + ### Hand\_R

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") Hand\_R
  + ### ForeArm\_L

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") ForeArm\_L
  + ### ForeArm\_R

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") ForeArm\_R
  + ### UpperArm\_L

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") UpperArm\_L
  + ### UpperArm\_R

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") UpperArm\_R
  + ### Torso\_Upper

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") Torso\_Upper
  + ### Torso\_Lower

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") Torso\_Lower
  + ### Head

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") Head
  + ### Neck

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") Neck
  + ### Groin

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") Groin
  + ### UpperLeg\_L

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") UpperLeg\_L
  + ### UpperLeg\_R

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") UpperLeg\_R
  + ### LowerLeg\_L

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") LowerLeg\_L
  + ### LowerLeg\_R

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") LowerLeg\_R
  + ### Foot\_L

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") Foot\_L
  + ### Foot\_R

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") Foot\_R
  + ### MAX

    public static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") MAX
* Field Details
  -------------

  + ### values

    private static final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage")[] values
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### painModifier

    private final float painModifier
  + ### displayNameKey

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayNameKey
  + ### damageModifier

    private final float damageModifier
  + ### bleedingTimeModifier

    private final float bleedingTimeModifier
  + ### skinSurface

    private final float skinSurface
  + ### distToCore

    private final float distToCore
  + ### umbrellaMod

    private final float umbrellaMod
  + ### maxActionPenalty

    private final float maxActionPenalty
  + ### maxMovementPenalty

    private final float maxMovementPenalty
  + ### bandageModel

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bandageModel
  + ### biteWoundModel

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") biteWoundModel
  + ### scratchWoundModel

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scratchWoundModel
  + ### cutWoundModel

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cutWoundModel
* Constructor Details
  -------------------

  + ### BodyPartType

    private BodyPartType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayNameKey,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bandageModel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") biteWoundModel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scratchWoundModel,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cutWoundModel,
    float painModifier,
    float damageModifier,
    float bleedingTimeModifier,
    float skinSurface,
    float distToCore,
    float umbrellaMod,
    float maxActionPenalty,
    float maxMovementPenalty)
* Method Details
  --------------

  + ### values

    public static [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### FromIndex

    public static [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") FromIndex(int index)
  + ### index

    public int index()
  + ### FromString

    public static [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") FromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getPainModifyer

    public static float getPainModifyer(int index)
  + ### getDisplayName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bpt)
  + ### ToIndex

    public static int ToIndex([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bpt)
  + ### ToString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ToString([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bpt)
  + ### getDamageModifyer

    public static float getDamageModifyer(int index)
  + ### getBleedingTimeModifyer

    public static float getBleedingTimeModifyer(int index)
  + ### GetSkinSurface

    public static float GetSkinSurface([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPartType)
  + ### GetDistToCore

    public static float GetDistToCore([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPartType)
  + ### GetUmbrellaMod

    public static float GetUmbrellaMod([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPartType)
  + ### GetMaxActionPenalty

    public static float GetMaxActionPenalty([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPartType)
  + ### GetMaxMovementPenalty

    public static float GetMaxMovementPenalty([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPartType)
  + ### getBandageModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBandageModel()
  + ### getBiteWoundModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBiteWoundModel(zombie.characters.CharacterGender gender)
  + ### getScratchWoundModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getScratchWoundModel(zombie.characters.CharacterGender gender)
  + ### getCutWoundModel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCutWoundModel(zombie.characters.CharacterGender gender)
  + ### getRandom

    public static [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") getRandom()