[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.skills](package-summary.html)
2. [PerkFactory](PerkFactory.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [PerkList](#PerkList)
   2. [PerkById](#PerkById)
   3. [PerkByName](#PerkByName)
   4. [PerkByIndex](#PerkByIndex)
   5. [nextPerkId](#nextPerkId)
   6. [PERK\_XP\_REQ\_MULTIPLIER](#PERK_XP_REQ_MULTIPLIER)
7. [Constructor Details](#constructor-detail)
   1. [PerkFactory()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getPerkName(PerkFactory.Perk)](#getPerkName(zombie.characters.skills.PerkFactory.Perk))
   2. [getPerkFromName(String)](#getPerkFromName(java.lang.String))
   3. [getPerk(PerkFactory.Perk)](#getPerk(zombie.characters.skills.PerkFactory.Perk))
   4. [AddPerk(PerkFactory.Perk, String, int, int, int, int, int, int, int, int, int, int)](#AddPerk(zombie.characters.skills.PerkFactory.Perk,java.lang.String,int,int,int,int,int,int,int,int,int,int))
   5. [AddPerk(PerkFactory.Perk, String, int, int, int, int, int, int, int, int, int, int, boolean)](#AddPerk(zombie.characters.skills.PerkFactory.Perk,java.lang.String,int,int,int,int,int,int,int,int,int,int,boolean))
   6. [AddPerk(PerkFactory.Perk, String, PerkFactory.Perk, int, int, int, int, int, int, int, int, int, int)](#AddPerk(zombie.characters.skills.PerkFactory.Perk,java.lang.String,zombie.characters.skills.PerkFactory.Perk,int,int,int,int,int,int,int,int,int,int))
   7. [AddPerk(PerkFactory.Perk, String, PerkFactory.Perk, int, int, int, int, int, int, int, int, int, int, boolean)](#AddPerk(zombie.characters.skills.PerkFactory.Perk,java.lang.String,zombie.characters.skills.PerkFactory.Perk,int,int,int,int,int,int,int,int,int,int,boolean))
   8. [init()](#init())
   9. [initTranslations()](#initTranslations())
   10. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PerkFactory
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.skills.PerkFactory

---

public final class PerkFactory
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `PerkFactory.Perk`

  `static final class`

  `PerkFactory.Perks`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static int`

  `nextPerkId`

  `private static final float`

  `PERK_XP_REQ_MULTIPLIER`

  `private static final HashMap<String, PerkFactory.Perk>`

  `PerkById`

  `private static final PerkFactory.Perk[]`

  `PerkByIndex`

  `private static final HashMap<String, PerkFactory.Perk>`

  `PerkByName`

  `static final ArrayList<PerkFactory.Perk>`

  `PerkList`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PerkFactory()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static PerkFactory.Perk`

  `AddPerk(PerkFactory.Perk perk,
  String translation,
  int xp1,
  int xp2,
  int xp3,
  int xp4,
  int xp5,
  int xp6,
  int xp7,
  int xp8,
  int xp9,
  int xp10)`

  `static PerkFactory.Perk`

  `AddPerk(PerkFactory.Perk perk,
  String translation,
  int xp1,
  int xp2,
  int xp3,
  int xp4,
  int xp5,
  int xp6,
  int xp7,
  int xp8,
  int xp9,
  int xp10,
  boolean passiv)`

  `static PerkFactory.Perk`

  `AddPerk(PerkFactory.Perk perk,
  String translation,
  PerkFactory.Perk parent,
  int xp1,
  int xp2,
  int xp3,
  int xp4,
  int xp5,
  int xp6,
  int xp7,
  int xp8,
  int xp9,
  int xp10)`

  `static PerkFactory.Perk`

  `AddPerk(PerkFactory.Perk perk,
  String translation,
  PerkFactory.Perk parent,
  int xp1,
  int xp2,
  int xp3,
  int xp4,
  int xp5,
  int xp6,
  int xp7,
  int xp8,
  int xp9,
  int xp10,
  boolean passiv)`

  `static PerkFactory.Perk`

  `getPerk(PerkFactory.Perk perk)`

  `static PerkFactory.Perk`

  `getPerkFromName(String name)`

  `static String`

  `getPerkName(PerkFactory.Perk type)`

  `static void`

  `init()`

  `static void`

  `initTranslations()`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### PerkList

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills")> PerkList
  + ### PerkById

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills")> PerkById
  + ### PerkByName

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills")> PerkByName
  + ### PerkByIndex

    private static final [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills")[] PerkByIndex
  + ### nextPerkId

    private static int nextPerkId
  + ### PERK\_XP\_REQ\_MULTIPLIER

    private static final float PERK\_XP\_REQ\_MULTIPLIER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.skills.PerkFactory.PERK_XP_REQ_MULTIPLIER)
* Constructor Details
  -------------------

  + ### PerkFactory

    public PerkFactory()
* Method Details
  --------------

  + ### getPerkName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPerkName([PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") type)
  + ### getPerkFromName

    public static [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") getPerkFromName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getPerk

    public static [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") getPerk([PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") perk)
  + ### AddPerk

    public static [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") AddPerk([PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translation,
    int xp1,
    int xp2,
    int xp3,
    int xp4,
    int xp5,
    int xp6,
    int xp7,
    int xp8,
    int xp9,
    int xp10)
  + ### AddPerk

    public static [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") AddPerk([PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translation,
    int xp1,
    int xp2,
    int xp3,
    int xp4,
    int xp5,
    int xp6,
    int xp7,
    int xp8,
    int xp9,
    int xp10,
    boolean passiv)
  + ### AddPerk

    public static [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") AddPerk([PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translation,
    [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") parent,
    int xp1,
    int xp2,
    int xp3,
    int xp4,
    int xp5,
    int xp6,
    int xp7,
    int xp8,
    int xp9,
    int xp10)
  + ### AddPerk

    public static [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") AddPerk([PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translation,
    [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") parent,
    int xp1,
    int xp2,
    int xp3,
    int xp4,
    int xp5,
    int xp6,
    int xp7,
    int xp8,
    int xp9,
    int xp10,
    boolean passiv)
  + ### init

    public static void init()
  + ### initTranslations

    public static void initTranslations()
  + ### Reset

    public static void Reset()