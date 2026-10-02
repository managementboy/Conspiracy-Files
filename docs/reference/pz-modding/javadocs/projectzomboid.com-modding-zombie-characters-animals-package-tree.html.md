[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#tree)

1. [zombie.characters.animals](package-summary.html)

Hierarchy For Package zombie.characters.animals
===============================================

Package Hierarchies:

* [All Packages](../../../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + zombie.characters.animals.[AnimalAllele](AnimalAllele.html "class in zombie.characters.animals")
  + zombie.characters.animals.[AnimalChunk](AnimalChunk.html "class in zombie.characters.animals")
  + zombie.characters.animals.[AnimalDefinitions](AnimalDefinitions.html "class in zombie.characters.animals")
  + zombie.characters.animals.[AnimalGene](AnimalGene.html "class in zombie.characters.animals")
  + zombie.characters.animals.[AnimalGenomeDefinitions](AnimalGenomeDefinitions.html "class in zombie.characters.animals")
  + zombie.characters.animals.[AnimalPartsDefinitions](AnimalPartsDefinitions.html "class in zombie.characters.animals")
  + zombie.characters.animals.[AnimalTracks](AnimalTracks.html "class in zombie.characters.animals")
  + zombie.entity.[GameEntity](../../entity/GameEntity.html "class in zombie.entity")
    - zombie.iso.[IsoObject](../../iso/IsoObject.html "class in zombie.iso") (implements zombie.characters.ecs.ECSEntity, zombie.iso.[ILuaIsoObject](../../iso/ILuaIsoObject.html "interface in zombie.iso"), zombie.iso.IsoRenderable, java.io.[Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io"), zombie.iso.objects.interfaces.Thumpable)
      * zombie.iso.[IsoMovingObject](../../iso/IsoMovingObject.html "class in zombie.iso") (implements zombie.ai.astar.Mover)
        + zombie.characters.[IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") (implements zombie.characters.CharacterInputComponentEntity, zombie.chat.ChatElementOwner, zombie.characters.action.IActionStateChanged, zombie.core.skinnedmodel.advancedanimation.IAnimatable, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableMap, zombie.core.skinnedmodel.advancedanimation.[IAnimationVariableRegistry](../../core/skinnedmodel/advancedanimation/IAnimationVariableRegistry.html "interface in zombie.core.skinnedmodel.advancedanimation"), zombie.core.skinnedmodel.advancedanimation.events.IAnimEventCallback, zombie.core.skinnedmodel.advancedanimation.events.IAnimEventWrappedBroadcaster, zombie.core.skinnedmodel.population.IClothingItemListener, fmod.fmod.IFMODParameterUpdater, zombie.core.skinnedmodel.IGrappleableWrapper, zombie.characters.ILuaGameCharacter, zombie.characters.ILuaVariableSource, zombie.ai.IStateCharacter, zombie.characters.Talker)
          - zombie.characters.IsoLivingCharacter
            * zombie.characters.[IsoPlayer](../IsoPlayer.html "class in zombie.characters") (implements zombie.core.skinnedmodel.visual.[IAnimalVisual](../../core/skinnedmodel/visual/IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual"), zombie.core.skinnedmodel.visual.[IHumanVisual](../../core/skinnedmodel/visual/IHumanVisual.html "interface in zombie.core.skinnedmodel.visual"), zombie.network.fields.IPositional)
              + zombie.characters.animals.[IsoAnimal](IsoAnimal.html "class in zombie.characters.animals") (implements zombie.core.skinnedmodel.visual.[IAnimalVisual](../../core/skinnedmodel/visual/IAnimalVisual.html "interface in zombie.core.skinnedmodel.visual"))
  + zombie.characters.animals.[VirtualAnimal](VirtualAnimal.html "class in zombie.characters.animals")
  + zombie.iso.zones.[Zone](../../iso/zones/Zone.html "class in zombie.iso.zones")
    - zombie.characters.animals.[AnimalZone](AnimalZone.html "class in zombie.characters.animals")