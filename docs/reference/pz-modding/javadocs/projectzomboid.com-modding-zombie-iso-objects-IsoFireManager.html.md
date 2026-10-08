[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoFireManager](IsoFireManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [updateStack](#updateStack)
   2. [charactersOnFire](#charactersOnFire)
   3. [redOscilator](#redOscilator)
   4. [greenOscilator](#greenOscilator)
   5. [blueOscilator](#blueOscilator)
   6. [redOscilatorRate](#redOscilatorRate)
   7. [greenOscilatorRate](#greenOscilatorRate)
   8. [blueOscilatorRate](#blueOscilatorRate)
   9. [redOscilatorVal](#redOscilatorVal)
   10. [greenOscilatorVal](#greenOscilatorVal)
   11. [blueOscilatorVal](#blueOscilatorVal)
   12. [oscilatorSpeedScalar](#oscilatorSpeedScalar)
   13. [oscilatorEffectScalar](#oscilatorEffectScalar)
   14. [maxFireObjects](#maxFireObjects)
   15. [fireRecalcDelay](#fireRecalcDelay)
   16. [fireRecalc](#fireRecalc)
   17. [lightCalcFromBurningCharacters](#lightCalcFromBurningCharacters)
   18. [fireAlpha](#fireAlpha)
   19. [smokeAlpha](#smokeAlpha)
   20. [FIRE\_ANIM\_DELAY](#FIRE_ANIM_DELAY)
   21. [smokeAnimDelay](#smokeAnimDelay)
   22. [FIRE\_TINT\_MOD](#FIRE_TINT_MOD)
   23. [smokeTintMod](#smokeTintMod)
   24. [FireStack](#FireStack)
   25. [CharactersOnFire\_Stack](#CharactersOnFire_Stack)
   26. [fireSounds](#fireSounds)
7. [Constructor Details](#constructor-detail)
   1. [IsoFireManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [Add(IsoFire)](#Add(zombie.iso.objects.IsoFire))
   2. [AddBurningCharacter(IsoGameCharacter)](#AddBurningCharacter(zombie.characters.IsoGameCharacter))
   3. [Fire\_LightCalc(IsoGridSquare, IsoGridSquare, int)](#Fire_LightCalc(zombie.iso.IsoGridSquare,zombie.iso.IsoGridSquare,int))
   4. [LightTileWithFire(IsoGridSquare)](#LightTileWithFire(zombie.iso.IsoGridSquare))
   5. [explode(IsoCell, IsoGridSquare, int)](#explode(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,int))
   6. [MolotovSmash(IsoCell, IsoGridSquare)](#MolotovSmash(zombie.iso.IsoCell,zombie.iso.IsoGridSquare))
   7. [Remove(IsoFire)](#Remove(zombie.iso.objects.IsoFire))
   8. [RemoveBurningCharacter(IsoGameCharacter)](#RemoveBurningCharacter(zombie.characters.IsoGameCharacter))
   9. [StartFire(IsoCell, IsoGridSquare, boolean, int, int)](#StartFire(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,boolean,int,int))
   10. [StartSmoke(IsoCell, IsoGridSquare, boolean, int, int)](#StartSmoke(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,boolean,int,int))
   11. [StartFire(IsoCell, IsoGridSquare, boolean, int)](#StartFire(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,boolean,int))
   12. [addCharacterOnFire(IsoGameCharacter)](#addCharacterOnFire(zombie.characters.IsoGameCharacter))
   13. [deleteCharacterOnFire(IsoGameCharacter)](#deleteCharacterOnFire(zombie.characters.IsoGameCharacter))
   14. [Update()](#Update())
   15. [updateSound(IsoFire)](#updateSound(zombie.iso.objects.IsoFire))
   16. [stopSound(IsoFire)](#stopSound(zombie.iso.objects.IsoFire))
   17. [RemoveAllOn(IsoGridSquare)](#RemoveAllOn(zombie.iso.IsoGridSquare))
   18. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoFireManager
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.objects.IsoFireManager

---

public class IsoFireManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `IsoFireManager.FireSounds`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static double`

  `blueOscilator`

  `static double`

  `blueOscilatorRate`

  `static double`

  `blueOscilatorVal`

  `private static final HashSet<IsoGameCharacter>`

  `charactersOnFire`

  `static final ArrayList<IsoGameCharacter>`

  `CharactersOnFire_Stack`

  `static final float`

  `FIRE_ANIM_DELAY`

  `static final ColorInfo`

  `FIRE_TINT_MOD`

  `static float`

  `fireAlpha`

  `static int`

  `fireRecalc`

  `static int`

  `fireRecalcDelay`

  `private static final IsoFireManager.FireSounds`

  `fireSounds`

  `static final ArrayList<IsoFire>`

  `FireStack`

  `static double`

  `greenOscilator`

  `static double`

  `greenOscilatorRate`

  `static double`

  `greenOscilatorVal`

  `static boolean`

  `lightCalcFromBurningCharacters`

  `static int`

  `maxFireObjects`

  `static double`

  `oscilatorEffectScalar`

  `static double`

  `oscilatorSpeedScalar`

  `static double`

  `redOscilator`

  `static double`

  `redOscilatorRate`

  `static double`

  `redOscilatorVal`

  `static float`

  `smokeAlpha`

  `static float`

  `smokeAnimDelay`

  `static ColorInfo`

  `smokeTintMod`

  `private static final Stack<IsoFire>`

  `updateStack`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoFireManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `static void`

  `Add(IsoFire newFire)`

  `static void`

  `AddBurningCharacter(IsoGameCharacter burningCharacter)`

  `static void`

  `addCharacterOnFire(IsoGameCharacter character)`

  `static void`

  `deleteCharacterOnFire(IsoGameCharacter character)`

  `static void`

  `explode(IsoCell cell,
  IsoGridSquare gridSquare,
  int power)`

  `static void`

  `Fire_LightCalc(IsoGridSquare fireSquare,
  IsoGridSquare testSquare,
  int playerIndex)`

  `static void`

  `LightTileWithFire(IsoGridSquare testSquare)`

  `static void`

  `MolotovSmash(IsoCell cell,
  IsoGridSquare gridSquare)`

  Deprecated.

  `static void`

  `Remove(IsoFire dyingFire)`

  `static void`

  `RemoveAllOn(IsoGridSquare sq)`

  `static void`

  `RemoveBurningCharacter(IsoGameCharacter burningCharacter)`

  `static void`

  `Reset()`

  `static void`

  `StartFire(IsoCell cell,
  IsoGridSquare gridSquare,
  boolean igniteOnAny,
  int fireStartingEnergy)`

  `static void`

  `StartFire(IsoCell cell,
  IsoGridSquare gridSquare,
  boolean igniteOnAny,
  int fireStartingEnergy,
  int life)`

  `static void`

  `StartSmoke(IsoCell cell,
  IsoGridSquare gridSquare,
  boolean igniteOnAny,
  int fireStartingEnergy,
  int life)`

  `static void`

  `stopSound(IsoFire fire)`

  `static void`

  `Update()`

  `static void`

  `updateSound(IsoFire fire)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### updateStack

    private static final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoFire](IsoFire.html "class in zombie.iso.objects")> updateStack
  + ### charactersOnFire

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters")> charactersOnFire
  + ### redOscilator

    public static double redOscilator
  + ### greenOscilator

    public static double greenOscilator
  + ### blueOscilator

    public static double blueOscilator
  + ### redOscilatorRate

    public static double redOscilatorRate
  + ### greenOscilatorRate

    public static double greenOscilatorRate
  + ### blueOscilatorRate

    public static double blueOscilatorRate
  + ### redOscilatorVal

    public static double redOscilatorVal
  + ### greenOscilatorVal

    public static double greenOscilatorVal
  + ### blueOscilatorVal

    public static double blueOscilatorVal
  + ### oscilatorSpeedScalar

    public static double oscilatorSpeedScalar
  + ### oscilatorEffectScalar

    public static double oscilatorEffectScalar
  + ### maxFireObjects

    public static int maxFireObjects
  + ### fireRecalcDelay

    public static int fireRecalcDelay
  + ### fireRecalc

    public static int fireRecalc
  + ### lightCalcFromBurningCharacters

    public static boolean lightCalcFromBurningCharacters
  + ### fireAlpha

    public static float fireAlpha
  + ### smokeAlpha

    public static float smokeAlpha
  + ### FIRE\_ANIM\_DELAY

    public static final float FIRE\_ANIM\_DELAY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.IsoFireManager.FIRE_ANIM_DELAY)
  + ### smokeAnimDelay

    public static float smokeAnimDelay
  + ### FIRE\_TINT\_MOD

    public static final [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") FIRE\_TINT\_MOD
  + ### smokeTintMod

    public static [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") smokeTintMod
  + ### FireStack

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFire](IsoFire.html "class in zombie.iso.objects")> FireStack
  + ### CharactersOnFire\_Stack

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters")> CharactersOnFire\_Stack
  + ### fireSounds

    private static final [IsoFireManager.FireSounds](IsoFireManager.FireSounds.html "class in zombie.iso.objects") fireSounds
* Constructor Details
  -------------------

  + ### IsoFireManager

    public IsoFireManager()
* Method Details
  --------------

  + ### Add

    public static void Add([IsoFire](IsoFire.html "class in zombie.iso.objects") newFire)
  + ### AddBurningCharacter

    public static void AddBurningCharacter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") burningCharacter)
  + ### Fire\_LightCalc

    public static void Fire\_LightCalc([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") fireSquare,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") testSquare,
    int playerIndex)
  + ### LightTileWithFire

    public static void LightTileWithFire([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") testSquare)
  + ### explode

    public static void explode([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    int power)
  + ### MolotovSmash

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public static void MolotovSmash([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare)

    Deprecated.
  + ### Remove

    public static void Remove([IsoFire](IsoFire.html "class in zombie.iso.objects") dyingFire)
  + ### RemoveBurningCharacter

    public static void RemoveBurningCharacter([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") burningCharacter)
  + ### StartFire

    public static void StartFire([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean igniteOnAny,
    int fireStartingEnergy,
    int life)
  + ### StartSmoke

    public static void StartSmoke([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean igniteOnAny,
    int fireStartingEnergy,
    int life)
  + ### StartFire

    public static void StartFire([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean igniteOnAny,
    int fireStartingEnergy)
  + ### addCharacterOnFire

    public static void addCharacterOnFire([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### deleteCharacterOnFire

    public static void deleteCharacterOnFire([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### Update

    public static void Update()
  + ### updateSound

    public static void updateSound([IsoFire](IsoFire.html "class in zombie.iso.objects") fire)
  + ### stopSound

    public static void stopSound([IsoFire](IsoFire.html "class in zombie.iso.objects") fire)
  + ### RemoveAllOn

    public static void RemoveAllOn([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### Reset

    public static void Reset()