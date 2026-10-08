[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.chat](package-summary.html)
2. [ServerChatMessage](ServerChatMessage.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [ServerChatMessage(ChatBase, String)](#%3Cinit%3E(zombie.chat.ChatBase,java.lang.String))
5. [Method Details](#method-detail)
   1. [setAuthor(String)](#setAuthor(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ServerChatMessage
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.chat.ChatMessage](ChatMessage.html "class in zombie.chat")

zombie.chat.ServerChatMessage

All Implemented Interfaces:
:   `Cloneable`

---

public class ServerChatMessage
extends [ChatMessage](ChatMessage.html "class in zombie.chat")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ServerChatMessage(ChatBase chat,
  String text)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `setAuthor(String author)`

  ### Methods inherited from class [ChatMessage](ChatMessage.html#method-summary "class in zombie.chat")

  `clone, getAuthor, getChat, getChatID, getCustomTag, getDatetime, getDatetimeStr, getRadioChannel, getText, getTextColor, getTextWithPrefix, getTextWithReplacedParentheses, isCustomColor, isFromDiscord, isLocal, isOverHeadSpeech, isScramble, isServerAlert, isServerAuthor, isShouldAttractZombies, isShowAuthor, isShowInChat, makeFromDiscord, pack, setCustomTag, setDatetime, setLocal, setOverHeadSpeech, setRadioChannel, setScrambledText, setServerAlert, setServerAuthor, setShouldAttractZombies, setShowInChat, setText, setTextColor, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Constructor Details
  -------------------

  + ### ServerChatMessage

    public ServerChatMessage([ChatBase](ChatBase.html "class in zombie.chat") chat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
* Method Details
  --------------

  + ### setAuthor

    public void setAuthor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author)

    Overrides:
    :   `setAuthor` in class `ChatMessage`