[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [MetaRecipe](MetaRecipe.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [ASSEMBLE\_ADVANCED\_FRAMEPACK](#ASSEMBLE_ADVANCED_FRAMEPACK)
   2. [ASSEMBLE\_LARGE\_FRAMEPACK](#ASSEMBLE_LARGE_FRAMEPACK)
   3. [ASSEMBLE\_SHOULDER\_ARMOR](#ASSEMBLE_SHOULDER_ARMOR)
   4. [BIND\_SPEAR](#BIND_SPEAR)
   5. [CAN\_REINFORCE\_WEAPON](#CAN_REINFORCE_WEAPON)
   6. [CARVE\_BAT](#CARVE_BAT)
   7. [FORGE\_FILE](#FORGE_FILE)
   8. [FORGE\_FINE\_BUTTER\_KNIVES](#FORGE_FINE_BUTTER_KNIVES)
   9. [FORGE\_FINE\_FORKS](#FORGE_FINE_FORKS)
   10. [FORGE\_FINE\_SPOONS](#FORGE_FINE_SPOONS)
   11. [FORGE\_METALWORKING\_CHISEL](#FORGE_METALWORKING_CHISEL)
   12. [KITCHEN\_TOOLS](#KITCHEN_TOOLS)
   13. [MAKE\_BONE\_ARMOR](#MAKE_BONE_ARMOR)
   14. [MAKE\_BULLETPROOF\_LIMB\_ARMOR](#MAKE_BULLETPROOF_LIMB_ARMOR)
   15. [MAKE\_FLIES\_CURE](#MAKE_FLIES_CURE)
   16. [MAKE\_LARGE\_BONE\_BEAD](#MAKE_LARGE_BONE_BEAD)
   17. [MAKE\_MAGAZINE\_ARMOR](#MAKE_MAGAZINE_ARMOR)
   18. [MAKE\_RAILSPIKE\_WEAPON](#MAKE_RAILSPIKE_WEAPON)
   19. [MAKE\_SAWBLADE\_WEAPON](#MAKE_SAWBLADE_WEAPON)
   20. [MAKE\_SPIKED\_CLUB](#MAKE_SPIKED_CLUB)
   21. [MAKE\_STONE\_BLADE](#MAKE_STONE_BLADE)
   22. [MAKE\_TIRE\_ARMOR](#MAKE_TIRE_ARMOR)
   23. [MAKE\_TIRE\_SHOULDER\_ARMOR\_LEFT](#MAKE_TIRE_SHOULDER_ARMOR_LEFT)
   24. [MAKE\_WOOD\_ARMOR](#MAKE_WOOD_ARMOR)
   25. [SEW\_BANDOLIER](#SEW_BANDOLIER)
   26. [SEW\_CRUDE\_LEATHER\_BACKPACK](#SEW_CRUDE_LEATHER_BACKPACK)
   27. [SEW\_DRESS\_KNEES](#SEW_DRESS_KNEES)
   28. [SEW\_HIDE\_FANNY\_BAG](#SEW_HIDE_FANNY_BAG)
   29. [SEW\_HIDE\_PANTS](#SEW_HIDE_PANTS)
   30. [SEW\_LONGJOHNS](#SEW_LONGJOHNS)
   31. [SEW\_SHIRT](#SEW_SHIRT)
   32. [SEW\_SKIRT\_KNEES](#SEW_SKIRT_KNEES)
   33. [SHARPEN\_BONE](#SHARPEN_BONE)
   34. [SPIKE\_PADDING](#SPIKE_PADDING)
   35. [translationName](#translationName)
6. [Constructor Details](#constructor-detail)
   1. [MetaRecipe(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [register(String)](#register(java.lang.String))
   2. [registerBase(String)](#registerBase(java.lang.String))
   3. [register(boolean, String)](#register(boolean,java.lang.String))
   4. [get(ResourceLocation)](#get(zombie.scripting.objects.ResourceLocation))
   5. [toString()](#toString())
   6. [getRegistryId()](#getRegistryId())
   7. [getTranslationName()](#getTranslationName())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class MetaRecipe
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.MetaRecipe

All Implemented Interfaces:
:   `RecipeKey`

---

public class MetaRecipe
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [RecipeKey](RecipeKey.html "interface in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final MetaRecipe`

  `ASSEMBLE_ADVANCED_FRAMEPACK`

  `static final MetaRecipe`

  `ASSEMBLE_LARGE_FRAMEPACK`

  `static final MetaRecipe`

  `ASSEMBLE_SHOULDER_ARMOR`

  `static final MetaRecipe`

  `BIND_SPEAR`

  `static final MetaRecipe`

  `CAN_REINFORCE_WEAPON`

  `static final MetaRecipe`

  `CARVE_BAT`

  `static final MetaRecipe`

  `FORGE_FILE`

  `static final MetaRecipe`

  `FORGE_FINE_BUTTER_KNIVES`

  `static final MetaRecipe`

  `FORGE_FINE_FORKS`

  `static final MetaRecipe`

  `FORGE_FINE_SPOONS`

  `static final MetaRecipe`

  `FORGE_METALWORKING_CHISEL`

  `static final MetaRecipe`

  `KITCHEN_TOOLS`

  `static final MetaRecipe`

  `MAKE_BONE_ARMOR`

  `static final MetaRecipe`

  `MAKE_BULLETPROOF_LIMB_ARMOR`

  `static final MetaRecipe`

  `MAKE_FLIES_CURE`

  `static final MetaRecipe`

  `MAKE_LARGE_BONE_BEAD`

  `static final MetaRecipe`

  `MAKE_MAGAZINE_ARMOR`

  `static final MetaRecipe`

  `MAKE_RAILSPIKE_WEAPON`

  `static final MetaRecipe`

  `MAKE_SAWBLADE_WEAPON`

  `static final MetaRecipe`

  `MAKE_SPIKED_CLUB`

  `static final MetaRecipe`

  `MAKE_STONE_BLADE`

  `static final MetaRecipe`

  `MAKE_TIRE_ARMOR`

  `static final MetaRecipe`

  `MAKE_TIRE_SHOULDER_ARMOR_LEFT`

  `static final MetaRecipe`

  `MAKE_WOOD_ARMOR`

  `static final MetaRecipe`

  `SEW_BANDOLIER`

  `static final MetaRecipe`

  `SEW_CRUDE_LEATHER_BACKPACK`

  `static final MetaRecipe`

  `SEW_DRESS_KNEES`

  `static final MetaRecipe`

  `SEW_HIDE_FANNY_BAG`

  `static final MetaRecipe`

  `SEW_HIDE_PANTS`

  `static final MetaRecipe`

  `SEW_LONGJOHNS`

  `static final MetaRecipe`

  `SEW_SHIRT`

  `static final MetaRecipe`

  `SEW_SKIRT_KNEES`

  `static final MetaRecipe`

  `SHARPEN_BONE`

  `static final MetaRecipe`

  `SPIKE_PADDING`

  `private final String`

  `translationName`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `MetaRecipe(String translationName)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static MetaRecipe`

  `get(ResourceLocation id)`

  `ResourceLocation`

  `getRegistryId()`

  `String`

  `getTranslationName()`

  `private static MetaRecipe`

  `register(boolean allowDefaultNamespace,
  String id)`

  `static MetaRecipe`

  `register(String id)`

  `private static MetaRecipe`

  `registerBase(String id)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### ASSEMBLE\_ADVANCED\_FRAMEPACK

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") ASSEMBLE\_ADVANCED\_FRAMEPACK
  + ### ASSEMBLE\_LARGE\_FRAMEPACK

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") ASSEMBLE\_LARGE\_FRAMEPACK
  + ### ASSEMBLE\_SHOULDER\_ARMOR

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") ASSEMBLE\_SHOULDER\_ARMOR
  + ### BIND\_SPEAR

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") BIND\_SPEAR
  + ### CAN\_REINFORCE\_WEAPON

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") CAN\_REINFORCE\_WEAPON
  + ### CARVE\_BAT

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") CARVE\_BAT
  + ### FORGE\_FILE

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") FORGE\_FILE
  + ### FORGE\_FINE\_BUTTER\_KNIVES

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") FORGE\_FINE\_BUTTER\_KNIVES
  + ### FORGE\_FINE\_FORKS

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") FORGE\_FINE\_FORKS
  + ### FORGE\_FINE\_SPOONS

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") FORGE\_FINE\_SPOONS
  + ### FORGE\_METALWORKING\_CHISEL

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") FORGE\_METALWORKING\_CHISEL
  + ### KITCHEN\_TOOLS

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") KITCHEN\_TOOLS
  + ### MAKE\_BONE\_ARMOR

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_BONE\_ARMOR
  + ### MAKE\_BULLETPROOF\_LIMB\_ARMOR

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_BULLETPROOF\_LIMB\_ARMOR
  + ### MAKE\_FLIES\_CURE

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_FLIES\_CURE
  + ### MAKE\_LARGE\_BONE\_BEAD

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_LARGE\_BONE\_BEAD
  + ### MAKE\_MAGAZINE\_ARMOR

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_MAGAZINE\_ARMOR
  + ### MAKE\_RAILSPIKE\_WEAPON

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_RAILSPIKE\_WEAPON
  + ### MAKE\_SAWBLADE\_WEAPON

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_SAWBLADE\_WEAPON
  + ### MAKE\_SPIKED\_CLUB

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_SPIKED\_CLUB
  + ### MAKE\_STONE\_BLADE

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_STONE\_BLADE
  + ### MAKE\_TIRE\_ARMOR

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_TIRE\_ARMOR
  + ### MAKE\_TIRE\_SHOULDER\_ARMOR\_LEFT

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_TIRE\_SHOULDER\_ARMOR\_LEFT
  + ### MAKE\_WOOD\_ARMOR

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") MAKE\_WOOD\_ARMOR
  + ### SEW\_BANDOLIER

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SEW\_BANDOLIER
  + ### SEW\_CRUDE\_LEATHER\_BACKPACK

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SEW\_CRUDE\_LEATHER\_BACKPACK
  + ### SEW\_DRESS\_KNEES

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SEW\_DRESS\_KNEES
  + ### SEW\_HIDE\_FANNY\_BAG

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SEW\_HIDE\_FANNY\_BAG
  + ### SEW\_HIDE\_PANTS

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SEW\_HIDE\_PANTS
  + ### SEW\_LONGJOHNS

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SEW\_LONGJOHNS
  + ### SEW\_SHIRT

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SEW\_SHIRT
  + ### SEW\_SKIRT\_KNEES

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SEW\_SKIRT\_KNEES
  + ### SHARPEN\_BONE

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SHARPEN\_BONE
  + ### SPIKE\_PADDING

    public static final [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") SPIKE\_PADDING
  + ### translationName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName
* Constructor Details
  -------------------

  + ### MetaRecipe

    private MetaRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationName)
* Method Details
  --------------

  + ### register

    public static [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### registerBase

    private static [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### register

    private static [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") register(boolean allowDefaultNamespace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### get

    public static [MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects") get([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getRegistryId

    public [ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") getRegistryId()

    Specified by:
    :   `getRegistryId` in interface `RecipeKey`
  + ### getTranslationName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslationName()

    Specified by:
    :   `getTranslationName` in interface `RecipeKey`