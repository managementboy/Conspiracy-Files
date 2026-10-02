[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.Moodles](package-summary.html)
2. [Moodle](Moodle.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MinChevrons](#MinChevrons)
   2. [MaxChevrons](#MaxChevrons)
   3. [CantSprintTimerDuration](#CantSprintTimerDuration)
   4. [PainTimerDuration](#PainTimerDuration)
   5. [moodleType](#moodleType)
   6. [moodleLevel](#moodleLevel)
   7. [isoGameCharacter](#isoGameCharacter)
   8. [painTimer](#painTimer)
   9. [chevronColor](#chevronColor)
   10. [chevronIsUp](#chevronIsUp)
   11. [chevronCount](#chevronCount)
   12. [colorNeg](#colorNeg)
   13. [colorPos](#colorPos)
   14. [cantSprintTimer](#cantSprintTimer)
7. [Constructor Details](#constructor-detail)
   1. [Moodle(MoodleType, IsoGameCharacter)](#%3Cinit%3E(zombie.scripting.objects.MoodleType,zombie.characters.IsoGameCharacter))
8. [Method Details](#method-detail)
   1. [getMoodleType()](#getMoodleType())
   2. [getChevronCount()](#getChevronCount())
   3. [isChevronIsUp()](#isChevronIsUp())
   4. [getChevronColor()](#getChevronColor())
   5. [chevronDifference(int, boolean, Color)](#chevronDifference(int,boolean,zombie.core.Color))
   6. [setChevron(int, boolean, Color)](#setChevron(int,boolean,zombie.core.Color))
   7. [getLevel()](#getLevel())
   8. [updateMoodleLevel(int)](#updateMoodleLevel(int))
   9. [Update()](#Update())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Moodle
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.Moodles.Moodle

---

public final class Moodle
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `Moodle.MoodleLevel`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `cantSprintTimer`

  `private static final int`

  `CantSprintTimerDuration`

  `private Color`

  `chevronColor`

  `private int`

  `chevronCount`

  `private boolean`

  `chevronIsUp`

  `private static final Color`

  `colorNeg`

  `private static final Color`

  `colorPos`

  `private final IsoGameCharacter`

  `isoGameCharacter`

  `private static final int`

  `MaxChevrons`

  `private static final int`

  `MinChevrons`

  `private int`

  `moodleLevel`

  `private final MoodleType`

  `moodleType`

  `private int`

  `painTimer`

  `private static final int`

  `PainTimerDuration`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Moodle(MoodleType moodleType,
  IsoGameCharacter isoGameCharacter)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `chevronDifference(int count,
  boolean isUp,
  Color col)`

  `Color`

  `getChevronColor()`

  `int`

  `getChevronCount()`

  `int`

  `getLevel()`

  `MoodleType`

  `getMoodleType()`

  `boolean`

  `isChevronIsUp()`

  `void`

  `setChevron(int count,
  boolean isUp,
  Color col)`

  `boolean`

  `Update()`

  `private boolean`

  `updateMoodleLevel(int moodleLevel)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### MinChevrons

    private static final int MinChevrons

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.Moodles.Moodle.MinChevrons)
  + ### MaxChevrons

    private static final int MaxChevrons

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.Moodles.Moodle.MaxChevrons)
  + ### CantSprintTimerDuration

    private static final int CantSprintTimerDuration

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.Moodles.Moodle.CantSprintTimerDuration)
  + ### PainTimerDuration

    private static final int PainTimerDuration

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.Moodles.Moodle.PainTimerDuration)
  + ### moodleType

    private final [MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType
  + ### moodleLevel

    private int moodleLevel
  + ### isoGameCharacter

    private final [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") isoGameCharacter
  + ### painTimer

    private int painTimer
  + ### chevronColor

    private [Color](../../core/Color.html "class in zombie.core") chevronColor
  + ### chevronIsUp

    private boolean chevronIsUp
  + ### chevronCount

    private int chevronCount
  + ### colorNeg

    private static final [Color](../../core/Color.html "class in zombie.core") colorNeg
  + ### colorPos

    private static final [Color](../../core/Color.html "class in zombie.core") colorPos
  + ### cantSprintTimer

    private int cantSprintTimer
* Constructor Details
  -------------------

  + ### Moodle

    public Moodle([MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType,
    [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
* Method Details
  --------------

  + ### getMoodleType

    public [MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") getMoodleType()
  + ### getChevronCount

    public int getChevronCount()
  + ### isChevronIsUp

    public boolean isChevronIsUp()
  + ### getChevronColor

    public [Color](../../core/Color.html "class in zombie.core") getChevronColor()
  + ### chevronDifference

    public boolean chevronDifference(int count,
    boolean isUp,
    [Color](../../core/Color.html "class in zombie.core") col)
  + ### setChevron

    public void setChevron(int count,
    boolean isUp,
    [Color](../../core/Color.html "class in zombie.core") col)
  + ### getLevel

    public int getLevel()
  + ### updateMoodleLevel

    private boolean updateMoodleLevel(int moodleLevel)
  + ### Update

    public boolean Update()