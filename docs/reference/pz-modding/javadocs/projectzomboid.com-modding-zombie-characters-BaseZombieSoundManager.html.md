[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [BaseZombieSoundManager](BaseZombieSoundManager.html)

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
   1. [BaseZombieSoundManager(int, int)](#%3Cinit%3E(int,int))
7. [Method Details](#method-detail)
   1. [addCharacter(IsoZombie)](#addCharacter(zombie.characters.IsoZombie))
   2. [update()](#update())
   3. [playSound(IsoZombie)](#playSound(zombie.characters.IsoZombie))
   4. [postUpdate()](#postUpdate())
   5. [getFreeSoundSlot(long)](#getFreeSoundSlot(long))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseZombieSoundManager
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BaseZombieSoundManager

---

public abstract class BaseZombieSoundManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final ArrayList<IsoZombie>`

  `characters`

  `private final Comparator<IsoZombie>`

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

  `BaseZombieSoundManager(int numSlots,
  int staleSlotMs)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addCharacter(IsoZombie chr)`

  `private int`

  `getFreeSoundSlot(long ms)`

  `abstract void`

  `playSound(IsoZombie chr)`

  `abstract void`

  `postUpdate()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### characters

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](IsoZombie.html "class in zombie.characters")> characters
  + ### soundTime

    private final long[] soundTime
  + ### staleSlotMs

    private final int staleSlotMs
  + ### comp

    private final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoZombie](IsoZombie.html "class in zombie.characters")> comp
* Constructor Details
  -------------------

  + ### BaseZombieSoundManager

    public BaseZombieSoundManager(int numSlots,
    int staleSlotMs)
* Method Details
  --------------

  + ### addCharacter

    public void addCharacter([IsoZombie](IsoZombie.html "class in zombie.characters") chr)
  + ### update

    public void update()
  + ### playSound

    public abstract void playSound([IsoZombie](IsoZombie.html "class in zombie.characters") chr)
  + ### postUpdate

    public abstract void postUpdate()
  + ### getFreeSoundSlot

    private int getFreeSoundSlot(long ms)