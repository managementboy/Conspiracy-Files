[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.traits](package-summary.html)
2. [CharacterTraitDefinition](CharacterTraitDefinition.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [characterTraitDefinitions](#characterTraitDefinitions)
   2. [characterTraitType](#characterTraitType)
   3. [displayName](#displayName)
   4. [cost](#cost)
   5. [description](#description)
   6. [isProfessionTrait](#isProfessionTrait)
   7. [texture](#texture)
   8. [disabledInMultiplayer](#disabledInMultiplayer)
   9. [grantedTraits](#grantedTraits)
   10. [grantedRecipes](#grantedRecipes)
   11. [mutuallyExclusiveTraits](#mutuallyExclusiveTraits)
   12. [xpBoosts](#xpBoosts)
6. [Constructor Details](#constructor-detail)
   1. [CharacterTraitDefinition(CharacterTrait, String, int, String, boolean, boolean)](#%3Cinit%3E(zombie.scripting.objects.CharacterTrait,java.lang.String,int,java.lang.String,boolean,boolean))
7. [Method Details](#method-detail)
   1. [addCharacterTraitDefinition(CharacterTrait, String, int, String, boolean)](#addCharacterTraitDefinition(zombie.scripting.objects.CharacterTrait,java.lang.String,int,java.lang.String,boolean))
   2. [addCharacterTraitDefinition(CharacterTrait, String, int, String, boolean, boolean)](#addCharacterTraitDefinition(zombie.scripting.objects.CharacterTrait,java.lang.String,int,java.lang.String,boolean,boolean))
   3. [reset()](#reset())
   4. [getTraits()](#getTraits())
   5. [getCharacterTraitDefinition(CharacterTrait)](#getCharacterTraitDefinition(zombie.scripting.objects.CharacterTrait))
   6. [setMutualExclusive(CharacterTrait, CharacterTrait)](#setMutualExclusive(zombie.scripting.objects.CharacterTrait,zombie.scripting.objects.CharacterTrait))
   7. [getType()](#getType())
   8. [getUIName()](#getUIName())
   9. [getTexture()](#getTexture())
   10. [getCost()](#getCost())
   11. [isFree()](#isFree())
   12. [getDescription()](#getDescription())
   13. [isDisabledInMultiplayer()](#isDisabledInMultiplayer())
   14. [getGrantedTraits()](#getGrantedTraits())
   15. [getGrantedRecipes()](#getGrantedRecipes())
   16. [isGrantedRecipe(String)](#isGrantedRecipe(java.lang.String))
   17. [hasGrantedRecipes()](#hasGrantedRecipes())
   18. [getMutuallyExclusiveTraits()](#getMutuallyExclusiveTraits())
   19. [getXpBoosts()](#getXpBoosts())
   20. [getLabel()](#getLabel())
   21. [getLeftLabel()](#getLeftLabel())
   22. [getRightLabel()](#getRightLabel())
   23. [setDescription(String)](#setDescription(java.lang.String))
   24. [setDisabledInMultiplayer(boolean)](#setDisabledInMultiplayer(boolean))
   25. [addGrantedTrait(CharacterTrait)](#addGrantedTrait(zombie.scripting.objects.CharacterTrait))
   26. [addGrantedRecipe(String)](#addGrantedRecipe(java.lang.String))
   27. [addXPBoost(PerkFactory.Perk, int)](#addXPBoost(zombie.characters.skills.PerkFactory.Perk,int))
   28. [addMutuallyExclusive(CharacterTrait)](#addMutuallyExclusive(zombie.scripting.objects.CharacterTrait))
   29. [hasMutuallyExclusiveTraits()](#hasMutuallyExclusiveTraits())
   30. [isMutuallyExclusive(CharacterTraitDefinition)](#isMutuallyExclusive(zombie.characters.traits.CharacterTraitDefinition))
   31. [updateMutualExclusiveTraits()](#updateMutualExclusiveTraits())
   32. [setTexture(Texture)](#setTexture(zombie.core.textures.Texture))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class CharacterTraitDefinition
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.traits.CharacterTraitDefinition

All Implemented Interfaces:
:   `IListBoxItem`

---

public class CharacterTraitDefinition
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [IListBoxItem](../../interfaces/IListBoxItem.html "interface in zombie.interfaces")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static Map<CharacterTrait, CharacterTraitDefinition>`

  `characterTraitDefinitions`

  `private final CharacterTrait`

  `characterTraitType`

  `private final int`

  `cost`

  `private String`

  `description`

  `private boolean`

  `disabledInMultiplayer`

  `private final String`

  `displayName`

  `private final ArrayList<String>`

  `grantedRecipes`

  `private final ArrayList<CharacterTrait>`

  `grantedTraits`

  `private final boolean`

  `isProfessionTrait`

  `private final ArrayList<CharacterTrait>`

  `mutuallyExclusiveTraits`

  `private Texture`

  `texture`

  `private final HashMap<PerkFactory.Perk, Integer>`

  `xpBoosts`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CharacterTraitDefinition(CharacterTrait characterTraitType,
  String name,
  int cost,
  String description,
  boolean isProfessionTrait,
  boolean disabledInMultiplayer)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static CharacterTraitDefinition`

  `addCharacterTraitDefinition(CharacterTrait characterTraitType,
  String name,
  int cost,
  String description,
  boolean profession)`

  `static CharacterTraitDefinition`

  `addCharacterTraitDefinition(CharacterTrait characterTraitType,
  String name,
  int cost,
  String description,
  boolean profession,
  boolean disabledInMultiplayer)`

  `void`

  `addGrantedRecipe(String recipe)`

  `void`

  `addGrantedTrait(CharacterTrait characterTrait)`

  `void`

  `addMutuallyExclusive(CharacterTrait characterTrait)`

  `void`

  `addXPBoost(PerkFactory.Perk perk,
  int level)`

  `static CharacterTraitDefinition`

  `getCharacterTraitDefinition(CharacterTrait characterTrait)`

  `int`

  `getCost()`

  `String`

  `getDescription()`

  `ArrayList<String>`

  `getGrantedRecipes()`

  `ArrayList<CharacterTrait>`

  `getGrantedTraits()`

  `String`

  `getLabel()`

  `String`

  `getLeftLabel()`

  `ArrayList<CharacterTrait>`

  `getMutuallyExclusiveTraits()`

  `String`

  `getRightLabel()`

  `Texture`

  `getTexture()`

  `static ArrayList<CharacterTraitDefinition>`

  `getTraits()`

  `CharacterTrait`

  `getType()`

  `String`

  `getUIName()`

  `HashMap<PerkFactory.Perk, Integer>`

  `getXpBoosts()`

  `boolean`

  `hasGrantedRecipes()`

  `boolean`

  `hasMutuallyExclusiveTraits()`

  `boolean`

  `isDisabledInMultiplayer()`

  `boolean`

  `isFree()`

  `boolean`

  `isGrantedRecipe(String recipe)`

  `boolean`

  `isMutuallyExclusive(CharacterTraitDefinition characterTraitDefinition)`

  `static void`

  `reset()`

  `void`

  `setDescription(String description)`

  `void`

  `setDisabledInMultiplayer(boolean disabledInMultiplayer)`

  `static void`

  `setMutualExclusive(CharacterTrait a,
  CharacterTrait b)`

  `void`

  `setTexture(Texture texture)`

  `private void`

  `updateMutualExclusiveTraits()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### characterTraitDefinitions

    public static [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects"), [CharacterTraitDefinition](CharacterTraitDefinition.html "class in zombie.characters.traits")> characterTraitDefinitions
  + ### characterTraitType

    private final [CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTraitType
  + ### displayName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### cost

    private final int cost
  + ### description

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### isProfessionTrait

    private final boolean isProfessionTrait
  + ### texture

    private [Texture](../../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### disabledInMultiplayer

    private boolean disabledInMultiplayer
  + ### grantedTraits

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> grantedTraits
  + ### grantedRecipes

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> grantedRecipes
  + ### mutuallyExclusiveTraits

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> mutuallyExclusiveTraits
  + ### xpBoosts

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[PerkFactory.Perk](../skills/PerkFactory.Perk.html "class in zombie.characters.skills"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> xpBoosts
* Constructor Details
  -------------------

  + ### CharacterTraitDefinition

    public CharacterTraitDefinition([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTraitType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int cost,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description,
    boolean isProfessionTrait,
    boolean disabledInMultiplayer)
* Method Details
  --------------

  + ### addCharacterTraitDefinition

    public static [CharacterTraitDefinition](CharacterTraitDefinition.html "class in zombie.characters.traits") addCharacterTraitDefinition([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTraitType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int cost,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description,
    boolean profession)
  + ### addCharacterTraitDefinition

    public static [CharacterTraitDefinition](CharacterTraitDefinition.html "class in zombie.characters.traits") addCharacterTraitDefinition([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTraitType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int cost,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description,
    boolean profession,
    boolean disabledInMultiplayer)
  + ### reset

    public static void reset()
  + ### getTraits

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CharacterTraitDefinition](CharacterTraitDefinition.html "class in zombie.characters.traits")> getTraits()
  + ### getCharacterTraitDefinition

    public static [CharacterTraitDefinition](CharacterTraitDefinition.html "class in zombie.characters.traits") getCharacterTraitDefinition([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait)
  + ### setMutualExclusive

    public static void setMutualExclusive([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") a,
    [CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") b)
  + ### getType

    public [CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") getType()
  + ### getUIName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUIName()
  + ### getTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### getCost

    public int getCost()
  + ### isFree

    public boolean isFree()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### isDisabledInMultiplayer

    public boolean isDisabledInMultiplayer()
  + ### getGrantedTraits

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> getGrantedTraits()
  + ### getGrantedRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getGrantedRecipes()
  + ### isGrantedRecipe

    public boolean isGrantedRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
  + ### hasGrantedRecipes

    public boolean hasGrantedRecipes()
  + ### getMutuallyExclusiveTraits

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> getMutuallyExclusiveTraits()
  + ### getXpBoosts

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[PerkFactory.Perk](../skills/PerkFactory.Perk.html "class in zombie.characters.skills"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> getXpBoosts()
  + ### getLabel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLabel()

    Specified by:
    :   `getLabel` in interface `IListBoxItem`
  + ### getLeftLabel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLeftLabel()

    Specified by:
    :   `getLeftLabel` in interface `IListBoxItem`
  + ### getRightLabel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRightLabel()

    Specified by:
    :   `getRightLabel` in interface `IListBoxItem`
  + ### setDescription

    public void setDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description)
  + ### setDisabledInMultiplayer

    public void setDisabledInMultiplayer(boolean disabledInMultiplayer)
  + ### addGrantedTrait

    public void addGrantedTrait([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait)
  + ### addGrantedRecipe

    public void addGrantedRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
  + ### addXPBoost

    public void addXPBoost([PerkFactory.Perk](../skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    int level)
  + ### addMutuallyExclusive

    public void addMutuallyExclusive([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait)
  + ### hasMutuallyExclusiveTraits

    public boolean hasMutuallyExclusiveTraits()
  + ### isMutuallyExclusive

    public boolean isMutuallyExclusive([CharacterTraitDefinition](CharacterTraitDefinition.html "class in zombie.characters.traits") characterTraitDefinition)
  + ### updateMutualExclusiveTraits

    private void updateMutualExclusiveTraits()
  + ### setTexture

    public void setTexture([Texture](../../core/textures/Texture.html "class in zombie.core.textures") texture)