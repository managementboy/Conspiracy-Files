[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.ecs](package-summary.html)
2. [ECSComponent](ECSComponent.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [ecsClass](#ecsClass)
   2. [ecsOwner](#ecsOwner)
6. [Constructor Details](#constructor-detail)
   1. [ECSComponent()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getECSClass()](#getECSClass())
   2. [getECSClass(Class)](#getECSClass(java.lang.Class))
   3. [getECSOwnerEntity()](#getECSOwnerEntity())
   4. [setECSOwnerEntity(EntityType)](#setECSOwnerEntity(EntityType))
   5. [getECSOwnerEntity(Class)](#getECSOwnerEntity(java.lang.Class))
   6. [tryGetECSOwnerEntity(Class)](#tryGetECSOwnerEntity(java.lang.Class))
   7. [tryGetECSOwnerEntityAs(Class)](#tryGetECSOwnerEntityAs(java.lang.Class))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ECSComponent
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.ecs.ECSComponent

Direct Known Subclasses:
:   `AIComponent, CharacterInputComponent, FrameKeeperComponent, NetworkComponent, StateMachineComponent`

---

public abstract class ECSComponent
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Class<? extends ECSComponent>`

  `ecsClass`

  `private zombie.characters.ecs.ECSEntity`

  `ecsOwner`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ECSComponent()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Class<? extends ECSComponent>`

  `getECSClass()`

  `static Class<? extends ECSComponent>`

  `getECSClass(Class<? extends ECSComponent> clazz)`

  `zombie.characters.ecs.ECSEntity`

  `getECSOwnerEntity()`

  `<EntityType extends zombie.characters.ecs.ECSEntity>  
  EntityType`

  `getECSOwnerEntity(Class<EntityType> entityTypeClass)`

  `<EntityType extends zombie.characters.ecs.ECSEntity>  
  void`

  `setECSOwnerEntity(EntityType ownerEntity)`

  `<EntityType extends zombie.characters.ecs.ECSEntity>  
  EntityType`

  `tryGetECSOwnerEntity(Class<EntityType> entityTypeClass)`

  `<OwnerType>  
  OwnerType`

  `tryGetECSOwnerEntityAs(Class<? extends OwnerType> ownerTypeClass)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### ecsClass

    private final [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [ECSComponent](ECSComponent.html "class in zombie.characters.ecs")> ecsClass
  + ### ecsOwner

    private zombie.characters.ecs.ECSEntity ecsOwner
* Constructor Details
  -------------------

  + ### ECSComponent

    public ECSComponent()
* Method Details
  --------------

  + ### getECSClass

    public [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [ECSComponent](ECSComponent.html "class in zombie.characters.ecs")> getECSClass()
  + ### getECSClass

    public static [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [ECSComponent](ECSComponent.html "class in zombie.characters.ecs")> getECSClass([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [ECSComponent](ECSComponent.html "class in zombie.characters.ecs")> clazz)
  + ### getECSOwnerEntity

    public zombie.characters.ecs.ECSEntity getECSOwnerEntity()
  + ### setECSOwnerEntity

    public <EntityType extends zombie.characters.ecs.ECSEntity>
    void setECSOwnerEntity(EntityType ownerEntity)
  + ### getECSOwnerEntity

    public <EntityType extends zombie.characters.ecs.ECSEntity>
    EntityType getECSOwnerEntity([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<EntityType> entityTypeClass)
  + ### tryGetECSOwnerEntity

    public <EntityType extends zombie.characters.ecs.ECSEntity>
    EntityType tryGetECSOwnerEntity([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<EntityType> entityTypeClass)
  + ### tryGetECSOwnerEntityAs

    public <OwnerType> OwnerType tryGetECSOwnerEntityAs([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends OwnerType> ownerTypeClass)