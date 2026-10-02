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
3. [FireSounds](IsoFireManager.FireSounds.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [fires](#fires)
   2. [slots](#slots)
   3. [comp](#comp)
7. [Constructor Details](#constructor-detail)
   1. [FireSounds(int)](#%3Cinit%3E(int))
8. [Method Details](#method-detail)
   1. [addFire(IsoFire)](#addFire(zombie.iso.objects.IsoFire))
   2. [removeFire(IsoFire)](#removeFire(zombie.iso.objects.IsoFire))
   3. [update()](#update())
   4. [shouldPlay(IsoFire)](#shouldPlay(zombie.iso.objects.IsoFire))
   5. [getExistingSlot(IsoFire)](#getExistingSlot(zombie.iso.objects.IsoFire))
   6. [getFreeSlot()](#getFreeSlot())
   7. [stopNotPlaying()](#stopNotPlaying())
   8. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoFireManager.FireSounds
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.objects.IsoFireManager.FireSounds

Enclosing class:
:   `IsoFireManager`

---

private static final class IsoFireManager.FireSounds
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `IsoFireManager.FireSounds.Slot`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Comparator<IsoFire>`

  `comp`

  `private final ArrayList<IsoFire>`

  `fires`

  `private final IsoFireManager.FireSounds.Slot[]`

  `slots`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FireSounds(int numSlots)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addFire(IsoFire fire)`

  `private int`

  `getExistingSlot(IsoFire fire)`

  `private int`

  `getFreeSlot()`

  `private void`

  `removeFire(IsoFire fire)`

  `private void`

  `Reset()`

  `private boolean`

  `shouldPlay(IsoFire fire)`

  `private void`

  `stopNotPlaying()`

  `private void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fires

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoFire](IsoFire.html "class in zombie.iso.objects")> fires
  + ### slots

    private final [IsoFireManager.FireSounds.Slot](IsoFireManager.FireSounds.Slot.html "class in zombie.iso.objects")[] slots
  + ### comp

    private final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoFire](IsoFire.html "class in zombie.iso.objects")> comp
* Constructor Details
  -------------------

  + ### FireSounds

    private FireSounds(int numSlots)
* Method Details
  --------------

  + ### addFire

    private void addFire([IsoFire](IsoFire.html "class in zombie.iso.objects") fire)
  + ### removeFire

    private void removeFire([IsoFire](IsoFire.html "class in zombie.iso.objects") fire)
  + ### update

    private void update()
  + ### shouldPlay

    private boolean shouldPlay([IsoFire](IsoFire.html "class in zombie.iso.objects") fire)
  + ### getExistingSlot

    private int getExistingSlot([IsoFire](IsoFire.html "class in zombie.iso.objects") fire)
  + ### getFreeSlot

    private int getFreeSlot()
  + ### stopNotPlaying

    private void stopNotPlaying()
  + ### Reset

    private void Reset()