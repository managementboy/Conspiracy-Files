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
4. [Slot](IsoFireManager.FireSounds.Slot.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fire](#fire)
   2. [emitter](#emitter)
   3. [parameterFireSize](#parameterFireSize)
   4. [instance](#instance)
   5. [playing](#playing)
6. [Constructor Details](#constructor-detail)
   1. [Slot()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [playSound(IsoFire)](#playSound(zombie.iso.objects.IsoFire))
   2. [stopPlaying()](#stopPlaying())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoFireManager.FireSounds.Slot
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.objects.IsoFireManager.FireSounds.Slot

Enclosing class:
:   `IsoFireManager.FireSounds`

---

private static final class IsoFireManager.FireSounds.Slot
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private BaseSoundEmitter`

  `emitter`

  `private IsoFire`

  `fire`

  `private long`

  `instance`

  `private final zombie.audio.parameters.ParameterFireSize`

  `parameterFireSize`

  `private boolean`

  `playing`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Slot()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `playSound(IsoFire fire)`

  `(package private) void`

  `stopPlaying()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fire

    private [IsoFire](IsoFire.html "class in zombie.iso.objects") fire
  + ### emitter

    private [BaseSoundEmitter](../../audio/BaseSoundEmitter.html "class in zombie.audio") emitter
  + ### parameterFireSize

    private final zombie.audio.parameters.ParameterFireSize parameterFireSize
  + ### instance

    private long instance
  + ### playing

    private boolean playing
* Constructor Details
  -------------------

  + ### Slot

    private Slot()
* Method Details
  --------------

  + ### playSound

    private void playSound([IsoFire](IsoFire.html "class in zombie.iso.objects") fire)
  + ### stopPlaying

    void stopPlaying()