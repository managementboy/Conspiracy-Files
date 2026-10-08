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
3. [VehicleHitDamageConstants](IsoPlayer.VehicleHitDamageConstants.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [MIN\_BODY\_PARTS\_DAMAGED](#MIN_BODY_PARTS_DAMAGED)
   2. [BODY\_PART\_DAMAGE\_FACTOR](#BODY_PART_DAMAGE_FACTOR)
   3. [DAMAGE\_RANDOM\_RANGE](#DAMAGE_RANDOM_RANGE)
   4. [DAMAGE\_MINIMUM](#DAMAGE_MINIMUM)
   5. [FAST\_HEALER\_MODIFIER](#FAST_HEALER_MODIFIER)
   6. [SLOW\_HEALER\_MODIFIER](#SLOW_HEALER_MODIFIER)
   7. [DAMAGE\_BALANCE\_FACTOR](#DAMAGE_BALANCE_FACTOR)
   8. [DEEP\_WOUND\_THRESHOLD](#DEEP_WOUND_THRESHOLD)
   9. [DEEP\_WOUND\_CHANCE](#DEEP_WOUND_CHANCE)
   10. [FRACTURE\_DAMAGE\_THRESHOLD](#FRACTURE_DAMAGE_THRESHOLD)
   11. [FRACTURE\_DAMAGE\_THRESHOLD\_HEAD](#FRACTURE_DAMAGE_THRESHOLD_HEAD)
   12. [FRACTURE\_DAMAGE\_THRESHOLD\_GROIN](#FRACTURE_DAMAGE_THRESHOLD_GROIN)
   13. [FRACTURE\_CHANCE\_PERCENT](#FRACTURE_CHANCE_PERCENT)
   14. [FRACTURE\_CHANCE\_PERCENT\_HEAD](#FRACTURE_CHANCE_PERCENT_HEAD)
   15. [FRACTURE\_CHANCE\_PERCENT\_GROIN](#FRACTURE_CHANCE_PERCENT_GROIN)
   16. [FRACTURE\_TIME\_MIN](#FRACTURE_TIME_MIN)
   17. [FRACTURE\_TIME\_MIN\_MAX](#FRACTURE_TIME_MIN_MAX)
   18. [FRACTURE\_TIME\_MAX](#FRACTURE_TIME_MAX)
   19. [FRACTURE\_TIME\_MAX\_MAX](#FRACTURE_TIME_MAX_MAX)
   20. [FRACTURE\_TIME\_MIN\_GROIN](#FRACTURE_TIME_MIN_GROIN)
   21. [FRACTURE\_TIME\_MIN\_GROIN\_MAX](#FRACTURE_TIME_MIN_GROIN_MAX)
   22. [FRACTURE\_TIME\_MAX\_GROIN](#FRACTURE_TIME_MAX_GROIN)
   23. [FRACTURE\_TIME\_MAX\_GROIN\_MAX](#FRACTURE_TIME_MAX_GROIN_MAX)
6. [Constructor Details](#constructor-detail)
   1. [VehicleHitDamageConstants()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [generateFractureTime(float)](#generateFractureTime(float))
   2. [generateFractureTimeGroin(float)](#generateFractureTimeGroin(float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoPlayer.VehicleHitDamageConstants
=========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoPlayer.VehicleHitDamageConstants

Enclosing class:
:   `IsoPlayer`

---

static final class IsoPlayer.VehicleHitDamageConstants
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) static final float`

  `BODY_PART_DAMAGE_FACTOR`

  `(package private) static final float`

  `DAMAGE_BALANCE_FACTOR`

  `(package private) static final float`

  `DAMAGE_MINIMUM`

  `(package private) static final float`

  `DAMAGE_RANDOM_RANGE`

  `(package private) static final int`

  `DEEP_WOUND_CHANCE`

  `(package private) static final float`

  `DEEP_WOUND_THRESHOLD`

  `(package private) static final float`

  `FAST_HEALER_MODIFIER`

  `(package private) static final int`

  `FRACTURE_CHANCE_PERCENT`

  `(package private) static final int`

  `FRACTURE_CHANCE_PERCENT_GROIN`

  `(package private) static final int`

  `FRACTURE_CHANCE_PERCENT_HEAD`

  `(package private) static final float`

  `FRACTURE_DAMAGE_THRESHOLD`

  `(package private) static final float`

  `FRACTURE_DAMAGE_THRESHOLD_GROIN`

  `(package private) static final float`

  `FRACTURE_DAMAGE_THRESHOLD_HEAD`

  `(package private) static final float`

  `FRACTURE_TIME_MAX`

  `(package private) static final float`

  `FRACTURE_TIME_MAX_GROIN`

  `(package private) static final float`

  `FRACTURE_TIME_MAX_GROIN_MAX`

  `(package private) static final float`

  `FRACTURE_TIME_MAX_MAX`

  `(package private) static final float`

  `FRACTURE_TIME_MIN`

  `(package private) static final float`

  `FRACTURE_TIME_MIN_GROIN`

  `(package private) static final float`

  `FRACTURE_TIME_MIN_GROIN_MAX`

  `(package private) static final float`

  `FRACTURE_TIME_MIN_MAX`

  `(package private) static final int`

  `MIN_BODY_PARTS_DAMAGED`

  `(package private) static final float`

  `SLOW_HEALER_MODIFIER`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehicleHitDamageConstants()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static float`

  `generateFractureTime(float realDamage)`

  `static float`

  `generateFractureTimeGroin(float realDamage)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### MIN\_BODY\_PARTS\_DAMAGED

    static final int MIN\_BODY\_PARTS\_DAMAGED

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.MIN_BODY_PARTS_DAMAGED)
  + ### BODY\_PART\_DAMAGE\_FACTOR

    static final float BODY\_PART\_DAMAGE\_FACTOR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.BODY_PART_DAMAGE_FACTOR)
  + ### DAMAGE\_RANDOM\_RANGE

    static final float DAMAGE\_RANDOM\_RANGE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.DAMAGE_RANDOM_RANGE)
  + ### DAMAGE\_MINIMUM

    static final float DAMAGE\_MINIMUM

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.DAMAGE_MINIMUM)
  + ### FAST\_HEALER\_MODIFIER

    static final float FAST\_HEALER\_MODIFIER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FAST_HEALER_MODIFIER)
  + ### SLOW\_HEALER\_MODIFIER

    static final float SLOW\_HEALER\_MODIFIER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.SLOW_HEALER_MODIFIER)
  + ### DAMAGE\_BALANCE\_FACTOR

    static final float DAMAGE\_BALANCE\_FACTOR

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.DAMAGE_BALANCE_FACTOR)
  + ### DEEP\_WOUND\_THRESHOLD

    static final float DEEP\_WOUND\_THRESHOLD

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.DEEP_WOUND_THRESHOLD)
  + ### DEEP\_WOUND\_CHANCE

    static final int DEEP\_WOUND\_CHANCE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.DEEP_WOUND_CHANCE)
  + ### FRACTURE\_DAMAGE\_THRESHOLD

    static final float FRACTURE\_DAMAGE\_THRESHOLD

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_DAMAGE_THRESHOLD)
  + ### FRACTURE\_DAMAGE\_THRESHOLD\_HEAD

    static final float FRACTURE\_DAMAGE\_THRESHOLD\_HEAD

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_DAMAGE_THRESHOLD_HEAD)
  + ### FRACTURE\_DAMAGE\_THRESHOLD\_GROIN

    static final float FRACTURE\_DAMAGE\_THRESHOLD\_GROIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_DAMAGE_THRESHOLD_GROIN)
  + ### FRACTURE\_CHANCE\_PERCENT

    static final int FRACTURE\_CHANCE\_PERCENT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_CHANCE_PERCENT)
  + ### FRACTURE\_CHANCE\_PERCENT\_HEAD

    static final int FRACTURE\_CHANCE\_PERCENT\_HEAD

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_CHANCE_PERCENT_HEAD)
  + ### FRACTURE\_CHANCE\_PERCENT\_GROIN

    static final int FRACTURE\_CHANCE\_PERCENT\_GROIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_CHANCE_PERCENT_GROIN)
  + ### FRACTURE\_TIME\_MIN

    static final float FRACTURE\_TIME\_MIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_TIME_MIN)
  + ### FRACTURE\_TIME\_MIN\_MAX

    static final float FRACTURE\_TIME\_MIN\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_TIME_MIN_MAX)
  + ### FRACTURE\_TIME\_MAX

    static final float FRACTURE\_TIME\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_TIME_MAX)
  + ### FRACTURE\_TIME\_MAX\_MAX

    static final float FRACTURE\_TIME\_MAX\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_TIME_MAX_MAX)
  + ### FRACTURE\_TIME\_MIN\_GROIN

    static final float FRACTURE\_TIME\_MIN\_GROIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_TIME_MIN_GROIN)
  + ### FRACTURE\_TIME\_MIN\_GROIN\_MAX

    static final float FRACTURE\_TIME\_MIN\_GROIN\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_TIME_MIN_GROIN_MAX)
  + ### FRACTURE\_TIME\_MAX\_GROIN

    static final float FRACTURE\_TIME\_MAX\_GROIN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_TIME_MAX_GROIN)
  + ### FRACTURE\_TIME\_MAX\_GROIN\_MAX

    static final float FRACTURE\_TIME\_MAX\_GROIN\_MAX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.IsoPlayer.VehicleHitDamageConstants.FRACTURE_TIME_MAX_GROIN_MAX)
* Constructor Details
  -------------------

  + ### VehicleHitDamageConstants

    VehicleHitDamageConstants()
* Method Details
  --------------

  + ### generateFractureTime

    public static float generateFractureTime(float realDamage)
  + ### generateFractureTimeGroin

    public static float generateFractureTimeGroin(float realDamage)