[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [EnergyDefinitionScript](EnergyDefinitionScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [defaultIconTexture](#defaultIconTexture)
   2. [defaultHorizontalBarTexture](#defaultHorizontalBarTexture)
   3. [defaultVerticalBarTexture](#defaultVerticalBarTexture)
   4. [existsAsVanilla](#existsAsVanilla)
   5. [modId](#modId)
   6. [energyType](#energyType)
   7. [energyTypeString](#energyTypeString)
   8. [displayName](#displayName)
   9. [color](#color)
   10. [iconTextureName](#iconTextureName)
   11. [horizontalBarTextureName](#horizontalBarTextureName)
   12. [verticalBarTextureName](#verticalBarTextureName)
   13. [iconTexture](#iconTexture)
   14. [horizontalBarTexture](#horizontalBarTexture)
   15. [verticalBarTexture](#verticalBarTexture)
6. [Constructor Details](#constructor-detail)
   1. [EnergyDefinitionScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getDefaultIconTexture()](#getDefaultIconTexture())
   2. [getDefaultHorizontalBarTexture()](#getDefaultHorizontalBarTexture())
   3. [getDefaultVerticalBarTexture()](#getDefaultVerticalBarTexture())
   4. [getExistsAsVanilla()](#getExistsAsVanilla())
   5. [isVanilla()](#isVanilla())
   6. [getModID()](#getModID())
   7. [getEnergyType()](#getEnergyType())
   8. [getEnergyTypeString()](#getEnergyTypeString())
   9. [getDisplayName()](#getDisplayName())
   10. [getColor()](#getColor())
   11. [getIconTexture()](#getIconTexture())
   12. [getHorizontalBarTexture()](#getHorizontalBarTexture())
   13. [getVerticalBarTexture()](#getVerticalBarTexture())
   14. [PreReload()](#PreReload())
   15. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   16. [InitLoadPP(String)](#InitLoadPP(java.lang.String))
   17. [Load(String, String)](#Load(java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class EnergyDefinitionScript
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.EnergyDefinitionScript

---

public class EnergyDefinitionScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Color`

  `color`

  `private static Texture`

  `defaultHorizontalBarTexture`

  `private static Texture`

  `defaultIconTexture`

  `private static Texture`

  `defaultVerticalBarTexture`

  `private String`

  `displayName`

  `private EnergyType`

  `energyType`

  `private String`

  `energyTypeString`

  `private boolean`

  `existsAsVanilla`

  `private Texture`

  `horizontalBarTexture`

  `private String`

  `horizontalBarTextureName`

  `private Texture`

  `iconTexture`

  `private String`

  `iconTextureName`

  `private String`

  `modId`

  `private Texture`

  `verticalBarTexture`

  `private String`

  `verticalBarTextureName`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `EnergyDefinitionScript()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Color`

  `getColor()`

  `static Texture`

  `getDefaultHorizontalBarTexture()`

  `static Texture`

  `getDefaultIconTexture()`

  `static Texture`

  `getDefaultVerticalBarTexture()`

  `String`

  `getDisplayName()`

  `EnergyType`

  `getEnergyType()`

  `String`

  `getEnergyTypeString()`

  `boolean`

  `getExistsAsVanilla()`

  `Texture`

  `getHorizontalBarTexture()`

  `Texture`

  `getIconTexture()`

  `String`

  `getModID()`

  `Texture`

  `getVerticalBarTexture()`

  `void`

  `InitLoadPP(String name)`

  `boolean`

  `isVanilla()`

  `void`

  `Load(String name,
  String body)`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `void`

  `PreReload()`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### defaultIconTexture

    private static [Texture](../../core/textures/Texture.html "class in zombie.core.textures") defaultIconTexture
  + ### defaultHorizontalBarTexture

    private static [Texture](../../core/textures/Texture.html "class in zombie.core.textures") defaultHorizontalBarTexture
  + ### defaultVerticalBarTexture

    private static [Texture](../../core/textures/Texture.html "class in zombie.core.textures") defaultVerticalBarTexture
  + ### existsAsVanilla

    private boolean existsAsVanilla
  + ### modId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modId
  + ### energyType

    private [EnergyType](../../entity/energy/EnergyType.html "enum class in zombie.entity.energy") energyType
  + ### energyTypeString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") energyTypeString
  + ### displayName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### color

    private final [Color](../../core/Color.html "class in zombie.core") color
  + ### iconTextureName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") iconTextureName
  + ### horizontalBarTextureName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") horizontalBarTextureName
  + ### verticalBarTextureName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") verticalBarTextureName
  + ### iconTexture

    private [Texture](../../core/textures/Texture.html "class in zombie.core.textures") iconTexture
  + ### horizontalBarTexture

    private [Texture](../../core/textures/Texture.html "class in zombie.core.textures") horizontalBarTexture
  + ### verticalBarTexture

    private [Texture](../../core/textures/Texture.html "class in zombie.core.textures") verticalBarTexture
* Constructor Details
  -------------------

  + ### EnergyDefinitionScript

    protected EnergyDefinitionScript()
* Method Details
  --------------

  + ### getDefaultIconTexture

    public static [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getDefaultIconTexture()
  + ### getDefaultHorizontalBarTexture

    public static [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getDefaultHorizontalBarTexture()
  + ### getDefaultVerticalBarTexture

    public static [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getDefaultVerticalBarTexture()
  + ### getExistsAsVanilla

    public boolean getExistsAsVanilla()
  + ### isVanilla

    public boolean isVanilla()
  + ### getModID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModID()
  + ### getEnergyType

    public [EnergyType](../../entity/energy/EnergyType.html "enum class in zombie.entity.energy") getEnergyType()
  + ### getEnergyTypeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEnergyTypeString()
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### getColor

    public [Color](../../core/Color.html "class in zombie.core") getColor()
  + ### getIconTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getIconTexture()
  + ### getHorizontalBarTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getHorizontalBarTexture()
  + ### getVerticalBarTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getVerticalBarTexture()
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