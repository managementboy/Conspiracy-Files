[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.characters.animals.behavior](package-summary.html)
2. [BaseAnimalBehavior](BaseAnimalBehavior.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tempVector2](#tempVector2)
   2. [parent](#parent)
   3. [wanderMulMod](#wanderMulMod)
   4. [blockMovement](#blockMovement)
   5. [goToMomTimer](#goToMomTimer)
   6. [sitInTime](#sitInTime)
   7. [sitOutTime](#sitOutTime)
   8. [blockedFor](#blockedFor)
   9. [attackAnimalTimer](#attackAnimalTimer)
   10. [followChrTimer](#followChrTimer)
   11. [lastAlerted](#lastAlerted)
   12. [idleAnimTimer](#idleAnimTimer)
   13. [behaviorCheckTimer](#behaviorCheckTimer)
   14. [behaviorAction](#behaviorAction)
   15. [behaviorObject](#behaviorObject)
   16. [isDoingBehavior](#isDoingBehavior)
   17. [behaviorMaxTime](#behaviorMaxTime)
   18. [behaviorFailsafe](#behaviorFailsafe)
   19. [hutchPathTimer](#hutchPathTimer)
   20. [enterHutchTimerAfterDestroy](#enterHutchTimerAfterDestroy)
   21. [forcedOutsideHutch](#forcedOutsideHutch)
   22. [timerFleeAgain](#timerFleeAgain)
   23. [wildAndHurt](#wildAndHurt)
   24. [wildDropDeadTimer](#wildDropDeadTimer)
6. [Constructor Details](#constructor-detail)
   1. [BaseAnimalBehavior(IsoAnimal)](#%3Cinit%3E(zombie.characters.animals.IsoAnimal))
7. [Method Details](#method-detail)
   1. [wanderIdle()](#wanderIdle())
   2. [walkedOnSpot()](#walkedOnSpot())
   3. [goAttack(IsoGameCharacter)](#goAttack(zombie.characters.IsoGameCharacter))
   4. [checkSit()](#checkSit())
   5. [pickRandomWanderInterval()](#pickRandomWanderInterval())
   6. [updateAttackTimer()](#updateAttackTimer())
   7. [update()](#update())
   8. [updateGoingToHutch()](#updateGoingToHutch())
   9. [doBehaviorAction()](#doBehaviorAction())
   10. [fightAnimal()](#fightAnimal())
   11. [enterHutch()](#enterHutch())
   12. [resetBehaviorAction()](#resetBehaviorAction())
   13. [fertilize()](#fertilize())
   14. [drinkFromTrough()](#drinkFromTrough())
   15. [eatFromTrough()](#eatFromTrough())
   16. [eatFromGround()](#eatFromGround())
   17. [drinkFromGround()](#drinkFromGround())
   18. [clearIdleAction()](#clearIdleAction())
   19. [checkBehavior()](#checkBehavior())
   20. [checkAttackBehavior()](#checkAttackBehavior())
   21. [callToHutch(IsoHutch, boolean)](#callToHutch(zombie.iso.objects.IsoHutch,boolean))
   22. [canGoToHutch(IsoHutch, boolean)](#canGoToHutch(zombie.iso.objects.IsoHutch,boolean))
   23. [checkFertilizeFemale()](#checkFertilizeFemale())
   24. [drinkFromRiver()](#drinkFromRiver())
   25. [eatGrass()](#eatGrass())
   26. [drinkFromPuddle()](#drinkFromPuddle())
   27. [getRandomRiverSq()](#getRandomRiverSq())
   28. [shuffleListSq(ArrayList)](#shuffleListSq(java.util.ArrayList))
   29. [swapSq(List, int, int)](#swapSq(java.util.List,int,int))
   30. [getNearestWaterSquare(IsoGridSquare)](#getNearestWaterSquare(zombie.iso.IsoGridSquare))
   31. [tryDrinkFromRiver()](#tryDrinkFromRiver())
   32. [checkDrinkBehavior()](#checkDrinkBehavior())
   33. [tryAndGetPuddle(int)](#tryAndGetPuddle(int))
   34. [tryAndGetGrassFloor()](#tryAndGetGrassFloor())
   35. [tryDrinkFromPuddle()](#tryDrinkFromPuddle())
   36. [tryDrinkFromGround(DesignationZoneAnimal)](#tryDrinkFromGround(zombie.iso.areas.DesignationZoneAnimal))
   37. [tryDrinkFromTrough()](#tryDrinkFromTrough())
   38. [canDrinkFromTrough(IsoFeedingTrough)](#canDrinkFromTrough(zombie.iso.objects.IsoFeedingTrough))
   39. [canEatThis(InventoryItem)](#canEatThis(zombie.inventory.InventoryItem))
   40. [tryEatFromGround(DesignationZoneAnimal)](#tryEatFromGround(zombie.iso.areas.DesignationZoneAnimal))
   41. [checkEatBehavior()](#checkEatBehavior())
   42. [forceEatFromMom()](#forceEatFromMom())
   43. [tryToEatFromMom(boolean)](#tryToEatFromMom(boolean))
   44. [eatFromMom()](#eatFromMom())
   45. [tryEatFromTrough()](#tryEatFromTrough())
   46. [tryEatGrass()](#tryEatGrass())
   47. [canEatFromTrough(IsoFeedingTrough)](#canEatFromTrough(zombie.iso.objects.IsoFeedingTrough))
   48. [getRandomTroughList()](#getRandomTroughList())
   49. [shuffleList(ArrayList)](#shuffleList(java.util.ArrayList))
   50. [swap(List, int, int)](#swap(java.util.List,int,int))
   51. [eatFromVehicle()](#eatFromVehicle())
   52. [updateAcceptance()](#updateAcceptance())
   53. [followChr()](#followChr())
   54. [walkToChr(IsoGameCharacter, Integer)](#walkToChr(zombie.characters.IsoGameCharacter,java.lang.Integer))
   55. [wildAnimalFLeeFromAttacker()](#wildAnimalFLeeFromAttacker())
   56. [fleeFromAttacker()](#fleeFromAttacker())
   57. [removeAttacked()](#removeAttacked())
   58. [fleeFromChr()](#fleeFromChr())
   59. [forceFleeFromChr(IsoGameCharacter)](#forceFleeFromChr(zombie.characters.IsoGameCharacter))
   60. [spotted(IsoMovingObject, boolean, float)](#spotted(zombie.iso.IsoMovingObject,boolean,float))
   61. [canBeAttached()](#canBeAttached())
   62. [setBlockMovement(boolean)](#setBlockMovement(boolean))
   63. [setHourBeforeLeavingHutch(int)](#setHourBeforeLeavingHutch(int))
   64. [setDoingBehavior(boolean)](#setDoingBehavior(boolean))
   65. [isWildAndHurt()](#isWildAndHurt())
   66. [setWildAndHurt(boolean)](#setWildAndHurt(boolean))
   67. [getWildDropDeadTimer()](#getWildDropDeadTimer())
   68. [setWildDropDeadTimer(float)](#setWildDropDeadTimer(float))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class BaseAnimalBehavior
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.behavior.BaseAnimalBehavior

---

public class BaseAnimalBehavior
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `attackAnimalTimer`

  `zombie.characters.animals.behavior.BehaviorAction`

  `behaviorAction`

  `float`

  `behaviorCheckTimer`

  `float`

  `behaviorFailsafe`

  `float`

  `behaviorMaxTime`

  `Object`

  `behaviorObject`

  `float`

  `blockedFor`

  `boolean`

  `blockMovement`

  `float`

  `enterHutchTimerAfterDestroy`

  `private float`

  `followChrTimer`

  `long`

  `forcedOutsideHutch`

  `private float`

  `goToMomTimer`

  `float`

  `hutchPathTimer`

  `private float`

  `idleAnimTimer`

  `boolean`

  `isDoingBehavior`

  `float`

  `lastAlerted`

  `protected IsoAnimal`

  `parent`

  `int`

  `sitInTime`

  `int`

  `sitOutTime`

  `private static final Vector2`

  `tempVector2`

  `private float`

  `timerFleeAgain`

  `float`

  `wanderMulMod`

  `private boolean`

  `wildAndHurt`

  `private float`

  `wildDropDeadTimer`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BaseAnimalBehavior(IsoAnimal parent)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `callToHutch(IsoHutch hutch,
  boolean force)`

  `boolean`

  `canBeAttached()`

  `boolean`

  `canDrinkFromTrough(IsoFeedingTrough trough)`

  `private boolean`

  `canEatFromTrough(IsoFeedingTrough trough)`

  `boolean`

  `canEatThis(InventoryItem item)`

  `boolean`

  `canGoToHutch(IsoHutch hutch,
  boolean force)`

  If hutch isn't full and is open
  Here we also put a delay when animals are going to the hutch, so babies goes first then female and finally male

  `private boolean`

  `checkAttackBehavior()`

  `void`

  `checkBehavior()`

  General function that gonna check if an animal needs to eat/drink, fertilize, go to hutch...

  `private boolean`

  `checkDrinkBehavior()`

  `boolean`

  `checkEatBehavior()`

  Return true if the animal is gonna eat (going to eat or directly eating)

  `private boolean`

  `checkFertilizeFemale()`

  `void`

  `checkSit()`

  If the animal can randomly sit (cows), we gonna define a time when it'll do so

  `private void`

  `clearIdleAction()`

  Used to stop an idle action (random idle emote) before checking behavior so we're sure to do it

  `void`

  `doBehaviorAction()`

  We arrived at destination, gonna do the action we're meant to

  `private void`

  `drinkFromGround()`

  `private void`

  `drinkFromPuddle()`

  `private void`

  `drinkFromRiver()`

  `private void`

  `drinkFromTrough()`

  `private void`

  `eatFromGround()`

  `private void`

  `eatFromMom()`

  `private void`

  `eatFromTrough()`

  `boolean`

  `eatFromVehicle()`

  When inside a trailer we look for the food container

  `private void`

  `eatGrass()`

  `private void`

  `enterHutch()`

  `private void`

  `fertilize()`

  `void`

  `fightAnimal()`

  `private void`

  `fleeFromAttacker()`

  `private void`

  `fleeFromChr()`

  `private void`

  `followChr()`

  `void`

  `forceEatFromMom()`

  When one baby need to feed from mom, every other babies will be called too

  `void`

  `forceFleeFromChr(IsoGameCharacter chr)`

  `IsoGridSquare`

  `getNearestWaterSquare(IsoGridSquare sq)`

  `private IsoGridSquare`

  `getRandomRiverSq()`

  `ArrayList<IsoFeedingTrough>`

  `getRandomTroughList()`

  Randomize all the trough available in all our zones

  `float`

  `getWildDropDeadTimer()`

  `void`

  `goAttack(IsoGameCharacter fightingOpponent)`

  If animal have an opponent, go to him to prepare for an attack

  `boolean`

  `isWildAndHurt()`

  `float`

  `pickRandomWanderInterval()`

  Choose a random time when the animal will wander again, the fidget genetic disorder make that happen way faster
  Animals also wander less during rain

  `private void`

  `removeAttacked()`

  `void`

  `resetBehaviorAction()`

  `void`

  `setBlockMovement(boolean block)`

  `void`

  `setDoingBehavior(boolean doingBehavior)`

  `void`

  `setHourBeforeLeavingHutch(int hours)`

  `void`

  `setWildAndHurt(boolean wildAndHurt)`

  `void`

  `setWildDropDeadTimer(float wildDropDeadTimer)`

  `static void`

  `shuffleList(ArrayList<IsoFeedingTrough> a)`

  `static void`

  `shuffleListSq(ArrayList<IsoGridSquare> a)`

  `void`

  `spotted(IsoMovingObject other,
  boolean bForced,
  float dist)`

  `private static void`

  `swap(List<IsoFeedingTrough> a,
  int i,
  int change)`

  `private static void`

  `swapSq(List<IsoGridSquare> a,
  int i,
  int change)`

  `IsoObject`

  `tryAndGetGrassFloor()`

  `IsoObject`

  `tryAndGetPuddle(int searchRadius)`

  Check a square around the animal to find a puddle

  `private boolean`

  `tryDrinkFromGround(DesignationZoneAnimal zone)`

  `private boolean`

  `tryDrinkFromPuddle()`

  Drinking from puddle is essentially drinking from the ground if it has water

  `private boolean`

  `tryDrinkFromRiver()`

  `private boolean`

  `tryDrinkFromTrough()`

  `private boolean`

  `tryEatFromGround(DesignationZoneAnimal zone)`

  `private boolean`

  `tryEatFromTrough()`

  `private boolean`

  `tryEatGrass()`

  Bit different from the others eating type as we don't path somewhere
  In the case of grass we simply check if there's grass under our feet to eat it.

  `private boolean`

  `tryToEatFromMom(boolean callOtherBabies)`

  `void`

  `update()`

  `private void`

  `updateAcceptance()`

  Used to make the animal accept you way faster if you hold it in your hands

  `void`

  `updateAttackTimer()`

  `private void`

  `updateGoingToHutch()`

  We influence the order of animals going to the hutch, first baby then female and finally male
  Once the timer is ready we go toward our hutch

  `void`

  `walkedOnSpot()`

  Try to make the animal wander elsewhere a bit when walked on spot, this is mainly due to animal being stuck on a fence, as I don't have coords for the region the fence is in, i'm gonna hack it a tad
  TODO Somehow it instant exit the walk state, it's still better than before but need works, vector seems ok tho?

  `private void`

  `walkToChr(IsoGameCharacter chr,
  Integer pushedLength)`

  `void`

  `wanderIdle()`

  Behavior when the animal is idle
  This can do multiple things: wander, check sit invalid input: '&' idle emote

  `private void`

  `wildAnimalFLeeFromAttacker()`

  Wild animal will flee when attacked, leaving blood splat and then dropping dead after a bit of time

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tempVector2

    private static final [Vector2](../../../iso/Vector2.html "class in zombie.iso") tempVector2
  + ### parent

    protected [IsoAnimal](../IsoAnimal.html "class in zombie.characters.animals") parent
  + ### wanderMulMod

    public float wanderMulMod
  + ### blockMovement

    public boolean blockMovement
  + ### goToMomTimer

    private float goToMomTimer
  + ### sitInTime

    public int sitInTime
  + ### sitOutTime

    public int sitOutTime
  + ### blockedFor

    public float blockedFor
  + ### attackAnimalTimer

    public float attackAnimalTimer
  + ### followChrTimer

    private float followChrTimer
  + ### lastAlerted

    public float lastAlerted
  + ### idleAnimTimer

    private float idleAnimTimer
  + ### behaviorCheckTimer

    public float behaviorCheckTimer
  + ### behaviorAction

    public zombie.characters.animals.behavior.BehaviorAction behaviorAction
  + ### behaviorObject

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") behaviorObject
  + ### isDoingBehavior

    public boolean isDoingBehavior
  + ### behaviorMaxTime

    public float behaviorMaxTime
  + ### behaviorFailsafe

    public float behaviorFailsafe
  + ### hutchPathTimer

    public float hutchPathTimer
  + ### enterHutchTimerAfterDestroy

    public float enterHutchTimerAfterDestroy
  + ### forcedOutsideHutch

    public long forcedOutsideHutch
  + ### timerFleeAgain

    private float timerFleeAgain
  + ### wildAndHurt

    private boolean wildAndHurt
  + ### wildDropDeadTimer

    private float wildDropDeadTimer
* Constructor Details
  -------------------

  + ### BaseAnimalBehavior

    public BaseAnimalBehavior([IsoAnimal](../IsoAnimal.html "class in zombie.characters.animals") parent)
* Method Details
  --------------

  + ### wanderIdle

    public void wanderIdle()

    Behavior when the animal is idle
    This can do multiple things: wander, check sit invalid input: '&' idle emote
  + ### walkedOnSpot

    public void walkedOnSpot()

    Try to make the animal wander elsewhere a bit when walked on spot, this is mainly due to animal being stuck on a fence, as I don't have coords for the region the fence is in, i'm gonna hack it a tad
    TODO Somehow it instant exit the walk state, it's still better than before but need works, vector seems ok tho?
  + ### goAttack

    public void goAttack([IsoGameCharacter](../../IsoGameCharacter.html "class in zombie.characters") fightingOpponent)

    If animal have an opponent, go to him to prepare for an attack
  + ### checkSit

    public void checkSit()

    If the animal can randomly sit (cows), we gonna define a time when it'll do so
  + ### pickRandomWanderInterval

    public float pickRandomWanderInterval()

    Choose a random time when the animal will wander again, the fidget genetic disorder make that happen way faster
    Animals also wander less during rain
  + ### updateAttackTimer

    public void updateAttackTimer()
  + ### update

    public void update()
  + ### updateGoingToHutch

    private void updateGoingToHutch()

    We influence the order of animals going to the hutch, first baby then female and finally male
    Once the timer is ready we go toward our hutch
  + ### doBehaviorAction

    public void doBehaviorAction()

    We arrived at destination, gonna do the action we're meant to
  + ### fightAnimal

    public void fightAnimal()
  + ### enterHutch

    private void enterHutch()
  + ### resetBehaviorAction

    public void resetBehaviorAction()
  + ### fertilize

    private void fertilize()
  + ### drinkFromTrough

    private void drinkFromTrough()
  + ### eatFromTrough

    private void eatFromTrough()
  + ### eatFromGround

    private void eatFromGround()
  + ### drinkFromGround

    private void drinkFromGround()
  + ### clearIdleAction

    private void clearIdleAction()

    Used to stop an idle action (random idle emote) before checking behavior so we're sure to do it
  + ### checkBehavior

    public void checkBehavior()

    General function that gonna check if an animal needs to eat/drink, fertilize, go to hutch...
  + ### checkAttackBehavior

    private boolean checkAttackBehavior()
  + ### callToHutch

    public boolean callToHutch([IsoHutch](../../../iso/objects/IsoHutch.html "class in zombie.iso.objects") hutch,
    boolean force)
  + ### canGoToHutch

    public boolean canGoToHutch([IsoHutch](../../../iso/objects/IsoHutch.html "class in zombie.iso.objects") hutch,
    boolean force)

    If hutch isn't full and is open
    Here we also put a delay when animals are going to the hutch, so babies goes first then female and finally male
  + ### checkFertilizeFemale

    private boolean checkFertilizeFemale()
  + ### drinkFromRiver

    private void drinkFromRiver()
  + ### eatGrass

    private void eatGrass()
  + ### drinkFromPuddle

    private void drinkFromPuddle()
  + ### getRandomRiverSq

    private [IsoGridSquare](../../../iso/IsoGridSquare.html "class in zombie.iso") getRandomRiverSq()
  + ### shuffleListSq

    public static void shuffleListSq([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../../../iso/IsoGridSquare.html "class in zombie.iso")> a)
  + ### swapSq

    private static void swapSq([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoGridSquare](../../../iso/IsoGridSquare.html "class in zombie.iso")> a,
    int i,
    int change)
  + ### getNearestWaterSquare

    public [IsoGridSquare](../../../iso/IsoGridSquare.html "class in zombie.iso") getNearestWaterSquare([IsoGridSquare](../../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### tryDrinkFromRiver

    private boolean tryDrinkFromRiver()
  + ### checkDrinkBehavior

    private boolean checkDrinkBehavior()
  + ### tryAndGetPuddle

    public [IsoObject](../../../iso/IsoObject.html "class in zombie.iso") tryAndGetPuddle(int searchRadius)

    Check a square around the animal to find a puddle
  + ### tryAndGetGrassFloor

    public [IsoObject](../../../iso/IsoObject.html "class in zombie.iso") tryAndGetGrassFloor()
  + ### tryDrinkFromPuddle

    private boolean tryDrinkFromPuddle()

    Drinking from puddle is essentially drinking from the ground if it has water
  + ### tryDrinkFromGround

    private boolean tryDrinkFromGround([DesignationZoneAnimal](../../../iso/areas/DesignationZoneAnimal.html "class in zombie.iso.areas") zone)
  + ### tryDrinkFromTrough

    private boolean tryDrinkFromTrough()
  + ### canDrinkFromTrough

    public boolean canDrinkFromTrough([IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects") trough)
  + ### canEatThis

    public boolean canEatThis([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### tryEatFromGround

    private boolean tryEatFromGround([DesignationZoneAnimal](../../../iso/areas/DesignationZoneAnimal.html "class in zombie.iso.areas") zone)
  + ### checkEatBehavior

    public boolean checkEatBehavior()

    Return true if the animal is gonna eat (going to eat or directly eating)
  + ### forceEatFromMom

    public void forceEatFromMom()

    When one baby need to feed from mom, every other babies will be called too
  + ### tryToEatFromMom

    private boolean tryToEatFromMom(boolean callOtherBabies)
  + ### eatFromMom

    private void eatFromMom()
  + ### tryEatFromTrough

    private boolean tryEatFromTrough()
  + ### tryEatGrass

    private boolean tryEatGrass()

    Bit different from the others eating type as we don't path somewhere
    In the case of grass we simply check if there's grass under our feet to eat it.
    If not or if still hungry after, we force the animal to wander so it find another grass tile faster
  + ### canEatFromTrough

    private boolean canEatFromTrough([IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects") trough)
  + ### getRandomTroughList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects")> getRandomTroughList()

    Randomize all the trough available in all our zones
  + ### shuffleList

    public static void shuffleList([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects")> a)
  + ### swap

    private static void swap([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoFeedingTrough](../../../iso/objects/IsoFeedingTrough.html "class in zombie.iso.objects")> a,
    int i,
    int change)
  + ### eatFromVehicle

    public boolean eatFromVehicle()

    When inside a trailer we look for the food container
  + ### updateAcceptance

    private void updateAcceptance()

    Used to make the animal accept you way faster if you hold it in your hands
  + ### followChr

    private void followChr()
  + ### walkToChr

    private void walkToChr([IsoGameCharacter](../../IsoGameCharacter.html "class in zombie.characters") chr,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") pushedLength)
  + ### wildAnimalFLeeFromAttacker

    private void wildAnimalFLeeFromAttacker()

    Wild animal will flee when attacked, leaving blood splat and then dropping dead after a bit of time
  + ### fleeFromAttacker

    private void fleeFromAttacker()
  + ### removeAttacked

    private void removeAttacked()
  + ### fleeFromChr

    private void fleeFromChr()
  + ### forceFleeFromChr

    public void forceFleeFromChr([IsoGameCharacter](../../IsoGameCharacter.html "class in zombie.characters") chr)
  + ### spotted

    public void spotted([IsoMovingObject](../../../iso/IsoMovingObject.html "class in zombie.iso") other,
    boolean bForced,
    float dist)
  + ### canBeAttached

    public boolean canBeAttached()
  + ### setBlockMovement

    public void setBlockMovement(boolean block)
  + ### setHourBeforeLeavingHutch

    public void setHourBeforeLeavingHutch(int hours)
  + ### setDoingBehavior

    public void setDoingBehavior(boolean doingBehavior)
  + ### isWildAndHurt

    public boolean isWildAndHurt()
  + ### setWildAndHurt

    public void setWildAndHurt(boolean wildAndHurt)
  + ### getWildDropDeadTimer

    public float getWildDropDeadTimer()
  + ### setWildDropDeadTimer

    public void setWildDropDeadTimer(float wildDropDeadTimer)