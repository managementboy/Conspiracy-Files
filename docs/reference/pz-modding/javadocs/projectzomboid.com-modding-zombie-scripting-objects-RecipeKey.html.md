[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [RecipeKey](RecipeKey.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [getTranslationName()](#getTranslationName())
   2. [getRegistryId()](#getRegistryId())
   3. [fromId(ResourceLocation)](#fromId(zombie.scripting.objects.ResourceLocation))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Interface RecipeKey
===================

All Known Implementing Classes:
:   `MetaRecipe`

---

public interface RecipeKey

* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `static RecipeKey`

  `fromId(ResourceLocation id)`

  `ResourceLocation`

  `getRegistryId()`

  `String`

  `getTranslationName()`

* Method Details
  --------------

  + ### getTranslationName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationName()
  + ### getRegistryId

    [ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") getRegistryId()
  + ### fromId

    static [RecipeKey](RecipeKey.html "interface in zombie.scripting.objects") fromId([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id)