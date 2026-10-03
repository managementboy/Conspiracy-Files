[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [BaseVehicle](BaseVehicle.html)
3. [HitVars](BaseVehicle.HitVars.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [speedCap](#speedCap)
   2. [velocity](#velocity)
   3. [collision](#collision)
   4. [isPushedBack](#isPushedBack)
   5. [damageToPedestrian](#damageToPedestrian)
   6. [dot](#dot)
   7. [vehicleImpulse](#vehicleImpulse)
   8. [vehicleSpeed](#vehicleSpeed)
   9. [targetImpulse](#targetImpulse)
   10. [isTargetHitFromBehind](#isTargetHitFromBehind)
   11. [hitFromSide](#hitFromSide)
   12. [hitSpeed](#hitSpeed)
   13. [isAnimalHit](#isAnimalHit)
6. [Constructor Details](#constructor-detail)
   1. [HitVars()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [calc(IsoGameCharacter, BaseVehicle)](#calc(zombie.characters.IsoGameCharacter,zombie.vehicles.BaseVehicle))
   2. [anyDamage()](#anyDamage())
   3. [isAnimalHit()](#isAnimalHit())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseVehicle.HitVars
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.BaseVehicle.HitVars

Enclosing class:
:   `BaseVehicle`

---

public static class BaseVehicle.HitVars
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final Vector2`

  `collision`

  `float`

  `damageToPedestrian`

  `private float`

  `dot`

  `zombie.characters.Side`

  `hitFromSide`

  `float`

  `hitSpeed`

  `private boolean`

  `isAnimalHit`

  `boolean`

  `isPushedBack`

  `boolean`

  `isTargetHitFromBehind`

  `private static final float`

  `speedCap`

  `final Vector3f`

  `targetImpulse`

  `protected float`

  `vehicleImpulse`

  `protected float`

  `vehicleSpeed`

  `private final Vector3f`

  `velocity`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `HitVars()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `anyDamage()`

  `void`

  `calc(IsoGameCharacter target,
  BaseVehicle vehicle)`

  `boolean`

  `isAnimalHit()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### speedCap

    private static final float speedCap

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.BaseVehicle.HitVars.speedCap)
  + ### velocity

    private final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") velocity
  + ### collision

    public final [Vector2](../iso/Vector2.html "class in zombie.iso") collision
  + ### isPushedBack

    public boolean isPushedBack
  + ### damageToPedestrian

    public float damageToPedestrian
  + ### dot

    private float dot
  + ### vehicleImpulse

    protected float vehicleImpulse
  + ### vehicleSpeed

    protected float vehicleSpeed
  + ### targetImpulse

    public final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") targetImpulse
  + ### isTargetHitFromBehind

    public boolean isTargetHitFromBehind
  + ### hitFromSide

    public zombie.characters.Side hitFromSide
  + ### hitSpeed

    public float hitSpeed
  + ### isAnimalHit

    private boolean isAnimalHit
* Constructor Details
  -------------------

  + ### HitVars

    public HitVars()
* Method Details
  --------------

  + ### calc

    public void calc([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") target,
    [BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### anyDamage

    public boolean anyDamage()
  + ### isAnimalHit

    public boolean isAnimalHit()