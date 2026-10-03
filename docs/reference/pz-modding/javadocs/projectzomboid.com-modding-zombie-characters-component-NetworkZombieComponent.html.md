[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.component](package-summary.html)
2. [NetworkZombieComponent](NetworkZombieComponent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [authOwner](#authOwner)
   2. [authOwnerPlayer](#authOwnerPlayer)
   3. [networkAi](#networkAi)
6. [Constructor Details](#constructor-detail)
   1. [NetworkZombieComponent(IsoZombie)](#%3Cinit%3E(zombie.characters.IsoZombie))
7. [Method Details](#method-detail)
   1. [isRemote()](#isRemote())
   2. [updateNetworkAI()](#updateNetworkAI())
   3. [getAuthOwner()](#getAuthOwner())
   4. [setAuthOwner(UdpConnection)](#setAuthOwner(zombie.core.raknet.UdpConnection))
   5. [getOwnerPlayer()](#getOwnerPlayer())
   6. [setOwnerPlayer(IsoPlayer)](#setOwnerPlayer(zombie.characters.IsoPlayer))
   7. [getNetworkAI()](#getNetworkAI())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class NetworkZombieComponent
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.ecs.ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

[zombie.characters.component.NetworkComponent](NetworkComponent.html "class in zombie.characters.component")

zombie.characters.component.NetworkZombieComponent

---

public class NetworkZombieComponent
extends [NetworkComponent](NetworkComponent.html "class in zombie.characters.component")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private zombie.core.raknet.UdpConnection`

  `authOwner`

  `private IsoPlayer`

  `authOwnerPlayer`

  `private final zombie.characters.NetworkZombieAI`

  `networkAi`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NetworkZombieComponent(IsoZombie zombie)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.core.raknet.UdpConnection`

  `getAuthOwner()`

  `zombie.characters.NetworkZombieAI`

  `getNetworkAI()`

  `IsoPlayer`

  `getOwnerPlayer()`

  `boolean`

  `isRemote()`

  `void`

  `setAuthOwner(zombie.core.raknet.UdpConnection authOwner)`

  `void`

  `setOwnerPlayer(IsoPlayer player)`

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

  + ### authOwner

    private zombie.core.raknet.UdpConnection authOwner
  + ### authOwnerPlayer

    private [IsoPlayer](../IsoPlayer.html "class in zombie.characters") authOwnerPlayer
  + ### networkAi

    private final zombie.characters.NetworkZombieAI networkAi
* Constructor Details
  -------------------

  + ### NetworkZombieComponent

    public NetworkZombieComponent([IsoZombie](../IsoZombie.html "class in zombie.characters") zombie)
* Method Details
  --------------

  + ### isRemote

    public boolean isRemote()

    Specified by:
    :   `isRemote` in class `NetworkComponent`
  + ### updateNetworkAI

    public void updateNetworkAI()

    Specified by:
    :   `updateNetworkAI` in class `NetworkComponent`
  + ### getAuthOwner

    public zombie.core.raknet.UdpConnection getAuthOwner()
  + ### setAuthOwner

    public void setAuthOwner(zombie.core.raknet.UdpConnection authOwner)
  + ### getOwnerPlayer

    public [IsoPlayer](../IsoPlayer.html "class in zombie.characters") getOwnerPlayer()
  + ### setOwnerPlayer

    public void setOwnerPlayer([IsoPlayer](../IsoPlayer.html "class in zombie.characters") player)
  + ### getNetworkAI

    public zombie.characters.NetworkZombieAI getNetworkAI()

    Specified by:
    :   `getNetworkAI` in class `NetworkComponent`