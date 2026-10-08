[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.SpriteDetails](package-summary.html)
2. [IsoFlagType](IsoFlagType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [collideW](#collideW)
   2. [collideN](#collideN)
   3. [solidfloor](#solidfloor)
   4. [noStart](#noStart)
   5. [windowW](#windowW)
   6. [windowN](#windowN)
   7. [hidewalls](#hidewalls)
   8. [exterior](#exterior)
   9. [NoWallLighting](#NoWallLighting)
   10. [doorW](#doorW)
   11. [doorN](#doorN)
   12. [transparentW](#transparentW)
   13. [transparentN](#transparentN)
   14. [WallOverlay](#WallOverlay)
   15. [FloorOverlay](#FloorOverlay)
   16. [vegitation](#vegitation)
   17. [burning](#burning)
   18. [burntOut](#burntOut)
   19. [unflamable](#unflamable)
   20. [cutW](#cutW)
   21. [cutN](#cutN)
   22. [tableN](#tableN)
   23. [tableNW](#tableNW)
   24. [tableW](#tableW)
   25. [tableSW](#tableSW)
   26. [tableS](#tableS)
   27. [tableSE](#tableSE)
   28. [tableE](#tableE)
   29. [tableNE](#tableNE)
   30. [halfheight](#halfheight)
   31. [HasRainSplashes](#HasRainSplashes)
   32. [HasRaindrop](#HasRaindrop)
   33. [solid](#solid)
   34. [trans](#trans)
   35. [pushable](#pushable)
   36. [solidtrans](#solidtrans)
   37. [invisible](#invisible)
   38. [floorS](#floorS)
   39. [floorE](#floorE)
   40. [shelfS](#shelfS)
   41. [shelfE](#shelfE)
   42. [alwaysDraw](#alwaysDraw)
   43. [ontable](#ontable)
   44. [transparentFloor](#transparentFloor)
   45. [climbSheetW](#climbSheetW)
   46. [climbSheetN](#climbSheetN)
   47. [climbSheetTopN](#climbSheetTopN)
   48. [climbSheetTopW](#climbSheetTopW)
   49. [attachtostairs](#attachtostairs)
   50. [sheetCurtains](#sheetCurtains)
   51. [waterPiped](#waterPiped)
   52. [HoppableN](#HoppableN)
   53. [HoppableW](#HoppableW)
   54. [bed](#bed)
   55. [blueprint](#blueprint)
   56. [canPathW](#canPathW)
   57. [canPathN](#canPathN)
   58. [blocksight](#blocksight)
   59. [climbSheetE](#climbSheetE)
   60. [climbSheetS](#climbSheetS)
   61. [climbSheetTopE](#climbSheetTopE)
   62. [climbSheetTopS](#climbSheetTopS)
   63. [makeWindowInvincible](#makeWindowInvincible)
   64. [water](#water)
   65. [canBeCut](#canBeCut)
   66. [canBeRemoved](#canBeRemoved)
   67. [taintedWater](#taintedWater)
   68. [smoke](#smoke)
   69. [attachedN](#attachedN)
   70. [attachedS](#attachedS)
   71. [attachedE](#attachedE)
   72. [attachedW](#attachedW)
   73. [attachedFloor](#attachedFloor)
   74. [attachedSurface](#attachedSurface)
   75. [attachedCeiling](#attachedCeiling)
   76. [attachedNW](#attachedNW)
   77. [ForceAmbient](#ForceAmbient)
   78. [WallSE](#WallSE)
   79. [WindowN](#WindowN)
   80. [WindowW](#WindowW)
   81. [FloorHeightOneThird](#FloorHeightOneThird)
   82. [FloorHeightTwoThirds](#FloorHeightTwoThirds)
   83. [CantClimb](#CantClimb)
   84. [diamondFloor](#diamondFloor)
   85. [attachedSE](#attachedSE)
   86. [TallHoppableW](#TallHoppableW)
   87. [WallWTrans](#WallWTrans)
   88. [TallHoppableN](#TallHoppableN)
   89. [WallNTrans](#WallNTrans)
   90. [container](#container)
   91. [DoorWallW](#DoorWallW)
   92. [DoorWallN](#DoorWallN)
   93. [WallW](#WallW)
   94. [WallN](#WallN)
   95. [WallNW](#WallNW)
   96. [SpearOnlyAttackThrough](#SpearOnlyAttackThrough)
   97. [forceRender](#forceRender)
   98. [open](#open)
   99. [SpriteConfig](#SpriteConfig)
   100. [BlockRain](#BlockRain)
   101. [EntityScript](#EntityScript)
   102. [isEave](#isEave)
   103. [openAir](#openAir)
   104. [HasLightOnSprite](#HasLightOnSprite)
   105. [unlit](#unlit)
   106. [NeverCutaway](#NeverCutaway)
   107. [DoubleDoor1](#DoubleDoor1)
   108. [DoubleDoor2](#DoubleDoor2)
   109. [IsFloorAttached](#IsFloorAttached)
   110. [FloorAttachmentN](#FloorAttachmentN)
   111. [FloorAttachmentS](#FloorAttachmentS)
   112. [FloorAttachmentE](#FloorAttachmentE)
   113. [FloorAttachmentW](#FloorAttachmentW)
   114. [MAX](#MAX)
8. [Field Details](#field-detail)
   1. [index](#index)
   2. [EnumConstants](#EnumConstants)
   3. [fromStringMap](#fromStringMap)
9. [Constructor Details](#constructor-detail)
   1. [IsoFlagType(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [index()](#index())
    4. [fromIndex(int)](#fromIndex(int))
    5. [FromString(String)](#FromString(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class IsoFlagType
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails")>

zombie.iso.SpriteDetails.IsoFlagType

All Implemented Interfaces:
:   `Serializable, Comparable<IsoFlagType>, Constable`

---

public enum IsoFlagType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `alwaysDraw`

  `attachedCeiling`

  `attachedE`

  `attachedFloor`

  `attachedN`

  `attachedNW`

  `attachedS`

  `attachedSE`

  `attachedSurface`

  `attachedW`

  `attachtostairs`

  `bed`

  `BlockRain`

  `blocksight`

  `blueprint`

  `burning`

  `burntOut`

  `canBeCut`

  `canBeRemoved`

  `canPathN`

  `canPathW`

  `CantClimb`

  `climbSheetE`

  `climbSheetN`

  `climbSheetS`

  `climbSheetTopE`

  `climbSheetTopN`

  `climbSheetTopS`

  `climbSheetTopW`

  `climbSheetW`

  `collideN`

  `collideW`

  `container`

  `cutN`

  `cutW`

  `diamondFloor`

  `doorN`

  `doorW`

  `DoorWallN`

  `DoorWallW`

  `DoubleDoor1`

  `DoubleDoor2`

  `EntityScript`

  `exterior`

  `FloorAttachmentE`

  `FloorAttachmentN`

  `FloorAttachmentS`

  `FloorAttachmentW`

  `floorE`

  `FloorHeightOneThird`

  `FloorHeightTwoThirds`

  `FloorOverlay`

  `floorS`

  `ForceAmbient`

  `forceRender`

  `halfheight`

  `HasLightOnSprite`

  `HasRaindrop`

  `HasRainSplashes`

  `hidewalls`

  `HoppableN`

  `HoppableW`

  `invisible`

  `isEave`

  `IsFloorAttached`

  `makeWindowInvincible`

  `MAX`

  `NeverCutaway`

  `noStart`

  `NoWallLighting`

  `ontable`

  `open`

  `openAir`

  `pushable`

  `sheetCurtains`

  `shelfE`

  `shelfS`

  `smoke`

  `solid`

  `solidfloor`

  `solidtrans`

  `SpearOnlyAttackThrough`

  `SpriteConfig`

  `tableE`

  `tableN`

  `tableNE`

  `tableNW`

  `tableS`

  `tableSE`

  `tableSW`

  `tableW`

  `taintedWater`

  `TallHoppableN`

  `TallHoppableW`

  `trans`

  `transparentFloor`

  `transparentN`

  `transparentW`

  `unflamable`

  `unlit`

  `vegitation`

  `WallN`

  `WallNTrans`

  `WallNW`

  `WallOverlay`

  `WallSE`

  `WallW`

  `WallWTrans`

  `water`

  `waterPiped`

  `windowN`

  `WindowN`

  `windowW`

  `WindowW`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final IsoFlagType[]`

  `EnumConstants`

  `private static final HashMap<String, IsoFlagType>`

  `fromStringMap`

  `private final int`

  `index`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `IsoFlagType(int index)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoFlagType`

  `fromIndex(int value)`

  `static IsoFlagType`

  `FromString(String str)`

  `int`

  `index()`

  `static IsoFlagType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static IsoFlagType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### collideW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") collideW
  + ### collideN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") collideN
  + ### solidfloor

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") solidfloor
  + ### noStart

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") noStart
  + ### windowW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") windowW
  + ### windowN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") windowN
  + ### hidewalls

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") hidewalls
  + ### exterior

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") exterior
  + ### NoWallLighting

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") NoWallLighting
  + ### doorW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") doorW
  + ### doorN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") doorN
  + ### transparentW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") transparentW
  + ### transparentN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") transparentN
  + ### WallOverlay

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") WallOverlay
  + ### FloorOverlay

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") FloorOverlay
  + ### vegitation

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") vegitation
  + ### burning

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") burning
  + ### burntOut

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") burntOut
  + ### unflamable

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") unflamable
  + ### cutW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") cutW
  + ### cutN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") cutN
  + ### tableN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") tableN
  + ### tableNW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") tableNW
  + ### tableW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") tableW
  + ### tableSW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") tableSW
  + ### tableS

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") tableS
  + ### tableSE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") tableSE
  + ### tableE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") tableE
  + ### tableNE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") tableNE
  + ### halfheight

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") halfheight
  + ### HasRainSplashes

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") HasRainSplashes
  + ### HasRaindrop

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") HasRaindrop
  + ### solid

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") solid
  + ### trans

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") trans
  + ### pushable

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") pushable
  + ### solidtrans

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") solidtrans
  + ### invisible

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") invisible
  + ### floorS

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") floorS
  + ### floorE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") floorE
  + ### shelfS

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") shelfS
  + ### shelfE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") shelfE
  + ### alwaysDraw

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") alwaysDraw
  + ### ontable

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") ontable
  + ### transparentFloor

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") transparentFloor
  + ### climbSheetW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") climbSheetW
  + ### climbSheetN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") climbSheetN
  + ### climbSheetTopN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") climbSheetTopN
  + ### climbSheetTopW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") climbSheetTopW
  + ### attachtostairs

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachtostairs
  + ### sheetCurtains

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") sheetCurtains
  + ### waterPiped

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") waterPiped
  + ### HoppableN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") HoppableN
  + ### HoppableW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") HoppableW
  + ### bed

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") bed
  + ### blueprint

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") blueprint
  + ### canPathW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") canPathW
  + ### canPathN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") canPathN
  + ### blocksight

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") blocksight
  + ### climbSheetE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") climbSheetE
  + ### climbSheetS

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") climbSheetS
  + ### climbSheetTopE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") climbSheetTopE
  + ### climbSheetTopS

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") climbSheetTopS
  + ### makeWindowInvincible

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") makeWindowInvincible
  + ### water

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") water
  + ### canBeCut

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") canBeCut
  + ### canBeRemoved

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") canBeRemoved
  + ### taintedWater

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") taintedWater
  + ### smoke

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") smoke
  + ### attachedN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachedN
  + ### attachedS

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachedS
  + ### attachedE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachedE
  + ### attachedW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachedW
  + ### attachedFloor

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachedFloor
  + ### attachedSurface

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachedSurface
  + ### attachedCeiling

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachedCeiling
  + ### attachedNW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachedNW
  + ### ForceAmbient

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") ForceAmbient
  + ### WallSE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") WallSE
  + ### WindowN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") WindowN
  + ### WindowW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") WindowW
  + ### FloorHeightOneThird

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") FloorHeightOneThird
  + ### FloorHeightTwoThirds

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") FloorHeightTwoThirds
  + ### CantClimb

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") CantClimb
  + ### diamondFloor

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") diamondFloor
  + ### attachedSE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") attachedSE
  + ### TallHoppableW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") TallHoppableW
  + ### WallWTrans

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") WallWTrans
  + ### TallHoppableN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") TallHoppableN
  + ### WallNTrans

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") WallNTrans
  + ### container

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") container
  + ### DoorWallW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") DoorWallW
  + ### DoorWallN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") DoorWallN
  + ### WallW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") WallW
  + ### WallN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") WallN
  + ### WallNW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") WallNW
  + ### SpearOnlyAttackThrough

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") SpearOnlyAttackThrough
  + ### forceRender

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") forceRender
  + ### open

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") open
  + ### SpriteConfig

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") SpriteConfig
  + ### BlockRain

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") BlockRain
  + ### EntityScript

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") EntityScript
  + ### isEave

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") isEave
  + ### openAir

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") openAir
  + ### HasLightOnSprite

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") HasLightOnSprite
  + ### unlit

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") unlit
  + ### NeverCutaway

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") NeverCutaway
  + ### DoubleDoor1

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") DoubleDoor1
  + ### DoubleDoor2

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") DoubleDoor2
  + ### IsFloorAttached

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") IsFloorAttached
  + ### FloorAttachmentN

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") FloorAttachmentN
  + ### FloorAttachmentS

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") FloorAttachmentS
  + ### FloorAttachmentE

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") FloorAttachmentE
  + ### FloorAttachmentW

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") FloorAttachmentW
  + ### MAX

    public static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") MAX
* Field Details
  -------------

  + ### index

    private final int index
  + ### EnumConstants

    private static final [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails")[] EnumConstants
  + ### fromStringMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails")> fromStringMap
* Constructor Details
  -------------------

  + ### IsoFlagType

    private IsoFlagType(int index)
* Method Details
  --------------

  + ### values

    public static [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `name` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null
  + ### index

    public int index()
  + ### fromIndex

    public static [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") fromIndex(int value)
  + ### FromString

    public static [IsoFlagType](IsoFlagType.html "enum class in zombie.iso.SpriteDetails") FromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)