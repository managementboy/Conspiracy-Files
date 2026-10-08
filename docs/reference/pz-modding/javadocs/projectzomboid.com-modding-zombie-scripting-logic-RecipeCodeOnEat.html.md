[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.logic](package-summary.html)
2. [RecipeCodeOnEat](RecipeCodeOnEat.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [RecipeCodeOnEat()](#%3Cinit%3E())
6. [Method Details](#method-detail)
   1. [consumeNicotineLogic(InventoryItem, IsoGameCharacter, float)](#consumeNicotineLogic(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter,float))
   2. [consumeNicotine(DrainableComboItem, IsoGameCharacter)](#consumeNicotine(zombie.inventory.types.DrainableComboItem,zombie.characters.IsoGameCharacter))
   3. [consumeNicotine(Food, IsoGameCharacter, float)](#consumeNicotine(zombie.inventory.types.Food,zombie.characters.IsoGameCharacter,float))
   4. [consumeCorrectionFluid(DrainableComboItem, IsoGameCharacter)](#consumeCorrectionFluid(zombie.inventory.types.DrainableComboItem,zombie.characters.IsoGameCharacter))
   5. [consumeRatPoison(DrainableComboItem, IsoGameCharacter)](#consumeRatPoison(zombie.inventory.types.DrainableComboItem,zombie.characters.IsoGameCharacter))
   6. [consumeWildFoodGeneric(Food, IsoGameCharacter, float)](#consumeWildFoodGeneric(zombie.inventory.types.Food,zombie.characters.IsoGameCharacter,float))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RecipeCodeOnEat
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.logic.RecipeCodeHelper

zombie.scripting.logic.RecipeCodeOnEat

---

public class RecipeCodeOnEat
extends zombie.scripting.logic.RecipeCodeHelper

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class zombie.scripting.logic.RecipeCodeHelper

  `zombie.scripting.logic.RecipeCodeHelper.DateResult`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RecipeCodeOnEat()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `consumeCorrectionFluid(DrainableComboItem item,
  IsoGameCharacter character)`

  `static void`

  `consumeNicotine(DrainableComboItem item,
  IsoGameCharacter character)`

  `static void`

  `consumeNicotine(Food item,
  IsoGameCharacter character,
  float percent)`

  `private static void`

  `consumeNicotineLogic(InventoryItem item,
  IsoGameCharacter character,
  float percent)`

  `static void`

  `consumeRatPoison(DrainableComboItem item,
  IsoGameCharacter character)`

  `static void`

  `consumeWildFoodGeneric(Food item,
  IsoGameCharacter character,
  float percent)`

  ### Methods inherited from class zombie.scripting.logic.RecipeCodeHelper

  `addItemToCharacterInventory, addItemToCharacterInventory, addItemToCharacterInventory, getConsumedItems, getConsumedItems, getConsumedItems, getCreatedItems, getCreatedItems, getInputItems, getKeepItems, getKeepItems, getKeepItems, nameNewspaper, removeItemFromCharacterInventory, removeItemFromCharacterInventory, removeItemFromCharacterInventory, scratchTicketWinner, setColor, setPrintMediaInfo`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### RecipeCodeOnEat

    public RecipeCodeOnEat()
* Method Details
  --------------

  + ### consumeNicotineLogic

    private static void consumeNicotineLogic([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    float percent)
  + ### consumeNicotine

    public static void consumeNicotine([DrainableComboItem](../../inventory/types/DrainableComboItem.html "class in zombie.inventory.types") item,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### consumeNicotine

    public static void consumeNicotine([Food](../../inventory/types/Food.html "class in zombie.inventory.types") item,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    float percent)
  + ### consumeCorrectionFluid

    public static void consumeCorrectionFluid([DrainableComboItem](../../inventory/types/DrainableComboItem.html "class in zombie.inventory.types") item,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### consumeRatPoison

    public static void consumeRatPoison([DrainableComboItem](../../inventory/types/DrainableComboItem.html "class in zombie.inventory.types") item,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### consumeWildFoodGeneric

    public static void consumeWildFoodGeneric([Food](../../inventory/types/Food.html "class in zombie.inventory.types") item,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character,
    float percent)