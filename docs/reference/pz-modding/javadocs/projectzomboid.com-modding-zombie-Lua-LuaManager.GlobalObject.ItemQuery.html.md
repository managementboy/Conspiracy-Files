[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.Lua](package-summary.html)
2. [LuaManager](LuaManager.html)
3. [GlobalObject](LuaManager.GlobalObject.html)
4. [ItemQuery](LuaManager.GlobalObject.ItemQuery.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [functionObj](#functionObj)
   2. [arg1](#arg1)
   3. [handle](#handle)
6. [Constructor Details](#constructor-detail)
   1. [ItemQuery(ArrayList, LuaClosure, Object)](#%3Cinit%3E(java.util.ArrayList,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
7. [Method Details](#method-detail)
   1. [onItemCreated(long, boolean)](#onItemCreated(long,boolean))
   2. [onItemNotCreated(int)](#onItemNotCreated(int))
   3. [onItemUpdated(boolean)](#onItemUpdated(boolean))
   4. [onItemNotUpdated(int)](#onItemNotUpdated(int))
   5. [onItemSubscribed(long)](#onItemSubscribed(long))
   6. [onItemNotSubscribed(long, int)](#onItemNotSubscribed(long,int))
   7. [onItemDownloaded(long)](#onItemDownloaded(long))
   8. [onItemNotDownloaded(long, int)](#onItemNotDownloaded(long,int))
   9. [onItemQueryCompleted(long, int)](#onItemQueryCompleted(long,int))
   10. [onItemQueryNotCompleted(long, int)](#onItemQueryNotCompleted(long,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LuaManager.GlobalObject.ItemQuery
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.Lua.LuaManager.GlobalObject.ItemQuery

All Implemented Interfaces:
:   `zombie.core.znet.ISteamWorkshopCallback`

Enclosing class:
:   `LuaManager.GlobalObject`

---

private static final class LuaManager.GlobalObject.ItemQuery
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.core.znet.ISteamWorkshopCallback

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Object`

  `arg1`

  `private final se.krka.kahlua.vm.LuaClosure`

  `functionObj`

  `private final long`

  `handle`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemQuery(ArrayList<String> itemIDs,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg1)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `onItemCreated(long itemID,
  boolean bUserNeedsToAcceptWorkshopLegalAgreement)`

  `void`

  `onItemDownloaded(long itemID)`

  `void`

  `onItemNotCreated(int result)`

  `void`

  `onItemNotDownloaded(long itemID,
  int result)`

  `void`

  `onItemNotSubscribed(long itemID,
  int result)`

  `void`

  `onItemNotUpdated(int result)`

  `void`

  `onItemQueryCompleted(long handle,
  int numResults)`

  `void`

  `onItemQueryNotCompleted(long handle,
  int result)`

  `void`

  `onItemSubscribed(long itemID)`

  `void`

  `onItemUpdated(boolean bUserNeedsToAcceptWorkshopLegalAgreement)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### functionObj

    private final se.krka.kahlua.vm.LuaClosure functionObj
  + ### arg1

    private final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1
  + ### handle

    private final long handle
* Constructor Details
  -------------------

  + ### ItemQuery

    public ItemQuery([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemIDs,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1)
* Method Details
  --------------

  + ### onItemCreated

    public void onItemCreated(long itemID,
    boolean bUserNeedsToAcceptWorkshopLegalAgreement)

    Specified by:
    :   `onItemCreated` in interface `zombie.core.znet.ISteamWorkshopCallback`
  + ### onItemNotCreated

    public void onItemNotCreated(int result)

    Specified by:
    :   `onItemNotCreated` in interface `zombie.core.znet.ISteamWorkshopCallback`
  + ### onItemUpdated

    public void onItemUpdated(boolean bUserNeedsToAcceptWorkshopLegalAgreement)

    Specified by:
    :   `onItemUpdated` in interface `zombie.core.znet.ISteamWorkshopCallback`
  + ### onItemNotUpdated

    public void onItemNotUpdated(int result)

    Specified by:
    :   `onItemNotUpdated` in interface `zombie.core.znet.ISteamWorkshopCallback`
  + ### onItemSubscribed

    public void onItemSubscribed(long itemID)

    Specified by:
    :   `onItemSubscribed` in interface `zombie.core.znet.ISteamWorkshopCallback`
  + ### onItemNotSubscribed

    public void onItemNotSubscribed(long itemID,
    int result)

    Specified by:
    :   `onItemNotSubscribed` in interface `zombie.core.znet.ISteamWorkshopCallback`
  + ### onItemDownloaded

    public void onItemDownloaded(long itemID)

    Specified by:
    :   `onItemDownloaded` in interface `zombie.core.znet.ISteamWorkshopCallback`
  + ### onItemNotDownloaded

    public void onItemNotDownloaded(long itemID,
    int result)

    Specified by:
    :   `onItemNotDownloaded` in interface `zombie.core.znet.ISteamWorkshopCallback`
  + ### onItemQueryCompleted

    public void onItemQueryCompleted(long handle,
    int numResults)

    Specified by:
    :   `onItemQueryCompleted` in interface `zombie.core.znet.ISteamWorkshopCallback`
  + ### onItemQueryNotCompleted

    public void onItemQueryNotCompleted(long handle,
    int result)

    Specified by:
    :   `onItemQueryNotCompleted` in interface `zombie.core.znet.ISteamWorkshopCallback`