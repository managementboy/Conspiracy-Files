[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [ItemFilterScript](ItemFilterScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [whitelist](#whitelist)
   2. [blacklist](#blacklist)
   3. [hasParsed](#hasParsed)
   4. [name](#name)
   5. [tempScriptItems](#tempScriptItems)
7. [Constructor Details](#constructor-detail)
   1. [ItemFilterScript()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [PreReload()](#PreReload())
   3. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   4. [OnLoadedAfterLua()](#OnLoadedAfterLua())
   5. [parseFilter()](#parseFilter())
   6. [resolveItemTypes(ItemFilterScript.FilterTypeInfo)](#resolveItemTypes(zombie.scripting.objects.ItemFilterScript.FilterTypeInfo))
   7. [OnPostWorldDictionaryInit()](#OnPostWorldDictionaryInit())
   8. [allowsItem(InventoryItem)](#allowsItem(zombie.inventory.InventoryItem))
   9. [allowsItem(Item)](#allowsItem(zombie.scripting.objects.Item))
   10. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   11. [readBlock(ScriptParser.Block, ItemFilterScript.FilterTypeInfo)](#readBlock(zombie.scripting.ScriptParser.Block,zombie.scripting.objects.ItemFilterScript.FilterTypeInfo))
   12. [readFilterBlock(ScriptParser.Block, ArrayList)](#readFilterBlock(zombie.scripting.ScriptParser.Block,java.util.ArrayList))
   13. [parseInputString(ArrayList, String)](#parseInputString(java.util.ArrayList,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ItemFilterScript
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.ItemFilterScript

---

public class ItemFilterScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `ItemFilterScript.FilterTypeInfo`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ItemFilterScript.FilterTypeInfo`

  `blacklist`

  `private boolean`

  `hasParsed`

  `private String`

  `name`

  `private final ArrayList<Item>`

  `tempScriptItems`

  `private final ItemFilterScript.FilterTypeInfo`

  `whitelist`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemFilterScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `allowsItem(InventoryItem item)`

  `boolean`

  `allowsItem(Item item)`

  `String`

  `getName()`

  `void`

  `Load(String name,
  String totalFile)`

  `void`

  `OnLoadedAfterLua()`

  `void`

  `OnPostWorldDictionaryInit()`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `private void`

  `parseFilter()`

  `private void`

  `parseInputString(ArrayList<String> list,
  String input)`

  `void`

  `PreReload()`

  `private void`

  `readBlock(zombie.scripting.ScriptParser.Block block,
  ItemFilterScript.FilterTypeInfo info)`

  `private void`

  `readFilterBlock(zombie.scripting.ScriptParser.Block block,
  ArrayList<String> list)`

  `private void`

  `resolveItemTypes(ItemFilterScript.FilterTypeInfo info)`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### whitelist

    private final [ItemFilterScript.FilterTypeInfo](ItemFilterScript.FilterTypeInfo.html "class in zombie.scripting.objects") whitelist
  + ### blacklist

    private final [ItemFilterScript.FilterTypeInfo](ItemFilterScript.FilterTypeInfo.html "class in zombie.scripting.objects") blacklist
  + ### hasParsed

    private boolean hasParsed
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### tempScriptItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](Item.html "class in zombie.scripting.objects")> tempScriptItems
* Constructor Details
  -------------------

  + ### ItemFilterScript

    public ItemFilterScript()
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### PreReload

    public void PreReload()

    Overrides:
    :   `PreReload` in class `BaseScriptObject`
  + ### OnScriptsLoaded

    public void OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)

    Overrides:
    :   `OnScriptsLoaded` in class `BaseScriptObject`
  + ### OnLoadedAfterLua

    public void OnLoadedAfterLua()

    Overrides:
    :   `OnLoadedAfterLua` in class `BaseScriptObject`
  + ### parseFilter

    private void parseFilter()
  + ### resolveItemTypes

    private void resolveItemTypes([ItemFilterScript.FilterTypeInfo](ItemFilterScript.FilterTypeInfo.html "class in zombie.scripting.objects") info)
  + ### OnPostWorldDictionaryInit

    public void OnPostWorldDictionaryInit()

    Overrides:
    :   `OnPostWorldDictionaryInit` in class `BaseScriptObject`
  + ### allowsItem

    public boolean allowsItem([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### allowsItem

    public boolean allowsItem([Item](Item.html "class in zombie.scripting.objects") item)
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### readBlock

    private void readBlock(zombie.scripting.ScriptParser.Block block,
    [ItemFilterScript.FilterTypeInfo](ItemFilterScript.FilterTypeInfo.html "class in zombie.scripting.objects") info)
  + ### readFilterBlock

    private void readFilterBlock(zombie.scripting.ScriptParser.Block block,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list)
  + ### parseInputString

    private void parseInputString([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input)