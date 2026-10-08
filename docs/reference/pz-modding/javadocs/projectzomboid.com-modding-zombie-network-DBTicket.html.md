[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [DBTicket](DBTicket.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [author](#author)
   2. [message](#message)
   3. [ticketId](#ticketId)
   4. [viewed](#viewed)
   5. [answer](#answer)
   6. [isAnswer](#isAnswer)
6. [Constructor Details](#constructor-detail)
   1. [DBTicket(String, String, int)](#%3Cinit%3E(java.lang.String,java.lang.String,int))
   2. [DBTicket(String, String, int, boolean)](#%3Cinit%3E(java.lang.String,java.lang.String,int,boolean))
7. [Method Details](#method-detail)
   1. [getAuthor()](#getAuthor())
   2. [setAuthor(String)](#setAuthor(java.lang.String))
   3. [getMessage()](#getMessage())
   4. [setMessage(String)](#setMessage(java.lang.String))
   5. [getTicketID()](#getTicketID())
   6. [setTicketID(int)](#setTicketID(int))
   7. [isViewed()](#isViewed())
   8. [setViewed(boolean)](#setViewed(boolean))
   9. [getAnswer()](#getAnswer())
   10. [setAnswer(DBTicket)](#setAnswer(zombie.network.DBTicket))
   11. [isAnswer()](#isAnswer())
   12. [setIsAnswer(boolean)](#setIsAnswer(boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DBTicket
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.DBTicket

---

public class DBTicket
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private DBTicket`

  `answer`

  `private String`

  `author`

  `private boolean`

  `isAnswer`

  `private String`

  `message`

  `private int`

  `ticketId`

  `private boolean`

  `viewed`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DBTicket(String author,
  String message,
  int ticketId)`

  `DBTicket(String author,
  String message,
  int ticketId,
  boolean viewed)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `DBTicket`

  `getAnswer()`

  `String`

  `getAuthor()`

  `String`

  `getMessage()`

  `int`

  `getTicketID()`

  `boolean`

  `isAnswer()`

  `boolean`

  `isViewed()`

  `void`

  `setAnswer(DBTicket answer)`

  `void`

  `setAuthor(String author)`

  `void`

  `setIsAnswer(boolean isAnswer)`

  `void`

  `setMessage(String message)`

  `void`

  `setTicketID(int ticketId)`

  `void`

  `setViewed(boolean viewed)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### author

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author
  + ### message

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message
  + ### ticketId

    private int ticketId
  + ### viewed

    private boolean viewed
  + ### answer

    private [DBTicket](DBTicket.html "class in zombie.network") answer
  + ### isAnswer

    private boolean isAnswer
* Constructor Details
  -------------------

  + ### DBTicket

    public DBTicket([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message,
    int ticketId)
  + ### DBTicket

    public DBTicket([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message,
    int ticketId,
    boolean viewed)
* Method Details
  --------------

  + ### getAuthor

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAuthor()
  + ### setAuthor

    public void setAuthor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author)
  + ### getMessage

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMessage()
  + ### setMessage

    public void setMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") message)
  + ### getTicketID

    public int getTicketID()
  + ### setTicketID

    public void setTicketID(int ticketId)
  + ### isViewed

    public boolean isViewed()
  + ### setViewed

    public void setViewed(boolean viewed)
  + ### getAnswer

    public [DBTicket](DBTicket.html "class in zombie.network") getAnswer()
  + ### setAnswer

    public void setAnswer([DBTicket](DBTicket.html "class in zombie.network") answer)
  + ### isAnswer

    public boolean isAnswer()
  + ### setIsAnswer

    public void setIsAnswer(boolean isAnswer)