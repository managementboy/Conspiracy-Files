[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoTree](IsoTree.html)
3. [TreeShader](IsoTree.TreeShader.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [shaderProgram](#shaderProgram)
   3. [stepSize](#stepSize)
   4. [outlineColor](#outlineColor)
   5. [chunkDepth](#chunkDepth)
   6. [zDepth](#zDepth)
6. [Constructor Details](#constructor-detail)
   1. [TreeShader()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initShader()](#initShader())
   2. [setOutlineColor(float, float, float, float)](#setOutlineColor(float,float,float,float))
   3. [setStepSize(float, int, int)](#setStepSize(float,int,int))
   4. [setDepth(float, float)](#setDepth(float,float))
   5. [StartShader()](#StartShader())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoTree.TreeShader
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.objects.IsoTree.TreeShader

Enclosing class:
:   `IsoTree`

---

public static class IsoTree.TreeShader
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `chunkDepth`

  `static final IsoTree.TreeShader`

  `instance`

  `private int`

  `outlineColor`

  `private zombie.core.opengl.ShaderProgram`

  `shaderProgram`

  `private int`

  `stepSize`

  `private int`

  `zDepth`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TreeShader()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `initShader()`

  `void`

  `setDepth(float chunkDepth,
  float zDepth)`

  `void`

  `setOutlineColor(float r,
  float g,
  float b,
  float a)`

  `void`

  `setStepSize(float stepSize,
  int texWidth,
  int texHeight)`

  `boolean`

  `StartShader()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [IsoTree.TreeShader](IsoTree.TreeShader.html "class in zombie.iso.objects") instance
  + ### shaderProgram

    private zombie.core.opengl.ShaderProgram shaderProgram
  + ### stepSize

    private int stepSize
  + ### outlineColor

    private int outlineColor
  + ### chunkDepth

    private int chunkDepth
  + ### zDepth

    private int zDepth
* Constructor Details
  -------------------

  + ### TreeShader

    public TreeShader()
* Method Details
  --------------

  + ### initShader

    public void initShader()
  + ### setOutlineColor

    public void setOutlineColor(float r,
    float g,
    float b,
    float a)
  + ### setStepSize

    public void setStepSize(float stepSize,
    int texWidth,
    int texHeight)
  + ### setDepth

    public void setDepth(float chunkDepth,
    float zDepth)
  + ### StartShader

    public boolean StartShader()