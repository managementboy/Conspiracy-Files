[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.BodyDamage](package-summary.html)
2. [BodyPart](BodyPart.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [type](#type)
   2. [biteDamage](#biteDamage)
   3. [bleedDamage](#bleedDamage)
   4. [damageScaler](#damageScaler)
   5. [health](#health)
   6. [bandaged](#bandaged)
   7. [manipulatingUsername](#manipulatingUsername)
   8. [bitten](#bitten)
   9. [bleeding](#bleeding)
   10. [isBleedingStemmed](#isBleedingStemmed)
   11. [isCauterized](#isCauterized)
   12. [scratched](#scratched)
   13. [stitched](#stitched)
   14. [deepWounded](#deepWounded)
   15. [isInfected](#isInfected)
   16. [isFakeInfected](#isFakeInfected)
   17. [parentChar](#parentChar)
   18. [bandageLife](#bandageLife)
   19. [scratchTime](#scratchTime)
   20. [biteTime](#biteTime)
   21. [alcoholicBandage](#alcoholicBandage)
   22. [stiffness](#stiffness)
   23. [woundInfectionLevel](#woundInfectionLevel)
   24. [infectedWound](#infectedWound)
   25. [scratchDamage](#scratchDamage)
   26. [cutDamage](#cutDamage)
   27. [woundDamage](#woundDamage)
   28. [burnDamage](#burnDamage)
   29. [bulletDamage](#bulletDamage)
   30. [fractureDamage](#fractureDamage)
   31. [bleedingTime](#bleedingTime)
   32. [deepWoundTime](#deepWoundTime)
   33. [haveGlass](#haveGlass)
   34. [stitchTime](#stitchTime)
   35. [alcoholLevel](#alcoholLevel)
   36. [additionalPain](#additionalPain)
   37. [bandageType](#bandageType)
   38. [getBandageXp](#getBandageXp)
   39. [getStitchXp](#getStitchXp)
   40. [getSplintXp](#getSplintXp)
   41. [fractureTime](#fractureTime)
   42. [splint](#splint)
   43. [splintFactor](#splintFactor)
   44. [haveBullet](#haveBullet)
   45. [burnTime](#burnTime)
   46. [needBurnWash](#needBurnWash)
   47. [lastTimeBurnWash](#lastTimeBurnWash)
   48. [splintItem](#splintItem)
   49. [plantainFactor](#plantainFactor)
   50. [comfreyFactor](#comfreyFactor)
   51. [garlicFactor](#garlicFactor)
   52. [cutTime](#cutTime)
   53. [cut](#cut)
   54. [scratchSpeedModifier](#scratchSpeedModifier)
   55. [cutSpeedModifier](#cutSpeedModifier)
   56. [burnSpeedModifier](#burnSpeedModifier)
   57. [deepWoundSpeedModifier](#deepWoundSpeedModifier)
   58. [wetness](#wetness)
   59. [thermalNode](#thermalNode)
6. [Constructor Details](#constructor-detail)
   1. [BodyPart(BodyPartType, IsoGameCharacter)](#%3Cinit%3E(zombie.characters.BodyDamage.BodyPartType,zombie.characters.IsoGameCharacter))
7. [Method Details](#method-detail)
   1. [getParentChar()](#getParentChar())
   2. [AddDamage(float)](#AddDamage(float))
   3. [isBandageDirty()](#isBandageDirty())
   4. [DamageUpdate()](#DamageUpdate())
   5. [resetPoulticeFactors()](#resetPoulticeFactors())
   6. [getHealth()](#getHealth())
   7. [SetHealth(float)](#SetHealth(float))
   8. [AddHealth(float)](#AddHealth(float))
   9. [ReduceHealth(float)](#ReduceHealth(float))
   10. [HasInjury()](#HasInjury())
   11. [bandaged()](#bandaged())
   12. [manipulatingUsername()](#manipulatingUsername())
   13. [bitten()](#bitten())
   14. [bleeding()](#bleeding())
   15. [IsBleedingStemmed()](#IsBleedingStemmed())
   16. [IsCauterized()](#IsCauterized())
   17. [IsInfected()](#IsInfected())
   18. [SetInfected(boolean)](#SetInfected(boolean))
   19. [SetFakeInfected(boolean)](#SetFakeInfected(boolean))
   20. [IsFakeInfected()](#IsFakeInfected())
   21. [DisableFakeInfection()](#DisableFakeInfection())
   22. [scratched()](#scratched())
   23. [stitched()](#stitched())
   24. [deepWounded()](#deepWounded())
   25. [RestoreToFullHealth()](#RestoreToFullHealth())
   26. [setBandaged(boolean, float)](#setBandaged(boolean,float))
   27. [setBandaged(boolean, float, boolean, String)](#setBandaged(boolean,float,boolean,java.lang.String))
   28. [setManipulatingUsername(String)](#setManipulatingUsername(java.lang.String))
   29. [SetBitten(boolean)](#SetBitten(boolean))
   30. [SetBitten(boolean, boolean)](#SetBitten(boolean,boolean))
   31. [setBleeding(boolean)](#setBleeding(boolean))
   32. [SetBleedingStemmed(boolean)](#SetBleedingStemmed(boolean))
   33. [SetCauterized(boolean)](#SetCauterized(boolean))
   34. [setCut(boolean)](#setCut(boolean))
   35. [setCut(boolean, boolean)](#setCut(boolean,boolean))
   36. [generateZombieInfection(int)](#generateZombieInfection(int))
   37. [setScratched(boolean, boolean)](#setScratched(boolean,boolean))
   38. [SetScratchedWeapon(boolean)](#SetScratchedWeapon(boolean))
   39. [generateDeepWound()](#generateDeepWound())
   40. [generateDeepShardWound()](#generateDeepShardWound())
   41. [generateFracture(float)](#generateFracture(float))
   42. [generateFractureNew(float)](#generateFractureNew(float))
   43. [SetScratchedWindow(boolean)](#SetScratchedWindow(boolean))
   44. [setStitched(boolean)](#setStitched(boolean))
   45. [damageFromFirearm(float)](#damageFromFirearm(float))
   46. [getPain()](#getPain())
   47. [getBiteTime()](#getBiteTime())
   48. [setBiteTime(float)](#setBiteTime(float))
   49. [getDeepWoundTime()](#getDeepWoundTime())
   50. [setDeepWoundTime(float)](#setDeepWoundTime(float))
   51. [haveGlass()](#haveGlass())
   52. [setHaveGlass(boolean)](#setHaveGlass(boolean))
   53. [getStitchTime()](#getStitchTime())
   54. [setStitchTime(float)](#setStitchTime(float))
   55. [getIndex()](#getIndex())
   56. [getAlcoholLevel()](#getAlcoholLevel())
   57. [setAlcoholLevel(float)](#setAlcoholLevel(float))
   58. [getAdditionalPain(boolean)](#getAdditionalPain(boolean))
   59. [getAdditionalPain()](#getAdditionalPain())
   60. [setAdditionalPain(float)](#setAdditionalPain(float))
   61. [getBandageType()](#getBandageType())
   62. [setBandageType(String)](#setBandageType(java.lang.String))
   63. [isGetBandageXp()](#isGetBandageXp())
   64. [setGetBandageXp(boolean)](#setGetBandageXp(boolean))
   65. [isGetStitchXp()](#isGetStitchXp())
   66. [setGetStitchXp(boolean)](#setGetStitchXp(boolean))
   67. [getSplintFactor()](#getSplintFactor())
   68. [setSplintFactor(float)](#setSplintFactor(float))
   69. [getFractureTime()](#getFractureTime())
   70. [setFractureTime(float)](#setFractureTime(float))
   71. [isGetSplintXp()](#isGetSplintXp())
   72. [setGetSplintXp(boolean)](#setGetSplintXp(boolean))
   73. [isSplint()](#isSplint())
   74. [setSplint(boolean, float)](#setSplint(boolean,float))
   75. [haveBullet()](#haveBullet())
   76. [setHaveBullet(boolean, int)](#setHaveBullet(boolean,int))
   77. [getBurnTime()](#getBurnTime())
   78. [setBurnTime(float)](#setBurnTime(float))
   79. [isNeedBurnWash()](#isNeedBurnWash())
   80. [setNeedBurnWash(boolean)](#setNeedBurnWash(boolean))
   81. [getLastTimeBurnWash()](#getLastTimeBurnWash())
   82. [setLastTimeBurnWash(float)](#setLastTimeBurnWash(float))
   83. [isInfectedWound()](#isInfectedWound())
   84. [setInfectedWound(boolean)](#setInfectedWound(boolean))
   85. [getType()](#getType())
   86. [getBleedingTime()](#getBleedingTime())
   87. [setBleedingTime(float)](#setBleedingTime(float))
   88. [isDeepWounded()](#isDeepWounded())
   89. [setDeepWounded(boolean)](#setDeepWounded(boolean))
   90. [getBandageLife()](#getBandageLife())
   91. [setBandageLife(float)](#setBandageLife(float))
   92. [getScratchTime()](#getScratchTime())
   93. [setScratchTime(float)](#setScratchTime(float))
   94. [getWoundInfectionLevel()](#getWoundInfectionLevel())
   95. [setWoundInfectionLevel(float)](#setWoundInfectionLevel(float))
   96. [setBurned()](#setBurned())
   97. [getSplintItem()](#getSplintItem())
   98. [setSplintItem(String)](#setSplintItem(java.lang.String))
   99. [getPlantainFactor()](#getPlantainFactor())
   100. [setPlantainFactor(float)](#setPlantainFactor(float))
   101. [getGarlicFactor()](#getGarlicFactor())
   102. [setGarlicFactor(float)](#setGarlicFactor(float))
   103. [getComfreyFactor()](#getComfreyFactor())
   104. [setComfreyFactor(float)](#setComfreyFactor(float))
   105. [sync(BodyPart, BodyDamageSync.Updater)](#sync(zombie.characters.BodyDamage.BodyPart,zombie.network.BodyDamageSync.Updater))
   106. [sync(ByteBufferReader, byte)](#sync(zombie.core.network.ByteBufferReader,byte))
   107. [syncWrite(ByteBufferWriter, int)](#syncWrite(zombie.core.network.ByteBufferWriter,int))
   108. [getCutTime()](#getCutTime())
   109. [setCutTime(float)](#setCutTime(float))
   110. [isCut()](#isCut())
   111. [getScratchSpeedModifier()](#getScratchSpeedModifier())
   112. [setScratchSpeedModifier(float)](#setScratchSpeedModifier(float))
   113. [getCutSpeedModifier()](#getCutSpeedModifier())
   114. [setCutSpeedModifier(float)](#setCutSpeedModifier(float))
   115. [getBurnSpeedModifier()](#getBurnSpeedModifier())
   116. [setBurnSpeedModifier(float)](#setBurnSpeedModifier(float))
   117. [getDeepWoundSpeedModifier()](#getDeepWoundSpeedModifier())
   118. [setDeepWoundSpeedModifier(float)](#setDeepWoundSpeedModifier(float))
   119. [isBurnt()](#isBurnt())
   120. [generateBleeding()](#generateBleeding())
   121. [getInnerTemperature()](#getInnerTemperature())
   122. [getSkinTemperature()](#getSkinTemperature())
   123. [getDistToCore()](#getDistToCore())
   124. [getSkinSurface()](#getSkinSurface())
   125. [getThermalNode()](#getThermalNode())
   126. [getWetness()](#getWetness())
   127. [setWetness(float)](#setWetness(float))
   128. [getStiffness()](#getStiffness())
   129. [setStiffness(float)](#setStiffness(float))
   130. [hasDirtyClothing()](#hasDirtyClothing())
   131. [hasBloodyClothing()](#hasBloodyClothing())
   132. [addStiffness(float)](#addStiffness(float))
   133. [getDamageScaler()](#getDamageScaler())
   134. [getBandageNeededDamageLevel()](#getBandageNeededDamageLevel())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class BodyPart
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BodyDamage.BodyPart

---

public final class BodyPart
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `additionalPain`

  `private boolean`

  `alcoholicBandage`

  `private float`

  `alcoholLevel`

  `private boolean`

  `bandaged`

  `private float`

  `bandageLife`

  `private String`

  `bandageType`

  `private final float`

  `biteDamage`

  `private float`

  `biteTime`

  `private boolean`

  `bitten`

  `private final float`

  `bleedDamage`

  `private boolean`

  `bleeding`

  `private float`

  `bleedingTime`

  `private final float`

  `bulletDamage`

  `private final float`

  `burnDamage`

  `private float`

  `burnSpeedModifier`

  `private float`

  `burnTime`

  `private float`

  `comfreyFactor`

  `private boolean`

  `cut`

  `private final float`

  `cutDamage`

  `private float`

  `cutSpeedModifier`

  `private float`

  `cutTime`

  `private float`

  `damageScaler`

  `private boolean`

  `deepWounded`

  `private float`

  `deepWoundSpeedModifier`

  `private float`

  `deepWoundTime`

  `private final float`

  `fractureDamage`

  `private float`

  `fractureTime`

  `private float`

  `garlicFactor`

  `private boolean`

  `getBandageXp`

  `private boolean`

  `getSplintXp`

  `private boolean`

  `getStitchXp`

  `private boolean`

  `haveBullet`

  `private boolean`

  `haveGlass`

  `private float`

  `health`

  `private boolean`

  `infectedWound`

  `private boolean`

  `isBleedingStemmed`

  `private boolean`

  `isCauterized`

  `private boolean`

  `isFakeInfected`

  `private boolean`

  `isInfected`

  `private float`

  `lastTimeBurnWash`

  `private String`

  `manipulatingUsername`

  `private boolean`

  `needBurnWash`

  `private final IsoGameCharacter`

  `parentChar`

  `private float`

  `plantainFactor`

  `private final float`

  `scratchDamage`

  `private boolean`

  `scratched`

  `private float`

  `scratchSpeedModifier`

  `private float`

  `scratchTime`

  `private boolean`

  `splint`

  `private float`

  `splintFactor`

  `private String`

  `splintItem`

  `private float`

  `stiffness`

  `private boolean`

  `stitched`

  `private float`

  `stitchTime`

  `protected Thermoregulator.ThermalNode`

  `thermalNode`

  `BodyPartType`

  `type`

  `private float`

  `wetness`

  `private final float`

  `woundDamage`

  `private float`

  `woundInfectionLevel`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BodyPart(BodyPartType partType,
  IsoGameCharacter parent)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddDamage(float val)`

  `void`

  `AddHealth(float val)`

  `void`

  `addStiffness(float stiffness)`

  `boolean`

  `bandaged()`

  `boolean`

  `bitten()`

  `boolean`

  `bleeding()`

  `void`

  `damageFromFirearm(float damage)`

  `void`

  `DamageUpdate()`

  `boolean`

  `deepWounded()`

  `void`

  `DisableFakeInfection()`

  `void`

  `generateBleeding()`

  `void`

  `generateDeepShardWound()`

  `void`

  `generateDeepWound()`

  `void`

  `generateFracture(float fractureTime)`

  `void`

  `generateFractureNew(float fractureTime)`

  `void`

  `generateZombieInfection(int baseChance)`

  `float`

  `getAdditionalPain()`

  `float`

  `getAdditionalPain(boolean includeStiffness)`

  `float`

  `getAlcoholLevel()`

  `float`

  `getBandageLife()`

  `float`

  `getBandageNeededDamageLevel()`

  `String`

  `getBandageType()`

  `float`

  `getBiteTime()`

  `float`

  `getBleedingTime()`

  `float`

  `getBurnSpeedModifier()`

  `float`

  `getBurnTime()`

  `float`

  `getComfreyFactor()`

  `float`

  `getCutSpeedModifier()`

  `float`

  `getCutTime()`

  `float`

  `getDamageScaler()`

  `float`

  `getDeepWoundSpeedModifier()`

  `float`

  `getDeepWoundTime()`

  `float`

  `getDistToCore()`

  `float`

  `getFractureTime()`

  `float`

  `getGarlicFactor()`

  `float`

  `getHealth()`

  `int`

  `getIndex()`

  `float`

  `getInnerTemperature()`

  `float`

  `getLastTimeBurnWash()`

  `float`

  `getPain()`

  `IsoGameCharacter`

  `getParentChar()`

  `float`

  `getPlantainFactor()`

  `float`

  `getScratchSpeedModifier()`

  `float`

  `getScratchTime()`

  `float`

  `getSkinSurface()`

  `float`

  `getSkinTemperature()`

  `float`

  `getSplintFactor()`

  `String`

  `getSplintItem()`

  `float`

  `getStiffness()`

  `float`

  `getStitchTime()`

  `Thermoregulator.ThermalNode`

  `getThermalNode()`

  `BodyPartType`

  `getType()`

  `float`

  `getWetness()`

  `float`

  `getWoundInfectionLevel()`

  `boolean`

  `hasBloodyClothing()`

  `boolean`

  `hasDirtyClothing()`

  `boolean`

  `HasInjury()`

  `boolean`

  `haveBullet()`

  `boolean`

  `haveGlass()`

  `boolean`

  `isBandageDirty()`

  `boolean`

  `IsBleedingStemmed()`

  `boolean`

  `isBurnt()`

  `boolean`

  `IsCauterized()`

  `boolean`

  `isCut()`

  `boolean`

  `isDeepWounded()`

  `boolean`

  `IsFakeInfected()`

  `boolean`

  `isGetBandageXp()`

  `boolean`

  `isGetSplintXp()`

  `boolean`

  `isGetStitchXp()`

  `boolean`

  `IsInfected()`

  `boolean`

  `isInfectedWound()`

  `boolean`

  `isNeedBurnWash()`

  `boolean`

  `isSplint()`

  `String`

  `manipulatingUsername()`

  `void`

  `ReduceHealth(float val)`

  `private void`

  `resetPoulticeFactors()`

  `void`

  `RestoreToFullHealth()`

  `boolean`

  `scratched()`

  `void`

  `setAdditionalPain(float additionalPain)`

  `void`

  `setAlcoholLevel(float alcoholLevel)`

  `void`

  `setBandaged(boolean bandaged,
  float bandageLife)`

  `void`

  `setBandaged(boolean bandaged,
  float bandageLife,
  boolean isAlcoholic,
  String bandageType)`

  `void`

  `setBandageLife(float bandageLife)`

  `void`

  `setBandageType(String bandageType)`

  `void`

  `setBiteTime(float biteTime)`

  `void`

  `SetBitten(boolean bitten)`

  `void`

  `SetBitten(boolean bitten,
  boolean infected)`

  `void`

  `setBleeding(boolean bleeding)`

  `void`

  `SetBleedingStemmed(boolean bleedingStemmed)`

  `void`

  `setBleedingTime(float bleedingTime)`

  `void`

  `setBurned()`

  `void`

  `setBurnSpeedModifier(float burnSpeedModifier)`

  `void`

  `setBurnTime(float burnTime)`

  `void`

  `SetCauterized(boolean cauterized)`

  `void`

  `setComfreyFactor(float comfreyFactor)`

  `void`

  `setCut(boolean cut)`

  `void`

  `setCut(boolean cut,
  boolean forceNoInfection)`

  `void`

  `setCutSpeedModifier(float cutSpeedModifier)`

  `void`

  `setCutTime(float cutTime)`

  `void`

  `setDeepWounded(boolean wounded)`

  `void`

  `setDeepWoundSpeedModifier(float deepWoundSpeedModifier)`

  `void`

  `setDeepWoundTime(float deepWoundTime)`

  `void`

  `SetFakeInfected(boolean inf)`

  `void`

  `setFractureTime(float fractureTime)`

  `void`

  `setGarlicFactor(float garlicFactor)`

  `void`

  `setGetBandageXp(boolean getBandageXp)`

  `void`

  `setGetSplintXp(boolean getSplintXp)`

  `void`

  `setGetStitchXp(boolean getStitchXp)`

  `void`

  `setHaveBullet(boolean haveBullet,
  int doctorLevel)`

  `void`

  `setHaveGlass(boolean haveGlass)`

  `void`

  `SetHealth(float newHealth)`

  `void`

  `SetInfected(boolean inf)`

  `void`

  `setInfectedWound(boolean infectedWound)`

  `void`

  `setLastTimeBurnWash(float lastTimeBurnWash)`

  `void`

  `setManipulatingUsername(String manipulatingUsername)`

  `void`

  `setNeedBurnWash(boolean needBurnWash)`

  `void`

  `setPlantainFactor(float plantainFactor)`

  `void`

  `setScratched(boolean scratched,
  boolean forceNoInfection)`

  `void`

  `SetScratchedWeapon(boolean scratched)`

  `void`

  `SetScratchedWindow(boolean scratched)`

  `void`

  `setScratchSpeedModifier(float scratchSpeedModifier)`

  `void`

  `setScratchTime(float scratchTime)`

  `void`

  `setSplint(boolean splint,
  float splintFactor)`

  `void`

  `setSplintFactor(float splintFactor)`

  `void`

  `setSplintItem(String splintItem)`

  `void`

  `setStiffness(float stiffness)`

  `void`

  `setStitched(boolean stitched)`

  `void`

  `setStitchTime(float stitchTime)`

  `void`

  `setWetness(float wetness)`

  `void`

  `setWoundInfectionLevel(float infectedWound)`

  `boolean`

  `stitched()`

  `void`

  `sync(BodyPart other,
  zombie.network.BodyDamageSync.Updater updater)`

  `void`

  `sync(zombie.core.network.ByteBufferReader bb,
  byte id)`

  `void`

  `syncWrite(zombie.core.network.ByteBufferWriter bb,
  int id)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### type

    public [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") type
  + ### biteDamage

    private final float biteDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyPart.biteDamage)
  + ### bleedDamage

    private final float bleedDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyPart.bleedDamage)
  + ### damageScaler

    private float damageScaler
  + ### health

    private float health
  + ### bandaged

    private boolean bandaged
  + ### manipulatingUsername

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") manipulatingUsername
  + ### bitten

    private boolean bitten
  + ### bleeding

    private boolean bleeding
  + ### isBleedingStemmed

    private boolean isBleedingStemmed
  + ### isCauterized

    private boolean isCauterized
  + ### scratched

    private boolean scratched
  + ### stitched

    private boolean stitched
  + ### deepWounded

    private boolean deepWounded
  + ### isInfected

    private boolean isInfected
  + ### isFakeInfected

    private boolean isFakeInfected
  + ### parentChar

    private final [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") parentChar
  + ### bandageLife

    private float bandageLife
  + ### scratchTime

    private float scratchTime
  + ### biteTime

    private float biteTime
  + ### alcoholicBandage

    private boolean alcoholicBandage
  + ### stiffness

    private float stiffness
  + ### woundInfectionLevel

    private float woundInfectionLevel
  + ### infectedWound

    private boolean infectedWound
  + ### scratchDamage

    private final float scratchDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyPart.scratchDamage)
  + ### cutDamage

    private final float cutDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyPart.cutDamage)
  + ### woundDamage

    private final float woundDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyPart.woundDamage)
  + ### burnDamage

    private final float burnDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyPart.burnDamage)
  + ### bulletDamage

    private final float bulletDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyPart.bulletDamage)
  + ### fractureDamage

    private final float fractureDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.BodyPart.fractureDamage)
  + ### bleedingTime

    private float bleedingTime
  + ### deepWoundTime

    private float deepWoundTime
  + ### haveGlass

    private boolean haveGlass
  + ### stitchTime

    private float stitchTime
  + ### alcoholLevel

    private float alcoholLevel
  + ### additionalPain

    private float additionalPain
  + ### bandageType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bandageType
  + ### getBandageXp

    private boolean getBandageXp
  + ### getStitchXp

    private boolean getStitchXp
  + ### getSplintXp

    private boolean getSplintXp
  + ### fractureTime

    private float fractureTime
  + ### splint

    private boolean splint
  + ### splintFactor

    private float splintFactor
  + ### haveBullet

    private boolean haveBullet
  + ### burnTime

    private float burnTime
  + ### needBurnWash

    private boolean needBurnWash
  + ### lastTimeBurnWash

    private float lastTimeBurnWash
  + ### splintItem

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") splintItem
  + ### plantainFactor

    private float plantainFactor
  + ### comfreyFactor

    private float comfreyFactor
  + ### garlicFactor

    private float garlicFactor
  + ### cutTime

    private float cutTime
  + ### cut

    private boolean cut
  + ### scratchSpeedModifier

    private float scratchSpeedModifier
  + ### cutSpeedModifier

    private float cutSpeedModifier
  + ### burnSpeedModifier

    private float burnSpeedModifier
  + ### deepWoundSpeedModifier

    private float deepWoundSpeedModifier
  + ### wetness

    private float wetness
  + ### thermalNode

    protected [Thermoregulator.ThermalNode](Thermoregulator.ThermalNode.html "class in zombie.characters.BodyDamage") thermalNode
* Constructor Details
  -------------------

  + ### BodyPart

    public BodyPart([BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") partType,
    [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") parent)
* Method Details
  --------------

  + ### getParentChar

    public [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") getParentChar()
  + ### AddDamage

    public void AddDamage(float val)
  + ### isBandageDirty

    public boolean isBandageDirty()
  + ### DamageUpdate

    public void DamageUpdate()
  + ### resetPoulticeFactors

    private void resetPoulticeFactors()
  + ### getHealth

    public float getHealth()
  + ### SetHealth

    public void SetHealth(float newHealth)
  + ### AddHealth

    public void AddHealth(float val)
  + ### ReduceHealth

    public void ReduceHealth(float val)
  + ### HasInjury

    public boolean HasInjury()
  + ### bandaged

    public boolean bandaged()
  + ### manipulatingUsername

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") manipulatingUsername()
  + ### bitten

    public boolean bitten()
  + ### bleeding

    public boolean bleeding()
  + ### IsBleedingStemmed

    public boolean IsBleedingStemmed()
  + ### IsCauterized

    public boolean IsCauterized()
  + ### IsInfected

    public boolean IsInfected()
  + ### SetInfected

    public void SetInfected(boolean inf)
  + ### SetFakeInfected

    public void SetFakeInfected(boolean inf)
  + ### IsFakeInfected

    public boolean IsFakeInfected()
  + ### DisableFakeInfection

    public void DisableFakeInfection()
  + ### scratched

    public boolean scratched()
  + ### stitched

    public boolean stitched()
  + ### deepWounded

    public boolean deepWounded()
  + ### RestoreToFullHealth

    public void RestoreToFullHealth()
  + ### setBandaged

    public void setBandaged(boolean bandaged,
    float bandageLife)
  + ### setBandaged

    public void setBandaged(boolean bandaged,
    float bandageLife,
    boolean isAlcoholic,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bandageType)
  + ### setManipulatingUsername

    public void setManipulatingUsername([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") manipulatingUsername)
  + ### SetBitten

    public void SetBitten(boolean bitten)
  + ### SetBitten

    public void SetBitten(boolean bitten,
    boolean infected)
  + ### setBleeding

    public void setBleeding(boolean bleeding)
  + ### SetBleedingStemmed

    public void SetBleedingStemmed(boolean bleedingStemmed)
  + ### SetCauterized

    public void SetCauterized(boolean cauterized)
  + ### setCut

    public void setCut(boolean cut)
  + ### setCut

    public void setCut(boolean cut,
    boolean forceNoInfection)
  + ### generateZombieInfection

    public void generateZombieInfection(int baseChance)
  + ### setScratched

    public void setScratched(boolean scratched,
    boolean forceNoInfection)
  + ### SetScratchedWeapon

    public void SetScratchedWeapon(boolean scratched)
  + ### generateDeepWound

    public void generateDeepWound()
  + ### generateDeepShardWound

    public void generateDeepShardWound()
  + ### generateFracture

    public void generateFracture(float fractureTime)
  + ### generateFractureNew

    public void generateFractureNew(float fractureTime)
  + ### SetScratchedWindow

    public void SetScratchedWindow(boolean scratched)
  + ### setStitched

    public void setStitched(boolean stitched)
  + ### damageFromFirearm

    public void damageFromFirearm(float damage)
  + ### getPain

    public float getPain()
  + ### getBiteTime

    public float getBiteTime()
  + ### setBiteTime

    public void setBiteTime(float biteTime)
  + ### getDeepWoundTime

    public float getDeepWoundTime()
  + ### setDeepWoundTime

    public void setDeepWoundTime(float deepWoundTime)
  + ### haveGlass

    public boolean haveGlass()
  + ### setHaveGlass

    public void setHaveGlass(boolean haveGlass)
  + ### getStitchTime

    public float getStitchTime()
  + ### setStitchTime

    public void setStitchTime(float stitchTime)
  + ### getIndex

    public int getIndex()
  + ### getAlcoholLevel

    public float getAlcoholLevel()
  + ### setAlcoholLevel

    public void setAlcoholLevel(float alcoholLevel)
  + ### getAdditionalPain

    public float getAdditionalPain(boolean includeStiffness)
  + ### getAdditionalPain

    public float getAdditionalPain()
  + ### setAdditionalPain

    public void setAdditionalPain(float additionalPain)
  + ### getBandageType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBandageType()
  + ### setBandageType

    public void setBandageType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bandageType)
  + ### isGetBandageXp

    public boolean isGetBandageXp()
  + ### setGetBandageXp

    public void setGetBandageXp(boolean getBandageXp)
  + ### isGetStitchXp

    public boolean isGetStitchXp()
  + ### setGetStitchXp

    public void setGetStitchXp(boolean getStitchXp)
  + ### getSplintFactor

    public float getSplintFactor()
  + ### setSplintFactor

    public void setSplintFactor(float splintFactor)
  + ### getFractureTime

    public float getFractureTime()
  + ### setFractureTime

    public void setFractureTime(float fractureTime)
  + ### isGetSplintXp

    public boolean isGetSplintXp()
  + ### setGetSplintXp

    public void setGetSplintXp(boolean getSplintXp)
  + ### isSplint

    public boolean isSplint()
  + ### setSplint

    public void setSplint(boolean splint,
    float splintFactor)
  + ### haveBullet

    public boolean haveBullet()
  + ### setHaveBullet

    public void setHaveBullet(boolean haveBullet,
    int doctorLevel)
  + ### getBurnTime

    public float getBurnTime()
  + ### setBurnTime

    public void setBurnTime(float burnTime)
  + ### isNeedBurnWash

    public boolean isNeedBurnWash()
  + ### setNeedBurnWash

    public void setNeedBurnWash(boolean needBurnWash)
  + ### getLastTimeBurnWash

    public float getLastTimeBurnWash()
  + ### setLastTimeBurnWash

    public void setLastTimeBurnWash(float lastTimeBurnWash)
  + ### isInfectedWound

    public boolean isInfectedWound()
  + ### setInfectedWound

    public void setInfectedWound(boolean infectedWound)
  + ### getType

    public [BodyPartType](BodyPartType.html "enum class in zombie.characters.BodyDamage") getType()
  + ### getBleedingTime

    public float getBleedingTime()
  + ### setBleedingTime

    public void setBleedingTime(float bleedingTime)
  + ### isDeepWounded

    public boolean isDeepWounded()
  + ### setDeepWounded

    public void setDeepWounded(boolean wounded)
  + ### getBandageLife

    public float getBandageLife()
  + ### setBandageLife

    public void setBandageLife(float bandageLife)
  + ### getScratchTime

    public float getScratchTime()
  + ### setScratchTime

    public void setScratchTime(float scratchTime)
  + ### getWoundInfectionLevel

    public float getWoundInfectionLevel()
  + ### setWoundInfectionLevel

    public void setWoundInfectionLevel(float infectedWound)
  + ### setBurned

    public void setBurned()
  + ### getSplintItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSplintItem()
  + ### setSplintItem

    public void setSplintItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") splintItem)
  + ### getPlantainFactor

    public float getPlantainFactor()
  + ### setPlantainFactor

    public void setPlantainFactor(float plantainFactor)
  + ### getGarlicFactor

    public float getGarlicFactor()
  + ### setGarlicFactor

    public void setGarlicFactor(float garlicFactor)
  + ### getComfreyFactor

    public float getComfreyFactor()
  + ### setComfreyFactor

    public void setComfreyFactor(float comfreyFactor)
  + ### sync

    public void sync([BodyPart](BodyPart.html "class in zombie.characters.BodyDamage") other,
    zombie.network.BodyDamageSync.Updater updater)
  + ### sync

    public void sync(zombie.core.network.ByteBufferReader bb,
    byte id)
  + ### syncWrite

    public void syncWrite(zombie.core.network.ByteBufferWriter bb,
    int id)
  + ### getCutTime

    public float getCutTime()
  + ### setCutTime

    public void setCutTime(float cutTime)
  + ### isCut

    public boolean isCut()
  + ### getScratchSpeedModifier

    public float getScratchSpeedModifier()
  + ### setScratchSpeedModifier

    public void setScratchSpeedModifier(float scratchSpeedModifier)
  + ### getCutSpeedModifier

    public float getCutSpeedModifier()
  + ### setCutSpeedModifier

    public void setCutSpeedModifier(float cutSpeedModifier)
  + ### getBurnSpeedModifier

    public float getBurnSpeedModifier()
  + ### setBurnSpeedModifier

    public void setBurnSpeedModifier(float burnSpeedModifier)
  + ### getDeepWoundSpeedModifier

    public float getDeepWoundSpeedModifier()
  + ### setDeepWoundSpeedModifier

    public void setDeepWoundSpeedModifier(float deepWoundSpeedModifier)
  + ### isBurnt

    public boolean isBurnt()
  + ### generateBleeding

    public void generateBleeding()
  + ### getInnerTemperature

    public float getInnerTemperature()
  + ### getSkinTemperature

    public float getSkinTemperature()
  + ### getDistToCore

    public float getDistToCore()
  + ### getSkinSurface

    public float getSkinSurface()
  + ### getThermalNode

    public [Thermoregulator.ThermalNode](Thermoregulator.ThermalNode.html "class in zombie.characters.BodyDamage") getThermalNode()
  + ### getWetness

    public float getWetness()
  + ### setWetness

    public void setWetness(float wetness)
  + ### getStiffness

    public float getStiffness()
  + ### setStiffness

    public void setStiffness(float stiffness)
  + ### hasDirtyClothing

    public boolean hasDirtyClothing()
  + ### hasBloodyClothing

    public boolean hasBloodyClothing()
  + ### addStiffness

    public void addStiffness(float stiffness)
  + ### getDamageScaler

    public float getDamageScaler()
  + ### getBandageNeededDamageLevel

    public float getBandageNeededDamageLevel()