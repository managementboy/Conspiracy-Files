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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [faces](#faces)
   2. [isSingleFace](#isSingleFace)
   3. [isMultiTile](#isMultiTile)
   4. [isValid](#isValid)
   5. [isProp](#isProp)
   6. [allTileNames](#allTileNames)
   7. [cornerSprite](#cornerSprite)
   8. [health](#health)
   9. [skillBaseHealth](#skillBaseHealth)
   10. [isThumpable](#isThumpable)
   11. [lightRadius](#lightRadius)
   12. [lightsourceItem](#lightsourceItem)
   13. [lightsourceFuel](#lightsourceFuel)
   14. [debugItem](#debugItem)
   15. [lightsourceTagItem](#lightsourceTagItem)
   16. [fuel](#fuel)
   17. [breakSound](#breakSound)
   18. [dontNeedFrame](#dontNeedFrame)
   19. [needWindowFrame](#needWindowFrame)
   20. [isPole](#isPole)
   21. [previousStage](#previousStage)
   22. [bonusHealth](#bonusHealth)
   23. [onCreate](#onCreate)
   24. [onIsValid](#onIsValid)
   25. [timedActionOnIsValid](#timedActionOnIsValid)
   26. [needToBeAgainstWall](#needToBeAgainstWall)
   27. [canBePadlocked](#canBePadlocked)
7. [Constructor Details](#constructor-detail)
   1. [SpriteConfigScript()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getFace(int)](#getFace(int))
   2. [getCornerSprite()](#getCornerSprite())
   3. [getAllTileNames()](#getAllTileNames())
   4. [isSingleFace()](#isSingleFace())
   5. [isMultiTile()](#isMultiTile())
   6. [isValid()](#isValid())
   7. [isProp()](#isProp())
   8. [getHealth()](#getHealth())
   9. [getSkillBaseHealth()](#getSkillBaseHealth())
   10. [getIsThumpable()](#getIsThumpable())
   11. [getCanBePadlocked()](#getCanBePadlocked())
   12. [getBreakSound()](#getBreakSound())
   13. [getDontNeedFrame()](#getDontNeedFrame())
   14. [getLightRadius()](#getLightRadius())
   15. [getLightsourceItem()](#getLightsourceItem())
   16. [getLightsourceFuel()](#getLightsourceFuel())
   17. [getDebugItem()](#getDebugItem())
   18. [getLightsourceTagItem()](#getLightsourceTagItem())
   19. [getPreviousStages()](#getPreviousStages())
   20. [getBonusHealth()](#getBonusHealth())
   21. [getOnCreate()](#getOnCreate())
   22. [getOnIsValid()](#getOnIsValid())
   23. [getTimedActionOnIsValid()](#getTimedActionOnIsValid())
   24. [isoMasterOnly()](#isoMasterOnly())
   25. [getVersion(IVersionHash)](#getVersion(zombie.world.scripts.IVersionHash))
   26. [PreReload()](#PreReload())
   27. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   28. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))
   29. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))
   30. [warnOrError(String)](#warnOrError(java.lang.String))
   31. [checkScripts()](#checkScripts())
   32. [loadFace(SpriteConfigScript.FaceScript, ScriptParser.Block)](#loadFace(zombie.scripting.entity.components.spriteconfig.SpriteConfigScript.FaceScript,zombie.scripting.ScriptParser.Block))
   33. [loadLayer(SpriteConfigScript.ZLayer, ScriptParser.Block)](#loadLayer(zombie.scripting.entity.components.spriteconfig.SpriteConfigScript.ZLayer,zombie.scripting.ScriptParser.Block))
   34. [getNeedWindowFrame()](#getNeedWindowFrame())
   35. [getNeedToBeAgainstWall()](#getNeedToBeAgainstWall())
   36. [isPole()](#isPole())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class SpriteConfigScript
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.spriteconfig.SpriteConfigScript

---

public class SpriteConfigScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `SpriteConfigScript.FaceScript`

  `static class`

  `SpriteConfigScript.TileScript`

  `static class`

  `SpriteConfigScript.XRow`

  `static class`

  `SpriteConfigScript.ZLayer`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<String>`

  `allTileNames`

  `private int`

  `bonusHealth`

  `private String`

  `breakSound`

  `private boolean`

  `canBePadlocked`

  `private String`

  `cornerSprite`

  `private String`

  `debugItem`

  `private boolean`

  `dontNeedFrame`

  `private final SpriteConfigScript.FaceScript[]`

  `faces`

  `private final String`

  `fuel`

  `private int`

  `health`

  `private boolean`

  `isMultiTile`

  `private boolean`

  `isPole`

  `private boolean`

  `isProp`

  `private boolean`

  `isSingleFace`

  `private boolean`

  `isThumpable`

  `private boolean`

  `isValid`

  `private int`

  `lightRadius`

  `private String`

  `lightsourceFuel`

  `private String`

  `lightsourceItem`

  `private ArrayList<String>`

  `lightsourceTagItem`

  `private boolean`

  `needToBeAgainstWall`

  `private boolean`

  `needWindowFrame`

  `private String`

  `onCreate`

  `private String`

  `onIsValid`

  `private final ArrayList<String>`

  `previousStage`

  `private int`

  `skillBaseHealth`

  `private String`

  `timedActionOnIsValid`

  ### Fields inherited from class [ComponentScript](../../ComponentScript.html#field-summary "class in zombie.scripting.entity")

  `type`

  ### Fields inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SpriteConfigScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `checkScripts()`

  `protected void`

  `copyFrom(ComponentScript componentScript)`

  `ArrayList<String>`

  `getAllTileNames()`

  `int`

  `getBonusHealth()`

  `String`

  `getBreakSound()`

  `boolean`

  `getCanBePadlocked()`

  `String`

  `getCornerSprite()`

  `String`

  `getDebugItem()`

  `boolean`

  `getDontNeedFrame()`

  `SpriteConfigScript.FaceScript`

  `getFace(int id)`

  `int`

  `getHealth()`

  `boolean`

  `getIsThumpable()`

  `int`

  `getLightRadius()`

  `String`

  `getLightsourceFuel()`

  `String`

  `getLightsourceItem()`

  `ArrayList<String>`

  `getLightsourceTagItem()`

  `boolean`

  `getNeedToBeAgainstWall()`

  `boolean`

  `getNeedWindowFrame()`

  `String`

  `getOnCreate()`

  `String`

  `getOnIsValid()`

  `ArrayList<String>`

  `getPreviousStages()`

  `int`

  `getSkillBaseHealth()`

  `String`

  `getTimedActionOnIsValid()`

  `void`

  `getVersion(zombie.world.scripts.IVersionHash hash)`

  `boolean`

  `isMultiTile()`

  `boolean`

  `isoMasterOnly()`

  This should be TRUE for almost all components, with only few exceptions.

  `boolean`

  `isPole()`

  `boolean`

  `isProp()`

  `boolean`

  `isSingleFace()`

  `boolean`

  `isValid()`

  `protected void`

  `load(zombie.scripting.ScriptParser.Block block)`

  `private void`

  `loadFace(SpriteConfigScript.FaceScript faceScript,
  zombie.scripting.ScriptParser.Block block)`

  `private void`

  `loadLayer(SpriteConfigScript.ZLayer layer,
  zombie.scripting.ScriptParser.Block block)`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `void`

  `PreReload()`

  `private void`

  `warnOrError(String msg)`

  Tiles

  ### Methods inherited from class [ComponentScript](../../ComponentScript.html#method-summary "class in zombie.scripting.entity")

  `getName, parseKeyValue`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### faces

    private final [SpriteConfigScript.FaceScript](SpriteConfigScript.FaceScript.html "class in zombie.scripting.entity.components.spriteconfig")[] faces
  + ### isSingleFace

    private boolean isSingleFace
  + ### isMultiTile

    private boolean isMultiTile
  + ### isValid

    private boolean isValid
  + ### isProp

    private boolean isProp
  + ### allTileNames

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> allTileNames
  + ### cornerSprite

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cornerSprite
  + ### health

    private int health
  + ### skillBaseHealth

    private int skillBaseHealth
  + ### isThumpable

    private boolean isThumpable
  + ### lightRadius

    private int lightRadius
  + ### lightsourceItem

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lightsourceItem
  + ### lightsourceFuel

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lightsourceFuel
  + ### debugItem

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") debugItem
  + ### lightsourceTagItem

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> lightsourceTagItem
  + ### fuel

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fuel
  + ### breakSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") breakSound
  + ### dontNeedFrame

    private boolean dontNeedFrame
  + ### needWindowFrame

    private boolean needWindowFrame
  + ### isPole

    private boolean isPole
  + ### previousStage

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> previousStage
  + ### bonusHealth

    private int bonusHealth
  + ### onCreate

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onCreate
  + ### onIsValid

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onIsValid
  + ### timedActionOnIsValid

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") timedActionOnIsValid
  + ### needToBeAgainstWall

    private boolean needToBeAgainstWall
  + ### canBePadlocked

    private boolean canBePadlocked
* Constructor Details
  -------------------

  + ### SpriteConfigScript

    private SpriteConfigScript()
* Method Details
  --------------

  + ### getFace

    public [SpriteConfigScript.FaceScript](SpriteConfigScript.FaceScript.html "class in zombie.scripting.entity.components.spriteconfig") getFace(int id)
  + ### getCornerSprite

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCornerSprite()
  + ### getAllTileNames

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllTileNames()
  + ### isSingleFace

    public boolean isSingleFace()
  + ### isMultiTile

    public boolean isMultiTile()
  + ### isValid

    public boolean isValid()
  + ### isProp

    public boolean isProp()
  + ### getHealth

    public int getHealth()
  + ### getSkillBaseHealth

    public int getSkillBaseHealth()
  + ### getIsThumpable

    public boolean getIsThumpable()
  + ### getCanBePadlocked

    public boolean getCanBePadlocked()
  + ### getBreakSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBreakSound()
  + ### getDontNeedFrame

    public boolean getDontNeedFrame()
  + ### getLightRadius

    public int getLightRadius()
  + ### getLightsourceItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLightsourceItem()
  + ### getLightsourceFuel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLightsourceFuel()
  + ### getDebugItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDebugItem()
  + ### getLightsourceTagItem

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLightsourceTagItem()
  + ### getPreviousStages

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getPreviousStages()
  + ### getBonusHealth

    public int getBonusHealth()
  + ### getOnCreate

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnCreate()
  + ### getOnIsValid

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnIsValid()
  + ### getTimedActionOnIsValid

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTimedActionOnIsValid()
  + ### isoMasterOnly

    public boolean isoMasterOnly()

    Description copied from class: `ComponentScript`

    This should be TRUE for almost all components, with only few exceptions.
    For the exceptions its important they are non-meta components like SpriteConfig.
    This due to only the master object of multi-tile entities being stored in meta.

    Overrides:
    :   `isoMasterOnly` in class `ComponentScript`
  + ### getVersion

    public void getVersion(zombie.world.scripts.IVersionHash hash)

    Overrides:
    :   `getVersion` in class `BaseScriptObject`
  + ### PreReload

    public void PreReload()

    Overrides:
    :   `PreReload` in class `BaseScriptObject`
  + ### OnScriptsLoaded

    public void OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `OnScriptsLoaded` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### copyFrom

    protected void copyFrom([ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity") componentScript)

    Specified by:
    :   `copyFrom` in class `ComponentScript`
  + ### load

    protected void load(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `load` in class `ComponentScript`

    Throws:
    :   `Exception`
  + ### warnOrError

    private void warnOrError([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)

    Tiles
  + ### checkScripts

    private void checkScripts()
  + ### loadFace

    private void loadFace([SpriteConfigScript.FaceScript](SpriteConfigScript.FaceScript.html "class in zombie.scripting.entity.components.spriteconfig") faceScript,
    zombie.scripting.ScriptParser.Block block)
  + ### loadLayer

    private void loadLayer([SpriteConfigScript.ZLayer](SpriteConfigScript.ZLayer.html "class in zombie.scripting.entity.components.spriteconfig") layer,
    zombie.scripting.ScriptParser.Block block)
  + ### getNeedWindowFrame

    public boolean getNeedWindowFrame()
  + ### getNeedToBeAgainstWall

    public boolean getNeedToBeAgainstWall()
  + ### isPole

    public boolean isPole()