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
3. [IPreviewSound](GameSounds.IPreviewSound.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [play(GameSoundClip)](#play(zombie.audio.GameSoundClip))
   2. [isPlaying()](#isPlaying())
   3. [update()](#update())
   4. [stop()](#stop())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Interface GameSounds.IPreviewSound
==================================

All Known Implementing Classes:
:   `GameSounds.BankPreviewSound, GameSounds.FilePreviewSound`

Enclosing class:
:   `GameSounds`

---

private static interface GameSounds.IPreviewSound

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

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

* Method Details
  --------------

  + ### play

    boolean play([GameSoundClip](audio/GameSoundClip.html "class in zombie.audio") clip)
  + ### isPlaying

    boolean isPlaying()
  + ### update

    boolean update()
  + ### stop

    void stop()