[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#tree)

1. [zombie.iso.objects](package-summary.html)

Hierarchy For Package zombie.iso.objects
========================================

Package Hierarchies:

* [All Packages](../../../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + zombie.entity.[GameEntity](../../entity/GameEntity.html "class in zombie.entity")
    - zombie.iso.[IsoObject](../IsoObject.html "class in zombie.iso") (implements zombie.characters.ecs.ECSEntity, zombie.iso.[ILuaIsoObject](../ILuaIsoObject.html "interface in zombie.iso"), zombie.iso.IsoRenderable, java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"), zombie.iso.objects.interfaces.Thumpable)
      * zombie.iso.objects.[IsoAnimalTrack](IsoAnimalTrack.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoBarbecue](IsoBarbecue.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoBarricade](IsoBarricade.html "class in zombie.iso.objects") (implements zombie.iso.IHasHealth, zombie.iso.objects.interfaces.Thumpable)
      * zombie.iso.objects.[IsoBrokenGlass](IsoBrokenGlass.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoCarBatteryCharger](IsoCarBatteryCharger.html "class in zombie.iso.objects") (implements zombie.iso.IItemProvider)
      * zombie.iso.objects.[IsoClothingDryer](IsoClothingDryer.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoClothingWasher](IsoClothingWasher.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoCombinationWasherDryer](IsoCombinationWasherDryer.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoCompost](IsoCompost.html "class in zombie.iso.objects") (implements zombie.iso.IHasHealth, zombie.iso.objects.interfaces.Thumpable)
      * zombie.iso.objects.[IsoCurtain](IsoCurtain.html "class in zombie.iso.objects") (implements zombie.iso.ICurtain)
      * zombie.iso.objects.[IsoDoor](IsoDoor.html "class in zombie.iso.objects") (implements zombie.iso.objects.interfaces.[BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces"), zombie.iso.ICurtain, zombie.iso.IHasHealth, zombie.iso.ILockableDoor, zombie.iso.objects.interfaces.Thumpable)
      * zombie.iso.objects.[IsoFeedingTrough](IsoFeedingTrough.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoFire](IsoFire.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoFireplace](IsoFireplace.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoGenerator](IsoGenerator.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoHutch](IsoHutch.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoJukebox](IsoJukebox.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoLightSwitch](IsoLightSwitch.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoMannequin](IsoMannequin.html "class in zombie.iso.objects") (implements zombie.core.skinnedmodel.visual.[IHumanVisual](../../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual"))
      * zombie.iso.[IsoMovingObject](../IsoMovingObject.html "class in zombie.iso") (implements zombie.ai.astar.Mover)
        + zombie.iso.objects.[IsoDeadBody](IsoDeadBody.html "class in zombie.iso.objects") (implements zombie.core.skinnedmodel.visual.[IAnimalVisual](../../core/skinnedmodel/visual/IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual"), zombie.core.skinnedmodel.IGrappleableWrapper, zombie.core.skinnedmodel.visual.[IHumanVisual](../../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual"), zombie.network.id.IIdentifiable, zombie.iso.IItemProvider, zombie.network.fields.IPositional, zombie.characters.Talker)
        + zombie.iso.IsoPhysicsObject
          - zombie.iso.objects.[IsoFallingClothing](IsoFallingClothing.html "class in zombie.iso.objects")
          - zombie.iso.objects.[IsoMolotovCocktail](IsoMolotovCocktail.html "class in zombie.iso.objects")
          - zombie.iso.objects.[IsoZombieGiblets](IsoZombieGiblets.html "class in zombie.iso.objects")
        + zombie.iso.[IsoPushableObject](../IsoPushableObject.html "class in zombie.iso")
          - zombie.iso.objects.[IsoWheelieBin](IsoWheelieBin.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoStackedWasherDryer](IsoStackedWasherDryer.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoStove](IsoStove.html "class in zombie.iso.objects") (implements zombie.iso.objects.interfaces.Activatable)
      * zombie.iso.objects.[IsoThumpable](IsoThumpable.html "class in zombie.iso.objects") (implements zombie.iso.objects.interfaces.[BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces"), zombie.iso.IHasHealth, zombie.iso.ILockableDoor, zombie.iso.objects.interfaces.Thumpable)
      * zombie.iso.objects.[IsoTrap](IsoTrap.html "class in zombie.iso.objects") (implements zombie.iso.IItemProvider)
      * zombie.iso.objects.[IsoTree](IsoTree.html "class in zombie.iso.objects") (implements zombie.iso.IHasHealth)
      * zombie.iso.objects.[IsoWaveSignal](IsoWaveSignal.html "class in zombie.iso.objects") (implements zombie.chat.ChatElementOwner, zombie.characters.Talker, zombie.radio.devices.[WaveSignalDevice](../../radio/devices/WaveSignalDevice.html "interface in zombie.radio.devices"))
        + zombie.iso.objects.[IsoRadio](IsoRadio.html "class in zombie.iso.objects")
        + zombie.iso.objects.[IsoTelevision](IsoTelevision.html "class in zombie.iso.objects")
      * zombie.iso.objects.[IsoWindow](IsoWindow.html "class in zombie.iso.objects") (implements zombie.iso.objects.interfaces.[BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces"), zombie.iso.objects.interfaces.Thumpable)
      * zombie.iso.objects.[IsoWindowFrame](IsoWindowFrame.html "class in zombie.iso.objects") (implements zombie.iso.objects.interfaces.[BarricadeAble](interfaces/BarricadeAble.html "interface in zombie.iso.objects.interfaces"))
      * zombie.iso.objects.[IsoWorldInventoryObject](IsoWorldInventoryObject.html "class in zombie.iso.objects") (implements zombie.iso.IItemProvider)
  + zombie.iso.objects.[IsoFireManager](IsoFireManager.html "class in zombie.iso.objects")
  + zombie.iso.objects.[IsoFireManager.FireSounds](IsoFireManager.FireSounds.html "class in zombie.iso.objects")
  + zombie.iso.objects.[IsoFireManager.FireSounds.Slot](IsoFireManager.FireSounds.Slot.html "class in zombie.iso.objects")
  + zombie.iso.objects.[IsoHutch.AgeComparator](IsoHutch.AgeComparator.html "class in zombie.iso.objects") (implements java.util.[Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<T>)
  + zombie.iso.objects.[IsoHutch.NestBox](IsoHutch.NestBox.html "class in zombie.iso.objects")
  + zombie.iso.objects.[IsoMannequin.PerPlayer](IsoMannequin.PerPlayer.html "class in zombie.iso.objects")
  + zombie.iso.objects.[IsoMannequin.StaticPerPlayer](IsoMannequin.StaticPerPlayer.html "class in zombie.iso.objects")
  + zombie.iso.objects.[IsoTree.TreeShader](IsoTree.TreeShader.html "class in zombie.iso.objects")
  + zombie.iso.objects.[ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects")
  + zombie.iso.objects.[RainManager](RainManager.html "class in zombie.iso.objects")
  + zombie.core.textures.TextureDraw.GenericDrawer
    - zombie.iso.objects.[IsoMannequin.Drawer](IsoMannequin.Drawer.html "class in zombie.iso.objects")
  + zombie.iso.zones.[Zone](../zones/Zone.html "class in zombie.iso.zones")
    - zombie.iso.objects.[IsoMannequin.MannequinZone](IsoMannequin.MannequinZone.html "class in zombie.iso.objects")

Enum Class Hierarchy
--------------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + java.lang.[Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> (implements java.lang.[Comparable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Comparable.html "class or interface in java.lang")<T>, java.lang.constant.[Constable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/constant/Constable.html "class or interface in java.lang.constant"), java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
    - zombie.iso.objects.[IsoDoor.DoorType](IsoDoor.DoorType.html "enum class in zombie.iso.objects")
    - zombie.iso.objects.[IsoTelevision.Screens](IsoTelevision.Screens.html "enum class in zombie.iso.objects")
    - zombie.iso.objects.[IsoTrap.ExplosionMode](IsoTrap.ExplosionMode.html "enum class in zombie.iso.objects")
    - zombie.iso.objects.[IsoWindow.LockedHouseFrequency](IsoWindow.LockedHouseFrequency.html "enum class in zombie.iso.objects")
    - zombie.iso.objects.[IsoWindow.WindowType](IsoWindow.WindowType.html "enum class in zombie.iso.objects")
    - zombie.iso.objects.[IsoWindowFrame.Direction](IsoWindowFrame.Direction.html "enum class in zombie.iso.objects")
    - zombie.iso.objects.[IsoZombieGiblets.GibletType](IsoZombieGiblets.GibletType.html "enum class in zombie.iso.objects")