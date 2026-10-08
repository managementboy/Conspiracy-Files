[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [MainThreadQueueItem](MainThreadQueueItem.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [runnable](#runnable)
   2. [isFinished](#isFinished)
   3. [isWaiting](#isWaiting)
   4. [runnableThrown](#runnableThrown)
   5. [waitLock](#waitLock)
6. [Constructor Details](#constructor-detail)
   1. [MainThreadQueueItem()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [alloc(Runnable)](#alloc(java.lang.Runnable))
   2. [resetInternal()](#resetInternal())
   3. [waitUntilFinished(BooleanSupplier)](#waitUntilFinished(java.util.function.BooleanSupplier))
   4. [isFinished()](#isFinished())
   5. [setWaiting()](#setWaiting())
   6. [isWaiting()](#isWaiting())
   7. [invoke()](#invoke())
   8. [getThrown()](#getThrown())
   9. [notifyWaitingListeners()](#notifyWaitingListeners())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class MainThreadQueueItem
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.MainThreadQueueItem

---

public final class MainThreadQueueItem
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `isFinished`

  `private boolean`

  `isWaiting`

  `private Runnable`

  `runnable`

  `private Throwable`

  `runnableThrown`

  `private final Object`

  `waitLock`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `MainThreadQueueItem()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static MainThreadQueueItem`

  `alloc(Runnable runnable)`

  `Throwable`

  `getThrown()`

  `void`

  `invoke()`

  `boolean`

  `isFinished()`

  `boolean`

  `isWaiting()`

  `void`

  `notifyWaitingListeners()`

  `private void`

  `resetInternal()`

  `void`

  `setWaiting()`

  `void`

  `waitUntilFinished(BooleanSupplier waitCallback)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### runnable

    private [Runnable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Runnable.html "class or interface in java.lang") runnable
  + ### isFinished

    private boolean isFinished
  + ### isWaiting

    private boolean isWaiting
  + ### runnableThrown

    private [Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") runnableThrown
  + ### waitLock

    private final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") waitLock
* Constructor Details
  -------------------

  + ### MainThreadQueueItem

    private MainThreadQueueItem()
* Method Details
  --------------

  + ### alloc

    public static [MainThreadQueueItem](MainThreadQueueItem.html "class in zombie") alloc([Runnable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Runnable.html "class or interface in java.lang") runnable)
  + ### resetInternal

    private void resetInternal()
  + ### waitUntilFinished

    public void waitUntilFinished([BooleanSupplier](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BooleanSupplier.html "class or interface in java.util.function") waitCallback)
    throws [InterruptedException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/InterruptedException.html "class or interface in java.lang")

    Throws:
    :   `InterruptedException`
  + ### isFinished

    public boolean isFinished()
  + ### setWaiting

    public void setWaiting()
  + ### isWaiting

    public boolean isWaiting()
  + ### invoke

    public void invoke()
  + ### getThrown

    public [Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") getThrown()
  + ### notifyWaitingListeners

    public void notifyWaitingListeners()