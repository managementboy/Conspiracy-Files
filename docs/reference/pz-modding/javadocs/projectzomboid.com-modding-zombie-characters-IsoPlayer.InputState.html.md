[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoPlayer](IsoPlayer.html)
3. [InputState](IsoPlayer.InputState.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [melee](#melee)
   2. [grapple](#grapple)
   3. [isAttacking](#isAttacking)
   4. [movementRate](#movementRate)
   5. [sprinting](#sprinting)
   6. [isAiming](#isAiming)
   7. [isCharging](#isCharging)
   8. [isChargingLt](#isChargingLt)
6. [Constructor Details](#constructor-detail)
   1. [InputState()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [isMoving()](#isMoving())
   3. [isRunning()](#isRunning())
   4. [isWalking()](#isWalking())
   5. [setRunning(boolean)](#setRunning(boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoPlayer.InputState
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoPlayer.InputState

Enclosing class:
:   `IsoPlayer`

---

public static class IsoPlayer.InputState
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `grapple`

  `boolean`

  `isAiming`

  `boolean`

  `isAttacking`

  `boolean`

  `isCharging`

  `boolean`

  `isChargingLt`

  `boolean`

  `melee`

  `float`

  `movementRate`

  `boolean`

  `sprinting`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `InputState()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `isMoving()`

  `boolean`

  `isRunning()`

  `boolean`

  `isWalking()`

  `void`

  `reset()`

  `void`

  `setRunning(boolean isRunning)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### melee

    public boolean melee
  + ### grapple

    public boolean grapple
  + ### isAttacking

    public boolean isAttacking
  + ### movementRate

    public float movementRate
  + ### sprinting

    public boolean sprinting
  + ### isAiming

    public boolean isAiming
  + ### isCharging

    public boolean isCharging
  + ### isChargingLt

    public boolean isChargingLt
* Constructor Details
  -------------------

  + ### InputState

    public InputState()
* Method Details
  --------------

  + ### reset

    public void reset()
  + ### isMoving

    public boolean isMoving()
  + ### isRunning

    public boolean isRunning()
  + ### isWalking

    public boolean isWalking()
  + ### setRunning

    public void setRunning(boolean isRunning)