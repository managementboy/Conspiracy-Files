[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.tileDepth](package-summary.html)
2. [TileDepthTextures](TileDepthTextures.html)
3. [LoadTask](TileDepthTextures.LoadTask.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [textures](#textures)
   2. [path](#path)
6. [Constructor Details](#constructor-detail)
   1. [LoadTask(TileDepthTextures, Path, FileSystem)](#%3Cinit%3E(zombie.tileDepth.TileDepthTextures,java.nio.file.Path,zombie.fileSystem.FileSystem))
7. [Method Details](#method-detail)
   1. [done()](#done())
   2. [call()](#call())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileDepthTextures.LoadTask
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.fileSystem.FileTask

zombie.tileDepth.TileDepthTextures.LoadTask

All Implemented Interfaces:
:   `Callable<Object>`

Enclosing class:
:   `TileDepthTextures`

---

static final class TileDepthTextures.LoadTask
extends zombie.fileSystem.FileTask

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final Path`

  `path`

  `(package private) final TileDepthTextures`

  `textures`

  ### Fields inherited from class zombie.fileSystem.FileTask

  `cb, fileSystem, priority`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LoadTask(TileDepthTextures textures,
  Path path,
  zombie.fileSystem.FileSystem fileSystem)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Object`

  `call()`

  `void`

  `done()`

  ### Methods inherited from class zombie.fileSystem.FileTask

  `getErrorMessage, handleResult, setPriority`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### textures

    final [TileDepthTextures](TileDepthTextures.html "class in zombie.tileDepth") textures
  + ### path

    final [Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") path
* Constructor Details
  -------------------

  + ### LoadTask

    public LoadTask([TileDepthTextures](TileDepthTextures.html "class in zombie.tileDepth") textures,
    [Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") path,
    zombie.fileSystem.FileSystem fileSystem)
* Method Details
  --------------

  + ### done

    public void done()

    Specified by:
    :   `done` in class `zombie.fileSystem.FileTask`
  + ### call

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") call()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`