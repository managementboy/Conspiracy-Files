[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoCamera](IsoCamera.html)
3. [FrameState](IsoCamera.FrameState.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [frameCount](#frameCount)
   2. [unPausedAccumulator](#unPausedAccumulator)
   3. [paused](#paused)
   4. [playerIndex](#playerIndex)
   5. [camCharacterX](#camCharacterX)
   6. [camCharacterY](#camCharacterY)
   7. [camCharacterZ](#camCharacterZ)
   8. [camCharacter](#camCharacter)
   9. [camCharacterSquare](#camCharacterSquare)
   10. [camCharacterRoom](#camCharacterRoom)
   11. [offX](#offX)
   12. [offY](#offY)
   13. [offscreenWidth](#offscreenWidth)
   14. [offscreenHeight](#offscreenHeight)
   15. [zoom](#zoom)
6. [Constructor Details](#constructor-detail)
   1. [FrameState()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(int)](#set(int))
   2. [calculateCameraZ(IsoGameCharacter)](#calculateCameraZ(zombie.characters.IsoGameCharacter))
   3. [updateUnPausedAccumulator()](#updateUnPausedAccumulator())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoCamera.FrameState
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoCamera.FrameState

Enclosing class:
:   `IsoCamera`

---

public static final class IsoCamera.FrameState
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `IsoGameCharacter`

  `camCharacter`

  `IsoRoom`

  `camCharacterRoom`

  `IsoGridSquare`

  `camCharacterSquare`

  `float`

  `camCharacterX`

  `float`

  `camCharacterY`

  `float`

  `camCharacterZ`

  `int`

  `frameCount`

  `int`

  `offscreenHeight`

  `int`

  `offscreenWidth`

  `float`

  `offX`

  `float`

  `offY`

  `boolean`

  `paused`

  `int`

  `playerIndex`

  `float`

  `unPausedAccumulator`

  `float`

  `zoom`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FrameState()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `calculateCameraZ(IsoGameCharacter character)`

  `void`

  `set(int playerIndex)`

  `void`

  `updateUnPausedAccumulator()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### frameCount

    public int frameCount
  + ### unPausedAccumulator

    public float unPausedAccumulator
  + ### paused

    public boolean paused
  + ### playerIndex

    public int playerIndex
  + ### camCharacterX

    public float camCharacterX
  + ### camCharacterY

    public float camCharacterY
  + ### camCharacterZ

    public float camCharacterZ
  + ### camCharacter

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") camCharacter
  + ### camCharacterSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") camCharacterSquare
  + ### camCharacterRoom

    public [IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") camCharacterRoom
  + ### offX

    public float offX
  + ### offY

    public float offY
  + ### offscreenWidth

    public int offscreenWidth
  + ### offscreenHeight

    public int offscreenHeight
  + ### zoom

    public float zoom
* Constructor Details
  -------------------

  + ### FrameState

    public FrameState()
* Method Details
  --------------

  + ### set

    public void set(int playerIndex)
  + ### calculateCameraZ

    public float calculateCameraZ([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### updateUnPausedAccumulator

    public void updateUnPausedAccumulator()