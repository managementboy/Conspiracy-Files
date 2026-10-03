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
3. [XpAward](CraftRecipe.XpAward.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [perk](#perk)
   2. [amount](#amount)
6. [Constructor Details](#constructor-detail)
   1. [XpAward(PerkFactory.Perk, int)](#%3Cinit%3E(zombie.characters.skills.PerkFactory.Perk,int))
7. [Method Details](#method-detail)
   1. [getPerk()](#getPerk())
   2. [getAmount()](#getAmount())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftRecipe.XpAward
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.entity.components.crafting.CraftRecipe.XpAward

Enclosing class:
:   `CraftRecipe`

---

public static final class CraftRecipe.XpAward
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `amount`

  `private final PerkFactory.Perk`

  `perk`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XpAward(PerkFactory.Perk perk,
  int amount)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getAmount()`

  `PerkFactory.Perk`

  `getPerk()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### perk

    private final [PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk
  + ### amount

    private final int amount
* Constructor Details
  -------------------

  + ### XpAward

    public XpAward([PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    int amount)
* Method Details
  --------------

  + ### getPerk

    public [PerkFactory.Perk](../../../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") getPerk()
  + ### getAmount

    public int getAmount()