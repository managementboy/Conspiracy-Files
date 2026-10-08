[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.scripting](package-summary.html)
2. [ScriptType](ScriptType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [EntityComponent](#EntityComponent)
   2. [VehicleTemplate](#VehicleTemplate)
   3. [EntityTemplate](#EntityTemplate)
   4. [Item](#Item)
   5. [Recipe](#Recipe)
   6. [UniqueRecipe](#UniqueRecipe)
   7. [EvolvedRecipe](#EvolvedRecipe)
   8. [Fixing](#Fixing)
   9. [AnimationMesh](#AnimationMesh)
   10. [Mannequin](#Mannequin)
   11. [Model](#Model)
   12. [SpriteModel](#SpriteModel)
   13. [Sound](#Sound)
   14. [SoundTimeline](#SoundTimeline)
   15. [Vehicle](#Vehicle)
   16. [RuntimeAnimation](#RuntimeAnimation)
   17. [VehicleEngineRPM](#VehicleEngineRPM)
   18. [ItemConfig](#ItemConfig)
   19. [Entity](#Entity)
   20. [XuiLayout](#XuiLayout)
   21. [XuiStyle](#XuiStyle)
   22. [XuiDefaultStyle](#XuiDefaultStyle)
   23. [XuiColor](#XuiColor)
   24. [XuiSkin](#XuiSkin)
   25. [XuiConfig](#XuiConfig)
   26. [ItemFilter](#ItemFilter)
   27. [CraftRecipe](#CraftRecipe)
   28. [FluidFilter](#FluidFilter)
   29. [StringList](#StringList)
   30. [EnergyDefinition](#EnergyDefinition)
   31. [FluidDefinition](#FluidDefinition)
   32. [PhysicsShape](#PhysicsShape)
   33. [TimedAction](#TimedAction)
   34. [Ragdoll](#Ragdoll)
   35. [PhysicsHitReaction](#PhysicsHitReaction)
   36. [Clock](#Clock)
   37. [CharacterTraitDefinition](#CharacterTraitDefinition)
   38. [CharacterProfessionDefinition](#CharacterProfessionDefinition)
8. [Field Details](#field-detail)
   1. [sortedList](#sortedList)
   2. [typeComparator](#typeComparator)
   3. [isTemplate](#isTemplate)
   4. [scriptTag](#scriptTag)
   5. [isCritical](#isCritical)
   6. [flags](#flags)
   7. [verbose](#verbose)
9. [Constructor Details](#constructor-detail)
   1. [ScriptType(String)](#%3Cinit%3E(java.lang.String))
   2. [ScriptType(boolean, String)](#%3Cinit%3E(boolean,java.lang.String))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [isTemplate()](#isTemplate())
    4. [isCritical()](#isCritical())
    5. [getScriptTag()](#getScriptTag())
    6. [hasFlag(ScriptType.Flags)](#hasFlag(zombie.scripting.ScriptType.Flags))
    7. [hasFlags(EnumSet)](#hasFlags(java.util.EnumSet))
    8. [isVerbose()](#isVerbose())
    9. [setVerbose(boolean)](#setVerbose(boolean))
    10. [GetEnumListLua()](#GetEnumListLua())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class ScriptType
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ScriptType](ScriptType.html "enum class in zombie.scripting")>

zombie.scripting.ScriptType

All Implemented Interfaces:
:   `Serializable, Comparable<ScriptType>, Constable`

---

public enum ScriptType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ScriptType](ScriptType.html "enum class in zombie.scripting")>

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `ScriptType.Flags`

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `AnimationMesh`

  `CharacterProfessionDefinition`

  `CharacterTraitDefinition`

  `Clock`

  `CraftRecipe`

  `EnergyDefinition`

  `Entity`

  `EntityComponent`

  `EntityTemplate`

  `EvolvedRecipe`

  `Fixing`

  `FluidDefinition`

  `FluidFilter`

  `Item`

  `ItemConfig`

  `ItemFilter`

  `Mannequin`

  `Model`

  `PhysicsHitReaction`

  `PhysicsShape`

  `Ragdoll`

  `Recipe`

  `RuntimeAnimation`

  `Sound`

  `SoundTimeline`

  `SpriteModel`

  `StringList`

  `TimedAction`

  `UniqueRecipe`

  `Vehicle`

  `VehicleEngineRPM`

  `VehicleTemplate`

  `XuiColor`

  `XuiConfig`

  `XuiDefaultStyle`

  `XuiLayout`

  `XuiSkin`

  `XuiStyle`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private Set<ScriptType.Flags>`

  `flags`

  `private final boolean`

  `isCritical`

  `private final boolean`

  `isTemplate`

  `private final String`

  `scriptTag`

  `private static final ArrayList<ScriptType>`

  `sortedList`

  `private static final Comparator<ScriptType>`

  `typeComparator`

  `private boolean`

  `verbose`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ScriptType(boolean isTemplate,
  String scriptTag)`

  `private`

  `ScriptType(String scriptTag)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<ScriptType>`

  `GetEnumListLua()`

  `String`

  `getScriptTag()`

  `boolean`

  `hasFlag(ScriptType.Flags flag)`

  `boolean`

  `hasFlags(EnumSet<ScriptType.Flags> flags)`

  `boolean`

  `isCritical()`

  `boolean`

  `isTemplate()`

  `boolean`

  `isVerbose()`

  `void`

  `setVerbose(boolean b)`

  `static ScriptType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static ScriptType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### EntityComponent

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") EntityComponent
  + ### VehicleTemplate

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") VehicleTemplate
  + ### EntityTemplate

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") EntityTemplate
  + ### Item

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Item
  + ### Recipe

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Recipe
  + ### UniqueRecipe

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") UniqueRecipe
  + ### EvolvedRecipe

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") EvolvedRecipe
  + ### Fixing

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Fixing
  + ### AnimationMesh

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") AnimationMesh
  + ### Mannequin

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Mannequin
  + ### Model

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Model
  + ### SpriteModel

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") SpriteModel
  + ### Sound

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Sound
  + ### SoundTimeline

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") SoundTimeline
  + ### Vehicle

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Vehicle
  + ### RuntimeAnimation

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") RuntimeAnimation
  + ### VehicleEngineRPM

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") VehicleEngineRPM
  + ### ItemConfig

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") ItemConfig
  + ### Entity

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Entity
  + ### XuiLayout

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") XuiLayout
  + ### XuiStyle

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") XuiStyle
  + ### XuiDefaultStyle

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") XuiDefaultStyle
  + ### XuiColor

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") XuiColor
  + ### XuiSkin

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") XuiSkin
  + ### XuiConfig

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") XuiConfig
  + ### ItemFilter

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") ItemFilter
  + ### CraftRecipe

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") CraftRecipe
  + ### FluidFilter

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") FluidFilter
  + ### StringList

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") StringList
  + ### EnergyDefinition

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") EnergyDefinition
  + ### FluidDefinition

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") FluidDefinition
  + ### PhysicsShape

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") PhysicsShape
  + ### TimedAction

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") TimedAction
  + ### Ragdoll

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Ragdoll
  + ### PhysicsHitReaction

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") PhysicsHitReaction
  + ### Clock

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") Clock
  + ### CharacterTraitDefinition

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") CharacterTraitDefinition
  + ### CharacterProfessionDefinition

    public static final [ScriptType](ScriptType.html "enum class in zombie.scripting") CharacterProfessionDefinition
* Field Details
  -------------

  + ### sortedList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ScriptType](ScriptType.html "enum class in zombie.scripting")> sortedList
  + ### typeComparator

    private static final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[ScriptType](ScriptType.html "enum class in zombie.scripting")> typeComparator
  + ### isTemplate

    private final boolean isTemplate
  + ### scriptTag

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptTag
  + ### isCritical

    private final boolean isCritical

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.scripting.ScriptType.isCritical)
  + ### flags

    private [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting")> flags
  + ### verbose

    private boolean verbose
* Constructor Details
  -------------------

  + ### ScriptType

    private ScriptType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptTag)
  + ### ScriptType

    private ScriptType(boolean isTemplate,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptTag)
* Method Details
  --------------

  + ### values

    public static [ScriptType](ScriptType.html "enum class in zombie.scripting")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [ScriptType](ScriptType.html "enum class in zombie.scripting") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### isTemplate

    public boolean isTemplate()
  + ### isCritical

    public boolean isCritical()
  + ### getScriptTag

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getScriptTag()
  + ### hasFlag

    public boolean hasFlag([ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting") flag)
  + ### hasFlags

    public boolean hasFlags([EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[ScriptType.Flags](ScriptType.Flags.html "enum class in zombie.scripting")> flags)
  + ### isVerbose

    public boolean isVerbose()
  + ### setVerbose

    public void setVerbose(boolean b)
  + ### GetEnumListLua

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ScriptType](ScriptType.html "enum class in zombie.scripting")> GetEnumListLua()