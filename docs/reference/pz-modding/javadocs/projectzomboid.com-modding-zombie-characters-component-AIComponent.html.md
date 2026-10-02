[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.component](package-summary.html)
2. [AIComponent](AIComponent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [humanControlVars](#humanControlVars)
6. [Constructor Details](#constructor-detail)
   1. [AIComponent()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [doUpdatePlayerControls(IsoPlayer)](#doUpdatePlayerControls(zombie.characters.IsoPlayer))
   2. [update()](#update())
   3. [postUpdatePlayer(IsoPlayer)](#postUpdatePlayer(zombie.characters.IsoPlayer))
   4. [getPlayer()](#getPlayer())
   5. [getHumanControlVars()](#getHumanControlVars())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AIComponent
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.ecs.ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

zombie.characters.component.AIComponent

---

public class AIComponent
extends [ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.ai.AIBrainPlayerControlVars`

  `humanControlVars`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AIComponent()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `doUpdatePlayerControls(IsoPlayer ownerPlayer)`

  `zombie.ai.AIBrainPlayerControlVars`

  `getHumanControlVars()`

  `IsoPlayer`

  `getPlayer()`

  `void`

  `postUpdatePlayer(IsoPlayer ownerPlayer)`

  `void`

  `update()`

  ### Methods inherited from class [ECSComponent](../ecs/ECSComponent.html#method-summary "class in zombie.characters.ecs")

  `getECSClass, getECSClass, getECSOwnerEntity, getECSOwnerEntity, setECSOwnerEntity, tryGetECSOwnerEntity, tryGetECSOwnerEntityAs`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### humanControlVars

    private final zombie.ai.AIBrainPlayerControlVars humanControlVars
* Constructor Details
  -------------------

  + ### AIComponent

    public AIComponent()
* Method Details
  --------------

  + ### doUpdatePlayerControls

    public boolean doUpdatePlayerControls([IsoPlayer](../IsoPlayer.html "class in zombie.characters") ownerPlayer)
  + ### update

    public void update()
  + ### postUpdatePlayer

    public void postUpdatePlayer([IsoPlayer](../IsoPlayer.html "class in zombie.characters") ownerPlayer)
  + ### getPlayer

    public [IsoPlayer](../IsoPlayer.html "class in zombie.characters") getPlayer()
  + ### getHumanControlVars

    public zombie.ai.AIBrainPlayerControlVars getHumanControlVars()