[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [OutputMapper](OutputMapper.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [\_emptyItems](#_emptyItems)
   2. [resultItems](#resultItems)
   3. [entrees](#entrees)
   4. [entreeMap](#entreeMap)
   5. [defaultOutputEntree](#defaultOutputEntree)
   6. [inputScripts](#inputScripts)
   7. [matchedInputs](#matchedInputs)
   8. [name](#name)
7. [Constructor Details](#constructor-detail)
   1. [OutputMapper(String)](#%3Cinit%3E(java.lang.String))
8. [Method Details](#method-detail)
   1. [isEmpty()](#isEmpty())
   2. [clear()](#clear())
   3. [getResultItems()](#getResultItems())
   4. [getPatternForResult(Item)](#getPatternForResult(zombie.scripting.objects.Item))
   5. [registerInputScript(InputScript)](#registerInputScript(zombie.scripting.entity.components.crafting.InputScript))
   6. [setDefaultOutputEntree(String)](#setDefaultOutputEntree(java.lang.String))
   7. [addOutputEntree(String, String[])](#addOutputEntree(java.lang.String,java.lang.String%5B%5D))
   8. [addOutputEntree(String, ArrayList)](#addOutputEntree(java.lang.String,java.util.ArrayList))
   9. [getItem(String)](#getItem(java.lang.String))
   10. [getItem(String, String)](#getItem(java.lang.String,java.lang.String))
   11. [OnPostWorldDictionaryInit()](#OnPostWorldDictionaryInit())
   12. [OnPostWorldDictionaryInit(String)](#OnPostWorldDictionaryInit(java.lang.String))
   13. [getOutputItem(CraftRecipeData)](#getOutputItem(zombie.entity.components.crafting.recipe.CraftRecipeData))
   14. [getOutputItem(CraftRecipeData, boolean)](#getOutputItem(zombie.entity.components.crafting.recipe.CraftRecipeData,boolean))
   15. [matchItem(CraftRecipeData, InputScript, Item, boolean)](#matchItem(zombie.entity.components.crafting.recipe.CraftRecipeData,zombie.scripting.entity.components.crafting.InputScript,zombie.scripting.objects.Item,boolean))
   16. [getEntrees()](#getEntrees())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class OutputMapper
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.OutputMapper

---

public class OutputMapper
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `OutputMapper.OutputEntree`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<Item>`

  `_emptyItems`

  `private OutputMapper.OutputEntree`

  `defaultOutputEntree`

  `private final HashMap<Item, OutputMapper.OutputEntree>`

  `entreeMap`

  `private final ArrayList<OutputMapper.OutputEntree>`

  `entrees`

  `private final ArrayList<InputScript>`

  `inputScripts`

  `private final HashSet<InputScript>`

  `matchedInputs`

  `private final String`

  `name`

  `private final ArrayList<Item>`

  `resultItems`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `OutputMapper(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addOutputEntree(String result,
  String[] items)`

  `void`

  `addOutputEntree(String result,
  ArrayList<String> items)`

  `private void`

  `clear()`

  `ArrayList<OutputMapper.OutputEntree>`

  `getEntrees()`

  `private Item`

  `getItem(String fullType)`

  `private Item`

  `getItem(String fullType,
  String recipe)`

  `Item`

  `getOutputItem(CraftRecipeData recipeData)`

  `Item`

  `getOutputItem(CraftRecipeData recipeData,
  boolean testManualInputs)`

  `ArrayList<Item>`

  `getPatternForResult(Item result)`

  `ArrayList<Item>`

  `getResultItems()`

  `boolean`

  `isEmpty()`

  `private boolean`

  `matchItem(CraftRecipeData recipeData,
  InputScript inputScript,
  Item item,
  boolean testManualInputs)`

  `void`

  `OnPostWorldDictionaryInit()`

  `void`

  `OnPostWorldDictionaryInit(String recipe)`

  `void`

  `registerInputScript(InputScript inputScript)`

  `void`

  `setDefaultOutputEntree(String item)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### \_emptyItems

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects")> \_emptyItems
  + ### resultItems

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects")> resultItems
  + ### entrees

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[OutputMapper.OutputEntree](OutputMapper.OutputEntree.html "class in zombie.entity.components.crafting.recipe")> entrees
  + ### entreeMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects"), [OutputMapper.OutputEntree](OutputMapper.OutputEntree.html "class in zombie.entity.components.crafting.recipe")> entreeMap
  + ### defaultOutputEntree

    private [OutputMapper.OutputEntree](OutputMapper.OutputEntree.html "class in zombie.entity.components.crafting.recipe") defaultOutputEntree
  + ### inputScripts

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting")> inputScripts
  + ### matchedInputs

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting")> matchedInputs
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
* Constructor Details
  -------------------

  + ### OutputMapper

    public OutputMapper([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### isEmpty

    public boolean isEmpty()
  + ### clear

    private void clear()
  + ### getResultItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects")> getResultItems()
  + ### getPatternForResult

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects")> getPatternForResult([Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") result)
  + ### registerInputScript

    public void registerInputScript([InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript)
  + ### setDefaultOutputEntree

    public void setDefaultOutputEntree([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item)
  + ### addOutputEntree

    public void addOutputEntree([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") result,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] items)
  + ### addOutputEntree

    public void addOutputEntree([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") result,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> items)
  + ### getItem

    private [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") getItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getItem

    private [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") getItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fullType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### OnPostWorldDictionaryInit

    public void OnPostWorldDictionaryInit()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### OnPostWorldDictionaryInit

    public void OnPostWorldDictionaryInit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getOutputItem

    public [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") getOutputItem([CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeData)
  + ### getOutputItem

    public [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") getOutputItem([CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeData,
    boolean testManualInputs)
  + ### matchItem

    private boolean matchItem([CraftRecipeData](CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") recipeData,
    [InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") inputScript,
    [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    boolean testManualInputs)
  + ### getEntrees

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[OutputMapper.OutputEntree](OutputMapper.OutputEntree.html "class in zombie.entity.components.crafting.recipe")> getEntrees()