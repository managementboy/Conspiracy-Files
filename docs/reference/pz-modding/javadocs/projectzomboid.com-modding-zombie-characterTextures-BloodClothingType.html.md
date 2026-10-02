[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characterTextures](package-summary.html)
2. [BloodClothingType](BloodClothingType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Apron](#Apron)
   2. [ShirtNoSleeves](#ShirtNoSleeves)
   3. [JumperNoSleeves](#JumperNoSleeves)
   4. [Shirt](#Shirt)
   5. [ShirtLongSleeves](#ShirtLongSleeves)
   6. [Jumper](#Jumper)
   7. [Jacket](#Jacket)
   8. [LongJacket](#LongJacket)
   9. [ShortsShort](#ShortsShort)
   10. [Trousers](#Trousers)
   11. [Shoes](#Shoes)
   12. [FullHelmet](#FullHelmet)
   13. [Bag](#Bag)
   14. [Hands](#Hands)
   15. [Head](#Head)
   16. [Neck](#Neck)
   17. [Groin](#Groin)
   18. [UpperBody](#UpperBody)
   19. [LowerBody](#LowerBody)
   20. [LowerLegs](#LowerLegs)
   21. [UpperLegs](#UpperLegs)
   22. [LowerArms](#LowerArms)
   23. [UpperArms](#UpperArms)
   24. [Hand\_L](#Hand_L)
   25. [Hand\_R](#Hand_R)
   26. [ForeArm\_L](#ForeArm_L)
   27. [ForeArm\_R](#ForeArm_R)
   28. [UpperArm\_L](#UpperArm_L)
   29. [UpperArm\_R](#UpperArm_R)
   30. [UpperLeg\_L](#UpperLeg_L)
   31. [UpperLeg\_R](#UpperLeg_R)
   32. [LowerLeg\_L](#LowerLeg_L)
   33. [LowerLeg\_R](#LowerLeg_R)
   34. [Foot\_L](#Foot_L)
   35. [Foot\_R](#Foot_R)
8. [Field Details](#field-detail)
   1. [VALUES](#VALUES)
   2. [BY\_NAME](#BY_NAME)
   3. [coveredParts](#coveredParts)
   4. [bodyParts](#bodyParts)
9. [Constructor Details](#constructor-detail)
   1. [BloodClothingType(BloodBodyPartType...)](#%3Cinit%3E(zombie.characterTextures.BloodBodyPartType...))
   2. [BloodClothingType(BloodClothingType, BloodBodyPartType...)](#%3Cinit%3E(zombie.characterTextures.BloodClothingType,zombie.characterTextures.BloodBodyPartType...))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [fromString(String)](#fromString(java.lang.String))
    4. [getCoveredParts(ArrayList)](#getCoveredParts(java.util.ArrayList))
    5. [getCoveredParts(ArrayList, ArrayList)](#getCoveredParts(java.util.ArrayList,java.util.ArrayList))
    6. [getCoveredPartCount(ArrayList)](#getCoveredPartCount(java.util.ArrayList))
    7. [addBlood(int, HumanVisual, ArrayList, boolean)](#addBlood(int,zombie.core.skinnedmodel.visual.HumanVisual,java.util.ArrayList,boolean))
    8. [addBlood(BloodBodyPartType, HumanVisual, ArrayList, boolean)](#addBlood(zombie.characterTextures.BloodBodyPartType,zombie.core.skinnedmodel.visual.HumanVisual,java.util.ArrayList,boolean))
    9. [addDirt(BloodBodyPartType, HumanVisual, ArrayList, boolean)](#addDirt(zombie.characterTextures.BloodBodyPartType,zombie.core.skinnedmodel.visual.HumanVisual,java.util.ArrayList,boolean))
    10. [addHole(BloodBodyPartType, HumanVisual, ArrayList)](#addHole(zombie.characterTextures.BloodBodyPartType,zombie.core.skinnedmodel.visual.HumanVisual,java.util.ArrayList))
    11. [addHole(BloodBodyPartType, HumanVisual, ArrayList, boolean)](#addHole(zombie.characterTextures.BloodBodyPartType,zombie.core.skinnedmodel.visual.HumanVisual,java.util.ArrayList,boolean))
    12. [addBasicPatch(BloodBodyPartType, HumanVisual, ArrayList)](#addBasicPatch(zombie.characterTextures.BloodBodyPartType,zombie.core.skinnedmodel.visual.HumanVisual,java.util.ArrayList))
    13. [addDirt(BloodBodyPartType, float, HumanVisual, ArrayList, boolean)](#addDirt(zombie.characterTextures.BloodBodyPartType,float,zombie.core.skinnedmodel.visual.HumanVisual,java.util.ArrayList,boolean))
    14. [addBlood(BloodBodyPartType, float, HumanVisual, ArrayList, boolean)](#addBlood(zombie.characterTextures.BloodBodyPartType,float,zombie.core.skinnedmodel.visual.HumanVisual,java.util.ArrayList,boolean))
    15. [calcTotalBloodLevel(Clothing)](#calcTotalBloodLevel(zombie.inventory.types.Clothing))
    16. [calcTotalDirtLevel(Clothing)](#calcTotalDirtLevel(zombie.inventory.types.Clothing))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class BloodClothingType
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures")>

zombie.characterTextures.BloodClothingType

All Implemented Interfaces:
:   `Serializable, Comparable<BloodClothingType>, Constable`

---

public enum BloodClothingType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Apron`

  `Bag`

  `Foot_L`

  `Foot_R`

  `ForeArm_L`

  `ForeArm_R`

  `FullHelmet`

  `Groin`

  `Hand_L`

  `Hand_R`

  `Hands`

  `Head`

  `Jacket`

  `Jumper`

  `JumperNoSleeves`

  `LongJacket`

  `LowerArms`

  `LowerBody`

  `LowerLeg_L`

  `LowerLeg_R`

  `LowerLegs`

  `Neck`

  `Shirt`

  `ShirtLongSleeves`

  `ShirtNoSleeves`

  `Shoes`

  `ShortsShort`

  `Trousers`

  `UpperArm_L`

  `UpperArm_R`

  `UpperArms`

  `UpperBody`

  `UpperLeg_L`

  `UpperLeg_R`

  `UpperLegs`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<BloodBodyPartType>`

  `bodyParts`

  `private static final Map<String, BloodClothingType>`

  `BY_NAME`

  `private final List<BloodBodyPartType>`

  `coveredParts`

  `private static final BloodClothingType[]`

  `VALUES`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BloodClothingType(@Nullable BloodClothingType bloodClothingType,
  BloodBodyPartType... bloodBodyPartTypes)`

  `private`

  `BloodClothingType(BloodBodyPartType... coveredParts)`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addBasicPatch(BloodBodyPartType part,
  HumanVisual humanVisual,
  ArrayList<ItemVisual> itemVisuals)`

  Should be used only for debug, use Clothing.addPatch for gameplay stuff

  `static void`

  `addBlood(int count,
  HumanVisual humanVisual,
  ArrayList<ItemVisual> itemVisuals,
  boolean allLayers)`

  `static void`

  `addBlood(BloodBodyPartType part,
  float intensity,
  HumanVisual humanVisual,
  ArrayList<ItemVisual> itemVisuals,
  boolean allLayers)`

  `static void`

  `addBlood(BloodBodyPartType part,
  HumanVisual humanVisual,
  ArrayList<ItemVisual> itemVisuals,
  boolean allLayers)`

  `static void`

  `addDirt(BloodBodyPartType part,
  float intensity,
  HumanVisual humanVisual,
  ArrayList<ItemVisual> itemVisuals,
  boolean allLayers)`

  `static void`

  `addDirt(BloodBodyPartType part,
  HumanVisual humanVisual,
  ArrayList<ItemVisual> itemVisuals,
  boolean allLayers)`

  `static void`

  `addHole(BloodBodyPartType part,
  HumanVisual humanVisual,
  ArrayList<ItemVisual> itemVisuals)`

  `static boolean`

  `addHole(BloodBodyPartType part,
  HumanVisual humanVisual,
  ArrayList<ItemVisual> itemVisuals,
  boolean allLayers)`

  `static void`

  `calcTotalBloodLevel(Clothing clothing)`

  `static void`

  `calcTotalDirtLevel(Clothing clothing)`

  `static @Nullable BloodClothingType`

  `fromString(String str)`

  `static int`

  `getCoveredPartCount(@Nullable ArrayList<BloodClothingType> bloodClothingType)`

  `static ArrayList<BloodBodyPartType>`

  `getCoveredParts(@Nullable ArrayList<BloodClothingType> bloodClothingType)`

  `static ArrayList<BloodBodyPartType>`

  `getCoveredParts(@Nullable ArrayList<BloodClothingType> bloodClothingType,
  ArrayList<BloodBodyPartType> result)`

  `static BloodClothingType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static BloodClothingType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Apron

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Apron
  + ### ShirtNoSleeves

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") ShirtNoSleeves
  + ### JumperNoSleeves

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") JumperNoSleeves
  + ### Shirt

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Shirt
  + ### ShirtLongSleeves

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") ShirtLongSleeves
  + ### Jumper

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Jumper
  + ### Jacket

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Jacket
  + ### LongJacket

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") LongJacket
  + ### ShortsShort

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") ShortsShort
  + ### Trousers

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Trousers
  + ### Shoes

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Shoes
  + ### FullHelmet

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") FullHelmet
  + ### Bag

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Bag
  + ### Hands

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Hands
  + ### Head

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Head
  + ### Neck

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Neck
  + ### Groin

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Groin
  + ### UpperBody

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") UpperBody
  + ### LowerBody

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") LowerBody
  + ### LowerLegs

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") LowerLegs
  + ### UpperLegs

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") UpperLegs
  + ### LowerArms

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") LowerArms
  + ### UpperArms

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") UpperArms
  + ### Hand\_L

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Hand\_L
  + ### Hand\_R

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Hand\_R
  + ### ForeArm\_L

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") ForeArm\_L
  + ### ForeArm\_R

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") ForeArm\_R
  + ### UpperArm\_L

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") UpperArm\_L
  + ### UpperArm\_R

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") UpperArm\_R
  + ### UpperLeg\_L

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") UpperLeg\_L
  + ### UpperLeg\_R

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") UpperLeg\_R
  + ### LowerLeg\_L

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") LowerLeg\_L
  + ### LowerLeg\_R

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") LowerLeg\_R
  + ### Foot\_L

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Foot\_L
  + ### Foot\_R

    public static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") Foot\_R
* Field Details
  -------------

  + ### VALUES

    private static final [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures")[] VALUES
  + ### BY\_NAME

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures")> BY\_NAME
  + ### coveredParts

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")> coveredParts
  + ### bodyParts

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")> bodyParts
* Constructor Details
  -------------------

  + ### BloodClothingType

    private BloodClothingType([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")... coveredParts)
  + ### BloodClothingType

    private BloodClothingType(@Nullable [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") bloodClothingType,
    [BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")... bloodBodyPartTypes)
* Method Details
  --------------

  + ### values

    public static [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `name` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null
  + ### fromString

    public static @Nullable [BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures") fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getCoveredParts

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")> getCoveredParts(@Nullable [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures")> bloodClothingType)
  + ### getCoveredParts

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")> getCoveredParts(@Nullable [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures")> bloodClothingType,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures")> result)
  + ### getCoveredPartCount

    public static int getCoveredPartCount(@Nullable [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BloodClothingType](BloodClothingType.html "enum class in zombie.characterTextures")> bloodClothingType)
  + ### addBlood

    public static void addBlood(int count,
    [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual")> itemVisuals,
    boolean allLayers)
  + ### addBlood

    public static void addBlood([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual")> itemVisuals,
    boolean allLayers)
  + ### addDirt

    public static void addDirt([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual")> itemVisuals,
    boolean allLayers)
  + ### addHole

    public static void addHole([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual")> itemVisuals)
  + ### addHole

    public static boolean addHole([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual")> itemVisuals,
    boolean allLayers)
  + ### addBasicPatch

    public static void addBasicPatch([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual")> itemVisuals)

    Should be used only for debug, use Clothing.addPatch for gameplay stuff
  + ### addDirt

    public static void addDirt([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    float intensity,
    [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual")> itemVisuals,
    boolean allLayers)
  + ### addBlood

    public static void addBlood([BloodBodyPartType](BloodBodyPartType.html "enum class in zombie.characterTextures") part,
    float intensity,
    [HumanVisual](../core/skinnedmodel/visual/HumanVisual.html "class in zombie.core.skinnedmodel.visual") humanVisual,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemVisual](../core/skinnedmodel/visual/ItemVisual.html "class in zombie.core.skinnedmodel.visual")> itemVisuals,
    boolean allLayers)
  + ### calcTotalBloodLevel

    public static void calcTotalBloodLevel([Clothing](../inventory/types/Clothing.html "class in zombie.inventory.types") clothing)
  + ### calcTotalDirtLevel

    public static void calcTotalDirtLevel([Clothing](../inventory/types/Clothing.html "class in zombie.inventory.types") clothing)