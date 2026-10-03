[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [EditVehicleState](EditVehicleState.html)
3. [LuaEnvironment](EditVehicleState.LuaEnvironment.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [platform](#platform)
   2. [env](#env)
   3. [thread](#thread)
   4. [caller](#caller)
6. [Constructor Details](#constructor-detail)
   1. [LuaEnvironment(J2SEPlatform, KahluaConverterManager, KahluaTable)](#%3Cinit%3E(se.krka.kahlua.j2se.J2SEPlatform,se.krka.kahlua.converter.KahluaConverterManager,se.krka.kahlua.vm.KahluaTable))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class EditVehicleState.LuaEnvironment
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.EditVehicleState.LuaEnvironment

Enclosing class:
:   `EditVehicleState`

---

public static final class EditVehicleState.LuaEnvironment
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `se.krka.kahlua.integration.LuaCaller`

  `caller`

  `se.krka.kahlua.vm.KahluaTable`

  `env`

  `se.krka.kahlua.j2se.J2SEPlatform`

  `platform`

  `se.krka.kahlua.vm.KahluaThread`

  `thread`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LuaEnvironment(se.krka.kahlua.j2se.J2SEPlatform platform,
  se.krka.kahlua.converter.KahluaConverterManager converterManager,
  se.krka.kahlua.vm.KahluaTable env)`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### platform

    public se.krka.kahlua.j2se.J2SEPlatform platform
  + ### env

    public se.krka.kahlua.vm.KahluaTable env
  + ### thread

    public se.krka.kahlua.vm.KahluaThread thread
  + ### caller

    public se.krka.kahlua.integration.LuaCaller caller
* Constructor Details
  -------------------

  + ### LuaEnvironment

    public LuaEnvironment(se.krka.kahlua.j2se.J2SEPlatform platform,
    se.krka.kahlua.converter.KahluaConverterManager converterManager,
    se.krka.kahlua.vm.KahluaTable env)