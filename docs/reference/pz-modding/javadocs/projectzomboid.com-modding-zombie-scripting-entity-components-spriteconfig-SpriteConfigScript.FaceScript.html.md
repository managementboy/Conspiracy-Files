[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.spriteconfig](package-summary.html)
2. [SpriteConfigScript](SpriteConfigScript.html)
3. [FaceScript](SpriteConfigScript.FaceScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [faceName](#faceName)
   2. [faceId](#faceId)
   3. [totalWidth](#totalWidth)
   4. [totalHeight](#totalHeight)
   5. [lightsourceOffsetX](#lightsourceOffsetX)
   6. [lightsourceOffsetY](#lightsourceOffsetY)
   7. [lightsourceOffsetZ](#lightsourceOffsetZ)
   8. [layers](#layers)
6. [Constructor Details](#constructor-detail)
   1. [FaceScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getFaceName()](#getFaceName())
   2. [getTotalWidth()](#getTotalWidth())
   3. [getTotalHeight()](#getTotalHeight())
   4. [getZLayers()](#getZLayers())
   5. [getLayer(int)](#getLayer(int))
   6. [getLightsourceOffsetX()](#getLightsourceOffsetX())
   7. [getLightsourceOffsetY()](#getLightsourceOffsetY())
   8. [getLightsourceOffsetZ()](#getLightsourceOffsetZ())
   9. [getVersion(IVersionHash)](#getVersion(zombie.world.scripts.IVersionHash))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class SpriteConfigScript.FaceScript
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.entity.components.spriteconfig.SpriteConfigScript.FaceScript

Enclosing class:
:   `SpriteConfigScript`

---

public static class SpriteConfigScript.FaceScript
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `faceId`

  `private String`

  `faceName`

  `private final ArrayList<SpriteConfigScript.ZLayer>`

  `layers`

  `private int`

  `lightsourceOffsetX`

  `private int`

  `lightsourceOffsetY`

  `private int`

  `lightsourceOffsetZ`

  `private int`

  `totalHeight`

  `private int`

  `totalWidth`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FaceScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getFaceName()`

  `SpriteConfigScript.ZLayer`

  `getLayer(int z)`

  `int`

  `getLightsourceOffsetX()`

  `int`

  `getLightsourceOffsetY()`

  `int`

  `getLightsourceOffsetZ()`

  `int`

  `getTotalHeight()`

  `int`

  `getTotalWidth()`

  `private void`

  `getVersion(zombie.world.scripts.IVersionHash hash)`

  `int`

  `getZLayers()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### faceName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") faceName
  + ### faceId

    private int faceId
  + ### totalWidth

    private int totalWidth
  + ### totalHeight

    private int totalHeight
  + ### lightsourceOffsetX

    private int lightsourceOffsetX
  + ### lightsourceOffsetY

    private int lightsourceOffsetY
  + ### lightsourceOffsetZ

    private int lightsourceOffsetZ
  + ### layers

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SpriteConfigScript.ZLayer](SpriteConfigScript.ZLayer.html "class in zombie.scripting.entity.components.spriteconfig")> layers
* Constructor Details
  -------------------

  + ### FaceScript

    public FaceScript()
* Method Details
  --------------

  + ### getFaceName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFaceName()
  + ### getTotalWidth

    public int getTotalWidth()
  + ### getTotalHeight

    public int getTotalHeight()
  + ### getZLayers

    public int getZLayers()
  + ### getLayer

    public [SpriteConfigScript.ZLayer](SpriteConfigScript.ZLayer.html "class in zombie.scripting.entity.components.spriteconfig") getLayer(int z)
  + ### getLightsourceOffsetX

    public int getLightsourceOffsetX()
  + ### getLightsourceOffsetY

    public int getLightsourceOffsetY()
  + ### getLightsourceOffsetZ

    public int getLightsourceOffsetZ()
  + ### getVersion

    private void getVersion(zombie.world.scripts.IVersionHash hash)