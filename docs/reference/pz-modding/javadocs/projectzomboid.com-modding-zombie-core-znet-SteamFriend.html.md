[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.znet](package-summary.html)
2. [SteamFriend](SteamFriend.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [steamId](#steamId)
   3. [steamIdString](#steamIdString)
6. [Constructor Details](#constructor-detail)
   1. [SteamFriend()](#%3Cinit%3E())
   2. [SteamFriend(String, long)](#%3Cinit%3E(java.lang.String,long))
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getSteamID()](#getSteamID())
   3. [getAvatar()](#getAvatar())
   4. [getState()](#getState())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SteamFriend
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.znet.SteamFriend

---

public class SteamFriend
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `name`

  `private long`

  `steamId`

  `private String`

  `steamIdString`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SteamFriend()`

  `SteamFriend(String name,
  long steamId)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Texture`

  `getAvatar()`

  `String`

  `getName()`

  `String`

  `getState()`

  `String`

  `getSteamID()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### steamId

    private long steamId
  + ### steamIdString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") steamIdString
* Constructor Details
  -------------------

  + ### SteamFriend

    public SteamFriend()
  + ### SteamFriend

    public SteamFriend([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    long steamId)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getSteamID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSteamID()
  + ### getAvatar

    public [Texture](../textures/Texture.html "class in zombie.core.textures") getAvatar()
  + ### getState

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getState()