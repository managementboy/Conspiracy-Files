[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [SurvivorDesc](SurvivorDesc.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [idCount](#idCount)
   2. [TrouserCommonColors](#TrouserCommonColors)
   3. [HairCommonColors](#HairCommonColors)
   4. [humanVisual](#humanVisual)
   5. [wornItems](#wornItems)
   6. [group](#group)
   7. [xpBoostMap](#xpBoostMap)
   8. [characterProfession](#characterProfession)
   9. [forename](#forename)
   10. [id](#id)
   11. [instance](#instance)
   12. [characterGender](#characterGender)
   13. [surname](#surname)
   14. [inventoryScript](#inventoryScript)
   15. [torso](#torso)
   16. [metCount](#metCount)
   17. [bravery](#bravery)
   18. [loner](#loner)
   19. [aggressiveness](#aggressiveness)
   20. [compassion](#compassion)
   21. [temper](#temper)
   22. [friendliness](#friendliness)
   23. [favourindoors](#favourindoors)
   24. [loyalty](#loyalty)
   25. [extra](#extra)
   26. [observations](#observations)
   27. [type](#type)
   28. [voicePrefix](#voicePrefix)
   29. [voicePitch](#voicePitch)
   30. [voiceType](#voiceType)
   31. [dead](#dead)
   32. [metaTable](#metaTable)
6. [Constructor Details](#constructor-detail)
   1. [SurvivorDesc()](#%3Cinit%3E())
   2. [SurvivorDesc(boolean)](#%3Cinit%3E(boolean))
   3. [SurvivorDesc(SurvivorDesc)](#%3Cinit%3E(zombie.characters.SurvivorDesc))
7. [Method Details](#method-detail)
   1. [getHumanVisual()](#getHumanVisual())
   2. [getItemVisuals(ItemVisuals)](#getItemVisuals(zombie.core.skinnedmodel.visual.ItemVisuals))
   3. [isFemale()](#isFemale())
   4. [isZombie()](#isZombie())
   5. [isSkeleton()](#isSkeleton())
   6. [getWornItems()](#getWornItems())
   7. [setWornItem(ItemBodyLocation, InventoryItem)](#setWornItem(zombie.scripting.objects.ItemBodyLocation,zombie.inventory.InventoryItem))
   8. [getWornItem(ItemBodyLocation)](#getWornItem(zombie.scripting.objects.ItemBodyLocation))
   9. [dressInNamedOutfit(String)](#dressInNamedOutfit(java.lang.String))
   10. [getVoicePrefix()](#getVoicePrefix())
   11. [setVoicePrefix(String)](#setVoicePrefix(java.lang.String))
   12. [getVoiceType()](#getVoiceType())
   13. [setVoiceType(int)](#setVoiceType(int))
   14. [getVoicePitch()](#getVoicePitch())
   15. [setVoicePitch(float)](#setVoicePitch(float))
   16. [getGroup()](#getGroup())
   17. [isLeader()](#isLeader())
   18. [getIDCount()](#getIDCount())
   19. [setProfessionSkills(CharacterProfessionDefinition)](#setProfessionSkills(zombie.characters.professions.CharacterProfessionDefinition))
   20. [getXPBoostMap()](#getXPBoostMap())
   21. [getMeta()](#getMeta())
   22. [getCalculatedToughness()](#getCalculatedToughness())
   23. [setIDCount(int)](#setIDCount(int))
   24. [isDead()](#isDead())
   25. [setDead(boolean)](#setDead(boolean))
   26. [meet(SurvivorDesc)](#meet(zombie.characters.SurvivorDesc))
   27. [hasObservation(String)](#hasObservation(java.lang.String))
   28. [savePerk(ByteBuffer, PerkFactory.Perk)](#savePerk(java.nio.ByteBuffer,zombie.characters.skills.PerkFactory.Perk))
   29. [loadPerk(ByteBuffer, int)](#loadPerk(java.nio.ByteBuffer,int))
   30. [load(ByteBuffer, int, IsoGameCharacter)](#load(java.nio.ByteBuffer,int,zombie.characters.IsoGameCharacter))
   31. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   32. [getDescription(String)](#getDescription(java.lang.String))
   33. [addObservation(String)](#addObservation(java.lang.String))
   34. [doStats()](#doStats())
   35. [getMetCount(SurvivorDesc)](#getMetCount(zombie.characters.SurvivorDesc))
   36. [getFullname()](#getFullname())
   37. [getForename()](#getForename())
   38. [setForename(String)](#setForename(java.lang.String))
   39. [getID()](#getID())
   40. [setID(int)](#setID(int))
   41. [getInstance()](#getInstance())
   42. [setInstance(IsoGameCharacter)](#setInstance(zombie.characters.IsoGameCharacter))
   43. [getSurname()](#getSurname())
   44. [setSurname(String)](#setSurname(java.lang.String))
   45. [getInventoryScript()](#getInventoryScript())
   46. [setInventoryScript(String)](#setInventoryScript(java.lang.String))
   47. [getTorso()](#getTorso())
   48. [setTorso(String)](#setTorso(java.lang.String))
   49. [getMetCount()](#getMetCount())
   50. [getBravery()](#getBravery())
   51. [setBravery(float)](#setBravery(float))
   52. [getLoner()](#getLoner())
   53. [setLoner(float)](#setLoner(float))
   54. [getAggressiveness()](#getAggressiveness())
   55. [setAggressiveness(float)](#setAggressiveness(float))
   56. [getCompassion()](#getCompassion())
   57. [setCompassion(float)](#setCompassion(float))
   58. [getTemper()](#getTemper())
   59. [setTemper(float)](#setTemper(float))
   60. [getFriendliness()](#getFriendliness())
   61. [setFriendliness(float)](#setFriendliness(float))
   62. [getFavourindoors()](#getFavourindoors())
   63. [setFavourindoors(float)](#setFavourindoors(float))
   64. [getLoyalty()](#getLoyalty())
   65. [setLoyalty(float)](#setLoyalty(float))
   66. [isCharacterProfession(CharacterProfession)](#isCharacterProfession(zombie.scripting.objects.CharacterProfession))
   67. [getCharacterProfession()](#getCharacterProfession())
   68. [setCharacterProfession(CharacterProfession)](#setCharacterProfession(zombie.scripting.objects.CharacterProfession))
   69. [isAggressive()](#isAggressive())
   70. [getObservations()](#getObservations())
   71. [isFriendly()](#isFriendly())
   72. [getType()](#getType())
   73. [setType(SurvivorFactory.SurvivorType)](#setType(zombie.characters.SurvivorFactory.SurvivorType))
   74. [setFemale(boolean)](#setFemale(boolean))
   75. [setCharacterGender(CharacterGender)](#setCharacterGender(zombie.characters.CharacterGender))
   76. [getCharacterGender()](#getCharacterGender())
   77. [getExtras()](#getExtras())
   78. [getCommonHairColor()](#getCommonHairColor())
   79. [addTrouserColor(ColorInfo)](#addTrouserColor(zombie.core.textures.ColorInfo))
   80. [addHairColor(ColorInfo)](#addHairColor(zombie.core.textures.ColorInfo))
   81. [getRandomSkinColor()](#getRandomSkinColor())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SurvivorDesc
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.SurvivorDesc

All Implemented Interfaces:
:   `IHumanVisual`

---

public final class SurvivorDesc
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [IHumanVisual](../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `aggressiveness`

  `private float`

  `bravery`

  `private zombie.characters.CharacterGender`

  `characterGender`

  `private CharacterProfession`

  `characterProfession`

  `private float`

  `compassion`

  `private boolean`

  `dead`

  `private final ArrayList<String>`

  `extra`

  `private float`

  `favourindoors`

  `private String`

  `forename`

  `private float`

  `friendliness`

  `private final zombie.characters.SurvivorGroup`

  `group`

  `static final ArrayList<ImmutableColor>`

  `HairCommonColors`

  `private final HumanVisual`

  `humanVisual`

  `private int`

  `id`

  `private static int`

  `idCount`

  `private IsoGameCharacter`

  `instance`

  `private String`

  `inventoryScript`

  `private float`

  `loner`

  `private float`

  `loyalty`

  `private se.krka.kahlua.vm.KahluaTable`

  `metaTable`

  `private final HashMap<Integer,Integer>`

  `metCount`

  `private final ArrayList<ObservationFactory.Observation>`

  `observations`

  `private String`

  `surname`

  `private float`

  `temper`

  `private String`

  `torso`

  `static final ArrayList<Color>`

  `TrouserCommonColors`

  `private SurvivorFactory.SurvivorType`

  `type`

  `private float`

  `voicePitch`

  `private String`

  `voicePrefix`

  `private int`

  `voiceType`

  `private final WornItems`

  `wornItems`

  `private final HashMap<PerkFactory.Perk, Integer>`

  `xpBoostMap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SurvivorDesc()`

  `SurvivorDesc(boolean bNew)`

  `SurvivorDesc(SurvivorDesc other)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addHairColor(ColorInfo color)`

  `void`

  `addObservation(String obv)`

  `static void`

  `addTrouserColor(ColorInfo color)`

  `private void`

  `doStats()`

  `void`

  `dressInNamedOutfit(String outfitName)`

  `float`

  `getAggressiveness()`

  `float`

  `getBravery()`

  `int`

  `getCalculatedToughness()`

  `zombie.characters.CharacterGender`

  `getCharacterGender()`

  `CharacterProfession`

  `getCharacterProfession()`

  `ArrayList<ImmutableColor>`

  `getCommonHairColor()`

  `float`

  `getCompassion()`

  `String`

  `getDescription(String newStr)`

  `ArrayList<String>`

  `getExtras()`

  `float`

  `getFavourindoors()`

  `String`

  `getForename()`

  `float`

  `getFriendliness()`

  `String`

  `getFullname()`

  `zombie.characters.SurvivorGroup`

  `getGroup()`

  `HumanVisual`

  `getHumanVisual()`

  `int`

  `getID()`

  `static int`

  `getIDCount()`

  `IsoGameCharacter`

  `getInstance()`

  `String`

  `getInventoryScript()`

  `void`

  `getItemVisuals(ItemVisuals itemVisuals)`

  `float`

  `getLoner()`

  `float`

  `getLoyalty()`

  `se.krka.kahlua.vm.KahluaTable`

  `getMeta()`

  `HashMap<Integer,Integer>`

  `getMetCount()`

  `int`

  `getMetCount(SurvivorDesc descriptor)`

  `ArrayList<ObservationFactory.Observation>`

  `getObservations()`

  `static Color`

  `getRandomSkinColor()`

  `String`

  `getSurname()`

  `float`

  `getTemper()`

  `String`

  `getTorso()`

  `SurvivorFactory.SurvivorType`

  `getType()`

  `float`

  `getVoicePitch()`

  `String`

  `getVoicePrefix()`

  `int`

  `getVoiceType()`

  `InventoryItem`

  `getWornItem(ItemBodyLocation itemBodyLocation)`

  `WornItems`

  `getWornItems()`

  `HashMap<PerkFactory.Perk, Integer>`

  `getXPBoostMap()`

  `boolean`

  `hasObservation(String o)`

  `boolean`

  `isAggressive()`

  `boolean`

  `isCharacterProfession(CharacterProfession characterProfession)`

  `boolean`

  `isDead()`

  `boolean`

  `isFemale()`

  `boolean`

  `isFriendly()`

  `boolean`

  `isLeader()`

  `boolean`

  `isSkeleton()`

  `boolean`

  `isZombie()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  IsoGameCharacter chr)`

  `private PerkFactory.Perk`

  `loadPerk(ByteBuffer input,
  int worldVersion)`

  `void`

  `meet(SurvivorDesc desc)`

  `void`

  `save(ByteBuffer output)`

  `private void`

  `savePerk(ByteBuffer output,
  PerkFactory.Perk perk)`

  `void`

  `setAggressiveness(float aggressiveness)`

  `void`

  `setBravery(float bravery)`

  `void`

  `setCharacterGender(zombie.characters.CharacterGender characterGender)`

  `void`

  `setCharacterProfession(CharacterProfession characterProfession)`

  `void`

  `setCompassion(float compassion)`

  `void`

  `setDead(boolean dead)`

  `void`

  `setFavourindoors(float favourindoors)`

  `void`

  `setFemale(boolean bFemale)`

  `void`

  `setForename(String forename)`

  `void`

  `setFriendliness(float friendliness)`

  `void`

  `setID(int id)`

  `static void`

  `setIDCount(int aIDCount)`

  `void`

  `setInstance(IsoGameCharacter instance)`

  `void`

  `setInventoryScript(String inventoryScript)`

  `void`

  `setLoner(float loner)`

  `void`

  `setLoyalty(float loyalty)`

  `void`

  `setProfessionSkills(CharacterProfessionDefinition characterProfessionDefinition)`

  `void`

  `setSurname(String surname)`

  `void`

  `setTemper(float temper)`

  `void`

  `setTorso(String torso)`

  `void`

  `setType(SurvivorFactory.SurvivorType type)`

  `void`

  `setVoicePitch(float voicePitch)`

  `void`

  `setVoicePrefix(String voicePrefix)`

  `void`

  `setVoiceType(int voiceType)`

  `void`

  `setWornItem(ItemBodyLocation itemBodyLocation,
  InventoryItem item)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### idCount

    private static int idCount
  + ### TrouserCommonColors

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Color](../core/Color.html "class in zombie.core")> TrouserCommonColors
  + ### HairCommonColors

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ImmutableColor](../core/ImmutableColor.html "class in zombie.core")> HairCommonColors
  + ### humanVisual

    private final [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual
  + ### wornItems

    private final [WornItems](WornItems/WornItems.html "class in zombie.characters.WornItems") wornItems
  + ### group

    private final zombie.characters.SurvivorGroup group
  + ### xpBoostMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> xpBoostMap
  + ### characterProfession

    private [CharacterProfession](../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects") characterProfession
  + ### forename

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") forename
  + ### id

    private int id
  + ### instance

    private [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") instance
  + ### characterGender

    private zombie.characters.CharacterGender characterGender
  + ### surname

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") surname
  + ### inventoryScript

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inventoryScript
  + ### torso

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") torso
  + ### metCount

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> metCount
  + ### bravery

    private float bravery
  + ### loner

    private float loner
  + ### aggressiveness

    private float aggressiveness
  + ### compassion

    private float compassion
  + ### temper

    private float temper
  + ### friendliness

    private float friendliness
  + ### favourindoors

    private float favourindoors
  + ### loyalty

    private float loyalty
  + ### extra

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> extra
  + ### observations

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ObservationFactory.Observation](traits/ObservationFactory.Observation.html "class in zombie.characters.traits")> observations
  + ### type

    private [SurvivorFactory.SurvivorType](SurvivorFactory.SurvivorType.html "enum class in zombie.characters") type
  + ### voicePrefix

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") voicePrefix
  + ### voicePitch

    private float voicePitch
  + ### voiceType

    private int voiceType
  + ### dead

    private boolean dead
  + ### metaTable

    private se.krka.kahlua.vm.KahluaTable metaTable
* Constructor Details
  -------------------

  + ### SurvivorDesc

    public SurvivorDesc()
  + ### SurvivorDesc

    public SurvivorDesc(boolean bNew)
  + ### SurvivorDesc

    public SurvivorDesc([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") other)
* Method Details
  --------------

  + ### getHumanVisual

    public [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") getHumanVisual()

    Specified by:
    :   `getHumanVisual` in interface `IHumanVisual`
  + ### getItemVisuals

    public void getItemVisuals([ItemVisuals](../core/skinnedmodel/visual/ItemVisuals.html "class in zombie.core.skinnedmodel.visual") itemVisuals)

    Specified by:
    :   `getItemVisuals` in interface `IHumanVisual`
  + ### isFemale

    public boolean isFemale()

    Specified by:
    :   `isFemale` in interface `IHumanVisual`
  + ### isZombie

    public boolean isZombie()

    Specified by:
    :   `isZombie` in interface `IHumanVisual`
  + ### isSkeleton

    public boolean isSkeleton()

    Specified by:
    :   `isSkeleton` in interface `IHumanVisual`
  + ### getWornItems

    public [WornItems](WornItems/WornItems.html "class in zombie.characters.WornItems") getWornItems()
  + ### setWornItem

    public void setWornItem([ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getWornItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") getWornItem([ItemBodyLocation](../scripting/objects/ItemBodyLocation.html "class in zombie.scripting.objects") itemBodyLocation)
  + ### dressInNamedOutfit

    public void dressInNamedOutfit([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName)
  + ### getVoicePrefix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVoicePrefix()
  + ### setVoicePrefix

    public void setVoicePrefix([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") voicePrefix)
  + ### getVoiceType

    public int getVoiceType()
  + ### setVoiceType

    public void setVoiceType(int voiceType)
  + ### getVoicePitch

    public float getVoicePitch()
  + ### setVoicePitch

    public void setVoicePitch(float voicePitch)
  + ### getGroup

    public zombie.characters.SurvivorGroup getGroup()
  + ### isLeader

    public boolean isLeader()
  + ### getIDCount

    public static int getIDCount()
  + ### setProfessionSkills

    public void setProfessionSkills([CharacterProfessionDefinition](professions/CharacterProfessionDefinition.html "class in zombie.characters.professions") characterProfessionDefinition)
  + ### getXPBoostMap

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> getXPBoostMap()
  + ### getMeta

    public se.krka.kahlua.vm.KahluaTable getMeta()
  + ### getCalculatedToughness

    public int getCalculatedToughness()
  + ### setIDCount

    public static void setIDCount(int aIDCount)
  + ### isDead

    public boolean isDead()
  + ### setDead

    public void setDead(boolean dead)
  + ### meet

    public void meet([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") desc)
  + ### hasObservation

    public boolean hasObservation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") o)
  + ### savePerk

    private void savePerk([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadPerk

    private [PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") loadPerk([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newStr)
  + ### addObservation

    public void addObservation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") obv)
  + ### doStats

    private void doStats()
  + ### getMetCount

    public int getMetCount([SurvivorDesc](SurvivorDesc.html "class in zombie.characters") descriptor)
  + ### getFullname

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullname()
  + ### getForename

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getForename()
  + ### setForename

    public void setForename([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") forename)
  + ### getID

    public int getID()
  + ### setID

    public void setID(int id)
  + ### getInstance

    public [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") getInstance()
  + ### setInstance

    public void setInstance([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") instance)
  + ### getSurname

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSurname()
  + ### setSurname

    public void setSurname([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") surname)
  + ### getInventoryScript

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInventoryScript()
  + ### setInventoryScript

    public void setInventoryScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inventoryScript)
  + ### getTorso

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTorso()
  + ### setTorso

    public void setTorso([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") torso)
  + ### getMetCount

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> getMetCount()
  + ### getBravery

    public float getBravery()
  + ### setBravery

    public void setBravery(float bravery)
  + ### getLoner

    public float getLoner()
  + ### setLoner

    public void setLoner(float loner)
  + ### getAggressiveness

    public float getAggressiveness()
  + ### setAggressiveness

    public void setAggressiveness(float aggressiveness)
  + ### getCompassion

    public float getCompassion()
  + ### setCompassion

    public void setCompassion(float compassion)
  + ### getTemper

    public float getTemper()
  + ### setTemper

    public void setTemper(float temper)
  + ### getFriendliness

    public float getFriendliness()
  + ### setFriendliness

    public void setFriendliness(float friendliness)
  + ### getFavourindoors

    public float getFavourindoors()
  + ### setFavourindoors

    public void setFavourindoors(float favourindoors)
  + ### getLoyalty

    public float getLoyalty()
  + ### setLoyalty

    public void setLoyalty(float loyalty)
  + ### isCharacterProfession

    public boolean isCharacterProfession([CharacterProfession](../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects") characterProfession)
  + ### getCharacterProfession

    public [CharacterProfession](../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects") getCharacterProfession()
  + ### setCharacterProfession

    public void setCharacterProfession([CharacterProfession](../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects") characterProfession)
  + ### isAggressive

    public boolean isAggressive()
  + ### getObservations

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ObservationFactory.Observation](traits/ObservationFactory.Observation.html "class in zombie.characters.traits")> getObservations()
  + ### isFriendly

    public boolean isFriendly()
  + ### getType

    public [SurvivorFactory.SurvivorType](SurvivorFactory.SurvivorType.html "enum class in zombie.characters") getType()
  + ### setType

    public void setType([SurvivorFactory.SurvivorType](SurvivorFactory.SurvivorType.html "enum class in zombie.characters") type)
  + ### setFemale

    public void setFemale(boolean bFemale)
  + ### setCharacterGender

    public void setCharacterGender(zombie.characters.CharacterGender characterGender)
  + ### getCharacterGender

    public zombie.characters.CharacterGender getCharacterGender()
  + ### getExtras

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getExtras()
  + ### getCommonHairColor

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ImmutableColor](../core/ImmutableColor.html "class in zombie.core")> getCommonHairColor()
  + ### addTrouserColor

    public static void addTrouserColor([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") color)
  + ### addHairColor

    public static void addHairColor([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") color)
  + ### getRandomSkinColor

    public static [Color](../core/Color.html "class in zombie.core") getRandomSkinColor()