[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.Moodles](package-summary.html)
2. [Moodles](Moodles.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [NeutralMoodleType](#NeutralMoodleType)
   2. [GoodMoodleType](#GoodMoodleType)
   3. [BadMoodleType](#BadMoodleType)
   4. [moodlesStateChanged](#moodlesStateChanged)
   5. [moodles](#moodles)
6. [Constructor Details](#constructor-detail)
   1. [Moodles(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
7. [Method Details](#method-detail)
   1. [getGoodBadNeutral(MoodleType)](#getGoodBadNeutral(zombie.scripting.objects.MoodleType))
   2. [getMoodleDisplayString(MoodleType)](#getMoodleDisplayString(zombie.scripting.objects.MoodleType))
   3. [getMoodleDescriptionString(MoodleType)](#getMoodleDescriptionString(zombie.scripting.objects.MoodleType))
   4. [getMoodleLevel(MoodleType)](#getMoodleLevel(zombie.scripting.objects.MoodleType))
   5. [isMaxMoodleLevel(MoodleType)](#isMaxMoodleLevel(zombie.scripting.objects.MoodleType))
   6. [UI\_RefreshNeeded()](#UI_RefreshNeeded())
   7. [setMoodlesStateChanged(boolean)](#setMoodlesStateChanged(boolean))
   8. [Update()](#Update())
   9. [getDisplayName(MoodleType, int)](#getDisplayName(zombie.scripting.objects.MoodleType,int))
   10. [getDescriptionText(MoodleType, int)](#getDescriptionText(zombie.scripting.objects.MoodleType,int))
   11. [GoodBadNeutral(MoodleType)](#GoodBadNeutral(zombie.scripting.objects.MoodleType))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Moodles
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.Moodles.Moodles

---

public class Moodles
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final int`

  `BadMoodleType`

  `static final int`

  `GoodMoodleType`

  `private final Map<MoodleType, Moodle>`

  `moodles`

  `private boolean`

  `moodlesStateChanged`

  `static final int`

  `NeutralMoodleType`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Moodles(IsoGameCharacter parent)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private String`

  `getDescriptionText(MoodleType moodleType,
  int level)`

  `private String`

  `getDisplayName(MoodleType moodleType,
  int level)`

  `int`

  `getGoodBadNeutral(MoodleType moodleType)`

  `String`

  `getMoodleDescriptionString(MoodleType moodleType)`

  `String`

  `getMoodleDisplayString(MoodleType moodleType)`

  `int`

  `getMoodleLevel(MoodleType moodleType)`

  `private int`

  `GoodBadNeutral(MoodleType moodleType)`

  `boolean`

  `isMaxMoodleLevel(MoodleType moodleType)`

  `void`

  `setMoodlesStateChanged(boolean refresh)`

  `boolean`

  `UI_RefreshNeeded()`

  `void`

  `Update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### NeutralMoodleType

    public static final int NeutralMoodleType

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.Moodles.Moodles.NeutralMoodleType)
  + ### GoodMoodleType

    public static final int GoodMoodleType

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.Moodles.Moodles.GoodMoodleType)
  + ### BadMoodleType

    public static final int BadMoodleType

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.Moodles.Moodles.BadMoodleType)
  + ### moodlesStateChanged

    private boolean moodlesStateChanged
  + ### moodles

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects"), [Moodle](Moodle.html "class in zombie.characters.Moodles")> moodles
* Constructor Details
  -------------------

  + ### Moodles

    public Moodles([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") parent)
* Method Details
  --------------

  + ### getGoodBadNeutral

    public int getGoodBadNeutral([MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
  + ### getMoodleDisplayString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMoodleDisplayString([MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
  + ### getMoodleDescriptionString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMoodleDescriptionString([MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
  + ### getMoodleLevel

    public int getMoodleLevel([MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
  + ### isMaxMoodleLevel

    public boolean isMaxMoodleLevel([MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
  + ### UI\_RefreshNeeded

    public boolean UI\_RefreshNeeded()
  + ### setMoodlesStateChanged

    public void setMoodlesStateChanged(boolean refresh)
  + ### Update

    public void Update()
  + ### getDisplayName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName([MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType,
    int level)
  + ### getDescriptionText

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescriptionText([MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType,
    int level)
  + ### GoodBadNeutral

    private int GoodBadNeutral([MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)