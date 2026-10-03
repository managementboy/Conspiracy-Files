[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [RCONServer](RCONServer.html)
3. [ExecCommand](RCONServer.ExecCommand.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [command](#command)
   3. [response](#response)
   4. [thread](#thread)
6. [Constructor Details](#constructor-detail)
   1. [ExecCommand(int, String, RCONServer.ClientThread)](#%3Cinit%3E(int,java.lang.String,zombie.network.RCONServer.ClientThread))
7. [Method Details](#method-detail)
   1. [update()](#update())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RCONServer.ExecCommand
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.RCONServer.ExecCommand

Enclosing class:
:   `RCONServer`

---

private static class RCONServer.ExecCommand
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `String`

  `command`

  `int`

  `id`

  `String`

  `response`

  `RCONServer.ClientThread`

  `thread`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ExecCommand(int id,
  String command,
  RCONServer.ClientThread thread)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    public int id
  + ### command

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command
  + ### response

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") response
  + ### thread

    public [RCONServer.ClientThread](RCONServer.ClientThread.html "class in zombie.network") thread
* Constructor Details
  -------------------

  + ### ExecCommand

    public ExecCommand(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") command,
    [RCONServer.ClientThread](RCONServer.ClientThread.html "class in zombie.network") thread)
* Method Details
  --------------

  + ### update

    public void update()