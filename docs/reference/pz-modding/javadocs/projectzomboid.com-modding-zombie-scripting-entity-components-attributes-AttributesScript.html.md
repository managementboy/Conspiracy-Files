[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.attributes](package-summary.html)
2. [AttributesScript](AttributesScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [kvPairs](#kvPairs)
   2. [container](#container)
   3. [hasCreatedContainer](#hasCreatedContainer)
6. [Constructor Details](#constructor-detail)
   1. [AttributesScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [PreReload()](#PreReload())
   2. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   3. [createTemplateContainer()](#createTemplateContainer())
   4. [getTemplateContainer()](#getTemplateContainer())
   5. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))
   6. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))
   7. [parseKeyValue(String, String)](#parseKeyValue(java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class AttributesScript
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.attributes.AttributesScript

---

public class AttributesScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private AttributeContainer`

  `container`

  `private boolean`

  `hasCreatedContainer`

  `private final HashMap<String,String>`

  `kvPairs`

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

  `AttributesScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `copyFrom(ComponentScript componentScript)`

  `private void`

  `createTemplateContainer()`

  `AttributeContainer`

  `getTemplateContainer()`

  `protected void`

  `load(zombie.scripting.ScriptParser.Block block)`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `protected boolean`

  `parseKeyValue(String k,
  String v)`

  `void`

  `PreReload()`

  ### Methods inherited from class [ComponentScript](../../ComponentScript.html#method-summary "class in zombie.scripting.entity")

  `getName, isoMasterOnly`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### kvPairs

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> kvPairs
  + ### container

    private [AttributeContainer](../../../../entity/components/attributes/AttributeContainer.html "class in zombie.entity.components.attributes") container
  + ### hasCreatedContainer

    private boolean hasCreatedContainer
* Constructor Details
  -------------------

  + ### AttributesScript

    private AttributesScript()
* Method Details
  --------------

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
  + ### createTemplateContainer

    private void createTemplateContainer()
  + ### getTemplateContainer

    public [AttributeContainer](../../../../entity/components/attributes/AttributeContainer.html "class in zombie.entity.components.attributes") getTemplateContainer()
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
  + ### parseKeyValue

    protected boolean parseKeyValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") k,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") v)

    Overrides:
    :   `parseKeyValue` in class `ComponentScript`