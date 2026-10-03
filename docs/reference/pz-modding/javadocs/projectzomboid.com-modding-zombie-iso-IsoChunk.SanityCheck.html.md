[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoChunk](IsoChunk.html)
3. [SanityCheck](IsoChunk.SanityCheck.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [saveChunk](#saveChunk)
   2. [saveThread](#saveThread)
   3. [loadChunk](#loadChunk)
   4. [loadThread](#loadThread)
   5. [loadFile](#loadFile)
   6. [saveFile](#saveFile)
6. [Constructor Details](#constructor-detail)
   1. [SanityCheck()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [beginSave(IsoChunk)](#beginSave(zombie.iso.IsoChunk))
   2. [endSave(IsoChunk)](#endSave(zombie.iso.IsoChunk))
   3. [beginLoad(IsoChunk)](#beginLoad(zombie.iso.IsoChunk))
   4. [endLoad(IsoChunk)](#endLoad(zombie.iso.IsoChunk))
   5. [checkCRC(long, long)](#checkCRC(long,long))
   6. [checkLength(long, long)](#checkLength(long,long))
   7. [beginLoadFile(String)](#beginLoadFile(java.lang.String))
   8. [endLoadFile(String)](#endLoadFile(java.lang.String))
   9. [beginSaveFile(String)](#beginSaveFile(java.lang.String))
   10. [endSaveFile()](#endSaveFile())
   11. [log(String)](#log(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoChunk.SanityCheck
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoChunk.SanityCheck

Enclosing class:
:   `IsoChunk`

---

private static class IsoChunk.SanityCheck
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `IsoChunk`

  `loadChunk`

  `final ArrayList<String>`

  `loadFile`

  `String`

  `loadThread`

  `IsoChunk`

  `saveChunk`

  `String`

  `saveFile`

  `String`

  `saveThread`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SanityCheck()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `beginLoad(IsoChunk chunk)`

  `void`

  `beginLoadFile(String file)`

  `void`

  `beginSave(IsoChunk chunk)`

  `void`

  `beginSaveFile(String file)`

  `void`

  `checkCRC(long saveCRC,
  long loadCRC)`

  `void`

  `checkLength(long saveLen,
  long loadLen)`

  `void`

  `endLoad(IsoChunk chunk)`

  `void`

  `endLoadFile(String file)`

  `void`

  `endSave(IsoChunk chunk)`

  `void`

  `endSaveFile()`

  `void`

  `log(String message)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### saveChunk

    public [IsoChunk](IsoChunk.html "class in zombie.iso") saveChunk
  + ### saveThread

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveThread
  + ### loadChunk

    public [IsoChunk](IsoChunk.html "class in zombie.iso") loadChunk
  + ### loadThread

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") loadThread
  + ### loadFile

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadFile
  + ### saveFile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") saveFile
* Constructor Details
  -------------------

  + ### SanityCheck

    private SanityCheck()
* Method Details
  --------------

  + ### beginSave

    public void beginSave([IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### endSave

    public void endSave([IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### beginLoad

    public void beginLoad([IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### endLoad

    public void endLoad([IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### checkCRC

    public void checkCRC(long saveCRC,
    long loadCRC)
  + ### checkLength

    public void checkLength(long saveLen,
    long loadLen)
  + ### beginLoadFile

    public void beginLoadFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### endLoadFile

    public void endLoadFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### beginSaveFile

    public void beginSaveFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### endSaveFile

    public void endSaveFile()
  + ### log

    public void log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)