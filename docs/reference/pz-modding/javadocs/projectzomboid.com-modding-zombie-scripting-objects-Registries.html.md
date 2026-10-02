[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [Registries](Registries.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [REGISTRY](#REGISTRY)
   2. [BOOTSTRAPS](#BOOTSTRAPS)
   3. [AMMO\_TYPE](#AMMO_TYPE)
   4. [BOOK](#BOOK)
   5. [BOOK\_SUBJECT](#BOOK_SUBJECT)
   6. [BROCHURE](#BROCHURE)
   7. [BUSINESS](#BUSINESS)
   8. [CATALOGUE](#CATALOGUE)
   9. [CHARACTER\_PROFESSION](#CHARACTER_PROFESSION)
   10. [CHARACTER\_TRAIT](#CHARACTER_TRAIT)
   11. [COMIC\_BOOK](#COMIC_BOOK)
   12. [DOODLE](#DOODLE)
   13. [DOODLE\_KIDS](#DOODLE_KIDS)
   14. [FLIER](#FLIER)
   15. [GAME\_MODE](#GAME_MODE)
   16. [LETTER](#LETTER)
   17. [LOCKET](#LOCKET)
   18. [TILE\_PROPERTY\_KEY](#TILE_PROPERTY_KEY)
   19. [ITEM\_BODY\_LOCATION](#ITEM_BODY_LOCATION)
   20. [ITEM\_TAG](#ITEM_TAG)
   21. [ITEM\_TYPE](#ITEM_TYPE)
   22. [JOB](#JOB)
   23. [MAGAZINE](#MAGAZINE)
   24. [MAGAZINE\_SUBJECT](#MAGAZINE_SUBJECT)
   25. [META\_RECIPE](#META_RECIPE)
   26. [MOODLE\_TYPE](#MOODLE_TYPE)
   27. [NEWSPAPER](#NEWSPAPER)
   28. [OLD\_NEWSPAPER](#OLD_NEWSPAPER)
   29. [PET\_NAME](#PET_NAME)
   30. [PHOTO](#PHOTO)
   31. [POSTCARD](#POSTCARD)
   32. [RPG\_MANUAL](#RPG_MANUAL)
   33. [SEASON\_RECIPE](#SEASON_RECIPE)
   34. [SOUND\_KEY](#SOUND_KEY)
   35. [SURVIVAL\_GUIDE\_ENTRY](#SURVIVAL_GUIDE_ENTRY)
   36. [WEAPON\_CATEGORY](#WEAPON_CATEGORY)
   37. [CONTAINER\_TYPE](#CONTAINER_TYPE)
6. [Constructor Details](#constructor-detail)
   1. [Registries()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [register(String, Supplier)](#register(java.lang.String,java.util.function.Supplier))
   2. [getAllRecipeRegistries()](#getAllRecipeRegistries())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Registries
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.Registries

---

public class Registries
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final Registry<AmmoType>`

  `AMMO_TYPE`

  `static final Registry<zombie.scripting.objects.Book>`

  `BOOK`

  `static final Registry<zombie.scripting.objects.BookSubject>`

  `BOOK_SUBJECT`

  `private static final List<Supplier<?>>`

  `BOOTSTRAPS`

  `static final Registry<Brochure>`

  `BROCHURE`

  `static final Registry<zombie.scripting.objects.Business>`

  `BUSINESS`

  `static final Registry<zombie.scripting.objects.Catalogue>`

  `CATALOGUE`

  `static final Registry<CharacterProfession>`

  `CHARACTER_PROFESSION`

  `static final Registry<CharacterTrait>`

  `CHARACTER_TRAIT`

  `static final Registry<zombie.scripting.objects.ComicBook>`

  `COMIC_BOOK`

  `static final Registry<zombie.scripting.objects.ContainerType>`

  `CONTAINER_TYPE`

  `static final Registry<zombie.scripting.objects.Doodle>`

  `DOODLE`

  `static final Registry<zombie.scripting.objects.DoodleKids>`

  `DOODLE_KIDS`

  `static final Registry<Flier>`

  `FLIER`

  `static final Registry<GameMode>`

  `GAME_MODE`

  `static final Registry<ItemBodyLocation>`

  `ITEM_BODY_LOCATION`

  `static final Registry<ItemTag>`

  `ITEM_TAG`

  `static final Registry<ItemType>`

  `ITEM_TYPE`

  `static final Registry<zombie.scripting.objects.Job>`

  `JOB`

  `static final Registry<zombie.scripting.objects.Letter>`

  `LETTER`

  `static final Registry<zombie.scripting.objects.Locket>`

  `LOCKET`

  `static final Registry<zombie.scripting.objects.Magazine>`

  `MAGAZINE`

  `static final Registry<zombie.scripting.objects.MagazineSubject>`

  `MAGAZINE_SUBJECT`

  `static final Registry<MetaRecipe>`

  `META_RECIPE`

  `static final Registry<MoodleType>`

  `MOODLE_TYPE`

  `static final Registry<Newspaper>`

  `NEWSPAPER`

  `static final Registry<OldNewspaper>`

  `OLD_NEWSPAPER`

  `static final Registry<zombie.scripting.objects.PetName>`

  `PET_NAME`

  `static final Registry<zombie.scripting.objects.Photo>`

  `PHOTO`

  `static final Registry<zombie.scripting.objects.Postcard>`

  `POSTCARD`

  `static final Registry<Registry<?>>`

  `REGISTRY`

  `static final Registry<zombie.scripting.objects.RpgManual>`

  `RPG_MANUAL`

  `static final Registry<SeasonRecipe>`

  `SEASON_RECIPE`

  `static final Registry<SoundKey>`

  `SOUND_KEY`

  `static final Registry<SurvivalGuideEntry>`

  `SURVIVAL_GUIDE_ENTRY`

  `static final Registry<TilePropertyKey>`

  `TILE_PROPERTY_KEY`

  `static final Registry<WeaponCategory>`

  `WEAPON_CATEGORY`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Registries()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static List<Registry<? extends RecipeKey>>`

  `getAllRecipeRegistries()`

  `static <T> Registry<T>`

  `register(String name,
  Supplier<T> bootstrap)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### REGISTRY

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[Registry](Registry.html "class in zombie.scripting.objects")<?>> REGISTRY
  + ### BOOTSTRAPS

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Supplier](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Supplier.html "class or interface in java.util.function")<?>> BOOTSTRAPS
  + ### AMMO\_TYPE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[AmmoType](AmmoType.html "class in zombie.scripting.objects")> AMMO\_TYPE
  + ### BOOK

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Book> BOOK
  + ### BOOK\_SUBJECT

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.BookSubject> BOOK\_SUBJECT
  + ### BROCHURE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[Brochure](Brochure.html "class in zombie.scripting.objects")> BROCHURE
  + ### BUSINESS

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Business> BUSINESS
  + ### CATALOGUE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Catalogue> CATALOGUE
  + ### CHARACTER\_PROFESSION

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[CharacterProfession](CharacterProfession.html "class in zombie.scripting.objects")> CHARACTER\_PROFESSION
  + ### CHARACTER\_TRAIT

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[CharacterTrait](CharacterTrait.html "class in zombie.scripting.objects")> CHARACTER\_TRAIT
  + ### COMIC\_BOOK

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.ComicBook> COMIC\_BOOK
  + ### DOODLE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Doodle> DOODLE
  + ### DOODLE\_KIDS

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.DoodleKids> DOODLE\_KIDS
  + ### FLIER

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[Flier](Flier.html "class in zombie.scripting.objects")> FLIER
  + ### GAME\_MODE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[GameMode](../../core/GameMode.html "class in zombie.core")> GAME\_MODE
  + ### LETTER

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Letter> LETTER
  + ### LOCKET

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Locket> LOCKET
  + ### TILE\_PROPERTY\_KEY

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[TilePropertyKey](../../core/properties/TilePropertyKey.html "class in zombie.core.properties")> TILE\_PROPERTY\_KEY
  + ### ITEM\_BODY\_LOCATION

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[ItemBodyLocation](ItemBodyLocation.html "class in zombie.scripting.objects")> ITEM\_BODY\_LOCATION
  + ### ITEM\_TAG

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[ItemTag](ItemTag.html "class in zombie.scripting.objects")> ITEM\_TAG
  + ### ITEM\_TYPE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[ItemType](ItemType.html "class in zombie.scripting.objects")> ITEM\_TYPE
  + ### JOB

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Job> JOB
  + ### MAGAZINE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Magazine> MAGAZINE
  + ### MAGAZINE\_SUBJECT

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.MagazineSubject> MAGAZINE\_SUBJECT
  + ### META\_RECIPE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[MetaRecipe](MetaRecipe.html "class in zombie.scripting.objects")> META\_RECIPE
  + ### MOODLE\_TYPE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[MoodleType](MoodleType.html "class in zombie.scripting.objects")> MOODLE\_TYPE
  + ### NEWSPAPER

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[Newspaper](Newspaper.html "class in zombie.scripting.objects")> NEWSPAPER
  + ### OLD\_NEWSPAPER

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[OldNewspaper](OldNewspaper.html "class in zombie.scripting.objects")> OLD\_NEWSPAPER
  + ### PET\_NAME

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.PetName> PET\_NAME
  + ### PHOTO

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Photo> PHOTO
  + ### POSTCARD

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.Postcard> POSTCARD
  + ### RPG\_MANUAL

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.RpgManual> RPG\_MANUAL
  + ### SEASON\_RECIPE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[SeasonRecipe](SeasonRecipe.html "class in zombie.scripting.objects")> SEASON\_RECIPE
  + ### SOUND\_KEY

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[SoundKey](SoundKey.html "class in zombie.scripting.objects")> SOUND\_KEY
  + ### SURVIVAL\_GUIDE\_ENTRY

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[SurvivalGuideEntry](../../core/SurvivalGuideEntry.html "class in zombie.core")> SURVIVAL\_GUIDE\_ENTRY
  + ### WEAPON\_CATEGORY

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<[WeaponCategory](WeaponCategory.html "class in zombie.scripting.objects")> WEAPON\_CATEGORY
  + ### CONTAINER\_TYPE

    public static final [Registry](Registry.html "class in zombie.scripting.objects")<zombie.scripting.objects.ContainerType> CONTAINER\_TYPE
* Constructor Details
  -------------------

  + ### Registries

    public Registries()
* Method Details
  --------------

  + ### register

    public static <T> [Registry](Registry.html "class in zombie.scripting.objects")<T> register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [Supplier](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Supplier.html "class or interface in java.util.function")<T> bootstrap)
  + ### getAllRecipeRegistries

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Registry](Registry.html "class in zombie.scripting.objects")<? extends [RecipeKey](RecipeKey.html "interface in zombie.scripting.objects")>> getAllRecipeRegistries()