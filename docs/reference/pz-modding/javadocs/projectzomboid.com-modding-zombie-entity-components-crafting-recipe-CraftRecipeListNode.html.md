[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.entity.components.crafting.recipe](package-summary.html)
2. [CraftRecipeListNode](CraftRecipeListNode.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [type](#type)
   2. [parent](#parent)
   3. [children](#children)
   4. [recipe](#recipe)
   5. [iconTexture](#iconTexture)
   6. [title](#title)
   7. [group](#group)
   8. [expandedState](#expandedState)
7. [Constructor Details](#constructor-detail)
   1. [CraftRecipeListNode()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [createGroupNode(CraftRecipeGroup, String, Texture, CraftRecipeListNode.CraftRecipeListNodeExpandedState)](#createGroupNode(zombie.scripting.objects.CraftRecipeGroup,java.lang.String,zombie.core.textures.Texture,zombie.entity.components.crafting.recipe.CraftRecipeListNode.CraftRecipeListNodeExpandedState))
   2. [createRecipeNode(CraftRecipe, CraftRecipeListNode)](#createRecipeNode(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.entity.components.crafting.recipe.CraftRecipeListNode))
   3. [getType()](#getType())
   4. [getParent()](#getParent())
   5. [getRecipe()](#getRecipe())
   6. [getIconTexture()](#getIconTexture())
   7. [getTitle()](#getTitle())
   8. [getGroup()](#getGroup())
   9. [getExpandedState()](#getExpandedState())
   10. [setExpandedState(CraftRecipeListNode.CraftRecipeListNodeExpandedState)](#setExpandedState(zombie.entity.components.crafting.recipe.CraftRecipeListNode.CraftRecipeListNodeExpandedState))
   11. [toggleExpandedState()](#toggleExpandedState())
   12. [getChildren()](#getChildren())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeListNode
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.recipe.CraftRecipeListNode

---

public class CraftRecipeListNode
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `CraftRecipeListNode.CraftRecipeListNodeExpandedState`

  `static enum`

  `CraftRecipeListNode.CraftRecipeListNodeType`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected List<CraftRecipeListNode>`

  `children`

  `protected CraftRecipeListNode.CraftRecipeListNodeExpandedState`

  `expandedState`

  `protected CraftRecipeGroup`

  `group`

  `protected Texture`

  `iconTexture`

  `protected CraftRecipeListNode`

  `parent`

  `protected CraftRecipe`

  `recipe`

  `protected String`

  `title`

  `protected CraftRecipeListNode.CraftRecipeListNodeType`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CraftRecipeListNode()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static CraftRecipeListNode`

  `createGroupNode(CraftRecipeGroup group,
  String title,
  Texture iconTexture,
  CraftRecipeListNode.CraftRecipeListNodeExpandedState expandedState)`

  `static CraftRecipeListNode`

  `createRecipeNode(CraftRecipe recipe,
  CraftRecipeListNode parent)`

  `List<CraftRecipeListNode>`

  `getChildren()`

  `CraftRecipeListNode.CraftRecipeListNodeExpandedState`

  `getExpandedState()`

  `CraftRecipeGroup`

  `getGroup()`

  `Texture`

  `getIconTexture()`

  `CraftRecipeListNode`

  `getParent()`

  `CraftRecipe`

  `getRecipe()`

  `String`

  `getTitle()`

  `CraftRecipeListNode.CraftRecipeListNodeType`

  `getType()`

  `void`

  `setExpandedState(CraftRecipeListNode.CraftRecipeListNodeExpandedState state)`

  `void`

  `toggleExpandedState()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### type

    protected [CraftRecipeListNode.CraftRecipeListNodeType](CraftRecipeListNode.CraftRecipeListNodeType.html "enum class in zombie.entity.components.crafting.recipe") type
  + ### parent

    protected [CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe") parent
  + ### children

    protected [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> children
  + ### recipe

    protected [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe
  + ### iconTexture

    protected [Texture](../../../../core/textures/Texture.html "class in zombie.core.textures") iconTexture
  + ### title

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### group

    protected [CraftRecipeGroup](../../../../scripting/objects/CraftRecipeGroup.html "enum class in zombie.scripting.objects") group
  + ### expandedState

    protected [CraftRecipeListNode.CraftRecipeListNodeExpandedState](CraftRecipeListNode.CraftRecipeListNodeExpandedState.html "enum class in zombie.entity.components.crafting.recipe") expandedState
* Constructor Details
  -------------------

  + ### CraftRecipeListNode

    public CraftRecipeListNode()
* Method Details
  --------------

  + ### createGroupNode

    public static [CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe") createGroupNode([CraftRecipeGroup](../../../../scripting/objects/CraftRecipeGroup.html "enum class in zombie.scripting.objects") group,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title,
    [Texture](../../../../core/textures/Texture.html "class in zombie.core.textures") iconTexture,
    [CraftRecipeListNode.CraftRecipeListNodeExpandedState](CraftRecipeListNode.CraftRecipeListNodeExpandedState.html "enum class in zombie.entity.components.crafting.recipe") expandedState)
  + ### createRecipeNode

    public static [CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe") createRecipeNode([CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe") parent)
  + ### getType

    public [CraftRecipeListNode.CraftRecipeListNodeType](CraftRecipeListNode.CraftRecipeListNodeType.html "enum class in zombie.entity.components.crafting.recipe") getType()
  + ### getParent

    public [CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe") getParent()
  + ### getRecipe

    public [CraftRecipe](../../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getRecipe()
  + ### getIconTexture

    public [Texture](../../../../core/textures/Texture.html "class in zombie.core.textures") getIconTexture()
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### getGroup

    public [CraftRecipeGroup](../../../../scripting/objects/CraftRecipeGroup.html "enum class in zombie.scripting.objects") getGroup()
  + ### getExpandedState

    public [CraftRecipeListNode.CraftRecipeListNodeExpandedState](CraftRecipeListNode.CraftRecipeListNodeExpandedState.html "enum class in zombie.entity.components.crafting.recipe") getExpandedState()
  + ### setExpandedState

    public void setExpandedState([CraftRecipeListNode.CraftRecipeListNodeExpandedState](CraftRecipeListNode.CraftRecipeListNodeExpandedState.html "enum class in zombie.entity.components.crafting.recipe") state)
  + ### toggleExpandedState

    public void toggleExpandedState()
  + ### getChildren

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeListNode](CraftRecipeListNode.html "class in zombie.entity.components.crafting.recipe")> getChildren()