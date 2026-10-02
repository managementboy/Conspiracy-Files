[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [SpriteModel](SpriteModel.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [modelScriptName](#modelScriptName)
   2. [textureName](#textureName)
   3. [translate](#translate)
   4. [rotate](#rotate)
   5. [scale](#scale)
   6. [animationName](#animationName)
   7. [animationTime](#animationTime)
   8. [runtimeString](#runtimeString)
6. [Constructor Details](#constructor-detail)
   1. [SpriteModel()](#%3Cinit%3E())
   2. [SpriteModel(ScriptType)](#%3Cinit%3E(zombie.scripting.ScriptType))
7. [Method Details](#method-detail)
   1. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   2. [parseVector3f(String, Vector3f)](#parseVector3f(java.lang.String,org.joml.Vector3f))
   3. [set(SpriteModel)](#set(zombie.iso.SpriteModel))
   4. [getModelScriptName()](#getModelScriptName())
   5. [setModelScriptName(String)](#setModelScriptName(java.lang.String))
   6. [getTextureName()](#getTextureName())
   7. [setTextureName(String)](#setTextureName(java.lang.String))
   8. [getTranslate()](#getTranslate())
   9. [getRotate()](#getRotate())
   10. [getScale()](#getScale())
   11. [setScale(float)](#setScale(float))
   12. [getAnimationName()](#getAnimationName())
   13. [setAnimationName(String)](#setAnimationName(java.lang.String))
   14. [getAnimationTime()](#getAnimationTime())
   15. [setAnimationTime(float)](#setAnimationTime(float))
   16. [getRuntimeString()](#getRuntimeString())
   17. [setRuntimeString(String)](#setRuntimeString(java.lang.String))
   18. [parseRuntimeString(String, int, int, String)](#parseRuntimeString(java.lang.String,int,int,java.lang.String))
   19. [parseStandardDoor(String, int, int, String)](#parseStandardDoor(java.lang.String,int,int,java.lang.String))
   20. [parsePairDoor(String, int, int, String)](#parsePairDoor(java.lang.String,int,int,java.lang.String))
   21. [createDoorModelScriptIfNeeded(String, int, String)](#createDoorModelScriptIfNeeded(java.lang.String,int,java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SpriteModel
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../scripting/objects/BaseScriptObject.html "class in zombie.scripting.objects")

zombie.iso.SpriteModel

---

public final class SpriteModel
extends [BaseScriptObject](../scripting/objects/BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `String`

  `animationName`

  `float`

  `animationTime`

  `String`

  `modelScriptName`

  `final Vector3f`

  `rotate`

  `String`

  `runtimeString`

  `float`

  `scale`

  `String`

  `textureName`

  `final Vector3f`

  `translate`

  ### Fields inherited from class [BaseScriptObject](../scripting/objects/BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `SpriteModel()`

  `protected`

  `SpriteModel(ScriptType type)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) ModelScript`

  `createDoorModelScriptIfNeeded(String tilesetName,
  int textureIndex,
  String meshName)`

  `String`

  `getAnimationName()`

  `float`

  `getAnimationTime()`

  `String`

  `getModelScriptName()`

  `Vector3f`

  `getRotate()`

  `String`

  `getRuntimeString()`

  `float`

  `getScale()`

  `String`

  `getTextureName()`

  `Vector3f`

  `getTranslate()`

  `void`

  `Load(String name,
  String totalFile)`

  `(package private) void`

  `parsePairDoor(String tilesetName,
  int tileColumn,
  int tileRow,
  String runtimeString)`

  `void`

  `parseRuntimeString(String tilesetName,
  int tileColumn,
  int tileRow,
  String runtimeString)`

  `(package private) void`

  `parseStandardDoor(String tilesetName,
  int tileColumn,
  int tileRow,
  String runtimeString)`

  `(package private) void`

  `parseVector3f(String str,
  Vector3f v)`

  `SpriteModel`

  `set(SpriteModel other)`

  `void`

  `setAnimationName(String animationName)`

  `void`

  `setAnimationTime(float animationTime)`

  `void`

  `setModelScriptName(String modelScriptName)`

  `void`

  `setRuntimeString(String runtimeString)`

  `void`

  `setScale(float scale)`

  `void`

  `setTextureName(String textureName)`

  ### Methods inherited from class [BaseScriptObject](../scripting/objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### modelScriptName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modelScriptName
  + ### textureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName
  + ### translate

    public final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") translate
  + ### rotate

    public final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") rotate
  + ### scale

    public float scale
  + ### animationName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animationName
  + ### animationTime

    public float animationTime
  + ### runtimeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") runtimeString
* Constructor Details
  -------------------

  + ### SpriteModel

    public SpriteModel()
  + ### SpriteModel

    protected SpriteModel([ScriptType](../scripting/ScriptType.html "enum class in zombie.scripting") type)
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

    void parseVector3f([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") v)
  + ### set

    public [SpriteModel](SpriteModel.html "class in zombie.iso") set([SpriteModel](SpriteModel.html "class in zombie.iso") other)
  + ### getModelScriptName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModelScriptName()
  + ### setModelScriptName

    public void setModelScriptName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modelScriptName)
  + ### getTextureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextureName()
  + ### setTextureName

    public void setTextureName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName)
  + ### getTranslate

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getTranslate()
  + ### getRotate

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") getRotate()
  + ### getScale

    public float getScale()
  + ### setScale

    public void setScale(float scale)
  + ### getAnimationName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimationName()
  + ### setAnimationName

    public void setAnimationName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animationName)
  + ### getAnimationTime

    public float getAnimationTime()
  + ### setAnimationTime

    public void setAnimationTime(float animationTime)
  + ### getRuntimeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRuntimeString()
  + ### setRuntimeString

    public void setRuntimeString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") runtimeString)
  + ### parseRuntimeString

    public void parseRuntimeString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int tileColumn,
    int tileRow,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") runtimeString)
    throws [RuntimeException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/RuntimeException.html "class or interface in java.lang")

    Throws:
    :   `RuntimeException`
  + ### parseStandardDoor

    void parseStandardDoor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int tileColumn,
    int tileRow,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") runtimeString)
    throws [RuntimeException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/RuntimeException.html "class or interface in java.lang")

    Throws:
    :   `RuntimeException`
  + ### parsePairDoor

    void parsePairDoor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int tileColumn,
    int tileRow,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") runtimeString)
    throws [RuntimeException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/RuntimeException.html "class or interface in java.lang")

    Throws:
    :   `RuntimeException`
  + ### createDoorModelScriptIfNeeded

    [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") createDoorModelScriptIfNeeded([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilesetName,
    int textureIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") meshName)