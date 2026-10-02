[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [Aim](#Aim)
   2. [PrecisionAim](#PrecisionAim)
   3. [Melee](#Melee)
   4. [Attack](#Attack)
   5. [Run](#Run)
   6. [Interact](#Interact)
   7. [WalkTo](#WalkTo)
   8. [Crouch](#Crouch)
   9. [ReloadWeapon](#ReloadWeapon)
   10. [RackFirearm](#RackFirearm)
   11. [Sprint](#Sprint)
   12. [CancelAction](#CancelAction)
   13. [ManualFloorAtk](#ManualFloorAtk)
   14. [Inventory](#Inventory)
   15. [Loot](#Loot)
   16. [ClosePanel](#ClosePanel)
   17. [CycleLoot](#CycleLoot)
   18. [CycleInventory](#CycleInventory)
   19. [CycleTabsLeft](#CycleTabsLeft)
   20. [CycleTabsRight](#CycleTabsRight)
   21. [TransferItem](#TransferItem)
   22. [InteractOptions](#InteractOptions)
   23. [ClimbThrough](#ClimbThrough)
   24. [SmashWindow](#SmashWindow)
   25. [Brakes](#Brakes)
   26. [CruiseControl](#CruiseControl)
   27. [ZoomIn](#ZoomIn)
   28. [ZoomOut](#ZoomOut)
8. [Field Details](#field-detail)
   1. [defaultBinding](#defaultBinding)
   2. [binding](#binding)
   3. [values](#values)
9. [Constructor Details](#constructor-detail)
   1. [CharacterJoypadButtonBinding()](#%3Cinit%3E())
   2. [CharacterJoypadButtonBinding(JoypadButton)](#%3Cinit%3E(zombie.input.JoypadButton))
   3. [CharacterJoypadButtonBinding(JoypadAxis1d, float, float)](#%3Cinit%3E(zombie.input.JoypadAxis1d,float,float))
   4. [CharacterJoypadButtonBinding(JoypadAxis1d, float)](#%3Cinit%3E(zombie.input.JoypadAxis1d,float))
   5. [CharacterJoypadButtonBinding(JoypadAxis2d, float, float)](#%3Cinit%3E(zombie.input.JoypadAxis2d,float,float))
   6. [CharacterJoypadButtonBinding(JoypadAxis2d, float)](#%3Cinit%3E(zombie.input.JoypadAxis2d,float))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [allBindings()](#allBindings())
    4. [findBinding(JoypadButton)](#findBinding(zombie.input.JoypadButton))
    5. [findBindings(JoypadButton)](#findBindings(zombie.input.JoypadButton))
    6. [findBindings(JoypadAxis1d)](#findBindings(zombie.input.JoypadAxis1d))
    7. [findBindings(JoypadAxis2d)](#findBindings(zombie.input.JoypadAxis2d))
    8. [fromString(String)](#fromString(java.lang.String))
    9. [getNameTranslationKey()](#getNameTranslationKey())
    10. [getJoypadButton()](#getJoypadButton())
    11. [getJoypadAxis1d()](#getJoypadAxis1d())
    12. [getJoypadAxis2d()](#getJoypadAxis2d())
    13. [getBinding()](#getBinding())
    14. [getAxisMinThreshold()](#getAxisMinThreshold())
    15. [getAxisMaxThreshold()](#getAxisMaxThreshold())
    16. [isAxisMaxThresholdInfinity()](#isAxisMaxThresholdInfinity())
    17. [containsBinding(JoypadButton)](#containsBinding(zombie.input.JoypadButton))
    18. [containsBinding(JoypadAxis1d)](#containsBinding(zombie.input.JoypadAxis1d))
    19. [containsBinding(JoypadAxis2d)](#containsBinding(zombie.input.JoypadAxis2d))
    20. [removeBinding(JoypadButton)](#removeBinding(zombie.input.JoypadButton))
    21. [removeBinding(JoypadAxis1d)](#removeBinding(zombie.input.JoypadAxis1d))
    22. [removeBinding(JoypadAxis2d)](#removeBinding(zombie.input.JoypadAxis2d))
    23. [addBinding(JoypadButton)](#addBinding(zombie.input.JoypadButton))
    24. [addBinding(JoypadAxis1d)](#addBinding(zombie.input.JoypadAxis1d))
    25. [addBinding(JoypadAxis2d)](#addBinding(zombie.input.JoypadAxis2d))
    26. [moveBindingFrom(CharacterJoypadButtonBinding)](#moveBindingFrom(zombie.characters.CharacterJoypadButtonBinding))
    27. [setBinding(JoypadButton)](#setBinding(zombie.input.JoypadButton))
    28. [setBinding(JoypadAxis1d, float, float)](#setBinding(zombie.input.JoypadAxis1d,float,float))
    29. [setBinding(JoypadAxis1d, float)](#setBinding(zombie.input.JoypadAxis1d,float))
    30. [setBinding(JoypadAxis2d, float, float)](#setBinding(zombie.input.JoypadAxis2d,float,float))
    31. [setBinding(JoypadAxis2d, float)](#setBinding(zombie.input.JoypadAxis2d,float))
    32. [setDefault()](#setDefault())
    33. [setAllToDefault()](#setAllToDefault())
    34. [isDown(int)](#isDown(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class CharacterJoypadButtonBinding
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters")>

zombie.characters.CharacterJoypadButtonBinding

All Implemented Interfaces:
:   `Serializable, Comparable<CharacterJoypadButtonBinding>, Constable`

---

public enum CharacterJoypadButtonBinding
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters")>

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `CharacterJoypadButtonBinding.Axis1dMinMaxBinding`

  `static class`

  `CharacterJoypadButtonBinding.Axis2dMinMaxBinding`

  `static interface`

  `CharacterJoypadButtonBinding.IsDownBinding`

  `static class`

  `CharacterJoypadButtonBinding.JoypadButtonBinding`

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Aim`

  `Attack`

  `Brakes`

  `CancelAction`

  `ClimbThrough`

  `ClosePanel`

  `Crouch`

  `CruiseControl`

  `CycleInventory`

  `CycleLoot`

  `CycleTabsLeft`

  `CycleTabsRight`

  `Interact`

  `InteractOptions`

  `Inventory`

  `Loot`

  `ManualFloorAtk`

  `Melee`

  `PrecisionAim`

  `RackFirearm`

  `ReloadWeapon`

  `Run`

  `SmashWindow`

  `Sprint`

  `TransferItem`

  `WalkTo`

  `ZoomIn`

  `ZoomOut`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private CharacterJoypadButtonBinding.IsDownBinding`

  `binding`

  `private final CharacterJoypadButtonBinding.IsDownBinding`

  `defaultBinding`

  `private static final CharacterJoypadButtonBinding[]`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CharacterJoypadButtonBinding()`

  `private`

  `CharacterJoypadButtonBinding(JoypadAxis1d axis1d,
  float min)`

  `private`

  `CharacterJoypadButtonBinding(JoypadAxis1d axis1d,
  float min,
  float max)`

  `private`

  `CharacterJoypadButtonBinding(JoypadAxis2d axis2d,
  float min)`

  `private`

  `CharacterJoypadButtonBinding(JoypadAxis2d axis2d,
  float min,
  float max)`

  `private`

  `CharacterJoypadButtonBinding(JoypadButton buttonBinding)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addBinding(JoypadAxis1d axis1d)`

  `void`

  `addBinding(JoypadAxis2d axis2d)`

  `void`

  `addBinding(JoypadButton button)`

  `static CharacterJoypadButtonBinding[]`

  `allBindings()`

  `boolean`

  `containsBinding(JoypadAxis1d axis1d)`

  `boolean`

  `containsBinding(JoypadAxis2d axis2d)`

  `boolean`

  `containsBinding(JoypadButton button)`

  `static CharacterJoypadButtonBinding`

  `findBinding(JoypadButton joypadButton)`

  `static CharacterJoypadButtonBinding[]`

  `findBindings(JoypadAxis1d joypadAxis)`

  `static CharacterJoypadButtonBinding[]`

  `findBindings(JoypadAxis2d joypadAxis)`

  `static CharacterJoypadButtonBinding[]`

  `findBindings(JoypadButton joypadButton)`

  `static CharacterJoypadButtonBinding`

  `fromString(String name)`

  `float`

  `getAxisMaxThreshold()`

  `float`

  `getAxisMinThreshold()`

  `CharacterJoypadButtonBinding.IsDownBinding`

  `getBinding()`

  `JoypadAxis1d`

  `getJoypadAxis1d()`

  `JoypadAxis2d`

  `getJoypadAxis2d()`

  `JoypadButton`

  `getJoypadButton()`

  `String`

  `getNameTranslationKey()`

  `boolean`

  `isAxisMaxThresholdInfinity()`

  `boolean`

  `isDown(int joypadBind)`

  `void`

  `moveBindingFrom(CharacterJoypadButtonBinding fromBinding)`

  `void`

  `removeBinding(JoypadAxis1d axis1d)`

  `void`

  `removeBinding(JoypadAxis2d axis2d)`

  `void`

  `removeBinding(JoypadButton button)`

  `static void`

  `setAllToDefault()`

  `void`

  `setBinding(JoypadAxis1d axis1d,
  float min)`

  `void`

  `setBinding(JoypadAxis1d axis1d,
  float min,
  float max)`

  `void`

  `setBinding(JoypadAxis2d axis2d,
  float min)`

  `void`

  `setBinding(JoypadAxis2d axis2d,
  float min,
  float max)`

  `void`

  `setBinding(JoypadButton newBinding)`

  `void`

  `setDefault()`

  `static CharacterJoypadButtonBinding`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static CharacterJoypadButtonBinding[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### Aim

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Aim
  + ### PrecisionAim

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") PrecisionAim
  + ### Melee

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Melee
  + ### Attack

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Attack
  + ### Run

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Run
  + ### Interact

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Interact
  + ### WalkTo

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") WalkTo
  + ### Crouch

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Crouch
  + ### ReloadWeapon

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") ReloadWeapon
  + ### RackFirearm

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") RackFirearm
  + ### Sprint

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Sprint
  + ### CancelAction

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") CancelAction
  + ### ManualFloorAtk

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") ManualFloorAtk
  + ### Inventory

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Inventory
  + ### Loot

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Loot
  + ### ClosePanel

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") ClosePanel
  + ### CycleLoot

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") CycleLoot
  + ### CycleInventory

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") CycleInventory
  + ### CycleTabsLeft

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") CycleTabsLeft
  + ### CycleTabsRight

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") CycleTabsRight
  + ### TransferItem

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") TransferItem
  + ### InteractOptions

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") InteractOptions
  + ### ClimbThrough

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") ClimbThrough
  + ### SmashWindow

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") SmashWindow
  + ### Brakes

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") Brakes
  + ### CruiseControl

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") CruiseControl
  + ### ZoomIn

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") ZoomIn
  + ### ZoomOut

    public static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") ZoomOut
* Field Details
  -------------

  + ### defaultBinding

    private final [CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html "interface in zombie.characters") defaultBinding
  + ### binding

    private [CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html "interface in zombie.characters") binding
  + ### values

    private static final [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters")[] values
* Constructor Details
  -------------------

  + ### CharacterJoypadButtonBinding

    private CharacterJoypadButtonBinding()
  + ### CharacterJoypadButtonBinding

    private CharacterJoypadButtonBinding([JoypadButton](../input/JoypadButton.html "enum class in zombie.input") buttonBinding)
  + ### CharacterJoypadButtonBinding

    private CharacterJoypadButtonBinding([JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") axis1d,
    float min,
    float max)
  + ### CharacterJoypadButtonBinding

    private CharacterJoypadButtonBinding([JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") axis1d,
    float min)
  + ### CharacterJoypadButtonBinding

    private CharacterJoypadButtonBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") axis2d,
    float min,
    float max)
  + ### CharacterJoypadButtonBinding

    private CharacterJoypadButtonBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") axis2d,
    float min)
* Method Details
  --------------

  + ### values

    public static [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### allBindings

    public static [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters")[] allBindings()
  + ### findBinding

    public static [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") findBinding([JoypadButton](../input/JoypadButton.html "enum class in zombie.input") joypadButton)
  + ### findBindings

    public static [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters")[] findBindings([JoypadButton](../input/JoypadButton.html "enum class in zombie.input") joypadButton)
  + ### findBindings

    public static [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters")[] findBindings([JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") joypadAxis)
  + ### findBindings

    public static [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters")[] findBindings([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") joypadAxis)
  + ### fromString

    public static [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") fromString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getNameTranslationKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNameTranslationKey()
  + ### getJoypadButton

    public [JoypadButton](../input/JoypadButton.html "enum class in zombie.input") getJoypadButton()
  + ### getJoypadAxis1d

    public [JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") getJoypadAxis1d()
  + ### getJoypadAxis2d

    public [JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") getJoypadAxis2d()
  + ### getBinding

    public [CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html "interface in zombie.characters") getBinding()
  + ### getAxisMinThreshold

    public float getAxisMinThreshold()
  + ### getAxisMaxThreshold

    public float getAxisMaxThreshold()
  + ### isAxisMaxThresholdInfinity

    public boolean isAxisMaxThresholdInfinity()
  + ### containsBinding

    public boolean containsBinding([JoypadButton](../input/JoypadButton.html "enum class in zombie.input") button)
  + ### containsBinding

    public boolean containsBinding([JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") axis1d)
  + ### containsBinding

    public boolean containsBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") axis2d)
  + ### removeBinding

    public void removeBinding([JoypadButton](../input/JoypadButton.html "enum class in zombie.input") button)
  + ### removeBinding

    public void removeBinding([JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") axis1d)
  + ### removeBinding

    public void removeBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") axis2d)
  + ### addBinding

    public void addBinding([JoypadButton](../input/JoypadButton.html "enum class in zombie.input") button)
  + ### addBinding

    public void addBinding([JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") axis1d)
  + ### addBinding

    public void addBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") axis2d)
  + ### moveBindingFrom

    public void moveBindingFrom([CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") fromBinding)
  + ### setBinding

    public void setBinding([JoypadButton](../input/JoypadButton.html "enum class in zombie.input") newBinding)
  + ### setBinding

    public void setBinding([JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") axis1d,
    float min,
    float max)
  + ### setBinding

    public void setBinding([JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") axis1d,
    float min)
  + ### setBinding

    public void setBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") axis2d,
    float min,
    float max)
  + ### setBinding

    public void setBinding([JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") axis2d,
    float min)
  + ### setDefault

    public void setDefault()
  + ### setAllToDefault

    public static void setAllToDefault()
  + ### isDown

    public boolean isDown(int joypadBind)