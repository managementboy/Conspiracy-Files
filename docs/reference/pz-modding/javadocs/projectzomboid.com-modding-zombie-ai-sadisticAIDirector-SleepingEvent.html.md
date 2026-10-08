[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.ai.sadisticAIDirector](package-summary.html)
2. [SleepingEvent](SleepingEvent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [zombiesInvasion](#zombiesInvasion)
6. [Constructor Details](#constructor-detail)
   1. [SleepingEvent()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setPlayerFallAsleep(IsoPlayer, int)](#setPlayerFallAsleep(zombie.characters.IsoPlayer,int))
   2. [setPlayerFallAsleep(IsoPlayer, int, boolean, boolean)](#setPlayerFallAsleep(zombie.characters.IsoPlayer,int,boolean,boolean))
   3. [doDelayToSleep(IsoPlayer)](#doDelayToSleep(zombie.characters.IsoPlayer))
   4. [checkNightmare(IsoPlayer, int)](#checkNightmare(zombie.characters.IsoPlayer,int))
   5. [checkWindowStatus(IsoWindow)](#checkWindowStatus(zombie.iso.objects.IsoWindow))
   6. [update(IsoPlayer)](#update(zombie.characters.IsoPlayer))
   7. [updateRain(IsoPlayer)](#updateRain(zombie.characters.IsoPlayer))
   8. [updateSnow(IsoPlayer)](#updateSnow(zombie.characters.IsoPlayer))
   9. [updateTemperature(IsoPlayer)](#updateTemperature(zombie.characters.IsoPlayer))
   10. [updateWetness(IsoPlayer)](#updateWetness(zombie.characters.IsoPlayer))
   11. [isExposedToPrecipitation(IsoGameCharacter)](#isExposedToPrecipitation(zombie.characters.IsoGameCharacter))
   12. [spawnZombieIntruders(IsoPlayer)](#spawnZombieIntruders(zombie.characters.IsoPlayer))
   13. [getWeakestWindow(IsoPlayer)](#getWeakestWindow(zombie.characters.IsoPlayer))
   14. [wakeUp(IsoGameCharacter)](#wakeUp(zombie.characters.IsoGameCharacter))
   15. [wakeUp(IsoGameCharacter, boolean)](#wakeUp(zombie.characters.IsoGameCharacter,boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SleepingEvent
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.sadisticAIDirector.SleepingEvent

---

public final class SleepingEvent
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final SleepingEvent`

  `instance`

  `static boolean`

  `zombiesInvasion`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SleepingEvent()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `checkNightmare(IsoPlayer chr,
  int sleepingTime)`

  `private int`

  `checkWindowStatus(IsoWindow window)`

  `private void`

  `doDelayToSleep(IsoPlayer chr)`

  `private IsoWindow`

  `getWeakestWindow(IsoPlayer chr)`

  `private boolean`

  `isExposedToPrecipitation(IsoGameCharacter chr)`

  `void`

  `setPlayerFallAsleep(IsoPlayer chr,
  int sleepingTime)`

  `void`

  `setPlayerFallAsleep(IsoPlayer chr,
  int sleepingTime,
  boolean forceZombieEvent,
  boolean forceNightmareEvent)`

  `private void`

  `spawnZombieIntruders(IsoPlayer chr)`

  `void`

  `update(IsoPlayer chr)`

  `private void`

  `updateRain(IsoPlayer chr)`

  `private void`

  `updateSnow(IsoPlayer chr)`

  `private void`

  `updateTemperature(IsoPlayer chr)`

  `private void`

  `updateWetness(IsoPlayer chr)`

  `void`

  `wakeUp(IsoGameCharacter chr)`

  `void`

  `wakeUp(IsoGameCharacter chr,
  boolean remote)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [SleepingEvent](SleepingEvent.html "class in zombie.ai.sadisticAIDirector") instance
  + ### zombiesInvasion

    public static boolean zombiesInvasion
* Constructor Details
  -------------------

  + ### SleepingEvent

    public SleepingEvent()
* Method Details
  --------------

  + ### setPlayerFallAsleep

    public void setPlayerFallAsleep([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr,
    int sleepingTime)
  + ### setPlayerFallAsleep

    public void setPlayerFallAsleep([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr,
    int sleepingTime,
    boolean forceZombieEvent,
    boolean forceNightmareEvent)
  + ### doDelayToSleep

    private void doDelayToSleep([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### checkNightmare

    private void checkNightmare([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr,
    int sleepingTime)
  + ### checkWindowStatus

    private int checkWindowStatus([IsoWindow](../../iso/objects/IsoWindow.html "class in zombie.iso.objects") window)
  + ### update

    public void update([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### updateRain

    private void updateRain([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### updateSnow

    private void updateSnow([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### updateTemperature

    private void updateTemperature([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### updateWetness

    private void updateWetness([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### isExposedToPrecipitation

    private boolean isExposedToPrecipitation([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### spawnZombieIntruders

    private void spawnZombieIntruders([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### getWeakestWindow

    private [IsoWindow](../../iso/objects/IsoWindow.html "class in zombie.iso.objects") getWeakestWindow([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") chr)
  + ### wakeUp

    public void wakeUp([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### wakeUp

    public void wakeUp([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean remote)