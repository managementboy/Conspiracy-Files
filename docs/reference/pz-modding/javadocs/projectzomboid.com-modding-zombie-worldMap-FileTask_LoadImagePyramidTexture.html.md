[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.worldMap](package-summary.html)
2. [FileTask\_LoadImagePyramidTexture](FileTask_LoadImagePyramidTexture.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pyramid](#pyramid)
   2. [key](#key)
   3. [path](#path)
   4. [imageData](#imageData)
   5. [asyncOp](#asyncOp)
   6. [cancelled](#cancelled)
6. [Constructor Details](#constructor-detail)
   1. [FileTask\_LoadImagePyramidTexture(ImagePyramid, Path, String, FileSystem, IFileTaskCallback)](#%3Cinit%3E(zombie.worldMap.ImagePyramid,java.nio.file.Path,java.lang.String,zombie.fileSystem.FileSystem,zombie.fileSystem.IFileTaskCallback))
7. [Method Details](#method-detail)
   1. [getErrorMessage()](#getErrorMessage())
   2. [done()](#done())
   3. [call()](#call())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FileTask\_LoadImagePyramidTexture
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.fileSystem.FileTask

zombie.worldMap.FileTask\_LoadImagePyramidTexture

All Implemented Interfaces:
:   `Callable<Object>`

---

class FileTask\_LoadImagePyramidTexture
extends zombie.fileSystem.FileTask

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) int`

  `asyncOp`

  `(package private) boolean`

  `cancelled`

  `(package private) zombie.core.textures.ImageData`

  `imageData`

  `(package private) String`

  `key`

  `(package private) Path`

  `path`

  `(package private) zombie.worldMap.ImagePyramid`

  `pyramid`

  ### Fields inherited from class zombie.fileSystem.FileTask

  `cb, fileSystem, priority`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FileTask_LoadImagePyramidTexture(zombie.worldMap.ImagePyramid pyramid,
  Path path,
  String key,
  zombie.fileSystem.FileSystem fs,
  zombie.fileSystem.IFileTaskCallback cb)`
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

  `String`

  `getErrorMessage()`

  ### Methods inherited from class zombie.fileSystem.FileTask

  `handleResult, setPriority`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pyramid

    zombie.worldMap.ImagePyramid pyramid
  + ### key

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key
  + ### path

    [Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") path
  + ### imageData

    zombie.core.textures.ImageData imageData
  + ### asyncOp

    int asyncOp
  + ### cancelled

    boolean cancelled
* Constructor Details
  -------------------

  + ### FileTask\_LoadImagePyramidTexture

    public FileTask\_LoadImagePyramidTexture(zombie.worldMap.ImagePyramid pyramid,
    [Path](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/file/Path.html "class or interface in java.nio.file") path,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.fileSystem.FileSystem fs,
    zombie.fileSystem.IFileTaskCallback cb)
* Method Details
  --------------

  + ### getErrorMessage

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getErrorMessage()

    Overrides:
    :   `getErrorMessage` in class `zombie.fileSystem.FileTask`
  + ### done

    public void done()

    Specified by:
    :   `done` in class `zombie.fileSystem.FileTask`
  + ### call

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") call()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`