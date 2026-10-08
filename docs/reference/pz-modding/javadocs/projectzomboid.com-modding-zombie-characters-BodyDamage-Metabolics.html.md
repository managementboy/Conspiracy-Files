[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.BodyDamage](package-summary.html)
2. [Metabolics](Metabolics.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Sleeping](#Sleeping)
   2. [SeatedResting](#SeatedResting)
   3. [StandingAtRest](#StandingAtRest)
   4. [SedentaryActivity](#SedentaryActivity)
   5. [Default](#Default)
   6. [DrivingCar](#DrivingCar)
   7. [LightDomestic](#LightDomestic)
   8. [HeavyDomestic](#HeavyDomestic)
   9. [DefaultExercise](#DefaultExercise)
   10. [UsingTools](#UsingTools)
   11. [LightWork](#LightWork)
   12. [MediumWork](#MediumWork)
   13. [DiggingSpade](#DiggingSpade)
   14. [HeavyWork](#HeavyWork)
   15. [ForestryAxe](#ForestryAxe)
   16. [Walking2kmh](#Walking2kmh)
   17. [Walking5kmh](#Walking5kmh)
   18. [Running10kmh](#Running10kmh)
   19. [Running15kmh](#Running15kmh)
   20. [JumpFence](#JumpFence)
   21. [ClimbRope](#ClimbRope)
   22. [Fitness](#Fitness)
   23. [FitnessHeavy](#FitnessHeavy)
   24. [MAX](#MAX)
8. [Field Details](#field-detail)
   1. [met](#met)
9. [Constructor Details](#constructor-detail)
   1. [Metabolics(float)](#%3Cinit%3E(float))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getMet()](#getMet())
    4. [getWm2()](#getWm2())
    5. [getW()](#getW())
    6. [getBtuHr()](#getBtuHr())
    7. [MetToWm2(float)](#MetToWm2(float))
    8. [MetToW(float)](#MetToW(float))
    9. [MetToBtuHr(float)](#MetToBtuHr(float))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class Metabolics
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage")>

zombie.characters.BodyDamage.Metabolics

All Implemented Interfaces:
:   `Serializable, Comparable<Metabolics>, Constable`

---

public enum Metabolics
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ClimbRope`

  `Default`

  `DefaultExercise`

  `DiggingSpade`

  `DrivingCar`

  `Fitness`

  `FitnessHeavy`

  `ForestryAxe`

  `HeavyDomestic`

  `HeavyWork`

  `JumpFence`

  `LightDomestic`

  `LightWork`

  `MAX`

  `MediumWork`

  `Running10kmh`

  `Running15kmh`

  `SeatedResting`

  `SedentaryActivity`

  `Sleeping`

  `StandingAtRest`

  `UsingTools`

  `Walking2kmh`

  `Walking5kmh`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final float`

  `met`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Metabolics(float met)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getBtuHr()`

  `float`

  `getMet()`

  `float`

  `getW()`

  `float`

  `getWm2()`

  `static float`

  `MetToBtuHr(float met)`

  `static float`

  `MetToW(float met)`

  `static float`

  `MetToWm2(float met)`

  `static Metabolics`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static Metabolics[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Sleeping

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") Sleeping
  + ### SeatedResting

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") SeatedResting
  + ### StandingAtRest

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") StandingAtRest
  + ### SedentaryActivity

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") SedentaryActivity
  + ### Default

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") Default
  + ### DrivingCar

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") DrivingCar
  + ### LightDomestic

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") LightDomestic
  + ### HeavyDomestic

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") HeavyDomestic
  + ### DefaultExercise

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") DefaultExercise
  + ### UsingTools

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") UsingTools
  + ### LightWork

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") LightWork
  + ### MediumWork

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") MediumWork
  + ### DiggingSpade

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") DiggingSpade
  + ### HeavyWork

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") HeavyWork
  + ### ForestryAxe

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") ForestryAxe
  + ### Walking2kmh

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") Walking2kmh
  + ### Walking5kmh

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") Walking5kmh
  + ### Running10kmh

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") Running10kmh
  + ### Running15kmh

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") Running15kmh
  + ### JumpFence

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") JumpFence
  + ### ClimbRope

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") ClimbRope
  + ### Fitness

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") Fitness
  + ### FitnessHeavy

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") FitnessHeavy
  + ### MAX

    public static final [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") MAX
* Field Details
  -------------

  + ### met

    private final float met
* Constructor Details
  -------------------

  + ### Metabolics

    private Metabolics(float met)
* Method Details
  --------------

  + ### values

    public static [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getMet

    public float getMet()
  + ### getWm2

    public float getWm2()
  + ### getW

    public float getW()
  + ### getBtuHr

    public float getBtuHr()
  + ### MetToWm2

    public static float MetToWm2(float met)
  + ### MetToW

    public static float MetToW(float met)
  + ### MetToBtuHr

    public static float MetToBtuHr(float met)