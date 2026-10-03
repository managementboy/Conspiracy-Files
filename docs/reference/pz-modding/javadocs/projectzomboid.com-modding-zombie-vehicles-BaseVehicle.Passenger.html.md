[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [BaseVehicle](BaseVehicle.html)
3. [Passenger](BaseVehicle.Passenger.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [character](#character)
   2. [offset](#offset)
   3. [nameCoordCache](#nameCoordCache)
   4. [nameAlignment](#nameAlignment)
6. [Constructor Details](#constructor-detail)
   1. [Passenger()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseVehicle.Passenger
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.BaseVehicle.Passenger

Enclosing class:
:   `BaseVehicle`

---

public static final class BaseVehicle.Passenger
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `IsoGameCharacter`

  `character`

  `private zombie.ui.TextDrawHorizontal`

  `nameAlignment`

  `private final Vector2`

  `nameCoordCache`

  `private final Vector3f`

  `offset`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Passenger()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### character

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character
  + ### offset

    private final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") offset
  + ### nameCoordCache

    private final [Vector2](../iso/Vector2.html "class in zombie.iso") nameCoordCache
  + ### nameAlignment

    private zombie.ui.TextDrawHorizontal nameAlignment
* Constructor Details
  -------------------

  + ### Passenger

    public Passenger()