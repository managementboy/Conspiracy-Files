[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [SurvivalGuideEntry](SurvivalGuideEntry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [MOVEMENT](#MOVEMENT)
   2. [MOVEMENT\_WALKING\_RUNNING](#MOVEMENT_WALKING_RUNNING)
   3. [MOVEMENT\_CLIMBING](#MOVEMENT_CLIMBING)
   4. [MOVEMENT\_VAULTING](#MOVEMENT_VAULTING)
   5. [MOVEMENT\_AIMING](#MOVEMENT_AIMING)
   6. [MOVEMENT\_STRAFING](#MOVEMENT_STRAFING)
   7. [MOVEMENT\_SNEAK\_FENCE](#MOVEMENT_SNEAK_FENCE)
   8. [INVENTORY](#INVENTORY)
   9. [INVENTORY\_BACKPACKS](#INVENTORY_BACKPACKS)
   10. [INVENTORY\_DOUBLE\_CLICK](#INVENTORY_DOUBLE_CLICK)
   11. [INVENTORY\_WEIGHT](#INVENTORY_WEIGHT)
   12. [INTERACTABLE](#INTERACTABLE)
   13. [RIGHT\_CLICK\_INTERACT](#RIGHT_CLICK_INTERACT)
   14. [DOORS](#DOORS)
   15. [WINDOWS](#WINDOWS)
   16. [CURTAINS](#CURTAINS)
   17. [LIGHTS](#LIGHTS)
   18. [MAP](#MAP)
   19. [TELEVISION](#TELEVISION)
   20. [BAD\_GASES](#BAD_GASES)
   21. [COMBAT](#COMBAT)
   22. [COMBAT\_EQUIP\_PRIMARY](#COMBAT_EQUIP_PRIMARY)
   23. [COMBAT\_MELEE\_ATTACK](#COMBAT_MELEE_ATTACK)
   24. [COMBAT\_SHOVE](#COMBAT_SHOVE)
   25. [STEALTH\_KILL](#STEALTH_KILL)
   26. [COMBAT\_SHOOTING](#COMBAT_SHOOTING)
   27. [RELOAD](#RELOAD)
   28. [ZOMBIE\_ATTACKS](#ZOMBIE_ATTACKS)
   29. [SHOUTING](#SHOUTING)
   30. [HOTBAR](#HOTBAR)
   31. [FENCE\_DEFENSE](#FENCE_DEFENSE)
   32. [FOOD\_AND\_WATER](#FOOD_AND_WATER)
   33. [OPEN\_CANS](#OPEN_CANS)
   34. [FOOD\_PREPARATION](#FOOD_PREPARATION)
   35. [COOKING](#COOKING)
   36. [LIQUID](#LIQUID)
   37. [TREAT\_WATER](#TREAT_WATER)
   38. [CHARACTER](#CHARACTER)
   39. [MOODLES](#MOODLES)
   40. [EATING\_DRINKING](#EATING_DRINKING)
   41. [FIRST\_AID](#FIRST_AID)
   42. [REST](#REST)
   43. [EXERCISE](#EXERCISE)
   44. [SKILL\_BOOKS](#SKILL_BOOKS)
   45. [BAD\_SMELLS](#BAD_SMELLS)
   46. [CRAFTING](#CRAFTING)
   47. [CRAFTING\_MENU](#CRAFTING_MENU)
   48. [CRAFTING\_INVENTORY](#CRAFTING_INVENTORY)
   49. [CRAFT\_ON\_SURFACE](#CRAFT_ON_SURFACE)
   50. [SHEET\_ROPES](#SHEET_ROPES)
   51. [BUILD\_MENU](#BUILD_MENU)
   52. [BARRICADES](#BARRICADES)
   53. [BUILD\_WALLS](#BUILD_WALLS)
   54. [CRAFTING\_STATION](#CRAFTING_STATION)
   55. [VEHICLES](#VEHICLES)
   56. [START\_VEHICLE](#START_VEHICLE)
   57. [VEHICLE\_RADIAL\_MENU](#VEHICLE_RADIAL_MENU)
   58. [GAS\_REFILL](#GAS_REFILL)
   59. [MECHANICS\_MENU](#MECHANICS_MENU)
   60. [TRAILERS](#TRAILERS)
   61. [VEHICLE\_STORAGE](#VEHICLE_STORAGE)
   62. [WEATHER](#WEATHER)
   63. [SEASONS\_AND\_WEATHER](#SEASONS_AND_WEATHER)
   64. [TEMPERATURE](#TEMPERATURE)
   65. [FORAGING\_MINING](#FORAGING_MINING)
   66. [FORAGING](#FORAGING)
   67. [MINING](#MINING)
   68. [FARMING](#FARMING)
   69. [OPEN\_SEEDS](#OPEN_SEEDS)
   70. [DIG\_FURROW](#DIG_FURROW)
   71. [SOW\_SEEDS](#SOW_SEEDS)
   72. [HARVESTING](#HARVESTING)
   73. [RANCHING](#RANCHING)
   74. [ANIMAL\_ZONE](#ANIMAL_ZONE)
   75. [ANIMAL\_MENU](#ANIMAL_MENU)
   76. [ANIMAL\_UPKEEP](#ANIMAL_UPKEEP)
   77. [ANIMAL\_STRESS](#ANIMAL_STRESS)
   78. [ANIMAL\_ROPE](#ANIMAL_ROPE)
   79. [ANIMAL\_HUTCH](#ANIMAL_HUTCH)
   80. [BUTCHERING](#BUTCHERING)
   81. [PETTING](#PETTING)
   82. [FISHING](#FISHING)
   83. [FISHING\_ZONE](#FISHING_ZONE)
   84. [ADD\_BAIT](#ADD_BAIT)
   85. [CAST\_AND\_CATCH](#CAST_AND_CATCH)
   86. [TRAPPING](#TRAPPING)
   87. [CLEANING](#CLEANING)
   88. [BURN\_CORPSES](#BURN_CORPSES)
   89. [CLEANING\_AREA](#CLEANING_AREA)
   90. [CLEAN\_SELF](#CLEAN_SELF)
   91. [LAUNDRY](#LAUNDRY)
   92. [MULTIPLAYER](#MULTIPLAYER)
   93. [ACTIVATE\_PVP](#ACTIVATE_PVP)
   94. [FACTION\_MENU](#FACTION_MENU)
   95. [MULTIPLAYER\_CHAT](#MULTIPLAYER_CHAT)
   96. [MEDICAL\_CHECK](#MEDICAL_CHECK)
   97. [id](#id)
   98. [title](#title)
   99. [description](#description)
   100. [keys](#keys)
   101. [joypadKeys](#joypadKeys)
   102. [thumbnail](#thumbnail)
   103. [video](#video)
   104. [subCategory](#subCategory)
   105. [categoryImage](#categoryImage)
6. [Constructor Details](#constructor-detail)
   1. [SurvivalGuideEntry(String, String, List, List)](#%3Cinit%3E(java.lang.String,java.lang.String,java.util.List,java.util.List))
7. [Method Details](#method-detail)
   1. [get(ResourceLocation)](#get(zombie.scripting.objects.ResourceLocation))
   2. [getAll()](#getAll())
   3. [getTitle()](#getTitle())
   4. [getDescription()](#getDescription())
   5. [getThumbnail()](#getThumbnail())
   6. [getVideo()](#getVideo())
   7. [getSubCategory()](#getSubCategory())
   8. [getKeys()](#getKeys())
   9. [getJoypadKeys()](#getJoypadKeys())
   10. [getText(boolean)](#getText(boolean))
   11. [getKeyName(String)](#getKeyName(java.lang.String))
   12. [toString()](#toString())
   13. [register(String, String, List, List)](#register(java.lang.String,java.lang.String,java.util.List,java.util.List))
   14. [registerBase(String)](#registerBase(java.lang.String))
   15. [registerBase(String, String)](#registerBase(java.lang.String,java.lang.String))
   16. [registerBase(String, String, List, List)](#registerBase(java.lang.String,java.lang.String,java.util.List,java.util.List))
   17. [register(boolean, String, String, List, List)](#register(boolean,java.lang.String,java.lang.String,java.util.List,java.util.List))
   18. [getCategoryImage()](#getCategoryImage())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SurvivalGuideEntry
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.SurvivalGuideEntry

---

public class SurvivalGuideEntry
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final SurvivalGuideEntry`

  `ACTIVATE_PVP`

  `static final SurvivalGuideEntry`

  `ADD_BAIT`

  `static final SurvivalGuideEntry`

  `ANIMAL_HUTCH`

  `static final SurvivalGuideEntry`

  `ANIMAL_MENU`

  `static final SurvivalGuideEntry`

  `ANIMAL_ROPE`

  `static final SurvivalGuideEntry`

  `ANIMAL_STRESS`

  `static final SurvivalGuideEntry`

  `ANIMAL_UPKEEP`

  `static final SurvivalGuideEntry`

  `ANIMAL_ZONE`

  `static final SurvivalGuideEntry`

  `BAD_GASES`

  `static final SurvivalGuideEntry`

  `BAD_SMELLS`

  `static final SurvivalGuideEntry`

  `BARRICADES`

  `static final SurvivalGuideEntry`

  `BUILD_MENU`

  `static final SurvivalGuideEntry`

  `BUILD_WALLS`

  `static final SurvivalGuideEntry`

  `BURN_CORPSES`

  `static final SurvivalGuideEntry`

  `BUTCHERING`

  `static final SurvivalGuideEntry`

  `CAST_AND_CATCH`

  `private String`

  `categoryImage`

  `static final SurvivalGuideEntry`

  `CHARACTER`

  `static final SurvivalGuideEntry`

  `CLEAN_SELF`

  `static final SurvivalGuideEntry`

  `CLEANING`

  `static final SurvivalGuideEntry`

  `CLEANING_AREA`

  `static final SurvivalGuideEntry`

  `COMBAT`

  `static final SurvivalGuideEntry`

  `COMBAT_EQUIP_PRIMARY`

  `static final SurvivalGuideEntry`

  `COMBAT_MELEE_ATTACK`

  `static final SurvivalGuideEntry`

  `COMBAT_SHOOTING`

  `static final SurvivalGuideEntry`

  `COMBAT_SHOVE`

  `static final SurvivalGuideEntry`

  `COOKING`

  `static final SurvivalGuideEntry`

  `CRAFT_ON_SURFACE`

  `static final SurvivalGuideEntry`

  `CRAFTING`

  `static final SurvivalGuideEntry`

  `CRAFTING_INVENTORY`

  `static final SurvivalGuideEntry`

  `CRAFTING_MENU`

  `static final SurvivalGuideEntry`

  `CRAFTING_STATION`

  `static final SurvivalGuideEntry`

  `CURTAINS`

  `private final String`

  `description`

  `static final SurvivalGuideEntry`

  `DIG_FURROW`

  `static final SurvivalGuideEntry`

  `DOORS`

  `static final SurvivalGuideEntry`

  `EATING_DRINKING`

  `static final SurvivalGuideEntry`

  `EXERCISE`

  `static final SurvivalGuideEntry`

  `FACTION_MENU`

  `static final SurvivalGuideEntry`

  `FARMING`

  `static final SurvivalGuideEntry`

  `FENCE_DEFENSE`

  `static final SurvivalGuideEntry`

  `FIRST_AID`

  `static final SurvivalGuideEntry`

  `FISHING`

  `static final SurvivalGuideEntry`

  `FISHING_ZONE`

  `static final SurvivalGuideEntry`

  `FOOD_AND_WATER`

  `static final SurvivalGuideEntry`

  `FOOD_PREPARATION`

  `static final SurvivalGuideEntry`

  `FORAGING`

  `static final SurvivalGuideEntry`

  `FORAGING_MINING`

  `static final SurvivalGuideEntry`

  `GAS_REFILL`

  `static final SurvivalGuideEntry`

  `HARVESTING`

  `static final SurvivalGuideEntry`

  `HOTBAR`

  `private final String`

  `id`

  `static final SurvivalGuideEntry`

  `INTERACTABLE`

  `static final SurvivalGuideEntry`

  `INVENTORY`

  `static final SurvivalGuideEntry`

  `INVENTORY_BACKPACKS`

  `static final SurvivalGuideEntry`

  `INVENTORY_DOUBLE_CLICK`

  `static final SurvivalGuideEntry`

  `INVENTORY_WEIGHT`

  `private final List<String>`

  `joypadKeys`

  `private final List<String>`

  `keys`

  `static final SurvivalGuideEntry`

  `LAUNDRY`

  `static final SurvivalGuideEntry`

  `LIGHTS`

  `static final SurvivalGuideEntry`

  `LIQUID`

  `static final SurvivalGuideEntry`

  `MAP`

  `static final SurvivalGuideEntry`

  `MECHANICS_MENU`

  `static final SurvivalGuideEntry`

  `MEDICAL_CHECK`

  `static final SurvivalGuideEntry`

  `MINING`

  `static final SurvivalGuideEntry`

  `MOODLES`

  `static final SurvivalGuideEntry`

  `MOVEMENT`

  `static final SurvivalGuideEntry`

  `MOVEMENT_AIMING`

  `static final SurvivalGuideEntry`

  `MOVEMENT_CLIMBING`

  `static final SurvivalGuideEntry`

  `MOVEMENT_SNEAK_FENCE`

  `static final SurvivalGuideEntry`

  `MOVEMENT_STRAFING`

  `static final SurvivalGuideEntry`

  `MOVEMENT_VAULTING`

  `static final SurvivalGuideEntry`

  `MOVEMENT_WALKING_RUNNING`

  `static final SurvivalGuideEntry`

  `MULTIPLAYER`

  `static final SurvivalGuideEntry`

  `MULTIPLAYER_CHAT`

  `static final SurvivalGuideEntry`

  `OPEN_CANS`

  `static final SurvivalGuideEntry`

  `OPEN_SEEDS`

  `static final SurvivalGuideEntry`

  `PETTING`

  `static final SurvivalGuideEntry`

  `RANCHING`

  `static final SurvivalGuideEntry`

  `RELOAD`

  `static final SurvivalGuideEntry`

  `REST`

  `static final SurvivalGuideEntry`

  `RIGHT_CLICK_INTERACT`

  `static final SurvivalGuideEntry`

  `SEASONS_AND_WEATHER`

  `static final SurvivalGuideEntry`

  `SHEET_ROPES`

  `static final SurvivalGuideEntry`

  `SHOUTING`

  `static final SurvivalGuideEntry`

  `SKILL_BOOKS`

  `static final SurvivalGuideEntry`

  `SOW_SEEDS`

  `static final SurvivalGuideEntry`

  `START_VEHICLE`

  `static final SurvivalGuideEntry`

  `STEALTH_KILL`

  `private final String`

  `subCategory`

  `static final SurvivalGuideEntry`

  `TELEVISION`

  `static final SurvivalGuideEntry`

  `TEMPERATURE`

  `private final String`

  `thumbnail`

  `private final String`

  `title`

  `static final SurvivalGuideEntry`

  `TRAILERS`

  `static final SurvivalGuideEntry`

  `TRAPPING`

  `static final SurvivalGuideEntry`

  `TREAT_WATER`

  `static final SurvivalGuideEntry`

  `VEHICLE_RADIAL_MENU`

  `static final SurvivalGuideEntry`

  `VEHICLE_STORAGE`

  `static final SurvivalGuideEntry`

  `VEHICLES`

  `private final String`

  `video`

  `static final SurvivalGuideEntry`

  `WEATHER`

  `static final SurvivalGuideEntry`

  `WINDOWS`

  `static final SurvivalGuideEntry`

  `ZOMBIE_ATTACKS`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SurvivalGuideEntry(String id,
  String subCategory,
  List<String> keys,
  List<String> joypadKeys)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static SurvivalGuideEntry`

  `get(ResourceLocation id)`

  `static List<SurvivalGuideEntry>`

  `getAll()`

  `String`

  `getCategoryImage()`

  `String`

  `getDescription()`

  `List<String>`

  `getJoypadKeys()`

  `private static String`

  `getKeyName(String key)`

  `List<String>`

  `getKeys()`

  `String`

  `getSubCategory()`

  `@Nullable String`

  `getText(boolean hasJoystick)`

  `String`

  `getThumbnail()`

  `String`

  `getTitle()`

  `String`

  `getVideo()`

  `private static SurvivalGuideEntry`

  `register(boolean allowDefaultNamespace,
  String id,
  String subCategory,
  List<String> keys,
  List<String> joypadKeys)`

  `static SurvivalGuideEntry`

  `register(String id,
  String subCategory,
  List<String> keys,
  List<String> joypadKeys)`

  `private static SurvivalGuideEntry`

  `registerBase(String id)`

  `private static SurvivalGuideEntry`

  `registerBase(String id,
  String subCategory)`

  `private static SurvivalGuideEntry`

  `registerBase(String id,
  String subCategory,
  List<String> keys,
  List<String> joypadKeys)`

  the keys invalid input: '&' joypad keys correspond to the %1, %2 etc.

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### MOVEMENT

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MOVEMENT
  + ### MOVEMENT\_WALKING\_RUNNING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MOVEMENT\_WALKING\_RUNNING
  + ### MOVEMENT\_CLIMBING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MOVEMENT\_CLIMBING
  + ### MOVEMENT\_VAULTING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MOVEMENT\_VAULTING
  + ### MOVEMENT\_AIMING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MOVEMENT\_AIMING
  + ### MOVEMENT\_STRAFING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MOVEMENT\_STRAFING
  + ### MOVEMENT\_SNEAK\_FENCE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MOVEMENT\_SNEAK\_FENCE
  + ### INVENTORY

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") INVENTORY
  + ### INVENTORY\_BACKPACKS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") INVENTORY\_BACKPACKS
  + ### INVENTORY\_DOUBLE\_CLICK

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") INVENTORY\_DOUBLE\_CLICK
  + ### INVENTORY\_WEIGHT

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") INVENTORY\_WEIGHT
  + ### INTERACTABLE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") INTERACTABLE
  + ### RIGHT\_CLICK\_INTERACT

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") RIGHT\_CLICK\_INTERACT
  + ### DOORS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") DOORS
  + ### WINDOWS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") WINDOWS
  + ### CURTAINS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CURTAINS
  + ### LIGHTS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") LIGHTS
  + ### MAP

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MAP
  + ### TELEVISION

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") TELEVISION
  + ### BAD\_GASES

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") BAD\_GASES
  + ### COMBAT

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") COMBAT
  + ### COMBAT\_EQUIP\_PRIMARY

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") COMBAT\_EQUIP\_PRIMARY
  + ### COMBAT\_MELEE\_ATTACK

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") COMBAT\_MELEE\_ATTACK
  + ### COMBAT\_SHOVE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") COMBAT\_SHOVE
  + ### STEALTH\_KILL

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") STEALTH\_KILL
  + ### COMBAT\_SHOOTING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") COMBAT\_SHOOTING
  + ### RELOAD

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") RELOAD
  + ### ZOMBIE\_ATTACKS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") ZOMBIE\_ATTACKS
  + ### SHOUTING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") SHOUTING
  + ### HOTBAR

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") HOTBAR
  + ### FENCE\_DEFENSE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FENCE\_DEFENSE
  + ### FOOD\_AND\_WATER

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FOOD\_AND\_WATER
  + ### OPEN\_CANS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") OPEN\_CANS
  + ### FOOD\_PREPARATION

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FOOD\_PREPARATION
  + ### COOKING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") COOKING
  + ### LIQUID

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") LIQUID
  + ### TREAT\_WATER

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") TREAT\_WATER
  + ### CHARACTER

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CHARACTER
  + ### MOODLES

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MOODLES
  + ### EATING\_DRINKING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") EATING\_DRINKING
  + ### FIRST\_AID

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FIRST\_AID
  + ### REST

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") REST
  + ### EXERCISE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") EXERCISE
  + ### SKILL\_BOOKS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") SKILL\_BOOKS
  + ### BAD\_SMELLS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") BAD\_SMELLS
  + ### CRAFTING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CRAFTING
  + ### CRAFTING\_MENU

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CRAFTING\_MENU
  + ### CRAFTING\_INVENTORY

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CRAFTING\_INVENTORY
  + ### CRAFT\_ON\_SURFACE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CRAFT\_ON\_SURFACE
  + ### SHEET\_ROPES

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") SHEET\_ROPES
  + ### BUILD\_MENU

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") BUILD\_MENU
  + ### BARRICADES

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") BARRICADES
  + ### BUILD\_WALLS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") BUILD\_WALLS
  + ### CRAFTING\_STATION

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CRAFTING\_STATION
  + ### VEHICLES

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") VEHICLES
  + ### START\_VEHICLE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") START\_VEHICLE
  + ### VEHICLE\_RADIAL\_MENU

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") VEHICLE\_RADIAL\_MENU
  + ### GAS\_REFILL

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") GAS\_REFILL
  + ### MECHANICS\_MENU

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MECHANICS\_MENU
  + ### TRAILERS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") TRAILERS
  + ### VEHICLE\_STORAGE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") VEHICLE\_STORAGE
  + ### WEATHER

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") WEATHER
  + ### SEASONS\_AND\_WEATHER

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") SEASONS\_AND\_WEATHER
  + ### TEMPERATURE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") TEMPERATURE
  + ### FORAGING\_MINING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FORAGING\_MINING
  + ### FORAGING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FORAGING
  + ### MINING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MINING
  + ### FARMING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FARMING
  + ### OPEN\_SEEDS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") OPEN\_SEEDS
  + ### DIG\_FURROW

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") DIG\_FURROW
  + ### SOW\_SEEDS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") SOW\_SEEDS
  + ### HARVESTING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") HARVESTING
  + ### RANCHING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") RANCHING
  + ### ANIMAL\_ZONE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") ANIMAL\_ZONE
  + ### ANIMAL\_MENU

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") ANIMAL\_MENU
  + ### ANIMAL\_UPKEEP

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") ANIMAL\_UPKEEP
  + ### ANIMAL\_STRESS

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") ANIMAL\_STRESS
  + ### ANIMAL\_ROPE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") ANIMAL\_ROPE
  + ### ANIMAL\_HUTCH

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") ANIMAL\_HUTCH
  + ### BUTCHERING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") BUTCHERING
  + ### PETTING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") PETTING
  + ### FISHING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FISHING
  + ### FISHING\_ZONE

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FISHING\_ZONE
  + ### ADD\_BAIT

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") ADD\_BAIT
  + ### CAST\_AND\_CATCH

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CAST\_AND\_CATCH
  + ### TRAPPING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") TRAPPING
  + ### CLEANING

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CLEANING
  + ### BURN\_CORPSES

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") BURN\_CORPSES
  + ### CLEANING\_AREA

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CLEANING\_AREA
  + ### CLEAN\_SELF

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") CLEAN\_SELF
  + ### LAUNDRY

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") LAUNDRY
  + ### MULTIPLAYER

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MULTIPLAYER
  + ### ACTIVATE\_PVP

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") ACTIVATE\_PVP
  + ### FACTION\_MENU

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") FACTION\_MENU
  + ### MULTIPLAYER\_CHAT

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MULTIPLAYER\_CHAT
  + ### MEDICAL\_CHECK

    public static final [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") MEDICAL\_CHECK
  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### title

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### description

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### keys

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> keys
  + ### joypadKeys

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> joypadKeys
  + ### thumbnail

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") thumbnail
  + ### video

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") video
  + ### subCategory

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subCategory
  + ### categoryImage

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") categoryImage
* Constructor Details
  -------------------

  + ### SurvivalGuideEntry

    private SurvivalGuideEntry([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subCategory,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> keys,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> joypadKeys)
* Method Details
  --------------

  + ### get

    public static [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") get([ResourceLocation](../scripting/objects/ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### getAll

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core")> getAll()
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### getThumbnail

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getThumbnail()
  + ### getVideo

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVideo()
  + ### getSubCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSubCategory()
  + ### getKeys

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getKeys()
  + ### getJoypadKeys

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getJoypadKeys()
  + ### getText

    public @Nullable [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getText(boolean hasJoystick)
  + ### getKeyName

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getKeyName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### register

    public static [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subCategory,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> keys,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> joypadKeys)
  + ### registerBase

    private static [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### registerBase

    private static [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subCategory)
  + ### registerBase

    private static [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") registerBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subCategory,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> keys,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> joypadKeys)

    the keys invalid input: '&' joypad keys correspond to the %1, %2 etc. in SurvivalGuide.json
  + ### register

    private static [SurvivalGuideEntry](SurvivalGuideEntry.html "class in zombie.core") register(boolean allowDefaultNamespace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subCategory,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> keys,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> joypadKeys)
  + ### getCategoryImage

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategoryImage()