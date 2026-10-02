[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.visual](package-summary.html)
2. [AnimalVisual](AnimalVisual.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [owner](#owner)
   2. [skinTextureName](#skinTextureName)
   3. [animalRotStage](#animalRotStage)
6. [Constructor Details](#constructor-detail)
   1. [AnimalVisual(IAnimalVisual)](#%3Cinit%3E(zombie.core.skinnedmodel.visual.IAnimalVisual))
7. [Method Details](#method-detail)
   1. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   2. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   3. [getModel()](#getModel())
   4. [getModelTest(IsoAnimal)](#getModelTest(zombie.characters.animals.IsoAnimal))
   5. [getModelScript()](#getModelScript())
   6. [dressInNamedOutfit(String, ItemVisuals)](#dressInNamedOutfit(java.lang.String,zombie.core.skinnedmodel.visual.ItemVisuals))
   7. [getAnimalType()](#getAnimalType())
   8. [getAnimalSize()](#getAnimalSize())
   9. [getIsoAnimal()](#getIsoAnimal())
   10. [getSkinTexture()](#getSkinTexture())
   11. [setSkinTextureName(String)](#setSkinTextureName(java.lang.String))
   12. [isSkeleton()](#isSkeleton())
   13. [clear()](#clear())
   14. [copyFrom(BaseVisual)](#copyFrom(zombie.core.skinnedmodel.visual.BaseVisual))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AnimalVisual
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.visual.BaseVisual

zombie.core.skinnedmodel.visual.AnimalVisual

---

public class AnimalVisual
extends zombie.core.skinnedmodel.visual.BaseVisual

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `animalRotStage`

  `private final IAnimalVisual`

  `owner`

  `private String`

  `skinTextureName`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalVisual(IAnimalVisual owner)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `clear()`

  `void`

  `copyFrom(zombie.core.skinnedmodel.visual.BaseVisual baseVisual)`

  `void`

  `dressInNamedOutfit(String outfitName,
  ItemVisuals itemVisuals)`

  `float`

  `getAnimalSize()`

  `String`

  `getAnimalType()`

  `IsoAnimal`

  `getIsoAnimal()`

  `zombie.core.skinnedmodel.model.Model`

  `getModel()`

  `ModelScript`

  `getModelScript()`

  `zombie.core.skinnedmodel.model.Model`

  `getModelTest(IsoAnimal animal)`

  `String`

  `getSkinTexture()`

  `boolean`

  `isSkeleton()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setSkinTextureName(String textureName)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### owner

    private final [IAnimalVisual](IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual") owner
  + ### skinTextureName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") skinTextureName
  + ### animalRotStage

    public int animalRotStage
* Constructor Details
  -------------------

  + ### AnimalVisual

    public AnimalVisual([IAnimalVisual](IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual") owner)
* Method Details
  --------------

  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `save` in class `zombie.core.skinnedmodel.visual.BaseVisual`

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `load` in class `zombie.core.skinnedmodel.visual.BaseVisual`

    Throws:
    :   `IOException`
  + ### getModel

    public zombie.core.skinnedmodel.model.Model getModel()

    Specified by:
    :   `getModel` in class `zombie.core.skinnedmodel.visual.BaseVisual`
  + ### getModelTest

    public zombie.core.skinnedmodel.model.Model getModelTest([IsoAnimal](../../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### getModelScript

    public [ModelScript](../../../scripting/objects/ModelScript.html "class in zombie.scripting.objects") getModelScript()

    Specified by:
    :   `getModelScript` in class `zombie.core.skinnedmodel.visual.BaseVisual`
  + ### dressInNamedOutfit

    public void dressInNamedOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName,
    [ItemVisuals](ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)

    Specified by:
    :   `dressInNamedOutfit` in class `zombie.core.skinnedmodel.visual.BaseVisual`
  + ### getAnimalType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimalType()
  + ### getAnimalSize

    public float getAnimalSize()
  + ### getIsoAnimal

    public [IsoAnimal](../../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") getIsoAnimal()
  + ### getSkinTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSkinTexture()
  + ### setSkinTextureName

    public void setSkinTextureName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName)
  + ### isSkeleton

    public boolean isSkeleton()
  + ### clear

    public void clear()

    Specified by:
    :   `clear` in class `zombie.core.skinnedmodel.visual.BaseVisual`
  + ### copyFrom

    public void copyFrom(zombie.core.skinnedmodel.visual.BaseVisual baseVisual)

    Specified by:
    :   `copyFrom` in class `zombie.core.skinnedmodel.visual.BaseVisual`