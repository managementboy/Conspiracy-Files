[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [FixingManager](FixingManager.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [FixingManager()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [getFixes(InventoryItem)](#getFixes(zombie.inventory.InventoryItem))
   2. [fixItem(InventoryItem, IsoGameCharacter, Fixing, Fixing.Fixer)](#fixItem(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,zombie.scripting.objects.Fixing,zombie.scripting.objects.Fixing.Fixer))
   3. [addXp(IsoGameCharacter, Fixing.Fixer)](#addXp(zombie.characters.IsoGameCharacter,zombie.scripting.objects.Fixing.Fixer))
   4. [useFixer(IsoGameCharacter, Fixing.Fixer, InventoryItem)](#useFixer(zombie.characters.IsoGameCharacter,zombie.scripting.objects.Fixing.Fixer,zombie.inventory.InventoryItem))
   5. [getChanceOfFail(InventoryItem, IsoGameCharacter, Fixing, Fixing.Fixer)](#getChanceOfFail(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,zombie.scripting.objects.Fixing,zombie.scripting.objects.Fixing.Fixer))
   6. [getCondRepaired(InventoryItem, IsoGameCharacter, Fixing, Fixing.Fixer)](#getCondRepaired(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,zombie.scripting.objects.Fixing,zombie.scripting.objects.Fixing.Fixer))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FixingManager
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.FixingManager

---

public final class FixingManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FixingManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `addXp(IsoGameCharacter chr,
  Fixing.Fixer fixer)`

  `static InventoryItem`

  `fixItem(InventoryItem brokenItem,
  IsoGameCharacter chr,
  Fixing fixing,
  Fixing.Fixer fixer)`

  `static double`

  `getChanceOfFail(InventoryItem brokenItem,
  IsoGameCharacter chr,
  Fixing fixing,
  Fixing.Fixer fixer)`

  `static double`

  `getCondRepaired(InventoryItem brokenItem,
  IsoGameCharacter chr,
  Fixing fixing,
  Fixing.Fixer fixer)`

  `static ArrayList<Fixing>`

  `getFixes(InventoryItem item)`

  `static void`

  `useFixer(IsoGameCharacter chr,
  Fixing.Fixer fixer,
  InventoryItem brokenItem)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### FixingManager

    public FixingManager()
* Method Details
  --------------

  + ### getFixes

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Fixing](../scripting/objects/Fixing.html "class in zombie.scripting.objects")> getFixes([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### fixItem

    public static [InventoryItem](InventoryItem.html "class in zombie.inventory") fixItem([InventoryItem](InventoryItem.html "class in zombie.inventory") brokenItem,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Fixing](../scripting/objects/Fixing.html "class in zombie.scripting.objects") fixing,
    [Fixing.Fixer](../scripting/objects/Fixing.Fixer.html "class in zombie.scripting.objects") fixer)
  + ### addXp

    private static void addXp([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Fixing.Fixer](../scripting/objects/Fixing.Fixer.html "class in zombie.scripting.objects") fixer)
  + ### useFixer

    public static void useFixer([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Fixing.Fixer](../scripting/objects/Fixing.Fixer.html "class in zombie.scripting.objects") fixer,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") brokenItem)
  + ### getChanceOfFail

    public static double getChanceOfFail([InventoryItem](InventoryItem.html "class in zombie.inventory") brokenItem,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Fixing](../scripting/objects/Fixing.html "class in zombie.scripting.objects") fixing,
    [Fixing.Fixer](../scripting/objects/Fixing.Fixer.html "class in zombie.scripting.objects") fixer)
  + ### getCondRepaired

    public static double getCondRepaired([InventoryItem](InventoryItem.html "class in zombie.inventory") brokenItem,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Fixing](../scripting/objects/Fixing.html "class in zombie.scripting.objects") fixing,
    [Fixing.Fixer](../scripting/objects/Fixing.Fixer.html "class in zombie.scripting.objects") fixer)