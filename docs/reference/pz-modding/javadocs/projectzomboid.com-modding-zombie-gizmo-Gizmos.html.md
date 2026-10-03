[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gizmo](package-summary.html)
2. [Gizmos](Gizmos.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [playerData](#playerData)
   3. [drawerPool](#drawerPool)
7. [Constructor Details](#constructor-detail)
   1. [Gizmos()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [getPlayerData(int)](#getPlayerData(int))
   3. [getGizmo(int)](#getGizmo(int))
   4. [setGizmo(int, Gizmo)](#setGizmo(int,zombie.gizmo.Gizmo))
   5. [getRotateGizmo(int)](#getRotateGizmo(int))
   6. [getTranslateGizmo(int)](#getTranslateGizmo(int))
   7. [isTrackingMouse()](#isTrackingMouse())
   8. [hitTest(int, int)](#hitTest(int,int))
   9. [render(int)](#render(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Gizmos
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gizmo.Gizmos

---

public final class Gizmos
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `Gizmos.PlayerData`

  `private static final class`

  `Gizmos.SceneDrawer`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.popman.ObjectPool<Gizmos.SceneDrawer>`

  `drawerPool`

  `private static Gizmos`

  `instance`

  `private final Gizmos.PlayerData[]`

  `playerData`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Gizmos()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.gizmo.Gizmo`

  `getGizmo(int playerIndex)`

  `static Gizmos`

  `getInstance()`

  `private Gizmos.PlayerData`

  `getPlayerData(int playerIndex)`

  `zombie.gizmo.Gizmo`

  `getRotateGizmo(int playerIndex)`

  `zombie.gizmo.Gizmo`

  `getTranslateGizmo(int playerIndex)`

  `boolean`

  `hitTest(int mouseX,
  int mouseY)`

  `boolean`

  `isTrackingMouse()`

  `void`

  `render(int playerIndex)`

  `void`

  `setGizmo(int playerIndex,
  zombie.gizmo.Gizmo gizmo)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [Gizmos](Gizmos.html "class in zombie.gizmo") instance
  + ### playerData

    private final [Gizmos.PlayerData](Gizmos.PlayerData.html "class in zombie.gizmo")[] playerData
  + ### drawerPool

    private final zombie.popman.ObjectPool<[Gizmos.SceneDrawer](Gizmos.SceneDrawer.html "class in zombie.gizmo")> drawerPool
* Constructor Details
  -------------------

  + ### Gizmos

    private Gizmos()
* Method Details
  --------------

  + ### getInstance

    public static [Gizmos](Gizmos.html "class in zombie.gizmo") getInstance()
  + ### getPlayerData

    private [Gizmos.PlayerData](Gizmos.PlayerData.html "class in zombie.gizmo") getPlayerData(int playerIndex)
  + ### getGizmo

    public zombie.gizmo.Gizmo getGizmo(int playerIndex)
  + ### setGizmo

    public void setGizmo(int playerIndex,
    zombie.gizmo.Gizmo gizmo)
  + ### getRotateGizmo

    public zombie.gizmo.Gizmo getRotateGizmo(int playerIndex)
  + ### getTranslateGizmo

    public zombie.gizmo.Gizmo getTranslateGizmo(int playerIndex)
  + ### isTrackingMouse

    public boolean isTrackingMouse()
  + ### hitTest

    public boolean hitTest(int mouseX,
    int mouseY)
  + ### render

    public void render(int playerIndex)