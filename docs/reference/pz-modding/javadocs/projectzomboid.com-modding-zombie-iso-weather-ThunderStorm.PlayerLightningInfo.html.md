[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ThunderStorm](ThunderStorm.html)
3. [PlayerLightningInfo](ThunderStorm.PlayerLightningInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [lightningState](#lightningState)
   2. [timer](#timer)
   3. [lightningStrength](#lightningStrength)
   4. [lightningMod](#lightningMod)
   5. [lightningColor](#lightningColor)
   6. [outColor](#outColor)
   7. [x](#x)
   8. [y](#y)
   9. [distance](#distance)
6. [Constructor Details](#constructor-detail)
   1. [PlayerLightningInfo()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ThunderStorm.PlayerLightningInfo
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ThunderStorm.PlayerLightningInfo

Enclosing class:
:   `ThunderStorm`

---

private class ThunderStorm.PlayerLightningInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `distance`

  `ClimateColorInfo`

  `lightningColor`

  `float`

  `lightningMod`

  `ThunderStorm.LightningState`

  `lightningState`

  `float`

  `lightningStrength`

  `ClimateColorInfo`

  `outColor`

  `GameTime.AnimTimer`

  `timer`

  `int`

  `x`

  `int`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `PlayerLightningInfo()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### lightningState

    public [ThunderStorm.LightningState](ThunderStorm.LightningState.html "enum class in zombie.iso.weather") lightningState
  + ### timer

    public [GameTime.AnimTimer](../../GameTime.AnimTimer.html "class in zombie") timer
  + ### lightningStrength

    public float lightningStrength
  + ### lightningMod

    public float lightningMod
  + ### lightningColor

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") lightningColor
  + ### outColor

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") outColor
  + ### x

    public int x
  + ### y

    public int y
  + ### distance

    public int distance
* Constructor Details
  -------------------

  + ### PlayerLightningInfo

    private PlayerLightningInfo()