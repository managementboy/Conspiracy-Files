[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.BodyDamage](package-summary.html)
2. [Fitness](Fitness.html)
3. [FitnessExercise](Fitness.FitnessExercise.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [type](#type)
   2. [metabolics](#metabolics)
   3. [stiffnessInc](#stiffnessInc)
   4. [xpModifier](#xpModifier)
6. [Constructor Details](#constructor-detail)
   1. [FitnessExercise(KahluaTableImpl)](#%3Cinit%3E(se.krka.kahlua.j2se.KahluaTableImpl))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Fitness.FitnessExercise
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BodyDamage.Fitness.FitnessExercise

Enclosing class:
:   `Fitness`

---

public static final class Fitness.FitnessExercise
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

Contains information on exercises, including metabolics, xp modifiers and bodyparts effected.
These are read from `media/lua/shared/Definitions/FitnessExercises.lua`

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) Metabolics`

  `metabolics`

  `(package private) ArrayList<String>`

  `stiffnessInc`

  `(package private) String`

  `type`

  `(package private) float`

  `xpModifier`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FitnessExercise(se.krka.kahlua.j2se.KahluaTableImpl exeDatas)`

  Creates the Exercise info from the lua table.
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### type

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### metabolics

    [Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") metabolics
  + ### stiffnessInc

    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> stiffnessInc
  + ### xpModifier

    float xpModifier
* Constructor Details
  -------------------

  + ### FitnessExercise

    public FitnessExercise(se.krka.kahlua.j2se.KahluaTableImpl exeDatas)

    Creates the Exercise info from the lua table.
    These are read from `media/lua/shared/Definitions/FitnessExercises.lua`

    Parameters:
    :   `exeDatas` - the table to read from

    See Also:
    :   - [`Fitness.init()`](Fitness.html#init())