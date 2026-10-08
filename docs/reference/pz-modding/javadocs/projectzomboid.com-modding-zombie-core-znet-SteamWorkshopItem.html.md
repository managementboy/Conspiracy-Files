[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.znet](package-summary.html)
2. [SteamWorkshopItem](SteamWorkshopItem.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [workshopFolder](#workshopFolder)
   2. [publishedFileId](#publishedFileId)
   3. [title](#title)
   4. [description](#description)
   5. [visibility](#visibility)
   6. [tags](#tags)
   7. [changeNote](#changeNote)
   8. [hasMod](#hasMod)
   9. [hasMap](#hasMap)
   10. [modIds](#modIds)
   11. [mapFolders](#mapFolders)
   12. [VERSION1](#VERSION1)
   13. [LATEST\_VERSION](#LATEST_VERSION)
7. [Constructor Details](#constructor-detail)
   1. [SteamWorkshopItem(String)](#%3Cinit%3E(java.lang.String))
8. [Method Details](#method-detail)
   1. [getContentFolder()](#getContentFolder())
   2. [getFolderName()](#getFolderName())
   3. [setID(String)](#setID(java.lang.String))
   4. [getID()](#getID())
   5. [setTitle(String)](#setTitle(java.lang.String))
   6. [getTitle()](#getTitle())
   7. [setDescription(String)](#setDescription(java.lang.String))
   8. [getDescription()](#getDescription())
   9. [setVisibility(String)](#setVisibility(java.lang.String))
   10. [getVisibility()](#getVisibility())
   11. [setVisibilityInteger(int)](#setVisibilityInteger(int))
   12. [getVisibilityInteger()](#getVisibilityInteger())
   13. [setTags(ArrayList)](#setTags(java.util.ArrayList))
   14. [getAllowedTags()](#getAllowedTags())
   15. [getTags()](#getTags())
   16. [getSubmitDescription()](#getSubmitDescription())
   17. [getSubmitTags()](#getSubmitTags())
   18. [getPreviewImage()](#getPreviewImage())
   19. [setChangeNote(String)](#setChangeNote(java.lang.String))
   20. [getChangeNote()](#getChangeNote())
   21. [create()](#create())
   22. [submitUpdate()](#submitUpdate())
   23. [getUpdateProgress(KahluaTable)](#getUpdateProgress(se.krka.kahlua.vm.KahluaTable))
   24. [getUpdateProgressTotal()](#getUpdateProgressTotal())
   25. [validateFileTypes(Path)](#validateFileTypes(java.nio.file.Path))
   26. [validateModDotInfo(Path)](#validateModDotInfo(java.nio.file.Path))
   27. [validateMapDotInfo(Path)](#validateMapDotInfo(java.nio.file.Path))
   28. [validateMapFolder(Path)](#validateMapFolder(java.nio.file.Path))
   29. [validateMapsFolder(Path)](#validateMapsFolder(java.nio.file.Path))
   30. [validateMediaFolder(Path)](#validateMediaFolder(java.nio.file.Path))
   31. [validateModFolder(Path)](#validateModFolder(java.nio.file.Path))
   32. [validateModsFolder(Path)](#validateModsFolder(java.nio.file.Path))
   33. [validateBuildingsFolder(Path)](#validateBuildingsFolder(java.nio.file.Path))
   34. [validateCreativeFolder(Path)](#validateCreativeFolder(java.nio.file.Path))
   35. [validatePreviewImage(Path)](#validatePreviewImage(java.nio.file.Path))
   36. [validateContents()](#validateContents())
   37. [getExtendedErrorInfo(String)](#getExtendedErrorInfo(java.lang.String))
   38. [readWorkshopTxt()](#readWorkshopTxt())
   39. [writeWorkshopTxt()](#writeWorkshopTxt())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SteamWorkshopItem
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.znet.SteamWorkshopItem

---

public class SteamWorkshopItem
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `SteamWorkshopItem.ItemState`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `changeNote`

  `private String`

  `description`

  `private boolean`

  `hasMap`

  `private boolean`

  `hasMod`

  `private static final int`

  `LATEST_VERSION`

  `private final ArrayList<String>`

  `mapFolders`

  `private final ArrayList<String>`

  `modIds`

  `private String`

  `publishedFileId`

  `private final ArrayList<String>`

  `tags`

  `private String`

  `title`

  `private static final int`

  `VERSION1`

  `private String`

  `visibility`

  `private final String`

  `workshopFolder`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SteamWorkshopItem(String workshopFolder)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `create()`

  `static ArrayList<String>`

  `getAllowedTags()`

  `String`

  `getChangeNote()`

  `String`

  `getContentFolder()`

  `String`

  `getDescription()`

  `String`

  `getExtendedErrorInfo(String error)`

  `String`

  `getFolderName()`

  `String`

  `getID()`

  `String`

  `getPreviewImage()`

  `String`

  `getSubmitDescription()`

  `String[]`

  `getSubmitTags()`

  `ArrayList<String>`

  `getTags()`

  `String`

  `getTitle()`

  `boolean`

  `getUpdateProgress(se.krka.kahlua.vm.KahluaTable table)`

  `int`

  `getUpdateProgressTotal()`

  `String`

  `getVisibility()`

  `int`

  `getVisibilityInteger()`

  `boolean`

  `readWorkshopTxt()`

  `void`

  `setChangeNote(String changeNote)`

  `void`

  `setDescription(String description)`

  `void`

  `setID(String id)`

  `void`

  `setTags(ArrayList<String> tags)`

  `void`

  `setTitle(String title)`

  `void`

  `setVisibility(String visibility)`

  `void`

  `setVisibilityInteger(int v)`

  `boolean`

  `submitUpdate()`

  `private String`

  `validateBuildingsFolder(Path dir)`

  `String`

  `validateContents()`

  `private String`

  `validateCreativeFolder(Path dir)`

  `private String`

  `validateFileTypes(Path dir)`

  `private String`

  `validateMapDotInfo(Path path)`

  `private String`

  `validateMapFolder(Path dir)`

  `private String`

  `validateMapsFolder(Path dir)`

  `private String`

  `validateMediaFolder(Path dir)`

  `private String`

  `validateModDotInfo(Path path)`

  `private String`

  `validateModFolder(Path dir)`

  `private String`

  `validateModsFolder(Path dir)`

  `String`

  `validatePreviewImage(Path path)`

  `boolean`

  `writeWorkshopTxt()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### workshopFolder

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") workshopFolder
  + ### publishedFileId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") publishedFileId
  + ### title

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### description

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### visibility

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") visibility
  + ### tags

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tags
  + ### changeNote

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") changeNote
  + ### hasMod

    private boolean hasMod
  + ### hasMap

    private boolean hasMap
  + ### modIds

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> modIds
  + ### mapFolders

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> mapFolders
  + ### VERSION1

    private static final int VERSION1

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.znet.SteamWorkshopItem.VERSION1)
  + ### LATEST\_VERSION

    private static final int LATEST\_VERSION

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.znet.SteamWorkshopItem.LATEST_VERSION)
* Constructor Details
  -------------------

  + ### SteamWorkshopItem

    public SteamWorkshopItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") workshopFolder)
* Method Details
  --------------

  + ### getContentFolder

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContentFolder()
  + ### getFolderName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFolderName()
  + ### setID

    public void setID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getID()
  + ### setTitle

    public void setTitle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### setDescription

    public void setDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description)
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### setVisibility

    public void setVisibility([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") visibility)
  + ### getVisibility

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVisibility()
  + ### setVisibilityInteger

    public void setVisibilityInteger(int v)
  + ### getVisibilityInteger

    public int getVisibilityInteger()
  + ### setTags

    public void setTags([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tags)
  + ### getAllowedTags

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllowedTags()
  + ### getTags

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTags()
  + ### getSubmitDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSubmitDescription()
  + ### getSubmitTags

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] getSubmitTags()
  + ### getPreviewImage

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPreviewImage()
  + ### setChangeNote

    public void setChangeNote([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") changeNote)
  + ### getChangeNote

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getChangeNote()
  + ### create

    public boolean create()
  + ### submitUpdate

    public boolean submitUpdate()
  + ### getUpdateProgress

    public boolean getUpdateProgress(se.krka.kahlua.vm.KahluaTable table)
  + ### getUpdateProgressTotal

    public int getUpdateProgressTotal()
  + ### validateFileTypes

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateFileTypes([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") dir)
  + ### validateModDotInfo

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateModDotInfo([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") path)
  + ### validateMapDotInfo

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateMapDotInfo([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") path)
  + ### validateMapFolder

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateMapFolder([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") dir)
  + ### validateMapsFolder

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateMapsFolder([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") dir)
  + ### validateMediaFolder

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateMediaFolder([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") dir)
  + ### validateModFolder

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateModFolder([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") dir)
  + ### validateModsFolder

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateModsFolder([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") dir)
  + ### validateBuildingsFolder

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateBuildingsFolder([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") dir)
  + ### validateCreativeFolder

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateCreativeFolder([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") dir)
  + ### validatePreviewImage

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validatePreviewImage([Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") path)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### validateContents

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateContents()
  + ### getExtendedErrorInfo

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getExtendedErrorInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") error)
  + ### readWorkshopTxt

    public boolean readWorkshopTxt()
  + ### writeWorkshopTxt

    public boolean writeWorkshopTxt()