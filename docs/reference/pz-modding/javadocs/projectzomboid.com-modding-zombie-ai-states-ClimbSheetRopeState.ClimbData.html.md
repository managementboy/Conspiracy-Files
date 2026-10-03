[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.states](package-summary.html)
2. [ClimbSheetRopeState](ClimbSheetRopeState.html)
3. [ClimbData](ClimbSheetRopeState.ClimbData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [targetClimbHeight](#targetClimbHeight)
   2. [fallChance](#fallChance)
   3. [idealx](#idealx)
   4. [idealy](#idealy)
   5. [targetFallHeight](#targetFallHeight)
   6. [climbTargetIsoObject](#climbTargetIsoObject)
   7. [targetGridSquare](#targetGridSquare)
   8. [exitBlocked](#exitBlocked)
6. [Constructor Details](#constructor-detail)
   1. [ClimbData()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimbSheetRopeState.ClimbData
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.states.ClimbSheetRopeState.ClimbData

Enclosing class:
:   `ClimbSheetRopeState`

---

public static class ClimbSheetRopeState.ClimbData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `IsoObject`

  `climbTargetIsoObject`

  `ClimbSheetRopeState.ClimbStatus`

  `exitBlocked`

  `float`

  `fallChance`

  `float`

  `idealx`

  `float`

  `idealy`

  `int`

  `targetClimbHeight`

  `float`

  `targetFallHeight`

  `IsoGridSquare`

  `targetGridSquare`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClimbData()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### targetClimbHeight

    public int targetClimbHeight
  + ### fallChance

    public float fallChance
  + ### idealx

    public float idealx
  + ### idealy

    public float idealy
  + ### targetFallHeight

    public float targetFallHeight
  + ### climbTargetIsoObject

    public [IsoObject](../../iso/IsoObject.html "class in zombie.iso") climbTargetIsoObject
  + ### targetGridSquare

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") targetGridSquare
  + ### exitBlocked

    public [ClimbSheetRopeState.ClimbStatus](ClimbSheetRopeState.ClimbStatus.html "enum class in zombie.ai.states") exitBlocked
* Constructor Details
  -------------------

  + ### ClimbData

    public ClimbData()