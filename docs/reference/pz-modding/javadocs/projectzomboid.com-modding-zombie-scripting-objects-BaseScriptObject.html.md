[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [BaseScriptObject](BaseScriptObject.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [loadedScriptBodies](#loadedScriptBodies)
   2. [linesCache](#linesCache)
   3. [scriptObjectType](#scriptObjectType)
   4. [module](#module)
   5. [scriptObjectName](#scriptObjectName)
   6. [parentScript](#parentScript)
   7. [fullTypeCache](#fullTypeCache)
   8. [fullTypeDirty](#fullTypeDirty)
   9. [scriptVersion](#scriptVersion)
   10. [enabled](#enabled)
   11. [debugOnly](#debugOnly)
6. [Constructor Details](#constructor-detail)
   1. [BaseScriptObject(ScriptType)](#%3Cinit%3E(zombie.scripting.ScriptType))
7. [Method Details](#method-detail)
   1. [debugString()](#debugString())
   2. [getVersion(IVersionHash)](#getVersion(zombie.world.scripts.IVersionHash))
   3. [getScriptVersion()](#getScriptVersion())
   4. [calculateScriptVersion()](#calculateScriptVersion())
   5. [getModule()](#getModule())
   6. [setModule(ScriptModule)](#setModule(zombie.scripting.objects.ScriptModule))
   7. [isEnabled()](#isEnabled())
   8. [isDebugOnly()](#isDebugOnly())
   9. [setParent(BaseScriptObject)](#setParent(zombie.scripting.objects.BaseScriptObject))
   10. [getParent()](#getParent())
   11. [getScriptObjectType()](#getScriptObjectType())
   12. [getScriptObjectName()](#getScriptObjectName())
   13. [getScriptObjectFullType()](#getScriptObjectFullType())
   14. [resetLoadedScriptBodies()](#resetLoadedScriptBodies())
   15. [addLoadedScriptBody(String, String)](#addLoadedScriptBody(java.lang.String,java.lang.String))
   16. [getLoadedScriptBodies()](#getLoadedScriptBodies())
   17. [getLoadedScriptBodyCount()](#getLoadedScriptBodyCount())
   18. [getObsolete()](#getObsolete())
   19. [InitLoadPP(String)](#InitLoadPP(java.lang.String))
   20. [LoadCommonBlock(String)](#LoadCommonBlock(java.lang.String))
   21. [LoadCommonBlock(ScriptParser.Block)](#LoadCommonBlock(zombie.scripting.ScriptParser.Block))
   22. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   23. [PreReload()](#PreReload())
   24. [reset()](#reset())
   25. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   26. [OnLoadedAfterLua()](#OnLoadedAfterLua())
   27. [OnPostWorldDictionaryInit()](#OnPostWorldDictionaryInit())
   28. [getScriptLines()](#getScriptLines())
   29. [getAllScriptLines(ArrayList)](#getAllScriptLines(java.util.ArrayList))
   30. [getBodyScriptLines(int, ArrayList)](#getBodyScriptLines(int,java.util.ArrayList))
   31. [LoadVector3(String, Vector3)](#LoadVector3(java.lang.String,zombie.iso.Vector3))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class BaseScriptObject
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.BaseScriptObject

Direct Known Subclasses:
:   `AnimationsMesh, ComponentScript, CraftRecipe, EnergyDefinitionScript, EvolvedRecipe, Fixing, FluidDefinitionScript, FluidFilterScript, GameEntityScript, GameEntityTemplate, GameSoundScript, ItemConfig, ItemFilterScript, MannequinScript, ModelScript, PhysicsShapeScript, Recipe, RuntimeAnimationScript, SoundTimelineScript, SpriteModel, StringListScript, TimedActionScript, UniqueRecipe, VehicleEngineRPM, VehicleScript, VehicleTemplate, XuiColorsScript, XuiConfigScript, XuiLayoutScript, XuiSkinScript`

---

public abstract class BaseScriptObject
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected boolean`

  `debugOnly`

  `protected boolean`

  `enabled`

  `private String`

  `fullTypeCache`

  `private boolean`

  `fullTypeDirty`

  `private ArrayList<String>`

  `linesCache`

  `private final ArrayList<String>`

  `loadedScriptBodies`

  `private ScriptModule`

  `module`

  `private BaseScriptObject`

  `parentScript`

  `private String`

  `scriptObjectName`

  `private final ScriptType`

  `scriptObjectType`

  `private long`

  `scriptVersion`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `BaseScriptObject(ScriptType type)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `final void`

  `addLoadedScriptBody(String modId,
  String body)`

  `void`

  `calculateScriptVersion()`

  `final String`

  `debugString()`

  `final ArrayList<String>`

  `getAllScriptLines(ArrayList<String> list)`

  `final ArrayList<String>`

  `getBodyScriptLines(int bodyIndex,
  ArrayList<String> list)`

  `final ArrayList<String>`

  `getLoadedScriptBodies()`

  `final int`

  `getLoadedScriptBodyCount()`

  `ScriptModule`

  `getModule()`

  `boolean`

  `getObsolete()`

  `final BaseScriptObject`

  `getParent()`

  `ArrayList<String>`

  `getScriptLines()`

  `final String`

  `getScriptObjectFullType()`

  `final String`

  `getScriptObjectName()`

  `final ScriptType`

  `getScriptObjectType()`

  `long`

  `getScriptVersion()`

  `void`

  `getVersion(zombie.world.scripts.IVersionHash hash)`

  Deprecated.

  `void`

  `InitLoadPP(String name)`

  `final boolean`

  `isDebugOnly()`

  `final boolean`

  `isEnabled()`

  `void`

  `Load(String name,
  String body)`

  `final void`

  `LoadCommonBlock(String body)`

  `final void`

  `LoadCommonBlock(zombie.scripting.ScriptParser.Block block)`

  `protected void`

  `LoadVector3(String s,
  Vector3 v)`

  `void`

  `OnLoadedAfterLua()`

  `void`

  `OnPostWorldDictionaryInit()`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `void`

  `PreReload()`

  `void`

  `reset()`

  `final void`

  `resetLoadedScriptBodies()`

  `void`

  `setModule(ScriptModule module)`

  `final void`

  `setParent(BaseScriptObject parent)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### loadedScriptBodies

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadedScriptBodies
  + ### linesCache

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> linesCache
  + ### scriptObjectType

    private final [ScriptType](../ScriptType.html "enum class in zombie.scripting") scriptObjectType
  + ### module

    private [ScriptModule](ScriptModule.html "class in zombie.scripting.objects") module
  + ### scriptObjectName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptObjectName
  + ### parentScript

    private [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects") parentScript
  + ### fullTypeCache

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullTypeCache
  + ### fullTypeDirty

    private boolean fullTypeDirty
  + ### scriptVersion

    private long scriptVersion
  + ### enabled

    protected boolean enabled
  + ### debugOnly

    protected boolean debugOnly
* Constructor Details
  -------------------

  + ### BaseScriptObject

    protected BaseScriptObject([ScriptType](../ScriptType.html "enum class in zombie.scripting") type)
* Method Details
  --------------

  + ### debugString

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") debugString()
  + ### getVersion

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void getVersion(zombie.world.scripts.IVersionHash hash)

    Deprecated.
  + ### getScriptVersion

    public long getScriptVersion()
  + ### calculateScriptVersion

    public void calculateScriptVersion()
  + ### getModule

    public [ScriptModule](ScriptModule.html "class in zombie.scripting.objects") getModule()
  + ### setModule

    public void setModule([ScriptModule](ScriptModule.html "class in zombie.scripting.objects") module)
  + ### isEnabled

    public final boolean isEnabled()
  + ### isDebugOnly

    public final boolean isDebugOnly()
  + ### setParent

    public final void setParent([BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects") parent)
  + ### getParent

    public final [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects") getParent()
  + ### getScriptObjectType

    public final [ScriptType](../ScriptType.html "enum class in zombie.scripting") getScriptObjectType()
  + ### getScriptObjectName

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getScriptObjectName()
  + ### getScriptObjectFullType

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getScriptObjectFullType()
  + ### resetLoadedScriptBodies

    public final void resetLoadedScriptBodies()
  + ### addLoadedScriptBody

    public final void addLoadedScriptBody([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") body)
  + ### getLoadedScriptBodies

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLoadedScriptBodies()
  + ### getLoadedScriptBodyCount

    public final int getLoadedScriptBodyCount()
  + ### getObsolete

    public boolean getObsolete()
  + ### InitLoadPP

    public void InitLoadPP([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### LoadCommonBlock

    public final void LoadCommonBlock([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") body)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadCommonBlock

    public final void LoadCommonBlock(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") body)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### PreReload

    public void PreReload()
  + ### reset

    public void reset()
  + ### OnScriptsLoaded

    public void OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### OnLoadedAfterLua

    public void OnLoadedAfterLua()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### OnPostWorldDictionaryInit

    public void OnPostWorldDictionaryInit()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getScriptLines

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getScriptLines()
  + ### getAllScriptLines

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getAllScriptLines([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list)
  + ### getBodyScriptLines

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getBodyScriptLines(int bodyIndex,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list)
  + ### LoadVector3

    protected void LoadVector3([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    [Vector3](../../iso/Vector3.html "class in zombie.iso") v)