[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [Registry](Registry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [byLocation](#byLocation)
   2. [byObject](#byObject)
   3. [values](#values)
   4. [name](#name)
6. [Constructor Details](#constructor-detail)
   1. [Registry(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getLocation(T)](#getLocation(T))
   2. [register(ResourceLocation, T)](#register(zombie.scripting.objects.ResourceLocation,T))
   3. [get(ResourceLocation)](#get(zombie.scripting.objects.ResourceLocation))
   4. [contains(ResourceLocation)](#contains(zombie.scripting.objects.ResourceLocation))
   5. [values()](#values())
   6. [keys()](#keys())
   7. [reset()](#reset())
   8. [iterator()](#iterator())
   9. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Registry<T>
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.Registry<T>

All Implemented Interfaces:
:   `Iterable<T>`

---

public class Registry<T>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html "class or interface in java.lang")<T>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Map<ResourceLocation, T>`

  `byLocation`

  `private final Map<T, ResourceLocation>`

  `byObject`

  `private final String`

  `name`

  `private final List<T>`

  `values`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Registry(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `contains(ResourceLocation id)`

  `T`

  `get(ResourceLocation id)`

  `ResourceLocation`

  `getLocation(T t)`

  `Iterator<T>`

  `iterator()`

  `Set<ResourceLocation>`

  `keys()`

  `T`

  `register(ResourceLocation id,
  T t)`

  `protected void`

  `reset()`

  Remove all non default namespace elements, a poor man's reload

  `String`

  `toString()`

  `List<T>`

  `values()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html#method-summary "class or interface in java.lang")

  `forEach, spliterator`

* Field Details
  -------------

  + ### byLocation

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects"), [T](#type-param-T "type parameter in Registry")> byLocation
  + ### byObject

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[T](#type-param-T "type parameter in Registry"), [ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects")> byObject
  + ### values

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[T](#type-param-T "type parameter in Registry")> values
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
* Constructor Details
  -------------------

  + ### Registry

    public Registry([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### getLocation

    public [ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") getLocation([T](#type-param-T "type parameter in Registry") t)
  + ### register

    public [T](#type-param-T "type parameter in Registry") register([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id,
    [T](#type-param-T "type parameter in Registry") t)
  + ### get

    public [T](#type-param-T "type parameter in Registry") get([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### contains

    public boolean contains([ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") id)
  + ### values

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[T](#type-param-T "type parameter in Registry")> values()
  + ### keys

    public [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects")> keys()
  + ### reset

    protected void reset()

    Remove all non default namespace elements, a poor man's reload
  + ### iterator

    public [Iterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Iterator.html "class or interface in java.util")<[T](#type-param-T "type parameter in Registry")> iterator()

    Specified by:
    :   `iterator` in interface `Iterable<T>`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`