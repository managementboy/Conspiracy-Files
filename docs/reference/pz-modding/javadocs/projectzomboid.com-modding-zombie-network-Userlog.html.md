[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [Userlog](Userlog.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [username](#username)
   2. [type](#type)
   3. [text](#text)
   4. [issuedBy](#issuedBy)
   5. [lastUpdate](#lastUpdate)
   6. [amount](#amount)
7. [Constructor Details](#constructor-detail)
   1. [Userlog(String, String, String, String, int, String)](#%3Cinit%3E(java.lang.String,java.lang.String,java.lang.String,java.lang.String,int,java.lang.String))
   2. [Userlog(ByteBufferReader)](#%3Cinit%3E(zombie.core.network.ByteBufferReader))
8. [Method Details](#method-detail)
   1. [getUsername()](#getUsername())
   2. [getType()](#getType())
   3. [getText()](#getText())
   4. [getIssuedBy()](#getIssuedBy())
   5. [getAmount()](#getAmount())
   6. [setAmount(int)](#setAmount(int))
   7. [getLastUpdate()](#getLastUpdate())
   8. [write(ByteBufferWriter)](#write(zombie.core.network.ByteBufferWriter))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Userlog
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.Userlog

---

public class Userlog
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `Userlog.UserlogType`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `amount`

  `private final String`

  `issuedBy`

  `private final String`

  `lastUpdate`

  `private final String`

  `text`

  `private final String`

  `type`

  `private final String`

  `username`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Userlog(String username,
  String type,
  String text,
  String issuedBy,
  int amount,
  String lastUpdate)`

  `Userlog(zombie.core.network.ByteBufferReader input)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getAmount()`

  `String`

  `getIssuedBy()`

  `String`

  `getLastUpdate()`

  `String`

  `getText()`

  `String`

  `getType()`

  `String`

  `getUsername()`

  `void`

  `setAmount(int amount)`

  `void`

  `write(zombie.core.network.ByteBufferWriter output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### username

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username
  + ### type

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### text

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text
  + ### issuedBy

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") issuedBy
  + ### lastUpdate

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastUpdate
  + ### amount

    private int amount
* Constructor Details
  -------------------

  + ### Userlog

    public Userlog([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") username,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") issuedBy,
    int amount,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lastUpdate)
  + ### Userlog

    public Userlog(zombie.core.network.ByteBufferReader input)
* Method Details
  --------------

  + ### getUsername

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUsername()
  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()
  + ### getText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getText()
  + ### getIssuedBy

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIssuedBy()
  + ### getAmount

    public int getAmount()
  + ### setAmount

    public void setAmount(int amount)
  + ### getLastUpdate

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLastUpdate()
  + ### write

    public void write(zombie.core.network.ByteBufferWriter output)