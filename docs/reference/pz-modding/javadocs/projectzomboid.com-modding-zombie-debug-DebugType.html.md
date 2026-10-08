[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.debug](package-summary.html)
2. [DebugType](DebugType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [General](#General)
   2. [Packet](#Packet)
   3. [NetworkFileDebug](#NetworkFileDebug)
   4. [Network](#Network)
   5. [ZNet](#ZNet)
   6. [DetailedInfo](#DetailedInfo)
   7. [Lua](#Lua)
   8. [LuaObject](#LuaObject)
   9. [GameOption](#GameOption)
   10. [Mod](#Mod)
   11. [Sound](#Sound)
   12. [Zombie](#Zombie)
   13. [Combat](#Combat)
   14. [Objects](#Objects)
   15. [Fireplace](#Fireplace)
   16. [Radio](#Radio)
   17. [MapLoading](#MapLoading)
   18. [Clothing](#Clothing)
   19. [Animation](#Animation)
   20. [AnimationDetailed](#AnimationDetailed)
   21. [AnimationLayers](#AnimationLayers)
   22. [Asset](#Asset)
   23. [Script](#Script)
   24. [Shader](#Shader)
   25. [Sprite](#Sprite)
   26. [Input](#Input)
   27. [Recipe](#Recipe)
   28. [ActionSystem](#ActionSystem)
   29. [ActionSystemEvents](#ActionSystemEvents)
   30. [IsoRegion](#IsoRegion)
   31. [FileIO](#FileIO)
   32. [Multiplayer](#Multiplayer)
   33. [Damage](#Damage)
   34. [Death](#Death)
   35. [Discord](#Discord)
   36. [Statistic](#Statistic)
   37. [Vehicle](#Vehicle)
   38. [VehicleHit](#VehicleHit)
   39. [Voice](#Voice)
   40. [Checksum](#Checksum)
   41. [Animal](#Animal)
   42. [ItemPicker](#ItemPicker)
   43. [CraftLogic](#CraftLogic)
   44. [Action](#Action)
   45. [Entity](#Entity)
   46. [Lightning](#Lightning)
   47. [Grapple](#Grapple)
   48. [ExitDebug](#ExitDebug)
   49. [BodyDamage](#BodyDamage)
   50. [Xml](#Xml)
   51. [Physics](#Physics)
   52. [Ballistics](#Ballistics)
   53. [Ragdoll](#Ragdoll)
   54. [PZBullet](#PZBullet)
   55. [ModelManager](#ModelManager)
   56. [LoadAnimation](#LoadAnimation)
   57. [Zone](#Zone)
   58. [WorldGen](#WorldGen)
   59. [Foraging](#Foraging)
   60. [Saving](#Saving)
   61. [Fluid](#Fluid)
   62. [Energy](#Energy)
   63. [Translation](#Translation)
   64. [Moveable](#Moveable)
   65. [Basement](#Basement)
   66. [FallDamage](#FallDamage)
   67. [ImGui](#ImGui)
   68. [CharacterTrait](#CharacterTrait)
   69. [ISUI](#ISUI)
   70. [ISUIStackTrace](#ISUIStackTrace)
   71. [FaceLocationFix](#FaceLocationFix)
   72. [Context](#Context)
   73. [AnimationRecorder](#AnimationRecorder)
8. [Field Details](#field-detail)
   1. [Default](#Default)
   2. [logSeverity](#logSeverity)
   3. [orWith](#orWith)
   4. [logStream](#logStream)
   5. [logStreamLock](#logStreamLock)
   6. [formatter](#formatter)
9. [Constructor Details](#constructor-detail)
   1. [DebugType(DebugType...)](#%3Cinit%3E(zombie.debug.DebugType...))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [isName(String)](#isName(java.lang.String))
    4. [isEnabled()](#isEnabled())
    5. [isEnabled(LogSeverity)](#isEnabled(zombie.debug.LogSeverity))
    6. [getLogStream()](#getLogStream())
    7. [formatLogStringForConsole(DebugType, LogSeverity, String, Object)](#formatLogStringForConsole(zombie.debug.DebugType,zombie.debug.LogSeverity,java.lang.String,java.lang.Object))
    8. [setLogSeverity(LogSeverity)](#setLogSeverity(zombie.debug.LogSeverity))
    9. [getLogSeverity()](#getLogSeverity())
    10. [getFormatter()](#getFormatter())
    11. [print(boolean)](#print(boolean))
    12. [print(char)](#print(char))
    13. [print(int)](#print(int))
    14. [print(long)](#print(long))
    15. [print(float)](#print(float))
    16. [print(double)](#print(double))
    17. [print(String)](#print(java.lang.String))
    18. [print(Object)](#print(java.lang.Object))
    19. [printf(String, Object...)](#printf(java.lang.String,java.lang.Object...))
    20. [println()](#println())
    21. [println(boolean)](#println(boolean))
    22. [println(char)](#println(char))
    23. [println(int)](#println(int))
    24. [println(long)](#println(long))
    25. [println(float)](#println(float))
    26. [println(double)](#println(double))
    27. [println(char[])](#println(char%5B%5D))
    28. [println(String)](#println(java.lang.String))
    29. [println(Object)](#println(java.lang.Object))
    30. [println(String, Object...)](#println(java.lang.String,java.lang.Object...))
    31. [trace(Object)](#trace(java.lang.Object))
    32. [trace(String, Object...)](#trace(java.lang.String,java.lang.Object...))
    33. [debugln(Object)](#debugln(java.lang.Object))
    34. [debugln(String, Object...)](#debugln(java.lang.String,java.lang.Object...))
    35. [debugOnceln(Object)](#debugOnceln(java.lang.Object))
    36. [debugOnceln(String, Object...)](#debugOnceln(java.lang.String,java.lang.Object...))
    37. [noise(Object)](#noise(java.lang.Object))
    38. [noise(String, Object...)](#noise(java.lang.String,java.lang.Object...))
    39. [warn(Object)](#warn(java.lang.Object))
    40. [warn(String, Object...)](#warn(java.lang.String,java.lang.Object...))
    41. [warnOnce(Object)](#warnOnce(java.lang.Object))
    42. [warnOnce(String, Object...)](#warnOnce(java.lang.String,java.lang.Object...))
    43. [error(Object)](#error(java.lang.Object))
    44. [error(String, Object...)](#error(java.lang.String,java.lang.Object...))
    45. [write(LogSeverity, String)](#write(zombie.debug.LogSeverity,java.lang.String))
    46. [routedWrite(int, LogSeverity, String)](#routedWrite(int,zombie.debug.LogSeverity,java.lang.String))
    47. [printException(Throwable, LogSeverity)](#printException(java.lang.Throwable,zombie.debug.LogSeverity))
    48. [printException(Throwable, String, LogSeverity)](#printException(java.lang.Throwable,java.lang.String,zombie.debug.LogSeverity))
    49. [printException(Throwable, LogSeverity, String, Object...)](#printException(java.lang.Throwable,zombie.debug.LogSeverity,java.lang.String,java.lang.Object...))
    50. [printStackTrace()](#printStackTrace())
    51. [printStackTrace(String)](#printStackTrace(java.lang.String))
    52. [printStackTrace(LogSeverity, int, String, Object...)](#printStackTrace(zombie.debug.LogSeverity,int,java.lang.String,java.lang.Object...))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Enum Class DebugType
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[DebugType](DebugType.html "enum class in zombie.debug")>

zombie.debug.DebugType

All Implemented Interfaces:
:   `Serializable, Comparable<DebugType>, Constable`

---

public enum DebugType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[DebugType](DebugType.html "enum class in zombie.debug")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `Action`

  `ActionSystem`

  `ActionSystemEvents`

  `Animal`

  `Animation`

  `AnimationDetailed`

  `AnimationLayers`

  `AnimationRecorder`

  `Asset`

  `Ballistics`

  `Basement`

  `BodyDamage`

  `CharacterTrait`

  `Checksum`

  `Clothing`

  `Combat`

  `Context`

  `CraftLogic`

  `Damage`

  `Death`

  `DetailedInfo`

  `Discord`

  `Energy`

  `Entity`

  `ExitDebug`

  `FaceLocationFix`

  `FallDamage`

  `FileIO`

  `Fireplace`

  `Fluid`

  `Foraging`

  `GameOption`

  `General`

  `Grapple`

  `ImGui`

  `Input`

  `IsoRegion`

  `ISUI`

  `ISUIStackTrace`

  `ItemPicker`

  `Lightning`

  `LoadAnimation`

  `Lua`

  `LuaObject`

  `MapLoading`

  `Mod`

  `ModelManager`

  `Moveable`

  `Multiplayer`

  `Network`

  `NetworkFileDebug`

  `Objects`

  `Packet`

  `Physics`

  `PZBullet`

  `Radio`

  `Ragdoll`

  `Recipe`

  `Saving`

  `Script`

  `Shader`

  `Sound`

  `Sprite`

  `Statistic`

  `Translation`

  `Vehicle`

  `VehicleHit`

  `Voice`

  `WorldGen`

  `Xml`

  `ZNet`

  `Zombie`

  `Zone`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final DebugType`

  `Default`

  `private final zombie.debug.IDebugLogFormatter`

  `formatter`

  `private LogSeverity`

  `logSeverity`

  `private zombie.debug.DebugLogStream`

  `logStream`

  `private final Object`

  `logStreamLock`

  `private DebugType`

  `orWith`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `DebugType(DebugType... alsoActivate)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `debugln(Object formatNoParams)`

  `void`

  `debugln(String format,
  Object... params)`

  `void`

  `debugOnceln(Object formatNoParams)`

  `void`

  `debugOnceln(String format,
  Object... params)`

  `void`

  `error(Object formatNoParams)`

  `void`

  `error(String format,
  Object... params)`

  `private String`

  `formatLogStringForConsole(DebugType debugType,
  LogSeverity logSeverity,
  String affix,
  Object outputString)`

  `zombie.debug.IDebugLogFormatter`

  `getFormatter()`

  `LogSeverity`

  `getLogSeverity()`

  `zombie.debug.DebugLogStream`

  `getLogStream()`

  `boolean`

  `isEnabled()`

  `boolean`

  `isEnabled(LogSeverity logSeverity)`

  `boolean`

  `isName(String rhs)`

  `void`

  `noise(Object formatNoParams)`

  `void`

  `noise(String format,
  Object... params)`

  `void`

  `print(boolean b)`

  `void`

  `print(char c)`

  `void`

  `print(double d)`

  `void`

  `print(float f)`

  `void`

  `print(int i)`

  `void`

  `print(long l)`

  `void`

  `print(Object obj)`

  `void`

  `print(String s)`

  `void`

  `printException(Throwable ex,
  String message,
  LogSeverity logSeverity)`

  `void`

  `printException(Throwable ex,
  LogSeverity logSeverity)`

  `void`

  `printException(Throwable ex,
  LogSeverity logSeverity,
  String messageFormat,
  Object... params)`

  `PrintStream`

  `printf(String format,
  Object... args)`

  `void`

  `println()`

  `void`

  `println(boolean x)`

  `void`

  `println(char x)`

  `void`

  `println(char[] x)`

  `void`

  `println(double x)`

  `void`

  `println(float x)`

  `void`

  `println(int x)`

  `void`

  `println(long x)`

  `void`

  `println(Object x)`

  `void`

  `println(String x)`

  `void`

  `println(String format,
  Object... params)`

  `void`

  `printStackTrace()`

  `void`

  `printStackTrace(String message)`

  `void`

  `printStackTrace(LogSeverity severity,
  int depth,
  String messageFormat,
  Object... params)`

  `void`

  `routedWrite(int backTraceOffset,
  LogSeverity logSeverity,
  String logText)`

  `void`

  `setLogSeverity(LogSeverity newSeverity)`

  `void`

  `trace(Object formatNoParams)`

  `void`

  `trace(String format,
  Object... params)`

  `static DebugType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static DebugType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  `void`

  `warn(Object formatNoParams)`

  `void`

  `warn(String format,
  Object... params)`

  `void`

  `warnOnce(Object formatNoParams)`

  `void`

  `warnOnce(String format,
  Object... params)`

  `void`

  `write(LogSeverity logSeverity,
  String logText)`

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, toString, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### General

    public static final [DebugType](DebugType.html "enum class in zombie.debug") General
  + ### Packet

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Packet
  + ### NetworkFileDebug

    public static final [DebugType](DebugType.html "enum class in zombie.debug") NetworkFileDebug
  + ### Network

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Network
  + ### ZNet

    public static final [DebugType](DebugType.html "enum class in zombie.debug") ZNet
  + ### DetailedInfo

    public static final [DebugType](DebugType.html "enum class in zombie.debug") DetailedInfo
  + ### Lua

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Lua
  + ### LuaObject

    public static final [DebugType](DebugType.html "enum class in zombie.debug") LuaObject
  + ### GameOption

    public static final [DebugType](DebugType.html "enum class in zombie.debug") GameOption
  + ### Mod

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Mod
  + ### Sound

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Sound
  + ### Zombie

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Zombie
  + ### Combat

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Combat
  + ### Objects

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Objects
  + ### Fireplace

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Fireplace
  + ### Radio

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Radio
  + ### MapLoading

    public static final [DebugType](DebugType.html "enum class in zombie.debug") MapLoading
  + ### Clothing

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Clothing
  + ### Animation

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Animation
  + ### AnimationDetailed

    public static final [DebugType](DebugType.html "enum class in zombie.debug") AnimationDetailed
  + ### AnimationLayers

    public static final [DebugType](DebugType.html "enum class in zombie.debug") AnimationLayers
  + ### Asset

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Asset
  + ### Script

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Script
  + ### Shader

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Shader
  + ### Sprite

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Sprite
  + ### Input

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Input
  + ### Recipe

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Recipe
  + ### ActionSystem

    public static final [DebugType](DebugType.html "enum class in zombie.debug") ActionSystem
  + ### ActionSystemEvents

    public static final [DebugType](DebugType.html "enum class in zombie.debug") ActionSystemEvents
  + ### IsoRegion

    public static final [DebugType](DebugType.html "enum class in zombie.debug") IsoRegion
  + ### FileIO

    public static final [DebugType](DebugType.html "enum class in zombie.debug") FileIO
  + ### Multiplayer

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Multiplayer
  + ### Damage

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Damage
  + ### Death

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Death
  + ### Discord

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Discord
  + ### Statistic

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Statistic
  + ### Vehicle

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Vehicle
  + ### VehicleHit

    public static final [DebugType](DebugType.html "enum class in zombie.debug") VehicleHit
  + ### Voice

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Voice
  + ### Checksum

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Checksum
  + ### Animal

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Animal
  + ### ItemPicker

    public static final [DebugType](DebugType.html "enum class in zombie.debug") ItemPicker
  + ### CraftLogic

    public static final [DebugType](DebugType.html "enum class in zombie.debug") CraftLogic
  + ### Action

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Action
  + ### Entity

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Entity
  + ### Lightning

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Lightning
  + ### Grapple

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Grapple
  + ### ExitDebug

    public static final [DebugType](DebugType.html "enum class in zombie.debug") ExitDebug
  + ### BodyDamage

    public static final [DebugType](DebugType.html "enum class in zombie.debug") BodyDamage
  + ### Xml

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Xml
  + ### Physics

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Physics
  + ### Ballistics

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Ballistics
  + ### Ragdoll

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Ragdoll
  + ### PZBullet

    public static final [DebugType](DebugType.html "enum class in zombie.debug") PZBullet
  + ### ModelManager

    public static final [DebugType](DebugType.html "enum class in zombie.debug") ModelManager
  + ### LoadAnimation

    public static final [DebugType](DebugType.html "enum class in zombie.debug") LoadAnimation
  + ### Zone

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Zone
  + ### WorldGen

    public static final [DebugType](DebugType.html "enum class in zombie.debug") WorldGen
  + ### Foraging

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Foraging
  + ### Saving

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Saving
  + ### Fluid

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Fluid
  + ### Energy

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Energy
  + ### Translation

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Translation
  + ### Moveable

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Moveable
  + ### Basement

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Basement
  + ### FallDamage

    public static final [DebugType](DebugType.html "enum class in zombie.debug") FallDamage
  + ### ImGui

    public static final [DebugType](DebugType.html "enum class in zombie.debug") ImGui
  + ### CharacterTrait

    public static final [DebugType](DebugType.html "enum class in zombie.debug") CharacterTrait
  + ### ISUI

    public static final [DebugType](DebugType.html "enum class in zombie.debug") ISUI
  + ### ISUIStackTrace

    public static final [DebugType](DebugType.html "enum class in zombie.debug") ISUIStackTrace
  + ### FaceLocationFix

    public static final [DebugType](DebugType.html "enum class in zombie.debug") FaceLocationFix
  + ### Context

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Context
  + ### AnimationRecorder

    public static final [DebugType](DebugType.html "enum class in zombie.debug") AnimationRecorder
* Field Details
  -------------

  + ### Default

    public static final [DebugType](DebugType.html "enum class in zombie.debug") Default
  + ### logSeverity

    private [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity
  + ### orWith

    private [DebugType](DebugType.html "enum class in zombie.debug") orWith
  + ### logStream

    private volatile zombie.debug.DebugLogStream logStream
  + ### logStreamLock

    private final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") logStreamLock
  + ### formatter

    private final zombie.debug.IDebugLogFormatter formatter
* Constructor Details
  -------------------

  + ### DebugType

    private DebugType([DebugType](DebugType.html "enum class in zombie.debug")... alsoActivate)
* Method Details
  --------------

  + ### values

    public static [DebugType](DebugType.html "enum class in zombie.debug")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [DebugType](DebugType.html "enum class in zombie.debug") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `name` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null
  + ### isName

    public boolean isName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rhs)
  + ### isEnabled

    public boolean isEnabled()
  + ### isEnabled

    public boolean isEnabled([LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity)
  + ### getLogStream

    public zombie.debug.DebugLogStream getLogStream()
  + ### formatLogStringForConsole

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formatLogStringForConsole([DebugType](DebugType.html "enum class in zombie.debug") debugType,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") affix,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") outputString)
  + ### setLogSeverity

    public void setLogSeverity([LogSeverity](LogSeverity.html "enum class in zombie.debug") newSeverity)
  + ### getLogSeverity

    public [LogSeverity](LogSeverity.html "enum class in zombie.debug") getLogSeverity()
  + ### getFormatter

    public zombie.debug.IDebugLogFormatter getFormatter()
  + ### print

    public void print(boolean b)
  + ### print

    public void print(char c)
  + ### print

    public void print(int i)
  + ### print

    public void print(long l)
  + ### print

    public void print(float f)
  + ### print

    public void print(double d)
  + ### print

    public void print([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### print

    public void print([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj)
  + ### printf

    public [PrintStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/PrintStream.html "class or interface in java.io") printf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... args)
  + ### println

    public void println()
  + ### println

    public void println(boolean x)
  + ### println

    public void println(char x)
  + ### println

    public void println(int x)
  + ### println

    public void println(long x)
  + ### println

    public void println(float x)
  + ### println

    public void println(double x)
  + ### println

    public void println(char[] x)
  + ### println

    public void println([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") x)
  + ### println

    public void println([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") x)
  + ### println

    public void println([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)
  + ### trace

    public void trace([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") formatNoParams)
  + ### trace

    public void trace([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)
  + ### debugln

    public void debugln([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") formatNoParams)
  + ### debugln

    public void debugln([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)
  + ### debugOnceln

    public void debugOnceln([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") formatNoParams)
  + ### debugOnceln

    public void debugOnceln([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)
  + ### noise

    public void noise([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") formatNoParams)
  + ### noise

    public void noise([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)
  + ### warn

    public void warn([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") formatNoParams)
  + ### warn

    public void warn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)
  + ### warnOnce

    public void warnOnce([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") formatNoParams)
  + ### warnOnce

    public void warnOnce([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)
  + ### error

    public void error([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") formatNoParams)
  + ### error

    public void error([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") format,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)
  + ### write

    public void write([LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logText)
  + ### routedWrite

    public void routedWrite(int backTraceOffset,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logText)
  + ### printException

    public void printException([Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") ex,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity)
  + ### printException

    public void printException([Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") ex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity)
  + ### printException

    public void printException([Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") ex,
    [LogSeverity](LogSeverity.html "enum class in zombie.debug") logSeverity,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") messageFormat,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)
  + ### printStackTrace

    public void printStackTrace()
  + ### printStackTrace

    public void printStackTrace([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### printStackTrace

    public void printStackTrace([LogSeverity](LogSeverity.html "enum class in zombie.debug") severity,
    int depth,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") messageFormat,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... params)