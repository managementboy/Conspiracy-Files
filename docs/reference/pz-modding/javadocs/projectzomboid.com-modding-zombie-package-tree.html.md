[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* [Package](package-summary.html)
* Tree
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#tree)

1. [zombie](package-summary.html)

Hierarchy For Package zombie
============================

Package Hierarchies:

* [All Packages](../overview-tree.html)

Class Hierarchy
---------------

* java.lang.[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
  + zombie.[AmbientSoundManager.Ambient](AmbientSoundManager.Ambient.html "class in zombie")
  + zombie.[AmbientStreamManager.Ambient](AmbientStreamManager.Ambient.html "class in zombie")
  + zombie.[AmbientStreamManager.AmbientLoop](AmbientStreamManager.AmbientLoop.html "class in zombie")
  + zombie.[AmbientStreamManager.WorldSoundEmitter](AmbientStreamManager.WorldSoundEmitter.html "class in zombie")
  + zombie.[BaseAmbientStreamManager](BaseAmbientStreamManager.html "class in zombie")
    - zombie.[AmbientSoundManager](AmbientSoundManager.html "class in zombie")
    - zombie.[AmbientStreamManager](AmbientStreamManager.html "class in zombie")
    - zombie.[DummyAmbientStreamManager](DummyAmbientStreamManager.html "class in zombie")
  + zombie.[BaseSoundManager](BaseSoundManager.html "class in zombie")
    - zombie.[DummySoundManager](DummySoundManager.html "class in zombie")
    - zombie.[SoundManager](SoundManager.html "class in zombie") (implements fmod.fmod.IFMODParameterUpdater)
  + zombie.config.[ConfigOption](config/ConfigOption.html "class in zombie.config")
    - zombie.config.[BooleanConfigOption](config/BooleanConfigOption.html "class in zombie.config")
      * zombie.[SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") (implements zombie.[SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie"))
    - zombie.config.[DoubleConfigOption](config/DoubleConfigOption.html "class in zombie.config")
      * zombie.[SandboxOptions.DoubleSandboxOption](SandboxOptions.DoubleSandboxOption.html "class in zombie") (implements zombie.[SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie"))
    - zombie.config.[IntegerConfigOption](config/IntegerConfigOption.html "class in zombie.config")
      * zombie.config.[EnumConfigOption](config/EnumConfigOption.html "class in zombie.config")
        + zombie.[SandboxOptions.EnumSandboxOption](SandboxOptions.EnumSandboxOption.html "class in zombie") (implements zombie.[SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie"))
          - zombie.[SandboxOptions.StrongEnumSandboxOption](SandboxOptions.StrongEnumSandboxOption.html "class in zombie")<EnumType>
      * zombie.[SandboxOptions.IntegerSandboxOption](SandboxOptions.IntegerSandboxOption.html "class in zombie") (implements zombie.[SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie"))
    - zombie.config.[StringConfigOption](config/StringConfigOption.html "class in zombie.config")
      * zombie.[SandboxOptions.StringSandboxOption](SandboxOptions.StringSandboxOption.html "class in zombie") (implements zombie.[SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie"))
  + zombie.[GameSounds](GameSounds.html "class in zombie")
  + zombie.[GameSounds.BankPreviewSound](GameSounds.BankPreviewSound.html "class in zombie") (implements zombie.[GameSounds.IPreviewSound](GameSounds.IPreviewSound.html "interface in zombie"))
  + zombie.[GameSounds.FilePreviewSound](GameSounds.FilePreviewSound.html "class in zombie") (implements zombie.[GameSounds.IPreviewSound](GameSounds.IPreviewSound.html "interface in zombie"))
  + zombie.[GameTime](GameTime.html "class in zombie")
  + zombie.[GameTime.AnimTimer](GameTime.AnimTimer.html "class in zombie")
  + zombie.[GameWindow](GameWindow.html "class in zombie")
  + zombie.[GameWindow.OSValidator](GameWindow.OSValidator.html "class in zombie")
  + zombie.[GameWindow.s\_performance](GameWindow.s_performance.html "class in zombie")
  + zombie.[GameWindow.StringUTF](GameWindow.StringUTF.html "class in zombie")
  + zombie.[GameWindow.TexturePack](GameWindow.TexturePack.html "class in zombie")
  + zombie.[MainThreadQueueItem](MainThreadQueueItem.html "class in zombie")
  + zombie.[MapGroups](MapGroups.html "class in zombie")
  + zombie.[MapGroups.MapDirectory](MapGroups.MapDirectory.html "class in zombie")
  + zombie.[MapGroups.MapGroup](MapGroups.MapGroup.html "class in zombie")
  + zombie.[SandboxOptions](SandboxOptions.html "class in zombie")
  + zombie.[SandboxOptions.Basement](SandboxOptions.Basement.html "class in zombie")
  + zombie.[SandboxOptions.Map](SandboxOptions.Map.html "class in zombie")
  + zombie.[SandboxOptions.MultiplierConfig](SandboxOptions.MultiplierConfig.html "class in zombie")
  + zombie.[SandboxOptions.ZombieConfig](SandboxOptions.ZombieConfig.html "class in zombie")
  + zombie.[SandboxOptions.ZombieLore](SandboxOptions.ZombieLore.html "class in zombie")
  + zombie.[SoundManager.AmbientSoundEffect](SoundManager.AmbientSoundEffect.html "class in zombie") (implements fmod.fmod.Audio)
  + zombie.[SoundManager.ImpactSound](SoundManager.ImpactSound.html "class in zombie")
  + zombie.[SoundManager.Music](SoundManager.Music.html "class in zombie")
  + zombie.[SystemDisabler](SystemDisabler.html "class in zombie")
  + zombie.[VirtualZombieManager](VirtualZombieManager.html "class in zombie")
  + zombie.[WorldSoundManager](WorldSoundManager.html "class in zombie")
  + zombie.[WorldSoundManager.ResultBiggestSound](WorldSoundManager.ResultBiggestSound.html "class in zombie")
  + zombie.[WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie")

Interface Hierarchy
-------------------

* zombie.[GameSounds.IPreviewSound](GameSounds.IPreviewSound.html "interface in zombie")
* zombie.[SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie")