[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [ChooseGameInfo](ChooseGameInfo.html)
3. [Map](ChooseGameInfo.Map.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [dir](#dir)
   2. [thumb](#thumb)
   3. [worldmap](#worldmap)
   4. [spawnSelectImagePyramid](#spawnSelectImagePyramid)
   5. [title](#title)
   6. [lotsDir](#lotsDir)
   7. [zoomX](#zoomX)
   8. [zoomY](#zoomY)
   9. [zoomS](#zoomS)
   10. [demoVideo](#demoVideo)
   11. [onlyForGameMode](#onlyForGameMode)
   12. [desc](#desc)
   13. [fixed2x](#fixed2x)
6. [Constructor Details](#constructor-detail)
   1. [Map()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getDirectory()](#getDirectory())
   2. [setDirectory(String)](#setDirectory(java.lang.String))
   3. [getThumbnail()](#getThumbnail())
   4. [setThumbnail(Texture)](#setThumbnail(zombie.core.textures.Texture))
   5. [getWorldmap()](#getWorldmap())
   6. [setWorldmap(Texture)](#setWorldmap(zombie.core.textures.Texture))
   7. [getSpawnSelectImagePyramid()](#getSpawnSelectImagePyramid())
   8. [getTitle()](#getTitle())
   9. [setTitle(String)](#setTitle(java.lang.String))
   10. [getLotDirectories()](#getLotDirectories())
   11. [getZoomX()](#getZoomX())
   12. [setZoomX(float)](#setZoomX(float))
   13. [getZoomY()](#getZoomY())
   14. [setZoomY(float)](#setZoomY(float))
   15. [getZoomS()](#getZoomS())
   16. [setZoomS(float)](#setZoomS(float))
   17. [getDemoVideo()](#getDemoVideo())
   18. [setDemoVideo(String)](#setDemoVideo(java.lang.String))
   19. [getDescription()](#getDescription())
   20. [setDescription(String)](#setDescription(java.lang.String))
   21. [isFixed2x()](#isFixed2x())
   22. [setFixed2x(boolean)](#setFixed2x(boolean))
   23. [getOnlyForGameMode()](#getOnlyForGameMode())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ChooseGameInfo.Map
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.ChooseGameInfo.Map

Enclosing class:
:   `ChooseGameInfo`

---

public static final class ChooseGameInfo.Map
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `demoVideo`

  `private String`

  `desc`

  `private String`

  `dir`

  `private boolean`

  `fixed2x`

  `private ArrayList<String>`

  `lotsDir`

  `private GameMode`

  `onlyForGameMode`

  `private String`

  `spawnSelectImagePyramid`

  `private Texture`

  `thumb`

  `private String`

  `title`

  `private Texture`

  `worldmap`

  `private float`

  `zoomS`

  `private float`

  `zoomX`

  `private float`

  `zoomY`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Map()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getDemoVideo()`

  `String`

  `getDescription()`

  `String`

  `getDirectory()`

  `ArrayList<String>`

  `getLotDirectories()`

  `GameMode`

  `getOnlyForGameMode()`

  `String`

  `getSpawnSelectImagePyramid()`

  `Texture`

  `getThumbnail()`

  `String`

  `getTitle()`

  `Texture`

  `getWorldmap()`

  `float`

  `getZoomS()`

  `float`

  `getZoomX()`

  `float`

  `getZoomY()`

  `boolean`

  `isFixed2x()`

  `void`

  `setDemoVideo(String video)`

  `void`

  `setDescription(String desc)`

  `void`

  `setDirectory(String dir)`

  `void`

  `setFixed2x(boolean fixed)`

  `void`

  `setThumbnail(Texture thumb)`

  `void`

  `setTitle(String title)`

  `void`

  `setWorldmap(Texture worldmap)`

  `void`

  `setZoomS(float newS)`

  `void`

  `setZoomX(float newX)`

  `void`

  `setZoomY(float newY)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### dir

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dir
  + ### thumb

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") thumb
  + ### worldmap

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") worldmap
  + ### spawnSelectImagePyramid

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spawnSelectImagePyramid
  + ### title

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### lotsDir

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> lotsDir
  + ### zoomX

    private float zoomX
  + ### zoomY

    private float zoomY
  + ### zoomS

    private float zoomS
  + ### demoVideo

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") demoVideo
  + ### onlyForGameMode

    private [GameMode](../core/GameMode.html "class in zombie.core") onlyForGameMode
  + ### desc

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc
  + ### fixed2x

    private boolean fixed2x
* Constructor Details
  -------------------

  + ### Map

    public Map()
* Method Details
  --------------

  + ### getDirectory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDirectory()
  + ### setDirectory

    public void setDirectory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dir)
  + ### getThumbnail

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getThumbnail()
  + ### setThumbnail

    public void setThumbnail([Texture](../core/textures/Texture.html "class in zombie.core.textures") thumb)
  + ### getWorldmap

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getWorldmap()
  + ### setWorldmap

    public void setWorldmap([Texture](../core/textures/Texture.html "class in zombie.core.textures") worldmap)
  + ### getSpawnSelectImagePyramid

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSpawnSelectImagePyramid()
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### setTitle

    public void setTitle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### getLotDirectories

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLotDirectories()
  + ### getZoomX

    public float getZoomX()
  + ### setZoomX

    public void setZoomX(float newX)
  + ### getZoomY

    public float getZoomY()
  + ### setZoomY

    public void setZoomY(float newY)
  + ### getZoomS

    public float getZoomS()
  + ### setZoomS

    public void setZoomS(float newS)
  + ### getDemoVideo

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDemoVideo()
  + ### setDemoVideo

    public void setDemoVideo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") video)
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### setDescription

    public void setDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc)
  + ### isFixed2x

    public boolean isFixed2x()
  + ### setFixed2x

    public void setFixed2x(boolean fixed)
  + ### getOnlyForGameMode

    public [GameMode](../core/GameMode.html "class in zombie.core") getOnlyForGameMode()