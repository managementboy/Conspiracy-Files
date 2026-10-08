[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [CraftRecipe](CraftRecipe.html)
3. [RequiredSkill](CraftRecipe.RequiredSkill.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [perk](#perk)
   2. [level](#level)
6. [Constructor Details](#constructor-detail)
   1. [RequiredSkill(PerkFactory.Perk, int)](#%3Cinit%3E(zombie.characters.skills.PerkFactory.Perk,int))
7. [Method Details](#method-detail)
   1. [getPerk()](#getPerk())
   2. [getLevel()](#getLevel())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipe.RequiredSkill
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.entity.components.crafting.CraftRecipe.RequiredSkill

Enclosing class:
:   `CraftRecipe`

---

public static final class CraftRecipe.RequiredSkill
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `level`

  `private final PerkFactory.Perk`

  `perk`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RequiredSkill(PerkFactory.Perk perk,
  int level)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getLevel()`

  `PerkFactory.Perk`

  `getPerk()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### perk

    private final [PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk
  + ### level

    private final int level
* Constructor Details
  -------------------

  + ### RequiredSkill

    public RequiredSkill([PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    int level)
* Method Details
  --------------

  + ### getPerk

    public [PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") getPerk()
  + ### getLevel

    public int getLevel()