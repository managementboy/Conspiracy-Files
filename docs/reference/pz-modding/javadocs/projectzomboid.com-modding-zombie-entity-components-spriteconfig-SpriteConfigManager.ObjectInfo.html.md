[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.spriteconfig](package-summary.html)
2. [SpriteConfigManager](SpriteConfigManager.html)
3. [ObjectInfo](SpriteConfigManager.ObjectInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [script](#script)
   2. [groupName](#groupName)
   3. [faces](#faces)
   4. [isSingleFace](#isSingleFace)
   5. [version](#version)
   6. [mainSpriteCache](#mainSpriteCache)
   7. [iconTexture](#iconTexture)
6. [Constructor Details](#constructor-detail)
   1. [ObjectInfo(SpriteConfigScript)](#%3Cinit%3E(zombie.scripting.entity.components.spriteconfig.SpriteConfigScript))
7. [Method Details](#method-detail)
   1. [getScript()](#getScript())
   2. [getRecipe()](#getRecipe())
   3. [getName()](#getName())
   4. [getVersion()](#getVersion())
   5. [setVersion(long)](#setVersion(long))
   6. [CreateFace(String, int, int, int)](#CreateFace(java.lang.String,int,int,int))
   7. [getMainSpriteNameUI()](#getMainSpriteNameUI())
   8. [isSingleFace()](#isSingleFace())
   9. [canRotate()](#canRotate())
   10. [getFace(String)](#getFace(java.lang.String))
   11. [getFace(int)](#getFace(int))
   12. [getFaceForSprite(String)](#getFaceForSprite(java.lang.String))
   13. [isProp()](#isProp())
   14. [getIconTexture()](#getIconTexture())
   15. [getTime()](#getTime())
   16. [needToBeLearn()](#needToBeLearn())
   17. [getTags()](#getTags())
   18. [getRequiredSkillCount()](#getRequiredSkillCount())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class SpriteConfigManager.ObjectInfo
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.spriteconfig.SpriteConfigManager.ObjectInfo

Enclosing class:
:   `SpriteConfigManager`

---

public static class SpriteConfigManager.ObjectInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final SpriteConfigManager.FaceInfo[]`

  `faces`

  `private final String`

  `groupName`

  `private final Texture`

  `iconTexture`

  `private boolean`

  `isSingleFace`

  `private String`

  `mainSpriteCache`

  `private final SpriteConfigScript`

  `script`

  `private long`

  `version`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ObjectInfo(SpriteConfigScript script)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canRotate()`

  `private SpriteConfigManager.FaceInfo`

  `CreateFace(String face,
  int width,
  int height,
  int zLayers)`

  `SpriteConfigManager.FaceInfo`

  `getFace(int faceID)`

  `SpriteConfigManager.FaceInfo`

  `getFace(String face)`

  `SpriteConfigManager.FaceInfo`

  `getFaceForSprite(String spriteName)`

  `Texture`

  `getIconTexture()`

  `String`

  `getMainSpriteNameUI()`

  `String`

  `getName()`

  `CraftRecipeComponentScript`

  `getRecipe()`

  `int`

  `getRequiredSkillCount()`

  `SpriteConfigScript`

  `getScript()`

  `List<String>`

  `getTags()`

  `int`

  `getTime()`

  `long`

  `getVersion()`

  `boolean`

  `isProp()`

  `boolean`

  `isSingleFace()`

  `boolean`

  `needToBeLearn()`

  `private void`

  `setVersion(long version)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### script

    private final [SpriteConfigScript](../../../scripting/entity/components/spriteconfig/SpriteConfigScript.html "class in zombie.scripting.entity.components.spriteconfig") script
  + ### groupName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") groupName
  + ### faces

    private final [SpriteConfigManager.FaceInfo](SpriteConfigManager.FaceInfo.html "class in zombie.entity.components.spriteconfig")[] faces
  + ### isSingleFace

    private boolean isSingleFace
  + ### version

    private long version
  + ### mainSpriteCache

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mainSpriteCache
  + ### iconTexture

    private final [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") iconTexture
* Constructor Details
  -------------------

  + ### ObjectInfo

    private ObjectInfo([SpriteConfigScript](../../../scripting/entity/components/spriteconfig/SpriteConfigScript.html "class in zombie.scripting.entity.components.spriteconfig") script)
* Method Details
  --------------

  + ### getScript

    public [SpriteConfigScript](../../../scripting/entity/components/spriteconfig/SpriteConfigScript.html "class in zombie.scripting.entity.components.spriteconfig") getScript()
  + ### getRecipe

    public [CraftRecipeComponentScript](../../../scripting/entity/components/crafting/CraftRecipeComponentScript.html "class in zombie.scripting.entity.components.crafting") getRecipe()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getVersion

    public long getVersion()
  + ### setVersion

    private void setVersion(long version)
  + ### CreateFace

    private [SpriteConfigManager.FaceInfo](SpriteConfigManager.FaceInfo.html "class in zombie.entity.components.spriteconfig") CreateFace([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") face,
    int width,
    int height,
    int zLayers)
  + ### getMainSpriteNameUI

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMainSpriteNameUI()
  + ### isSingleFace

    public boolean isSingleFace()
  + ### canRotate

    public boolean canRotate()
  + ### getFace

    public [SpriteConfigManager.FaceInfo](SpriteConfigManager.FaceInfo.html "class in zombie.entity.components.spriteconfig") getFace([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") face)
  + ### getFace

    public [SpriteConfigManager.FaceInfo](SpriteConfigManager.FaceInfo.html "class in zombie.entity.components.spriteconfig") getFace(int faceID)
  + ### getFaceForSprite

    public [SpriteConfigManager.FaceInfo](SpriteConfigManager.FaceInfo.html "class in zombie.entity.components.spriteconfig") getFaceForSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### isProp

    public boolean isProp()
  + ### getIconTexture

    public [Texture](../../../core/textures/Texture.html "class in zombie.core.textures") getIconTexture()
  + ### getTime

    public int getTime()
  + ### needToBeLearn

    public boolean needToBeLearn()
  + ### getTags

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTags()
  + ### getRequiredSkillCount

    public int getRequiredSkillCount()