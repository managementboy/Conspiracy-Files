[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [TreeSoundManager](TreeSoundManager.html)
3. [Slot](TreeSoundManager.Slot.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [soundTime](#soundTime)
   2. [square](#square)
   3. [playing](#playing)
   4. [emitter](#emitter)
   5. [instance](#instance)
6. [Constructor Details](#constructor-detail)
   1. [Slot()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [playSound(IsoGridSquare)](#playSound(zombie.iso.IsoGridSquare))
   2. [stopPlaying()](#stopPlaying())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TreeSoundManager.Slot
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.TreeSoundManager.Slot

Enclosing class:
:   `TreeSoundManager`

---

private static final class TreeSoundManager.Slot
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) BaseSoundEmitter`

  `emitter`

  `(package private) long`

  `instance`

  `(package private) boolean`

  `playing`

  `(package private) long`

  `soundTime`

  `(package private) IsoGridSquare`

  `square`
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

  `(package private) void`

  `playSound(IsoGridSquare square)`

  `(package private) void`

  `stopPlaying()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### soundTime

    long soundTime
  + ### square

    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square
  + ### playing

    boolean playing
  + ### emitter

    [BaseSoundEmitter](BaseSoundEmitter.html "class in zombie.audio") emitter
  + ### instance

    long instance
* Constructor Details
  -------------------

  + ### Slot

    private Slot()
* Method Details
  --------------

  + ### playSound

    void playSound([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### stopPlaying

    void stopPlaying()