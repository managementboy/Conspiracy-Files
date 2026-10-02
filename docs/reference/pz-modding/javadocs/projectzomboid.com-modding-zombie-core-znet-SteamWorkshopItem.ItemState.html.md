[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.znet](package-summary.html)
2. [SteamWorkshopItem](SteamWorkshopItem.html)
3. [ItemState](SteamWorkshopItem.ItemState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [None](#None)
   2. [Subscribed](#Subscribed)
   3. [LegacyItem](#LegacyItem)
   4. [Installed](#Installed)
   5. [NeedsUpdate](#NeedsUpdate)
   6. [Downloading](#Downloading)
   7. [DownloadPending](#DownloadPending)
8. [Field Details](#field-detail)
   1. [value](#value)
9. [Constructor Details](#constructor-detail)
   1. [ItemState(int)](#%3Cinit%3E(int))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getValue()](#getValue())
    4. [and(SteamWorkshopItem.ItemState)](#and(zombie.core.znet.SteamWorkshopItem.ItemState))
    5. [and(long)](#and(long))
    6. [not(long)](#not(long))
    7. [toString(long)](#toString(long))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class SteamWorkshopItem.ItemState
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet")>

zombie.core.znet.SteamWorkshopItem.ItemState

All Implemented Interfaces:
:   `Serializable, Comparable<SteamWorkshopItem.ItemState>, Constable`

Enclosing class:
:   `SteamWorkshopItem`

---

public static enum SteamWorkshopItem.ItemState
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Downloading`

  `DownloadPending`

  `Installed`

  `LegacyItem`

  `NeedsUpdate`

  `None`

  `Subscribed`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `value`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ItemState(int value)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `and(long bits)`

  `boolean`

  `and(SteamWorkshopItem.ItemState other)`

  `int`

  `getValue()`

  `boolean`

  `not(long bits)`

  `static String`

  `toString(long bits)`

  `static SteamWorkshopItem.ItemState`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static SteamWorkshopItem.ItemState[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### None

    public static final [SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet") None
  + ### Subscribed

    public static final [SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet") Subscribed
  + ### LegacyItem

    public static final [SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet") LegacyItem
  + ### Installed

    public static final [SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet") Installed
  + ### NeedsUpdate

    public static final [SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet") NeedsUpdate
  + ### Downloading

    public static final [SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet") Downloading
  + ### DownloadPending

    public static final [SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet") DownloadPending
* Field Details
  -------------

  + ### value

    private final int value
* Constructor Details
  -------------------

  + ### ItemState

    private ItemState(int value)
* Method Details
  --------------

  + ### values

    public static [SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

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
  + ### getValue

    public int getValue()
  + ### and

    public boolean and([SteamWorkshopItem.ItemState](SteamWorkshopItem.ItemState.html "enum class in zombie.core.znet") other)
  + ### and

    public boolean and(long bits)
  + ### not

    public boolean not(long bits)
  + ### toString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString(long bits)