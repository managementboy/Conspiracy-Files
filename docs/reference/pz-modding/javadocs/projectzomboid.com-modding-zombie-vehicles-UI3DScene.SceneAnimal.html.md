[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [UI3DScene](UI3DScene.html)
3. [SceneAnimal](UI3DScene.SceneAnimal.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [visual](#visual)
   2. [itemVisuals](#itemVisuals)
   3. [definition](#definition)
   4. [breed](#breed)
6. [Constructor Details](#constructor-detail)
   1. [SceneAnimal(UI3DScene, String, AnimalDefinitions, AnimalBreed)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String,zombie.characters.animals.AnimalDefinitions,zombie.characters.animals.datas.AnimalBreed))
7. [Method Details](#method-detail)
   1. [setAnimalDefinition(AnimalDefinitions, AnimalBreed)](#setAnimalDefinition(zombie.characters.animals.AnimalDefinitions,zombie.characters.animals.datas.AnimalBreed))
   2. [initAnimatedModel()](#initAnimatedModel())
   3. [getAnimalVisual()](#getAnimalVisual())
   4. [getAnimalType()](#getAnimalType())
   5. [getAnimalSize()](#getAnimalSize())
   6. [getHumanVisual()](#getHumanVisual())
   7. [getItemVisuals(ItemVisuals)](#getItemVisuals(zombie.core.skinnedmodel.visual.ItemVisuals))
   8. [isFemale()](#isFemale())
   9. [isZombie()](#isZombie())
   10. [isSkeleton()](#isSkeleton())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneAnimal
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

[zombie.vehicles.UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.SceneAnimal

All Implemented Interfaces:
:   `IAnimalVisual, IHumanVisual`

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.SceneAnimal
extends [UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html "class in zombie.vehicles")
implements [IAnimalVisual](../core/skinnedmodel/visual/IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) AnimalBreed`

  `breed`

  `(package private) AnimalDefinitions`

  `definition`

  `(package private) final ItemVisuals`

  `itemVisuals`

  `(package private) AnimalVisual`

  `visual`

  ### Fields inherited from class [UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html#field-summary "class in zombie.vehicles")

  `animatedModel, clearDepthBuffer, showBip01, showBones, useDeferredMovement`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SceneAnimal(UI3DScene scene,
  String id,
  AnimalDefinitions definition,
  AnimalBreed breed)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getAnimalSize()`

  `String`

  `getAnimalType()`

  `AnimalVisual`

  `getAnimalVisual()`

  `HumanVisual`

  `getHumanVisual()`

  `void`

  `getItemVisuals(ItemVisuals itemVisuals)`

  `(package private) void`

  `initAnimatedModel()`

  `boolean`

  `isFemale()`

  `boolean`

  `isSkeleton()`

  `boolean`

  `isZombie()`

  `(package private) void`

  `setAnimalDefinition(AnimalDefinitions definition,
  AnimalBreed breed)`

  ### Methods inherited from class [UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html#method-summary "class in zombie.vehicles")

  `getAttachmentTransform, getBoneAxis, getBoneMatrix, getLocalTransform, hitTestBone, pickBone, renderMain`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `clone, getGlobalTransform, initClone`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### visual

    [AnimalVisual](../core/skinnedmodel/visual/AnimalVisual.html "class in zombie.core.skinnedmodel.visual") visual
  + ### itemVisuals

    final [ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals
  + ### definition

    [AnimalDefinitions](../characters/animals/AnimalDefinitions.html "class in zombie.characters.animals") definition
  + ### breed

    [AnimalBreed](../characters/animals/datas/AnimalBreed.html "class in zombie.characters.animals.datas") breed
* Constructor Details
  -------------------

  + ### SceneAnimal

    SceneAnimal([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [AnimalDefinitions](../characters/animals/AnimalDefinitions.html "class in zombie.characters.animals") definition,
    [AnimalBreed](../characters/animals/datas/AnimalBreed.html "class in zombie.characters.animals.datas") breed)
* Method Details
  --------------

  + ### setAnimalDefinition

    void setAnimalDefinition([AnimalDefinitions](../characters/animals/AnimalDefinitions.html "class in zombie.characters.animals") definition,
    [AnimalBreed](../characters/animals/datas/AnimalBreed.html "class in zombie.characters.animals.datas") breed)
  + ### initAnimatedModel

    void initAnimatedModel()

    Specified by:
    :   `initAnimatedModel` in class `UI3DScene.SceneCharacter`
  + ### getAnimalVisual

    public [AnimalVisual](../core/skinnedmodel/visual/AnimalVisual.html "class in zombie.core.skinnedmodel.visual") getAnimalVisual()

    Specified by:
    :   `getAnimalVisual` in interface `IAnimalVisual`
  + ### getAnimalType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalType()

    Specified by:
    :   `getAnimalType` in interface `IAnimalVisual`
  + ### getAnimalSize

    public float getAnimalSize()

    Specified by:
    :   `getAnimalSize` in interface `IAnimalVisual`
  + ### getHumanVisual

    public [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") getHumanVisual()

    Specified by:
    :   `getHumanVisual` in interface `IHumanVisual`
  + ### getItemVisuals

    public void getItemVisuals([ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)

    Specified by:
    :   `getItemVisuals` in interface `IHumanVisual`
  + ### isFemale

    public boolean isFemale()

    Specified by:
    :   `isFemale` in interface `IHumanVisual`
  + ### isZombie

    public boolean isZombie()

    Specified by:
    :   `isZombie` in interface `IHumanVisual`
  + ### isSkeleton

    public boolean isSkeleton()

    Specified by:
    :   `isSkeleton` in interface `IHumanVisual`