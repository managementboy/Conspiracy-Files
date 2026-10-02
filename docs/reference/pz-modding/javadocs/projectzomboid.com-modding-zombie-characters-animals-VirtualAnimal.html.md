[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [VirtualAnimal](VirtualAnimal.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [z](#z)
   4. [forwardDirection](#forwardDirection)
   5. [animals](#animals)
   6. [state](#state)
   7. [moveForwardOnZone](#moveForwardOnZone)
   8. [currentZoneAction](#currentZoneAction)
   9. [nextRestTime](#nextRestTime)
   10. [nextEatTime](#nextEatTime)
   11. [id](#id)
   12. [migrationGroup](#migrationGroup)
   13. [speed](#speed)
   14. [timeToEat](#timeToEat)
   15. [timeToSleep](#timeToSleep)
   16. [trackChance](#trackChance)
   17. [poopChance](#poopChance)
   18. [brokenTwigsChance](#brokenTwigsChance)
   19. [herbGrazeChance](#herbGrazeChance)
   20. [furChance](#furChance)
   21. [flatHerbChance](#flatHerbChance)
   22. [wakeTime](#wakeTime)
   23. [eatStartTime](#eatStartTime)
   24. [sleepPeriodStart](#sleepPeriodStart)
   25. [sleepPeriodEnd](#sleepPeriodEnd)
   26. [eatPeriodStart](#eatPeriodStart)
   27. [eatPeriodEnd](#eatPeriodEnd)
   28. [debugForceSleep](#debugForceSleep)
   29. [debugForceEat](#debugForceEat)
   30. [zone](#zone)
   31. [removed](#removed)
6. [Constructor Details](#constructor-detail)
   1. [VirtualAnimal()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getX()](#getX())
   2. [setX(float)](#setX(float))
   3. [getY()](#getY())
   4. [setY(float)](#setY(float))
   5. [getZ()](#getZ())
   6. [setZ(float)](#setZ(float))
   7. [setState(VirtualAnimalState)](#setState(zombie.characters.animals.VirtualAnimalState))
   8. [getState()](#getState())
   9. [update()](#update())
   10. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   11. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   12. [forceRest()](#forceRest())
   13. [forceEat()](#forceEat())
   14. [forceWakeUp()](#forceWakeUp())
   15. [forceStopEat()](#forceStopEat())
   16. [isEating()](#isEating())
   17. [isSleeping()](#isSleeping())
   18. [isTimeToSleep()](#isTimeToSleep())
   19. [isTimeToEat()](#isTimeToEat())
   20. [getNextSleepPeriod()](#getNextSleepPeriod())
   21. [getEndSleepPeriod()](#getEndSleepPeriod())
   22. [getEndEatPeriod()](#getEndEatPeriod())
   23. [getNextEatPeriod()](#getNextEatPeriod())
   24. [setRemoved(boolean)](#setRemoved(boolean))
   25. [isRemoved()](#isRemoved())
   26. [findAnimalById(int)](#findAnimalById(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VirtualAnimal
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.VirtualAnimal

---

public final class VirtualAnimal
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final ArrayList<IsoAnimal>`

  `animals`

  `int`

  `brokenTwigsChance`

  `(package private) String`

  `currentZoneAction`

  `boolean`

  `debugForceEat`

  `boolean`

  `debugForceSleep`

  `ArrayList<Integer>`

  `eatPeriodEnd`

  `ArrayList<Integer>`

  `eatPeriodStart`

  `double`

  `eatStartTime`

  `int`

  `flatHerbChance`

  `(package private) final Vector2f`

  `forwardDirection`

  `int`

  `furChance`

  `int`

  `herbGrazeChance`

  `double`

  `id`

  `String`

  `migrationGroup`

  `(package private) boolean`

  `moveForwardOnZone`

  `double`

  `nextEatTime`

  `double`

  `nextRestTime`

  `int`

  `poopChance`

  `private boolean`

  `removed`

  `ArrayList<Integer>`

  `sleepPeriodEnd`

  `ArrayList<Integer>`

  `sleepPeriodStart`

  `float`

  `speed`

  `(package private) zombie.characters.animals.VirtualAnimalState`

  `state`

  `int`

  `timeToEat`

  `int`

  `timeToSleep`

  `int`

  `trackChance`

  `double`

  `wakeTime`

  `(package private) float`

  `x`

  `(package private) float`

  `y`

  `(package private) float`

  `z`

  `AnimalZone`

  `zone`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VirtualAnimal()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `IsoAnimal`

  `findAnimalById(int animalID)`

  `void`

  `forceEat()`

  `void`

  `forceRest()`

  `void`

  `forceStopEat()`

  `void`

  `forceWakeUp()`

  `String`

  `getEndEatPeriod()`

  `String`

  `getEndSleepPeriod()`

  `String`

  `getNextEatPeriod()`

  For debug stuff

  `String`

  `getNextSleepPeriod()`

  For debug stuff

  `zombie.characters.animals.VirtualAnimalState`

  `getState()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `boolean`

  `isEating()`

  `boolean`

  `isRemoved()`

  `boolean`

  `isSleeping()`

  `boolean`

  `isTimeToEat()`

  Animals have either a period to eat or simply they'll eat every X minutes

  `boolean`

  `isTimeToSleep()`

  Animals have either a period to sleep or simply they'll sleep every X minutes

  `(package private) void`

  `load(ByteBuffer input,
  int worldVersion)`

  `(package private) void`

  `save(ByteBuffer output)`

  `void`

  `setRemoved(boolean bRemoved)`

  `void`

  `setState(zombie.characters.animals.VirtualAnimalState state)`

  `void`

  `setX(float x)`

  `void`

  `setY(float y)`

  `void`

  `setZ(float z)`

  `(package private) void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    float x
  + ### y

    float y
  + ### z

    float z
  + ### forwardDirection

    final [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") forwardDirection
  + ### animals

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](IsoAnimal.html "class in zombie.characters.animals")> animals
  + ### state

    zombie.characters.animals.VirtualAnimalState state
  + ### moveForwardOnZone

    boolean moveForwardOnZone
  + ### currentZoneAction

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentZoneAction
  + ### nextRestTime

    public double nextRestTime
  + ### nextEatTime

    public double nextEatTime
  + ### id

    public double id
  + ### migrationGroup

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") migrationGroup
  + ### speed

    public float speed
  + ### timeToEat

    public int timeToEat
  + ### timeToSleep

    public int timeToSleep
  + ### trackChance

    public int trackChance
  + ### poopChance

    public int poopChance
  + ### brokenTwigsChance

    public int brokenTwigsChance
  + ### herbGrazeChance

    public int herbGrazeChance
  + ### furChance

    public int furChance
  + ### flatHerbChance

    public int flatHerbChance
  + ### wakeTime

    public double wakeTime
  + ### eatStartTime

    public double eatStartTime
  + ### sleepPeriodStart

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> sleepPeriodStart
  + ### sleepPeriodEnd

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> sleepPeriodEnd
  + ### eatPeriodStart

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> eatPeriodStart
  + ### eatPeriodEnd

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> eatPeriodEnd
  + ### debugForceSleep

    public boolean debugForceSleep
  + ### debugForceEat

    public boolean debugForceEat
  + ### zone

    public [AnimalZone](AnimalZone.html "class in zombie.characters.animals") zone
  + ### removed

    private boolean removed
* Constructor Details
  -------------------

  + ### VirtualAnimal

    public VirtualAnimal()
* Method Details
  --------------

  + ### getX

    public float getX()
  + ### setX

    public void setX(float x)
  + ### getY

    public float getY()
  + ### setY

    public void setY(float y)
  + ### getZ

    public float getZ()
  + ### setZ

    public void setZ(float z)
  + ### setState

    public void setState(zombie.characters.animals.VirtualAnimalState state)
  + ### getState

    public zombie.characters.animals.VirtualAnimalState getState()
  + ### update

    void update()
  + ### save

    void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### forceRest

    public void forceRest()
  + ### forceEat

    public void forceEat()
  + ### forceWakeUp

    public void forceWakeUp()
  + ### forceStopEat

    public void forceStopEat()
  + ### isEating

    public boolean isEating()
  + ### isSleeping

    public boolean isSleeping()
  + ### isTimeToSleep

    public boolean isTimeToSleep()

    Animals have either a period to sleep or simply they'll sleep every X minutes
  + ### isTimeToEat

    public boolean isTimeToEat()

    Animals have either a period to eat or simply they'll eat every X minutes
  + ### getNextSleepPeriod

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNextSleepPeriod()

    For debug stuff
  + ### getEndSleepPeriod

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEndSleepPeriod()
  + ### getEndEatPeriod

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEndEatPeriod()
  + ### getNextEatPeriod

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNextEatPeriod()

    For debug stuff
  + ### setRemoved

    public void setRemoved(boolean bRemoved)
  + ### isRemoved

    public boolean isRemoved()
  + ### findAnimalById

    public [IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") findAnimalById(int animalID)