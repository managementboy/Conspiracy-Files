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
3. [NoCircleStencilShader](IsoGridSquare.NoCircleStencilShader.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [shaderProgram](#shaderProgram)
   3. [shaderId](#shaderId)
   4. [wallShadeColor](#wallShadeColor)
6. [Constructor Details](#constructor-detail)
   1. [NoCircleStencilShader()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initShader()](#initShader())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGridSquare.NoCircleStencilShader
=========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoGridSquare.NoCircleStencilShader

Enclosing class:
:   `IsoGridSquare`

---

public static final class IsoGridSquare.NoCircleStencilShader
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final IsoGridSquare.NoCircleStencilShader`

  `instance`

  `int`

  `shaderId`

  `private zombie.core.opengl.ShaderProgram`

  `shaderProgram`

  `int`

  `wallShadeColor`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NoCircleStencilShader()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `initShader()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [IsoGridSquare.NoCircleStencilShader](IsoGridSquare.NoCircleStencilShader.html "class in zombie.iso") instance
  + ### shaderProgram

    private zombie.core.opengl.ShaderProgram shaderProgram
  + ### shaderId

    public int shaderId
  + ### wallShadeColor

    public int wallShadeColor
* Constructor Details
  -------------------

  + ### NoCircleStencilShader

    public NoCircleStencilShader()
* Method Details
  --------------

  + ### initShader

    private void initShader()