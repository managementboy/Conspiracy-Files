[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.worldgen.biomes](package-summary.html)
2. [BiomeRegistry](BiomeRegistry.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [biomeCache](#biomeCache)
   3. [biomeCacheFiltered](#biomeCacheFiltered)
7. [Constructor Details](#constructor-detail)
   1. [BiomeRegistry()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [get(Map, BiomeNoise, double, Map, Map, Map, Map, Map, Map)](#get(java.util.Map,zombie.iso.worldgen.biomes.BiomeNoise,double,java.util.Map,java.util.Map,java.util.Map,java.util.Map,java.util.Map,java.util.Map))
   3. [get(Map, String, BiomeNoise, double, Map, Map)](#get(java.util.Map,java.lang.String,zombie.iso.worldgen.biomes.BiomeNoise,double,java.util.Map,java.util.Map))
   4. [getLandscape(double, Map)](#getLandscape(double,java.util.Map))
   5. [getPlant(double, Map)](#getPlant(double,java.util.Map))
   6. [getBush(double, Map)](#getBush(double,java.util.Map))
   7. [getTemperature(double, Map)](#getTemperature(double,java.util.Map))
   8. [getHygrometry(double, Map)](#getHygrometry(double,java.util.Map))
   9. [getOre(double, Map)](#getOre(double,java.util.Map))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class BiomeRegistry
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.worldgen.biomes.BiomeRegistry

---

public class BiomeRegistry
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final record`

  `BiomeRegistry.BiomeGetter`

  `private static final record`

  `BiomeRegistry.BiomeGetterFiltered`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Map<BiomeRegistry.BiomeGetter, List<zombie.iso.worldgen.biomes.IBiome>>`

  `biomeCache`

  `private final Map<BiomeRegistry.BiomeGetterFiltered, List<zombie.iso.worldgen.biomes.IBiome>>`

  `biomeCacheFiltered`

  `static BiomeRegistry`

  `instance`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `BiomeRegistry()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.iso.worldgen.biomes.IBiome`

  `get(Map<String, zombie.iso.worldgen.biomes.Biome> biomesIn,
  String filter,
  zombie.iso.worldgen.biomes.BiomeNoise noises,
  double selector,
  Map<zombie.iso.worldgen.biomes.BiomeType.Bush, List<Double>> bushProb,
  Map<zombie.iso.worldgen.biomes.BiomeType.OreLevel, List<Double>> oreLevelProb)`

  `zombie.iso.worldgen.biomes.IBiome`

  `get(Map<String, zombie.iso.worldgen.biomes.Biome> biomesIn,
  zombie.iso.worldgen.biomes.BiomeNoise noises,
  double selector,
  Map<zombie.iso.worldgen.biomes.BiomeType.Landscape, List<Double>> landscapeProb,
  Map<zombie.iso.worldgen.biomes.BiomeType.Plant, List<Double>> plantProb,
  Map<zombie.iso.worldgen.biomes.BiomeType.Bush, List<Double>> bushProb,
  Map<zombie.iso.worldgen.biomes.BiomeType.Temperature, List<Double>> temperatureProb,
  Map<zombie.iso.worldgen.biomes.BiomeType.Hygrometry, List<Double>> hygrometryProb,
  Map<zombie.iso.worldgen.biomes.BiomeType.OreLevel, List<Double>> oreLevelProb)`

  `private zombie.iso.worldgen.biomes.BiomeType.Bush`

  `getBush(double noise,
  Map<zombie.iso.worldgen.biomes.BiomeType.Bush, List<Double>> bushProb)`

  `private zombie.iso.worldgen.biomes.BiomeType.Hygrometry`

  `getHygrometry(double noise,
  Map<zombie.iso.worldgen.biomes.BiomeType.Hygrometry, List<Double>> hygrometryProb)`

  `private zombie.iso.worldgen.biomes.BiomeType.Landscape`

  `getLandscape(double noise,
  Map<zombie.iso.worldgen.biomes.BiomeType.Landscape, List<Double>> landscapeProb)`

  `private zombie.iso.worldgen.biomes.BiomeType.OreLevel`

  `getOre(double noise,
  Map<zombie.iso.worldgen.biomes.BiomeType.OreLevel, List<Double>> oreLevelProb)`

  `private zombie.iso.worldgen.biomes.BiomeType.Plant`

  `getPlant(double noise,
  Map<zombie.iso.worldgen.biomes.BiomeType.Plant, List<Double>> plantProb)`

  `private zombie.iso.worldgen.biomes.BiomeType.Temperature`

  `getTemperature(double noise,
  Map<zombie.iso.worldgen.biomes.BiomeType.Temperature, List<Double>> temperatureProb)`

  `void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static [BiomeRegistry](BiomeRegistry.html "class in zombie.iso.worldgen.biomes") instance
  + ### biomeCache

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[BiomeRegistry.BiomeGetter](BiomeRegistry.BiomeGetter.html "class in zombie.iso.worldgen.biomes"), [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.iso.worldgen.biomes.IBiome>> biomeCache
  + ### biomeCacheFiltered

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[BiomeRegistry.BiomeGetterFiltered](BiomeRegistry.BiomeGetterFiltered.html "class in zombie.iso.worldgen.biomes"), [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.iso.worldgen.biomes.IBiome>> biomeCacheFiltered
* Constructor Details
  -------------------

  + ### BiomeRegistry

    private BiomeRegistry()
* Method Details
  --------------

  + ### reset

    public void reset()
  + ### get

    public zombie.iso.worldgen.biomes.IBiome get([Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.iso.worldgen.biomes.Biome> biomesIn,
    zombie.iso.worldgen.biomes.BiomeNoise noises,
    double selector,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Landscape, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> landscapeProb,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Plant, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> plantProb,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Bush, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> bushProb,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Temperature, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> temperatureProb,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Hygrometry, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> hygrometryProb,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.OreLevel, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> oreLevelProb)
  + ### get

    public zombie.iso.worldgen.biomes.IBiome get([Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.iso.worldgen.biomes.Biome> biomesIn,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filter,
    zombie.iso.worldgen.biomes.BiomeNoise noises,
    double selector,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Bush, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> bushProb,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.OreLevel, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> oreLevelProb)
  + ### getLandscape

    private zombie.iso.worldgen.biomes.BiomeType.Landscape getLandscape(double noise,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Landscape, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> landscapeProb)
  + ### getPlant

    private zombie.iso.worldgen.biomes.BiomeType.Plant getPlant(double noise,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Plant, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> plantProb)
  + ### getBush

    private zombie.iso.worldgen.biomes.BiomeType.Bush getBush(double noise,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Bush, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> bushProb)
  + ### getTemperature

    private zombie.iso.worldgen.biomes.BiomeType.Temperature getTemperature(double noise,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Temperature, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> temperatureProb)
  + ### getHygrometry

    private zombie.iso.worldgen.biomes.BiomeType.Hygrometry getHygrometry(double noise,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.Hygrometry, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> hygrometryProb)
  + ### getOre

    private zombie.iso.worldgen.biomes.BiomeType.OreLevel getOre(double noise,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<zombie.iso.worldgen.biomes.BiomeType.OreLevel, [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>> oreLevelProb)