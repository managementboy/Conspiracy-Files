[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.debug](package-summary.html)
2. [DebugLog](DebugLog.html)
3. [OutputStreamWrapper](DebugLog.OutputStreamWrapper.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [OutputStreamWrapper(OutputStream)](#%3Cinit%3E(java.io.OutputStream))
6. [Method Details](#method-detail)
   1. [write(byte[], int, int)](#write(byte%5B%5D,int,int))
   2. [setStream(OutputStream)](#setStream(java.io.OutputStream))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DebugLog.OutputStreamWrapper
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.io.OutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/OutputStream.html "class or interface in java.io")

[java.io.FilterOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FilterOutputStream.html "class or interface in java.io")

zombie.debug.DebugLog.OutputStreamWrapper

All Implemented Interfaces:
:   `Closeable, Flushable, AutoCloseable`

Enclosing class:
:   `DebugLog`

---

private static final class DebugLog.OutputStreamWrapper
extends [FilterOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FilterOutputStream.html "class or interface in java.io")

* Field Summary
  -------------

  ### Fields inherited from class [FilterOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FilterOutputStream.html#field-summary "class or interface in java.io")

  `out`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `OutputStreamWrapper(OutputStream out)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `setStream(OutputStream out)`

  `void`

  `write(byte[] b,
  int off,
  int len)`

  ### Methods inherited from class [FilterOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FilterOutputStream.html#method-summary "class or interface in java.io")

  `close, flush, write, write`

  ### Methods inherited from class [OutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/OutputStream.html#method-summary "class or interface in java.io")

  `nullOutputStream`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### OutputStreamWrapper

    public OutputStreamWrapper([OutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/OutputStream.html "class or interface in java.io") out)
* Method Details
  --------------

  + ### write

    public void write(byte[] b,
    int off,
    int len)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Overrides:
    :   `write` in class `FilterOutputStream`

    Throws:
    :   `IOException`
  + ### setStream

    public void setStream([OutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/OutputStream.html "class or interface in java.io") out)