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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [TREE\_SOUND\_RADIUS](#TREE_SOUND_RADIUS)
   2. [squares](#squares)
   3. [slots](#slots)
   4. [comp](#comp)
7. [Constructor Details](#constructor-detail)
   1. [TreeSoundManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [addSquare(IsoGridSquare)](#addSquare(zombie.iso.IsoGridSquare))
   2. [update()](#update())
   3. [shouldPlay(IsoGridSquare)](#shouldPlay(zombie.iso.IsoGridSquare))
   4. [getExistingSlot(IsoGridSquare)](#getExistingSlot(zombie.iso.IsoGridSquare))
   5. [getFreeSlot()](#getFreeSlot())
   6. [getFreeSlot(long)](#getFreeSlot(long))
   7. [stopNotPlaying(long)](#stopNotPlaying(long))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TreeSoundManager
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.TreeSoundManager

---

public class TreeSoundManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `TreeSoundManager.Slot`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Comparator<IsoGridSquare>`

  `comp`

  `private final TreeSoundManager.Slot[]`

  `slots`

  `private final ArrayList<IsoGridSquare>`

  `squares`

  `private static final int`

  `TREE_SOUND_RADIUS`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TreeSoundManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addSquare(IsoGridSquare square)`

  `(package private) int`

  `getExistingSlot(IsoGridSquare square)`

  `private int`

  `getFreeSlot()`

  `private int`

  `getFreeSlot(long ms)`

  `(package private) boolean`

  `shouldPlay(IsoGridSquare square)`

  `(package private) void`

  `stopNotPlaying(long ms)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### TREE\_SOUND\_RADIUS

    private static final int TREE\_SOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.audio.TreeSoundManager.TREE_SOUND_RADIUS)
  + ### squares

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso")> squares
  + ### slots

    private final [TreeSoundManager.Slot](TreeSoundManager.Slot.html "class in zombie.audio")[] slots
  + ### comp

    private final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso")> comp
* Constructor Details
  -------------------

  + ### TreeSoundManager

    public TreeSoundManager()
* Method Details
  --------------

  + ### addSquare

    public void addSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### update

    public void update()
  + ### shouldPlay

    boolean shouldPlay([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getExistingSlot

    int getExistingSlot([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getFreeSlot

    private int getFreeSlot()
  + ### getFreeSlot

    private int getFreeSlot(long ms)
  + ### stopNotPlaying

    void stopNotPlaying(long ms)