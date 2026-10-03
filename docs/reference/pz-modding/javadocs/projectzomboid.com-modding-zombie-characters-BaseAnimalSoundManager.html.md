[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [BaseAnimalSoundManager](BaseAnimalSoundManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [characters](#characters)
   2. [soundTime](#soundTime)
   3. [staleSlotMs](#staleSlotMs)
   4. [comp](#comp)
6. [Constructor Details](#constructor-detail)
   1. [BaseAnimalSoundManager(int, int)](#%3Cinit%3E(int,int))
7. [Method Details](#method-detail)
   1. [addCharacter(IsoAnimal)](#addCharacter(zombie.characters.animals.IsoAnimal))
   2. [update()](#update())
   3. [playSound(IsoAnimal)](#playSound(zombie.characters.animals.IsoAnimal))
   4. [postUpdate()](#postUpdate())
   5. [getFreeSoundSlot(long)](#getFreeSoundSlot(long))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseAnimalSoundManager
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BaseAnimalSoundManager

---

public abstract class BaseAnimalSoundManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final ArrayList<IsoAnimal>`

  `characters`

  `private final Comparator<IsoAnimal>`

  `comp`

  `private final long[]`

  `soundTime`

  `private final int`

  `staleSlotMs`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BaseAnimalSoundManager(int numSlots,
  int staleSlotMs)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addCharacter(IsoAnimal chr)`

  `private int`

  `getFreeSoundSlot(long ms)`

  `abstract void`

  `playSound(IsoAnimal chr)`

  `abstract void`

  `postUpdate()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### characters

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals")> characters
  + ### soundTime

    private final long[] soundTime
  + ### staleSlotMs

    private final int staleSlotMs
  + ### comp

    private final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals")> comp
* Constructor Details
  -------------------

  + ### BaseAnimalSoundManager

    public BaseAnimalSoundManager(int numSlots,
    int staleSlotMs)
* Method Details
  --------------

  + ### addCharacter

    public void addCharacter([IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals") chr)
  + ### update

    public void update()
  + ### playSound

    public abstract void playSound([IsoAnimal](animals/IsoAnimal.html "class in zombie.characters.animals") chr)
  + ### postUpdate

    public abstract void postUpdate()
  + ### getFreeSoundSlot

    private int getFreeSoundSlot(long ms)