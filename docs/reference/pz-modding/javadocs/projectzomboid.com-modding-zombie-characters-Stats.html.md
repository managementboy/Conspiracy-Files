[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [Stats](Stats.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [ENDURANCE\_DANGER\_WARNING](#ENDURANCE_DANGER_WARNING)
   2. [ENDURANCE\_WARNING](#ENDURANCE_WARNING)
   3. [stats](#stats)
   4. [enduranceRecharging](#enduranceRecharging)
   5. [lastEndurance](#lastEndurance)
   6. [numVisibleZombies](#numVisibleZombies)
   7. [lastNumVisibleZombies](#lastNumVisibleZombies)
   8. [tripping](#tripping)
   9. [trippingRotAngle](#trippingRotAngle)
   10. [numChasingZombies](#numChasingZombies)
   11. [lastVeryCloseZombies](#lastVeryCloseZombies)
   12. [lastNumChasingZombies](#lastNumChasingZombies)
   13. [musicZombiesVisible](#musicZombiesVisible)
   14. [musicZombiesTargetingDistantNotMoving](#musicZombiesTargetingDistantNotMoving)
   15. [musicZombiesTargetingNearbyNotMoving](#musicZombiesTargetingNearbyNotMoving)
   16. [musicZombiesTargetingDistantMoving](#musicZombiesTargetingDistantMoving)
   17. [musicZombiesTargetingNearbyMoving](#musicZombiesTargetingNearbyMoving)
6. [Constructor Details](#constructor-detail)
   1. [Stats()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [load(DataInputStream)](#load(java.io.DataInputStream))
   2. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   3. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   4. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   5. [parse(ByteBuffer, byte)](#parse(java.nio.ByteBuffer,byte))
   6. [write(ByteBuffer, byte)](#write(java.nio.ByteBuffer,byte))
   7. [get(CharacterStat)](#get(zombie.characters.CharacterStat))
   8. [set(CharacterStat, float)](#set(zombie.characters.CharacterStat,float))
   9. [add(CharacterStat, float)](#add(zombie.characters.CharacterStat,float))
   10. [remove(CharacterStat, float)](#remove(zombie.characters.CharacterStat,float))
   11. [reset(CharacterStat)](#reset(zombie.characters.CharacterStat))
   12. [isAtMinimum(CharacterStat)](#isAtMinimum(zombie.characters.CharacterStat))
   13. [isAtMaximum(CharacterStat)](#isAtMaximum(zombie.characters.CharacterStat))
   14. [isAboveMinimum(CharacterStat)](#isAboveMinimum(zombie.characters.CharacterStat))
   15. [resetStats()](#resetStats())
   16. [toString()](#toString())
   17. [getNicotineStress()](#getNicotineStress())
   18. [getNumVisibleZombies()](#getNumVisibleZombies())
   19. [getNumChasingZombies()](#getNumChasingZombies())
   20. [setLastNumberChasingZombies(int)](#setLastNumberChasingZombies(int))
   21. [getNumVeryCloseZombies()](#getNumVeryCloseZombies())
   22. [getLastEndurance()](#getLastEndurance())
   23. [setLastEndurance(float)](#setLastEndurance(float))
   24. [getEnduranceDangerWarning()](#getEnduranceDangerWarning())
   25. [getEnduranceWarning()](#getEnduranceWarning())
   26. [isEnduranceRecharging()](#isEnduranceRecharging())
   27. [getVisibleZombies()](#getVisibleZombies())
   28. [setNumVisibleZombies(int)](#setNumVisibleZombies(int))
   29. [isTripping()](#isTripping())
   30. [setTripping(boolean)](#setTripping(boolean))
   31. [getTrippingRotAngle()](#getTrippingRotAngle())
   32. [setTrippingRotAngle(float)](#setTrippingRotAngle(float))
   33. [addTrippingRotAngle(float)](#addTrippingRotAngle(float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Stats
===========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.Stats

---

public class Stats
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final float`

  `ENDURANCE_DANGER_WARNING`

  `private static final float`

  `ENDURANCE_WARNING`

  `private final boolean`

  `enduranceRecharging`

  `private float`

  `lastEndurance`

  `private int`

  `lastNumChasingZombies`

  `int`

  `lastNumVisibleZombies`

  `int`

  `lastVeryCloseZombies`

  `int`

  `musicZombiesTargetingDistantMoving`

  `int`

  `musicZombiesTargetingDistantNotMoving`

  `int`

  `musicZombiesTargetingNearbyMoving`

  `int`

  `musicZombiesTargetingNearbyNotMoving`

  `int`

  `musicZombiesVisible`

  `int`

  `numChasingZombies`

  `int`

  `numVisibleZombies`

  `private final Map<CharacterStat, Float>`

  `stats`

  `private boolean`

  `tripping`

  `private float`

  `trippingRotAngle`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Stats()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `add(CharacterStat stat,
  float amount)`

  `void`

  `addTrippingRotAngle(float value)`

  `float`

  `get(CharacterStat stat)`

  `float`

  `getEnduranceDangerWarning()`

  `float`

  `getEnduranceWarning()`

  `float`

  `getLastEndurance()`

  `float`

  `getNicotineStress()`

  `int`

  `getNumChasingZombies()`

  `int`

  `getNumVeryCloseZombies()`

  `int`

  `getNumVisibleZombies()`

  `float`

  `getTrippingRotAngle()`

  `int`

  `getVisibleZombies()`

  `boolean`

  `isAboveMinimum(CharacterStat stat)`

  `boolean`

  `isAtMaximum(CharacterStat stat)`

  `boolean`

  `isAtMinimum(CharacterStat stat)`

  `boolean`

  `isEnduranceRecharging()`

  `boolean`

  `isTripping()`

  `void`

  `load(DataInputStream input)`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `parse(ByteBuffer b,
  byte field)`

  `boolean`

  `remove(CharacterStat stat,
  float amount)`

  `boolean`

  `reset(CharacterStat stat)`

  `void`

  `resetStats()`

  `void`

  `save(DataOutputStream output)`

  `void`

  `save(ByteBuffer output)`

  `boolean`

  `set(CharacterStat stat,
  float value)`

  `void`

  `setLastEndurance(float endurance)`

  `void`

  `setLastNumberChasingZombies(int chasingZombies)`

  `void`

  `setNumVisibleZombies(int numVisibleZombies)`

  `void`

  `setTripping(boolean tripping)`

  `void`

  `setTrippingRotAngle(float trippingRotAngle)`

  `String`

  `toString()`

  `void`

  `write(ByteBuffer b,
  byte field)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### ENDURANCE\_DANGER\_WARNING

    private static final float ENDURANCE\_DANGER\_WARNING

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.Stats.ENDURANCE_DANGER_WARNING)
  + ### ENDURANCE\_WARNING

    private static final float ENDURANCE\_WARNING

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.Stats.ENDURANCE_WARNING)
  + ### stats

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[CharacterStat](CharacterStat.html "class in zombie.characters"), [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> stats
  + ### enduranceRecharging

    private final boolean enduranceRecharging

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.Stats.enduranceRecharging)
  + ### lastEndurance

    private float lastEndurance
  + ### numVisibleZombies

    public int numVisibleZombies
  + ### lastNumVisibleZombies

    public int lastNumVisibleZombies
  + ### tripping

    private boolean tripping
  + ### trippingRotAngle

    private float trippingRotAngle
  + ### numChasingZombies

    public int numChasingZombies
  + ### lastVeryCloseZombies

    public int lastVeryCloseZombies
  + ### lastNumChasingZombies

    private int lastNumChasingZombies
  + ### musicZombiesVisible

    public int musicZombiesVisible
  + ### musicZombiesTargetingDistantNotMoving

    public int musicZombiesTargetingDistantNotMoving
  + ### musicZombiesTargetingNearbyNotMoving

    public int musicZombiesTargetingNearbyNotMoving
  + ### musicZombiesTargetingDistantMoving

    public int musicZombiesTargetingDistantMoving
  + ### musicZombiesTargetingNearbyMoving

    public int musicZombiesTargetingNearbyMoving
* Constructor Details
  -------------------

  + ### Stats

    public Stats()
* Method Details
  --------------

  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### parse

    public void parse([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") b,
    byte field)
  + ### write

    public void write([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") b,
    byte field)
  + ### get

    public float get([CharacterStat](CharacterStat.html "class in zombie.characters") stat)
  + ### set

    public boolean set([CharacterStat](CharacterStat.html "class in zombie.characters") stat,
    float value)
  + ### add

    public boolean add([CharacterStat](CharacterStat.html "class in zombie.characters") stat,
    float amount)
  + ### remove

    public boolean remove([CharacterStat](CharacterStat.html "class in zombie.characters") stat,
    float amount)
  + ### reset

    public boolean reset([CharacterStat](CharacterStat.html "class in zombie.characters") stat)
  + ### isAtMinimum

    public boolean isAtMinimum([CharacterStat](CharacterStat.html "class in zombie.characters") stat)
  + ### isAtMaximum

    public boolean isAtMaximum([CharacterStat](CharacterStat.html "class in zombie.characters") stat)
  + ### isAboveMinimum

    public boolean isAboveMinimum([CharacterStat](CharacterStat.html "class in zombie.characters") stat)
  + ### resetStats

    public void resetStats()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getNicotineStress

    public float getNicotineStress()
  + ### getNumVisibleZombies

    public int getNumVisibleZombies()
  + ### getNumChasingZombies

    public int getNumChasingZombies()
  + ### setLastNumberChasingZombies

    public void setLastNumberChasingZombies(int chasingZombies)
  + ### getNumVeryCloseZombies

    public int getNumVeryCloseZombies()
  + ### getLastEndurance

    public float getLastEndurance()
  + ### setLastEndurance

    public void setLastEndurance(float endurance)
  + ### getEnduranceDangerWarning

    public float getEnduranceDangerWarning()
  + ### getEnduranceWarning

    public float getEnduranceWarning()
  + ### isEnduranceRecharging

    public boolean isEnduranceRecharging()
  + ### getVisibleZombies

    public int getVisibleZombies()
  + ### setNumVisibleZombies

    public void setNumVisibleZombies(int numVisibleZombies)
  + ### isTripping

    public boolean isTripping()
  + ### setTripping

    public void setTripping(boolean tripping)
  + ### getTrippingRotAngle

    public float getTrippingRotAngle()
  + ### setTrippingRotAngle

    public void setTrippingRotAngle(float trippingRotAngle)
  + ### addTrippingRotAngle

    public void addTrippingRotAngle(float value)