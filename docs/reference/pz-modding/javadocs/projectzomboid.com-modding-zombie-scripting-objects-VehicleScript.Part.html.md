[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [VehicleScript](VehicleScript.html)
3. [Part](VehicleScript.Part.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [parent](#parent)
   3. [itemType](#itemType)
   4. [container](#container)
   5. [area](#area)
   6. [mechanicArea](#mechanicArea)
   7. [wheel](#wheel)
   8. [tables](#tables)
   9. [luaFunctions](#luaFunctions)
   10. [models](#models)
   11. [setAllModelsVisible](#setAllModelsVisible)
   12. [door](#door)
   13. [window](#window)
   14. [anims](#anims)
   15. [category](#category)
   16. [specificItem](#specificItem)
   17. [mechanicRequireKey](#mechanicRequireKey)
   18. [repairMechanic](#repairMechanic)
   19. [hasLightsRear](#hasLightsRear)
   20. [durability](#durability)
6. [Constructor Details](#constructor-detail)
   1. [Part()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isMechanicRequireKey()](#isMechanicRequireKey())
   2. [setMechanicRequireKey(boolean)](#setMechanicRequireKey(boolean))
   3. [isRepairMechanic()](#isRepairMechanic())
   4. [setRepairMechanic(boolean)](#setRepairMechanic(boolean))
   5. [getId()](#getId())
   6. [getModelCount()](#getModelCount())
   7. [getModel(int)](#getModel(int))
   8. [getDurability()](#getDurability())
   9. [getMechanicArea()](#getMechanicArea())
   10. [getAnimById(String)](#getAnimById(java.lang.String))
   11. [getModelById(String)](#getModelById(java.lang.String))
   12. [makeCopy()](#makeCopy())
   13. [compact()](#compact())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VehicleScript.Part
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.VehicleScript.Part

Enclosing class:
:   `VehicleScript`

---

public static final class VehicleScript.Part
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `ArrayList<VehicleScript.Anim>`

  `anims`

  `String`

  `area`

  `String`

  `category`

  `VehicleScript.Container`

  `container`

  `VehicleScript.Door`

  `door`

  `private float`

  `durability`

  `boolean`

  `hasLightsRear`

  `String`

  `id`

  `ArrayList<String>`

  `itemType`

  `gnu.trove.map.hash.THashMap<String,String>`

  `luaFunctions`

  `String`

  `mechanicArea`

  `boolean`

  `mechanicRequireKey`

  `ArrayList<VehicleScript.Model>`

  `models`

  `String`

  `parent`

  `boolean`

  `repairMechanic`

  `boolean`

  `setAllModelsVisible`

  `boolean`

  `specificItem`

  `gnu.trove.map.hash.THashMap<String, se.krka.kahlua.vm.KahluaTable>`

  `tables`

  `String`

  `wheel`

  `VehicleScript.Window`

  `window`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Part()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `compact()`

  `VehicleScript.Anim`

  `getAnimById(String id)`

  `float`

  `getDurability()`

  `String`

  `getId()`

  `String`

  `getMechanicArea()`

  `VehicleScript.Model`

  `getModel(int index)`

  `VehicleScript.Model`

  `getModelById(String id)`

  `int`

  `getModelCount()`

  `boolean`

  `isMechanicRequireKey()`

  `boolean`

  `isRepairMechanic()`

  `(package private) VehicleScript.Part`

  `makeCopy()`

  `void`

  `setMechanicRequireKey(boolean mechanicRequireKey)`

  `void`

  `setRepairMechanic(boolean repairMechanic)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### parent

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parent
  + ### itemType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemType
  + ### container

    public [VehicleScript.Container](VehicleScript.Container.html "class in zombie.scripting.objects") container
  + ### area

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") area
  + ### mechanicArea

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mechanicArea
  + ### wheel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wheel
  + ### tables

    public gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), se.krka.kahlua.vm.KahluaTable> tables
  + ### luaFunctions

    public gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> luaFunctions
  + ### models

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects")> models
  + ### setAllModelsVisible

    public boolean setAllModelsVisible
  + ### door

    public [VehicleScript.Door](VehicleScript.Door.html "class in zombie.scripting.objects") door
  + ### window

    public [VehicleScript.Window](VehicleScript.Window.html "class in zombie.scripting.objects") window
  + ### anims

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VehicleScript.Anim](VehicleScript.Anim.html "class in zombie.scripting.objects")> anims
  + ### category

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category
  + ### specificItem

    public boolean specificItem
  + ### mechanicRequireKey

    public boolean mechanicRequireKey
  + ### repairMechanic

    public boolean repairMechanic
  + ### hasLightsRear

    public boolean hasLightsRear
  + ### durability

    private float durability
* Constructor Details
  -------------------

  + ### Part

    public Part()
* Method Details
  --------------

  + ### isMechanicRequireKey

    public boolean isMechanicRequireKey()
  + ### setMechanicRequireKey

    public void setMechanicRequireKey(boolean mechanicRequireKey)
  + ### isRepairMechanic

    public boolean isRepairMechanic()
  + ### setRepairMechanic

    public void setRepairMechanic(boolean repairMechanic)
  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getModelCount

    public int getModelCount()
  + ### getModel

    public [VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects") getModel(int index)
  + ### getDurability

    public float getDurability()
  + ### getMechanicArea

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMechanicArea()
  + ### getAnimById

    public [VehicleScript.Anim](VehicleScript.Anim.html "class in zombie.scripting.objects") getAnimById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getModelById

    public [VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects") getModelById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### makeCopy

    [VehicleScript.Part](VehicleScript.Part.html "class in zombie.scripting.objects") makeCopy()
  + ### compact

    void compact()