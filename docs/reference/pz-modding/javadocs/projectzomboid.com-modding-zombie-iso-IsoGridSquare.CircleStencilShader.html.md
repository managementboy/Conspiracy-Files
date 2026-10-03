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
3. [CircleStencilShader](IsoGridSquare.CircleStencilShader.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [wallShadeColor](#wallShadeColor)
6. [Constructor Details](#constructor-detail)
   1. [CircleStencilShader()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [startRenderThread(TextureDraw)](#startRenderThread(zombie.core.textures.TextureDraw))
   2. [onCompileSuccess(ShaderProgram)](#onCompileSuccess(zombie.core.opengl.ShaderProgram))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGridSquare.CircleStencilShader
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.opengl.Shader

zombie.iso.IsoGridSquare.CircleStencilShader

All Implemented Interfaces:
:   `zombie.core.opengl.IShaderProgramListener`

Enclosing class:
:   `IsoGridSquare`

---

public static final class IsoGridSquare.CircleStencilShader
extends zombie.core.opengl.Shader

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final IsoGridSquare.CircleStencilShader`

  `instance`

  `int`

  `wallShadeColor`

  ### Fields inherited from class zombie.core.opengl.Shader

  `ShaderMap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CircleStencilShader()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

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

    public static final [IsoGridSquare.CircleStencilShader](IsoGridSquare.CircleStencilShader.html "class in zombie.iso") instance
  + ### wallShadeColor

    public int wallShadeColor
* Constructor Details
  -------------------

  + ### CircleStencilShader

    public CircleStencilShader()
* Method Details
  --------------

  + ### startRenderThread

    public void startRenderThread(zombie.core.textures.TextureDraw tex)

    Overrides:
    :   `startRenderThread` in class `zombie.core.opengl.Shader`
  + ### onCompileSuccess

    protected void onCompileSuccess(zombie.core.opengl.ShaderProgram shaderProgram)

    Overrides:
    :   `onCompileSuccess` in class `zombie.core.opengl.Shader`