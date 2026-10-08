[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [MannequinScript](MannequinScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [female](#female)
   3. [modelScriptName](#modelScriptName)
   4. [texture](#texture)
   5. [animSet](#animSet)
   6. [animState](#animState)
   7. [pose](#pose)
   8. [outfit](#outfit)
6. [Constructor Details](#constructor-detail)
   1. [MannequinScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [isFemale()](#isFemale())
   3. [setFemale(boolean)](#setFemale(boolean))
   4. [getModelScriptName()](#getModelScriptName())
   5. [setModelScriptName(String)](#setModelScriptName(java.lang.String))
   6. [getTexture()](#getTexture())
   7. [setTexture(String)](#setTexture(java.lang.String))
   8. [getAnimSet()](#getAnimSet())
   9. [setAnimSet(String)](#setAnimSet(java.lang.String))
   10. [getAnimState()](#getAnimState())
   11. [setAnimState(String)](#setAnimState(java.lang.String))
   12. [getPose()](#getPose())
   13. [setPose(String)](#setPose(java.lang.String))
   14. [getOutfit()](#getOutfit())
   15. [setOutfit(String)](#setOutfit(java.lang.String))
   16. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   17. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class MannequinScript
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.MannequinScript

---

public final class MannequinScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `animSet`

  `private String`

  `animState`

  `private boolean`

  `female`

  `private String`

  `modelScriptName`

  `private String`

  `name`

  `private String`

  `outfit`

  `private String`

  `pose`

  `private String`

  `texture`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MannequinScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getAnimSet()`

  `String`

  `getAnimState()`

  `String`

  `getModelScriptName()`

  `String`

  `getName()`

  `String`

  `getOutfit()`

  `String`

  `getPose()`

  `String`

  `getTexture()`

  `boolean`

  `isFemale()`

  `void`

  `Load(String name,
  String totalFile)`

  `void`

  `reset()`

  `void`

  `setAnimSet(String str)`

  `void`

  `setAnimState(String str)`

  `void`

  `setFemale(boolean b)`

  `void`

  `setModelScriptName(String str)`

  `void`

  `setOutfit(String str)`

  `void`

  `setPose(String str)`

  `void`

  `setTexture(String str)`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### female

    private boolean female
  + ### modelScriptName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modelScriptName
  + ### texture

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texture
  + ### animSet

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animSet
  + ### animState

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animState
  + ### pose

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pose
  + ### outfit

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit
* Constructor Details
  -------------------

  + ### MannequinScript

    public MannequinScript()
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### isFemale

    public boolean isFemale()
  + ### setFemale

    public void setFemale(boolean b)
  + ### getModelScriptName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModelScriptName()
  + ### setModelScriptName

    public void setModelScriptName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTexture()
  + ### setTexture

    public void setTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getAnimSet

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimSet()
  + ### setAnimSet

    public void setAnimSet([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getAnimState

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimState()
  + ### setAnimState

    public void setAnimState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getPose

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPose()
  + ### setPose

    public void setPose([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getOutfit

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOutfit()
  + ### setOutfit

    public void setOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `BaseScriptObject`