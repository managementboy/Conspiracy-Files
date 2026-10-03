[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#tree)

1. [zombie.inventory.types](package-summary.html)

Hierarchy For Package zombie.inventory.types
============================================

Package Hierarchies:

* [All Packages](../../../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + zombie.inventory.types.[Clothing.ClothingPatch](Clothing.ClothingPatch.html "class in zombie.inventory.types")
  + zombie.entity.[GameEntity](../../entity/GameEntity.html "class in zombie.entity")
    - zombie.inventory.[InventoryItem](../InventoryItem.html "class in zombie.inventory")
      * zombie.inventory.types.[AlarmClock](AlarmClock.html "class in zombie.inventory.types") (implements zombie.inventory.types.[IAlarmClock](IAlarmClock.html "interface in zombie.inventory.types"))
      * zombie.inventory.types.[AnimalInventoryItem](AnimalInventoryItem.html "class in zombie.inventory.types")
      * zombie.inventory.types.[Clothing](Clothing.html "class in zombie.inventory.types")
        + zombie.inventory.types.[AlarmClockClothing](AlarmClockClothing.html "class in zombie.inventory.types") (implements zombie.inventory.types.[IAlarmClock](IAlarmClock.html "interface in zombie.inventory.types"))
      * zombie.inventory.types.[ComboItem](ComboItem.html "class in zombie.inventory.types")
      * zombie.inventory.types.[DrainableComboItem](DrainableComboItem.html "class in zombie.inventory.types") (implements zombie.inventory.types.[Drainable](Drainable.html "interface in zombie.inventory.types"), zombie.interfaces.IUpdater)
      * zombie.inventory.types.[Food](Food.html "class in zombie.inventory.types")
      * zombie.inventory.types.[HandWeapon](HandWeapon.html "class in zombie.inventory.types") (implements zombie.interfaces.IUpdater)
      * zombie.inventory.types.[InventoryContainer](InventoryContainer.html "class in zombie.inventory.types")
      * zombie.inventory.types.[Key](Key.html "class in zombie.inventory.types")
      * zombie.inventory.types.[KeyRing](KeyRing.html "class in zombie.inventory.types")
      * zombie.inventory.types.[Literature](Literature.html "class in zombie.inventory.types")
      * zombie.inventory.types.[MapItem](MapItem.html "class in zombie.inventory.types")
      * zombie.inventory.types.[Moveable](Moveable.html "class in zombie.inventory.types")
        + zombie.inventory.types.[Radio](Radio.html "class in zombie.inventory.types") (implements zombie.interfaces.IUpdater, zombie.characters.Talker, zombie.radio.devices.[WaveSignalDevice](../../radio/devices/WaveSignalDevice.html "interface in zombie.radio.devices"))
      * zombie.inventory.types.[WeaponPart](WeaponPart.html "class in zombie.inventory.types") (implements zombie.inventory.types.[Drainable](Drainable.html "interface in zombie.inventory.types"), zombie.interfaces.IUpdater)
  + zombie.inventory.types.[Key.HighlightDoor](Key.HighlightDoor.html "class in zombie.inventory.types")

Interface Hierarchy
-------------------

* zombie.inventory.types.[Drainable](Drainable.html "interface in zombie.inventory.types")
* zombie.inventory.types.[IAlarmClock](IAlarmClock.html "interface in zombie.inventory.types")

Enum Class Hierarchy
--------------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + java.lang.[Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> (implements java.lang.[Comparable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Comparable.html "class or interface in java.lang")<T>, java.lang.constant.[Constable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/constant/Constable.html "class or interface in java.lang.constant"), java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
    - zombie.inventory.types.[Clothing.ClothingPatchFabricType](Clothing.ClothingPatchFabricType.html "enum class in zombie.inventory.types")
    - zombie.inventory.types.[Clothing.WetDryState](Clothing.WetDryState.html "enum class in zombie.inventory.types")
    - zombie.inventory.types.[WeaponType](WeaponType.html "enum class in zombie.inventory.types")