[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.rendering](package-summary.html)
2. [RenderTexture](RenderTexture.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [fullScreenTri](#fullScreenTri)
   2. [descriptor](#descriptor)
   3. [colour](#colour)
   4. [depth](#depth)
   5. [stencil](#stencil)
   6. [width](#width)
   7. [height](#height)
   8. [length](#length)
   9. [colourFormat](#colourFormat)
   10. [depthFormat](#depthFormat)
   11. [depthAsTexture](#depthAsTexture)
   12. [wrappingMode](#wrappingMode)
7. [Constructor Details](#constructor-detail)
   1. [RenderTexture(String)](#%3Cinit%3E(java.lang.String))
   2. [RenderTexture(RenderTexture.Descriptor)](#%3Cinit%3E(zombie.core.rendering.RenderTexture.Descriptor))
8. [Method Details](#method-detail)
   1. [GetWidth()](#GetWidth())
   2. [GetHeight()](#GetHeight())
   3. [OnCreate()](#OnCreate())
   4. [OnDestroy()](#OnDestroy())
   5. [BindRead()](#BindRead())
   6. [BindDraw()](#BindDraw())
   7. [BindTexture()](#BindTexture())
   8. [BindDepth()](#BindDepth())
   9. [BindStencil()](#BindStencil())
   10. [Copy(RenderTexture.Descriptor)](#Copy(zombie.core.rendering.RenderTexture.Descriptor))
   11. [CopyTexture(RenderTarget)](#CopyTexture(zombie.core.rendering.RenderTarget))
   12. [CopyTexture(RenderTarget, Rectangle, Rectangle)](#CopyTexture(zombie.core.rendering.RenderTarget,org.lwjgl.util.Rectangle,org.lwjgl.util.Rectangle))
   13. [Recreate()](#Recreate())
   14. [AttachTexture(int, int)](#AttachTexture(int,int))
   15. [CreateTextureOrBuffer(int, int, boolean, int)](#CreateTextureOrBuffer(int,int,boolean,int))
   16. [CreateColourTexture()](#CreateColourTexture())
   17. [CreateDepthTexture()](#CreateDepthTexture())
   18. [GetTarget(String, boolean)](#GetTarget(java.lang.String,boolean))
   19. [GetTexture(RenderTexture.Descriptor)](#GetTexture(zombie.core.rendering.RenderTexture.Descriptor))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RenderTexture
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.rendering.RenderTarget

zombie.core.rendering.RenderTexture

---

public class RenderTexture
extends zombie.core.rendering.RenderTarget

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `RenderTexture.Descriptor`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `colour`

  `int`

  `colourFormat`

  `int`

  `depth`

  `boolean`

  `depthAsTexture`

  `int`

  `depthFormat`

  `private final RenderTexture.Descriptor`

  `descriptor`

  `private static zombie.core.skinnedmodel.model.VertexBufferObject`

  `fullScreenTri`

  `int`

  `height`

  `int`

  `length`

  `int`

  `stencil`

  `int`

  `width`

  `int`

  `wrappingMode`

  ### Fields inherited from class zombie.core.rendering.RenderTarget

  `buffer, name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RenderTexture(String name)`

  `RenderTexture(RenderTexture.Descriptor desc)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `AttachTexture(int attachment,
  int texture)`

  `void`

  `BindDepth()`

  `void`

  `BindDraw()`

  `void`

  `BindRead()`

  `void`

  `BindStencil()`

  `void`

  `BindTexture()`

  `private void`

  `Copy(RenderTexture.Descriptor desc)`

  `void`

  `CopyTexture(zombie.core.rendering.RenderTarget dest)`

  `void`

  `CopyTexture(zombie.core.rendering.RenderTarget dest,
  org.lwjgl.util.Rectangle srcRect,
  org.lwjgl.util.Rectangle dstRect)`

  `private void`

  `CreateColourTexture()`

  `private void`

  `CreateDepthTexture()`

  `private int`

  `CreateTextureOrBuffer(int internalFormat,
  int attachment,
  boolean isTexture,
  int filtering)`

  `int`

  `GetHeight()`

  `static RenderTexture`

  `GetTarget(String name,
  boolean createIfNull)`

  `static RenderTexture`

  `GetTexture(RenderTexture.Descriptor desc)`

  `int`

  `GetWidth()`

  `protected void`

  `OnCreate()`

  `protected void`

  `OnDestroy()`

  `zombie.core.rendering.RenderTarget`

  `Recreate()`

  ### Methods inherited from class zombie.core.rendering.RenderTarget

  `Blit, Blit, Create, Destroy, DrawFullScreenQuad, DrawFullScreenTri, GetFormatType, GetInternalFormat, GetTarget, toString, UnbindTarget`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### fullScreenTri

    private static zombie.core.skinnedmodel.model.VertexBufferObject fullScreenTri
  + ### descriptor

    private final [RenderTexture.Descriptor](RenderTexture.Descriptor.html "class in zombie.core.rendering") descriptor
  + ### colour

    public int colour
  + ### depth

    public int depth
  + ### stencil

    public int stencil
  + ### width

    public int width
  + ### height

    public int height
  + ### length

    public int length
  + ### colourFormat

    public int colourFormat
  + ### depthFormat

    public int depthFormat
  + ### depthAsTexture

    public boolean depthAsTexture
  + ### wrappingMode

    public int wrappingMode
* Constructor Details
  -------------------

  + ### RenderTexture

    public RenderTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### RenderTexture

    public RenderTexture([RenderTexture.Descriptor](RenderTexture.Descriptor.html "class in zombie.core.rendering") desc)
* Method Details
  --------------

  + ### GetWidth

    public int GetWidth()

    Specified by:
    :   `GetWidth` in class `zombie.core.rendering.RenderTarget`
  + ### GetHeight

    public int GetHeight()

    Specified by:
    :   `GetHeight` in class `zombie.core.rendering.RenderTarget`
  + ### OnCreate

    protected void OnCreate()

    Specified by:
    :   `OnCreate` in class `zombie.core.rendering.RenderTarget`
  + ### OnDestroy

    protected void OnDestroy()

    Specified by:
    :   `OnDestroy` in class `zombie.core.rendering.RenderTarget`
  + ### BindRead

    public void BindRead()

    Overrides:
    :   `BindRead` in class `zombie.core.rendering.RenderTarget`
  + ### BindDraw

    public void BindDraw()

    Overrides:
    :   `BindDraw` in class `zombie.core.rendering.RenderTarget`
  + ### BindTexture

    public void BindTexture()

    Specified by:
    :   `BindTexture` in class `zombie.core.rendering.RenderTarget`
  + ### BindDepth

    public void BindDepth()
  + ### BindStencil

    public void BindStencil()
  + ### Copy

    private void Copy([RenderTexture.Descriptor](RenderTexture.Descriptor.html "class in zombie.core.rendering") desc)
  + ### CopyTexture

    public void CopyTexture(zombie.core.rendering.RenderTarget dest)
  + ### CopyTexture

    public void CopyTexture(zombie.core.rendering.RenderTarget dest,
    org.lwjgl.util.Rectangle srcRect,
    org.lwjgl.util.Rectangle dstRect)
  + ### Recreate

    public zombie.core.rendering.RenderTarget Recreate()
  + ### AttachTexture

    private void AttachTexture(int attachment,
    int texture)
  + ### CreateTextureOrBuffer

    private int CreateTextureOrBuffer(int internalFormat,
    int attachment,
    boolean isTexture,
    int filtering)
  + ### CreateColourTexture

    private void CreateColourTexture()
  + ### CreateDepthTexture

    private void CreateDepthTexture()
  + ### GetTarget

    public static [RenderTexture](RenderTexture.html "class in zombie.core.rendering") GetTarget([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean createIfNull)
  + ### GetTexture

    public static [RenderTexture](RenderTexture.html "class in zombie.core.rendering") GetTexture([RenderTexture.Descriptor](RenderTexture.Descriptor.html "class in zombie.core.rendering") desc)