[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.visual](package-summary.html)
2. [IAnimalVisual](IAnimalVisual.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [getAnimalVisual()](#getAnimalVisual())
   2. [getAnimalType()](#getAnimalType())
   3. [getAnimalSize()](#getAnimalSize())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Interface IAnimalVisual
=======================

All Superinterfaces:
:   `IHumanVisual`

All Known Implementing Classes:
:   `IsoAnimal, IsoDeadBody, IsoPlayer, UI3DScene.SceneAnimal`

---

public interface IAnimalVisual
extends [IHumanVisual](IHumanVisual.html "interface in zombie.core.skinnedmodel.visual")

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `float`

  `getAnimalSize()`

  `String`

  `getAnimalType()`

  `AnimalVisual`

  `getAnimalVisual()`

  ### Methods inherited from interface [IHumanVisual](IHumanVisual.html#method-summary "interface in zombie.core.skinnedmodel.visual")

  `getHumanVisual, getItemVisuals, isFemale, isSkeleton, isZombie`

* Method Details
  --------------

  + ### getAnimalVisual

    [AnimalVisual](AnimalVisual.html "class in zombie.core.skinnedmodel.visual") getAnimalVisual()
  + ### getAnimalType

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalType()
  + ### getAnimalSize

    float getAnimalSize()