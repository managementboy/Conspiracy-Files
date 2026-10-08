[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.debug](package-summary.html)
2. [DebugLog](DebugLog.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [instanceLock](#instanceLock)
   3. [initialized](#initialized)
   4. [logTraceFileLocationEnabled](#logTraceFileLocationEnabled)
   5. [logTimeMsEnabled](#logTimeMsEnabled)
   6. [logServerTimeMsEnabled](#logServerTimeMsEnabled)
   7. [stdOut](#stdOut)
   8. [stdErr](#stdErr)
   9. [originalOut](#originalOut)
   10. [originalErr](#originalErr)
   11. [GeneralErr](#GeneralErr)
   12. [logFileLogger](#logFileLogger)
   13. [dbgCfgFile](#dbgCfgFile)
   14. [debugCfgFileWatcher](#debugCfgFileWatcher)
   15. [debugCfgFileWatcherPath](#debugCfgFileWatcherPath)
   16. [lokiInit](#lokiInit)
   17. [loki](#loki)
   18. [logSet](#logSet)
   19. [errorStream](#errorStream)
   20. [recordingOut](#recordingOut)
7. [Constructor Details](#constructor-detail)
   1. [DebugLog()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [setDefaultLogSeverity()](#setDefaultLogSeverity())
   3. [getDefaultLogSeverity()](#getDefaultLogSeverity())
   4. [printLogLevels()](#printLogLevels())
   5. [isEnabled(DebugType)](#isEnabled(zombie.debug.DebugType))
   6. [isLogEnabled(DebugType, LogSeverity)](#isLogEnabled(zombie.debug.DebugType,zombie.debug.LogSeverity))
   7. [formatLogStringForConsole(DebugType, LogSeverity, String, Object)](#formatLogStringForConsole(zombie.debug.DebugType,zombie.debug.LogSeverity,java.lang.String,java.lang.Object))
   8. [formatLogStringForLogFile(DebugType, LogSeverity, String, Object)](#formatLogStringForLogFile(zombie.debug.DebugType,zombie.debug.LogSeverity,java.lang.String,java.lang.Object))
   9. [formatLogStringAnimationRecordingFile(DebugType, LogSeverity, String, Object)](#formatLogStringAnimationRecordingFile(zombie.debug.DebugType,zombie.debug.LogSeverity,java.lang.String,java.lang.Object))
   10. [generateCurrentTimeMillisStr()](#generateCurrentTimeMillisStr())
   11. [generateCurrentServerTimeMillisStr()](#generateCurrentServerTimeMillisStr())
   12. [echoToLogFiles(DebugType, LogSeverity, String, String)](#echoToLogFiles(zombie.debug.DebugType,zombie.debug.LogSeverity,java.lang.String,java.lang.String))
   13. [echoExceptionLineToLogFiles(DebugType, LogSeverity, String, String)](#echoExceptionLineToLogFiles(zombie.debug.DebugType,zombie.debug.LogSeverity,java.lang.String,java.lang.String))
   14. [echoToLoki(LogSeverity, String)](#echoToLoki(zombie.debug.LogSeverity,java.lang.String))
   15. [echoExceptionLineToLoki(LogSeverity, String, String)](#echoExceptionLineToLoki(zombie.debug.LogSeverity,java.lang.String,java.lang.String))
   16. [echoToLogFile(String)](#echoToLogFile(java.lang.String))
   17. [echoToRecording(DebugType, LogSeverity, String, String)](#echoToRecording(zombie.debug.DebugType,zombie.debug.LogSeverity,java.lang.String,java.lang.String))
   18. [log(DebugType, String)](#log(zombie.debug.DebugType,java.lang.String))
   19. [setLogEnabled(DebugType, boolean)](#setLogEnabled(zombie.debug.DebugType,boolean))
   20. [log(String)](#log(java.lang.String))
   21. [getDebugTypes()](#getDebugTypes())
   22. [getSelectedProfileName()](#getSelectedProfileName())
   23. [getProfileNames()](#getProfileNames())
   24. [getProfileAliases()](#getProfileAliases())
   25. [getLogSeverityForSelectedProfile(DebugType)](#getLogSeverityForSelectedProfile(zombie.debug.DebugType))
   26. [invokeProfile(String)](#invokeProfile(java.lang.String))
   27. [invokeSelectedProfile()](#invokeSelectedProfile())
   28. [updateSelectedProfileAll(LogSeverity)](#updateSelectedProfileAll(zombie.debug.LogSeverity))
   29. [updateSelectedProfile(DebugType, LogSeverity)](#updateSelectedProfile(zombie.debug.DebugType,zombie.debug.LogSeverity))
   30. [writeConfigFile()](#writeConfigFile())
   31. [getConfigFilePath()](#getConfigFilePath())
   32. [isLogTraceFileLocationEnabled()](#isLogTraceFileLocationEnabled())
   33. [shouldLogIncludeTimeMs()](#shouldLogIncludeTimeMs())
   34. [shouldLogIncludeServerTime()](#shouldLogIncludeServerTime())
   35. [getRecordingOut()](#getRecordingOut())
   36. [setRecordingOut(PrintStream)](#setRecordingOut(java.io.PrintStream))
   37. [createLogStream(DebugType)](#createLogStream(zombie.debug.DebugType))
   38. [isLogServerTimeMsEnabled()](#isLogServerTimeMsEnabled())
   39. [setLogServerTimeMsEnabled(boolean)](#setLogServerTimeMsEnabled(boolean))
   40. [setStdOut(OutputStream)](#setStdOut(java.io.OutputStream))
   41. [setStdErr(OutputStream)](#setStdErr(java.io.OutputStream))
   42. [init()](#init())
   43. [loadDebugConfig(String)](#loadDebugConfig(java.lang.String))
   44. [startWatchingDebugCfgFile(File)](#startWatchingDebugCfgFile(java.io.File))
   45. [stopWatchingDebugCfgFile()](#stopWatchingDebugCfgFile())
   46. [onDebugCfgFileChanged(String)](#onDebugCfgFileChanged(java.lang.String))
   47. [isDebugCfgPath(String)](#isDebugCfgPath(java.lang.String))
   48. [readConfigCommand(String, boolean)](#readConfigCommand(java.lang.String,boolean))
   49. [nativeLog(String, String, String)](#nativeLog(java.lang.String,java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DebugLog
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.debug.DebugLog

---

public final class DebugLog
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `DebugLog.OutputStreamWrapper`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.debug.DebugLogCfgFile`

  `dbgCfgFile`

  `private zombie.PredicatedFileWatcher`

  `debugCfgFileWatcher`

  `private String`

  `debugCfgFileWatcherPath`

  `private pl.mjaron.tinyloki.ILogStream`

  `errorStream`

  `private final PrintStream`

  `GeneralErr`

  `private boolean`

  `initialized`

  `private static DebugLog`

  `instance`

  `private static final Object`

  `instanceLock`

  `private ZLogger`

  `logFileLogger`

  `private boolean`

  `logServerTimeMsEnabled`

  `private pl.mjaron.tinyloki.StreamSet`

  `logSet`

  `private boolean`

  `logTimeMsEnabled`

  `private boolean`

  `logTraceFileLocationEnabled`

  Set this to TRUE if you wish to include the source file's name and line number prepending a debugln, noise, trace, warn, or error.

  `private pl.mjaron.tinyloki.TinyLoki`

  `loki`

  `private boolean`

  `lokiInit`

  `private final PrintStream`

  `originalErr`

  `private final PrintStream`

  `originalOut`

  `private PrintStream`

  `recordingOut`

  `private final DebugLog.OutputStreamWrapper`

  `stdErr`

  `private final DebugLog.OutputStreamWrapper`

  `stdOut`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `DebugLog()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `zombie.debug.DebugLogStream`

  `createLogStream(DebugType debugType)`

  `void`

  `echoExceptionLineToLogFiles(DebugType debugType,
  LogSeverity logSeverity,
  String messageType,
  String outString)`

  `private void`

  `echoExceptionLineToLoki(LogSeverity logSeverity,
  String messageType,
  String message)`

  `private void`

  `echoToLogFile(String formattedLine)`

  `void`

  `echoToLogFiles(DebugType debugType,
  LogSeverity logSeverity,
  String callerAffix,
  String rawOutString)`

  `private void`

  `echoToLoki(LogSeverity logSeverity,
  String formattedString)`

  `private void`

  `echoToRecording(DebugType debugType,
  LogSeverity logSeverity,
  String callerAffix,
  String outString)`

  `String`

  `formatLogStringAnimationRecordingFile(DebugType debugType,
  LogSeverity logSeverity,
  String callerAffix,
  Object outputStr)`

  `String`

  `formatLogStringForConsole(DebugType debugType,
  LogSeverity logSeverity,
  String callerAffix,
  Object outputStr)`

  `String`

  `formatLogStringForLogFile(DebugType debugType,
  LogSeverity logSeverity,
  String callerAffix,
  Object outputStr)`

  `private static String`

  `generateCurrentServerTimeMillisStr()`

  `private static String`

  `generateCurrentTimeMillisStr()`

  `private static String`

  `getConfigFilePath()`

  `static ArrayList<DebugType>`

  `getDebugTypes()`

  Returns a list of all DebugType's, in alphabetical order.

  `private static LogSeverity`

  `getDefaultLogSeverity()`

  `static DebugLog`

  `getInstance()`

  `static LogSeverity`

  `getLogSeverityForSelectedProfile(DebugType debugType)`

  `static List<String>`

  `getProfileAliases()`

  `static List<String>`

  `getProfileNames()`

  `PrintStream`

  `getRecordingOut()`

  `static String`

  `getSelectedProfileName()`

  `void`

  `init()`

  `static void`

  `invokeProfile(String profileOrAlias)`

  `static void`

  `invokeSelectedProfile()`

  `private boolean`

  `isDebugCfgPath(String path)`

  `static boolean`

  `isEnabled(DebugType type)`

  `static boolean`

  `isLogEnabled(DebugType type,
  LogSeverity logSeverity)`

  `boolean`

  `isLogServerTimeMsEnabled()`

  `boolean`

  `isLogTraceFileLocationEnabled()`

  `void`

  `loadDebugConfig(String filepath)`

  Loads a debug config from a path defined by program argument:   
  -debugcfg=c:\path\to\file   
    
  or from cachedir\debuglog.cfg if it exists   
  has a few additional options over debuglog.ini   
    
  A 'debug.cfg' file example should be included in the branch root folder.

  `static void`

  `log(String str)`

  `static void`

  `log(DebugType type,
  String str)`

  `static void`

  `nativeLog(String logType,
  String logSeverity,
  String logTxt)`

  `private void`

  `onDebugCfgFileChanged(String path)`

  `static void`

  `printLogLevels()`

  `void`

  `readConfigCommand(String s,
  boolean enable)`

  `static void`

  `setDefaultLogSeverity()`

  `static void`

  `setLogEnabled(DebugType type,
  boolean bEnabled)`

  `void`

  `setLogServerTimeMsEnabled(boolean logServerTimeMsEnabled)`

  `void`

  `setRecordingOut(PrintStream recordingOut)`

  `void`

  `setStdErr(OutputStream out)`

  `void`

  `setStdOut(OutputStream out)`

  `boolean`

  `shouldLogIncludeServerTime()`

  `boolean`

  `shouldLogIncludeTimeMs()`

  `private void`

  `startWatchingDebugCfgFile(File file)`

  `private void`

  `stopWatchingDebugCfgFile()`

  `static void`

  `updateSelectedProfile(DebugType debugType,
  LogSeverity logSeverity)`

  `static void`

  `updateSelectedProfileAll(LogSeverity logSeverity)`

  `static void`

  `writeConfigFile()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static volatile [DebugLog](DebugLog.html "class in zombie.debug") instance
  + ### instanceLock

    private static final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") instanceLock
  + ### initialized

    private boolean initialized
  + ### logTraceFileLocationEnabled

    private boolean logTraceFileLocationEnabled

    Set this to TRUE if you wish to include the source file's name and line number prepending a debugln, noise, trace, warn, or error.
    This is super handy for debugging. As you can simply click on the line in the output to go straight to the file and line where the log came from.
  + ### logTimeMsEnabled

    private boolean logTimeMsEnabled
  + ### logServerTimeMsEnabled

    private boolean logServerTimeMsEnabled
  + ### stdOut

    private final [DebugLog.OutputStreamWrapper](DebugLog.OutputStreamWrapper.html "class in zombie.debug") stdOut
  + ### stdErr

    private final [DebugLog.OutputStreamWrapper](DebugLog.OutputStreamWrapper.html "class in zombie.debug") stdErr
  + ### originalOut

    private final [PrintStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/PrintStream.html "class or interface in java.io") originalOut
  + ### originalErr

    private final [PrintStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/PrintStream.html "class or interface in java.io") originalErr
  + ### GeneralErr

    private final [PrintStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/PrintStream.html "class or interface in java.io") GeneralErr
  + ### logFileLogger

    private [ZLogger](../core/logger/ZLogger.html "class in zombie.core.logger") logFileLogger
  + ### dbgCfgFile

    private final zombie.debug.DebugLogCfgFile dbgCfgFile
  + ### debugCfgFileWatcher

    private zombie.PredicatedFileWatcher debugCfgFileWatcher
  + ### debugCfgFileWatcherPath

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") debugCfgFileWatcherPath
  + ### lokiInit

    private boolean lokiInit
  + ### loki

    private pl.mjaron.tinyloki.TinyLoki loki
  + ### logSet

    private pl.mjaron.tinyloki.StreamSet logSet
  + ### errorStream

    private pl.mjaron.tinyloki.ILogStream errorStream
  + ### recordingOut

    private [PrintStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/PrintStream.html "class or interface in java.io") recordingOut
* Constructor Details
  -------------------

  + ### DebugLog

    private DebugLog()
* Method Details
  --------------

  + ### getInstance

    public static [DebugLog](DebugLog.html "class in zombie.debug") getInstance()
  + ### setDefaultLogSeverity

    public static void setDefaultLogSeverity()
  + ### getDefaultLogSeverity

    private static [LogSeverity](LogSeverity.html "enum class in zombie.debug") getDefaultLogSeverity()
  + ### printLogLevels

    public static void printLogLevels()
  + ### isEnabled

    public static boolean isEnabled([DebugType](DebugType.html "enum class in zombie.debug") type)
  + ### isLogEnabled

    public static boolean isLogEnabled([DebugType](DebugType.html "enum class in zombie.debug") type,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity)
  + ### formatLogStringForConsole

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formatLogStringForConsole([DebugType](DebugType.html "enum class in zombie.debug") debugType,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") callerAffix,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") outputStr)
  + ### formatLogStringForLogFile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formatLogStringForLogFile([DebugType](DebugType.html "enum class in zombie.debug") debugType,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") callerAffix,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") outputStr)
  + ### formatLogStringAnimationRecordingFile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formatLogStringAnimationRecordingFile([DebugType](DebugType.html "enum class in zombie.debug") debugType,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") callerAffix,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") outputStr)
  + ### generateCurrentTimeMillisStr

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") generateCurrentTimeMillisStr()
  + ### generateCurrentServerTimeMillisStr

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") generateCurrentServerTimeMillisStr()
  + ### echoToLogFiles

    public void echoToLogFiles([DebugType](DebugType.html "enum class in zombie.debug") debugType,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") callerAffix,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rawOutString)
  + ### echoExceptionLineToLogFiles

    public void echoExceptionLineToLogFiles([DebugType](DebugType.html "enum class in zombie.debug") debugType,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") messageType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outString)
  + ### echoToLoki

    private void echoToLoki([LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formattedString)
  + ### echoExceptionLineToLoki

    private void echoExceptionLineToLoki([LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") messageType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### echoToLogFile

    private void echoToLogFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formattedLine)
  + ### echoToRecording

    private void echoToRecording([DebugType](DebugType.html "enum class in zombie.debug") debugType,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") callerAffix,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outString)
  + ### log

    public static void log([DebugType](DebugType.html "enum class in zombie.debug") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### setLogEnabled

    public static void setLogEnabled([DebugType](DebugType.html "enum class in zombie.debug") type,
    boolean bEnabled)
  + ### log

    public static void log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### getDebugTypes

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[DebugType](DebugType.html "enum class in zombie.debug")> getDebugTypes()

    Returns a list of all DebugType's, in alphabetical order.
  + ### getSelectedProfileName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSelectedProfileName()
  + ### getProfileNames

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getProfileNames()
  + ### getProfileAliases

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getProfileAliases()
  + ### getLogSeverityForSelectedProfile

    public static [LogSeverity](LogSeverity.html "enum class in zombie.debug") getLogSeverityForSelectedProfile([DebugType](DebugType.html "enum class in zombie.debug") debugType)
  + ### invokeProfile

    public static void invokeProfile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") profileOrAlias)
  + ### invokeSelectedProfile

    public static void invokeSelectedProfile()
  + ### updateSelectedProfileAll

    public static void updateSelectedProfileAll([LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity)
  + ### updateSelectedProfile

    public static void updateSelectedProfile([DebugType](DebugType.html "enum class in zombie.debug") debugType,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity)
  + ### writeConfigFile

    public static void writeConfigFile()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getConfigFilePath

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getConfigFilePath()
  + ### isLogTraceFileLocationEnabled

    public boolean isLogTraceFileLocationEnabled()
  + ### shouldLogIncludeTimeMs

    public boolean shouldLogIncludeTimeMs()
  + ### shouldLogIncludeServerTime

    public boolean shouldLogIncludeServerTime()
  + ### getRecordingOut

    public [PrintStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/PrintStream.html "class or interface in java.io") getRecordingOut()
  + ### setRecordingOut

    public void setRecordingOut([PrintStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/PrintStream.html "class or interface in java.io") recordingOut)
  + ### createLogStream

    public zombie.debug.DebugLogStream createLogStream([DebugType](DebugType.html "enum class in zombie.debug") debugType)
  + ### isLogServerTimeMsEnabled

    public boolean isLogServerTimeMsEnabled()
  + ### setLogServerTimeMsEnabled

    public void setLogServerTimeMsEnabled(boolean logServerTimeMsEnabled)
  + ### setStdOut

    public void setStdOut([OutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/OutputStream.html "class or interface in java.io") out)
  + ### setStdErr

    public void setStdErr([OutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/OutputStream.html "class or interface in java.io") out)
  + ### init

    public void init()
  + ### loadDebugConfig

    public void loadDebugConfig([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filepath)

    Loads a debug config from a path defined by program argument:   
    -debugcfg=c:\path\to\file   
      
    or from cachedir\debuglog.cfg if it exists   
    has a few additional options over debuglog.ini   
      
    A 'debug.cfg' file example should be included in the branch root folder.   
      
    Example cfg here:   
     # DebuggingGrapples   
     # Used while debug ging grappling tech   
     DebuggingGrapples   
     {   
      # disable all others (except General)   
      -All   
         
      # enable only ones we're interested in   
      +Animation Debug   
      +Grapple Debug   
     }   
       
     # Select active config   
     =DebuggingGrapples
  + ### startWatchingDebugCfgFile

    private void startWatchingDebugCfgFile([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") file)
  + ### stopWatchingDebugCfgFile

    private void stopWatchingDebugCfgFile()
  + ### onDebugCfgFileChanged

    private void onDebugCfgFileChanged([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### isDebugCfgPath

    private boolean isDebugCfgPath([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### readConfigCommand

    public void readConfigCommand([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    boolean enable)
  + ### nativeLog

    public static void nativeLog([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logTxt)