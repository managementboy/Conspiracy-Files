[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [LoadingQueueState](LoadingQueueState.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [cancel](#cancel)
   2. [done](#done)
   3. [placeInQueue](#placeInQueue)
   4. [aButtonDown](#aButtonDown)
   5. [ui](#ui)
6. [Constructor Details](#constructor-detail)
   1. [LoadingQueueState()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [enter()](#enter())
   2. [redirectState()](#redirectState())
   3. [render()](#render())
   4. [update()](#update())
   5. [onConnectionImmediate()](#onConnectionImmediate())
   6. [onPlaceInQueue(int, HashMap)](#onPlaceInQueue(int,java.util.HashMap))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LoadingQueueState
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.gameStates.LoadingQueueState

---

public class LoadingQueueState
extends zombie.gameStates.GameState

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `aButtonDown`

  `private static boolean`

  `cancel`

  `private static boolean`

  `done`

  `private static int`

  `placeInQueue`

  `private static final zombie.ui.LoadingQueueUI`

  `ui`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LoadingQueueState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `enter()`

  `static void`

  `onConnectionImmediate()`

  `static void`

  `onPlaceInQueue(int place,
  HashMap<String,Object> serverInformation)`

  `zombie.gameStates.GameState`

  `redirectState()`

  `void`

  `render()`

  `zombie.gameStates.GameStateMachine.StateAction`

  `update()`

  ### Methods inherited from class zombie.gameStates.GameState

  `exit, reenter, yield`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### cancel

    private static boolean cancel
  + ### done

    private static boolean done
  + ### placeInQueue

    private static int placeInQueue
  + ### aButtonDown

    private boolean aButtonDown
  + ### ui

    private static final zombie.ui.LoadingQueueUI ui
* Constructor Details
  -------------------

  + ### LoadingQueueState

    public LoadingQueueState()
* Method Details
  --------------

  + ### enter

    public void enter()

    Overrides:
    :   `enter` in class `zombie.gameStates.GameState`
  + ### redirectState

    public zombie.gameStates.GameState redirectState()

    Overrides:
    :   `redirectState` in class `zombie.gameStates.GameState`
  + ### render

    public void render()

    Overrides:
    :   `render` in class `zombie.gameStates.GameState`
  + ### update

    public zombie.gameStates.GameStateMachine.StateAction update()

    Overrides:
    :   `update` in class `zombie.gameStates.GameState`
  + ### onConnectionImmediate

    public static void onConnectionImmediate()
  + ### onPlaceInQueue

    public static void onPlaceInQueue(int place,
    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> serverInformation)