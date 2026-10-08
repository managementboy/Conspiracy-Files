[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [ILuaIsoObject](ILuaIsoObject.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [setDir(IsoDirections)](#setDir(zombie.iso.IsoDirections))
   2. [setForwardIsoDirection(IsoDirections)](#setForwardIsoDirection(zombie.iso.IsoDirections))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Interface ILuaIsoObject
=======================

All Known Implementing Classes:
:   `BaseVehicle, IsoAnimal, IsoAnimalTrack, IsoBarbecue, IsoBarricade, IsoBrokenGlass, IsoButcherHook, IsoCarBatteryCharger, IsoClothingDryer, IsoClothingWasher, IsoCombinationWasherDryer, IsoCompost, IsoCurtain, IsoDeadBody, IsoDoor, IsoDummyCameraCharacter, IsoFallingClothing, IsoFeedingTrough, IsoFire, IsoFireplace, IsoGameCharacter, IsoGenerator, IsoHutch, IsoJukebox, IsoLightSwitch, zombie.characters.IsoLivingCharacter, IsoLuaMover, IsoMannequin, IsoMolotovCocktail, IsoMovingObject, IsoObject, zombie.iso.IsoPhysicsObject, IsoPlayer, IsoPushableObject, IsoRadio, IsoStackedWasherDryer, IsoStove, IsoSurvivor, IsoTelevision, IsoThumpable, IsoTrap, IsoTree, IsoWaveSignal, IsoWheelieBin, IsoWindow, IsoWindowFrame, IsoWorldInventoryObject, IsoZombie, IsoZombieGiblets, RandomizedBuildingBase.HumanCorpse`

---

public interface ILuaIsoObject

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsDefault Methods

  Modifier and Type

  Method

  Description

  `default void`

  `setDir(IsoDirections directions)`

  `void`

  `setForwardIsoDirection(IsoDirections dir)`

* Method Details
  --------------

  + ### setDir

    default void setDir([IsoDirections](IsoDirections.html "enum class in zombie.iso") directions)
  + ### setForwardIsoDirection

    void setForwardIsoDirection([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir)