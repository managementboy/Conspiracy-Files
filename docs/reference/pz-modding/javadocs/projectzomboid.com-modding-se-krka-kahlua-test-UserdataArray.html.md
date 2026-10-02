[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [se.krka.kahlua.test](package-summary.html)
2. [UserdataArray](UserdataArray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [LENGTH](#LENGTH)
   2. [INDEX](#INDEX)
   3. [NEWINDEX](#NEWINDEX)
   4. [NEW](#NEW)
   5. [PUSH](#PUSH)
   6. [VECTOR\_CLASS](#VECTOR_CLASS)
   7. [metatable](#metatable)
   8. [index](#index)
6. [Constructor Details](#constructor-detail)
   1. [UserdataArray(int)](#%3Cinit%3E(int))
7. [Method Details](#method-detail)
   1. [register(Platform, KahluaTable)](#register(se.krka.kahlua.vm.Platform,se.krka.kahlua.vm.KahluaTable))
   2. [call(LuaCallFrame, int)](#call(se.krka.kahlua.vm.LuaCallFrame,int))
   3. [push(LuaCallFrame, int)](#push(se.krka.kahlua.vm.LuaCallFrame,int))
   4. [newVector(LuaCallFrame, int)](#newVector(se.krka.kahlua.vm.LuaCallFrame,int))
   5. [newindex(LuaCallFrame, int)](#newindex(se.krka.kahlua.vm.LuaCallFrame,int))
   6. [index(LuaCallFrame, int)](#index(se.krka.kahlua.vm.LuaCallFrame,int))
   7. [length(LuaCallFrame, int)](#length(se.krka.kahlua.vm.LuaCallFrame,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class UserdataArray
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

se.krka.kahlua.test.UserdataArray

All Implemented Interfaces:
:   `se.krka.kahlua.vm.JavaFunction`

---

public class UserdataArray
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements se.krka.kahlua.vm.JavaFunction

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `index`

  `private static final int`

  `INDEX`

  `private static final int`

  `LENGTH`

  `private static se.krka.kahlua.vm.KahluaTable`

  `metatable`

  `private static final int`

  `NEW`

  `private static final int`

  `NEWINDEX`

  `private static final int`

  `PUSH`

  `private static final Class<?>`

  `VECTOR_CLASS`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `UserdataArray(int index)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `call(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int nArguments)`

  This interface defines functions which the Kahlua engine can call.

  `private int`

  `index(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int nArguments)`

  `private int`

  `length(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int nArguments)`

  `private int`

  `newindex(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int nArguments)`

  `private int`

  `newVector(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int nArguments)`

  `private int`

  `push(se.krka.kahlua.vm.LuaCallFrame callFrame,
  int nArguments)`

  `static void`

  `register(se.krka.kahlua.vm.Platform platform,
  se.krka.kahlua.vm.KahluaTable env)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### LENGTH

    private static final int LENGTH

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.test.UserdataArray.LENGTH)
  + ### INDEX

    private static final int INDEX

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.test.UserdataArray.INDEX)
  + ### NEWINDEX

    private static final int NEWINDEX

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.test.UserdataArray.NEWINDEX)
  + ### NEW

    private static final int NEW

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.test.UserdataArray.NEW)
  + ### PUSH

    private static final int PUSH

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#se.krka.kahlua.test.UserdataArray.PUSH)
  + ### VECTOR\_CLASS

    private static final [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> VECTOR\_CLASS
  + ### metatable

    private static se.krka.kahlua.vm.KahluaTable metatable
  + ### index

    private final int index
* Constructor Details
  -------------------

  + ### UserdataArray

    private UserdataArray(int index)
* Method Details
  --------------

  + ### register

    public static void register(se.krka.kahlua.vm.Platform platform,
    se.krka.kahlua.vm.KahluaTable env)
  + ### call

    public int call(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int nArguments)

    Description copied from interface: `se.krka.kahlua.vm.JavaFunction`

    This interface defines functions which the Kahlua engine can call.

    General contract:

    ```
     callFrame.get(i) = an argument (0 invalid input: '<'= i invalid input: '<' nArguments)
    ```

    Return (possibly) values to lua by calling:

    ```
     callFrame.push(value1);
     callFrame.push(value2);
     return 2; // number of pushed values
    ```

    Specified by:
    :   `call` in interface `se.krka.kahlua.vm.JavaFunction`

    Parameters:
    :   `callFrame` - - the frame that contains all the arguments and where all the results should be put.
    :   `nArguments` - - number of function arguments

    Returns:
    :   N, number of return values. The top N objects on the stack are considered the return values.
  + ### push

    private int push(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int nArguments)
  + ### newVector

    private int newVector(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int nArguments)
  + ### newindex

    private int newindex(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int nArguments)
  + ### index

    private int index(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int nArguments)
  + ### length

    private int length(se.krka.kahlua.vm.LuaCallFrame callFrame,
    int nArguments)