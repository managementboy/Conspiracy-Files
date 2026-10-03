[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.logic](package-summary.html)
2. [ItemCodeOnCreate](ItemCodeOnCreate.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [COLLECTIBLE\_KEY](#COLLECTIBLE_KEY)
   2. [LITERATURE\_TITLE](#LITERATURE_TITLE)
   3. [PRINT\_MEDIA](#PRINT_MEDIA)
   4. [PRINT\_MEDIA\_INFO](#PRINT_MEDIA_INFO)
   5. [PRINT\_MEDIA\_ID](#PRINT_MEDIA_ID)
   6. [PRINT\_MEDIA\_TITLE](#PRINT_MEDIA_TITLE)
   7. [PRINT\_MEDIA\_TEXT](#PRINT_MEDIA_TEXT)
7. [Constructor Details](#constructor-detail)
   1. [ItemCodeOnCreate()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [scratchTicketWinner(Literature)](#scratchTicketWinner(zombie.inventory.types.Literature))
   2. [onCreateStockCertificate(Literature)](#onCreateStockCertificate(zombie.inventory.types.Literature))
   3. [onCreatePaperwork(Literature)](#onCreatePaperwork(zombie.inventory.types.Literature))
   4. [onCreateMonogram(Clothing)](#onCreateMonogram(zombie.inventory.types.Clothing))
   5. [onCreateIDCard(InventoryItem)](#onCreateIDCard(zombie.inventory.InventoryItem))
   6. [onCreateIDCardFemale(InventoryItem)](#onCreateIDCardFemale(zombie.inventory.InventoryItem))
   7. [onCreateIDCardMale(InventoryItem)](#onCreateIDCardMale(zombie.inventory.InventoryItem))
   8. [onCreateIDCard(InventoryItem, boolean)](#onCreateIDCard(zombie.inventory.InventoryItem,boolean))
   9. [onCreateDogTagPet(InventoryItem)](#onCreateDogTagPet(zombie.inventory.InventoryItem))
   10. [onCreatePhoto(InventoryItem)](#onCreatePhoto(zombie.inventory.InventoryItem))
   11. [onCreateSecretPhoto(InventoryItem)](#onCreateSecretPhoto(zombie.inventory.InventoryItem))
   12. [onCreateRacyPhoto(InventoryItem)](#onCreateRacyPhoto(zombie.inventory.InventoryItem))
   13. [onCreateVeryOldPhoto(InventoryItem)](#onCreateVeryOldPhoto(zombie.inventory.InventoryItem))
   14. [onCreatePhoto(InventoryItem, String, String)](#onCreatePhoto(zombie.inventory.InventoryItem,java.lang.String,java.lang.String))
   15. [onCreateHottieZ(InventoryItem)](#onCreateHottieZ(zombie.inventory.InventoryItem))
   16. [setMagazineName(InventoryItem, String, String, RecipeCodeHelper.DateResult)](#setMagazineName(zombie.inventory.InventoryItem,java.lang.String,java.lang.String,zombie.scripting.logic.RecipeCodeHelper.DateResult))
   17. [getDate(InventoryItem, int)](#getDate(zombie.inventory.InventoryItem,int))
   18. [onCreateOldNewspaper(InventoryItem)](#onCreateOldNewspaper(zombie.inventory.InventoryItem))
   19. [onCreateTVMagazine(InventoryItem)](#onCreateTVMagazine(zombie.inventory.InventoryItem))
   20. [onCreateBrochure(InventoryItem)](#onCreateBrochure(zombie.inventory.InventoryItem))
   21. [onCreateFlier(InventoryItem)](#onCreateFlier(zombie.inventory.InventoryItem))
   22. [onCreateFlierNolan(InventoryItem)](#onCreateFlierNolan(zombie.inventory.InventoryItem))
   23. [setFlierName(String, String, String, String, InventoryItem)](#setFlierName(java.lang.String,java.lang.String,java.lang.String,java.lang.String,zombie.inventory.InventoryItem))
   24. [setMediaName(InventoryItem, String, String, Object)](#setMediaName(zombie.inventory.InventoryItem,java.lang.String,java.lang.String,java.lang.Object))
   25. [onCreateComicBook(InventoryItem)](#onCreateComicBook(zombie.inventory.InventoryItem))
   26. [onCreateComicBookRetail(InventoryItem)](#onCreateComicBookRetail(zombie.inventory.InventoryItem))
   27. [nameComicBook(InventoryItem, ComicBook)](#nameComicBook(zombie.inventory.InventoryItem,zombie.scripting.objects.ComicBook))
   28. [onCreateDispatchNewNewspaper(InventoryItem)](#onCreateDispatchNewNewspaper(zombie.inventory.InventoryItem))
   29. [onCreateHeraldNewNewspaper(InventoryItem)](#onCreateHeraldNewNewspaper(zombie.inventory.InventoryItem))
   30. [onCreateKnewsNewNewspaper(InventoryItem)](#onCreateKnewsNewNewspaper(zombie.inventory.InventoryItem))
   31. [onCreateTimesNewNewspaper(InventoryItem)](#onCreateTimesNewNewspaper(zombie.inventory.InventoryItem))
   32. [onCreateRecentNewspaper(InventoryItem)](#onCreateRecentNewspaper(zombie.inventory.InventoryItem))
   33. [onCreateSubjectBook(InventoryItem)](#onCreateSubjectBook(zombie.inventory.InventoryItem))
   34. [onCreateSubjectMagazine(InventoryItem)](#onCreateSubjectMagazine(zombie.inventory.InventoryItem))
   35. [onCreateBusinessCard(InventoryItem)](#onCreateBusinessCard(zombie.inventory.InventoryItem))
   36. [onCreateBusinessCardNolan(InventoryItem)](#onCreateBusinessCardNolan(zombie.inventory.InventoryItem))
   37. [setBusinessCardName(InventoryItem, String)](#setBusinessCardName(zombie.inventory.InventoryItem,java.lang.String))
   38. [onCreateCatalogue(InventoryItem)](#onCreateCatalogue(zombie.inventory.InventoryItem))
   39. [onCreateRpgManual(InventoryItem)](#onCreateRpgManual(zombie.inventory.InventoryItem))
   40. [setLiteratureNameBasic(InventoryItem, String)](#setLiteratureNameBasic(zombie.inventory.InventoryItem,java.lang.String))
   41. [onCreateGenericMail(InventoryItem)](#onCreateGenericMail(zombie.inventory.InventoryItem))
   42. [onCreateLetterHandwritten(InventoryItem)](#onCreateLetterHandwritten(zombie.inventory.InventoryItem))
   43. [onCreateLocket(InventoryItem)](#onCreateLocket(zombie.inventory.InventoryItem))
   44. [onCreateDoodle(InventoryItem)](#onCreateDoodle(zombie.inventory.InventoryItem))
   45. [onCreateDoodleKids(InventoryItem)](#onCreateDoodleKids(zombie.inventory.InventoryItem))
   46. [onCreatePostcard(InventoryItem)](#onCreatePostcard(zombie.inventory.InventoryItem))
   47. [onCreateSnowGlobe(InventoryItem)](#onCreateSnowGlobe(zombie.inventory.InventoryItem))
   48. [onCreateRecipeClipping(Literature)](#onCreateRecipeClipping(zombie.inventory.types.Literature))
   49. [onCreateExplosivesSchematic(Literature)](#onCreateExplosivesSchematic(zombie.inventory.types.Literature))
   50. [onCreateMeleeWeaponSchematic(Literature)](#onCreateMeleeWeaponSchematic(zombie.inventory.types.Literature))
   51. [onCreateBlacksmithToolsSchematic(Literature)](#onCreateBlacksmithToolsSchematic(zombie.inventory.types.Literature))
   52. [onCreateArmorSchematic(Literature)](#onCreateArmorSchematic(zombie.inventory.types.Literature))
   53. [onCreateCookwareSchematic(Literature)](#onCreateCookwareSchematic(zombie.inventory.types.Literature))
   54. [onCreateSurvivalSchematic(Literature)](#onCreateSurvivalSchematic(zombie.inventory.types.Literature))
   55. [onCreateSewingPattern(Literature)](#onCreateSewingPattern(zombie.inventory.types.Literature))
   56. [setSchematicLearnedRecipes(Literature, List, int)](#setSchematicLearnedRecipes(zombie.inventory.types.Literature,java.util.List,int))
   57. [onCreateRecipeMagazine(Literature)](#onCreateRecipeMagazine(zombie.inventory.types.Literature))
   58. [onCreateScarecrow(InventoryItem)](#onCreateScarecrow(zombie.inventory.InventoryItem))
   59. [onCreateSkeletonDisplay(InventoryItem)](#onCreateSkeletonDisplay(zombie.inventory.InventoryItem))
   60. [onCreateGasMask(Clothing)](#onCreateGasMask(zombie.inventory.types.Clothing))
   61. [createFilterForMask(Clothing, String, String)](#createFilterForMask(zombie.inventory.types.Clothing,java.lang.String,java.lang.String))
   62. [onCreateHairDyeBottle(InventoryItem)](#onCreateHairDyeBottle(zombie.inventory.InventoryItem))
   63. [onCreatePopBottle(InventoryItem)](#onCreatePopBottle(zombie.inventory.InventoryItem))
   64. [getColorForFluid(String, Color)](#getColorForFluid(java.lang.String,zombie.core.Color))
   65. [onCreateLipstick(InventoryItem)](#onCreateLipstick(zombie.inventory.InventoryItem))
   66. [onCreateFabricRoll(InventoryItem)](#onCreateFabricRoll(zombie.inventory.InventoryItem))
   67. [onCreateSprayPaint(InventoryItem)](#onCreateSprayPaint(zombie.inventory.InventoryItem))
   68. [onCreateToyPlane(InventoryItem)](#onCreateToyPlane(zombie.inventory.InventoryItem))
   69. [onCreateRandomColor(InventoryItem)](#onCreateRandomColor(zombie.inventory.InventoryItem))
   70. [setCustomColor(InventoryItem, Color)](#setCustomColor(zombie.inventory.InventoryItem,zombie.core.Color))
   71. [onCreateSodaCan(InventoryItem)](#onCreateSodaCan(zombie.inventory.InventoryItem))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ItemCodeOnCreate
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.logic.RecipeCodeHelper

zombie.scripting.logic.ItemCodeOnCreate

---

public class ItemCodeOnCreate
extends zombie.scripting.logic.RecipeCodeHelper

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class zombie.scripting.logic.RecipeCodeHelper

  `zombie.scripting.logic.RecipeCodeHelper.DateResult`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final String`

  `COLLECTIBLE_KEY`

  `static final String`

  `LITERATURE_TITLE`

  `static final String`

  `PRINT_MEDIA`

  `static final String`

  `PRINT_MEDIA_ID`

  `static final String`

  `PRINT_MEDIA_INFO`

  `static final String`

  `PRINT_MEDIA_TEXT`

  `static final String`

  `PRINT_MEDIA_TITLE`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemCodeOnCreate()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `createFilterForMask(Clothing item,
  String filter,
  String modDataType)`

  `private static Color`

  `getColorForFluid(String fluid,
  Color fallback)`

  `private static zombie.scripting.logic.RecipeCodeHelper.DateResult`

  `getDate(InventoryItem item,
  int minYear)`

  `private static void`

  `nameComicBook(InventoryItem item,
  zombie.scripting.objects.ComicBook comicBook)`

  `static void`

  `onCreateArmorSchematic(Literature item)`

  `static void`

  `onCreateBlacksmithToolsSchematic(Literature item)`

  `static void`

  `onCreateBrochure(InventoryItem item)`

  `static void`

  `onCreateBusinessCard(InventoryItem item)`

  `static void`

  `onCreateBusinessCardNolan(InventoryItem item)`

  `static void`

  `onCreateCatalogue(InventoryItem item)`

  `static void`

  `onCreateComicBook(InventoryItem item)`

  `static void`

  `onCreateComicBookRetail(InventoryItem item)`

  `static void`

  `onCreateCookwareSchematic(Literature item)`

  `static void`

  `onCreateDispatchNewNewspaper(InventoryItem item)`

  `static void`

  `onCreateDogTagPet(InventoryItem item)`

  `static void`

  `onCreateDoodle(InventoryItem item)`

  `static void`

  `onCreateDoodleKids(InventoryItem item)`

  `static void`

  `onCreateExplosivesSchematic(Literature item)`

  `static void`

  `onCreateFabricRoll(InventoryItem item)`

  `static void`

  `onCreateFlier(InventoryItem item)`

  `static void`

  `onCreateFlierNolan(InventoryItem item)`

  `static void`

  `onCreateGasMask(Clothing item)`

  `static void`

  `onCreateGenericMail(InventoryItem item)`

  `static void`

  `onCreateHairDyeBottle(InventoryItem item)`

  `static void`

  `onCreateHeraldNewNewspaper(InventoryItem item)`

  `static void`

  `onCreateHottieZ(InventoryItem item)`

  `static void`

  `onCreateIDCard(InventoryItem item)`

  `private static void`

  `onCreateIDCard(InventoryItem item,
  boolean female)`

  `static void`

  `onCreateIDCardFemale(InventoryItem item)`

  `static void`

  `onCreateIDCardMale(InventoryItem item)`

  `static void`

  `onCreateKnewsNewNewspaper(InventoryItem item)`

  `static void`

  `onCreateLetterHandwritten(InventoryItem item)`

  `static void`

  `onCreateLipstick(InventoryItem item)`

  `static void`

  `onCreateLocket(InventoryItem item)`

  `static void`

  `onCreateMeleeWeaponSchematic(Literature item)`

  `static void`

  `onCreateMonogram(Clothing item)`

  `static void`

  `onCreateOldNewspaper(InventoryItem item)`

  `static void`

  `onCreatePaperwork(Literature item)`

  `static void`

  `onCreatePhoto(InventoryItem item)`

  `private static void`

  `onCreatePhoto(InventoryItem item,
  String type,
  String translationKey)`

  `static void`

  `onCreatePopBottle(InventoryItem item)`

  `static void`

  `onCreatePostcard(InventoryItem item)`

  `static void`

  `onCreateRacyPhoto(InventoryItem item)`

  `static void`

  `onCreateRandomColor(InventoryItem item)`

  `static void`

  `onCreateRecentNewspaper(InventoryItem item)`

  `static void`

  `onCreateRecipeClipping(Literature item)`

  `static void`

  `onCreateRecipeMagazine(Literature item)`

  `static void`

  `onCreateRpgManual(InventoryItem item)`

  `static void`

  `onCreateScarecrow(InventoryItem item)`

  `static void`

  `onCreateSecretPhoto(InventoryItem item)`

  `static void`

  `onCreateSewingPattern(Literature item)`

  `static void`

  `onCreateSkeletonDisplay(InventoryItem item)`

  `static void`

  `onCreateSnowGlobe(InventoryItem item)`

  `static void`

  `onCreateSodaCan(InventoryItem item)`

  `static void`

  `onCreateSprayPaint(InventoryItem item)`

  `static void`

  `onCreateStockCertificate(Literature item)`

  `static void`

  `onCreateSubjectBook(InventoryItem item)`

  `static void`

  `onCreateSubjectMagazine(InventoryItem item)`

  `static void`

  `onCreateSurvivalSchematic(Literature item)`

  `static void`

  `onCreateTimesNewNewspaper(InventoryItem item)`

  `static void`

  `onCreateToyPlane(InventoryItem item)`

  `static void`

  `onCreateTVMagazine(InventoryItem item)`

  `static void`

  `onCreateVeryOldPhoto(InventoryItem item)`

  `static void`

  `scratchTicketWinner(Literature item)`

  `private static void`

  `setBusinessCardName(InventoryItem item,
  String job)`

  `private static void`

  `setCustomColor(InventoryItem item,
  Color color)`

  `private static void`

  `setFlierName(String mediaId,
  String mediaTitle,
  String mediaInfo,
  String printText,
  InventoryItem item)`

  `private static void`

  `setLiteratureNameBasic(InventoryItem item,
  String translationKey)`

  `private static void`

  `setMagazineName(InventoryItem item,
  String type,
  String name,
  zombie.scripting.logic.RecipeCodeHelper.DateResult dateResult)`

  `private static void`

  `setMediaName(InventoryItem item,
  String mediaName,
  String modDataKey,
  Object modDataValue)`

  `private static void`

  `setSchematicLearnedRecipes(Literature item,
  List<CraftRecipeKey> list,
  int multipleChance)`

  ### Methods inherited from class zombie.scripting.logic.RecipeCodeHelper

  `addItemToCharacterInventory, addItemToCharacterInventory, addItemToCharacterInventory, getConsumedItems, getConsumedItems, getConsumedItems, getCreatedItems, getCreatedItems, getInputItems, getKeepItems, getKeepItems, getKeepItems, nameNewspaper, removeItemFromCharacterInventory, removeItemFromCharacterInventory, removeItemFromCharacterInventory, scratchTicketWinner, setColor, setPrintMediaInfo`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### COLLECTIBLE\_KEY

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") COLLECTIBLE\_KEY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.logic.ItemCodeOnCreate.COLLECTIBLE_KEY)
  + ### LITERATURE\_TITLE

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") LITERATURE\_TITLE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.logic.ItemCodeOnCreate.LITERATURE_TITLE)
  + ### PRINT\_MEDIA

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") PRINT\_MEDIA

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.logic.ItemCodeOnCreate.PRINT_MEDIA)
  + ### PRINT\_MEDIA\_INFO

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") PRINT\_MEDIA\_INFO

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.logic.ItemCodeOnCreate.PRINT_MEDIA_INFO)
  + ### PRINT\_MEDIA\_ID

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") PRINT\_MEDIA\_ID

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.logic.ItemCodeOnCreate.PRINT_MEDIA_ID)
  + ### PRINT\_MEDIA\_TITLE

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") PRINT\_MEDIA\_TITLE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.logic.ItemCodeOnCreate.PRINT_MEDIA_TITLE)
  + ### PRINT\_MEDIA\_TEXT

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") PRINT\_MEDIA\_TEXT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.logic.ItemCodeOnCreate.PRINT_MEDIA_TEXT)
* Constructor Details
  -------------------

  + ### ItemCodeOnCreate

    public ItemCodeOnCreate()
* Method Details
  --------------

  + ### scratchTicketWinner

    public static void scratchTicketWinner([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateStockCertificate

    public static void onCreateStockCertificate([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreatePaperwork

    public static void onCreatePaperwork([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateMonogram

    public static void onCreateMonogram([Clothing](../../inventory/types/Clothing.html "class in zombie.inventory.types") item)
  + ### onCreateIDCard

    public static void onCreateIDCard([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateIDCardFemale

    public static void onCreateIDCardFemale([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateIDCardMale

    public static void onCreateIDCardMale([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateIDCard

    private static void onCreateIDCard([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean female)
  + ### onCreateDogTagPet

    public static void onCreateDogTagPet([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreatePhoto

    public static void onCreatePhoto([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateSecretPhoto

    public static void onCreateSecretPhoto([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateRacyPhoto

    public static void onCreateRacyPhoto([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateVeryOldPhoto

    public static void onCreateVeryOldPhoto([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreatePhoto

    private static void onCreatePhoto([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationKey)
  + ### onCreateHottieZ

    public static void onCreateHottieZ([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setMagazineName

    private static void setMagazineName([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    zombie.scripting.logic.RecipeCodeHelper.DateResult dateResult)
  + ### getDate

    private static zombie.scripting.logic.RecipeCodeHelper.DateResult getDate([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    int minYear)
  + ### onCreateOldNewspaper

    public static void onCreateOldNewspaper([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateTVMagazine

    public static void onCreateTVMagazine([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateBrochure

    public static void onCreateBrochure([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateFlier

    public static void onCreateFlier([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateFlierNolan

    public static void onCreateFlierNolan([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setFlierName

    private static void setFlierName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mediaId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mediaTitle,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mediaInfo,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") printText,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setMediaName

    private static void setMediaName([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mediaName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modDataKey,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") modDataValue)
  + ### onCreateComicBook

    public static void onCreateComicBook([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateComicBookRetail

    public static void onCreateComicBookRetail([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### nameComicBook

    private static void nameComicBook([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    zombie.scripting.objects.ComicBook comicBook)
  + ### onCreateDispatchNewNewspaper

    public static void onCreateDispatchNewNewspaper([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateHeraldNewNewspaper

    public static void onCreateHeraldNewNewspaper([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateKnewsNewNewspaper

    public static void onCreateKnewsNewNewspaper([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateTimesNewNewspaper

    public static void onCreateTimesNewNewspaper([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateRecentNewspaper

    public static void onCreateRecentNewspaper([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateSubjectBook

    public static void onCreateSubjectBook([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateSubjectMagazine

    public static void onCreateSubjectMagazine([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateBusinessCard

    public static void onCreateBusinessCard([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateBusinessCardNolan

    public static void onCreateBusinessCardNolan([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setBusinessCardName

    private static void setBusinessCardName([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") job)
  + ### onCreateCatalogue

    public static void onCreateCatalogue([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateRpgManual

    public static void onCreateRpgManual([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setLiteratureNameBasic

    private static void setLiteratureNameBasic([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translationKey)
  + ### onCreateGenericMail

    public static void onCreateGenericMail([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateLetterHandwritten

    public static void onCreateLetterHandwritten([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateLocket

    public static void onCreateLocket([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateDoodle

    public static void onCreateDoodle([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateDoodleKids

    public static void onCreateDoodleKids([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreatePostcard

    public static void onCreatePostcard([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateSnowGlobe

    public static void onCreateSnowGlobe([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateRecipeClipping

    public static void onCreateRecipeClipping([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateExplosivesSchematic

    public static void onCreateExplosivesSchematic([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateMeleeWeaponSchematic

    public static void onCreateMeleeWeaponSchematic([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateBlacksmithToolsSchematic

    public static void onCreateBlacksmithToolsSchematic([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateArmorSchematic

    public static void onCreateArmorSchematic([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateCookwareSchematic

    public static void onCreateCookwareSchematic([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateSurvivalSchematic

    public static void onCreateSurvivalSchematic([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateSewingPattern

    public static void onCreateSewingPattern([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### setSchematicLearnedRecipes

    private static void setSchematicLearnedRecipes([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipeKey](../objects/CraftRecipeKey.html "class in zombie.scripting.objects")> list,
    int multipleChance)
  + ### onCreateRecipeMagazine

    public static void onCreateRecipeMagazine([Literature](../../inventory/types/Literature.html "class in zombie.inventory.types") item)
  + ### onCreateScarecrow

    public static void onCreateScarecrow([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateSkeletonDisplay

    public static void onCreateSkeletonDisplay([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateGasMask

    public static void onCreateGasMask([Clothing](../../inventory/types/Clothing.html "class in zombie.inventory.types") item)
  + ### createFilterForMask

    private static void createFilterForMask([Clothing](../../inventory/types/Clothing.html "class in zombie.inventory.types") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modDataType)
  + ### onCreateHairDyeBottle

    public static void onCreateHairDyeBottle([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreatePopBottle

    public static void onCreatePopBottle([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getColorForFluid

    private static [Color](../../core/Color.html "class in zombie.core") getColorForFluid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluid,
    [Color](../../core/Color.html "class in zombie.core") fallback)
  + ### onCreateLipstick

    public static void onCreateLipstick([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateFabricRoll

    public static void onCreateFabricRoll([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateSprayPaint

    public static void onCreateSprayPaint([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateToyPlane

    public static void onCreateToyPlane([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### onCreateRandomColor

    public static void onCreateRandomColor([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### setCustomColor

    private static void setCustomColor([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [Color](../../core/Color.html "class in zombie.core") color)
  + ### onCreateSodaCan

    public static void onCreateSodaCan([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)