[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [PlayerCraftHistory](PlayerCraftHistory.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [MAX\_HISTORY\_SIZE](#MAX_HISTORY_SIZE)
   2. [MAX\_RETAINED\_ENTRIES](#MAX_RETAINED_ENTRIES)
   3. [player](#player)
   4. [craftHistory](#craftHistory)
   5. [craftHistoryDefaultEntry](#craftHistoryDefaultEntry)
7. [Constructor Details](#constructor-detail)
   1. [PlayerCraftHistory(IsoPlayer)](#%3Cinit%3E(zombie.characters.IsoPlayer))
8. [Method Details](#method-detail)
   1. [getCraftHistoryFor(String)](#getCraftHistoryFor(java.lang.String))
   2. [addCraftHistoryCraftedEvent(String)](#addCraftHistoryCraftedEvent(java.lang.String))
   3. [cleanupHistory()](#cleanupHistory())
   4. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   5. [load(ByteBuffer)](#load(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PlayerCraftHistory
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.PlayerCraftHistory

---

public class PlayerCraftHistory
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

S.Purcival (The Tea Division)
Player crafting history

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `PlayerCraftHistory.CraftHistoryEntry`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashMap<String, PlayerCraftHistory.CraftHistoryEntry>`

  `craftHistory`

  `private static final PlayerCraftHistory.CraftHistoryEntry`

  `craftHistoryDefaultEntry`

  `private static final int`

  `MAX_HISTORY_SIZE`

  `private static final int`

  `MAX_RETAINED_ENTRIES`

  `private final IsoPlayer`

  `player`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PlayerCraftHistory(IsoPlayer player)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addCraftHistoryCraftedEvent(String craftType)`

  `void`

  `cleanupHistory()`

  `PlayerCraftHistory.CraftHistoryEntry`

  `getCraftHistoryFor(String craftType)`

  `void`

  `load(ByteBuffer input)`

  `void`

  `save(ByteBuffer output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### MAX\_HISTORY\_SIZE

    private static final int MAX\_HISTORY\_SIZE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.PlayerCraftHistory.MAX_HISTORY_SIZE)
  + ### MAX\_RETAINED\_ENTRIES

    private static final int MAX\_RETAINED\_ENTRIES

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.PlayerCraftHistory.MAX_RETAINED_ENTRIES)
  + ### player

    private final [IsoPlayer](IsoPlayer.html "class in zombie.characters") player
  + ### craftHistory

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [PlayerCraftHistory.CraftHistoryEntry](PlayerCraftHistory.CraftHistoryEntry.html "class in zombie.characters")> craftHistory
  + ### craftHistoryDefaultEntry

    private static final [PlayerCraftHistory.CraftHistoryEntry](PlayerCraftHistory.CraftHistoryEntry.html "class in zombie.characters") craftHistoryDefaultEntry
* Constructor Details
  -------------------

  + ### PlayerCraftHistory

    public PlayerCraftHistory([IsoPlayer](IsoPlayer.html "class in zombie.characters") player)
* Method Details
  --------------

  + ### getCraftHistoryFor

    public [PlayerCraftHistory.CraftHistoryEntry](PlayerCraftHistory.CraftHistoryEntry.html "class in zombie.characters") getCraftHistoryFor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") craftType)
  + ### addCraftHistoryCraftedEvent

    public void addCraftHistoryCraftedEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") craftType)
  + ### cleanupHistory

    public void cleanupHistory()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)