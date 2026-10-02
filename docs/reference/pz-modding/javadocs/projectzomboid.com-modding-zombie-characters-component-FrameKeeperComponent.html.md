[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.component](package-summary.html)
2. [FrameKeeperComponent](FrameKeeperComponent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [frameNo](#frameNo)
6. [Constructor Details](#constructor-detail)
   1. [FrameKeeperComponent()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getFrameNo()](#getFrameNo())
   2. [setFrameNo(int)](#setFrameNo(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FrameKeeperComponent
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.ecs.ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

zombie.characters.component.FrameKeeperComponent

---

public class FrameKeeperComponent
extends [ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `frameNo`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FrameKeeperComponent()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `final int`

  `getFrameNo()`

  `final void`

  `setFrameNo(int ecsFrameNo)`

  ### Methods inherited from class [ECSComponent](../ecs/ECSComponent.html#method-summary "class in zombie.characters.ecs")

  `getECSClass, getECSClass, getECSOwnerEntity, getECSOwnerEntity, setECSOwnerEntity, tryGetECSOwnerEntity, tryGetECSOwnerEntityAs`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### frameNo

    private int frameNo
* Constructor Details
  -------------------

  + ### FrameKeeperComponent

    public FrameKeeperComponent()
* Method Details
  --------------

  + ### getFrameNo

    public final int getFrameNo()
  + ### setFrameNo

    public final void setFrameNo(int ecsFrameNo)