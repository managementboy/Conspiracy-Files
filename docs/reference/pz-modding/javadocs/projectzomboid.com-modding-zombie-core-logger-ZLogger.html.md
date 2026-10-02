[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.logger](package-summary.html)
2. [ZLogger](ZLogger.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [name](#name)
   2. [outputStreams](#outputStreams)
   3. [file](#file)
   4. [s\_logSdf](#s_logSdf)
   5. [s\_maxSizeKo](#s_maxSizeKo)
7. [Constructor Details](#constructor-detail)
   1. [ZLogger(String, boolean)](#%3Cinit%3E(java.lang.String,boolean))
8. [Method Details](#method-detail)
   1. [getLoggerName(String)](#getLoggerName(java.lang.String))
   2. [write(String)](#write(java.lang.String))
   3. [write(String, String)](#write(java.lang.String,java.lang.String))
   4. [write(String, String, boolean)](#write(java.lang.String,java.lang.String,boolean))
   5. [writeUnsafe(String, String, boolean)](#writeUnsafe(java.lang.String,java.lang.String,boolean))
   6. [write(Exception)](#write(java.lang.Exception))
   7. [checkSize()](#checkSize())
   8. [checkSizeUnsafe()](#checkSizeUnsafe())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ZLogger
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.logger.ZLogger

---

public final class ZLogger
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `ZLogger.OutputStreams`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private File`

  `file`

  `private final String`

  `name`

  `private final ZLogger.OutputStreams`

  `outputStreams`

  `private static final SimpleDateFormat`

  `s_logSdf`

  `private static final long`

  `s_maxSizeKo`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ZLogger(String name,
  boolean useConsole)`

  Write logs into file and console.
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `checkSize()`

  `private void`

  `checkSizeUnsafe()`

  `private static String`

  `getLoggerName(String fileName)`

  `void`

  `write(Exception ex)`

  `void`

  `write(String logs)`

  `void`

  `write(String logs,
  String level)`

  `void`

  `write(String logs,
  String level,
  boolean append)`

  `void`

  `writeUnsafe(String logs,
  String prefix,
  boolean append)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### outputStreams

    private final [ZLogger.OutputStreams](ZLogger.OutputStreams.html "class in zombie.core.logger") outputStreams
  + ### file

    private [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") file
  + ### s\_logSdf

    private static final [SimpleDateFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/SimpleDateFormat.html "class or interface in java.text") s\_logSdf
  + ### s\_maxSizeKo

    private static final long s\_maxSizeKo

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.logger.ZLogger.s_maxSizeKo)
* Constructor Details
  -------------------

  + ### ZLogger

    public ZLogger([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean useConsole)

    Write logs into file and console.

    Parameters:
    :   `name` - filename
    :   `useConsole` - if true then write logs into console also
* Method Details
  --------------

  + ### getLoggerName

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLoggerName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### write

    public void write([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logs)
  + ### write

    public void write([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logs,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") level)
  + ### write

    public void write([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logs,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") level,
    boolean append)
  + ### writeUnsafe

    public void writeUnsafe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logs,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefix,
    boolean append)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### write

    public void write([Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang") ex)
  + ### checkSize

    private void checkSize()
  + ### checkSizeUnsafe

    private void checkSizeUnsafe()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`