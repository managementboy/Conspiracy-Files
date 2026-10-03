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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [DISABLE\_ENERGY\_MULTIPLIER](#DISABLE_ENERGY_MULTIPLIER)
   2. [THERMAL\_COLD\_DAMAGE\_MOD](#THERMAL_COLD_DAMAGE_MOD)
   3. [bodyDamage](#bodyDamage)
   4. [character](#character)
   5. [player](#player)
   6. [stats](#stats)
   7. [nutrition](#nutrition)
   8. [climate](#climate)
   9. [itemVisuals](#itemVisuals)
   10. [itemVisualsCache](#itemVisualsCache)
   11. [coveredParts](#coveredParts)
   12. [simulationMultiplier](#simulationMultiplier)
   13. [setPoint](#setPoint)
   14. [metabolicRate](#metabolicRate)
   15. [metabolicRateReal](#metabolicRateReal)
   16. [metabolicTarget](#metabolicTarget)
   17. [fluidsMultiplier](#fluidsMultiplier)
   18. [energyMultiplier](#energyMultiplier)
   19. [fatigueMultiplier](#fatigueMultiplier)
   20. [bodyHeatDelta](#bodyHeatDelta)
   21. [coreHeatDelta](#coreHeatDelta)
   22. [thermalChevronUp](#thermalChevronUp)
   23. [core](#core)
   24. [nodes](#nodes)
   25. [totalHeatRaw](#totalHeatRaw)
   26. [totalHeat](#totalHeat)
   27. [primTotal](#primTotal)
   28. [secTotal](#secTotal)
   29. [externalAirTemperature](#externalAirTemperature)
   30. [airTemperature](#airTemperature)
   31. [airAndWindTemp](#airAndWindTemp)
   32. [rateOfChangeCounter](#rateOfChangeCounter)
   33. [coreCelciusCache](#coreCelciusCache)
   34. [coreRateOfChange](#coreRateOfChange)
   35. [thermalDamage](#thermalDamage)
   36. [damageCounter](#damageCounter)
   37. [TWO\_HOUR\_LETHAL\_COLD\_DURATION](#TWO_HOUR_LETHAL_COLD_DURATION)
   38. [thermalDuration](#thermalDuration)
7. [Constructor Details](#constructor-detail)
   1. [Thermoregulator(BodyDamage)](#%3Cinit%3E(zombie.characters.BodyDamage.BodyDamage))
8. [Method Details](#method-detail)
   1. [setSimulationMultiplier(float)](#setSimulationMultiplier(float))
   2. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   3. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   4. [reset()](#reset())
   5. [initNodes()](#initNodes())
   6. [getNodeSize()](#getNodeSize())
   7. [getNode(int)](#getNode(int))
   8. [getNodeForType(BodyPartType)](#getNodeForType(zombie.characters.BodyDamage.BodyPartType))
   9. [getNodeForBloodType(BloodBodyPartType)](#getNodeForBloodType(zombie.characterTextures.BloodBodyPartType))
   10. [getBodyHeatDelta()](#getBodyHeatDelta())
   11. [getFluidsMultiplier()](#getFluidsMultiplier())
   12. [getEnergyMultiplier()](#getEnergyMultiplier())
   13. [getFatigueMultiplier()](#getFatigueMultiplier())
   14. [getMovementModifier()](#getMovementModifier())
   15. [getCombatModifier()](#getCombatModifier())
   16. [getCoreTemperature()](#getCoreTemperature())
   17. [getHeatGeneration()](#getHeatGeneration())
   18. [getMetabolicRate()](#getMetabolicRate())
   19. [getMetabolicTarget()](#getMetabolicTarget())
   20. [getMetabolicRateReal()](#getMetabolicRateReal())
   21. [getSetPoint()](#getSetPoint())
   22. [getCoreHeatDelta()](#getCoreHeatDelta())
   23. [getCoreRateOfChange()](#getCoreRateOfChange())
   24. [getExternalAirTemperature()](#getExternalAirTemperature())
   25. [getCoreTemperatureUI()](#getCoreTemperatureUI())
   26. [getHeatGenerationUI()](#getHeatGenerationUI())
   27. [thermalChevronUp()](#thermalChevronUp())
   28. [thermalChevronCount()](#thermalChevronCount())
   29. [getCatchAColdDelta()](#getCatchAColdDelta())
   30. [getTimedActionTimeModifier()](#getTimedActionTimeModifier())
   31. [getSkinCelciusMin()](#getSkinCelciusMin())
   32. [getSkinCelciusFavorable()](#getSkinCelciusFavorable())
   33. [getSkinCelciusMax()](#getSkinCelciusMax())
   34. [setMetabolicTarget(Metabolics)](#setMetabolicTarget(zombie.characters.BodyDamage.Metabolics))
   35. [setMetabolicTarget(float)](#setMetabolicTarget(float))
   36. [updateCoreRateOfChange()](#updateCoreRateOfChange())
   37. [getSimulationMultiplier()](#getSimulationMultiplier())
   38. [getDefaultMultiplier()](#getDefaultMultiplier())
   39. [getMetabolicRateIncMultiplier()](#getMetabolicRateIncMultiplier())
   40. [getMetabolicRateDecMultiplier()](#getMetabolicRateDecMultiplier())
   41. [getBodyHeatMultiplier()](#getBodyHeatMultiplier())
   42. [getCoreHeatExpandMultiplier()](#getCoreHeatExpandMultiplier())
   43. [getCoreHeatContractMultiplier()](#getCoreHeatContractMultiplier())
   44. [getSkinCelciusMultiplier()](#getSkinCelciusMultiplier())
   45. [getTemperatureAir()](#getTemperatureAir())
   46. [getTemperatureAirAndWind()](#getTemperatureAirAndWind())
   47. [getDbg\_totalHeatRaw()](#getDbg_totalHeatRaw())
   48. [getDbg\_totalHeat()](#getDbg_totalHeat())
   49. [getCoreCelcius()](#getCoreCelcius())
   50. [getDbg\_primTotal()](#getDbg_primTotal())
   51. [getDbg\_secTotal()](#getDbg_secTotal())
   52. [getSimulationMultiplier(Thermoregulator.Multiplier)](#getSimulationMultiplier(zombie.characters.BodyDamage.Thermoregulator.Multiplier))
   53. [getThermalDamage()](#getThermalDamage())
   54. [updateThermalDamage(float)](#updateThermalDamage(float))
   55. [update()](#update())
   56. [updateSetPoint()](#updateSetPoint())
   57. [updateMetabolicRate()](#updateMetabolicRate())
   58. [updateNodesHeatDelta()](#updateNodesHeatDelta())
   59. [updateHeatDeltas()](#updateHeatDeltas())
   60. [updateNodes()](#updateNodes())
   61. [updateBodyMultipliers()](#updateBodyMultipliers())
   62. [updateClothing()](#updateClothing())
   63. [getEnergy()](#getEnergy())
   64. [getBodyFluids()](#getBodyFluids())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Thermoregulator
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BodyDamage.Thermoregulator

---

public final class Thermoregulator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static enum`

  `Thermoregulator.Multiplier`

  `class`

  `Thermoregulator.ThermalNode`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `airAndWindTemp`

  `private float`

  `airTemperature`

  `private final BodyDamage`

  `bodyDamage`

  `private float`

  `bodyHeatDelta`

  `private final IsoGameCharacter`

  `character`

  `private final ClimateManager`

  `climate`

  `private Thermoregulator.ThermalNode`

  `core`

  `private float`

  `coreCelciusCache`

  `private float`

  `coreHeatDelta`

  `private float`

  `coreRateOfChange`

  `private static final ArrayList<BloodBodyPartType>`

  `coveredParts`

  `private float`

  `damageCounter`

  `private static final boolean`

  `DISABLE_ENERGY_MULTIPLIER`

  `private double`

  `energyMultiplier`

  `private float`

  `externalAirTemperature`

  `private double`

  `fatigueMultiplier`

  `private double`

  `fluidsMultiplier`

  `private static final ItemVisuals`

  `itemVisuals`

  `private static final ItemVisuals`

  `itemVisualsCache`

  `private float`

  `metabolicRate`

  `private float`

  `metabolicRateReal`

  `private float`

  `metabolicTarget`

  `private Thermoregulator.ThermalNode[]`

  `nodes`

  `private final Nutrition`

  `nutrition`

  `private final IsoPlayer`

  `player`

  `private float`

  `primTotal`

  `private float`

  `rateOfChangeCounter`

  `private float`

  `secTotal`

  `private float`

  `setPoint`

  `private static float`

  `simulationMultiplier`

  `private final Stats`

  `stats`

  `static final float`

  `THERMAL_COLD_DAMAGE_MOD`

  `private boolean`

  `thermalChevronUp`

  `private float`

  `thermalDamage`

  `private float`

  `thermalDuration`

  `private float`

  `totalHeat`

  `private float`

  `totalHeatRaw`

  `private final float`

  `TWO_HOUR_LETHAL_COLD_DURATION`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Thermoregulator(BodyDamage parent)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getBodyFluids()`

  `float`

  `getBodyHeatDelta()`

  `float`

  `getBodyHeatMultiplier()`

  `float`

  `getCatchAColdDelta()`

  `float`

  `getCombatModifier()`

  `float`

  `getCoreCelcius()`

  `float`

  `getCoreHeatContractMultiplier()`

  `float`

  `getCoreHeatDelta()`

  `float`

  `getCoreHeatExpandMultiplier()`

  `float`

  `getCoreRateOfChange()`

  `float`

  `getCoreTemperature()`

  `float`

  `getCoreTemperatureUI()`

  `float`

  `getDbg_primTotal()`

  `float`

  `getDbg_secTotal()`

  `float`

  `getDbg_totalHeat()`

  `float`

  `getDbg_totalHeatRaw()`

  `float`

  `getDefaultMultiplier()`

  `float`

  `getEnergy()`

  `double`

  `getEnergyMultiplier()`

  `float`

  `getExternalAirTemperature()`

  `double`

  `getFatigueMultiplier()`

  `double`

  `getFluidsMultiplier()`

  `float`

  `getHeatGeneration()`

  `float`

  `getHeatGenerationUI()`

  `float`

  `getMetabolicRate()`

  `float`

  `getMetabolicRateDecMultiplier()`

  `float`

  `getMetabolicRateIncMultiplier()`

  `float`

  `getMetabolicRateReal()`

  `float`

  `getMetabolicTarget()`

  `float`

  `getMovementModifier()`

  `Thermoregulator.ThermalNode`

  `getNode(int index)`

  `Thermoregulator.ThermalNode`

  `getNodeForBloodType(BloodBodyPartType type)`

  `Thermoregulator.ThermalNode`

  `getNodeForType(BodyPartType type)`

  `int`

  `getNodeSize()`

  `float`

  `getSetPoint()`

  `float`

  `getSimulationMultiplier()`

  `private float`

  `getSimulationMultiplier(Thermoregulator.Multiplier multiplierType)`

  `static float`

  `getSkinCelciusFavorable()`

  `static float`

  `getSkinCelciusMax()`

  `static float`

  `getSkinCelciusMin()`

  `float`

  `getSkinCelciusMultiplier()`

  `float`

  `getTemperatureAir()`

  `float`

  `getTemperatureAirAndWind()`

  `float`

  `getThermalDamage()`

  `float`

  `getTimedActionTimeModifier()`

  `private void`

  `initNodes()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setMetabolicTarget(float target)`

  `void`

  `setMetabolicTarget(Metabolics meta)`

  `static void`

  `setSimulationMultiplier(float multiplier)`

  `int`

  `thermalChevronCount()`

  `boolean`

  `thermalChevronUp()`

  `void`

  `update()`

  `private void`

  `updateBodyMultipliers()`

  `private void`

  `updateClothing()`

  `private void`

  `updateCoreRateOfChange()`

  `private void`

  `updateHeatDeltas()`

  `private void`

  `updateMetabolicRate()`

  `private void`

  `updateNodes()`

  `private void`

  `updateNodesHeatDelta()`

  `private void`

  `updateSetPoint()`

  `private void`

  `updateThermalDamage(float airTemperature)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DISABLE\_ENERGY\_MULTIPLIER

    private static final boolean DISABLE\_ENERGY\_MULTIPLIER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Thermoregulator.DISABLE_ENERGY_MULTIPLIER)
  + ### THERMAL\_COLD\_DAMAGE\_MOD

    public static final float THERMAL\_COLD\_DAMAGE\_MOD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Thermoregulator.THERMAL_COLD_DAMAGE_MOD)
  + ### bodyDamage

    private final [BodyDamage](BodyDamage.html "class in zombie.characters.BodyDamage") bodyDamage
  + ### character

    private final [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") character
  + ### player

    private final [IsoPlayer](../IsoPlayer.html "class in zombie.characters") player
  + ### stats

    private final [Stats](../Stats.html "class in zombie.characters") stats
  + ### nutrition

    private final [Nutrition](Nutrition.html "class in zombie.characters.BodyDamage") nutrition
  + ### climate

    private final [ClimateManager](../../iso/weather/ClimateManager.html "class in zombie.iso.weather") climate
  + ### itemVisuals

    private static final [ItemVisuals](../../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals
  + ### itemVisualsCache

    private static final [ItemVisuals](../../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisualsCache
  + ### coveredParts

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures")> coveredParts
  + ### simulationMultiplier

    private static float simulationMultiplier
  + ### setPoint

    private float setPoint
  + ### metabolicRate

    private float metabolicRate
  + ### metabolicRateReal

    private float metabolicRateReal
  + ### metabolicTarget

    private float metabolicTarget
  + ### fluidsMultiplier

    private double fluidsMultiplier
  + ### energyMultiplier

    private double energyMultiplier
  + ### fatigueMultiplier

    private double fatigueMultiplier
  + ### bodyHeatDelta

    private float bodyHeatDelta
  + ### coreHeatDelta

    private float coreHeatDelta
  + ### thermalChevronUp

    private boolean thermalChevronUp
  + ### core

    private [Thermoregulator.ThermalNode](Thermoregulator.ThermalNode.html "class in zombie.characters.BodyDamage") core
  + ### nodes

    private [Thermoregulator.ThermalNode](Thermoregulator.ThermalNode.html "class in zombie.characters.BodyDamage")[] nodes
  + ### totalHeatRaw

    private float totalHeatRaw
  + ### totalHeat

    private float totalHeat
  + ### primTotal

    private float primTotal
  + ### secTotal

    private float secTotal
  + ### externalAirTemperature

    private float externalAirTemperature
  + ### airTemperature

    private float airTemperature
  + ### airAndWindTemp

    private float airAndWindTemp
  + ### rateOfChangeCounter

    private float rateOfChangeCounter
  + ### coreCelciusCache

    private float coreCelciusCache
  + ### coreRateOfChange

    private float coreRateOfChange
  + ### thermalDamage

    private float thermalDamage
  + ### damageCounter

    private float damageCounter
  + ### TWO\_HOUR\_LETHAL\_COLD\_DURATION

    private final float TWO\_HOUR\_LETHAL\_COLD\_DURATION

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Thermoregulator.TWO_HOUR_LETHAL_COLD_DURATION)
  + ### thermalDuration

    private float thermalDuration
* Constructor Details
  -------------------

  + ### Thermoregulator

    public Thermoregulator([BodyDamage](BodyDamage.html "class in zombie.characters.BodyDamage") parent)
* Method Details
  --------------

  + ### setSimulationMultiplier

    public static void setSimulationMultiplier(float multiplier)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### reset

    public void reset()
  + ### initNodes

    private void initNodes()
  + ### getNodeSize

    public int getNodeSize()
  + ### getNode

    public [Thermoregulator.ThermalNode](Thermoregulator.ThermalNode.html "class in zombie.characters.BodyDamage") getNode(int index)
  + ### getNodeForType

    public [Thermoregulator.ThermalNode](Thermoregulator.ThermalNode.html "class in zombie.characters.BodyDamage") getNodeForType([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") type)
  + ### getNodeForBloodType

    public [Thermoregulator.ThermalNode](Thermoregulator.ThermalNode.html "class in zombie.characters.BodyDamage") getNodeForBloodType([BloodBodyPartType](../../characterTextures/BloodBodyPartType.html "enum class in zombie.characterTextures") type)
  + ### getBodyHeatDelta

    public float getBodyHeatDelta()
  + ### getFluidsMultiplier

    public double getFluidsMultiplier()
  + ### getEnergyMultiplier

    public double getEnergyMultiplier()
  + ### getFatigueMultiplier

    public double getFatigueMultiplier()
  + ### getMovementModifier

    public float getMovementModifier()
  + ### getCombatModifier

    public float getCombatModifier()
  + ### getCoreTemperature

    public float getCoreTemperature()
  + ### getHeatGeneration

    public float getHeatGeneration()
  + ### getMetabolicRate

    public float getMetabolicRate()
  + ### getMetabolicTarget

    public float getMetabolicTarget()
  + ### getMetabolicRateReal

    public float getMetabolicRateReal()
  + ### getSetPoint

    public float getSetPoint()
  + ### getCoreHeatDelta

    public float getCoreHeatDelta()
  + ### getCoreRateOfChange

    public float getCoreRateOfChange()
  + ### getExternalAirTemperature

    public float getExternalAirTemperature()
  + ### getCoreTemperatureUI

    public float getCoreTemperatureUI()
  + ### getHeatGenerationUI

    public float getHeatGenerationUI()
  + ### thermalChevronUp

    public boolean thermalChevronUp()
  + ### thermalChevronCount

    public int thermalChevronCount()
  + ### getCatchAColdDelta

    public float getCatchAColdDelta()
  + ### getTimedActionTimeModifier

    public float getTimedActionTimeModifier()
  + ### getSkinCelciusMin

    public static float getSkinCelciusMin()
  + ### getSkinCelciusFavorable

    public static float getSkinCelciusFavorable()
  + ### getSkinCelciusMax

    public static float getSkinCelciusMax()
  + ### setMetabolicTarget

    public void setMetabolicTarget([Metabolics](Metabolics.html "enum class in zombie.characters.BodyDamage") meta)
  + ### setMetabolicTarget

    public void setMetabolicTarget(float target)
  + ### updateCoreRateOfChange

    private void updateCoreRateOfChange()
  + ### getSimulationMultiplier

    public float getSimulationMultiplier()
  + ### getDefaultMultiplier

    public float getDefaultMultiplier()
  + ### getMetabolicRateIncMultiplier

    public float getMetabolicRateIncMultiplier()
  + ### getMetabolicRateDecMultiplier

    public float getMetabolicRateDecMultiplier()
  + ### getBodyHeatMultiplier

    public float getBodyHeatMultiplier()
  + ### getCoreHeatExpandMultiplier

    public float getCoreHeatExpandMultiplier()
  + ### getCoreHeatContractMultiplier

    public float getCoreHeatContractMultiplier()
  + ### getSkinCelciusMultiplier

    public float getSkinCelciusMultiplier()
  + ### getTemperatureAir

    public float getTemperatureAir()
  + ### getTemperatureAirAndWind

    public float getTemperatureAirAndWind()
  + ### getDbg\_totalHeatRaw

    public float getDbg\_totalHeatRaw()
  + ### getDbg\_totalHeat

    public float getDbg\_totalHeat()
  + ### getCoreCelcius

    public float getCoreCelcius()
  + ### getDbg\_primTotal

    public float getDbg\_primTotal()
  + ### getDbg\_secTotal

    public float getDbg\_secTotal()
  + ### getSimulationMultiplier

    private float getSimulationMultiplier([Thermoregulator.Multiplier](Thermoregulator.Multiplier.html "enum class in zombie.characters.BodyDamage") multiplierType)
  + ### getThermalDamage

    public float getThermalDamage()
  + ### updateThermalDamage

    private void updateThermalDamage(float airTemperature)
  + ### update

    public void update()
  + ### updateSetPoint

    private void updateSetPoint()
  + ### updateMetabolicRate

    private void updateMetabolicRate()
  + ### updateNodesHeatDelta

    private void updateNodesHeatDelta()
  + ### updateHeatDeltas

    private void updateHeatDeltas()
  + ### updateNodes

    private void updateNodes()
  + ### updateBodyMultipliers

    private void updateBodyMultipliers()
  + ### updateClothing

    private void updateClothing()
  + ### getEnergy

    public float getEnergy()
  + ### getBodyFluids

    public float getBodyFluids()