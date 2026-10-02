[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.erosion](package-summary.html)
2. [ErosionConfig](ErosionConfig.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [seeds](#seeds)
   2. [time](#time)
   3. [debug](#debug)
   4. [season](#season)
7. [Constructor Details](#constructor-detail)
   1. [ErosionConfig()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [save(ByteBufferWriter)](#save(zombie.core.network.ByteBufferWriter))
   2. [load(ByteBufferReader)](#load(zombie.core.network.ByteBufferReader))
   3. [writeFile(String)](#writeFile(java.lang.String))
   4. [readFile(String)](#readFile(java.lang.String))
   5. [getDebug()](#getDebug())
   6. [consolePrint()](#consolePrint())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ErosionConfig
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.erosion.ErosionConfig

---

public final class ErosionConfig
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `ErosionConfig.Debug`

  `static final class`

  `ErosionConfig.Season`

  `static final class`

  `ErosionConfig.Seeds`

  `static final class`

  `ErosionConfig.Time`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ErosionConfig.Debug`

  `debug`

  `final ErosionConfig.Season`

  `season`

  `final ErosionConfig.Seeds`

  `seeds`

  `final ErosionConfig.Time`

  `time`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ErosionConfig()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `consolePrint()`

  `ErosionConfig.Debug`

  `getDebug()`

  `void`

  `load(zombie.core.network.ByteBufferReader bb)`

  `boolean`

  `readFile(String fileName)`

  `void`

  `save(zombie.core.network.ByteBufferWriter bb)`

  `void`

  `writeFile(String fileName)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### seeds

    public final [ErosionConfig.Seeds](ErosionConfig.Seeds.html "class in zombie.erosion") seeds
  + ### time

    public final [ErosionConfig.Time](ErosionConfig.Time.html "class in zombie.erosion") time
  + ### debug

    public final [ErosionConfig.Debug](ErosionConfig.Debug.html "class in zombie.erosion") debug
  + ### season

    public final [ErosionConfig.Season](ErosionConfig.Season.html "class in zombie.erosion") season
* Constructor Details
  -------------------

  + ### ErosionConfig

    public ErosionConfig()
* Method Details
  --------------

  + ### save

    public void save(zombie.core.network.ByteBufferWriter bb)
  + ### load

    public void load(zombie.core.network.ByteBufferReader bb)
  + ### writeFile

    public void writeFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### readFile

    public boolean readFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### getDebug

    public [ErosionConfig.Debug](ErosionConfig.Debug.html "class in zombie.erosion") getDebug()
  + ### consolePrint

    public void consolePrint()