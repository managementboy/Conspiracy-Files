[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.itemConfig](package-summary.html)
2. [ItemConfig](ItemConfig.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [errorLine](#errorLine)
   2. [errorBucket](#errorBucket)
   3. [errorRoot](#errorRoot)
   4. [errorItemConfig](#errorItemConfig)
   5. [VARIABLE\_PREFIX](#VARIABLE_PREFIX)
   6. [includes](#includes)
   7. [variables](#variables)
   8. [rootScripts](#rootScripts)
   9. [roots](#roots)
   10. [name](#name)
   11. [hasBeenParsed](#hasBeenParsed)
   12. [isValid](#isValid)
   13. [tempGenerators](#tempGenerators)
7. [Constructor Details](#constructor-detail)
   1. [ItemConfig()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [createErrorString()](#createErrorString())
   2. [WarnOrError(String)](#WarnOrError(java.lang.String))
   3. [getName()](#getName())
   4. [isValid()](#isValid())
   5. [ConfigureEntitySpawned(GameEntity, ItemPickInfo)](#ConfigureEntitySpawned(zombie.entity.GameEntity,zombie.inventory.ItemPickInfo))
   6. [ConfigureEntityOnCreate(GameEntity)](#ConfigureEntityOnCreate(zombie.entity.GameEntity))
   7. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   8. [PreReload()](#PreReload())
   9. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   10. [Parse(HashSet)](#Parse(java.util.HashSet))
   11. [MergeRoots(HashMap, HashMap, boolean)](#MergeRoots(java.util.HashMap,java.util.HashMap,boolean))
   12. [BuildBuckets()](#BuildBuckets())
   13. [buildBucketRoot(BucketRootScript)](#buildBucketRoot(zombie.scripting.itemConfig.script.BucketRootScript))
   14. [buildBucket(BucketRootScript, SelectorBucketScript)](#buildBucket(zombie.scripting.itemConfig.script.BucketRootScript,zombie.scripting.itemConfig.script.SelectorBucketScript))
   15. [buildLuaFuncGenerator(String)](#buildLuaFuncGenerator(java.lang.String))
   16. [buildFluidContainerGenerator(String, String)](#buildFluidContainerGenerator(java.lang.String,java.lang.String))
   17. [buildNumericGenerator(AttributeType, String)](#buildNumericGenerator(zombie.entity.components.attributes.AttributeType,java.lang.String))
   18. [buildStringGenerator(AttributeType, String)](#buildStringGenerator(zombie.entity.components.attributes.AttributeType,java.lang.String))
   19. [buildBoolGenerator(AttributeType, String)](#buildBoolGenerator(zombie.entity.components.attributes.AttributeType,java.lang.String))
   20. [buildEnumGenerator(AttributeType, String)](#buildEnumGenerator(zombie.entity.components.attributes.AttributeType,java.lang.String))
   21. [buildEnumSetGenerator(AttributeType, String)](#buildEnumSetGenerator(zombie.entity.components.attributes.AttributeType,java.lang.String))
   22. [buildEnumStringSetGenerator(AttributeType, String)](#buildEnumStringSetGenerator(zombie.entity.components.attributes.AttributeType,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ItemConfig
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../objects/BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.itemConfig.ItemConfig

---

public class ItemConfig
extends [BaseScriptObject](../objects/BaseScriptObject.html "class in zombie.scripting.objects")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `ItemConfig.ItemConfigException`

  Exception for fatal errors in ItemConfig.
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static String`

  `errorBucket`

  `static String`

  `errorItemConfig`

  `static String`

  `errorLine`

  `static String`

  `errorRoot`

  `private boolean`

  `hasBeenParsed`

  `private final ArrayList<String>`

  `includes`

  `private boolean`

  `isValid`

  `private String`

  `name`

  `private final ArrayList<zombie.scripting.itemConfig.BucketRoot>`

  `roots`

  `private final HashMap<String, zombie.scripting.itemConfig.script.BucketRootScript>`

  `rootScripts`

  `private static final ArrayList<zombie.scripting.itemConfig.RandomGenerator>`

  `tempGenerators`

  `static final String`

  `VARIABLE_PREFIX`

  `private final HashMap<String,String>`

  `variables`

  ### Fields inherited from class [BaseScriptObject](../objects/BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemConfig()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private zombie.scripting.itemConfig.RandomGenerator`

  `buildBoolGenerator(AttributeType attributeType,
  String s)`

  `private zombie.scripting.itemConfig.SelectorBucket`

  `buildBucket(zombie.scripting.itemConfig.script.BucketRootScript rootScript,
  zombie.scripting.itemConfig.script.SelectorBucketScript bucketScript)`

  `private zombie.scripting.itemConfig.BucketRoot`

  `buildBucketRoot(zombie.scripting.itemConfig.script.BucketRootScript script)`

  `void`

  `BuildBuckets()`

  Build buckets from script info, this is done after fluids and string-int mapping etc are properly initialized.

  `private zombie.scripting.itemConfig.RandomGenerator`

  `buildEnumGenerator(AttributeType attributeType,
  String s)`

  `private zombie.scripting.itemConfig.RandomGenerator`

  `buildEnumSetGenerator(AttributeType attributeType,
  String s)`

  `private zombie.scripting.itemConfig.RandomGenerator`

  `buildEnumStringSetGenerator(AttributeType attributeType,
  String s)`

  `private zombie.scripting.itemConfig.RandomGenerator`

  `buildFluidContainerGenerator(String containerID,
  String s)`

  `private zombie.scripting.itemConfig.RandomGenerator`

  `buildLuaFuncGenerator(String s)`

  `private zombie.scripting.itemConfig.RandomGenerator`

  `buildNumericGenerator(AttributeType attributeType,
  String s)`

  `private zombie.scripting.itemConfig.RandomGenerator`

  `buildStringGenerator(AttributeType attributeType,
  String s)`

  `void`

  `ConfigureEntityOnCreate(GameEntity entity)`

  `void`

  `ConfigureEntitySpawned(GameEntity entity,
  zombie.inventory.ItemPickInfo pickInfo)`

  `private static String`

  `createErrorString()`

  `String`

  `getName()`

  `boolean`

  `isValid()`

  `void`

  `Load(String name,
  String totalFile)`

  `private static HashMap<String, zombie.scripting.itemConfig.script.BucketRootScript>`

  `MergeRoots(HashMap<String, zombie.scripting.itemConfig.script.BucketRootScript> bucket,
  HashMap<String, zombie.scripting.itemConfig.script.BucketRootScript> bucketAdd,
  boolean createCopyEntries)`

  Creates a new SelectorBucketScript map containing a merger of bucket and bucketAdd.

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `private void`

  `Parse(HashSet<String> includeSet)`

  `void`

  `PreReload()`

  `private static void`

  `WarnOrError(String s)`

  Used for warnings that are not fatal.

  ### Methods inherited from class [BaseScriptObject](../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### errorLine

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") errorLine
  + ### errorBucket

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") errorBucket
  + ### errorRoot

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") errorRoot
  + ### errorItemConfig

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") errorItemConfig
  + ### VARIABLE\_PREFIX

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") VARIABLE\_PREFIX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.itemConfig.ItemConfig.VARIABLE_PREFIX)
  + ### includes

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> includes
  + ### variables

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> variables
  + ### rootScripts

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.scripting.itemConfig.script.BucketRootScript> rootScripts
  + ### roots

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.scripting.itemConfig.BucketRoot> roots
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### hasBeenParsed

    private boolean hasBeenParsed
  + ### isValid

    private boolean isValid
  + ### tempGenerators

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.scripting.itemConfig.RandomGenerator> tempGenerators
* Constructor Details
  -------------------

  + ### ItemConfig

    public ItemConfig()
* Method Details
  --------------

  + ### createErrorString

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") createErrorString()
  + ### WarnOrError

    private static void WarnOrError([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Used for warnings that are not fatal.
    WarnOrError throws exception if in debug mode as it should ideally be fixed, logs to console if not in debug.

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### isValid

    public boolean isValid()
  + ### ConfigureEntitySpawned

    public void ConfigureEntitySpawned([GameEntity](../../entity/GameEntity.html "class in zombie.entity") entity,
    zombie.inventory.ItemPickInfo pickInfo)
  + ### ConfigureEntityOnCreate

    public void ConfigureEntityOnCreate([GameEntity](../../entity/GameEntity.html "class in zombie.entity") entity)
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### PreReload

    public void PreReload()

    Overrides:
    :   `PreReload` in class `BaseScriptObject`
  + ### OnScriptsLoaded

    public void OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `OnScriptsLoaded` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### Parse

    private void Parse([HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> includeSet)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### MergeRoots

    private static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.scripting.itemConfig.script.BucketRootScript> MergeRoots([HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.scripting.itemConfig.script.BucketRootScript> bucket,
    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.scripting.itemConfig.script.BucketRootScript> bucketAdd,
    boolean createCopyEntries)

    Creates a new SelectorBucketScript map containing a merger of bucket and bucketAdd.
    If a key is present in both sources, bucketAdd has priority.

    Parameters:
    :   `createCopyEntries` - Creates copies of the SelectorBucketScript objects.
  + ### BuildBuckets

    public void BuildBuckets()

    Build buckets from script info, this is done after fluids and string-int mapping etc are properly initialized.
  + ### buildBucketRoot

    private zombie.scripting.itemConfig.BucketRoot buildBucketRoot(zombie.scripting.itemConfig.script.BucketRootScript script)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### buildBucket

    private zombie.scripting.itemConfig.SelectorBucket buildBucket(zombie.scripting.itemConfig.script.BucketRootScript rootScript,
    zombie.scripting.itemConfig.script.SelectorBucketScript bucketScript)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### buildLuaFuncGenerator

    private zombie.scripting.itemConfig.RandomGenerator buildLuaFuncGenerator([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### buildFluidContainerGenerator

    private zombie.scripting.itemConfig.RandomGenerator buildFluidContainerGenerator([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### buildNumericGenerator

    private zombie.scripting.itemConfig.RandomGenerator buildNumericGenerator([AttributeType](../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### buildStringGenerator

    private zombie.scripting.itemConfig.RandomGenerator buildStringGenerator([AttributeType](../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### buildBoolGenerator

    private zombie.scripting.itemConfig.RandomGenerator buildBoolGenerator([AttributeType](../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### buildEnumGenerator

    private zombie.scripting.itemConfig.RandomGenerator buildEnumGenerator([AttributeType](../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### buildEnumSetGenerator

    private zombie.scripting.itemConfig.RandomGenerator buildEnumSetGenerator([AttributeType](../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`
  + ### buildEnumStringSetGenerator

    private zombie.scripting.itemConfig.RandomGenerator buildEnumStringSetGenerator([AttributeType](../../entity/components/attributes/AttributeType.html "class in zombie.entity.components.attributes") attributeType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [ItemConfig.ItemConfigException](ItemConfig.ItemConfigException.html "class in zombie.scripting.itemConfig")

    Throws:
    :   `ItemConfig.ItemConfigException`