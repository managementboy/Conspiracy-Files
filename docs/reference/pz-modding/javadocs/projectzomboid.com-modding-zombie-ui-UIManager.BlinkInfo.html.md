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
3. [BlinkInfo](UIManager.BlinkInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [alpha](#alpha)
   2. [delta](#delta)
   3. [direction](#direction)
   4. [syncedIconIndex](#syncedIconIndex)
   5. [syncedIconIndexTimer](#syncedIconIndexTimer)
6. [Constructor Details](#constructor-detail)
   1. [BlinkInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [update()](#update())
   2. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UIManager.BlinkInfo
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.UIManager.BlinkInfo

Enclosing class:
:   `UIManager`

---

private static class UIManager.BlinkInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `alpha`

  `private final float`

  `delta`

  `private float`

  `direction`

  `private int`

  `syncedIconIndex`

  `private float`

  `syncedIconIndexTimer`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BlinkInfo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `reset()`

  `private void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### alpha

    private float alpha
  + ### delta

    private final float delta

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.UIManager.BlinkInfo.delta)
  + ### direction

    private float direction
  + ### syncedIconIndex

    private int syncedIconIndex
  + ### syncedIconIndexTimer

    private float syncedIconIndexTimer
* Constructor Details
  -------------------

  + ### BlinkInfo

    private BlinkInfo()
* Method Details
  --------------

  + ### update

    private void update()
  + ### reset

    private void reset()