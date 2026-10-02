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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [ALLOWED\_FILE\_EXTENSIONS](#ALLOWED_FILE_EXTENSIONS)
   2. [converterManager](#converterManager)
   3. [platform](#platform)
   4. [env](#env)
   5. [thread](#thread)
   6. [debugthread](#debugthread)
   7. [caller](#caller)
   8. [debugcaller](#debugcaller)
   9. [exposer](#exposer)
   10. [loaded](#loaded)
   11. [loading](#loading)
   12. [loadedReturn](#loadedReturn)
   13. [checksumDone](#checksumDone)
   14. [loadList](#loadList)
   15. [paths](#paths)
   16. [filenameToClosure](#filenameToClosure)
   17. [luaFunctionMap](#luaFunctionMap)
   18. [luaTableMap](#luaTableMap)
   19. [videoTextures](#videoTextures)
   20. [arrayConverter](#arrayConverter)
   21. [s\_wiping](#s_wiping)
7. [Constructor Details](#constructor-detail)
   1. [LuaManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [outputTable(KahluaTable, int)](#outputTable(se.krka.kahlua.vm.KahluaTable,int))
   2. [wipeRecurse(KahluaTable)](#wipeRecurse(se.krka.kahlua.vm.KahluaTable))
   3. [init()](#init())
   4. [LoadDirBase(String)](#LoadDirBase(java.lang.String))
   5. [LoadDirBase(String, boolean)](#LoadDirBase(java.lang.String,boolean))
   6. [initChecksum()](#initChecksum())
   7. [finishChecksum()](#finishChecksum())
   8. [LoadDirBase()](#LoadDirBase())
   9. [searchFolders(URI, File)](#searchFolders(java.net.URI,java.io.File))
   10. [getLuaCacheDir()](#getLuaCacheDir())
   11. [getSandboxCacheDir()](#getSandboxCacheDir())
   12. [isIndieStoneUrl(String)](#isIndieStoneUrl(java.lang.String))
   13. [fillContainer(ItemContainer, IsoPlayer)](#fillContainer(zombie.inventory.ItemContainer,zombie.characters.IsoPlayer))
   14. [updateOverlaySprite(IsoObject)](#updateOverlaySprite(zombie.iso.IsoObject))
   15. [getDotDelimitedClosure(String)](#getDotDelimitedClosure(java.lang.String))
   16. [AdjacentFreeTileFinder(IsoGridSquare, IsoPlayer)](#AdjacentFreeTileFinder(zombie.iso.IsoGridSquare,zombie.characters.IsoPlayer))
   17. [RunLua(String)](#RunLua(java.lang.String))
   18. [RunLua(String, boolean)](#RunLua(java.lang.String,boolean))
   19. [RunLuaInternal(String, boolean)](#RunLuaInternal(java.lang.String,boolean))
   20. [getFunctionObject(String)](#getFunctionObject(java.lang.String))
   21. [getFunctionObject(String, DebugType)](#getFunctionObject(java.lang.String,zombie.debug.DebugType))
   22. [getTableObject(String)](#getTableObject(java.lang.String))
   23. [getTableObject(String, DebugType)](#getTableObject(java.lang.String,zombie.debug.DebugType))
   24. [get(Object)](#get(java.lang.Object))
   25. [call(String, Object)](#call(java.lang.String,java.lang.Object))
   26. [exposeKeyboardKeys(KahluaTable)](#exposeKeyboardKeys(se.krka.kahlua.vm.KahluaTable))
   27. [exposeMouseButtons(KahluaTable)](#exposeMouseButtons(se.krka.kahlua.vm.KahluaTable))
   28. [exposeLuaCalendar()](#exposeLuaCalendar())
   29. [getHourMinuteJava()](#getHourMinuteJava())
   30. [releaseAllVideoTextures()](#releaseAllVideoTextures())
   31. [copyTable(KahluaTable)](#copyTable(se.krka.kahlua.vm.KahluaTable))
   32. [copyTable(KahluaTable, KahluaTable)](#copyTable(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaTable))
   33. [insertAnyLuaTraceElements(StackTraceElement[])](#insertAnyLuaTraceElements(java.lang.StackTraceElement%5B%5D))
   34. [getLuaStackTraceCallFrames(Coroutine)](#getLuaStackTraceCallFrames(se.krka.kahlua.vm.Coroutine))
   35. [getLuaStackTraceStrings(Coroutine)](#getLuaStackTraceStrings(se.krka.kahlua.vm.Coroutine))
   36. [getLuaStackStrace(Coroutine)](#getLuaStackStrace(se.krka.kahlua.vm.Coroutine))
   37. [validateReflectionAccess(Object)](#validateReflectionAccess(java.lang.Object))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LuaManager
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.Lua.LuaManager

---

public final class LuaManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `LuaManager.Exposer`

  `static class`

  `LuaManager.GlobalObject`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Set<String>`

  `ALLOWED_FILE_EXTENSIONS`

  `private static zombie.Lua.KahluaArrayConverter`

  `arrayConverter`

  `static se.krka.kahlua.integration.LuaCaller`

  `caller`

  `static boolean`

  `checksumDone`

  `static se.krka.kahlua.converter.KahluaConverterManager`

  `converterManager`

  `static se.krka.kahlua.integration.LuaCaller`

  `debugcaller`

  `static se.krka.kahlua.vm.KahluaThread`

  `debugthread`

  `static se.krka.kahlua.vm.KahluaTable`

  `env`

  `static LuaManager.Exposer`

  `exposer`

  `private static final Map<String, se.krka.kahlua.vm.LuaClosure>`

  `filenameToClosure`

  `static ArrayList<String>`

  `loaded`

  `static HashMap<String,Object>`

  `loadedReturn`

  `private static final HashSet<String>`

  `loading`

  `static ArrayList<String>`

  `loadList`

  `private static final HashMap<String,Object>`

  `luaFunctionMap`

  `private static final HashMap<String,Object>`

  `luaTableMap`

  `private static final ArrayList<String>`

  `paths`

  `static se.krka.kahlua.j2se.J2SEPlatform`

  `platform`

  `private static final HashSet<se.krka.kahlua.vm.KahluaTable>`

  `s_wiping`

  `static se.krka.kahlua.vm.KahluaThread`

  `thread`

  `private static final HashMap<String, VideoTexture>`

  `videoTextures`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LuaManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static IsoGridSquare`

  `AdjacentFreeTileFinder(IsoGridSquare test,
  IsoPlayer player)`

  `static void`

  `call(String func,
  Object param1)`

  `static se.krka.kahlua.vm.KahluaTable`

  `copyTable(se.krka.kahlua.vm.KahluaTable from)`

  `static se.krka.kahlua.vm.KahluaTable`

  `copyTable(se.krka.kahlua.vm.KahluaTable to,
  se.krka.kahlua.vm.KahluaTable from)`

  `private static void`

  `exposeKeyboardKeys(se.krka.kahlua.vm.KahluaTable baseContainer)`

  `private static void`

  `exposeLuaCalendar()`

  `private static void`

  `exposeMouseButtons(se.krka.kahlua.vm.KahluaTable baseContainer)`

  `static void`

  `fillContainer(ItemContainer container,
  IsoPlayer isoPlayer)`

  `static void`

  `finishChecksum()`

  `static Object`

  `get(Object key)`

  `static se.krka.kahlua.vm.LuaClosure`

  `getDotDelimitedClosure(String path)`

  `static Object`

  `getFunctionObject(String functionName)`

  `static Object`

  `getFunctionObject(String functionName,
  DebugType logger)`

  `static String`

  `getHourMinuteJava()`

  `static String`

  `getLuaCacheDir()`

  `static StackTraceElement[]`

  `getLuaStackStrace(Coroutine coroutine)`

  `static se.krka.kahlua.vm.LuaCallFrame[]`

  `getLuaStackTraceCallFrames(Coroutine coroutine)`

  `static String[]`

  `getLuaStackTraceStrings(Coroutine coroutine)`

  `static String`

  `getSandboxCacheDir()`

  `static Object`

  `getTableObject(String tableName)`

  `static Object`

  `getTableObject(String tableName,
  DebugType logger)`

  `static void`

  `init()`

  `static void`

  `initChecksum()`

  `static StackTraceElement[]`

  `insertAnyLuaTraceElements(StackTraceElement[] stackTraceElementsRaw)`

  `static boolean`

  `isIndieStoneUrl(String url)`

  `static void`

  `LoadDirBase()`

  `static void`

  `LoadDirBase(String sub)`

  `static void`

  `LoadDirBase(String sub,
  boolean onlyChecksum)`

  `static void`

  `outputTable(se.krka.kahlua.vm.KahluaTable t,
  int nTabs)`

  `static void`

  `releaseAllVideoTextures()`

  `static Object`

  `RunLua(String filename)`

  `static Object`

  `RunLua(String filename,
  boolean bRewriteEvents)`

  `private static Object`

  `RunLuaInternal(String filename,
  boolean bRewriteEvents)`

  `static void`

  `searchFolders(URI base,
  File fo)`

  `static void`

  `updateOverlaySprite(IsoObject obj)`

  `private static void`

  `validateReflectionAccess(Object o)`

  `private static void`

  `wipeRecurse(se.krka.kahlua.vm.KahluaTable table)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### ALLOWED\_FILE\_EXTENSIONS

    private static final [Set](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Set.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> ALLOWED\_FILE\_EXTENSIONS
  + ### converterManager

    public static se.krka.kahlua.converter.KahluaConverterManager converterManager
  + ### platform

    public static se.krka.kahlua.j2se.J2SEPlatform platform
  + ### env

    public static se.krka.kahlua.vm.KahluaTable env
  + ### thread

    public static se.krka.kahlua.vm.KahluaThread thread
  + ### debugthread

    public static se.krka.kahlua.vm.KahluaThread debugthread
  + ### caller

    public static se.krka.kahlua.integration.LuaCaller caller
  + ### debugcaller

    public static se.krka.kahlua.integration.LuaCaller debugcaller
  + ### exposer

    public static [LuaManager.Exposer](LuaManager.Exposer.html "class in zombie.Lua") exposer
  + ### loaded

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loaded
  + ### loading

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loading
  + ### loadedReturn

    public static [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> loadedReturn
  + ### checksumDone

    public static boolean checksumDone
  + ### loadList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> loadList
  + ### paths

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> paths
  + ### filenameToClosure

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), se.krka.kahlua.vm.LuaClosure> filenameToClosure
  + ### luaFunctionMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> luaFunctionMap
  + ### luaTableMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> luaTableMap
  + ### videoTextures

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [VideoTexture](../core/textures/VideoTexture.html "class in zombie.core.textures")> videoTextures
  + ### arrayConverter

    private static zombie.Lua.KahluaArrayConverter arrayConverter
  + ### s\_wiping

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<se.krka.kahlua.vm.KahluaTable> s\_wiping
* Constructor Details
  -------------------

  + ### LuaManager

    public LuaManager()
* Method Details
  --------------

  + ### outputTable

    public static void outputTable(se.krka.kahlua.vm.KahluaTable t,
    int nTabs)
  + ### wipeRecurse

    private static void wipeRecurse(se.krka.kahlua.vm.KahluaTable table)
  + ### init

    public static void init()
  + ### LoadDirBase

    public static void LoadDirBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sub)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadDirBase

    public static void LoadDirBase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sub,
    boolean onlyChecksum)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### initChecksum

    public static void initChecksum()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### finishChecksum

    public static void finishChecksum()
  + ### LoadDirBase

    public static void LoadDirBase()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### searchFolders

    public static void searchFolders([URI](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/net/URI.html "class or interface in java.net") base,
    [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") fo)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getLuaCacheDir

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaCacheDir()
  + ### getSandboxCacheDir

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSandboxCacheDir()
  + ### isIndieStoneUrl

    public static boolean isIndieStoneUrl([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") url)
  + ### fillContainer

    public static void fillContainer([ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") isoPlayer)
  + ### updateOverlaySprite

    public static void updateOverlaySprite([IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### getDotDelimitedClosure

    public static se.krka.kahlua.vm.LuaClosure getDotDelimitedClosure([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### AdjacentFreeTileFinder

    public static [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") AdjacentFreeTileFinder([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") test,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### RunLua

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") RunLua([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### RunLua

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") RunLua([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    boolean bRewriteEvents)
  + ### RunLuaInternal

    private static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") RunLuaInternal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    boolean bRewriteEvents)
  + ### getFunctionObject

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getFunctionObject([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName)
  + ### getFunctionObject

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getFunctionObject([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName,
    [DebugType](../debug/DebugType.html "enum class in zombie.debug") logger)
  + ### getTableObject

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getTableObject([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tableName)
  + ### getTableObject

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getTableObject([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tableName,
    [DebugType](../debug/DebugType.html "enum class in zombie.debug") logger)
  + ### get

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") get([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### call

    public static void call([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") param1)
  + ### exposeKeyboardKeys

    private static void exposeKeyboardKeys(se.krka.kahlua.vm.KahluaTable baseContainer)
  + ### exposeMouseButtons

    private static void exposeMouseButtons(se.krka.kahlua.vm.KahluaTable baseContainer)
  + ### exposeLuaCalendar

    private static void exposeLuaCalendar()
  + ### getHourMinuteJava

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHourMinuteJava()
  + ### releaseAllVideoTextures

    public static void releaseAllVideoTextures()
  + ### copyTable

    public static se.krka.kahlua.vm.KahluaTable copyTable(se.krka.kahlua.vm.KahluaTable from)
  + ### copyTable

    public static se.krka.kahlua.vm.KahluaTable copyTable(se.krka.kahlua.vm.KahluaTable to,
    se.krka.kahlua.vm.KahluaTable from)
  + ### insertAnyLuaTraceElements

    public static [StackTraceElement](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StackTraceElement.html "class or interface in java.lang")[] insertAnyLuaTraceElements([StackTraceElement](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StackTraceElement.html "class or interface in java.lang")[] stackTraceElementsRaw)
  + ### getLuaStackTraceCallFrames

    public static se.krka.kahlua.vm.LuaCallFrame[] getLuaStackTraceCallFrames([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") coroutine)
  + ### getLuaStackTraceStrings

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] getLuaStackTraceStrings([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") coroutine)
  + ### getLuaStackStrace

    public static [StackTraceElement](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StackTraceElement.html "class or interface in java.lang")[] getLuaStackStrace([Coroutine](../../se/krka/kahlua/vm/Coroutine.html "class in se.krka.kahlua.vm") coroutine)
  + ### validateReflectionAccess

    private static void validateReflectionAccess([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)