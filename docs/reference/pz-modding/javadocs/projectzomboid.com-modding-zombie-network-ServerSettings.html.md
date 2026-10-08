[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [ServerSettings](ServerSettings.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [serverOptions](#serverOptions)
   3. [sandboxOptions](#sandboxOptions)
   4. [spawnRegions](#spawnRegions)
   5. [spawnPoints](#spawnPoints)
   6. [valid](#valid)
   7. [errorMsg](#errorMsg)
6. [Constructor Details](#constructor-detail)
   1. [ServerSettings(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [resetToDefault()](#resetToDefault())
   3. [loadFiles()](#loadFiles())
   4. [saveFiles()](#saveFiles())
   5. [tryDeleteFile(String)](#tryDeleteFile(java.lang.String))
   6. [deleteFiles()](#deleteFiles())
   7. [duplicateFiles(String)](#duplicateFiles(java.lang.String))
   8. [rename(String)](#rename(java.lang.String))
   9. [getServerOptions()](#getServerOptions())
   10. [getSandboxOptions()](#getSandboxOptions())
   11. [getNumSpawnRegions()](#getNumSpawnRegions())
   12. [getSpawnRegionName(int)](#getSpawnRegionName(int))
   13. [getSpawnRegionFile(int)](#getSpawnRegionFile(int))
   14. [clearSpawnRegions()](#clearSpawnRegions())
   15. [addSpawnRegion(String, String)](#addSpawnRegion(java.lang.String,java.lang.String))
   16. [removeSpawnRegion(int)](#removeSpawnRegion(int))
   17. [loadSpawnPointsFile(String)](#loadSpawnPointsFile(java.lang.String))
   18. [saveSpawnPointsFile(String, KahluaTable)](#saveSpawnPointsFile(java.lang.String,se.krka.kahlua.vm.KahluaTable))
   19. [isValid()](#isValid())
   20. [getErrorMsg()](#getErrorMsg())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ServerSettings
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.ServerSettings

---

public class ServerSettings
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `errorMsg`

  `protected String`

  `name`

  `protected SandboxOptions`

  `sandboxOptions`

  `protected ServerOptions`

  `serverOptions`

  `protected ArrayList<zombie.network.SpawnRegions.Profession>`

  `spawnPoints`

  `protected ArrayList<zombie.network.SpawnRegions.Region>`

  `spawnRegions`

  `private final boolean`

  `valid`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ServerSettings(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addSpawnRegion(String name,
  String file)`

  `void`

  `clearSpawnRegions()`

  `boolean`

  `deleteFiles()`

  `boolean`

  `duplicateFiles(String newName)`

  `String`

  `getErrorMsg()`

  `String`

  `getName()`

  `int`

  `getNumSpawnRegions()`

  `SandboxOptions`

  `getSandboxOptions()`

  `ServerOptions`

  `getServerOptions()`

  `String`

  `getSpawnRegionFile(int index)`

  `String`

  `getSpawnRegionName(int index)`

  `boolean`

  `isValid()`

  `boolean`

  `loadFiles()`

  `se.krka.kahlua.vm.KahluaTable`

  `loadSpawnPointsFile(String file)`

  `void`

  `removeSpawnRegion(int index)`

  `boolean`

  `rename(String newName)`

  `void`

  `resetToDefault()`

  `boolean`

  `saveFiles()`

  `boolean`

  `saveSpawnPointsFile(String file,
  se.krka.kahlua.vm.KahluaTable professionsTable)`

  `private boolean`

  `tryDeleteFile(String fileName)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### serverOptions

    protected [ServerOptions](ServerOptions.html "class in zombie.network") serverOptions
  + ### sandboxOptions

    protected [SandboxOptions](../SandboxOptions.html "class in zombie") sandboxOptions
  + ### spawnRegions

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.network.SpawnRegions.Region> spawnRegions
  + ### spawnPoints

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.network.SpawnRegions.Profession> spawnPoints
  + ### valid

    private final boolean valid
  + ### errorMsg

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") errorMsg
* Constructor Details
  -------------------

  + ### ServerSettings

    public ServerSettings([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### resetToDefault

    public void resetToDefault()
  + ### loadFiles

    public boolean loadFiles()
  + ### saveFiles

    public boolean saveFiles()
  + ### tryDeleteFile

    private boolean tryDeleteFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### deleteFiles

    public boolean deleteFiles()
  + ### duplicateFiles

    public boolean duplicateFiles([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newName)
  + ### rename

    public boolean rename([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newName)
  + ### getServerOptions

    public [ServerOptions](ServerOptions.html "class in zombie.network") getServerOptions()
  + ### getSandboxOptions

    public [SandboxOptions](../SandboxOptions.html "class in zombie") getSandboxOptions()
  + ### getNumSpawnRegions

    public int getNumSpawnRegions()
  + ### getSpawnRegionName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSpawnRegionName(int index)
  + ### getSpawnRegionFile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSpawnRegionFile(int index)
  + ### clearSpawnRegions

    public void clearSpawnRegions()
  + ### addSpawnRegion

    public void addSpawnRegion([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### removeSpawnRegion

    public void removeSpawnRegion(int index)
  + ### loadSpawnPointsFile

    public se.krka.kahlua.vm.KahluaTable loadSpawnPointsFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file)
  + ### saveSpawnPointsFile

    public boolean saveSpawnPointsFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file,
    se.krka.kahlua.vm.KahluaTable professionsTable)
  + ### isValid

    public boolean isValid()
  + ### getErrorMsg

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getErrorMsg()