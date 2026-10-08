[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.input](package-summary.html)
2. [GameKeyboard](GameKeyboard.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [down](#down)
   2. [lastDown](#lastDown)
   3. [eatKey](#eatKey)
   4. [noEventsWhileLoading](#noEventsWhileLoading)
   5. [doLuaKeyPressed](#doLuaKeyPressed)
   6. [s\_keyboardStateCache](#s_keyboardStateCache)
6. [Constructor Details](#constructor-detail)
   1. [GameKeyboard()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [update()](#update())
   2. [poll()](#poll())
   3. [isKeyDownRaw(int)](#isKeyDownRaw(int))
   4. [wasKeyDownRaw(int)](#wasKeyDownRaw(int))
   5. [isKeyPressed(int)](#isKeyPressed(int))
   6. [isKeyPressed(String)](#isKeyPressed(java.lang.String))
   7. [whichKeyPressed(String)](#whichKeyPressed(java.lang.String))
   8. [isKeyDown(int)](#isKeyDown(int))
   9. [isKeyDown(String)](#isKeyDown(java.lang.String))
   10. [whichKeyDown(String)](#whichKeyDown(java.lang.String))
   11. [whichKeyDownIgnoreMouse(String)](#whichKeyDownIgnoreMouse(java.lang.String))
   12. [wasKeyDown(int)](#wasKeyDown(int))
   13. [wasKeyDown(String)](#wasKeyDown(java.lang.String))
   14. [whichKeyWasDown(String)](#whichKeyWasDown(java.lang.String))
   15. [eatKeyPress(int)](#eatKeyPress(int))
   16. [setDoLuaKeyPressed(boolean)](#setDoLuaKeyPressed(boolean))
   17. [getEventQueue()](#getEventQueue())
   18. [getEventQueuePolling()](#getEventQueuePolling())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameKeyboard
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.input.GameKeyboard

---

public final class GameKeyboard
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static boolean`

  `doLuaKeyPressed`

  `private static boolean[]`

  `down`

  `private static boolean[]`

  `eatKey`

  `private static boolean[]`

  `lastDown`

  `static boolean`

  `noEventsWhileLoading`

  `private static final zombie.input.KeyboardStateCache`

  `s_keyboardStateCache`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameKeyboard()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `eatKeyPress(int key)`

  `static org.lwjglx.input.KeyEventQueue`

  `getEventQueue()`

  `static org.lwjglx.input.KeyEventQueue`

  `getEventQueuePolling()`

  `static boolean`

  `isKeyDown(int key)`

  Is the key down.

  `static boolean`

  `isKeyDown(String keyName)`

  `static boolean`

  `isKeyDownRaw(int key)`

  `static boolean`

  `isKeyPressed(int key)`

  Has the key been pressed.

  `static boolean`

  `isKeyPressed(String keyName)`

  `static void`

  `poll()`

  `static void`

  `setDoLuaKeyPressed(boolean doIt)`

  `static void`

  `update()`

  `static boolean`

  `wasKeyDown(int key)`

  Was they key down last frame.

  `static boolean`

  `wasKeyDown(String keyName)`

  `static boolean`

  `wasKeyDownRaw(int key)`

  `static int`

  `whichKeyDown(String keyName)`

  `static int`

  `whichKeyDownIgnoreMouse(String keyName)`

  `static int`

  `whichKeyPressed(String keyName)`

  `static int`

  `whichKeyWasDown(String keyName)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### down

    private static boolean[] down
  + ### lastDown

    private static boolean[] lastDown
  + ### eatKey

    private static boolean[] eatKey
  + ### noEventsWhileLoading

    public static boolean noEventsWhileLoading
  + ### doLuaKeyPressed

    public static boolean doLuaKeyPressed
  + ### s\_keyboardStateCache

    private static final zombie.input.KeyboardStateCache s\_keyboardStateCache
* Constructor Details
  -------------------

  + ### GameKeyboard

    public GameKeyboard()
* Method Details
  --------------

  + ### update

    public static void update()
  + ### poll

    public static void poll()
  + ### isKeyDownRaw

    public static boolean isKeyDownRaw(int key)
  + ### wasKeyDownRaw

    public static boolean wasKeyDownRaw(int key)
  + ### isKeyPressed

    public static boolean isKeyPressed(int key)

    Has the key been pressed. Not continuous. That is, is the key down now, but was not down before.
  + ### isKeyPressed

    public static boolean isKeyPressed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### whichKeyPressed

    public static int whichKeyPressed([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### isKeyDown

    public static boolean isKeyDown(int key)

    Is the key down. Continuous.
  + ### isKeyDown

    public static boolean isKeyDown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### whichKeyDown

    public static int whichKeyDown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### whichKeyDownIgnoreMouse

    public static int whichKeyDownIgnoreMouse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### wasKeyDown

    public static boolean wasKeyDown(int key)

    Was they key down last frame. Continuous.
  + ### wasKeyDown

    public static boolean wasKeyDown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### whichKeyWasDown

    public static int whichKeyWasDown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### eatKeyPress

    public static void eatKeyPress(int key)
  + ### setDoLuaKeyPressed

    public static void setDoLuaKeyPressed(boolean doIt)
  + ### getEventQueue

    public static org.lwjglx.input.KeyEventQueue getEventQueue()
  + ### getEventQueuePolling

    public static org.lwjglx.input.KeyEventQueue getEventQueuePolling()