[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.itemConfig](package-summary.html)
2. [ItemConfig](ItemConfig.html)
3. [ItemConfigException](ItemConfig.ItemConfigException.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [ItemConfigException(String)](#%3Cinit%3E(java.lang.String))
   2. [ItemConfigException(String, Throwable)](#%3Cinit%3E(java.lang.String,java.lang.Throwable))
   3. [ItemConfigException(String, Throwable, boolean)](#%3Cinit%3E(java.lang.String,java.lang.Throwable,boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ItemConfig.ItemConfigException
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang")

[java.lang.Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

zombie.scripting.itemConfig.ItemConfig.ItemConfigException

All Implemented Interfaces:
:   `Serializable`

Enclosing class:
:   `ItemConfig`

---

public static class ItemConfig.ItemConfigException
extends [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

Exception for fatal errors in ItemConfig.

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.scripting.itemConfig.ItemConfig.ItemConfigException)

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemConfigException(String errorMessage)`

  `ItemConfigException(String errorMessage,
  Throwable err)`

  `ItemConfigException(String errorMessage,
  Throwable err,
  boolean doPrint)`
* Method Summary
  --------------

  ### Methods inherited from class [Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html#method-summary "class or interface in java.lang")

  `addSuppressed, fillInStackTrace, getCause, getLocalizedMessage, getMessage, getStackTrace, getSuppressed, initCause, printStackTrace, printStackTrace, printStackTrace, setStackTrace, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Constructor Details
  -------------------

  + ### ItemConfigException

    public ItemConfigException([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") errorMessage)
  + ### ItemConfigException

    public ItemConfigException([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") errorMessage,
    [Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") err)
  + ### ItemConfigException

    public ItemConfigException([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") errorMessage,
    [Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") err,
    boolean doPrint)