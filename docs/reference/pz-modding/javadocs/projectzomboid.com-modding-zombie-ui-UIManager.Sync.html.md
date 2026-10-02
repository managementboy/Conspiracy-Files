[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UIManager](UIManager.html)
3. [Sync](UIManager.Sync.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fps](#fps)
   2. [period](#period)
   3. [excess](#excess)
   4. [beforeTime](#beforeTime)
   5. [overSleepTime](#overSleepTime)
6. [Constructor Details](#constructor-detail)
   1. [Sync()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [begin()](#begin())
   2. [startFrame()](#startFrame())
   3. [endFrame()](#endFrame())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UIManager.Sync
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.UIManager.Sync

Enclosing class:
:   `UIManager`

---

static class UIManager.Sync
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private long`

  `beforeTime`

  `private long`

  `excess`

  `private final int`

  `fps`

  `private long`

  `overSleepTime`

  `private final long`

  `period`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Sync()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `begin()`

  `(package private) void`

  `endFrame()`

  `(package private) void`

  `startFrame()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fps

    private final int fps

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.UIManager.Sync.fps)
  + ### period

    private final long period

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.UIManager.Sync.period)
  + ### excess

    private long excess
  + ### beforeTime

    private long beforeTime
  + ### overSleepTime

    private long overSleepTime
* Constructor Details
  -------------------

  + ### Sync

    Sync()
* Method Details
  --------------

  + ### begin

    void begin()
  + ### startFrame

    void startFrame()
  + ### endFrame

    void endFrame()