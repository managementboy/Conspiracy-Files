[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.professions](package-summary.html)
2. [CharacterProfessionDefinition](CharacterProfessionDefinition.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [characterProfessionDefinitions](#characterProfessionDefinitions)
   2. [characterProfessionType](#characterProfessionType)
   3. [displayName](#displayName)
   4. [cost](#cost)
   5. [description](#description)
   6. [iconPathName](#iconPathName)
   7. [texture](#texture)
   8. [grantedTraits](#grantedTraits)
   9. [grantedRecipes](#grantedRecipes)
   10. [xpBoosts](#xpBoosts)
6. [Constructor Details](#constructor-detail)
   1. [CharacterProfessionDefinition(CharacterProfession, String, int, String, String)](#%3Cinit%3E(zombie.scripting.objects.CharacterProfession,java.lang.String,int,java.lang.String,java.lang.String))
7. [Method Details](#method-detail)
   1. [addCharacterProfessionDefinition(CharacterProfession, String, int, String, String)](#addCharacterProfessionDefinition(zombie.scripting.objects.CharacterProfession,java.lang.String,int,java.lang.String,java.lang.String))
   2. [getProfessions()](#getProfessions())
   3. [getCharacterProfessionDefinition(CharacterProfession)](#getCharacterProfessionDefinition(zombie.scripting.objects.CharacterProfession))
   4. [getType()](#getType())
   5. [getDescription()](#getDescription())
   6. [getCost()](#getCost())
   7. [getTexture()](#getTexture())
   8. [getGrantedTraits()](#getGrantedTraits())
   9. [getGrantedRecipes()](#getGrantedRecipes())
   10. [isGrantedRecipe(String)](#isGrantedRecipe(java.lang.String))
   11. [hasGrantedRecipes()](#hasGrantedRecipes())
   12. [getLabel()](#getLabel())
   13. [getLeftLabel()](#getLeftLabel())
   14. [getRightLabel()](#getRightLabel())
   15. [getUIName()](#getUIName())
   16. [getXpBoosts()](#getXpBoosts())
   17. [setDescription(String)](#setDescription(java.lang.String))
   18. [addGrantedTrait(CharacterTrait)](#addGrantedTrait(zombie.scripting.objects.CharacterTrait))
   19. [addGrantedRecipe(String)](#addGrantedRecipe(java.lang.String))
   20. [addXPBoost(PerkFactory.Perk, int)](#addXPBoost(zombie.characters.skills.PerkFactory.Perk,int))
   21. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class CharacterProfessionDefinition
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.professions.CharacterProfessionDefinition

All Implemented Interfaces:
:   `IListBoxItem`

---

public class CharacterProfessionDefinition
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [IListBoxItem](../../interfaces/IListBoxItem.html "interface in zombie.interfaces")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static Map<CharacterProfession, CharacterProfessionDefinition>`

  `characterProfessionDefinitions`

  `private final CharacterProfession`

  `characterProfessionType`

  `private final int`

  `cost`

  `private String`

  `description`

  `private final String`

  `displayName`

  `private final ArrayList<String>`

  `grantedRecipes`

  `private final ArrayList<CharacterTrait>`

  `grantedTraits`

  `private final String`

  `iconPathName`

  `private Texture`

  `texture`

  `private final HashMap<PerkFactory.Perk, Integer>`

  `xpBoosts`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CharacterProfessionDefinition(CharacterProfession characterProfessionType,
  String name,
  int cost,
  String description,
  String iconPathName)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static CharacterProfessionDefinition`

  `addCharacterProfessionDefinition(CharacterProfession characterProfessionType,
  String name,
  int cost,
  String description,
  String iconPathName)`

  `void`

  `addGrantedRecipe(String recipe)`

  `void`

  `addGrantedTrait(CharacterTrait characterTrait)`

  `void`

  `addXPBoost(PerkFactory.Perk perk,
  int level)`

  `static CharacterProfessionDefinition`

  `getCharacterProfessionDefinition(CharacterProfession characterProfession)`

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

  `static ArrayList<CharacterProfessionDefinition>`

  `getProfessions()`

  `String`

  `getRightLabel()`

  `Texture`

  `getTexture()`

  `CharacterProfession`

  `getType()`

  `String`

  `getUIName()`

  `HashMap<PerkFactory.Perk, Integer>`

  `getXpBoosts()`

  `boolean`

  `hasGrantedRecipes()`

  `boolean`

  `isGrantedRecipe(String recipe)`

  `static void`

  `reset()`

  `void`

  `setDescription(String description)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### characterProfessionDefinitions

    public static [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[CharacterProfession](../../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects"), [CharacterProfessionDefinition](CharacterProfessionDefinition.html "class in zombie.characters.professions")> characterProfessionDefinitions
  + ### characterProfessionType

    private final [CharacterProfession](../../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects") characterProfessionType
  + ### displayName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### cost

    private final int cost
  + ### description

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### iconPathName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") iconPathName
  + ### texture

    private [Texture](../../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### grantedTraits

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> grantedTraits
  + ### grantedRecipes

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> grantedRecipes
  + ### xpBoosts

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[PerkFactory.Perk](../skills/PerkFactory.Perk.html "class in zombie.characters.skills"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> xpBoosts
* Constructor Details
  -------------------

  + ### CharacterProfessionDefinition

    public CharacterProfessionDefinition([CharacterProfession](../../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects") characterProfessionType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int cost,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") iconPathName)
* Method Details
  --------------

  + ### addCharacterProfessionDefinition

    public static [CharacterProfessionDefinition](CharacterProfessionDefinition.html "class in zombie.characters.professions") addCharacterProfessionDefinition([CharacterProfession](../../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects") characterProfessionType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int cost,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") iconPathName)
  + ### getProfessions

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CharacterProfessionDefinition](CharacterProfessionDefinition.html "class in zombie.characters.professions")> getProfessions()
  + ### getCharacterProfessionDefinition

    public static [CharacterProfessionDefinition](CharacterProfessionDefinition.html "class in zombie.characters.professions") getCharacterProfessionDefinition([CharacterProfession](../../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects") characterProfession)
  + ### getType

    public [CharacterProfession](../../scripting/objects/CharacterProfession.html "class in zombie.scripting.objects") getType()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### getCost

    public int getCost()
  + ### getTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### getGrantedTraits

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects")> getGrantedTraits()
  + ### getGrantedRecipes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getGrantedRecipes()
  + ### isGrantedRecipe

    public boolean isGrantedRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
  + ### hasGrantedRecipes

    public boolean hasGrantedRecipes()
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
  + ### getUIName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUIName()
  + ### getXpBoosts

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[PerkFactory.Perk](../skills/PerkFactory.Perk.html "class in zombie.characters.skills"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> getXpBoosts()
  + ### setDescription

    public void setDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description)
  + ### addGrantedTrait

    public void addGrantedTrait([CharacterTrait](../../scripting/objects/CharacterTrait.html "class in zombie.scripting.objects") characterTrait)
  + ### addGrantedRecipe

    public void addGrantedRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe)
  + ### addXPBoost

    public void addXPBoost([PerkFactory.Perk](../skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    int level)
  + ### reset

    public static void reset()