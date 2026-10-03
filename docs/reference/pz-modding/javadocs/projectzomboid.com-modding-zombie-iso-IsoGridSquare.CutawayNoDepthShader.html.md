[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoGridSquare](IsoGridSquare.html)
3. [CutawayNoDepthShader](IsoGridSquare.CutawayNoDepthShader.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [wallShadeColor](#wallShadeColor)
6. [Constructor Details](#constructor-detail)
   1. [CutawayNoDepthShader()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [startRenderThread(TextureDraw)](#startRenderThread(zombie.core.textures.TextureDraw))
   3. [onCompileSuccess(ShaderProgram)](#onCompileSuccess(zombie.core.opengl.ShaderProgram))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGridSquare.CutawayNoDepthShader
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.opengl.Shader

zombie.iso.IsoGridSquare.CutawayNoDepthShader

All Implemented Interfaces:
:   `zombie.core.opengl.IShaderProgramListener`

Enclosing class:
:   `IsoGridSquare`

---

public static final class IsoGridSquare.CutawayNoDepthShader
extends zombie.core.opengl.Shader

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static IsoGridSquare.CutawayNoDepthShader`

  `instance`

  `int`

  `wallShadeColor`

  ### Fields inherited from class zombie.core.opengl.Shader

  `ShaderMap`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CutawayNoDepthShader()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoGridSquare.CutawayNoDepthShader`

  `getInstance()`

  `protected void`

  `onCompileSuccess(zombie.core.opengl.ShaderProgram shaderProgram)`

  `void`

  `startRenderThread(zombie.core.textures.TextureDraw tex)`

  ### Methods inherited from class zombie.core.opengl.Shader

  `Activate, callback, destroy, End, getHeight, getID, getName, getProgram, getRequiresSkinning, GetRequiresSkinning, getShaderProgram, getWidth, initShaderProgram, isCompiled, postRender, setHeight, setTexture, SetupBones, SetupInstancedData, setWidth, Start, startMainThread`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [IsoGridSquare.CutawayNoDepthShader](IsoGridSquare.CutawayNoDepthShader.html "class in zombie.iso") instance
  + ### wallShadeColor

    public int wallShadeColor
* Constructor Details
  -------------------

  + ### CutawayNoDepthShader

    private CutawayNoDepthShader()
* Method Details
  --------------

  + ### getInstance

    public static [IsoGridSquare.CutawayNoDepthShader](IsoGridSquare.CutawayNoDepthShader.html "class in zombie.iso") getInstance()
  + ### startRenderThread

    public void startRenderThread(zombie.core.textures.TextureDraw tex)

    Overrides:
    :   `startRenderThread` in class `zombie.core.opengl.Shader`
  + ### onCompileSuccess

    protected void onCompileSuccess(zombie.core.opengl.ShaderProgram shaderProgram)

    Overrides:
    :   `onCompileSuccess` in class `zombie.core.opengl.Shader`