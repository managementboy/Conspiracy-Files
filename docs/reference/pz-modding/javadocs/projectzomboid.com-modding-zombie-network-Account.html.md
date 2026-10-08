[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [Account](Account.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [userName](#userName)
   3. [pwd](#pwd)
   4. [authType](#authType)
   5. [useSteamRelay](#useSteamRelay)
   6. [savePwd](#savePwd)
   7. [playerFirstAndLastName](#playerFirstAndLastName)
   8. [icon](#icon)
   9. [timePlayed](#timePlayed)
   10. [lastLogon](#lastLogon)
6. [Constructor Details](#constructor-detail)
   1. [Account()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [setID(int)](#setID(int))
   3. [getUserName()](#getUserName())
   4. [setUserName(String)](#setUserName(java.lang.String))
   5. [getPlayerFirstAndLastName()](#getPlayerFirstAndLastName())
   6. [setPlayerFirstAndLastName(String)](#setPlayerFirstAndLastName(java.lang.String))
   7. [getPwd()](#getPwd())
   8. [setPwd(String)](#setPwd(java.lang.String))
   9. [encryptPwd(String)](#encryptPwd(java.lang.String))
   10. [getUseSteamRelay()](#getUseSteamRelay())
   11. [setUseSteamRelay(boolean)](#setUseSteamRelay(boolean))
   12. [isSavePwd()](#isSavePwd())
   13. [setSavePwd(boolean)](#setSavePwd(boolean))
   14. [getAuthType()](#getAuthType())
   15. [setAuthType(int)](#setAuthType(int))
   16. [getTimePlayed()](#getTimePlayed())
   17. [setTimePlayed(int)](#setTimePlayed(int))
   18. [getLastLogon()](#getLastLogon())
   19. [setLastLogon(LocalDateTime)](#setLastLogon(java.time.LocalDateTime))
   20. [setLastLogonNow()](#setLastLogonNow())
   21. [getIcon()](#getIcon())
   22. [setIcon(Texture)](#setIcon(zombie.core.textures.Texture))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Account
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.Account

---

public class Account
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `authType`

  `private Texture`

  `icon`

  `private int`

  `id`

  `private LocalDateTime`

  `lastLogon`

  `private String`

  `playerFirstAndLastName`

  `private String`

  `pwd`

  `private boolean`

  `savePwd`

  `private int`

  `timePlayed`

  `private String`

  `userName`

  `private boolean`

  `useSteamRelay`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Account()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `encryptPwd(String pwd)`

  `int`

  `getAuthType()`

  `Texture`

  `getIcon()`

  `int`

  `getID()`

  `String`

  `getLastLogon()`

  `String`

  `getPlayerFirstAndLastName()`

  `String`

  `getPwd()`

  `int`

  `getTimePlayed()`

  `String`

  `getUserName()`

  `boolean`

  `getUseSteamRelay()`

  `boolean`

  `isSavePwd()`

  `void`

  `setAuthType(int authType)`

  `void`

  `setIcon(Texture icon)`

  `void`

  `setID(int id)`

  `void`

  `setLastLogon(LocalDateTime lastLogon)`

  `void`

  `setLastLogonNow()`

  `void`

  `setPlayerFirstAndLastName(String name)`

  `void`

  `setPwd(String pwd)`

  `void`

  `setSavePwd(boolean savePwd)`

  `void`

  `setTimePlayed(int timePlayed)`

  `void`

  `setUserName(String userName)`

  `void`

  `setUseSteamRelay(boolean useSteamRelay)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private int id
  + ### userName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") userName
  + ### pwd

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pwd
  + ### authType

    private int authType
  + ### useSteamRelay

    private boolean useSteamRelay
  + ### savePwd

    private boolean savePwd
  + ### playerFirstAndLastName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") playerFirstAndLastName
  + ### icon

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") icon
  + ### timePlayed

    private int timePlayed
  + ### lastLogon

    private [LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") lastLogon
* Constructor Details
  -------------------

  + ### Account

    public Account()
* Method Details
  --------------

  + ### getID

    public int getID()
  + ### setID

    public void setID(int id)
  + ### getUserName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUserName()
  + ### setUserName

    public void setUserName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") userName)
  + ### getPlayerFirstAndLastName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPlayerFirstAndLastName()
  + ### setPlayerFirstAndLastName

    public void setPlayerFirstAndLastName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getPwd

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPwd()
  + ### setPwd

    public void setPwd([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pwd)
  + ### encryptPwd

    public void encryptPwd([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pwd)
  + ### getUseSteamRelay

    public boolean getUseSteamRelay()
  + ### setUseSteamRelay

    public void setUseSteamRelay(boolean useSteamRelay)
  + ### isSavePwd

    public boolean isSavePwd()
  + ### setSavePwd

    public void setSavePwd(boolean savePwd)
  + ### getAuthType

    public int getAuthType()
  + ### setAuthType

    public void setAuthType(int authType)
  + ### getTimePlayed

    public int getTimePlayed()
  + ### setTimePlayed

    public void setTimePlayed(int timePlayed)
  + ### getLastLogon

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastLogon()
  + ### setLastLogon

    public void setLastLogon([LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") lastLogon)
  + ### setLastLogonNow

    public void setLastLogonNow()
  + ### getIcon

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") getIcon()
  + ### setIcon

    public void setIcon([Texture](../core/textures/Texture.html "class in zombie.core.textures") icon)