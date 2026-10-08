[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [se.krka.kahlua.vm](package-summary.html)
2. [Coroutine](Coroutine.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [platform](#platform)
   2. [thread](#thread)
   3. [parent](#parent)
   4. [environment](#environment)
   5. [stackTrace](#stackTrace)
   6. [liveUpvalues](#liveUpvalues)
   7. [MAX\_STACK\_SIZE](#MAX_STACK_SIZE)
   8. [INITIAL\_STACK\_SIZE](#INITIAL_STACK_SIZE)
   9. [MAX\_CALL\_FRAME\_STACK\_SIZE](#MAX_CALL_FRAME_STACK_SIZE)
   10. [INITIAL\_CALL\_FRAME\_STACK\_SIZE](#INITIAL_CALL_FRAME_STACK_SIZE)
   11. [objectStack](#objectStack)
   12. [top](#top)
   13. [callFrameStack](#callFrameStack)
   14. [callFrameTop](#callFrameTop)
6. [Constructor Details](#constructor-detail)
   1. [Coroutine()](#%3Cinit%3E())
   2. [Coroutine(Platform, KahluaTable, KahluaThread)](#%3Cinit%3E(se.krka.kahlua.vm.Platform,se.krka.kahlua.vm.KahluaTable,se.krka.kahlua.vm.KahluaThread))
   3. [Coroutine(Platform, KahluaTable)](#%3Cinit%3E(se.krka.kahlua.vm.Platform,se.krka.kahlua.vm.KahluaTable))
7. [Method Details](#method-detail)
   1. [getParent()](#getParent())
   2. [pushNewCallFrame(LuaClosure, JavaFunction, int, int, int, boolean, boolean)](#pushNewCallFrame(se.krka.kahlua.vm.LuaClosure,se.krka.kahlua.vm.JavaFunction,int,int,int,boolean,boolean))
   3. [popCallFrame()](#popCallFrame())
   4. [ensureCallFrameStackSize(int)](#ensureCallFrameStackSize(int))
   5. [setCallFrameStackTop(int)](#setCallFrameStackTop(int))
   6. [callFrameStackClear(int, int)](#callFrameStackClear(int,int))
   7. [ensureStacksize(int)](#ensureStacksize(int))
   8. [setTop(int)](#setTop(int))
   9. [stackCopy(int, int, int)](#stackCopy(int,int,int))
   10. [stackCopyNoDebugStuff(int, int, int)](#stackCopyNoDebugStuff(int,int,int))
   11. [stackClear(int, int)](#stackClear(int,int))
   12. [closeUpvalues(int)](#closeUpvalues(int))
   13. [findUpvalue(int)](#findUpvalue(int))
   14. [getObjectFromStack(int)](#getObjectFromStack(int))
   15. [getObjectStackSize()](#getObjectStackSize())
   16. [getParentCallframe()](#getParentCallframe())
   17. [currentCallFrame()](#currentCallFrame())
   18. [getTop()](#getTop())
   19. [getParent(int)](#getParent(int))
   20. [getParentNoAssert(int)](#getParentNoAssert(int))
   21. [getCurrentStackTrace(int, int, int)](#getCurrentStackTrace(int,int,int))
   22. [cleanCallFrames(LuaCallFrame)](#cleanCallFrames(se.krka.kahlua.vm.LuaCallFrame))
   23. [addStackTrace(LuaCallFrame)](#addStackTrace(se.krka.kahlua.vm.LuaCallFrame))
   24. [getStackTrace(LuaCallFrame)](#getStackTrace(se.krka.kahlua.vm.LuaCallFrame))
   25. [isDead()](#isDead())
   26. [getPlatform()](#getPlatform())
   27. [getStatus()](#getStatus())
   28. [atBottom()](#atBottom())
   29. [getCallframeTop()](#getCallframeTop())
   30. [getCallframeStack()](#getCallframeStack())
   31. [getCallFrame(int)](#getCallFrame(int))
   32. [yieldHelper(LuaCallFrame, LuaCallFrame, int)](#yieldHelper(se.krka.kahlua.vm.LuaCallFrame,se.krka.kahlua.vm.LuaCallFrame,int))
   33. [resume(Coroutine)](#resume(se.krka.kahlua.vm.Coroutine))
   34. [getThread()](#getThread())
   35. [destroy()](#destroy())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class Coroutine
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

se.krka.kahlua.vm.Coroutine

---

public final class Coroutine
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private se.krka.kahlua.vm.LuaCallFrame[]`

  `callFrameStack`

  `private int`

  `callFrameTop`

  `se.krka.kahlua.vm.KahluaTable`

  `environment`

  `private static final int`

  `INITIAL_CALL_FRAME_STACK_SIZE`

  `private static final int`

  `INITIAL_STACK_SIZE`

  `private final ArrayList<se.krka.kahlua.vm.UpValue>`

  `liveUpvalues`

  `private static final int`

  `MAX_CALL_FRAME_STACK_SIZE`

  `private static final int`

  `MAX_STACK_SIZE`

  `Object[]`

  `objectStack`

  `private Coroutine`

  `parent`

  `private final se.krka.kahlua.vm.Platform`

  `platform`

  `String`

  `stackTrace`

  `private se.krka.kahlua.vm.KahluaThread`

  `thread`

  `private int`

  `top`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Coroutine()`

  `Coroutine(se.krka.kahlua.vm.Platform platform,
  se.krka.kahlua.vm.KahluaTable environment)`

  `Coroutine(se.krka.kahlua.vm.Platform platform,
  se.krka.kahlua.vm.KahluaTable environment,
  se.krka.kahlua.vm.KahluaThread thread)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addStackTrace(se.krka.kahlua.vm.LuaCallFrame frame)`

  `boolean`

  `atBottom()`

  `private void`

  `callFrameStackClear(int startIndex,
  int endIndex)`

  `void`

  `cleanCallFrames(se.krka.kahlua.vm.LuaCallFrame callerFrame)`

  `void`

  `closeUpvalues(int closeIndex)`

  `se.krka.kahlua.vm.LuaCallFrame`

  `currentCallFrame()`

  `void`

  `destroy()`

  `private void`

  `ensureCallFrameStackSize(int index)`

  `private void`

  `ensureStacksize(int index)`

  `se.krka.kahlua.vm.UpValue`

  `findUpvalue(int scanIndex)`

  `se.krka.kahlua.vm.LuaCallFrame`

  `getCallFrame(int index)`

  `se.krka.kahlua.vm.LuaCallFrame[]`

  `getCallframeStack()`

  `int`

  `getCallframeTop()`

  `String`

  `getCurrentStackTrace(int level,
  int count,
  int haltAt)`

  `Object`

  `getObjectFromStack(int n)`

  `int`

  `getObjectStackSize()`

  `Coroutine`

  `getParent()`

  `se.krka.kahlua.vm.LuaCallFrame`

  `getParent(int level)`

  `se.krka.kahlua.vm.LuaCallFrame`

  `getParentCallframe()`

  `se.krka.kahlua.vm.LuaCallFrame`

  `getParentNoAssert(int level)`

  `se.krka.kahlua.vm.Platform`

  `getPlatform()`

  `private String`

  `getStackTrace(se.krka.kahlua.vm.LuaCallFrame frame)`

  `String`

  `getStatus()`

  `se.krka.kahlua.vm.KahluaThread`

  `getThread()`

  `int`

  `getTop()`

  `boolean`

  `isDead()`

  `void`

  `popCallFrame()`

  `se.krka.kahlua.vm.LuaCallFrame`

  `pushNewCallFrame(se.krka.kahlua.vm.LuaClosure closure,
  se.krka.kahlua.vm.JavaFunction javaFunction,
  int localBase,
  int returnBase,
  int nArguments,
  boolean fromLua,
  boolean insideCoroutine)`

  `void`

  `resume(Coroutine parent)`

  `void`

  `setCallFrameStackTop(int newTop)`

  `void`

  `setTop(int newTop)`

  `void`

  `stackClear(int startIndex,
  int endIndex)`

  `void`

  `stackCopy(int startIndex,
  int destIndex,
  int len)`

  `void`

  `stackCopyNoDebugStuff(int startIndex,
  int destIndex,
  int len)`

  `static void`

  `yieldHelper(se.krka.kahlua.vm.LuaCallFrame callFrame,
  se.krka.kahlua.vm.LuaCallFrame argsCallFrame,
  int nArguments)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### platform

    private final se.krka.kahlua.vm.Platform platform
  + ### thread

    private se.krka.kahlua.vm.KahluaThread thread
  + ### parent

    private [Coroutine](Coroutine.html "class in se.krka.kahlua.vm") parent
  + ### environment

    public se.krka.kahlua.vm.KahluaTable environment
  + ### stackTrace

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stackTrace
  + ### liveUpvalues

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<se.krka.kahlua.vm.UpValue> liveUpvalues
  + ### MAX\_STACK\_SIZE

    private static final int MAX\_STACK\_SIZE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.Coroutine.MAX_STACK_SIZE)
  + ### INITIAL\_STACK\_SIZE

    private static final int INITIAL\_STACK\_SIZE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.Coroutine.INITIAL_STACK_SIZE)
  + ### MAX\_CALL\_FRAME\_STACK\_SIZE

    private static final int MAX\_CALL\_FRAME\_STACK\_SIZE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.Coroutine.MAX_CALL_FRAME_STACK_SIZE)
  + ### INITIAL\_CALL\_FRAME\_STACK\_SIZE

    private static final int INITIAL\_CALL\_FRAME\_STACK\_SIZE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.vm.Coroutine.INITIAL_CALL_FRAME_STACK_SIZE)
  + ### objectStack

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] objectStack
  + ### top

    private int top
  + ### callFrameStack

    private se.krka.kahlua.vm.LuaCallFrame[] callFrameStack
  + ### callFrameTop

    private int callFrameTop
* Constructor Details
  -------------------

  + ### Coroutine

    public Coroutine()
  + ### Coroutine

    public Coroutine(se.krka.kahlua.vm.Platform platform,
    se.krka.kahlua.vm.KahluaTable environment,
    se.krka.kahlua.vm.KahluaThread thread)
  + ### Coroutine

    public Coroutine(se.krka.kahlua.vm.Platform platform,
    se.krka.kahlua.vm.KahluaTable environment)
* Method Details
  --------------

  + ### getParent

    public [Coroutine](Coroutine.html "class in se.krka.kahlua.vm") getParent()
  + ### pushNewCallFrame

    public se.krka.kahlua.vm.LuaCallFrame pushNewCallFrame(se.krka.kahlua.vm.LuaClosure closure,
    se.krka.kahlua.vm.JavaFunction javaFunction,
    int localBase,
    int returnBase,
    int nArguments,
    boolean fromLua,
    boolean insideCoroutine)
  + ### popCallFrame

    public void popCallFrame()
  + ### ensureCallFrameStackSize

    private void ensureCallFrameStackSize(int index)
  + ### setCallFrameStackTop

    public void setCallFrameStackTop(int newTop)
  + ### callFrameStackClear

    private void callFrameStackClear(int startIndex,
    int endIndex)
  + ### ensureStacksize

    private void ensureStacksize(int index)
  + ### setTop

    public void setTop(int newTop)
  + ### stackCopy

    public void stackCopy(int startIndex,
    int destIndex,
    int len)
  + ### stackCopyNoDebugStuff

    public void stackCopyNoDebugStuff(int startIndex,
    int destIndex,
    int len)
  + ### stackClear

    public void stackClear(int startIndex,
    int endIndex)
  + ### closeUpvalues

    public void closeUpvalues(int closeIndex)
  + ### findUpvalue

    public se.krka.kahlua.vm.UpValue findUpvalue(int scanIndex)
  + ### getObjectFromStack

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getObjectFromStack(int n)
  + ### getObjectStackSize

    public int getObjectStackSize()
  + ### getParentCallframe

    public se.krka.kahlua.vm.LuaCallFrame getParentCallframe()
  + ### currentCallFrame

    public se.krka.kahlua.vm.LuaCallFrame currentCallFrame()
  + ### getTop

    public int getTop()
  + ### getParent

    public se.krka.kahlua.vm.LuaCallFrame getParent(int level)
  + ### getParentNoAssert

    public se.krka.kahlua.vm.LuaCallFrame getParentNoAssert(int level)
  + ### getCurrentStackTrace

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCurrentStackTrace(int level,
    int count,
    int haltAt)
  + ### cleanCallFrames

    public void cleanCallFrames(se.krka.kahlua.vm.LuaCallFrame callerFrame)
  + ### addStackTrace

    public void addStackTrace(se.krka.kahlua.vm.LuaCallFrame frame)
  + ### getStackTrace

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStackTrace(se.krka.kahlua.vm.LuaCallFrame frame)
  + ### isDead

    public boolean isDead()
  + ### getPlatform

    public se.krka.kahlua.vm.Platform getPlatform()
  + ### getStatus

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getStatus()
  + ### atBottom

    public boolean atBottom()
  + ### getCallframeTop

    public int getCallframeTop()
  + ### getCallframeStack

    public se.krka.kahlua.vm.LuaCallFrame[] getCallframeStack()
  + ### getCallFrame

    public se.krka.kahlua.vm.LuaCallFrame getCallFrame(int index)
  + ### yieldHelper

    public static void yieldHelper(se.krka.kahlua.vm.LuaCallFrame callFrame,
    se.krka.kahlua.vm.LuaCallFrame argsCallFrame,
    int nArguments)
  + ### resume

    public void resume([Coroutine](Coroutine.html "class in se.krka.kahlua.vm") parent)
  + ### getThread

    public se.krka.kahlua.vm.KahluaThread getThread()
  + ### destroy

    public void destroy()