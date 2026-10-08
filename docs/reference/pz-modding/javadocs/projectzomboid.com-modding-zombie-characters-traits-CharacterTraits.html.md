[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.traits](package-summary.html)
2. [CharacterTraits](CharacterTraits.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [traits](#traits)
   2. [knownTraits](#knownTraits)
   3. [EmaciatedDamageDealtReductionModifier](#EmaciatedDamageDealtReductionModifier)
   4. [VeryUnderweightDamageDealtReductionModifier](#VeryUnderweightDamageDealtReductionModifier)
   5. [UnderweightDamageDealtReductionModifier](#UnderweightDamageDealtReductionModifier)
   6. [TraitDamageDealtReductionDefaultModifier](#TraitDamageDealtReductionDefaultModifier)
   7. [ObeseStrengthPenalty](#ObeseStrengthPenalty)
   8. [OverweightStrengthPenalty](#OverweightStrengthPenalty)
   9. [AllThumbsStrengthPenalty](#AllThumbsStrengthPenalty)
   10. [DextrousStrengthBonus](#DextrousStrengthBonus)
   11. [BurglarStrengthBonus](#BurglarStrengthBonus)
   12. [GymnastStrengthBonus](#GymnastStrengthBonus)
   13. [AsthmaticEnduranceLossModifier](#AsthmaticEnduranceLossModifier)
   14. [TraitEnduranceLossDefaultModifier](#TraitEnduranceLossDefaultModifier)
   15. [OutdoorsmanWeatherPenaltyModifier](#OutdoorsmanWeatherPenaltyModifier)
   16. [TraitWeatherPenaltyDefaultModifier](#TraitWeatherPenaltyDefaultModifier)
   17. [ObeseClimbingPenalty](#ObeseClimbingPenalty)
   18. [OverweightClimbingPenalty](#OverweightClimbingPenalty)
   19. [ClumsyClimbingPenaltyDivisor](#ClumsyClimbingPenaltyDivisor)
   20. [AwkwardGlovesClimbingPenaltyDivisor](#AwkwardGlovesClimbingPenaltyDivisor)
   21. [RegularGlovesClimbingBonus](#RegularGlovesClimbingBonus)
   22. [PerkClimbingBonusMultiplier](#PerkClimbingBonusMultiplier)
   23. [EnduranceClimbingPenaltyMultiplier](#EnduranceClimbingPenaltyMultiplier)
   24. [DrunkClimbingPenaltyMultiplier](#DrunkClimbingPenaltyMultiplier)
   25. [HeavyLoadClimbingPenaltyMultiplier](#HeavyLoadClimbingPenaltyMultiplier)
   26. [PainClimbingPenaltyMultiplier](#PainClimbingPenaltyMultiplier)
   27. [AllThumbsClimbingPenalty](#AllThumbsClimbingPenalty)
   28. [DextrousClimbingBonus](#DextrousClimbingBonus)
   29. [BurglarClimbingBonus](#BurglarClimbingBonus)
   30. [GymnastClimbingBonus](#GymnastClimbingBonus)
   31. [HealthReductionMultiplierModerate](#HealthReductionMultiplierModerate)
   32. [HealthReductionMultiplierSevere](#HealthReductionMultiplierSevere)
   33. [BASE\_DETECTION\_RANGE](#BASE_DETECTION_RANGE)
   34. [FATIGUE\_THRESHOLD](#FATIGUE_THRESHOLD)
   35. [FATIGUE\_SCALE](#FATIGUE_SCALE)
   36. [HARD\_OF\_HEARING\_RANGE\_PENALTY](#HARD_OF_HEARING_RANGE_PENALTY)
   37. [DEAF\_DETECTION\_RANGE](#DEAF_DETECTION_RANGE)
   38. [KEEN\_HEARING\_RANGE\_BONUS](#KEEN_HEARING_RANGE_BONUS)
6. [Constructor Details](#constructor-detail)
   1. [CharacterTraits()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [get(CharacterTrait)](#get(zombie.scripting.objects.CharacterTrait))
   2. [set(CharacterTrait, boolean)](#set(zombie.scripting.objects.CharacterTrait,boolean))
   3. [add(CharacterTrait)](#add(zombie.scripting.objects.CharacterTrait))
   4. [remove(CharacterTrait)](#remove(zombie.scripting.objects.CharacterTrait))
   5. [load(ByteBuffer)](#load(java.nio.ByteBuffer))
   6. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   7. [write(ByteBufferWriter)](#write(zombie.core.network.ByteBufferWriter))
   8. [read(ByteBufferReader)](#read(zombie.core.network.ByteBufferReader))
   9. [getTraits()](#getTraits())
   10. [getKnownTraits()](#getKnownTraits())
   11. [getTraitDamageDealtReductionModifier()](#getTraitDamageDealtReductionModifier())
   12. [getTraitEnduranceLossModifier()](#getTraitEnduranceLossModifier())
   13. [getTraitWeatherPenaltyModifier()](#getTraitWeatherPenaltyModifier())
   14. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class CharacterTraits
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.traits.CharacterTraits

---

public final class CharacterTraits
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final float`

  `AllThumbsClimbingPenalty`

  `static final int`

  `AllThumbsStrengthPenalty`

  `private static final float`

  `AsthmaticEnduranceLossModifier`

  `static final float`

  `AwkwardGlovesClimbingPenaltyDivisor`

  `static final float`

  `BASE_DETECTION_RANGE`

  `static final float`

  `BurglarClimbingBonus`

  `static final int`

  `BurglarStrengthBonus`

  `static final float`

  `ClumsyClimbingPenaltyDivisor`

  `static final float`

  `DEAF_DETECTION_RANGE`

  `static final float`

  `DextrousClimbingBonus`

  `static final int`

  `DextrousStrengthBonus`

  `static final float`

  `DrunkClimbingPenaltyMultiplier`

  `private static final float`

  `EmaciatedDamageDealtReductionModifier`

  `static final float`

  `EnduranceClimbingPenaltyMultiplier`

  `static final float`

  `FATIGUE_SCALE`

  `static final float`

  `FATIGUE_THRESHOLD`

  `static final float`

  `GymnastClimbingBonus`

  `static final int`

  `GymnastStrengthBonus`

  `static final float`

  `HARD_OF_HEARING_RANGE_PENALTY`

  `static final float`

  `HealthReductionMultiplierModerate`

  `static final float`

  `HealthReductionMultiplierSevere`

  `static final float`

  `HeavyLoadClimbingPenaltyMultiplier`

  `static final float`

  `KEEN_HEARING_RANGE_BONUS`

  `private final List<CharacterTrait>`

  `knownTraits`

  `static final float`

  `ObeseClimbingPenalty`

  `static final int`

  `ObeseStrengthPenalty`

  `private static final float`

  `OutdoorsmanWeatherPenaltyModifier`

  `static final float`

  `OverweightClimbingPenalty`

  `static final int`

  `OverweightStrengthPenalty`

  `static final float`

  `PainClimbingPenaltyMultiplier`

  `static final float`

  `PerkClimbingBonusMultiplier`

  `static final float`

  `RegularGlovesClimbingBonus`

  `private static final float`

  `TraitDamageDealtReductionDefaultModifier`

  `private static final float`

  `TraitEnduranceLossDefaultModifier`

  `private final Map<CharacterTrait, Boolean>`

  `traits`

  `private static final float`

  `TraitWeatherPenaltyDefaultModifier`

  `private static final float`

  `UnderweightDamageDealtReductionModifier`

  `private static final float`

  `VeryUnderweightDamageDealtReductionModifier`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CharacterTraits()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(CharacterTrait characterTrait)`

  `boolean`

  `get(CharacterTrait characterTrait)`

  `List<CharacterTrait>`

  `getKnownTraits()`

  `float`

  `getTraitDamageDealtReductionModifier()`

  `float`

  `getTraitEnduranceLossModifier()`

  `Map<CharacterTrait, Boolean>`

  `getTraits()`

  `float`

  `getTraitWeatherPenaltyModifier()`

  `void`

  `load(ByteBuffer input)`

  `void`

  `read(zombie.core.network.ByteBufferReader input)`

  `void`

  `remove(CharacterTrait characterTrait)`

  `private void`

  `reset()`

  `void`

  `save(ByteBuffer output)`

  `boolean`

  `set(CharacterTrait characterTrait,
  boolean value)`

  `void`

  `write(zombie.core.network.ByteBufferWriter output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### traits

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects"), [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> traits
  + ### knownTraits

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> knownTraits
  + ### EmaciatedDamageDealtReductionModifier

    private static final float EmaciatedDamageDealtReductionModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.EmaciatedDamageDealtReductionModifier)
  + ### VeryUnderweightDamageDealtReductionModifier

    private static final float VeryUnderweightDamageDealtReductionModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.VeryUnderweightDamageDealtReductionModifier)
  + ### UnderweightDamageDealtReductionModifier

    private static final float UnderweightDamageDealtReductionModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.UnderweightDamageDealtReductionModifier)
  + ### TraitDamageDealtReductionDefaultModifier

    private static final float TraitDamageDealtReductionDefaultModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.TraitDamageDealtReductionDefaultModifier)
  + ### ObeseStrengthPenalty

    public static final int ObeseStrengthPenalty

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.ObeseStrengthPenalty)
  + ### OverweightStrengthPenalty

    public static final int OverweightStrengthPenalty

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.OverweightStrengthPenalty)
  + ### AllThumbsStrengthPenalty

    public static final int AllThumbsStrengthPenalty

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.AllThumbsStrengthPenalty)
  + ### DextrousStrengthBonus

    public static final int DextrousStrengthBonus

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.DextrousStrengthBonus)
  + ### BurglarStrengthBonus

    public static final int BurglarStrengthBonus

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.BurglarStrengthBonus)
  + ### GymnastStrengthBonus

    public static final int GymnastStrengthBonus

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.GymnastStrengthBonus)
  + ### AsthmaticEnduranceLossModifier

    private static final float AsthmaticEnduranceLossModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.AsthmaticEnduranceLossModifier)
  + ### TraitEnduranceLossDefaultModifier

    private static final float TraitEnduranceLossDefaultModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.TraitEnduranceLossDefaultModifier)
  + ### OutdoorsmanWeatherPenaltyModifier

    private static final float OutdoorsmanWeatherPenaltyModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.OutdoorsmanWeatherPenaltyModifier)
  + ### TraitWeatherPenaltyDefaultModifier

    private static final float TraitWeatherPenaltyDefaultModifier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.TraitWeatherPenaltyDefaultModifier)
  + ### ObeseClimbingPenalty

    public static final float ObeseClimbingPenalty

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.ObeseClimbingPenalty)
  + ### OverweightClimbingPenalty

    public static final float OverweightClimbingPenalty

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.OverweightClimbingPenalty)
  + ### ClumsyClimbingPenaltyDivisor

    public static final float ClumsyClimbingPenaltyDivisor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.ClumsyClimbingPenaltyDivisor)
  + ### AwkwardGlovesClimbingPenaltyDivisor

    public static final float AwkwardGlovesClimbingPenaltyDivisor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.AwkwardGlovesClimbingPenaltyDivisor)
  + ### RegularGlovesClimbingBonus

    public static final float RegularGlovesClimbingBonus

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.RegularGlovesClimbingBonus)
  + ### PerkClimbingBonusMultiplier

    public static final float PerkClimbingBonusMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.PerkClimbingBonusMultiplier)
  + ### EnduranceClimbingPenaltyMultiplier

    public static final float EnduranceClimbingPenaltyMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.EnduranceClimbingPenaltyMultiplier)
  + ### DrunkClimbingPenaltyMultiplier

    public static final float DrunkClimbingPenaltyMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.DrunkClimbingPenaltyMultiplier)
  + ### HeavyLoadClimbingPenaltyMultiplier

    public static final float HeavyLoadClimbingPenaltyMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.HeavyLoadClimbingPenaltyMultiplier)
  + ### PainClimbingPenaltyMultiplier

    public static final float PainClimbingPenaltyMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.PainClimbingPenaltyMultiplier)
  + ### AllThumbsClimbingPenalty

    public static final float AllThumbsClimbingPenalty

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.AllThumbsClimbingPenalty)
  + ### DextrousClimbingBonus

    public static final float DextrousClimbingBonus

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.DextrousClimbingBonus)
  + ### BurglarClimbingBonus

    public static final float BurglarClimbingBonus

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.BurglarClimbingBonus)
  + ### GymnastClimbingBonus

    public static final float GymnastClimbingBonus

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.GymnastClimbingBonus)
  + ### HealthReductionMultiplierModerate

    public static final float HealthReductionMultiplierModerate

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.HealthReductionMultiplierModerate)
  + ### HealthReductionMultiplierSevere

    public static final float HealthReductionMultiplierSevere

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.HealthReductionMultiplierSevere)
  + ### BASE\_DETECTION\_RANGE

    public static final float BASE\_DETECTION\_RANGE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.BASE_DETECTION_RANGE)
  + ### FATIGUE\_THRESHOLD

    public static final float FATIGUE\_THRESHOLD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.FATIGUE_THRESHOLD)
  + ### FATIGUE\_SCALE

    public static final float FATIGUE\_SCALE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.FATIGUE_SCALE)
  + ### HARD\_OF\_HEARING\_RANGE\_PENALTY

    public static final float HARD\_OF\_HEARING\_RANGE\_PENALTY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.HARD_OF_HEARING_RANGE_PENALTY)
  + ### DEAF\_DETECTION\_RANGE

    public static final float DEAF\_DETECTION\_RANGE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.DEAF_DETECTION_RANGE)
  + ### KEEN\_HEARING\_RANGE\_BONUS

    public static final float KEEN\_HEARING\_RANGE\_BONUS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.traits.CharacterTraits.KEEN_HEARING_RANGE_BONUS)
* Constructor Details
  -------------------

  + ### CharacterTraits

    public CharacterTraits()
* Method Details
  --------------

  + ### get

    public boolean get([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait)
  + ### set

    public boolean set([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait,
    boolean value)
  + ### add

    public void add([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait)
  + ### remove

    public void remove([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### write

    public void write(zombie.core.network.ByteBufferWriter output)
  + ### read

    public void read(zombie.core.network.ByteBufferReader input)
  + ### getTraits

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects"), [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> getTraits()
  + ### getKnownTraits

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> getKnownTraits()
  + ### getTraitDamageDealtReductionModifier

    public float getTraitDamageDealtReductionModifier()
  + ### getTraitEnduranceLossModifier

    public float getTraitEnduranceLossModifier()
  + ### getTraitWeatherPenaltyModifier

    public float getTraitWeatherPenaltyModifier()
  + ### reset

    private void reset()