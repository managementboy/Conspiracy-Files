[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [GameWindow](GameWindow.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [GAME\_TITLE](#GAME_TITLE)
   2. [s\_fpsTracking](#s_fpsTracking)
   3. [stringUTF](#stringUTF)
   4. [GameInput](#GameInput)
   5. [DEBUG\_SAVE](#DEBUG_SAVE)
   6. [okToSaveOnExit](#okToSaveOnExit)
   7. [lastP](#lastP)
   8. [states](#states)
   9. [serverDisconnected](#serverDisconnected)
   10. [loadedAsClient](#loadedAsClient)
   11. [kickReason](#kickReason)
   12. [drawReloadingLua](#drawReloadingLua)
   13. [activatedJoyPad](#activatedJoyPad)
   14. [version](#version)
   15. [closeRequested](#closeRequested)
   16. [averageFPS](#averageFPS)
   17. [doRenderEvent](#doRenderEvent)
   18. [luaDebuggerKeyDown](#luaDebuggerKeyDown)
   19. [fileSystem](#fileSystem)
   20. [assetManagers](#assetManagers)
   21. [currentTime](#currentTime)
   22. [accumulator](#accumulator)
   23. [gameThreadExited](#gameThreadExited)
   24. [gameThread](#gameThread)
   25. [updateTime](#updateTime)
   26. [texturePacks](#texturePacks)
   27. [texturePackTextures](#texturePackTextures)
7. [Constructor Details](#constructor-detail)
   1. [GameWindow()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [initShared()](#initShared())
   2. [logic()](#logic())
   3. [isIngameState()](#isIngameState())
   4. [render()](#render())
   5. [renderInternal()](#renderInternal())
   6. [InitDisplay()](#InitDisplay())
   7. [InitGameThread()](#InitGameThread())
   8. [uncaughtExceptionMainThread(Thread, Throwable)](#uncaughtExceptionMainThread(java.lang.Thread,java.lang.Throwable))
   9. [uncaughtGlobalException(Thread, Throwable)](#uncaughtGlobalException(java.lang.Thread,java.lang.Throwable))
   10. [uncaughtException(Thread, Throwable)](#uncaughtException(java.lang.Thread,java.lang.Throwable))
   11. [mainThreadStart()](#mainThreadStart())
   12. [mainThreadStep()](#mainThreadStep())
   13. [mainThreadExit()](#mainThreadExit())
   14. [mainThreadInit()](#mainThreadInit())
   15. [renameSaveFolders()](#renameSaveFolders())
   16. [readLong(DataInputStream)](#readLong(java.io.DataInputStream))
   17. [readInt(DataInputStream)](#readInt(java.io.DataInputStream))
   18. [enter()](#enter())
   19. [frameStep()](#frameStep())
   20. [getUpdateTime()](#getUpdateTime())
   21. [onRender()](#onRender())
   22. [exit()](#exit())
   23. [onGameThreadExited()](#onGameThreadExited())
   24. [setTexturePackLookup()](#setTexturePackLookup())
   25. [LoadTexturePack(String, int)](#LoadTexturePack(java.lang.String,int))
   26. [LoadTexturePack(String, int, String)](#LoadTexturePack(java.lang.String,int,java.lang.String))
   27. [installRequiredLibrary(String, String)](#installRequiredLibrary(java.lang.String,java.lang.String))
   28. [checkRequiredLibraries()](#checkRequiredLibraries())
   29. [init()](#init())
   30. [initFonts()](#initFonts())
   31. [save(boolean)](#save(boolean))
   32. [getCoopServerHome()](#getCoopServerHome())
   33. [WriteString(ByteBuffer, String)](#WriteString(java.nio.ByteBuffer,java.lang.String))
   34. [WriteString(DataOutputStream, String)](#WriteString(java.io.DataOutputStream,java.lang.String))
   35. [ReadString(ByteBuffer)](#ReadString(java.nio.ByteBuffer))
   36. [ReadString(DataInputStream)](#ReadString(java.io.DataInputStream))
   37. [getEncodedBytesUTF(String)](#getEncodedBytesUTF(java.lang.String))
   38. [WriteUUID(ByteBuffer, UUID)](#WriteUUID(java.nio.ByteBuffer,java.util.UUID))
   39. [ReadUUID(ByteBuffer)](#ReadUUID(java.nio.ByteBuffer))
   40. [doRenderEvent(boolean)](#doRenderEvent(boolean))
   41. [DoLoadingText(String)](#DoLoadingText(java.lang.String))
   42. [doEpilepsyWarningText()](#doEpilepsyWarningText())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class GameWindow
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.GameWindow

---

public final class GameWindow
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `GameWindow.OSValidator`

  `private static class`

  `GameWindow.s_performance`

  `private static class`

  `GameWindow.StringUTF`

  `private static final class`

  `GameWindow.TexturePack`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static long`

  `accumulator`

  `static zombie.input.JoypadManager.Joypad`

  `activatedJoyPad`

  `static zombie.asset.AssetManagers`

  `assetManagers`

  `static float`

  `averageFPS`

  `static boolean`

  `closeRequested`

  `private static long`

  `currentTime`

  `static final boolean`

  `DEBUG_SAVE`

  `private static boolean`

  `doRenderEvent`

  `static boolean`

  `drawReloadingLua`

  `static zombie.fileSystem.FileSystem`

  `fileSystem`

  `private static final String`

  `GAME_TITLE`

  `static final zombie.core.input.Input`

  `GameInput`

  `static Thread`

  `gameThread`

  `static boolean`

  `gameThreadExited`

  `static String`

  `kickReason`

  `static String`

  `lastP`

  `static boolean`

  `loadedAsClient`

  `static boolean`

  `luaDebuggerKeyDown`

  `static boolean`

  `okToSaveOnExit`

  `private static final zombie.FPSTracking`

  `s_fpsTracking`

  `static boolean`

  `serverDisconnected`

  `static zombie.gameStates.GameStateMachine`

  `states`

  `private static final ThreadLocal<GameWindow.StringUTF>`

  `stringUTF`

  `static final ArrayList<GameWindow.TexturePack>`

  `texturePacks`

  `static final zombie.fileSystem.FileSystem.TexturePackTextures`

  `texturePackTextures`

  `private static long`

  `updateTime`

  `static String`

  `version`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameWindow()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `checkRequiredLibraries()`

  `static void`

  `doEpilepsyWarningText()`

  `static void`

  `DoLoadingText(String text)`

  `static void`

  `doRenderEvent(boolean b)`

  `private static void`

  `enter()`

  `private static void`

  `exit()`

  `private static void`

  `frameStep()`

  `static String`

  `getCoopServerHome()`

  `static ByteBuffer`

  `getEncodedBytesUTF(String str)`

  `static long`

  `getUpdateTime()`

  `private static void`

  `init()`

  Initialise the game

  `static void`

  `InitDisplay()`

  `static void`

  `initFonts()`

  `static void`

  `InitGameThread()`

  `private static void`

  `initShared()`

  `private static void`

  `installRequiredLibrary(String exe,
  String name)`

  `static boolean`

  `isIngameState()`

  `static void`

  `LoadTexturePack(String pack,
  int flags)`

  `static void`

  `LoadTexturePack(String pack,
  int flags,
  String modID)`

  `private static void`

  `logic()`

  `private static void`

  `mainThreadExit()`

  `private static void`

  `mainThreadInit()`

  `private static void`

  `mainThreadStart()`

  `private static void`

  `mainThreadStep()`

  `private static void`

  `onGameThreadExited()`

  `private static void`

  `onRender()`

  `static int`

  `readInt(DataInputStream in)`

  `static long`

  `readLong(DataInputStream in)`

  `static String`

  `ReadString(DataInputStream input)`

  `static String`

  `ReadString(ByteBuffer input)`

  `static UUID`

  `ReadUUID(ByteBuffer input)`

  `private static void`

  `renameSaveFolders()`

  `static void`

  `render()`

  `protected static void`

  `renderInternal()`

  `static void`

  `save(boolean bDoChars)`

  `static void`

  `setTexturePackLookup()`

  `static void`

  `uncaughtException(Thread thread,
  Throwable e)`

  `private static void`

  `uncaughtExceptionMainThread(Thread thread,
  Throwable e)`

  `private static void`

  `uncaughtGlobalException(Thread thread,
  Throwable e)`

  `static void`

  `WriteString(DataOutputStream output,
  String str)`

  `static void`

  `WriteString(ByteBuffer output,
  String str)`

  `static void`

  `WriteUUID(ByteBuffer output,
  UUID uuid)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### GAME\_TITLE

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") GAME\_TITLE

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameWindow.GAME_TITLE)
  + ### s\_fpsTracking

    private static final zombie.FPSTracking s\_fpsTracking
  + ### stringUTF

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[GameWindow.StringUTF](GameWindow.StringUTF.html "class in zombie")> stringUTF
  + ### GameInput

    public static final zombie.core.input.Input GameInput
  + ### DEBUG\_SAVE

    public static final boolean DEBUG\_SAVE

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameWindow.DEBUG_SAVE)
  + ### okToSaveOnExit

    public static boolean okToSaveOnExit
  + ### lastP

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastP
  + ### states

    public static zombie.gameStates.GameStateMachine states
  + ### serverDisconnected

    public static boolean serverDisconnected
  + ### loadedAsClient

    public static boolean loadedAsClient
  + ### kickReason

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") kickReason
  + ### drawReloadingLua

    public static boolean drawReloadingLua
  + ### activatedJoyPad

    public static zombie.input.JoypadManager.Joypad activatedJoyPad
  + ### version

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") version
  + ### closeRequested

    public static volatile boolean closeRequested
  + ### averageFPS

    public static float averageFPS
  + ### doRenderEvent

    private static boolean doRenderEvent
  + ### luaDebuggerKeyDown

    public static boolean luaDebuggerKeyDown
  + ### fileSystem

    public static zombie.fileSystem.FileSystem fileSystem
  + ### assetManagers

    public static zombie.asset.AssetManagers assetManagers
  + ### currentTime

    private static long currentTime
  + ### accumulator

    private static long accumulator
  + ### gameThreadExited

    public static boolean gameThreadExited
  + ### gameThread

    public static [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") gameThread
  + ### updateTime

    private static long updateTime
  + ### texturePacks

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[GameWindow.TexturePack](GameWindow.TexturePack.html "class in zombie")> texturePacks
  + ### texturePackTextures

    public static final zombie.fileSystem.FileSystem.TexturePackTextures texturePackTextures
* Constructor Details
  -------------------

  + ### GameWindow

    public GameWindow()
* Method Details
  --------------

  + ### initShared

    private static void initShared()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### logic

    private static void logic()
  + ### isIngameState

    public static boolean isIngameState()
  + ### render

    public static void render()
  + ### renderInternal

    protected static void renderInternal()
  + ### InitDisplay

    public static void InitDisplay()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io"),
    org.lwjglx.LWJGLException

    Throws:
    :   `IOException`
    :   `org.lwjglx.LWJGLException`
  + ### InitGameThread

    public static void InitGameThread()
  + ### uncaughtExceptionMainThread

    private static void uncaughtExceptionMainThread([Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") thread,
    [Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") e)
  + ### uncaughtGlobalException

    private static void uncaughtGlobalException([Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") thread,
    [Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") e)
  + ### uncaughtException

    public static void uncaughtException([Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") thread,
    [Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") e)
  + ### mainThreadStart

    private static void mainThreadStart()
  + ### mainThreadStep

    private static void mainThreadStep()
  + ### mainThreadExit

    private static void mainThreadExit()
  + ### mainThreadInit

    private static void mainThreadInit()
  + ### renameSaveFolders

    private static void renameSaveFolders()
  + ### readLong

    public static long readLong([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") in)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### readInt

    public static int readInt([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") in)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### enter

    private static void enter()
  + ### frameStep

    private static void frameStep()
  + ### getUpdateTime

    public static long getUpdateTime()
  + ### onRender

    private static void onRender()
  + ### exit

    private static void exit()
  + ### onGameThreadExited

    private static void onGameThreadExited()
  + ### setTexturePackLookup

    public static void setTexturePackLookup()
  + ### LoadTexturePack

    public static void LoadTexturePack([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pack,
    int flags)
  + ### LoadTexturePack

    public static void LoadTexturePack([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pack,
    int flags,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modID)
  + ### installRequiredLibrary

    private static void installRequiredLibrary([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") exe,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### checkRequiredLibraries

    private static void checkRequiredLibraries()
  + ### init

    private static void init()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Initialise the game

    Throws:
    :   `Exception` - if init fails
  + ### initFonts

    public static void initFonts()
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io")

    Throws:
    :   `FileNotFoundException`
  + ### save

    public static void save(boolean bDoChars)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getCoopServerHome

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCoopServerHome()
  + ### WriteString

    public static void WriteString([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### WriteString

    public static void WriteString([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### ReadString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ReadString([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
  + ### ReadString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ReadString([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getEncodedBytesUTF

    public static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") getEncodedBytesUTF([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### WriteUUID

    public static void WriteUUID([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [UUID](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/UUID.html "class or interface in java.util") uuid)
  + ### ReadUUID

    public static [UUID](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/UUID.html "class or interface in java.util") ReadUUID([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
  + ### doRenderEvent

    public static void doRenderEvent(boolean b)
  + ### DoLoadingText

    public static void DoLoadingText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### doEpilepsyWarningText

    public static void doEpilepsyWarningText()