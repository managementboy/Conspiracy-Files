[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.network.anticheats](package-summary.html)
2. [AntiCheatCapability](AntiCheatCapability.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [AntiCheatCapability()](#%3Cinit%3E())
6. [Method Details](#method-detail)
   1. [validate(UdpConnection, Capability)](#validate(zombie.core.raknet.UdpConnection,zombie.characters.Capability))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AntiCheatCapability
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.anticheats.AbstractAntiCheat

zombie.network.anticheats.AntiCheatCapability

---

public class AntiCheatCapability
extends zombie.network.anticheats.AbstractAntiCheat

* Field Summary
  -------------

  ### Fields inherited from class zombie.network.anticheats.AbstractAntiCheat

  `antiCheat`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AntiCheatCapability()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static boolean`

  `validate(zombie.core.raknet.UdpConnection connection,
  Capability capability)`

  ### Methods inherited from class zombie.network.anticheats.AbstractAntiCheat

  `react, setAntiCheat, update, validate`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### AntiCheatCapability

    public AntiCheatCapability()
* Method Details
  --------------

  + ### validate

    public static boolean validate(zombie.core.raknet.UdpConnection connection,
    [Capability](../../characters/Capability.html "enum class in zombie.characters") capability)