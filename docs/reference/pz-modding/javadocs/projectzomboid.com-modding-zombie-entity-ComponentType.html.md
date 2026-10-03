[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [ComponentType](ComponentType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Attributes](#Attributes)
   2. [FluidContainer](#FluidContainer)
   3. [SpriteConfig](#SpriteConfig)
   4. [Lua](#Lua)
   5. [Parts](#Parts)
   6. [Signals](#Signals)
   7. [Script](#Script)
   8. [UiConfig](#UiConfig)
   9. [CraftLogic](#CraftLogic)
   10. [FurnaceLogic](#FurnaceLogic)
   11. [TestComponent](#TestComponent)
   12. [MashingLogic](#MashingLogic)
   13. [DryingLogic](#DryingLogic)
   14. [MetaTag](#MetaTag)
   15. [Resources](#Resources)
   16. [CraftBench](#CraftBench)
   17. [CraftRecipe](#CraftRecipe)
   18. [Durability](#Durability)
   19. [DryingCraftLogic](#DryingCraftLogic)
   20. [ContextMenuConfig](#ContextMenuConfig)
   21. [SpriteOverlayConfig](#SpriteOverlayConfig)
   22. [CraftBenchSounds](#CraftBenchSounds)
   23. [WallCoveringConfig](#WallCoveringConfig)
   24. [Undefined](#Undefined)
8. [Field Details](#field-detail)
   1. [idMap](#idMap)
   2. [classMap](#classMap)
   3. [list](#list)
   4. [array](#array)
   5. [bitsAddToEngine](#bitsAddToEngine)
   6. [bitsRunInMeta](#bitsRunInMeta)
   7. [bitsRenderLast](#bitsRenderLast)
   8. [componentFactory](#componentFactory)
   9. [scriptFactory](#scriptFactory)
   10. [MAX\_ID\_INDEX](#MAX_ID_INDEX)
   11. [id](#id)
   12. [flags](#flags)
   13. [componentClass](#componentClass)
   14. [componentScriptClass](#componentScriptClass)
   15. [validEntityTypes](#validEntityTypes)
9. [Constructor Details](#constructor-detail)
   1. [ComponentType(short, Class, Class, int)](#%3Cinit%3E(short,java.lang.Class,java.lang.Class,int))
   2. [ComponentType(short, Class, Class, int, EnumBitStore)](#%3Cinit%3E(short,java.lang.Class,java.lang.Class,int,zombie.entity.util.enums.EnumBitStore))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [GetID()](#GetID())
    4. [isAddToEngine()](#isAddToEngine())
    5. [isRunInMeta()](#isRunInMeta())
    6. [isRenderLast()](#isRenderLast())
    7. [isValidGameEntityType(GameEntityType)](#isValidGameEntityType(zombie.entity.GameEntityType))
    8. [GetComponentClass()](#GetComponentClass())
    9. [CreateComponent()](#CreateComponent())
    10. [CreateComponentFromScript(ComponentScript)](#CreateComponentFromScript(zombie.scripting.entity.ComponentScript))
    11. [CreateComponentScript()](#CreateComponentScript())
    12. [ReleaseComponent(Component)](#ReleaseComponent(zombie.entity.Component))
    13. [FromId(short)](#FromId(short))
    14. [FromClass(Class)](#FromClass(java.lang.Class))
    15. [GetList()](#GetList())
    16. [getBitsFor(ComponentType...)](#getBitsFor(zombie.entity.ComponentType...))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class ComponentType
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ComponentType](ComponentType.html "enum class in zombie.entity")>

zombie.entity.ComponentType

All Implemented Interfaces:
:   `Serializable, Comparable<ComponentType>, Constable`

---

public enum ComponentType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[ComponentType](ComponentType.html "enum class in zombie.entity")>

Enum defining the component types.
Instances of the components or componentscripts can be created through methods of this enum.
For example:
FluidContainer container = ComponentType.FluidContainer.CreateComponent();
Likewise components can be created from scripts, or from ID (for save/load).

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Attributes`

  NOTE:
  The ComponentType id's are used for saving/loading and for quick retrieval of components from entities.

  `ContextMenuConfig`

  `CraftBench`

  `CraftBenchSounds`

  `CraftLogic`

  `CraftRecipe`

  `DryingCraftLogic`

  `DryingLogic`

  `Durability`

  `FluidContainer`

  `FurnaceLogic`

  `Lua`

  `MashingLogic`

  `MetaTag`

  `Parts`

  `Resources`

  `Script`

  `Signals`

  `SpriteConfig`

  `SpriteOverlayConfig`

  `TestComponent`

  `UiConfig`

  `Undefined`

  `WallCoveringConfig`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ComponentType[]`

  `array`

  `(package private) static final BitSet`

  `bitsAddToEngine`

  `(package private) static final BitSet`

  `bitsRenderLast`

  `(package private) static final BitSet`

  `bitsRunInMeta`

  `private static final Map<Class<?>, ComponentType>`

  `classMap`

  `private final Class<? extends Component>`

  `componentClass`

  `private static final zombie.entity.ComponentFactory`

  `componentFactory`

  `private final Class<? extends ComponentScript>`

  `componentScriptClass`

  `(package private) final int`

  `flags`

  `(package private) final short`

  `id`

  `private static final Map<Short, ComponentType>`

  `idMap`

  `private static final ArrayList<ComponentType>`

  `list`

  `static final int`

  `MAX_ID_INDEX`

  `private static final zombie.entity.ComponentScriptFactory`

  `scriptFactory`

  `private final zombie.entity.util.enums.EnumBitStore<GameEntityType>`

  `validEntityTypes`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private <T extends Component, E extends ComponentScript>`

  `ComponentType(short i,
  Class<T> componentClass,
  Class<E> scriptClass,
  int flags)`

  `private <T extends Component, E extends ComponentScript>`

  `ComponentType(short i,
  Class<T> componentClass,
  Class<E> scriptClass,
  int flags,
  zombie.entity.util.enums.EnumBitStore<GameEntityType> validEntityTypes)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Component`

  `CreateComponent()`

  `Component`

  `CreateComponentFromScript(ComponentScript script)`

  `ComponentScript`

  `CreateComponentScript()`

  `static ComponentType`

  `FromClass(Class<? extends Component> clazz)`

  `static ComponentType`

  `FromId(short id)`

  `static BitSet`

  `getBitsFor(ComponentType... componentTypes)`

  `Class<? extends Component>`

  `GetComponentClass()`

  `short`

  `GetID()`

  `static ArrayList<ComponentType>`

  `GetList()`

  `boolean`

  `isAddToEngine()`

  `boolean`

  `isRenderLast()`

  `boolean`

  `isRunInMeta()`

  `boolean`

  `isValidGameEntityType(GameEntityType type)`

  `static void`

  `ReleaseComponent(Component component)`

  `static ComponentType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static ComponentType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Attributes

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") Attributes

    NOTE:
    The ComponentType id's are used for saving/loading and for quick retrieval of components from entities.
    For save/load its important that id's don't change and if a component ever gets removed care should be taken
    if that id gets occupied by new ComponentType (would require a world save incompatibility likely).
    As for the quick retrieval is concerned its preferred that new id's increment by one,
    since `ComponentContainer` creates an Array with a size that equals the highest id.
  + ### FluidContainer

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") FluidContainer
  + ### SpriteConfig

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") SpriteConfig
  + ### Lua

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") Lua
  + ### Parts

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") Parts
  + ### Signals

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") Signals
  + ### Script

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") Script
  + ### UiConfig

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") UiConfig
  + ### CraftLogic

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") CraftLogic
  + ### FurnaceLogic

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") FurnaceLogic
  + ### TestComponent

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") TestComponent
  + ### MashingLogic

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") MashingLogic
  + ### DryingLogic

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") DryingLogic
  + ### MetaTag

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") MetaTag
  + ### Resources

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") Resources
  + ### CraftBench

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") CraftBench
  + ### CraftRecipe

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") CraftRecipe
  + ### Durability

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") Durability
  + ### DryingCraftLogic

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") DryingCraftLogic
  + ### ContextMenuConfig

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") ContextMenuConfig
  + ### SpriteOverlayConfig

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") SpriteOverlayConfig
  + ### CraftBenchSounds

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") CraftBenchSounds
  + ### WallCoveringConfig

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") WallCoveringConfig
  + ### Undefined

    public static final [ComponentType](ComponentType.html "enum class in zombie.entity") Undefined
* Field Details
  -------------

  + ### idMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang"), [ComponentType](ComponentType.html "enum class in zombie.entity")> idMap
  + ### classMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?>, [ComponentType](ComponentType.html "enum class in zombie.entity")> classMap
  + ### list

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ComponentType](ComponentType.html "enum class in zombie.entity")> list
  + ### array

    private static final [ComponentType](ComponentType.html "enum class in zombie.entity")[] array
  + ### bitsAddToEngine

    static final [BitSet](util/BitSet.html "class in zombie.entity.util") bitsAddToEngine
  + ### bitsRunInMeta

    static final [BitSet](util/BitSet.html "class in zombie.entity.util") bitsRunInMeta
  + ### bitsRenderLast

    static final [BitSet](util/BitSet.html "class in zombie.entity.util") bitsRenderLast
  + ### componentFactory

    private static final zombie.entity.ComponentFactory componentFactory
  + ### scriptFactory

    private static final zombie.entity.ComponentScriptFactory scriptFactory
  + ### MAX\_ID\_INDEX

    public static final int MAX\_ID\_INDEX
  + ### id

    final short id
  + ### flags

    final int flags
  + ### componentClass

    private final [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [Component](Component.html "class in zombie.entity")> componentClass
  + ### componentScriptClass

    private final [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [ComponentScript](../scripting/entity/ComponentScript.html "class in zombie.scripting.entity")> componentScriptClass
  + ### validEntityTypes

    private final zombie.entity.util.enums.EnumBitStore<[GameEntityType](GameEntityType.html "enum class in zombie.entity")> validEntityTypes
* Constructor Details
  -------------------

  + ### ComponentType

    private <T extends [Component](Component.html "class in zombie.entity"), E extends [ComponentScript](../scripting/entity/ComponentScript.html "class in zombie.scripting.entity")>
    ComponentType(short i,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<T> componentClass,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<E> scriptClass,
    int flags)
  + ### ComponentType

    private <T extends [Component](Component.html "class in zombie.entity"), E extends [ComponentScript](../scripting/entity/ComponentScript.html "class in zombie.scripting.entity")>
    ComponentType(short i,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<T> componentClass,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<E> scriptClass,
    int flags,
    zombie.entity.util.enums.EnumBitStore<[GameEntityType](GameEntityType.html "enum class in zombie.entity")> validEntityTypes)
* Method Details
  --------------

  + ### values

    public static [ComponentType](ComponentType.html "enum class in zombie.entity")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [ComponentType](ComponentType.html "enum class in zombie.entity") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### GetID

    public short GetID()
  + ### isAddToEngine

    public boolean isAddToEngine()
  + ### isRunInMeta

    public boolean isRunInMeta()
  + ### isRenderLast

    public boolean isRenderLast()
  + ### isValidGameEntityType

    public boolean isValidGameEntityType([GameEntityType](GameEntityType.html "enum class in zombie.entity") type)
  + ### GetComponentClass

    public [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [Component](Component.html "class in zombie.entity")> GetComponentClass()
  + ### CreateComponent

    public [Component](Component.html "class in zombie.entity") CreateComponent()
  + ### CreateComponentFromScript

    public [Component](Component.html "class in zombie.entity") CreateComponentFromScript([ComponentScript](../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") script)
  + ### CreateComponentScript

    public [ComponentScript](../scripting/entity/ComponentScript.html "class in zombie.scripting.entity") CreateComponentScript()
  + ### ReleaseComponent

    public static void ReleaseComponent([Component](Component.html "class in zombie.entity") component)
  + ### FromId

    public static [ComponentType](ComponentType.html "enum class in zombie.entity") FromId(short id)
  + ### FromClass

    public static [ComponentType](ComponentType.html "enum class in zombie.entity") FromClass([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<? extends [Component](Component.html "class in zombie.entity")> clazz)
  + ### GetList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ComponentType](ComponentType.html "enum class in zombie.entity")> GetList()
  + ### getBitsFor

    public static [BitSet](util/BitSet.html "class in zombie.entity.util") getBitsFor([ComponentType](ComponentType.html "enum class in zombie.entity")... componentTypes)