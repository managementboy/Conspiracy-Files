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
3. [Mod](ChooseGameInfo.Mod.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [dir](#dir)
   2. [commonDir](#commonDir)
   3. [versionDir](#versionDir)
   4. [baseFile](#baseFile)
   5. [mediaFile](#mediaFile)
   6. [actionGroupsFile](#actionGroupsFile)
   7. [animSetsFile](#animSetsFile)
   8. [animsXFile](#animsXFile)
   9. [posters](#posters)
   10. [tex](#tex)
   11. [require](#require)
   12. [incompatible](#incompatible)
   13. [loadAfter](#loadAfter)
   14. [loadBefore](#loadBefore)
   15. [name](#name)
   16. [desc](#desc)
   17. [id](#id)
   18. [url](#url)
   19. [author](#author)
   20. [modVersion](#modVersion)
   21. [icon](#icon)
   22. [category](#category)
   23. [workshopId](#workshopId)
   24. [source](#source)
   25. [availableDone](#availableDone)
   26. [available](#available)
   27. [versionMin](#versionMin)
   28. [versionMax](#versionMax)
   29. [packs](#packs)
   30. [tileDefs](#tileDefs)
   31. [read](#read)
   32. [valid](#valid)
6. [Constructor Details](#constructor-detail)
   1. [Mod(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getTexture()](#getTexture())
   2. [setTexture(Texture)](#setTexture(zombie.core.textures.Texture))
   3. [getPosterCount()](#getPosterCount())
   4. [getPoster(int)](#getPoster(int))
   5. [getName()](#getName())
   6. [setName(String)](#setName(java.lang.String))
   7. [getDir()](#getDir())
   8. [getCommonDir()](#getCommonDir())
   9. [getVersionDir()](#getVersionDir())
   10. [getDescription()](#getDescription())
   11. [setDescription(String)](#setDescription(java.lang.String))
   12. [getRequire()](#getRequire())
   13. [setRequire(ArrayList)](#setRequire(java.util.ArrayList))
   14. [getIncompatible()](#getIncompatible())
   15. [setIncompatible(ArrayList)](#setIncompatible(java.util.ArrayList))
   16. [getLoadAfter()](#getLoadAfter())
   17. [setLoadAfter(ArrayList)](#setLoadAfter(java.util.ArrayList))
   18. [getLoadBefore()](#getLoadBefore())
   19. [setLoadBefore(ArrayList)](#setLoadBefore(java.util.ArrayList))
   20. [getId()](#getId())
   21. [setId(String)](#setId(java.lang.String))
   22. [isAvailable()](#isAvailable())
   23. [isAvailableSelf()](#isAvailableSelf())
   24. [isAvailableRequired(ArrayList)](#isAvailableRequired(java.util.ArrayList))
   25. [setAvailable(boolean)](#setAvailable(boolean))
   26. [getUrl()](#getUrl())
   27. [setUrl(String)](#setUrl(java.lang.String))
   28. [getAuthor()](#getAuthor())
   29. [setAuthor(String)](#setAuthor(java.lang.String))
   30. [getModVersion()](#getModVersion())
   31. [setModVersion(String)](#setModVersion(java.lang.String))
   32. [getIcon()](#getIcon())
   33. [setIcon(String)](#setIcon(java.lang.String))
   34. [getCategory()](#getCategory())
   35. [setCategory(String)](#setCategory(java.lang.String))
   36. [getVersionMin()](#getVersionMin())
   37. [getVersionMax()](#getVersionMax())
   38. [addPack(String, int)](#addPack(java.lang.String,int))
   39. [addTileDef(String, int)](#addTileDef(java.lang.String,int))
   40. [getPacks()](#getPacks())
   41. [getTileDefs()](#getTileDefs())
   42. [getSource()](#getSource())
   43. [getWorkshopID()](#getWorkshopID())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ChooseGameInfo.Mod
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.ChooseGameInfo.Mod

Enclosing class:
:   `ChooseGameInfo`

---

public static final class ChooseGameInfo.Mod
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final zombie.ZomboidFileSystem.PZModFolder`

  `actionGroupsFile`

  `final zombie.ZomboidFileSystem.PZModFolder`

  `animSetsFile`

  `final zombie.ZomboidFileSystem.PZModFolder`

  `animsXFile`

  `private String`

  `author`

  `private boolean`

  `available`

  `private boolean`

  `availableDone`

  `final zombie.ZomboidFileSystem.PZModFolder`

  `baseFile`

  `private String`

  `category`

  `String`

  `commonDir`

  `private String`

  `desc`

  `String`

  `dir`

  `private String`

  `icon`

  `private String`

  `id`

  `private ArrayList<String>`

  `incompatible`

  `private ArrayList<String>`

  `loadAfter`

  `private ArrayList<String>`

  `loadBefore`

  `final zombie.ZomboidFileSystem.PZModFolder`

  `mediaFile`

  `private String`

  `modVersion`

  `private String`

  `name`

  `private final ArrayList<ChooseGameInfo.PackFile>`

  `packs`

  `private final ArrayList<String>`

  `posters`

  `private boolean`

  `read`

  `private ArrayList<String>`

  `require`

  `private String`

  `source`

  `Texture`

  `tex`

  `private final ArrayList<ChooseGameInfo.TileDef>`

  `tileDefs`

  `private String`

  `url`

  `private boolean`

  `valid`

  `String`

  `versionDir`

  `private GameVersion`

  `versionMax`

  `private GameVersion`

  `versionMin`

  `private String`

  `workshopId`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Mod(String dir)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addPack(String name,
  int flags)`

  `void`

  `addTileDef(String name,
  int fileNumber)`

  `String`

  `getAuthor()`

  `String`

  `getCategory()`

  `String`

  `getCommonDir()`

  `String`

  `getDescription()`

  `String`

  `getDir()`

  `String`

  `getIcon()`

  `String`

  `getId()`

  `ArrayList<String>`

  `getIncompatible()`

  `ArrayList<String>`

  `getLoadAfter()`

  `ArrayList<String>`

  `getLoadBefore()`

  `String`

  `getModVersion()`

  `String`

  `getName()`

  `ArrayList<ChooseGameInfo.PackFile>`

  `getPacks()`

  `String`

  `getPoster(int index)`

  `int`

  `getPosterCount()`

  `ArrayList<String>`

  `getRequire()`

  `String`

  `getSource()`

  `Texture`

  `getTexture()`

  `ArrayList<ChooseGameInfo.TileDef>`

  `getTileDefs()`

  `String`

  `getUrl()`

  `String`

  `getVersionDir()`

  `GameVersion`

  `getVersionMax()`

  `GameVersion`

  `getVersionMin()`

  `String`

  `getWorkshopID()`

  `boolean`

  `isAvailable()`

  `private boolean`

  `isAvailableRequired(ArrayList<String> seen)`

  `boolean`

  `isAvailableSelf()`

  `void`

  `setAuthor(String author)`

  `void`

  `setAvailable(boolean available)`

  Deprecated.

  `void`

  `setCategory(String name)`

  `void`

  `setDescription(String desc)`

  `void`

  `setIcon(String name)`

  `void`

  `setId(String id)`

  `void`

  `setIncompatible(ArrayList<String> incompatible)`

  `void`

  `setLoadAfter(ArrayList<String> loadAfter)`

  `void`

  `setLoadBefore(ArrayList<String> loadBefore)`

  `void`

  `setModVersion(String version)`

  `void`

  `setName(String name)`

  `void`

  `setRequire(ArrayList<String> require)`

  `void`

  `setTexture(Texture tex)`

  `void`

  `setUrl(String url)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### dir

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dir
  + ### commonDir

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") commonDir
  + ### versionDir

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") versionDir
  + ### baseFile

    public final zombie.ZomboidFileSystem.PZModFolder baseFile
  + ### mediaFile

    public final zombie.ZomboidFileSystem.PZModFolder mediaFile
  + ### actionGroupsFile

    public final zombie.ZomboidFileSystem.PZModFolder actionGroupsFile
  + ### animSetsFile

    public final zombie.ZomboidFileSystem.PZModFolder animSetsFile
  + ### animsXFile

    public final zombie.ZomboidFileSystem.PZModFolder animsXFile
  + ### posters

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> posters
  + ### tex

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex
  + ### require

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> require
  + ### incompatible

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> incompatible
  + ### loadAfter

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadAfter
  + ### loadBefore

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadBefore
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### desc

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc
  + ### id

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### url

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") url
  + ### author

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author
  + ### modVersion

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modVersion
  + ### icon

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") icon
  + ### category

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category
  + ### workshopId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") workshopId
  + ### source

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") source
  + ### availableDone

    private boolean availableDone
  + ### available

    private boolean available
  + ### versionMin

    private [GameVersion](../core/GameVersion.html "class in zombie.core") versionMin
  + ### versionMax

    private [GameVersion](../core/GameVersion.html "class in zombie.core") versionMax
  + ### packs

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ChooseGameInfo.PackFile](ChooseGameInfo.PackFile.html "class in zombie.gameStates")> packs
  + ### tileDefs

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ChooseGameInfo.TileDef](ChooseGameInfo.TileDef.html "class in zombie.gameStates")> tileDefs
  + ### read

    private boolean read
  + ### valid

    private boolean valid
* Constructor Details
  -------------------

  + ### Mod

    public Mod([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") dir)
* Method Details
  --------------

  + ### getTexture

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### setTexture

    public void setTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex)
  + ### getPosterCount

    public int getPosterCount()
  + ### getPoster

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPoster(int index)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getDir

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDir()
  + ### getCommonDir

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCommonDir()
  + ### getVersionDir

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVersionDir()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### setDescription

    public void setDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") desc)
  + ### getRequire

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getRequire()
  + ### setRequire

    public void setRequire([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> require)
  + ### getIncompatible

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getIncompatible()
  + ### setIncompatible

    public void setIncompatible([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> incompatible)
  + ### getLoadAfter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLoadAfter()
  + ### setLoadAfter

    public void setLoadAfter([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadAfter)
  + ### getLoadBefore

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLoadBefore()
  + ### setLoadBefore

    public void setLoadBefore([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadBefore)
  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### setId

    public void setId([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### isAvailable

    public boolean isAvailable()
  + ### isAvailableSelf

    public boolean isAvailableSelf()
  + ### isAvailableRequired

    private boolean isAvailableRequired([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> seen)
  + ### setAvailable

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setAvailable(boolean available)

    Deprecated.
  + ### getUrl

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUrl()
  + ### setUrl

    public void setUrl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") url)
  + ### getAuthor

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAuthor()
  + ### setAuthor

    public void setAuthor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author)
  + ### getModVersion

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModVersion()
  + ### setModVersion

    public void setModVersion([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") version)
  + ### getIcon

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIcon()
  + ### setIcon

    public void setIcon([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()
  + ### setCategory

    public void setCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getVersionMin

    public [GameVersion](../core/GameVersion.html "class in zombie.core") getVersionMin()
  + ### getVersionMax

    public [GameVersion](../core/GameVersion.html "class in zombie.core") getVersionMax()
  + ### addPack

    public void addPack([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int flags)
  + ### addTileDef

    public void addTileDef([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int fileNumber)
  + ### getPacks

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ChooseGameInfo.PackFile](ChooseGameInfo.PackFile.html "class in zombie.gameStates")> getPacks()
  + ### getTileDefs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ChooseGameInfo.TileDef](ChooseGameInfo.TileDef.html "class in zombie.gameStates")> getTileDefs()
  + ### getSource

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSource()
  + ### getWorkshopID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorkshopID()