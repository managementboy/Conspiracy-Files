[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [Faction](Faction.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [owner](#owner)
   3. [tag](#tag)
   4. [tagColor](#tagColor)
   5. [players](#players)
   6. [factions](#factions)
6. [Constructor Details](#constructor-detail)
   1. [Faction()](#%3Cinit%3E())
   2. [Faction(String, String)](#%3Cinit%3E(java.lang.String,java.lang.String))
7. [Method Details](#method-detail)
   1. [getFactions()](#getFactions())
   2. [canCreateFaction(IsoPlayer)](#canCreateFaction(zombie.characters.IsoPlayer))
   3. [canCreateTag()](#canCreateTag())
   4. [isInSameFaction(IsoPlayer, IsoPlayer)](#isInSameFaction(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer))
   5. [isInSameFaction(IsoPlayer, String)](#isInSameFaction(zombie.characters.IsoPlayer,java.lang.String))
   6. [isAlreadyInFaction(String)](#isAlreadyInFaction(java.lang.String))
   7. [isAlreadyInFaction(IsoPlayer)](#isAlreadyInFaction(zombie.characters.IsoPlayer))
   8. [removePlayer(String)](#removePlayer(java.lang.String))
   9. [factionExist(String)](#factionExist(java.lang.String))
   10. [tagExist(String)](#tagExist(java.lang.String))
   11. [getPlayerFaction(IsoPlayer)](#getPlayerFaction(zombie.characters.IsoPlayer))
   12. [getPlayerFaction(String)](#getPlayerFaction(java.lang.String))
   13. [getFaction(String)](#getFaction(java.lang.String))
   14. [isOwner(String)](#isOwner(java.lang.String))
   15. [isMember(String)](#isMember(java.lang.String))
   16. [writeToBuffer(ByteBufferWriter, boolean)](#writeToBuffer(zombie.core.network.ByteBufferWriter,boolean))
   17. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   18. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   19. [addPlayer(String)](#addPlayer(java.lang.String))
   20. [getPlayers()](#getPlayers())
   21. [getTagColor()](#getTagColor())
   22. [setTagColor(ColorInfo)](#setTagColor(zombie.core.textures.ColorInfo))
   23. [getTag()](#getTag())
   24. [setTag(String)](#setTag(java.lang.String))
   25. [getName()](#getName())
   26. [setName(String)](#setName(java.lang.String))
   27. [getOwner()](#getOwner())
   28. [setOwner(String)](#setOwner(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Faction
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.Invite

zombie.characters.Faction

---

public final class Faction
extends zombie.characters.Invite

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static ArrayList<Faction>`

  `factions`

  `private String`

  `name`

  `private String`

  `owner`

  `private final ArrayList<String>`

  `players`

  `private String`

  `tag`

  `private ColorInfo`

  `tagColor`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Faction()`

  `Faction(String name,
  String owner)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addPlayer(String pName)`

  `static boolean`

  `canCreateFaction(IsoPlayer player)`

  `boolean`

  `canCreateTag()`

  `static boolean`

  `factionExist(String name)`

  `static Faction`

  `getFaction(String name)`

  `static ArrayList<Faction>`

  `getFactions()`

  `String`

  `getName()`

  `String`

  `getOwner()`

  `static Faction`

  `getPlayerFaction(String username)`

  `static Faction`

  `getPlayerFaction(IsoPlayer player)`

  `ArrayList<String>`

  `getPlayers()`

  `String`

  `getTag()`

  `ColorInfo`

  `getTagColor()`

  `static boolean`

  `isAlreadyInFaction(String username)`

  `static boolean`

  `isAlreadyInFaction(IsoPlayer player)`

  `static boolean`

  `isInSameFaction(IsoPlayer player,
  String username)`

  `static boolean`

  `isInSameFaction(IsoPlayer player,
  IsoPlayer other)`

  `boolean`

  `isMember(String name)`

  `boolean`

  `isOwner(String name)`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `removePlayer(String player)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setName(String name)`

  `void`

  `setOwner(String owner)`

  `void`

  `setTag(String tag)`

  `void`

  `setTagColor(ColorInfo tagColor)`

  `static boolean`

  `tagExist(String name)`

  `void`

  `writeToBuffer(zombie.core.network.ByteBufferWriter bb,
  boolean remove)`

  ### Methods inherited from class zombie.characters.Invite

  `addInvite, hasInvite, removeInvite`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### owner

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") owner
  + ### tag

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag
  + ### tagColor

    private [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") tagColor
  + ### players

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> players
  + ### factions

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Faction](Faction.html "class in zombie.characters")> factions
* Constructor Details
  -------------------

  + ### Faction

    public Faction()
  + ### Faction

    public Faction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") owner)
* Method Details
  --------------

  + ### getFactions

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Faction](Faction.html "class in zombie.characters")> getFactions()
  + ### canCreateFaction

    public static boolean canCreateFaction([IsoPlayer](IsoPlayer.html "class in zombie.characters") player)
  + ### canCreateTag

    public boolean canCreateTag()
  + ### isInSameFaction

    public static boolean isInSameFaction([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [IsoPlayer](IsoPlayer.html "class in zombie.characters") other)
  + ### isInSameFaction

    public static boolean isInSameFaction([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### isAlreadyInFaction

    public static boolean isAlreadyInFaction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### isAlreadyInFaction

    public static boolean isAlreadyInFaction([IsoPlayer](IsoPlayer.html "class in zombie.characters") player)
  + ### removePlayer

    public void removePlayer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") player)
  + ### factionExist

    public static boolean factionExist([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### tagExist

    public static boolean tagExist([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getPlayerFaction

    public static [Faction](Faction.html "class in zombie.characters") getPlayerFaction([IsoPlayer](IsoPlayer.html "class in zombie.characters") player)
  + ### getPlayerFaction

    public static [Faction](Faction.html "class in zombie.characters") getPlayerFaction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username)
  + ### getFaction

    public static [Faction](Faction.html "class in zombie.characters") getFaction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### isOwner

    public boolean isOwner([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### isMember

    public boolean isMember([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### writeToBuffer

    public void writeToBuffer(zombie.core.network.ByteBufferWriter bb,
    boolean remove)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### addPlayer

    public void addPlayer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pName)
  + ### getPlayers

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getPlayers()
  + ### getTagColor

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") getTagColor()
  + ### setTagColor

    public void setTagColor([ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") tagColor)
  + ### getTag

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTag()
  + ### setTag

    public void setTag([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getOwner

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOwner()
  + ### setOwner

    public void setOwner([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") owner)