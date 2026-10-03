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
3. [CharacterDrawer](UI3DScene.CharacterDrawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [character](#character)
   2. [renderData](#renderData)
   3. [rendered](#rendered)
6. [Constructor Details](#constructor-detail)
   1. [CharacterDrawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(UI3DScene.SceneCharacter, UI3DScene.CharacterRenderData)](#init(zombie.vehicles.UI3DScene.SceneCharacter,zombie.vehicles.UI3DScene.CharacterRenderData))
   2. [render()](#render())
   3. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.CharacterDrawer
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.vehicles.UI3DScene.CharacterDrawer

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.CharacterDrawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) UI3DScene.SceneCharacter`

  `character`

  `(package private) UI3DScene.CharacterRenderData`

  `renderData`

  `(package private) boolean`

  `rendered`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CharacterDrawer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `init(UI3DScene.SceneCharacter character,
  UI3DScene.CharacterRenderData renderData)`

  `void`

  `postRender()`

  `void`

  `render()`

  ### Methods inherited from class zombie.core.textures.TextureDraw.GenericDrawer

  `render`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### character

    [UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html "class in zombie.vehicles") character
  + ### renderData

    [UI3DScene.CharacterRenderData](UI3DScene.CharacterRenderData.html "class in zombie.vehicles") renderData
  + ### rendered

    boolean rendered
* Constructor Details
  -------------------

  + ### CharacterDrawer

    private CharacterDrawer()
* Method Details
  --------------

  + ### init

    public void init([UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html "class in zombie.vehicles") character,
    [UI3DScene.CharacterRenderData](UI3DScene.CharacterRenderData.html "class in zombie.vehicles") renderData)
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`