[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [se.krka.kahlua.vm](package-summary.html)
2. [KahluaUtil](KahluaUtil.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [WORKER\_THREAD\_KEY](#WORKER_THREAD_KEY)
   2. [TYPE\_NIL](#TYPE_NIL)
   3. [TYPE\_STRING](#TYPE_STRING)
   4. [TYPE\_NUMBER](#TYPE_NUMBER)
   5. [TYPE\_BOOLEAN](#TYPE_BOOLEAN)
   6. [TYPE\_FUNCTION](#TYPE_FUNCTION)
   7. [TYPE\_TABLE](#TYPE_TABLE)
   8. [TYPE\_COROUTINE](#TYPE_COROUTINE)
   9. [TYPE\_USERDATA](#TYPE_USERDATA)
6. [Constructor Details](#constructor-detail)
   1. [KahluaUtil()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [fromDouble(Object)](#fromDouble(java.lang.Object))
   2. [toDouble(double)](#toDouble(double))
   3. [toDouble(long)](#toDouble(long))
   4. [toBoolean(boolean)](#toBoolean(boolean))
   5. [boolEval(Object)](#boolEval(java.lang.Object))
   6. [loadByteCodeFromFile(File, KahluaTable)](#loadByteCodeFromFile(java.io.File,se.krka.kahlua.vm.KahluaTable))
   7. [loadByteCodeFromResource(String, KahluaTable)](#loadByteCodeFromResource(java.lang.String,se.krka.kahlua.vm.KahluaTable))
   8. [getLuaClosure(KahluaTable, InputStream)](#getLuaClosure(se.krka.kahlua.vm.KahluaTable,java.io.InputStream))
   9. [luaAssert(boolean, String)](#luaAssert(boolean,java.lang.String))
   10. [fail(String)](#fail(java.lang.String))
   11. [round(double)](#round(double))
   12. [ipow(long, int)](#ipow(long,int))
   13. [isNegative(double)](#isNegative(double))
   14. [getClassMetatables(Platform, KahluaTable)](#getClassMetatables(se.krka.kahlua.vm.Platform,se.krka.kahlua.vm.KahluaTable))
   15. [getWorkerThread(Platform, KahluaTable)](#getWorkerThread(se.krka.kahlua.vm.Platform,se.krka.kahlua.vm.KahluaTable))
   16. [setWorkerThread(KahluaTable, KahluaThread)](#setWorkerThread(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaThread))
   17. [getOrCreateTable(Platform, KahluaTable, String)](#getOrCreateTable(se.krka.kahlua.vm.Platform,se.krka.kahlua.vm.KahluaTable,java.lang.String))
   18. [setupLibrary(KahluaTable, KahluaThread, File)](#setupLibrary(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaThread,java.io.File))
   19. [setupLibraryText(KahluaTable, KahluaThread, File)](#setupLibraryText(se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaThread,java.io.File))
   20. [numberToString(Double)](#numberToString(java.lang.Double))
   21. [type(Object)](#type(java.lang.Object))
   22. [isUserdata(Object)](#isUserdata(java.lang.Object))
   23. [isTable(Object)](#isTable(java.lang.Object))
   24. [isFunction(Object)](#isFunction(java.lang.Object))
   25. [tostring(Object, KahluaThread)](#tostring(java.lang.Object,se.krka.kahlua.vm.KahluaThread))
   26. [tableToString(Object, KahluaThread)](#tableToString(java.lang.Object,se.krka.kahlua.vm.KahluaThread))
   27. [identityHashCode(Object)](#identityHashCode(java.lang.Object))
   28. [tonumber(String)](#tonumber(java.lang.String))
   29. [tonumber(String, int)](#tonumber(java.lang.String,int))
   30. [rawTostring(Object)](#rawTostring(java.lang.Object))
   31. [rawTostring2(Object)](#rawTostring2(java.lang.Object))
   32. [rawToStackTraceElement(Object)](#rawToStackTraceElement(java.lang.Object))
   33. [rawTonumber(Object)](#rawTonumber(java.lang.Object))
   34. [getStringArg(LuaCallFrame, int, String)](#getStringArg(se.krka.kahlua.vm.LuaCallFrame,int,java.lang.String))
   35. [getOptionalStringArg(LuaCallFrame, int)](#getOptionalStringArg(se.krka.kahlua.vm.LuaCallFrame,int))
   36. [getNumberArg(LuaCallFrame, int, String)](#getNumberArg(se.krka.kahlua.vm.LuaCallFrame,int,java.lang.String))
   37. [getOptionalNumberArg(LuaCallFrame, int)](#getOptionalNumberArg(se.krka.kahlua.vm.LuaCallFrame,int))
   38. [fail(int, String, String, String)](#fail(int,java.lang.String,java.lang.String,java.lang.String))
   39. [assertArgNotNull(Object, int, String, String)](#assertArgNotNull(java.lang.Object,int,java.lang.String,java.lang.String))
   40. [getOptionalArg(LuaCallFrame, int)](#getOptionalArg(se.krka.kahlua.vm.LuaCallFrame,int))
   41. [getArg(LuaCallFrame, int, String)](#getArg(se.krka.kahlua.vm.LuaCallFrame,int,java.lang.String))
   42. [len(KahluaTable, int, int)](#len(se.krka.kahlua.vm.KahluaTable,int,int))
   43. [getDoubleArg(LuaCallFrame, int, String)](#getDoubleArg(se.krka.kahlua.vm.LuaCallFrame,int,java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class KahluaUtil
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

se.krka.kahlua.vm.KahluaUtil

---

public class KahluaUtil
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final String`

  `TYPE_BOOLEAN`

  `private static final String`

  `TYPE_COROUTINE`

  `private static final String`

  `TYPE_FUNCTION`

  `private static final String`

  `TYPE_NIL`

  `private static final String`

  `TYPE_NUMBER`

  `private static final String`

  `TYPE_STRING`

  `private static final String`

  `TYPE_TABLE`

  `private static final String`

  `TYPE_USERDATA`

  `private static final Object`

  `WORKER_THREAD_KEY`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `KahluaUtil()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `assertArgNotNull(Object o,
  int n,
  String type,
  String function)`

  `static boolean`

  `boolEval(Object o)`

  `private static void`

  `fail(int n,
  String function,
  String wantedType,
  String gotten)`

  `static void`

  `fail(String msg)`

  `static double`

  `fromDouble(Object o)`

  `static Object`

  `getArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int n,
  String function)`

  `static se.krka.kahlua.vm.KahluaTable`

  `getClassMetatables(se.krka.kahlua.vm.Platform platform,
  se.krka.kahlua.vm.KahluaTable env)`

  `static double`

  `getDoubleArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int i,
  String name)`

  `private static @Nullable se.krka.kahlua.vm.LuaClosure`

  `getLuaClosure(se.krka.kahlua.vm.KahluaTable environment,
  InputStream stream)`

  `static Double`

  `getNumberArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int n,
  String function)`

  `static Object`

  `getOptionalArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int n)`

  `static Double`

  `getOptionalNumberArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int n)`

  `static String`

  `getOptionalStringArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int n)`

  `static se.krka.kahlua.vm.KahluaTable`

  `getOrCreateTable(se.krka.kahlua.vm.Platform platform,
  se.krka.kahlua.vm.KahluaTable env,
  String name)`

  `static String`

  `getStringArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int n,
  String function)`

  `static se.krka.kahlua.vm.KahluaThread`

  `getWorkerThread(se.krka.kahlua.vm.Platform platform,
  se.krka.kahlua.vm.KahluaTable env)`

  `static String`

  `identityHashCode(Object o)`

  `static long`

  `ipow(long base,
  int exponent)`

  Calculates base^exponent, for non-negative exponents.

  `static boolean`

  `isFunction(Object o)`

  `static boolean`

  `isNegative(double vDouble)`

  `static boolean`

  `isTable(Object o)`

  `static boolean`

  `isUserdata(Object o)`

  `static int`

  `len(se.krka.kahlua.vm.KahluaTable kahluaTable,
  int low,
  int high)`

  `static @Nullable se.krka.kahlua.vm.LuaClosure`

  `loadByteCodeFromFile(File file,
  se.krka.kahlua.vm.KahluaTable environment)`

  `static @Nullable se.krka.kahlua.vm.LuaClosure`

  `loadByteCodeFromResource(String name,
  se.krka.kahlua.vm.KahluaTable environment)`

  `static void`

  `luaAssert(boolean b,
  String msg)`

  `static String`

  `numberToString(Double num)`

  `static Double`

  `rawTonumber(Object o)`

  `static StackTraceElement`

  `rawToStackTraceElement(Object o)`

  `static String`

  `rawTostring(Object o)`

  `static String`

  `rawTostring2(Object o)`

  `static double`

  `round(double x)`

  Rounds towards even numbers

  `static void`

  `setupLibrary(se.krka.kahlua.vm.KahluaTable env,
  se.krka.kahlua.vm.KahluaThread workerThread,
  File library)`

  `static void`

  `setupLibraryText(se.krka.kahlua.vm.KahluaTable env,
  se.krka.kahlua.vm.KahluaThread workerThread,
  File library)`

  `static void`

  `setWorkerThread(se.krka.kahlua.vm.KahluaTable env,
  se.krka.kahlua.vm.KahluaThread thread)`

  `private static String`

  `tableToString(Object o,
  se.krka.kahlua.vm.KahluaThread thread)`

  `static Boolean`

  `toBoolean(boolean b)`

  `static Double`

  `toDouble(double d)`

  `static Double`

  `toDouble(long d)`

  `static Double`

  `tonumber(String s)`

  `static Double`

  `tonumber(String s,
  int radix)`

  `static String`

  `tostring(Object o,
  se.krka.kahlua.vm.KahluaThread thread)`

  `static String`

  `type(Object o)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### WORKER\_THREAD\_KEY

    private static final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") WORKER\_THREAD\_KEY
  + ### TYPE\_NIL

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_NIL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.KahluaUtil.TYPE_NIL)
  + ### TYPE\_STRING

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_STRING

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.KahluaUtil.TYPE_STRING)
  + ### TYPE\_NUMBER

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_NUMBER

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.KahluaUtil.TYPE_NUMBER)
  + ### TYPE\_BOOLEAN

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_BOOLEAN

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.KahluaUtil.TYPE_BOOLEAN)
  + ### TYPE\_FUNCTION

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_FUNCTION

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.KahluaUtil.TYPE_FUNCTION)
  + ### TYPE\_TABLE

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_TABLE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.KahluaUtil.TYPE_TABLE)
  + ### TYPE\_COROUTINE

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_COROUTINE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.KahluaUtil.TYPE_COROUTINE)
  + ### TYPE\_USERDATA

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_USERDATA

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.KahluaUtil.TYPE_USERDATA)
* Constructor Details
  -------------------

  + ### KahluaUtil

    public KahluaUtil()
* Method Details
  --------------

  + ### fromDouble

    public static double fromDouble([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### toDouble

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") toDouble(double d)
  + ### toDouble

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") toDouble(long d)
  + ### toBoolean

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") toBoolean(boolean b)
  + ### boolEval

    public static boolean boolEval([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### loadByteCodeFromFile

    public static @Nullable se.krka.kahlua.vm.LuaClosure loadByteCodeFromFile([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") file,
    se.krka.kahlua.vm.KahluaTable environment)
  + ### loadByteCodeFromResource

    public static @Nullable se.krka.kahlua.vm.LuaClosure loadByteCodeFromResource([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    se.krka.kahlua.vm.KahluaTable environment)
  + ### getLuaClosure

    private static @Nullable se.krka.kahlua.vm.LuaClosure getLuaClosure(se.krka.kahlua.vm.KahluaTable environment,
    [InputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/InputStream.html "class or interface in java.io") stream)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### luaAssert

    public static void luaAssert(boolean b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### fail

    public static void fail([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### round

    public static double round(double x)

    Rounds towards even numbers
  + ### ipow

    public static long ipow(long base,
    int exponent)

    Calculates base^exponent, for non-negative exponents.
    0^0 is defined to be 1

    Returns:
    :   1 if exponent is zero or negative
  + ### isNegative

    public static boolean isNegative(double vDouble)
  + ### getClassMetatables

    public static se.krka.kahlua.vm.KahluaTable getClassMetatables(se.krka.kahlua.vm.Platform platform,
    se.krka.kahlua.vm.KahluaTable env)
  + ### getWorkerThread

    public static se.krka.kahlua.vm.KahluaThread getWorkerThread(se.krka.kahlua.vm.Platform platform,
    se.krka.kahlua.vm.KahluaTable env)
  + ### setWorkerThread

    public static void setWorkerThread(se.krka.kahlua.vm.KahluaTable env,
    se.krka.kahlua.vm.KahluaThread thread)
  + ### getOrCreateTable

    public static se.krka.kahlua.vm.KahluaTable getOrCreateTable(se.krka.kahlua.vm.Platform platform,
    se.krka.kahlua.vm.KahluaTable env,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setupLibrary

    public static void setupLibrary(se.krka.kahlua.vm.KahluaTable env,
    se.krka.kahlua.vm.KahluaThread workerThread,
    [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") library)
  + ### setupLibraryText

    public static void setupLibraryText(se.krka.kahlua.vm.KahluaTable env,
    se.krka.kahlua.vm.KahluaThread workerThread,
    [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") library)
  + ### numberToString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") numberToString([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") num)
  + ### type

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### isUserdata

    public static boolean isUserdata([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### isTable

    public static boolean isTable([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### isFunction

    public static boolean isFunction([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### tostring

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tostring([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    se.krka.kahlua.vm.KahluaThread thread)
  + ### tableToString

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tableToString([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    se.krka.kahlua.vm.KahluaThread thread)
  + ### identityHashCode

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") identityHashCode([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### tonumber

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") tonumber([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### tonumber

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") tonumber([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s,
    int radix)
  + ### rawTostring

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rawTostring([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### rawTostring2

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rawTostring2([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### rawToStackTraceElement

    public static [StackTraceElement](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StackTraceElement.html "class or interface in java.lang") rawToStackTraceElement([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### rawTonumber

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") rawTonumber([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### getStringArg

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStringArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") function)
  + ### getOptionalStringArg

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOptionalStringArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int n)
  + ### getNumberArg

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getNumberArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") function)
  + ### getOptionalNumberArg

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getOptionalNumberArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int n)
  + ### fail

    private static void fail(int n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") function,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wantedType,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gotten)
  + ### assertArgNotNull

    public static void assertArgNotNull([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    int n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") function)
  + ### getOptionalArg

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getOptionalArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int n)
  + ### getArg

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int n,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") function)
  + ### len

    public static int len(se.krka.kahlua.vm.KahluaTable kahluaTable,
    int low,
    int high)
  + ### getDoubleArg

    public static double getDoubleArg(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int i,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)