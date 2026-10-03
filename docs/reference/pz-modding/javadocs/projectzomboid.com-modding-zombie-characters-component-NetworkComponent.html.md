[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.component](package-summary.html)
2. [NetworkComponent](NetworkComponent.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [NetworkComponent()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [isRemote()](#isRemote())
   2. [updateNetworkAI()](#updateNetworkAI())
   3. [getNetworkAI()](#getNetworkAI())
   4. [isLocal()](#isLocal())
   5. [isServer()](#isServer())
   6. [isClient()](#isClient())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class NetworkComponent
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.ecs.ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

zombie.characters.component.NetworkComponent

Direct Known Subclasses:
:   `NetworkPlayerComponent, NetworkZombieComponent`

---

public abstract class NetworkComponent
extends [ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NetworkComponent()`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `abstract zombie.characters.NetworkCharacterAI`

  `getNetworkAI()`

  `final boolean`

  `isClient()`

  `final boolean`

  `isLocal()`

  `abstract boolean`

  `isRemote()`

  `final boolean`

  `isServer()`

  `abstract void`

  `updateNetworkAI()`

  ### Methods inherited from class [ECSComponent](../ecs/ECSComponent.html#method-summary "class in zombie.characters.ecs")

  `getECSClass, getECSClass, getECSOwnerEntity, getECSOwnerEntity, setECSOwnerEntity, tryGetECSOwnerEntity, tryGetECSOwnerEntityAs`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### NetworkComponent

    public NetworkComponent()
* Method Details
  --------------

  + ### isRemote

    public abstract boolean isRemote()
  + ### updateNetworkAI

    public abstract void updateNetworkAI()
  + ### getNetworkAI

    public abstract zombie.characters.NetworkCharacterAI getNetworkAI()
  + ### isLocal

    public final boolean isLocal()
  + ### isServer

    public final boolean isServer()
  + ### isClient

    public final boolean isClient()