[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.areas.isoregion](package-summary.html)
2. [IsoRegionsLogger](IsoRegionsLogger.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [loggerQueue](#loggerQueue)
   3. [consolePrint](#consolePrint)
   4. [logs](#logs)
   5. [maxLogs](#maxLogs)
   6. [isDirtyUi](#isDirtyUi)
7. [Constructor Details](#constructor-detail)
   1. [IsoRegionsLogger(boolean)](#%3Cinit%3E(boolean))
8. [Method Details](#method-detail)
   1. [getLogs()](#getLogs())
   2. [isDirtyUI()](#isDirtyUI())
   3. [unsetDirtyUI()](#unsetDirtyUI())
   4. [getLog()](#getLog())
   5. [log(String)](#log(java.lang.String))
   6. [log(String, Color)](#log(java.lang.String,zombie.core.Color))
   7. [warn(String)](#warn(java.lang.String))
   8. [update()](#update())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class IsoRegionsLogger
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.isoregion.IsoRegionsLogger

---

public class IsoRegionsLogger
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `IsoRegionsLogger.IsoRegionLog`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final boolean`

  `consolePrint`

  `private boolean`

  `isDirtyUi`

  `private final ConcurrentLinkedQueue<IsoRegionsLogger.IsoRegionLog>`

  `loggerQueue`

  `private final ArrayList<IsoRegionsLogger.IsoRegionLog>`

  `logs`

  `private final int`

  `maxLogs`

  `private final ConcurrentLinkedQueue<IsoRegionsLogger.IsoRegionLog>`

  `pool`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoRegionsLogger(boolean doConsolePrint)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private IsoRegionsLogger.IsoRegionLog`

  `getLog()`

  `ArrayList<IsoRegionsLogger.IsoRegionLog>`

  `getLogs()`

  `boolean`

  `isDirtyUI()`

  `protected void`

  `log(String str)`

  `protected void`

  `log(String str,
  Color col)`

  `void`

  `unsetDirtyUI()`

  `protected void`

  `update()`

  `protected void`

  `warn(String str)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<[IsoRegionsLogger.IsoRegionLog](IsoRegionsLogger.IsoRegionLog.html "class in zombie.iso.areas.isoregion")> pool
  + ### loggerQueue

    private final [ConcurrentLinkedQueue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedQueue.html "class or interface in java.util.concurrent")<[IsoRegionsLogger.IsoRegionLog](IsoRegionsLogger.IsoRegionLog.html "class in zombie.iso.areas.isoregion")> loggerQueue
  + ### consolePrint

    private final boolean consolePrint
  + ### logs

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoRegionsLogger.IsoRegionLog](IsoRegionsLogger.IsoRegionLog.html "class in zombie.iso.areas.isoregion")> logs
  + ### maxLogs

    private final int maxLogs

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegionsLogger.maxLogs)
  + ### isDirtyUi

    private boolean isDirtyUi
* Constructor Details
  -------------------

  + ### IsoRegionsLogger

    public IsoRegionsLogger(boolean doConsolePrint)
* Method Details
  --------------

  + ### getLogs

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoRegionsLogger.IsoRegionLog](IsoRegionsLogger.IsoRegionLog.html "class in zombie.iso.areas.isoregion")> getLogs()
  + ### isDirtyUI

    public boolean isDirtyUI()
  + ### unsetDirtyUI

    public void unsetDirtyUI()
  + ### getLog

    private [IsoRegionsLogger.IsoRegionLog](IsoRegionsLogger.IsoRegionLog.html "class in zombie.iso.areas.isoregion") getLog()
  + ### log

    protected void log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### log

    protected void log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Color](../../../core/Color.html "class in zombie.core") col)
  + ### warn

    protected void warn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### update

    protected void update()