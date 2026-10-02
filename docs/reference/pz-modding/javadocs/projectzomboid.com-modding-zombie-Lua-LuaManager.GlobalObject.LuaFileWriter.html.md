[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.Lua](package-summary.html)
2. [LuaManager](LuaManager.html)
3. [GlobalObject](LuaManager.GlobalObject.html)
4. [LuaFileWriter](LuaManager.GlobalObject.LuaFileWriter.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [writer](#writer)
6. [Constructor Details](#constructor-detail)
   1. [LuaFileWriter(PrintWriter)](#%3Cinit%3E(java.io.PrintWriter))
7. [Method Details](#method-detail)
   1. [write(String)](#write(java.lang.String))
   2. [writeln(String)](#writeln(java.lang.String))
   3. [close()](#close())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LuaManager.GlobalObject.LuaFileWriter
===========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.Lua.LuaManager.GlobalObject.LuaFileWriter

Enclosing class:
:   `LuaManager.GlobalObject`

---

public static final class LuaManager.GlobalObject.LuaFileWriter
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final PrintWriter`

  `writer`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LuaFileWriter(PrintWriter writer)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `close()`

  `void`

  `write(String str)`

  `void`

  `writeln(String str)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### writer

    private final [PrintWriter](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/PrintWriter.html "class or interface in java.io") writer
* Constructor Details
  -------------------

  + ### LuaFileWriter

    public LuaFileWriter([PrintWriter](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/PrintWriter.html "class or interface in java.io") writer)
* Method Details
  --------------

  + ### write

    public void write([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### writeln

    public void writeln([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### close

    public void close()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`