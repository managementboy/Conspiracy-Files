[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.component](package-summary.html)
2. [StateMachineComponent](StateMachineComponent.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [stateMachine](#stateMachine)
   2. [defaultState](#defaultState)
   3. [aiStateMap](#aiStateMap)
   4. [stateMachineParams](#stateMachineParams)
   5. [advancedAnimator](#advancedAnimator)
   6. [actionContext](#actionContext)
7. [Constructor Details](#constructor-detail)
   1. [StateMachineComponent(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
8. [Method Details](#method-detail)
   1. [getStateMachine()](#getStateMachine())
   2. [getStateMachineParams(Class)](#getStateMachineParams(java.lang.Class))
   3. [getAdvancedAnimator()](#getAdvancedAnimator())
   4. [getActionContext()](#getActionContext())
   5. [invokeGlobalAnimEvent(GlobalAnimEvent)](#invokeGlobalAnimEvent(zombie.core.skinnedmodel.advancedanimation.events.GlobalAnimEvent))
   6. [init(IsoGameCharacter)](#init(zombie.characters.IsoGameCharacter))
   7. [actionStateChanged(ActionContext)](#actionStateChanged(zombie.characters.action.ActionContext))
   8. [setDefaultState()](#setDefaultState())
   9. [setDefaultState(State)](#setDefaultState(zombie.ai.State))
   10. [tryGetAIState(String)](#tryGetAIState(java.lang.String))
   11. [clearAIStateMap()](#clearAIStateMap())
   12. [registerAIState(String, State)](#registerAIState(java.lang.String,zombie.ai.State))
   13. [getDefaultState()](#getDefaultState())
   14. [getMinimumSimulationLevel()](#getMinimumSimulationLevel())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class StateMachineComponent
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.ecs.ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

zombie.characters.component.StateMachineComponent

---

public class StateMachineComponent
extends [ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `StateMachineComponent.L_actionStateChanged`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.characters.action.ActionContext`

  `actionContext`

  `private final zombie.core.skinnedmodel.advancedanimation.AdvancedAnimator`

  `advancedAnimator`

  `private final HashMap<String, zombie.ai.State>`

  `aiStateMap`

  `private zombie.ai.State`

  `defaultState`

  `private final zombie.ai.StateMachine`

  `stateMachine`

  `private final Map<Class<?>, Map<zombie.ai.State.Param<?>, Object>>`

  `stateMachineParams`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `StateMachineComponent(IsoGameCharacter owner)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `actionStateChanged(zombie.characters.action.ActionContext sender)`

  `void`

  `clearAIStateMap()`

  `zombie.characters.action.ActionContext`

  `getActionContext()`

  `zombie.core.skinnedmodel.advancedanimation.AdvancedAnimator`

  `getAdvancedAnimator()`

  `zombie.ai.State`

  `getDefaultState()`

  `zombie.UpdateSchedulerSimulationLevel`

  `getMinimumSimulationLevel()`

  `zombie.ai.StateMachine`

  `getStateMachine()`

  `Map<zombie.ai.State.Param<?>, Object>`

  `getStateMachineParams(Class<?> clazz)`

  `void`

  `init(IsoGameCharacter owner)`

  `void`

  `invokeGlobalAnimEvent(zombie.core.skinnedmodel.advancedanimation.events.GlobalAnimEvent animEvent)`

  `void`

  `registerAIState(String name,
  zombie.ai.State aiState)`

  `void`

  `setDefaultState()`

  `void`

  `setDefaultState(zombie.ai.State defaultState)`

  `zombie.ai.State`

  `tryGetAIState(String stateName)`

  ### Methods inherited from class [ECSComponent](../ecs/ECSComponent.html#method-summary "class in zombie.characters.ecs")

  `getECSClass, getECSClass, getECSOwnerEntity, getECSOwnerEntity, setECSOwnerEntity, tryGetECSOwnerEntity, tryGetECSOwnerEntityAs`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### stateMachine

    private final zombie.ai.StateMachine stateMachine
  + ### defaultState

    private zombie.ai.State defaultState
  + ### aiStateMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.ai.State> aiStateMap
  + ### stateMachineParams

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?>, [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.ai.State.Param<?>, [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")>> stateMachineParams
  + ### advancedAnimator

    private final zombie.core.skinnedmodel.advancedanimation.AdvancedAnimator advancedAnimator
  + ### actionContext

    private final zombie.characters.action.ActionContext actionContext
* Constructor Details
  -------------------

  + ### StateMachineComponent

    public StateMachineComponent([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") owner)
* Method Details
  --------------

  + ### getStateMachine

    public zombie.ai.StateMachine getStateMachine()
  + ### getStateMachineParams

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.ai.State.Param<?>, [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> getStateMachineParams([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> clazz)
  + ### getAdvancedAnimator

    public zombie.core.skinnedmodel.advancedanimation.AdvancedAnimator getAdvancedAnimator()
  + ### getActionContext

    public zombie.characters.action.ActionContext getActionContext()
  + ### invokeGlobalAnimEvent

    public void invokeGlobalAnimEvent(zombie.core.skinnedmodel.advancedanimation.events.GlobalAnimEvent animEvent)
  + ### init

    public void init([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") owner)
  + ### actionStateChanged

    private void actionStateChanged(zombie.characters.action.ActionContext sender)
  + ### setDefaultState

    public void setDefaultState()
  + ### setDefaultState

    public void setDefaultState(zombie.ai.State defaultState)
  + ### tryGetAIState

    public zombie.ai.State tryGetAIState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stateName)
  + ### clearAIStateMap

    public void clearAIStateMap()
  + ### registerAIState

    public void registerAIState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    zombie.ai.State aiState)
  + ### getDefaultState

    public zombie.ai.State getDefaultState()
  + ### getMinimumSimulationLevel

    public zombie.UpdateSchedulerSimulationLevel getMinimumSimulationLevel()