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
3. [CharacterRenderData](UI3DScene.CharacterRenderData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [drawer](#drawer)
   2. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [CharacterRenderData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initCharacter(UI3DScene.SceneCharacter)](#initCharacter(zombie.vehicles.UI3DScene.SceneCharacter))
   2. [release()](#release())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.CharacterRenderData
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.CharacterRenderData

Enclosing class:
:   `UI3DScene`

---

private static class UI3DScene.CharacterRenderData
extends [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final UI3DScene.CharacterDrawer`

  `drawer`

  `private static final zombie.popman.ObjectPool<UI3DScene.CharacterRenderData>`

  `s_pool`

  ### Fields inherited from class [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html#field-summary "class in zombie.vehicles")

  `object, transform`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CharacterRenderData()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) UI3DScene.SceneObjectRenderData`

  `initCharacter(UI3DScene.SceneCharacter sceneObject)`

  `(package private) void`

  `release()`

  ### Methods inherited from class [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html#method-summary "class in zombie.vehicles")

  `init`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### drawer

    final [UI3DScene.CharacterDrawer](UI3DScene.CharacterDrawer.html "class in zombie.vehicles") drawer
  + ### s\_pool

    private static final zombie.popman.ObjectPool<[UI3DScene.CharacterRenderData](UI3DScene.CharacterRenderData.html "class in zombie.vehicles")> s\_pool
* Constructor Details
  -------------------

  + ### CharacterRenderData

    private CharacterRenderData()
* Method Details
  --------------

  + ### initCharacter

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") initCharacter([UI3DScene.SceneCharacter](UI3DScene.SceneCharacter.html "class in zombie.vehicles") sceneObject)
  + ### release

    void release()

    Overrides:
    :   `release` in class `UI3DScene.SceneObjectRenderData`