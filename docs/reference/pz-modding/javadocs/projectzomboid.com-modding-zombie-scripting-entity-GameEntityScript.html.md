[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.entity](package-summary.html)
2. [GameEntityScript](GameEntityScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [componentScripts](#componentScripts)
   3. [registryId](#registryId)
   4. [existsAsVanilla](#existsAsVanilla)
   5. [modId](#modId)
   6. [fileAbsPath](#fileAbsPath)
6. [Constructor Details](#constructor-detail)
   1. [GameEntityScript()](#%3Cinit%3E())
   2. [GameEntityScript(ScriptType)](#%3Cinit%3E(zombie.scripting.ScriptType))
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getDisplayNameDebug()](#getDisplayNameDebug())
   3. [getModuleName()](#getModuleName())
   4. [getFullName()](#getFullName())
   5. [PreReload()](#PreReload())
   6. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   7. [OnLoadedAfterLua()](#OnLoadedAfterLua())
   8. [OnPostWorldDictionaryInit()](#OnPostWorldDictionaryInit())
   9. [getComponentScripts()](#getComponentScripts())
   10. [hasComponents()](#hasComponents())
   11. [containsComponent(ComponentType)](#containsComponent(zombie.entity.ComponentType))
   12. [getOrCreateComponentScript(ComponentType)](#getOrCreateComponentScript(zombie.entity.ComponentType))
   13. [getComponentScriptFor(ComponentType)](#getComponentScriptFor(zombie.entity.ComponentType))
   14. [getComponentScript(ComponentType)](#getComponentScript(zombie.entity.ComponentType))
   15. [copyFrom(GameEntityScript)](#copyFrom(zombie.scripting.entity.GameEntityScript))
   16. [InitLoadPP(String)](#InitLoadPP(java.lang.String))
   17. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   18. [Load(ScriptParser.Block)](#Load(zombie.scripting.ScriptParser.Block))
   19. [LoadAttribute(String, String)](#LoadAttribute(java.lang.String,java.lang.String))
   20. [LoadComponentBlock(ScriptParser.Block)](#LoadComponentBlock(zombie.scripting.ScriptParser.Block))
   21. [getRegistry\_id()](#getRegistry_id())
   22. [setRegistry\_id(short)](#setRegistry_id(short))
   23. [getModID()](#getModID())
   24. [getExistsAsVanilla()](#getExistsAsVanilla())
   25. [getFileAbsPath()](#getFileAbsPath())
   26. [setModID(String)](#setModID(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class GameEntityScript
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../objects/BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.entity.GameEntityScript

Direct Known Subclasses:
:   `Item`

---

public class GameEntityScript
extends [BaseScriptObject](../objects/BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<ComponentScript>`

  `componentScripts`

  `private boolean`

  `existsAsVanilla`

  `private String`

  `fileAbsPath`

  `private String`

  `modId`

  `private String`

  `name`

  `private short`

  `registryId`

  ### Fields inherited from class [BaseScriptObject](../objects/BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `GameEntityScript()`

  `protected`

  `GameEntityScript(ScriptType override)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `containsComponent(ComponentType componentType)`

  `void`

  `copyFrom(GameEntityScript other)`

  `private ComponentScript`

  `getComponentScript(ComponentType componentType)`

  `<T extends ComponentScript>  
  T`

  `getComponentScriptFor(ComponentType componentType)`

  `ArrayList<ComponentScript>`

  `getComponentScripts()`

  `String`

  `getDisplayNameDebug()`

  `boolean`

  `getExistsAsVanilla()`

  `String`

  `getFileAbsPath()`

  `String`

  `getFullName()`

  `String`

  `getModID()`

  `String`

  `getModuleName()`

  `String`

  `getName()`

  `private ComponentScript`

  `getOrCreateComponentScript(ComponentType componentType)`

  `short`

  `getRegistry_id()`

  `boolean`

  `hasComponents()`

  `void`

  `InitLoadPP(String name)`

  `void`

  `Load(String name,
  String body)`

  `protected void`

  `Load(zombie.scripting.ScriptParser.Block block)`

  `boolean`

  `LoadAttribute(String k,
  String v)`

  `void`

  `LoadComponentBlock(zombie.scripting.ScriptParser.Block block)`

  `void`

  `OnLoadedAfterLua()`

  `void`

  `OnPostWorldDictionaryInit()`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `void`

  `PreReload()`

  `void`

  `setModID(String modid)`

  `void`

  `setRegistry_id(short id)`

  ### Methods inherited from class [BaseScriptObject](../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### componentScripts

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ComponentScript](ComponentScript.html "class in zombie.scripting.entity")> componentScripts
  + ### registryId

    private short registryId
  + ### existsAsVanilla

    private boolean existsAsVanilla
  + ### modId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId
  + ### fileAbsPath

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileAbsPath
* Constructor Details
  -------------------

  + ### GameEntityScript

    public GameEntityScript()
  + ### GameEntityScript

    protected GameEntityScript([ScriptType](../ScriptType.html "enum class in zombie.scripting") override)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getDisplayNameDebug

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayNameDebug()
  + ### getModuleName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModuleName()
  + ### getFullName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullName()
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
  + ### OnLoadedAfterLua

    public void OnLoadedAfterLua()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `OnLoadedAfterLua` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### OnPostWorldDictionaryInit

    public void OnPostWorldDictionaryInit()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `OnPostWorldDictionaryInit` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### getComponentScripts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ComponentScript](ComponentScript.html "class in zombie.scripting.entity")> getComponentScripts()
  + ### hasComponents

    public boolean hasComponents()
  + ### containsComponent

    public boolean containsComponent([ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") componentType)
  + ### getOrCreateComponentScript

    private [ComponentScript](ComponentScript.html "class in zombie.scripting.entity") getOrCreateComponentScript([ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") componentType)
  + ### getComponentScriptFor

    public <T extends [ComponentScript](ComponentScript.html "class in zombie.scripting.entity")> T getComponentScriptFor([ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") componentType)
  + ### getComponentScript

    private [ComponentScript](ComponentScript.html "class in zombie.scripting.entity") getComponentScript([ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") componentType)
  + ### copyFrom

    public void copyFrom([GameEntityScript](GameEntityScript.html "class in zombie.scripting.entity") other)
  + ### InitLoadPP

    public void InitLoadPP([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Overrides:
    :   `InitLoadPP` in class `BaseScriptObject`
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") body)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### Load

    protected void Load(zombie.scripting.ScriptParser.Block block)
  + ### LoadAttribute

    public boolean LoadAttribute([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") k,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") v)
  + ### LoadComponentBlock

    public void LoadComponentBlock(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getRegistry\_id

    public short getRegistry\_id()
  + ### setRegistry\_id

    public void setRegistry\_id(short id)
  + ### getModID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModID()
  + ### getExistsAsVanilla

    public boolean getExistsAsVanilla()
  + ### getFileAbsPath

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFileAbsPath()
  + ### setModID

    public void setModID([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modid)