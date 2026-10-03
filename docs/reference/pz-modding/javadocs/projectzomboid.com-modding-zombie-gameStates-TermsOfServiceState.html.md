[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [TermsOfServiceState](TermsOfServiceState.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [exit](#exit)
   2. [created](#created)
6. [Constructor Details](#constructor-detail)
   1. [TermsOfServiceState()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [enter()](#enter())
   2. [exit()](#exit())
   3. [update()](#update())
   4. [render()](#render())
   5. [fromLua0(String)](#fromLua0(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TermsOfServiceState
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.gameStates.TermsOfServiceState

---

public class TermsOfServiceState
extends zombie.gameStates.GameState

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `created`

  `private boolean`

  `exit`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TermsOfServiceState()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `enter()`

  `void`

  `exit()`

  `Object`

  `fromLua0(String func)`

  `void`

  `render()`

  `zombie.gameStates.GameStateMachine.StateAction`

  `update()`

  ### Methods inherited from class zombie.gameStates.GameState

  `redirectState, reenter, yield`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### exit

    private boolean exit
  + ### created

    private boolean created
* Constructor Details
  -------------------

  + ### TermsOfServiceState

    public TermsOfServiceState()
* Method Details
  --------------

  + ### enter

    public void enter()

    Overrides:
    :   `enter` in class `zombie.gameStates.GameState`
  + ### exit

    public void exit()

    Overrides:
    :   `exit` in class `zombie.gameStates.GameState`
  + ### update

    public zombie.gameStates.GameStateMachine.StateAction update()

    Overrides:
    :   `update` in class `zombie.gameStates.GameState`
  + ### render

    public void render()

    Overrides:
    :   `render` in class `zombie.gameStates.GameState`
  + ### fromLua0

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua0([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func)