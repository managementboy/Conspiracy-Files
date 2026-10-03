[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [CraftRecipeComponentScript](CraftRecipeComponentScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [craftRecipe](#craftRecipe)
6. [Constructor Details](#constructor-detail)
   1. [CraftRecipeComponentScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))
   2. [PreReload()](#PreReload())
   3. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   4. [OnLoadedAfterLua()](#OnLoadedAfterLua())
   5. [OnPostWorldDictionaryInit()](#OnPostWorldDictionaryInit())
   6. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))
   7. [getCraftRecipe()](#getCraftRecipe())
   8. [getIconTexture()](#getIconTexture())
   9. [getTranslationName()](#getTranslationName())
   10. [getBuildCategory()](#getBuildCategory())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeComponentScript
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.crafting.CraftRecipeComponentScript

---

public class CraftRecipeComponentScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private CraftRecipe`

  `craftRecipe`

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

  `CraftRecipeComponentScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `copyFrom(ComponentScript other)`

  `String`

  `getBuildCategory()`

  `CraftRecipe`

  `getCraftRecipe()`

  `Texture`

  `getIconTexture()`

  `private String`

  `getTranslationName()`

  `protected void`

  `load(zombie.scripting.ScriptParser.Block block)`

  `void`

  `OnLoadedAfterLua()`

  `void`

  `OnPostWorldDictionaryInit()`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `void`

  `PreReload()`

  ### Methods inherited from class [ComponentScript](../../ComponentScript.html#method-summary "class in zombie.scripting.entity")

  `getName, isoMasterOnly, parseKeyValue`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### craftRecipe

    private [CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") craftRecipe
* Constructor Details
  -------------------

  + ### CraftRecipeComponentScript

    private CraftRecipeComponentScript()
* Method Details
  --------------

  + ### copyFrom

    protected void copyFrom([ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity") other)

    Specified by:
    :   `copyFrom` in class `ComponentScript`
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
  + ### load

    protected void load(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `load` in class `ComponentScript`

    Throws:
    :   `Exception`
  + ### getCraftRecipe

    public [CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getCraftRecipe()
  + ### getIconTexture

    public [Texture](../../../../core/textures/Texture.html "class in zombie.core.textures") getIconTexture()
  + ### getTranslationName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationName()
  + ### getBuildCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBuildCategory()