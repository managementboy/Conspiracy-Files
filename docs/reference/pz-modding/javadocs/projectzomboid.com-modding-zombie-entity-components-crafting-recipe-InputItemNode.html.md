[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [InputItemNode](InputItemNode.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [items](#items)
   3. [firstMatchedInputScript](#firstMatchedInputScript)
   4. [recipe](#recipe)
   5. [scriptItem](#scriptItem)
   6. [name](#name)
   7. [expandedUsed](#expandedUsed)
   8. [expandedAvailable](#expandedAvailable)
   9. [isToolLeft](#isToolLeft)
   10. [isToolRight](#isToolRight)
   11. [isTool](#isTool)
   12. [isKeep](#isKeep)
   13. [isItemCount](#isItemCount)
   14. [inputItemNodeComparator](#inputItemNodeComparator)
6. [Constructor Details](#constructor-detail)
   1. [InputItemNode()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Alloc(CraftRecipe, Item)](#Alloc(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.scripting.objects.Item))
   2. [Release(InputItemNode)](#Release(zombie.entity.components.crafting.recipe.InputItemNode))
   3. [getRecipe()](#getRecipe())
   4. [getScriptItem()](#getScriptItem())
   5. [getName()](#getName())
   6. [getFirstMatchedInputScript()](#getFirstMatchedInputScript())
   7. [isExpandedUsed()](#isExpandedUsed())
   8. [isExpandedAvailable()](#isExpandedAvailable())
   9. [setExpandedUsed(boolean)](#setExpandedUsed(boolean))
   10. [setExpandedAvailable(boolean)](#setExpandedAvailable(boolean))
   11. [toggleExpandedUsed()](#toggleExpandedUsed())
   12. [toggleExpandedAvailable()](#toggleExpandedAvailable())
   13. [isToolRight()](#isToolRight())
   14. [isToolLeft()](#isToolLeft())
   15. [isTool()](#isTool())
   16. [isKeep()](#isKeep())
   17. [isItemCount()](#isItemCount())
   18. [getItems()](#getItems())
   19. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class InputItemNode
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.InputItemNode

---

public class InputItemNode
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected boolean`

  `expandedAvailable`

  `protected boolean`

  `expandedUsed`

  `protected InputScript`

  `firstMatchedInputScript`

  `protected static final Comparator<InputItemNode>`

  `inputItemNodeComparator`

  `protected boolean`

  `isItemCount`

  `protected boolean`

  `isKeep`

  `protected boolean`

  `isTool`

  `protected boolean`

  `isToolLeft`

  `protected boolean`

  `isToolRight`

  `protected final ArrayList<InventoryItem>`

  `items`

  `private String`

  `name`

  `private static final ArrayDeque<InputItemNode>`

  `pool`

  `private CraftRecipe`

  `recipe`

  `protected Item`

  `scriptItem`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `InputItemNode()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected static InputItemNode`

  `Alloc(CraftRecipe recipe,
  Item scriptItem)`

  `InputScript`

  `getFirstMatchedInputScript()`

  `ArrayList<InventoryItem>`

  `getItems()`

  `String`

  `getName()`

  `CraftRecipe`

  `getRecipe()`

  `Item`

  `getScriptItem()`

  `boolean`

  `isExpandedAvailable()`

  `boolean`

  `isExpandedUsed()`

  `boolean`

  `isItemCount()`

  `boolean`

  `isKeep()`

  `boolean`

  `isTool()`

  `boolean`

  `isToolLeft()`

  `boolean`

  `isToolRight()`

  `protected static void`

  `Release(InputItemNode node)`

  `private void`

  `reset()`

  `void`

  `setExpandedAvailable(boolean b)`

  `void`

  `setExpandedUsed(boolean b)`

  `void`

  `toggleExpandedAvailable()`

  `void`

  `toggleExpandedUsed()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[InputItemNode](InputItemNode.html "class in zombie.entity.components.crafting.recipe")> pool
  + ### items

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> items
  + ### firstMatchedInputScript

    protected [InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") firstMatchedInputScript
  + ### recipe

    private [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe
  + ### scriptItem

    protected [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") scriptItem
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### expandedUsed

    protected boolean expandedUsed
  + ### expandedAvailable

    protected boolean expandedAvailable
  + ### isToolLeft

    protected boolean isToolLeft
  + ### isToolRight

    protected boolean isToolRight
  + ### isTool

    protected boolean isTool
  + ### isKeep

    protected boolean isKeep
  + ### isItemCount

    protected boolean isItemCount
  + ### inputItemNodeComparator

    protected static final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InputItemNode](InputItemNode.html "class in zombie.entity.components.crafting.recipe")> inputItemNodeComparator
* Constructor Details
  -------------------

  + ### InputItemNode

    public InputItemNode()
* Method Details
  --------------

  + ### Alloc

    protected static [InputItemNode](InputItemNode.html "class in zombie.entity.components.crafting.recipe") Alloc([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") scriptItem)
  + ### Release

    protected static void Release([InputItemNode](InputItemNode.html "class in zombie.entity.components.crafting.recipe") node)
  + ### getRecipe

    public [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getRecipe()
  + ### getScriptItem

    public [Item](../../../../scripting/objects/Item.html "class in zombie.scripting.objects") getScriptItem()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getFirstMatchedInputScript

    public [InputScript](../../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") getFirstMatchedInputScript()
  + ### isExpandedUsed

    public boolean isExpandedUsed()
  + ### isExpandedAvailable

    public boolean isExpandedAvailable()
  + ### setExpandedUsed

    public void setExpandedUsed(boolean b)
  + ### setExpandedAvailable

    public void setExpandedAvailable(boolean b)
  + ### toggleExpandedUsed

    public void toggleExpandedUsed()
  + ### toggleExpandedAvailable

    public void toggleExpandedAvailable()
  + ### isToolRight

    public boolean isToolRight()
  + ### isToolLeft

    public boolean isToolLeft()
  + ### isTool

    public boolean isTool()
  + ### isKeep

    public boolean isKeep()
  + ### isItemCount

    public boolean isItemCount()
  + ### getItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../../../inventory/InventoryItem.html "class in zombie.inventory")> getItems()
  + ### reset

    private void reset()