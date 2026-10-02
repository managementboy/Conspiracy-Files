[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [BentFences](BentFences.html)
3. [ThumpData](BentFences.ThumpData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [totalThumpers](#totalThumpers)
   2. [bendStage](#bendStage)
   3. [directionToBend](#directionToBend)
   4. [directionBent](#directionBent)
   5. [health](#health)
   6. [stages](#stages)
   7. [thumpersToDamage](#thumpersToDamage)
   8. [damageModifier](#damageModifier)
   9. [damageMultiplier](#damageMultiplier)
6. [Constructor Details](#constructor-detail)
   1. [ThumpData()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BentFences.ThumpData
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.BentFences.ThumpData

Enclosing class:
:   `BentFences`

---

public static final class BentFences.ThumpData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) int`

  `bendStage`

  `(package private) final float`

  `damageModifier`

  `(package private) float`

  `damageMultiplier`

  `(package private) IsoDirections`

  `directionBent`

  `(package private) IsoDirections`

  `directionToBend`

  `(package private) int`

  `health`

  `(package private) int`

  `stages`

  `(package private) int`

  `thumpersToDamage`

  `(package private) int`

  `totalThumpers`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ThumpData()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### totalThumpers

    int totalThumpers
  + ### bendStage

    int bendStage
  + ### directionToBend

    [IsoDirections](IsoDirections.html "enum class in zombie.iso") directionToBend
  + ### directionBent

    [IsoDirections](IsoDirections.html "enum class in zombie.iso") directionBent
  + ### health

    int health
  + ### stages

    int stages
  + ### thumpersToDamage

    int thumpersToDamage
  + ### damageModifier

    final float damageModifier

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.BentFences.ThumpData.damageModifier)
  + ### damageMultiplier

    float damageMultiplier
* Constructor Details
  -------------------

  + ### ThumpData

    public ThumpData()