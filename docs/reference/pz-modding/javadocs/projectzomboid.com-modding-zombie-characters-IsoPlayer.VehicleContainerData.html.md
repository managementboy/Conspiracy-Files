[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoPlayer](IsoPlayer.html)
3. [VehicleContainerData](IsoPlayer.VehicleContainerData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tempContainers](#tempContainers)
   2. [containers](#containers)
   3. [freeContainers](#freeContainers)
6. [Constructor Details](#constructor-detail)
   1. [VehicleContainerData()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoPlayer.VehicleContainerData
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoPlayer.VehicleContainerData

Enclosing class:
:   `IsoPlayer`

---

private static class IsoPlayer.VehicleContainerData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<IsoPlayer.VehicleContainer>`

  `containers`

  `private final Stack<IsoPlayer.VehicleContainer>`

  `freeContainers`

  `private final ArrayList<IsoPlayer.VehicleContainer>`

  `tempContainers`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `VehicleContainerData()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tempContainers

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer.VehicleContainer](IsoPlayer.VehicleContainer.html "class in zombie.characters")> tempContainers
  + ### containers

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoPlayer.VehicleContainer](IsoPlayer.VehicleContainer.html "class in zombie.characters")> containers
  + ### freeContainers

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoPlayer.VehicleContainer](IsoPlayer.VehicleContainer.html "class in zombie.characters")> freeContainers
* Constructor Details
  -------------------

  + ### VehicleContainerData

    private VehicleContainerData()