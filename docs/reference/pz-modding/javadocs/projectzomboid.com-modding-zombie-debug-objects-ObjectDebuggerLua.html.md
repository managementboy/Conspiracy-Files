[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.debug.objects](package-summary.html)
2. [ObjectDebuggerLua](ObjectDebuggerLua.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [array\_list\_pool](#array_list_pool)
6. [Constructor Details](#constructor-detail)
   1. [ObjectDebuggerLua()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [AllocList()](#AllocList())
   2. [ReleaseList(ArrayList)](#ReleaseList(java.util.ArrayList))
   3. [Log(Object)](#Log(java.lang.Object))
   4. [Log(Object, int)](#Log(java.lang.Object,int))
   5. [Log(Object, int, int)](#Log(java.lang.Object,int,int))
   6. [GetLines(Object, ArrayList)](#GetLines(java.lang.Object,java.util.ArrayList))
   7. [GetLines(Object, ArrayList, int)](#GetLines(java.lang.Object,java.util.ArrayList,int))
   8. [GetLines(Object, ArrayList, int, int)](#GetLines(java.lang.Object,java.util.ArrayList,int,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ObjectDebuggerLua
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.debug.objects.ObjectDebuggerLua

---

public class ObjectDebuggerLua
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ConcurrentLinkedDeque<ArrayList<String>>`

  `array_list_pool`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ObjectDebuggerLua()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<String>`

  `AllocList()`

  `static void`

  `GetLines(Object o,
  ArrayList<String> list)`

  `static void`

  `GetLines(Object o,
  ArrayList<String> list,
  int inheritanceDepth)`

  `static void`

  `GetLines(Object o,
  ArrayList<String> list,
  int inheritanceDepth,
  int memberDepth)`

  `static void`

  `Log(Object o)`

  `static void`

  `Log(Object o,
  int inheritanceDepth)`

  `static void`

  `Log(Object o,
  int inheritanceDepth,
  int memberDepth)`

  `static void`

  `ReleaseList(ArrayList<String> list)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### array\_list\_pool

    private static final [ConcurrentLinkedDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedDeque.html "class or interface in java.util.concurrent")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> array\_list\_pool
* Constructor Details
  -------------------

  + ### ObjectDebuggerLua

    public ObjectDebuggerLua()
* Method Details
  --------------

  + ### AllocList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> AllocList()
  + ### ReleaseList

    public static void ReleaseList([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list)
  + ### Log

    public static void Log([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### Log

    public static void Log([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    int inheritanceDepth)
  + ### Log

    public static void Log([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    int inheritanceDepth,
    int memberDepth)
  + ### GetLines

    public static void GetLines([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list)
  + ### GetLines

    public static void GetLines([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list,
    int inheritanceDepth)
  + ### GetLines

    public static void GetLines([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list,
    int inheritanceDepth,
    int memberDepth)