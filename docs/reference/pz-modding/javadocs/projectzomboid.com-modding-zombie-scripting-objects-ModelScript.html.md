[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [ModelScript](ModelScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [DEFAULT\_SHADER\_NAME](#DEFAULT_SHADER_NAME)
   2. [fileName](#fileName)
   3. [name](#name)
   4. [meshName](#meshName)
   5. [textureName](#textureName)
   6. [shaderName](#shaderName)
   7. [isStatic](#isStatic)
   8. [modelManagerKey](#modelManagerKey)
   9. [scale](#scale)
   10. [attachments](#attachments)
   11. [attachmentById](#attachmentById)
   12. [invertX](#invertX)
   13. [postProcess](#postProcess)
   14. [loadedModel](#loadedModel)
   15. [boneWeights](#boneWeights)
   16. [animationsMesh](#animationsMesh)
   17. [cullFace](#cullFace)
   18. [reported](#reported)
6. [Constructor Details](#constructor-detail)
   1. [ModelScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [InitLoadPP(String)](#InitLoadPP(java.lang.String))
   2. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   3. [LoadAttachment(ScriptParser.Block)](#LoadAttachment(zombie.scripting.ScriptParser.Block))
   4. [LoadVector3f(String, Vector3f)](#LoadVector3f(java.lang.String,org.joml.Vector3f))
   5. [getName()](#getName())
   6. [getFullType()](#getFullType())
   7. [getMeshName()](#getMeshName())
   8. [getTextureName()](#getTextureName())
   9. [getTextureName(boolean)](#getTextureName(boolean))
   10. [getShaderName()](#getShaderName())
   11. [getModelManagerKey()](#getModelManagerKey())
   12. [setModelManagerKey(String)](#setModelManagerKey(java.lang.String))
   13. [getFileName()](#getFileName())
   14. [getAttachmentCount()](#getAttachmentCount())
   15. [getAttachment(int)](#getAttachment(int))
   16. [getAttachmentById(ModelAttachmentId)](#getAttachmentById(zombie.scripting.objects.ModelAttachmentId))
   17. [getAttachmentById(String)](#getAttachmentById(java.lang.String))
   18. [addAttachment(ModelAttachment)](#addAttachment(zombie.scripting.objects.ModelAttachment))
   19. [removeAttachment(ModelAttachment)](#removeAttachment(zombie.scripting.objects.ModelAttachment))
   20. [addAttachmentAt(int, ModelAttachment)](#addAttachmentAt(int,zombie.scripting.objects.ModelAttachment))
   21. [removeAttachment(int)](#removeAttachment(int))
   22. [scaleAttachmentOffset(float)](#scaleAttachmentOffset(float))
   23. [beforeRenameAttachment(ModelAttachment)](#beforeRenameAttachment(zombie.scripting.objects.ModelAttachment))
   24. [afterRenameAttachment(ModelAttachment)](#afterRenameAttachment(zombie.scripting.objects.ModelAttachment))
   25. [isStatic()](#isStatic())
   26. [reset()](#reset())
   27. [checkMesh(String, String)](#checkMesh(java.lang.String,java.lang.String))
   28. [checkTexture(String, String)](#checkTexture(java.lang.String,java.lang.String))
   29. [check(String, String)](#check(java.lang.String,java.lang.String))
   30. [check(String, String, String)](#check(java.lang.String,java.lang.String,java.lang.String))
   31. [ScriptsLoaded()](#ScriptsLoaded())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ModelScript
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.ModelScript

All Implemented Interfaces:
:   `zombie.scripting.objects.IModelAttachmentOwner`

---

public final class ModelScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")
implements zombie.scripting.objects.IModelAttachmentOwner

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `String`

  `animationsMesh`

  `HashMap<String, ModelAttachment>`

  `attachmentById`

  `final ArrayList<ModelAttachment>`

  `attachments`

  `final ArrayList<zombie.core.skinnedmodel.advancedanimation.AnimBoneWeight>`

  `boneWeights`

  `int`

  `cullFace`

  `static final String`

  `DEFAULT_SHADER_NAME`

  `String`

  `fileName`

  `boolean`

  `invertX`

  `boolean`

  `isStatic`

  `zombie.core.skinnedmodel.model.Model`

  `loadedModel`

  `String`

  `meshName`

  `private String`

  `modelManagerKey`

  `String`

  `name`

  `String`

  `postProcess`

  `private static final HashSet<String>`

  `reported`

  `float`

  `scale`

  `String`

  `shaderName`

  `String`

  `textureName`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ModelScript()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ModelAttachment`

  `addAttachment(ModelAttachment attach)`

  `ModelAttachment`

  `addAttachmentAt(int index,
  ModelAttachment attach)`

  `void`

  `afterRenameAttachment(ModelAttachment attachment)`

  `void`

  `beforeRenameAttachment(ModelAttachment attachment)`

  `private static void`

  `check(String object,
  String model)`

  `private static void`

  `check(String object,
  String model,
  String clothingItem)`

  `private static void`

  `checkMesh(String object,
  String meshName)`

  `private static void`

  `checkTexture(String object,
  String textureName)`

  `ModelAttachment`

  `getAttachment(int index)`

  `ModelAttachment`

  `getAttachmentById(String id)`

  `ModelAttachment`

  `getAttachmentById(zombie.scripting.objects.ModelAttachmentId id)`

  `int`

  `getAttachmentCount()`

  `String`

  `getFileName()`

  `String`

  `getFullType()`

  `String`

  `getMeshName()`

  `String`

  `getModelManagerKey()`

  `String`

  `getName()`

  `String`

  `getShaderName()`

  `String`

  `getTextureName()`

  `String`

  `getTextureName(boolean allowNull)`

  `void`

  `InitLoadPP(String name)`

  `boolean`

  `isStatic()`

  `void`

  `Load(String name,
  String totalFile)`

  `private ModelAttachment`

  `LoadAttachment(zombie.scripting.ScriptParser.Block block)`

  `private void`

  `LoadVector3f(String s,
  Vector3f v)`

  `ModelAttachment`

  `removeAttachment(int index)`

  `ModelAttachment`

  `removeAttachment(ModelAttachment attach)`

  `void`

  `reset()`

  `void`

  `scaleAttachmentOffset(float scale)`

  `static void`

  `ScriptsLoaded()`

  `void`

  `setModelManagerKey(String modelManagerKey)`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DEFAULT\_SHADER\_NAME

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") DEFAULT\_SHADER\_NAME

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.ModelScript.DEFAULT_SHADER_NAME)
  + ### fileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### meshName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") meshName
  + ### textureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName
  + ### shaderName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") shaderName
  + ### isStatic

    public boolean isStatic
  + ### modelManagerKey

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modelManagerKey
  + ### scale

    public float scale
  + ### attachments

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects")> attachments
  + ### attachmentById

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects")> attachmentById
  + ### invertX

    public boolean invertX
  + ### postProcess

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") postProcess
  + ### loadedModel

    public zombie.core.skinnedmodel.model.Model loadedModel
  + ### boneWeights

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.skinnedmodel.advancedanimation.AnimBoneWeight> boneWeights
  + ### animationsMesh

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animationsMesh
  + ### cullFace

    public int cullFace
  + ### reported

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> reported
* Constructor Details
  -------------------

  + ### ModelScript

    public ModelScript()
* Method Details
  --------------

  + ### InitLoadPP

    public void InitLoadPP([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Overrides:
    :   `InitLoadPP` in class `BaseScriptObject`
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### LoadAttachment

    private [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") LoadAttachment(zombie.scripting.ScriptParser.Block block)
  + ### LoadVector3f

    private void LoadVector3f([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") v)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getFullType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullType()
  + ### getMeshName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMeshName()
  + ### getTextureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextureName()
  + ### getTextureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextureName(boolean allowNull)
  + ### getShaderName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getShaderName()
  + ### getModelManagerKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getModelManagerKey()
  + ### setModelManagerKey

    public void setModelManagerKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modelManagerKey)
  + ### getFileName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFileName()
  + ### getAttachmentCount

    public int getAttachmentCount()
  + ### getAttachment

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") getAttachment(int index)
  + ### getAttachmentById

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") getAttachmentById(zombie.scripting.objects.ModelAttachmentId id)
  + ### getAttachmentById

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") getAttachmentById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### addAttachment

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") addAttachment([ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attach)
  + ### removeAttachment

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") removeAttachment([ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attach)
  + ### addAttachmentAt

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") addAttachmentAt(int index,
    [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attach)
  + ### removeAttachment

    public [ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") removeAttachment(int index)
  + ### scaleAttachmentOffset

    public void scaleAttachmentOffset(float scale)
  + ### beforeRenameAttachment

    public void beforeRenameAttachment([ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attachment)

    Specified by:
    :   `beforeRenameAttachment` in interface `zombie.scripting.objects.IModelAttachmentOwner`
  + ### afterRenameAttachment

    public void afterRenameAttachment([ModelAttachment](ModelAttachment.html "class in zombie.scripting.objects") attachment)

    Specified by:
    :   `afterRenameAttachment` in interface `zombie.scripting.objects.IModelAttachmentOwner`
  + ### isStatic

    public boolean isStatic()
  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `BaseScriptObject`
  + ### checkMesh

    private static void checkMesh([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") object,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") meshName)
  + ### checkTexture

    private static void checkTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") object,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName)
  + ### check

    private static void check([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") object,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") model)
  + ### check

    private static void check([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") object,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") model,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") clothingItem)
  + ### ScriptsLoaded

    public static void ScriptsLoaded()