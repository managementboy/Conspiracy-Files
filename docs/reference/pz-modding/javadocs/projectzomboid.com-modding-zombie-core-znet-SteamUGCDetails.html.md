[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.znet](package-summary.html)
2. [SteamUGCDetails](SteamUGCDetails.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [title](#title)
   3. [timeCreated](#timeCreated)
   4. [timeUpdated](#timeUpdated)
   5. [fileSize](#fileSize)
   6. [childIds](#childIds)
6. [Constructor Details](#constructor-detail)
   1. [SteamUGCDetails(long, String, long, long, int, long[])](#%3Cinit%3E(long,java.lang.String,long,long,int,long%5B%5D))
7. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [getIDString()](#getIDString())
   3. [getTitle()](#getTitle())
   4. [getTimeCreated()](#getTimeCreated())
   5. [getTimeUpdated()](#getTimeUpdated())
   6. [getFileSize()](#getFileSize())
   7. [getChildren()](#getChildren())
   8. [getNumChildren()](#getNumChildren())
   9. [getChildID(int)](#getChildID(int))
   10. [getState()](#getState())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SteamUGCDetails
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.znet.SteamUGCDetails

---

public class SteamUGCDetails
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final long[]`

  `childIds`

  `private final int`

  `fileSize`

  `private final long`

  `id`

  `private final long`

  `timeCreated`

  `private final long`

  `timeUpdated`

  `private final String`

  `title`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SteamUGCDetails(long id,
  String title,
  long timeCreated,
  long timeUpdated,
  int fileSize,
  long[] childIds)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `long`

  `getChildID(int index)`

  `long[]`

  `getChildren()`

  `int`

  `getFileSize()`

  `long`

  `getID()`

  `String`

  `getIDString()`

  `int`

  `getNumChildren()`

  `String`

  `getState()`

  `long`

  `getTimeCreated()`

  `long`

  `getTimeUpdated()`

  `String`

  `getTitle()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final long id
  + ### title

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### timeCreated

    private final long timeCreated
  + ### timeUpdated

    private final long timeUpdated
  + ### fileSize

    private final int fileSize
  + ### childIds

    private final long[] childIds
* Constructor Details
  -------------------

  + ### SteamUGCDetails

    public SteamUGCDetails(long id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title,
    long timeCreated,
    long timeUpdated,
    int fileSize,
    long[] childIds)
* Method Details
  --------------

  + ### getID

    public long getID()
  + ### getIDString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIDString()
  + ### getTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### getTimeCreated

    public long getTimeCreated()
  + ### getTimeUpdated

    public long getTimeUpdated()
  + ### getFileSize

    public int getFileSize()
  + ### getChildren

    public long[] getChildren()
  + ### getNumChildren

    public int getNumChildren()
  + ### getChildID

    public long getChildID(int index)
  + ### getState

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getState()