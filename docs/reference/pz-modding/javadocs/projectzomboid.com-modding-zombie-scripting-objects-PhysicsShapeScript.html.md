[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [PhysicsShapeScript](PhysicsShapeScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [meshName](#meshName)
   2. [translate](#translate)
   3. [rotate](#rotate)
   4. [scale](#scale)
   5. [postProcess](#postProcess)
   6. [allMeshes](#allMeshes)
6. [Constructor Details](#constructor-detail)
   1. [PhysicsShapeScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   2. [parseVector3f(String, Vector3f)](#parseVector3f(java.lang.String,org.joml.Vector3f))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PhysicsShapeScript
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.PhysicsShapeScript

---

public class PhysicsShapeScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `allMeshes`

  `String`

  `meshName`

  `String`

  `postProcess`

  `final Vector3f`

  `rotate`

  `float`

  `scale`

  `final Vector3f`

  `translate`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `PhysicsShapeScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `Load(String name,
  String totalFile)`

  `private void`

  `parseVector3f(String str,
  Vector3f v)`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### meshName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") meshName
  + ### translate

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") translate
  + ### rotate

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") rotate
  + ### scale

    public float scale
  + ### postProcess

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") postProcess
  + ### allMeshes

    public boolean allMeshes
* Constructor Details
  -------------------

  + ### PhysicsShapeScript

    protected PhysicsShapeScript()
* Method Details
  --------------

  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### parseVector3f

    private void parseVector3f([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") v)