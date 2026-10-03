[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#tree)

1. [zombie.characters](package-summary.html)

Hierarchy For Package zombie.characters
=======================================

Package Hierarchies:

* [All Packages](../../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + zombie.characters.[BaseAnimalSoundManager](BaseAnimalSoundManager.html "class in zombie.characters")
  + zombie.characters.[BaseCharacterSoundEmitter](BaseCharacterSoundEmitter.html "class in zombie.characters")
    - zombie.characters.[CharacterSoundEmitter](CharacterSoundEmitter.html "class in zombie.characters") (implements zombie.interfaces.ICommonSoundEmitter)
    - zombie.characters.[DummyCharacterSoundEmitter](DummyCharacterSoundEmitter.html "class in zombie.characters")
  + zombie.characters.[BaseZombieSoundManager](BaseZombieSoundManager.html "class in zombie.characters")
  + zombie.characters.[CharacterInputBindingSet](CharacterInputBindingSet.html "class in zombie.characters")
  + zombie.characters.[CharacterInputBindingSetEntry](CharacterInputBindingSetEntry.html "class in zombie.characters")
    - zombie.characters.[CharacterInputBindingSet.Axis2dBinding](CharacterInputBindingSet.Axis2dBinding.html "class in zombie.characters")
    - zombie.characters.[CharacterInputBindingSet.ButtonAxis1dBinding](CharacterInputBindingSet.ButtonAxis1dBinding.html "class in zombie.characters")
    - zombie.characters.[CharacterInputBindingSet.ButtonAxis2dBinding](CharacterInputBindingSet.ButtonAxis2dBinding.html "class in zombie.characters")
    - zombie.characters.[CharacterInputBindingSet.ButtonBinding](CharacterInputBindingSet.ButtonBinding.html "class in zombie.characters")
  + zombie.characters.[CharacterJoypadButtonBinding.Axis1dMinMaxBinding](CharacterJoypadButtonBinding.Axis1dMinMaxBinding.html "class in zombie.characters") (implements zombie.characters.[CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html "interface in zombie.characters"))
  + zombie.characters.[CharacterJoypadButtonBinding.Axis2dMinMaxBinding](CharacterJoypadButtonBinding.Axis2dMinMaxBinding.html "class in zombie.characters") (implements zombie.characters.[CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html "interface in zombie.characters"))
  + zombie.characters.[CharacterJoypadButtonBinding.JoypadButtonBinding](CharacterJoypadButtonBinding.JoypadButtonBinding.html "class in zombie.characters") (implements zombie.characters.[CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html "interface in zombie.characters"))
  + zombie.characters.[CharacterStat](CharacterStat.html "class in zombie.characters")
  + zombie.entity.[GameEntity](../entity/GameEntity.html "class in zombie.entity")
    - zombie.iso.[IsoObject](../iso/IsoObject.html "class in zombie.iso") (implements zombie.characters.ecs.ECSEntity, zombie.iso.[ILuaIsoObject](../iso/ILuaIsoObject.html "interface in zombie.iso"), zombie.iso.IsoRenderable, java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"), zombie.iso.objects.interfaces.Thumpable)
      * zombie.iso.[IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") (implements zombie.ai.astar.Mover)
        + zombie.characters.[IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") (implements zombie.characters.CharacterInputComponentEntity, zombie.chat.ChatElementOwner, zombie.characters.action.IActionStateChanged, zombie.core.skinnedmodel.advancedanimation.IAnimatable, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap, zombie.core.skinnedmodel.advancedanimation.[IAnimationVariableRegistry](../core/skinnedmodel/advancedanimation/IAnimationVariableRegistry.html "interface in zombie.core.skinnedmodel.advancedanimation"), zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster, zombie.core.skinnedmodel.population.IClothingItemListener, fmod.fmod.IFMODParameterUpdater, zombie.core.skinnedmodel.IGrappleableWrapper, zombie.characters.ILuaGameCharacter, zombie.characters.ILuaVariableSource, zombie.ai.IStateCharacter, zombie.characters.Talker)
          - zombie.characters.[IsoDummyCameraCharacter](IsoDummyCameraCharacter.html "class in zombie.characters")
          - zombie.characters.IsoLivingCharacter
            * zombie.characters.[IsoPlayer](IsoPlayer.html "class in zombie.characters") (implements zombie.core.skinnedmodel.visual.[IAnimalVisual](../core/skinnedmodel/visual/IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual"), zombie.core.skinnedmodel.visual.[IHumanVisual](../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual"), zombie.network.fields.IPositional)
            * zombie.characters.[IsoSurvivor](IsoSurvivor.html "class in zombie.characters")
          - zombie.characters.[IsoZombie](IsoZombie.html "class in zombie.characters") (implements zombie.core.skinnedmodel.visual.[IHumanVisual](../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual"))
  + zombie.characters.[HaloTextHelper](HaloTextHelper.html "class in zombie.characters")
  + zombie.characters.[HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters")
  + zombie.characters.Invite
    - zombie.characters.[Faction](Faction.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.Bandages](IsoGameCharacter.Bandages.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.L\_getDotWithForwardDirection](IsoGameCharacter.L_getDotWithForwardDirection.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.L\_postUpdate](IsoGameCharacter.L_postUpdate.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.L\_renderLast](IsoGameCharacter.L_renderLast.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.L\_renderShadow](IsoGameCharacter.L_renderShadow.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.l\_testDotSide](IsoGameCharacter.l_testDotSide.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.LC\_slideAwayFromWalls](IsoGameCharacter.LC_slideAwayFromWalls.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.LightInfo](IsoGameCharacter.LightInfo.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.Location](IsoGameCharacter.Location.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.PerkInfo](IsoGameCharacter.PerkInfo.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.ReadBook](IsoGameCharacter.ReadBook.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.Recoil](IsoGameCharacter.Recoil.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.TorchInfo](IsoGameCharacter.TorchInfo.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.XP](IsoGameCharacter.XP.html "class in zombie.characters")
  + zombie.characters.[IsoGameCharacter.XPMultiplier](IsoGameCharacter.XPMultiplier.html "class in zombie.characters")
  + zombie.characters.[IsoPlayer.GrapplerGruntChance](IsoPlayer.GrapplerGruntChance.html "class in zombie.characters")
  + zombie.characters.[IsoPlayer.InputState](IsoPlayer.InputState.html "class in zombie.characters")
  + zombie.characters.[IsoPlayer.MoveVars](IsoPlayer.MoveVars.html "class in zombie.characters")
  + zombie.characters.[IsoPlayer.s\_performance](IsoPlayer.s_performance.html "class in zombie.characters")
  + zombie.characters.[IsoPlayer.VehicleContainer](IsoPlayer.VehicleContainer.html "class in zombie.characters")
  + zombie.characters.[IsoPlayer.VehicleContainerData](IsoPlayer.VehicleContainerData.html "class in zombie.characters")
  + zombie.characters.[IsoPlayer.VehicleHitDamageConstants](IsoPlayer.VehicleHitDamageConstants.html "class in zombie.characters")
  + zombie.characters.[IsoZombie.Aggro](IsoZombie.Aggro.html "class in zombie.characters")
  + zombie.characters.[IsoZombie.FloodFill](IsoZombie.FloodFill.html "class in zombie.characters")
  + zombie.characters.[IsoZombie.s\_performance](IsoZombie.s_performance.html "class in zombie.characters")
  + zombie.characters.[MoveDeltaModifiers](MoveDeltaModifiers.html "class in zombie.characters")
  + zombie.characters.[NetworkUser](NetworkUser.html "class in zombie.characters")
  + zombie.characters.[PlayerCraftHistory](PlayerCraftHistory.html "class in zombie.characters")
  + zombie.characters.[PlayerCraftHistory.CraftHistoryEntry](PlayerCraftHistory.CraftHistoryEntry.html "class in zombie.characters")
  + zombie.characters.[Position3D](Position3D.html "class in zombie.characters")
  + zombie.characters.[Role](Role.html "class in zombie.characters")
  + zombie.characters.[Safety](Safety.html "class in zombie.characters")
  + zombie.characters.[Stats](Stats.html "class in zombie.characters")
  + zombie.characters.[SurvivorDesc](SurvivorDesc.html "class in zombie.characters") (implements zombie.core.skinnedmodel.visual.[IHumanVisual](../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual"))
  + zombie.characters.[SurvivorFactory](SurvivorFactory.html "class in zombie.characters")

Interface Hierarchy
-------------------

* zombie.characters.[CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html "interface in zombie.characters")
* zombie.characters.[ILuaGameCharacterAttachedItems](ILuaGameCharacterAttachedItems.html "interface in zombie.characters")
* zombie.characters.[ILuaGameCharacterClothing](ILuaGameCharacterClothing.html "interface in zombie.characters")

Enum Class Hierarchy
--------------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + java.lang.[Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> (implements java.lang.[Comparable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Comparable.html "class or interface in java.lang")<T>, java.lang.constant.[Constable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/constant/Constable.html "class or interface in java.lang.constant"), java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"))
    - zombie.characters.[Capability](Capability.html "enum class in zombie.characters")
    - zombie.characters.[CharacterActionAnims](CharacterActionAnims.html "enum class in zombie.characters")
    - zombie.characters.[CharacterJoypadAxis2dBinding](CharacterJoypadAxis2dBinding.html "enum class in zombie.characters")
    - zombie.characters.[CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters")
    - zombie.characters.[CharacterSoundEmitter.footstep](CharacterSoundEmitter.footstep.html "enum class in zombie.characters")
    - zombie.characters.[CheatType](CheatType.html "enum class in zombie.characters")
    - zombie.characters.[IsoGameCharacter.BodyLocation](IsoGameCharacter.BodyLocation.html "enum class in zombie.characters")
    - zombie.characters.[IsoZombie.ZombieSound](IsoZombie.ZombieSound.html "enum class in zombie.characters")
    - zombie.characters.[NetworkUser.AuthType](NetworkUser.AuthType.html "enum class in zombie.characters")
    - zombie.characters.[SurvivorFactory.SurvivorType](SurvivorFactory.SurvivorType.html "enum class in zombie.characters")