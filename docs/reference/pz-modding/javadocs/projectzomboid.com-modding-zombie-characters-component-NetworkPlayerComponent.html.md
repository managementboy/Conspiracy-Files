[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.component](package-summary.html)
2. [NetworkPlayerComponent](NetworkPlayerComponent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [networkAi](#networkAi)
6. [Constructor Details](#constructor-detail)
   1. [NetworkPlayerComponent(IsoPlayer)](#%3Cinit%3E(zombie.characters.IsoPlayer))
7. [Method Details](#method-detail)
   1. [isRemote()](#isRemote())
   2. [isLocalPlayer()](#isLocalPlayer())
   3. [updateNetworkAI()](#updateNetworkAI())
   4. [getNetworkAI()](#getNetworkAI())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class NetworkPlayerComponent
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.ecs.ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

[zombie.characters.component.NetworkComponent](NetworkComponent.html "class in zombie.characters.component")

zombie.characters.component.NetworkPlayerComponent

---

public class NetworkPlayerComponent
extends [NetworkComponent](NetworkComponent.html "class in zombie.characters.component")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.characters.NetworkPlayerAI`

  `networkAi`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NetworkPlayerComponent(IsoPlayer player)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.characters.NetworkPlayerAI`

  `getNetworkAI()`

  `private boolean`

  `isLocalPlayer()`

  `boolean`

  `isRemote()`

  `void`

  `updateNetworkAI()`

  ### Methods inherited from class [NetworkComponent](NetworkComponent.html#method-summary "class in zombie.characters.component")

  `isClient, isLocal, isServer`

  ### Methods inherited from class [ECSComponent](../ecs/ECSComponent.html#method-summary "class in zombie.characters.ecs")

  `getECSClass, getECSClass, getECSOwnerEntity, getECSOwnerEntity, setECSOwnerEntity, tryGetECSOwnerEntity, tryGetECSOwnerEntityAs`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### networkAi

    private final zombie.characters.NetworkPlayerAI networkAi
* Constructor Details
  -------------------

  + ### NetworkPlayerComponent

    public NetworkPlayerComponent([IsoPlayer](../IsoPlayer.html "class in zombie.characters") player)
* Method Details
  --------------

  + ### isRemote

    public boolean isRemote()

    Specified by:
    :   `isRemote` in class `NetworkComponent`
  + ### isLocalPlayer

    private boolean isLocalPlayer()
  + ### updateNetworkAI

    public void updateNetworkAI()

    Specified by:
    :   `updateNetworkAI` in class `NetworkComponent`
  + ### getNetworkAI

    public zombie.characters.NetworkPlayerAI getNetworkAI()

    Specified by:
    :   `getNetworkAI` in class `NetworkComponent`