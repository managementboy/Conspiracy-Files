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
4. [ItemQueryJava](LuaManager.GlobalObject.ItemQueryJava.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [handle](#handle)
   2. [connection](#connection)
6. [Constructor Details](#constructor-detail)
   1. [ItemQueryJava(ArrayList, UdpConnection)](#%3Cinit%3E(java.util.ArrayList,zombie.core.raknet.UdpConnection))
7. [Method Details](#method-detail)
   1. [inform(String)](#inform(java.lang.String))
   2. [onItemCreated(long, boolean)](#onItemCreated(long,boolean))
   3. [onItemNotCreated(int)](#onItemNotCreated(int))
   4. [onItemUpdated(boolean)](#onItemUpdated(boolean))
   5. [onItemNotUpdated(int)](#onItemNotUpdated(int))
   6. [onItemSubscribed(long)](#onItemSubscribed(long))
   7. [onItemNotSubscribed(long, int)](#onItemNotSubscribed(long,int))
   8. [onItemDownloaded(long)](#onItemDownloaded(long))
   9. [onItemNotDownloaded(long, int)](#onItemNotDownloaded(long,int))
   10. [onItemQueryCompleted(long, int)](#onItemQueryCompleted(long,int))
   11. [onItemQueryNotCompleted(long, int)](#onItemQueryNotCompleted(long,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LuaManager.GlobalObject.ItemQueryJava
===========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.Lua.LuaManager.GlobalObject.ItemQueryJava

All Implemented Interfaces:
:   `zombie.core.znet.ISteamWorkshopCallback`

Enclosing class:
:   `LuaManager.GlobalObject`

---

private static final class LuaManager.GlobalObject.ItemQueryJava
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.core.znet.ISteamWorkshopCallback

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.core.raknet.UdpConnection`

  `connection`

  `private final long`

  `handle`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemQueryJava(ArrayList<String> itemIDs,
  zombie.core.raknet.UdpConnection connection)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `inform(String message)`

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

  + ### handle

    private final long handle
  + ### connection

    private final zombie.core.raknet.UdpConnection connection
* Constructor Details
  -------------------

  + ### ItemQueryJava

    public ItemQueryJava([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemIDs,
    zombie.core.raknet.UdpConnection connection)
* Method Details
  --------------

  + ### inform

    private void inform([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
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