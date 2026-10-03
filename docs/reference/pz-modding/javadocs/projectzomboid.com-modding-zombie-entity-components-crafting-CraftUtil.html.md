[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [CraftUtil](CraftUtil.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [resource\_list\_pool](#resource_list_pool)
6. [Constructor Details](#constructor-detail)
   1. [CraftUtil()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [AllocResourceList()](#AllocResourceList())
   2. [ReleaseResourceList(ArrayList)](#ReleaseResourceList(java.util.ArrayList))
   3. [canItemsStack(InventoryItem, InventoryItem)](#canItemsStack(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem))
   4. [canItemsStack(InventoryItem, InventoryItem, boolean)](#canItemsStack(zombie.inventory.InventoryItem,zombie.inventory.InventoryItem,boolean))
   5. [canItemsStack(Item, Item, boolean)](#canItemsStack(zombie.scripting.objects.Item,zombie.scripting.objects.Item,boolean))
   6. [findResourceOrEmpty(ResourceIO, List, InventoryItem, int, Resource, HashSet)](#findResourceOrEmpty(zombie.entity.components.resources.ResourceIO,java.util.List,zombie.inventory.InventoryItem,int,zombie.entity.components.resources.Resource,java.util.HashSet))
   7. [findResourceOrEmpty(ResourceIO, List, Item, int, Resource, HashSet)](#findResourceOrEmpty(zombie.entity.components.resources.ResourceIO,java.util.List,zombie.scripting.objects.Item,int,zombie.entity.components.resources.Resource,java.util.HashSet))
   8. [canResourceFitItem(Resource, InventoryItem)](#canResourceFitItem(zombie.entity.components.resources.Resource,zombie.inventory.InventoryItem))
   9. [canResourceFitItem(Resource, InventoryItem, int)](#canResourceFitItem(zombie.entity.components.resources.Resource,zombie.inventory.InventoryItem,int))
   10. [canResourceFitItem(Resource, InventoryItem, int, Resource, HashSet)](#canResourceFitItem(zombie.entity.components.resources.Resource,zombie.inventory.InventoryItem,int,zombie.entity.components.resources.Resource,java.util.HashSet))
   11. [canResourceFitItem(Resource, Item)](#canResourceFitItem(zombie.entity.components.resources.Resource,zombie.scripting.objects.Item))
   12. [canResourceFitItem(Resource, Item, int)](#canResourceFitItem(zombie.entity.components.resources.Resource,zombie.scripting.objects.Item,int))
   13. [canResourceFitItem(Resource, Item, int, Resource, HashSet)](#canResourceFitItem(zombie.entity.components.resources.Resource,zombie.scripting.objects.Item,int,zombie.entity.components.resources.Resource,java.util.HashSet))
   14. [findResourceOrEmpty(ResourceIO, List, Fluid, float, Resource, HashSet)](#findResourceOrEmpty(zombie.entity.components.resources.ResourceIO,java.util.List,zombie.entity.components.fluids.Fluid,float,zombie.entity.components.resources.Resource,java.util.HashSet))
   15. [findResourceOrEmpty(ResourceIO, List, Energy, float, Resource, HashSet)](#findResourceOrEmpty(zombie.entity.components.resources.ResourceIO,java.util.List,zombie.entity.energy.Energy,float,zombie.entity.components.resources.Resource,java.util.HashSet))
   16. [debugCanStart(IsoPlayer, CraftRecipeData, List, List, List, CraftRecipeMonitor)](#debugCanStart(zombie.characters.IsoPlayer,zombie.entity.components.crafting.recipe.CraftRecipeData,java.util.List,java.util.List,java.util.List,zombie.entity.components.crafting.CraftRecipeMonitor))
   17. [canStart(CraftRecipeData, List, List, List)](#canStart(zombie.entity.components.crafting.recipe.CraftRecipeData,java.util.List,java.util.List,java.util.List))
   18. [canStart(CraftRecipeData, List, List, List, CraftRecipeMonitor)](#canStart(zombie.entity.components.crafting.recipe.CraftRecipeData,java.util.List,java.util.List,java.util.List,zombie.entity.components.crafting.CraftRecipeMonitor))
   19. [canPerformRecipe(CraftRecipe, CraftRecipeData, List, List)](#canPerformRecipe(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.entity.components.crafting.recipe.CraftRecipeData,java.util.List,java.util.List))
   20. [canPerformRecipe(CraftRecipe, CraftRecipeData, List, List, CraftRecipeMonitor)](#canPerformRecipe(zombie.scripting.entity.components.crafting.CraftRecipe,zombie.entity.components.crafting.recipe.CraftRecipeData,java.util.List,java.util.List,zombie.entity.components.crafting.CraftRecipeMonitor))
   21. [getPossibleRecipe(CraftRecipeData, List, List, List)](#getPossibleRecipe(zombie.entity.components.crafting.recipe.CraftRecipeData,java.util.List,java.util.List,java.util.List))
   22. [getPossibleRecipe(CraftRecipeData, List, List, List, CraftRecipeMonitor)](#getPossibleRecipe(zombie.entity.components.crafting.recipe.CraftRecipeData,java.util.List,java.util.List,java.util.List,zombie.entity.components.crafting.CraftRecipeMonitor))
   23. [getEntityTemperature(GameEntity)](#getEntityTemperature(zombie.entity.GameEntity))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class CraftUtil
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.CraftUtil

---

public class CraftUtil
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ConcurrentLinkedDeque<ArrayList<Resource>>`

  `resource_list_pool`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CraftUtil()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<Resource>`

  `AllocResourceList()`

  `static boolean`

  `canItemsStack(InventoryItem item,
  InventoryItem other)`

  `static boolean`

  `canItemsStack(InventoryItem item,
  InventoryItem other,
  boolean nullReturn)`

  `static boolean`

  `canItemsStack(Item item,
  Item other,
  boolean nullReturn)`

  `static boolean`

  `canPerformRecipe(CraftRecipe recipe,
  CraftRecipeData craftTestData,
  List<Resource> inputs,
  List<Resource> outputs)`

  `static boolean`

  `canPerformRecipe(CraftRecipe recipe,
  CraftRecipeData craftTestData,
  List<Resource> inputs,
  List<Resource> outputs,
  CraftRecipeMonitor monitor)`

  `static boolean`

  `canResourceFitItem(Resource resource,
  InventoryItem item)`

  `static boolean`

  `canResourceFitItem(Resource resource,
  InventoryItem item,
  int count)`

  `static boolean`

  `canResourceFitItem(Resource resource,
  InventoryItem item,
  int count,
  Resource ignoreResource,
  HashSet<Resource> ignoreSet)`

  `static boolean`

  `canResourceFitItem(Resource resource,
  Item item)`

  `static boolean`

  `canResourceFitItem(Resource resource,
  Item item,
  int count)`

  `static boolean`

  `canResourceFitItem(Resource resource,
  Item item,
  int count,
  Resource ignoreResource,
  HashSet<Resource> ignoreSet)`

  `static boolean`

  `canStart(CraftRecipeData craftTestData,
  List<CraftRecipe> recipes,
  List<Resource> inputs,
  List<Resource> outputs)`

  `static boolean`

  `canStart(CraftRecipeData craftTestData,
  List<CraftRecipe> recipes,
  List<Resource> inputs,
  List<Resource> outputs,
  CraftRecipeMonitor monitor)`

  `static CraftRecipeMonitor`

  `debugCanStart(IsoPlayer player,
  CraftRecipeData craftTestData,
  List<CraftRecipe> recipes,
  List<Resource> inputs,
  List<Resource> outputs,
  CraftRecipeMonitor monitor)`

  `static Resource`

  `findResourceOrEmpty(ResourceIO resourceIO,
  List<Resource> resources,
  Fluid fluid,
  float amount,
  Resource ignoreResource,
  HashSet<Resource> ignoreSet)`

  Tries to find ResourceFluid that can fit amount and that best matches param fluid
  - priority is FluidContainer that has pure fluid
  - then FluidContainer with highest ratio of fluid
  - then empty FluidContainer if present

  `static Resource`

  `findResourceOrEmpty(ResourceIO resourceIO,
  List<Resource> resources,
  Energy energy,
  float amount,
  Resource ignoreResource,
  HashSet<Resource> ignoreSet)`

  `static Resource`

  `findResourceOrEmpty(ResourceIO resourceIO,
  List<Resource> outputResources,
  InventoryItem item,
  int count,
  Resource ignoreResource,
  HashSet<Resource> ignoreSet)`

  `static Resource`

  `findResourceOrEmpty(ResourceIO resourceIO,
  List<Resource> resources,
  Item item,
  int count,
  Resource ignoreResource,
  HashSet<Resource> ignoreSet)`

  `static float`

  `getEntityTemperature(GameEntity entity)`

  `static CraftRecipe`

  `getPossibleRecipe(CraftRecipeData craftTestData,
  List<CraftRecipe> recipes,
  List<Resource> inputs,
  List<Resource> outputs)`

  `static CraftRecipe`

  `getPossibleRecipe(CraftRecipeData craftTestData,
  List<CraftRecipe> recipes,
  List<Resource> inputs,
  List<Resource> outputs,
  CraftRecipeMonitor monitor)`

  `static void`

  `ReleaseResourceList(ArrayList<Resource> list)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### resource\_list\_pool

    private static final [ConcurrentLinkedDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedDeque.html "class or interface in java.util.concurrent")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")>> resource\_list\_pool
* Constructor Details
  -------------------

  + ### CraftUtil

    public CraftUtil()
* Method Details
  --------------

  + ### AllocResourceList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> AllocResourceList()
  + ### ReleaseResourceList

    public static void ReleaseResourceList([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> list)
  + ### canItemsStack

    public static boolean canItemsStack([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") other)
  + ### canItemsStack

    public static boolean canItemsStack([InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") other,
    boolean nullReturn)
  + ### canItemsStack

    public static boolean canItemsStack([Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") other,
    boolean nullReturn)
  + ### findResourceOrEmpty

    public static [Resource](../resources/Resource.html "class in zombie.entity.components.resources") findResourceOrEmpty([ResourceIO](../resources/ResourceIO.html "enum class in zombie.entity.components.resources") resourceIO,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> outputResources,
    [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    int count,
    [Resource](../resources/Resource.html "class in zombie.entity.components.resources") ignoreResource,
    [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> ignoreSet)
  + ### findResourceOrEmpty

    public static [Resource](../resources/Resource.html "class in zombie.entity.components.resources") findResourceOrEmpty([ResourceIO](../resources/ResourceIO.html "enum class in zombie.entity.components.resources") resourceIO,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    int count,
    [Resource](../resources/Resource.html "class in zombie.entity.components.resources") ignoreResource,
    [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> ignoreSet)
  + ### canResourceFitItem

    public static boolean canResourceFitItem([Resource](../resources/Resource.html "class in zombie.entity.components.resources") resource,
    [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### canResourceFitItem

    public static boolean canResourceFitItem([Resource](../resources/Resource.html "class in zombie.entity.components.resources") resource,
    [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    int count)
  + ### canResourceFitItem

    public static boolean canResourceFitItem([Resource](../resources/Resource.html "class in zombie.entity.components.resources") resource,
    [InventoryItem](../../../inventory/InventoryItem.html "class in zombie.inventory") item,
    int count,
    [Resource](../resources/Resource.html "class in zombie.entity.components.resources") ignoreResource,
    [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> ignoreSet)
  + ### canResourceFitItem

    public static boolean canResourceFitItem([Resource](../resources/Resource.html "class in zombie.entity.components.resources") resource,
    [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") item)
  + ### canResourceFitItem

    public static boolean canResourceFitItem([Resource](../resources/Resource.html "class in zombie.entity.components.resources") resource,
    [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    int count)
  + ### canResourceFitItem

    public static boolean canResourceFitItem([Resource](../resources/Resource.html "class in zombie.entity.components.resources") resource,
    [Item](../../../scripting/objects/Item.html "class in zombie.scripting.objects") item,
    int count,
    [Resource](../resources/Resource.html "class in zombie.entity.components.resources") ignoreResource,
    [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> ignoreSet)
  + ### findResourceOrEmpty

    public static [Resource](../resources/Resource.html "class in zombie.entity.components.resources") findResourceOrEmpty([ResourceIO](../resources/ResourceIO.html "enum class in zombie.entity.components.resources") resourceIO,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    [Fluid](../fluids/Fluid.html "class in zombie.entity.components.fluids") fluid,
    float amount,
    [Resource](../resources/Resource.html "class in zombie.entity.components.resources") ignoreResource,
    [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> ignoreSet)

    Tries to find ResourceFluid that can fit amount and that best matches param fluid
    - priority is FluidContainer that has pure fluid
    - then FluidContainer with highest ratio of fluid
    - then empty FluidContainer if present
  + ### findResourceOrEmpty

    public static [Resource](../resources/Resource.html "class in zombie.entity.components.resources") findResourceOrEmpty([ResourceIO](../resources/ResourceIO.html "enum class in zombie.entity.components.resources") resourceIO,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> resources,
    [Energy](../../energy/Energy.html "class in zombie.entity.energy") energy,
    float amount,
    [Resource](../resources/Resource.html "class in zombie.entity.components.resources") ignoreResource,
    [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> ignoreSet)
  + ### debugCanStart

    public static [CraftRecipeMonitor](CraftRecipeMonitor.html "class in zombie.entity.components.crafting") debugCanStart([IsoPlayer](../../../characters/IsoPlayer.html "class in zombie.characters") player,
    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipes,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> inputs,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> outputs,
    [CraftRecipeMonitor](CraftRecipeMonitor.html "class in zombie.entity.components.crafting") monitor)
  + ### canStart

    public static boolean canStart([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipes,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> inputs,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> outputs)
  + ### canStart

    public static boolean canStart([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipes,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> inputs,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> outputs,
    [CraftRecipeMonitor](CraftRecipeMonitor.html "class in zombie.entity.components.crafting") monitor)
  + ### canPerformRecipe

    public static boolean canPerformRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> inputs,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> outputs)
  + ### canPerformRecipe

    public static boolean canPerformRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    [CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> inputs,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> outputs,
    [CraftRecipeMonitor](CraftRecipeMonitor.html "class in zombie.entity.components.crafting") monitor)
  + ### getPossibleRecipe

    public static [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getPossibleRecipe([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipes,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> inputs,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> outputs)
  + ### getPossibleRecipe

    public static [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getPossibleRecipe([CraftRecipeData](recipe/CraftRecipeData.html "class in zombie.entity.components.crafting.recipe") craftTestData,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> recipes,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> inputs,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> outputs,
    [CraftRecipeMonitor](CraftRecipeMonitor.html "class in zombie.entity.components.crafting") monitor)
  + ### getEntityTemperature

    public static float getEntityTemperature([GameEntity](../../GameEntity.html "class in zombie.entity") entity)