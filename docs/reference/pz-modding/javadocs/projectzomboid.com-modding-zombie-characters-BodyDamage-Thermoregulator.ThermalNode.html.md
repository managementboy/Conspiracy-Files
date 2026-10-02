[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.BodyDamage](package-summary.html)
2. [Thermoregulator](Thermoregulator.html)
3. [ThermalNode](Thermoregulator.ThermalNode.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [distToCore](#distToCore)
   2. [skinSurface](#skinSurface)
   3. [bodyPartType](#bodyPartType)
   4. [bloodBpt](#bloodBpt)
   5. [bodyPart](#bodyPart)
   6. [isCore](#isCore)
   7. [insulationLayerMultiplierUi](#insulationLayerMultiplierUi)
   8. [upstream](#upstream)
   9. [downstream](#downstream)
   10. [insulation](#insulation)
   11. [windresist](#windresist)
   12. [celcius](#celcius)
   13. [skinCelcius](#skinCelcius)
   14. [heatDelta](#heatDelta)
   15. [primaryDelta](#primaryDelta)
   16. [secondaryDelta](#secondaryDelta)
   17. [clothingWetness](#clothingWetness)
   18. [bodyWetness](#bodyWetness)
   19. [clothing](#clothing)
6. [Constructor Details](#constructor-detail)
   1. [ThermalNode(float, BodyPart, float)](#%3Cinit%3E(float,zombie.characters.BodyDamage.BodyPart,float))
   2. [ThermalNode(boolean, float, BodyPart, float)](#%3Cinit%3E(boolean,float,zombie.characters.BodyDamage.BodyPart,float))
7. [Method Details](#method-detail)
   1. [calculateInsulation()](#calculateInsulation())
   2. [getName()](#getName())
   3. [hasUpstream()](#hasUpstream())
   4. [hasDownstream()](#hasDownstream())
   5. [getDistToCore()](#getDistToCore())
   6. [getSkinSurface()](#getSkinSurface())
   7. [isCore()](#isCore())
   8. [getInsulation()](#getInsulation())
   9. [getWindresist()](#getWindresist())
   10. [getCelcius()](#getCelcius())
   11. [getSkinCelcius()](#getSkinCelcius())
   12. [getHeatDelta()](#getHeatDelta())
   13. [getPrimaryDelta()](#getPrimaryDelta())
   14. [getSecondaryDelta()](#getSecondaryDelta())
   15. [getClothingWetness()](#getClothingWetness())
   16. [getBodyWetness()](#getBodyWetness())
   17. [getBodyResponse()](#getBodyResponse())
   18. [getSkinCelciusUI()](#getSkinCelciusUI())
   19. [getHeatDeltaUI()](#getHeatDeltaUI())
   20. [getPrimaryDeltaUI()](#getPrimaryDeltaUI())
   21. [getSecondaryDeltaUI()](#getSecondaryDeltaUI())
   22. [getInsulationUI()](#getInsulationUI())
   23. [getWindresistUI()](#getWindresistUI())
   24. [getClothingWetnessUI()](#getClothingWetnessUI())
   25. [getBodyWetnessUI()](#getBodyWetnessUI())
   26. [getBodyResponseUI()](#getBodyResponseUI())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Thermoregulator.ThermalNode
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BodyDamage.Thermoregulator.ThermalNode

Enclosing class:
:   `Thermoregulator`

---

public class Thermoregulator.ThermalNode
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final BloodBodyPartType`

  `bloodBpt`

  `private final BodyPart`

  `bodyPart`

  `private final BodyPartType`

  `bodyPartType`

  `private float`

  `bodyWetness`

  `private float`

  `celcius`

  `private final ArrayList<Clothing>`

  `clothing`

  `private float`

  `clothingWetness`

  `private final float`

  `distToCore`

  `private Thermoregulator.ThermalNode[]`

  `downstream`

  `private float`

  `heatDelta`

  `private float`

  `insulation`

  `private final float`

  `insulationLayerMultiplierUi`

  `private final boolean`

  `isCore`

  `private float`

  `primaryDelta`

  `private float`

  `secondaryDelta`

  `private float`

  `skinCelcius`

  `private final float`

  `skinSurface`

  `private Thermoregulator.ThermalNode`

  `upstream`

  `private float`

  `windresist`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ThermalNode(boolean isCore,
  float initTemperature,
  BodyPart bodyPart,
  float insulationMultiplier)`

  `ThermalNode(float initTemperature,
  BodyPart bodyPart,
  float insulationMultiplier)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `calculateInsulation()`

  `float`

  `getBodyResponse()`

  `float`

  `getBodyResponseUI()`

  `float`

  `getBodyWetness()`

  `float`

  `getBodyWetnessUI()`

  `float`

  `getCelcius()`

  `float`

  `getClothingWetness()`

  `float`

  `getClothingWetnessUI()`

  `float`

  `getDistToCore()`

  `float`

  `getHeatDelta()`

  `float`

  `getHeatDeltaUI()`

  `float`

  `getInsulation()`

  `float`

  `getInsulationUI()`

  `String`

  `getName()`

  `float`

  `getPrimaryDelta()`

  `float`

  `getPrimaryDeltaUI()`

  `float`

  `getSecondaryDelta()`

  `float`

  `getSecondaryDeltaUI()`

  `float`

  `getSkinCelcius()`

  `float`

  `getSkinCelciusUI()`

  `float`

  `getSkinSurface()`

  `float`

  `getWindresist()`

  `float`

  `getWindresistUI()`

  `boolean`

  `hasDownstream()`

  `boolean`

  `hasUpstream()`

  `boolean`

  `isCore()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### distToCore

    private final float distToCore
  + ### skinSurface

    private final float skinSurface
  + ### bodyPartType

    private final [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") bodyPartType
  + ### bloodBpt

    private final [BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") bloodBpt
  + ### bodyPart

    private final [BodyPart](BodyPart.html "class in zombie.characters.BodyDamage") bodyPart
  + ### isCore

    private final boolean isCore
  + ### insulationLayerMultiplierUi

    private final float insulationLayerMultiplierUi
  + ### upstream

    private [Thermoregulator.ThermalNode](Thermoregulator.ThermalNode.html "class in zombie.characters.BodyDamage") upstream
  + ### downstream

    private [Thermoregulator.ThermalNode](Thermoregulator.ThermalNode.html "class in zombie.characters.BodyDamage")[] downstream
  + ### insulation

    private float insulation
  + ### windresist

    private float windresist
  + ### celcius

    private float celcius
  + ### skinCelcius

    private float skinCelcius
  + ### heatDelta

    private float heatDelta
  + ### primaryDelta

    private float primaryDelta
  + ### secondaryDelta

    private float secondaryDelta
  + ### clothingWetness

    private float clothingWetness
  + ### bodyWetness

    private float bodyWetness
  + ### clothing

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Clothing](../../inventory/types/Clothing.html "class in zombie.inventory.types")> clothing
* Constructor Details
  -------------------

  + ### ThermalNode

    public ThermalNode(float initTemperature,
    [BodyPart](BodyPart.html "class in zombie.characters.BodyDamage") bodyPart,
    float insulationMultiplier)
  + ### ThermalNode

    public ThermalNode(boolean isCore,
    float initTemperature,
    [BodyPart](BodyPart.html "class in zombie.characters.BodyDamage") bodyPart,
    float insulationMultiplier)
* Method Details
  --------------

  + ### calculateInsulation

    private void calculateInsulation()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### hasUpstream

    public boolean hasUpstream()
  + ### hasDownstream

    public boolean hasDownstream()
  + ### getDistToCore

    public float getDistToCore()
  + ### getSkinSurface

    public float getSkinSurface()
  + ### isCore

    public boolean isCore()
  + ### getInsulation

    public float getInsulation()
  + ### getWindresist

    public float getWindresist()
  + ### getCelcius

    public float getCelcius()
  + ### getSkinCelcius

    public float getSkinCelcius()
  + ### getHeatDelta

    public float getHeatDelta()
  + ### getPrimaryDelta

    public float getPrimaryDelta()
  + ### getSecondaryDelta

    public float getSecondaryDelta()
  + ### getClothingWetness

    public float getClothingWetness()
  + ### getBodyWetness

    public float getBodyWetness()
  + ### getBodyResponse

    public float getBodyResponse()
  + ### getSkinCelciusUI

    public float getSkinCelciusUI()
  + ### getHeatDeltaUI

    public float getHeatDeltaUI()
  + ### getPrimaryDeltaUI

    public float getPrimaryDeltaUI()
  + ### getSecondaryDeltaUI

    public float getSecondaryDeltaUI()
  + ### getInsulationUI

    public float getInsulationUI()
  + ### getWindresistUI

    public float getWindresistUI()
  + ### getClothingWetnessUI

    public float getClothingWetnessUI()
  + ### getBodyWetnessUI

    public float getBodyWetnessUI()
  + ### getBodyResponseUI

    public float getBodyResponseUI()