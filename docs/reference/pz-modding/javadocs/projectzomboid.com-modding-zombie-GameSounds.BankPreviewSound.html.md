[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [GameSounds](GameSounds.html)
3. [BankPreviewSound](GameSounds.BankPreviewSound.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [clip](#clip)
   3. [effectiveGain](#effectiveGain)
6. [Constructor Details](#constructor-detail)
   1. [BankPreviewSound()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [play(GameSoundClip)](#play(zombie.audio.GameSoundClip))
   2. [isPlaying()](#isPlaying())
   3. [update()](#update())
   4. [stop()](#stop())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class GameSounds.BankPreviewSound
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.GameSounds.BankPreviewSound

All Implemented Interfaces:
:   `GameSounds.IPreviewSound`

Enclosing class:
:   `GameSounds`

---

private static final class GameSounds.BankPreviewSound
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [GameSounds.IPreviewSound](GameSounds.IPreviewSound.html "interface in zombie")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) GameSoundClip`

  `clip`

  `(package private) float`

  `effectiveGain`

  `(package private) long`

  `instance`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BankPreviewSound()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `isPlaying()`

  `boolean`

  `play(GameSoundClip clip)`

  `void`

  `stop()`

  `boolean`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    long instance
  + ### clip

    [GameSoundClip](audio/GameSoundClip.html "class in zombie.audio") clip
  + ### effectiveGain

    float effectiveGain
* Constructor Details
  -------------------

  + ### BankPreviewSound

    private BankPreviewSound()
* Method Details
  --------------

  + ### play

    public boolean play([GameSoundClip](audio/GameSoundClip.html "class in zombie.audio") clip)

    Specified by:
    :   `play` in interface `GameSounds.IPreviewSound`
  + ### isPlaying

    public boolean isPlaying()

    Specified by:
    :   `isPlaying` in interface `GameSounds.IPreviewSound`
  + ### update

    public boolean update()

    Specified by:
    :   `update` in interface `GameSounds.IPreviewSound`
  + ### stop

    public void stop()

    Specified by:
    :   `stop` in interface `GameSounds.IPreviewSound`