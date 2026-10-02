[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.fboRenderChunk](package-summary.html)
2. [FBORenderTracerEffects](FBORenderTracerEffects.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [effects](#effects)
   3. [effectPool](#effectPool)
   4. [drawerPool](#drawerPool)
   5. [playerWeaponTransform](#playerWeaponTransform)
   6. [VERSION](#VERSION)
   7. [options](#options)
   8. [startRadius](#startRadius)
   9. [endRadius](#endRadius)
   10. [length](#length)
   11. [speed](#speed)
   12. [red](#red)
   13. [green](#green)
   14. [blue](#blue)
   15. [alpha](#alpha)
7. [Constructor Details](#constructor-detail)
   1. [FBORenderTracerEffects()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [releaseWeaponTransform(IsoGameCharacter)](#releaseWeaponTransform(zombie.characters.IsoGameCharacter))
   3. [storeWeaponTransform(IsoGameCharacter, Matrix4f)](#storeWeaponTransform(zombie.characters.IsoGameCharacter,org.joml.Matrix4f))
   4. [addEffect(IsoGameCharacter, float)](#addEffect(zombie.characters.IsoGameCharacter,float))
   5. [render()](#render())
   6. [registerOption(ConfigOption)](#registerOption(zombie.config.ConfigOption))
   7. [getOptionCount()](#getOptionCount())
   8. [getOptionByIndex(int)](#getOptionByIndex(int))
   9. [getOptionByName(String)](#getOptionByName(java.lang.String))
   10. [save()](#save())
   11. [load()](#load())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FBORenderTracerEffects
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.fboRenderChunk.FBORenderTracerEffects

---

public final class FBORenderTracerEffects
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `class`

  `FBORenderTracerEffects.DoubleConfigOption1`

  `private static final class`

  `FBORenderTracerEffects.Drawer`

  `private static final class`

  `FBORenderTracerEffects.Effect`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final FBORenderTracerEffects.DoubleConfigOption1`

  `alpha`

  `(package private) final FBORenderTracerEffects.DoubleConfigOption1`

  `blue`

  `private final zombie.popman.ObjectPool<FBORenderTracerEffects.Drawer>`

  `drawerPool`

  `private final zombie.popman.ObjectPool<FBORenderTracerEffects.Effect>`

  `effectPool`

  `private final ArrayList<FBORenderTracerEffects.Effect>`

  `effects`

  `(package private) final FBORenderTracerEffects.DoubleConfigOption1`

  `endRadius`

  `(package private) final FBORenderTracerEffects.DoubleConfigOption1`

  `green`

  `private static FBORenderTracerEffects`

  `instance`

  `(package private) final FBORenderTracerEffects.DoubleConfigOption1`

  `length`

  `private final ArrayList<ConfigOption>`

  `options`

  `final HashMap<IsoGameCharacter, org.joml.Matrix4f>`

  `playerWeaponTransform`

  `(package private) final FBORenderTracerEffects.DoubleConfigOption1`

  `red`

  `(package private) final FBORenderTracerEffects.DoubleConfigOption1`

  `speed`

  `(package private) final FBORenderTracerEffects.DoubleConfigOption1`

  `startRadius`

  `private static final int`

  `VERSION`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FBORenderTracerEffects()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addEffect(IsoGameCharacter chr,
  float range)`

  `static FBORenderTracerEffects`

  `getInstance()`

  `ConfigOption`

  `getOptionByIndex(int index)`

  `ConfigOption`

  `getOptionByName(String name)`

  `int`

  `getOptionCount()`

  `void`

  `load()`

  `private void`

  `registerOption(ConfigOption option)`

  `void`

  `releaseWeaponTransform(IsoGameCharacter chr)`

  `void`

  `render()`

  `void`

  `save()`

  `void`

  `storeWeaponTransform(IsoGameCharacter chr,
  org.joml.Matrix4f xfrm)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [FBORenderTracerEffects](FBORenderTracerEffects.html "class in zombie.iso.fboRenderChunk") instance
  + ### effects

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FBORenderTracerEffects.Effect](FBORenderTracerEffects.Effect.html "class in zombie.iso.fboRenderChunk")> effects
  + ### effectPool

    private final zombie.popman.ObjectPool<[FBORenderTracerEffects.Effect](FBORenderTracerEffects.Effect.html "class in zombie.iso.fboRenderChunk")> effectPool
  + ### drawerPool

    private final zombie.popman.ObjectPool<[FBORenderTracerEffects.Drawer](FBORenderTracerEffects.Drawer.html "class in zombie.iso.fboRenderChunk")> drawerPool
  + ### playerWeaponTransform

    public final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters"), org.joml.Matrix4f> playerWeaponTransform
  + ### VERSION

    private static final int VERSION

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderTracerEffects.VERSION)
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../../config/ConfigOption.html "class in zombie.config")> options
  + ### startRadius

    final [FBORenderTracerEffects.DoubleConfigOption1](FBORenderTracerEffects.DoubleConfigOption1.html "class in zombie.iso.fboRenderChunk") startRadius
  + ### endRadius

    final [FBORenderTracerEffects.DoubleConfigOption1](FBORenderTracerEffects.DoubleConfigOption1.html "class in zombie.iso.fboRenderChunk") endRadius
  + ### length

    final [FBORenderTracerEffects.DoubleConfigOption1](FBORenderTracerEffects.DoubleConfigOption1.html "class in zombie.iso.fboRenderChunk") length
  + ### speed

    final [FBORenderTracerEffects.DoubleConfigOption1](FBORenderTracerEffects.DoubleConfigOption1.html "class in zombie.iso.fboRenderChunk") speed
  + ### red

    final [FBORenderTracerEffects.DoubleConfigOption1](FBORenderTracerEffects.DoubleConfigOption1.html "class in zombie.iso.fboRenderChunk") red
  + ### green

    final [FBORenderTracerEffects.DoubleConfigOption1](FBORenderTracerEffects.DoubleConfigOption1.html "class in zombie.iso.fboRenderChunk") green
  + ### blue

    final [FBORenderTracerEffects.DoubleConfigOption1](FBORenderTracerEffects.DoubleConfigOption1.html "class in zombie.iso.fboRenderChunk") blue
  + ### alpha

    final [FBORenderTracerEffects.DoubleConfigOption1](FBORenderTracerEffects.DoubleConfigOption1.html "class in zombie.iso.fboRenderChunk") alpha
* Constructor Details
  -------------------

  + ### FBORenderTracerEffects

    private FBORenderTracerEffects()
* Method Details
  --------------

  + ### getInstance

    public static [FBORenderTracerEffects](FBORenderTracerEffects.html "class in zombie.iso.fboRenderChunk") getInstance()
  + ### releaseWeaponTransform

    public void releaseWeaponTransform([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### storeWeaponTransform

    public void storeWeaponTransform([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    org.joml.Matrix4f xfrm)
  + ### addEffect

    public void addEffect([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    float range)
  + ### render

    public void render()
  + ### registerOption

    private void registerOption([ConfigOption](../../config/ConfigOption.html "class in zombie.config") option)
  + ### getOptionCount

    public int getOptionCount()
  + ### getOptionByIndex

    public [ConfigOption](../../config/ConfigOption.html "class in zombie.config") getOptionByIndex(int index)
  + ### getOptionByName

    public [ConfigOption](../../config/ConfigOption.html "class in zombie.config") getOptionByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### save

    public void save()
  + ### load

    public void load()