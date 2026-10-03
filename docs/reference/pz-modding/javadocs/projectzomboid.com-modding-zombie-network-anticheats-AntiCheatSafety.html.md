[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.network.anticheats](package-summary.html)
2. [AntiCheatSafety](AntiCheatSafety.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [AntiCheatSafety()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [validate(UdpConnection, INetworkPacket)](#validate(zombie.core.raknet.UdpConnection,zombie.network.packets.INetworkPacket))
   2. [isPvPBlocked(IsoPlayer, IsoPlayer)](#isPvPBlocked(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer))
   3. [isFactionPvPBlocked(IsoPlayer, IsoPlayer)](#isFactionPvPBlocked(zombie.characters.IsoPlayer,zombie.characters.IsoPlayer))
   4. [isInNonPvPBlockedState(IsoPlayer)](#isInNonPvPBlockedState(zombie.characters.IsoPlayer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AntiCheatSafety
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.anticheats.AbstractAntiCheat

zombie.network.anticheats.AntiCheatSafety

---

public class AntiCheatSafety
extends zombie.network.anticheats.AbstractAntiCheat

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static interface`

  `AntiCheatSafety.IAntiCheat`
* Field Summary
  -------------

  ### Fields inherited from class zombie.network.anticheats.AbstractAntiCheat

  `antiCheat`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AntiCheatSafety()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static boolean`

  `isFactionPvPBlocked(IsoPlayer wielder,
  IsoPlayer target)`

  `private static boolean`

  `isInNonPvPBlockedState(IsoPlayer player)`

  `private static boolean`

  `isPvPBlocked(IsoPlayer wielder,
  IsoPlayer target)`

  `String`

  `validate(zombie.core.raknet.UdpConnection connection,
  zombie.network.packets.INetworkPacket packet)`

  ### Methods inherited from class zombie.network.anticheats.AbstractAntiCheat

  `react, setAntiCheat, update`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### AntiCheatSafety

    public AntiCheatSafety()
* Method Details
  --------------

  + ### validate

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validate(zombie.core.raknet.UdpConnection connection,
    zombie.network.packets.INetworkPacket packet)

    Overrides:
    :   `validate` in class `zombie.network.anticheats.AbstractAntiCheat`
  + ### isPvPBlocked

    private static boolean isPvPBlocked([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") wielder,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") target)
  + ### isFactionPvPBlocked

    private static boolean isFactionPvPBlocked([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") wielder,
    [IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") target)
  + ### isInNonPvPBlockedState

    private static boolean isInNonPvPBlockedState([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)