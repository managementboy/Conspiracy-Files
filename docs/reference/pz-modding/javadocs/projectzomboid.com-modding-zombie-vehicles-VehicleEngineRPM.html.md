[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [VehicleEngineRPM](VehicleEngineRPM.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [MAX\_GEARS](#MAX_GEARS)
   2. [VERSION1](#VERSION1)
   3. [VERSION](#VERSION)
   4. [name](#name)
   5. [rpmData](#rpmData)
6. [Constructor Details](#constructor-detail)
   1. [VehicleEngineRPM()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   3. [LoadData(ScriptParser.Block, EngineRPMData)](#LoadData(zombie.scripting.ScriptParser.Block,zombie.vehicles.EngineRPMData))
   4. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class VehicleEngineRPM
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../scripting/objects/BaseScriptObject.html "class in zombie.scripting.objects")

zombie.vehicles.VehicleEngineRPM

---

public class VehicleEngineRPM
extends [BaseScriptObject](../scripting/objects/BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final int`

  `MAX_GEARS`

  `private String`

  `name`

  `final zombie.vehicles.EngineRPMData[]`

  `rpmData`

  `private static final int`

  `VERSION`

  `private static final int`

  `VERSION1`

  ### Fields inherited from class [BaseScriptObject](../scripting/objects/BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehicleEngineRPM()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getName()`

  `void`

  `Load(String name,
  String totalFile)`

  `private void`

  `LoadData(zombie.scripting.ScriptParser.Block block,
  zombie.vehicles.EngineRPMData rpmData)`

  `void`

  `reset()`

  ### Methods inherited from class [BaseScriptObject](../scripting/objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### MAX\_GEARS

    public static final int MAX\_GEARS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.VehicleEngineRPM.MAX_GEARS)
  + ### VERSION1

    private static final int VERSION1

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.VehicleEngineRPM.VERSION1)
  + ### VERSION

    private static final int VERSION

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.VehicleEngineRPM.VERSION)
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### rpmData

    public final zombie.vehicles.EngineRPMData[] rpmData
* Constructor Details
  -------------------

  + ### VehicleEngineRPM

    public VehicleEngineRPM()
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [RuntimeException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/RuntimeException.html "class or interface in java.lang"),
    [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `RuntimeException`
    :   `Exception`
  + ### LoadData

    private void LoadData(zombie.scripting.ScriptParser.Block block,
    zombie.vehicles.EngineRPMData rpmData)
  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `BaseScriptObject`