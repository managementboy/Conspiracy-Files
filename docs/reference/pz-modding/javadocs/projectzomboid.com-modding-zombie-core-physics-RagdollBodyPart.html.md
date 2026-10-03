[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.physics](package-summary.html)
2. [RagdollBodyPart](RagdollBodyPart.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [BODYPART\_PELVIS](#BODYPART_PELVIS)
   2. [BODYPART\_SPINE](#BODYPART_SPINE)
   3. [BODYPART\_HEAD](#BODYPART_HEAD)
   4. [BODYPART\_LEFT\_UPPER\_LEG](#BODYPART_LEFT_UPPER_LEG)
   5. [BODYPART\_LEFT\_LOWER\_LEG](#BODYPART_LEFT_LOWER_LEG)
   6. [BODYPART\_RIGHT\_UPPER\_LEG](#BODYPART_RIGHT_UPPER_LEG)
   7. [BODYPART\_RIGHT\_LOWER\_LEG](#BODYPART_RIGHT_LOWER_LEG)
   8. [BODYPART\_LEFT\_UPPER\_ARM](#BODYPART_LEFT_UPPER_ARM)
   9. [BODYPART\_LEFT\_LOWER\_ARM](#BODYPART_LEFT_LOWER_ARM)
   10. [BODYPART\_RIGHT\_UPPER\_ARM](#BODYPART_RIGHT_UPPER_ARM)
   11. [BODYPART\_RIGHT\_LOWER\_ARM](#BODYPART_RIGHT_LOWER_ARM)
   12. [BODYPART\_COUNT](#BODYPART_COUNT)
8. [Field Details](#field-detail)
   1. [VALUES](#VALUES)
   2. [RANDOM\_BOUND](#RANDOM_BOUND)
   3. [RANDOM](#RANDOM)
9. [Constructor Details](#constructor-detail)
   1. [RagdollBodyPart()](#%3Cinit%3E())
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getRandomPart()](#getRandomPart())
    4. [isHead(int)](#isHead(int))
    5. [isLeg(int)](#isLeg(int))
    6. [isArm(int)](#isArm(int))
    7. [getBodyPartType(int)](#getBodyPartType(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class RagdollBodyPart
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics")>

zombie.core.physics.RagdollBodyPart

All Implemented Interfaces:
:   `Serializable, Comparable<RagdollBodyPart>, Constable`

---

public enum RagdollBodyPart
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `BODYPART_COUNT`

  `BODYPART_HEAD`

  `BODYPART_LEFT_LOWER_ARM`

  `BODYPART_LEFT_LOWER_LEG`

  `BODYPART_LEFT_UPPER_ARM`

  `BODYPART_LEFT_UPPER_LEG`

  `BODYPART_PELVIS`

  `BODYPART_RIGHT_LOWER_ARM`

  `BODYPART_RIGHT_LOWER_LEG`

  `BODYPART_RIGHT_UPPER_ARM`

  `BODYPART_RIGHT_UPPER_LEG`

  `BODYPART_SPINE`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final org.joml.Random`

  `RANDOM`

  `private static final int`

  `RANDOM_BOUND`

  `private static final RagdollBodyPart[]`

  `VALUES`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `RagdollBodyPart()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static int`

  `getBodyPartType(int value)`

  `static RagdollBodyPart`

  `getRandomPart()`

  `static boolean`

  `isArm(int value)`

  `static boolean`

  `isHead(int value)`

  `static boolean`

  `isLeg(int value)`

  `static RagdollBodyPart`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static RagdollBodyPart[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### BODYPART\_PELVIS

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_PELVIS
  + ### BODYPART\_SPINE

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_SPINE
  + ### BODYPART\_HEAD

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_HEAD
  + ### BODYPART\_LEFT\_UPPER\_LEG

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_LEFT\_UPPER\_LEG
  + ### BODYPART\_LEFT\_LOWER\_LEG

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_LEFT\_LOWER\_LEG
  + ### BODYPART\_RIGHT\_UPPER\_LEG

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_RIGHT\_UPPER\_LEG
  + ### BODYPART\_RIGHT\_LOWER\_LEG

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_RIGHT\_LOWER\_LEG
  + ### BODYPART\_LEFT\_UPPER\_ARM

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_LEFT\_UPPER\_ARM
  + ### BODYPART\_LEFT\_LOWER\_ARM

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_LEFT\_LOWER\_ARM
  + ### BODYPART\_RIGHT\_UPPER\_ARM

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_RIGHT\_UPPER\_ARM
  + ### BODYPART\_RIGHT\_LOWER\_ARM

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_RIGHT\_LOWER\_ARM
  + ### BODYPART\_COUNT

    public static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") BODYPART\_COUNT
* Field Details
  -------------

  + ### VALUES

    private static final [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics")[] VALUES
  + ### RANDOM\_BOUND

    private static final int RANDOM\_BOUND
  + ### RANDOM

    private static final org.joml.Random RANDOM
* Constructor Details
  -------------------

  + ### RagdollBodyPart

    private RagdollBodyPart()
* Method Details
  --------------

  + ### values

    public static [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getRandomPart

    public static [RagdollBodyPart](RagdollBodyPart.html "enum class in zombie.core.physics") getRandomPart()
  + ### isHead

    public static boolean isHead(int value)
  + ### isLeg

    public static boolean isLeg(int value)
  + ### isArm

    public static boolean isArm(int value)
  + ### getBodyPartType

    public static int getBodyPartType(int value)