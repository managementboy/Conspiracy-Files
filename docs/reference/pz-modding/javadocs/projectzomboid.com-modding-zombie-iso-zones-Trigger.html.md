[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.zones](package-summary.html)
2. [Trigger](Trigger.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [def](#def)
   2. [triggerRange](#triggerRange)
   3. [zombieExclusionRange](#zombieExclusionRange)
   4. [type](#type)
   5. [triggered](#triggered)
   6. [data](#data)
6. [Constructor Details](#constructor-detail)
   1. [Trigger(BuildingDef, int, int, String)](#%3Cinit%3E(zombie.iso.BuildingDef,int,int,java.lang.String))
7. [Method Details](#method-detail)
   1. [getModData()](#getModData())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Trigger
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.zones.Trigger

---

public final class Trigger
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `se.krka.kahlua.vm.KahluaTable`

  `data`

  `BuildingDef`

  `def`

  `boolean`

  `triggered`

  `int`

  `triggerRange`

  `String`

  `type`

  `int`

  `zombieExclusionRange`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Trigger(BuildingDef def,
  int triggerRange,
  int zombieExclusionRange,
  String type)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `se.krka.kahlua.vm.KahluaTable`

  `getModData()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### def

    public [BuildingDef](../BuildingDef.html "class in zombie.iso") def
  + ### triggerRange

    public int triggerRange
  + ### zombieExclusionRange

    public int zombieExclusionRange
  + ### type

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### triggered

    public boolean triggered
  + ### data

    public se.krka.kahlua.vm.KahluaTable data
* Constructor Details
  -------------------

  + ### Trigger

    public Trigger([BuildingDef](../BuildingDef.html "class in zombie.iso") def,
    int triggerRange,
    int zombieExclusionRange,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
* Method Details
  --------------

  + ### getModData

    public se.krka.kahlua.vm.KahluaTable getModData()