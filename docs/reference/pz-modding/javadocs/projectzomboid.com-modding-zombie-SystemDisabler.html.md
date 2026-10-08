[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [SystemDisabler](SystemDisabler.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [doCharacterStats](#doCharacterStats)
   2. [doZombieCreation](#doZombieCreation)
   3. [doSurvivorCreation](#doSurvivorCreation)
   4. [doPlayerCreation](#doPlayerCreation)
   5. [doOverridePOVCharacters](#doOverridePOVCharacters)
   6. [doVehiclesEverywhere](#doVehiclesEverywhere)
   7. [doWorldSyncEnable](#doWorldSyncEnable)
   8. [doHighFriction](#doHighFriction)
   9. [doVehicleLowRider](#doVehicleLowRider)
   10. [doEnableDetectOpenGLErrors](#doEnableDetectOpenGLErrors)
   11. [doEnableDetectOpenGLErrorsInTexture](#doEnableDetectOpenGLErrorsInTexture)
   12. [doVehiclesWithoutTextures](#doVehiclesWithoutTextures)
   13. [zombiesDontAttack](#zombiesDontAttack)
   14. [doPrintDetailedInfo](#doPrintDetailedInfo)
   15. [doMainLoopDealWithNetData](#doMainLoopDealWithNetData)
   16. [enableAdvancedSoundOptions](#enableAdvancedSoundOptions)
   17. [uncappedFPS](#uncappedFPS)
6. [Constructor Details](#constructor-detail)
   1. [SystemDisabler()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setDoCharacterStats(boolean)](#setDoCharacterStats(boolean))
   2. [setDoZombieCreation(boolean)](#setDoZombieCreation(boolean))
   3. [setDoSurvivorCreation(boolean)](#setDoSurvivorCreation(boolean))
   4. [setDoPlayerCreation(boolean)](#setDoPlayerCreation(boolean))
   5. [setOverridePOVCharacters(boolean)](#setOverridePOVCharacters(boolean))
   6. [setVehiclesEverywhere(boolean)](#setVehiclesEverywhere(boolean))
   7. [setWorldSyncEnable(boolean)](#setWorldSyncEnable(boolean))
   8. [getdoHighFriction()](#getdoHighFriction())
   9. [getdoVehicleLowRider()](#getdoVehicleLowRider())
   10. [printDetailedInfo()](#printDetailedInfo())
   11. [getDoMainLoopDealWithNetData()](#getDoMainLoopDealWithNetData())
   12. [setEnableAdvancedSoundOptions(boolean)](#setEnableAdvancedSoundOptions(boolean))
   13. [getEnableAdvancedSoundOptions()](#getEnableAdvancedSoundOptions())
   14. [setUncappedFPS(boolean)](#setUncappedFPS(boolean))
   15. [getUncappedFPS()](#getUncappedFPS())
   16. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class SystemDisabler
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.SystemDisabler

---

public class SystemDisabler
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static boolean`

  `doCharacterStats`

  `static final boolean`

  `doEnableDetectOpenGLErrors`

  `static final boolean`

  `doEnableDetectOpenGLErrorsInTexture`

  `private static final boolean`

  `doHighFriction`

  `private static boolean`

  `doMainLoopDealWithNetData`

  `static boolean`

  `doOverridePOVCharacters`

  `static boolean`

  `doPlayerCreation`

  `private static final boolean`

  `doPrintDetailedInfo`

  `static boolean`

  `doSurvivorCreation`

  `private static final boolean`

  `doVehicleLowRider`

  `static boolean`

  `doVehiclesEverywhere`

  `static boolean`

  `doVehiclesWithoutTextures`

  `static boolean`

  `doWorldSyncEnable`

  `static boolean`

  `doZombieCreation`

  `private static boolean`

  `enableAdvancedSoundOptions`

  `private static boolean`

  `uncappedFPS`

  `static boolean`

  `zombiesDontAttack`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SystemDisabler()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static boolean`

  `getdoHighFriction()`

  `static boolean`

  `getDoMainLoopDealWithNetData()`

  `static boolean`

  `getdoVehicleLowRider()`

  `static boolean`

  `getEnableAdvancedSoundOptions()`

  `static boolean`

  `getUncappedFPS()`

  `static boolean`

  `printDetailedInfo()`

  `static void`

  `Reset()`

  `static void`

  `setDoCharacterStats(boolean bDo)`

  `static void`

  `setDoPlayerCreation(boolean bDo)`

  `static void`

  `setDoSurvivorCreation(boolean bDo)`

  `static void`

  `setDoZombieCreation(boolean bDo)`

  `static void`

  `setEnableAdvancedSoundOptions(boolean enable)`

  `static void`

  `setOverridePOVCharacters(boolean bDo)`

  `static void`

  `setUncappedFPS(boolean b)`

  `static void`

  `setVehiclesEverywhere(boolean bDo)`

  `static void`

  `setWorldSyncEnable(boolean bDo)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### doCharacterStats

    public static boolean doCharacterStats
  + ### doZombieCreation

    public static boolean doZombieCreation
  + ### doSurvivorCreation

    public static boolean doSurvivorCreation
  + ### doPlayerCreation

    public static boolean doPlayerCreation
  + ### doOverridePOVCharacters

    public static boolean doOverridePOVCharacters
  + ### doVehiclesEverywhere

    public static boolean doVehiclesEverywhere
  + ### doWorldSyncEnable

    public static boolean doWorldSyncEnable
  + ### doHighFriction

    private static final boolean doHighFriction

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.SystemDisabler.doHighFriction)
  + ### doVehicleLowRider

    private static final boolean doVehicleLowRider

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.SystemDisabler.doVehicleLowRider)
  + ### doEnableDetectOpenGLErrors

    public static final boolean doEnableDetectOpenGLErrors

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.SystemDisabler.doEnableDetectOpenGLErrors)
  + ### doEnableDetectOpenGLErrorsInTexture

    public static final boolean doEnableDetectOpenGLErrorsInTexture

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.SystemDisabler.doEnableDetectOpenGLErrorsInTexture)
  + ### doVehiclesWithoutTextures

    public static boolean doVehiclesWithoutTextures
  + ### zombiesDontAttack

    public static boolean zombiesDontAttack
  + ### doPrintDetailedInfo

    private static final boolean doPrintDetailedInfo

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.SystemDisabler.doPrintDetailedInfo)
  + ### doMainLoopDealWithNetData

    private static boolean doMainLoopDealWithNetData
  + ### enableAdvancedSoundOptions

    private static boolean enableAdvancedSoundOptions
  + ### uncappedFPS

    private static boolean uncappedFPS
* Constructor Details
  -------------------

  + ### SystemDisabler

    public SystemDisabler()
* Method Details
  --------------

  + ### setDoCharacterStats

    public static void setDoCharacterStats(boolean bDo)
  + ### setDoZombieCreation

    public static void setDoZombieCreation(boolean bDo)
  + ### setDoSurvivorCreation

    public static void setDoSurvivorCreation(boolean bDo)
  + ### setDoPlayerCreation

    public static void setDoPlayerCreation(boolean bDo)
  + ### setOverridePOVCharacters

    public static void setOverridePOVCharacters(boolean bDo)
  + ### setVehiclesEverywhere

    public static void setVehiclesEverywhere(boolean bDo)
  + ### setWorldSyncEnable

    public static void setWorldSyncEnable(boolean bDo)
  + ### getdoHighFriction

    public static boolean getdoHighFriction()
  + ### getdoVehicleLowRider

    public static boolean getdoVehicleLowRider()
  + ### printDetailedInfo

    public static boolean printDetailedInfo()
  + ### getDoMainLoopDealWithNetData

    public static boolean getDoMainLoopDealWithNetData()
  + ### setEnableAdvancedSoundOptions

    public static void setEnableAdvancedSoundOptions(boolean enable)
  + ### getEnableAdvancedSoundOptions

    public static boolean getEnableAdvancedSoundOptions()
  + ### setUncappedFPS

    public static void setUncappedFPS(boolean b)
  + ### getUncappedFPS

    public static boolean getUncappedFPS()
  + ### Reset

    public static void Reset()