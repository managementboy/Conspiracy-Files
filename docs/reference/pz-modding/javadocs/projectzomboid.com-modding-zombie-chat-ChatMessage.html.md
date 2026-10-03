[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.chat](package-summary.html)
2. [ChatMessage](ChatMessage.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [chat](#chat)
   2. [datetime](#datetime)
   3. [author](#author)
   4. [text](#text)
   5. [scramble](#scramble)
   6. [customTag](#customTag)
   7. [textColor](#textColor)
   8. [customColor](#customColor)
   9. [overHeadSpeech](#overHeadSpeech)
   10. [showInChat](#showInChat)
   11. [fromDiscord](#fromDiscord)
   12. [serverAlert](#serverAlert)
   13. [radioChannel](#radioChannel)
   14. [local](#local)
   15. [shouldAttractZombies](#shouldAttractZombies)
   16. [serverAuthor](#serverAuthor)
6. [Constructor Details](#constructor-detail)
   1. [ChatMessage(ChatBase, String)](#%3Cinit%3E(zombie.chat.ChatBase,java.lang.String))
   2. [ChatMessage(ChatBase, LocalDateTime, String)](#%3Cinit%3E(zombie.chat.ChatBase,java.time.LocalDateTime,java.lang.String))
7. [Method Details](#method-detail)
   1. [isShouldAttractZombies()](#isShouldAttractZombies())
   2. [setShouldAttractZombies(boolean)](#setShouldAttractZombies(boolean))
   3. [isLocal()](#isLocal())
   4. [setLocal(boolean)](#setLocal(boolean))
   5. [getTextWithReplacedParentheses()](#getTextWithReplacedParentheses())
   6. [setScrambledText(String)](#setScrambledText(java.lang.String))
   7. [getRadioChannel()](#getRadioChannel())
   8. [setRadioChannel(int)](#setRadioChannel(int))
   9. [isServerAuthor()](#isServerAuthor())
   10. [setServerAuthor(boolean)](#setServerAuthor(boolean))
   11. [isFromDiscord()](#isFromDiscord())
   12. [makeFromDiscord()](#makeFromDiscord())
   13. [isOverHeadSpeech()](#isOverHeadSpeech())
   14. [setOverHeadSpeech(boolean)](#setOverHeadSpeech(boolean))
   15. [isShowInChat()](#isShowInChat())
   16. [setShowInChat(boolean)](#setShowInChat(boolean))
   17. [getDatetime()](#getDatetime())
   18. [getDatetimeStr()](#getDatetimeStr())
   19. [setDatetime(LocalDateTime)](#setDatetime(java.time.LocalDateTime))
   20. [isShowAuthor()](#isShowAuthor())
   21. [getAuthor()](#getAuthor())
   22. [setAuthor(String)](#setAuthor(java.lang.String))
   23. [getChat()](#getChat())
   24. [getChatID()](#getChatID())
   25. [getText()](#getText())
   26. [setText(String)](#setText(java.lang.String))
   27. [getTextWithPrefix()](#getTextWithPrefix())
   28. [isScramble()](#isScramble())
   29. [getCustomTag()](#getCustomTag())
   30. [setCustomTag(String)](#setCustomTag(java.lang.String))
   31. [getTextColor()](#getTextColor())
   32. [setTextColor(Color)](#setTextColor(zombie.core.Color))
   33. [isCustomColor()](#isCustomColor())
   34. [pack(ByteBufferWriter)](#pack(zombie.core.network.ByteBufferWriter))
   35. [clone()](#clone())
   36. [isServerAlert()](#isServerAlert())
   37. [setServerAlert(boolean)](#setServerAlert(boolean))
   38. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ChatMessage
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.chat.ChatMessage

All Implemented Interfaces:
:   `Cloneable`

Direct Known Subclasses:
:   `ServerChatMessage`

---

public class ChatMessage
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Cloneable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Cloneable.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `author`

  `private ChatBase`

  `chat`

  `private boolean`

  `customColor`

  `private String`

  `customTag`

  `private LocalDateTime`

  `datetime`

  `private boolean`

  `fromDiscord`

  `private boolean`

  `local`

  `private boolean`

  `overHeadSpeech`

  `private int`

  `radioChannel`

  `private boolean`

  `scramble`

  `private boolean`

  `serverAlert`

  `private boolean`

  `serverAuthor`

  `private boolean`

  `shouldAttractZombies`

  `private boolean`

  `showInChat`

  `private String`

  `text`

  `private Color`

  `textColor`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ChatMessage(ChatBase chat,
  String text)`

  `ChatMessage(ChatBase chat,
  LocalDateTime datetime,
  String text)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ChatMessage`

  `clone()`

  `String`

  `getAuthor()`

  `ChatBase`

  `getChat()`

  `int`

  `getChatID()`

  `String`

  `getCustomTag()`

  `LocalDateTime`

  `getDatetime()`

  `String`

  `getDatetimeStr()`

  `int`

  `getRadioChannel()`

  `String`

  `getText()`

  `Color`

  `getTextColor()`

  `String`

  `getTextWithPrefix()`

  `String`

  `getTextWithReplacedParentheses()`

  `boolean`

  `isCustomColor()`

  `boolean`

  `isFromDiscord()`

  `boolean`

  `isLocal()`

  `boolean`

  `isOverHeadSpeech()`

  `boolean`

  `isScramble()`

  `boolean`

  `isServerAlert()`

  `boolean`

  `isServerAuthor()`

  `boolean`

  `isShouldAttractZombies()`

  `boolean`

  `isShowAuthor()`

  `boolean`

  `isShowInChat()`

  `void`

  `makeFromDiscord()`

  `void`

  `pack(zombie.core.network.ByteBufferWriter b)`

  `void`

  `setAuthor(String author)`

  `void`

  `setCustomTag(String customTag)`

  `void`

  `setDatetime(LocalDateTime datetime)`

  `void`

  `setLocal(boolean local)`

  `void`

  `setOverHeadSpeech(boolean overHeadSpeech)`

  `void`

  `setRadioChannel(int radioChannel)`

  `void`

  `setScrambledText(String text)`

  `void`

  `setServerAlert(boolean serverAlert)`

  `void`

  `setServerAuthor(boolean serverAuthor)`

  `void`

  `setShouldAttractZombies(boolean shouldAttractZombies)`

  `void`

  `setShowInChat(boolean showInChat)`

  `void`

  `setText(String text)`

  `void`

  `setTextColor(Color textColor)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### chat

    private [ChatBase](ChatBase.html "class in zombie.chat") chat
  + ### datetime

    private [LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") datetime
  + ### author

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author
  + ### text

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text
  + ### scramble

    private boolean scramble
  + ### customTag

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customTag
  + ### textColor

    private [Color](../core/Color.html "class in zombie.core") textColor
  + ### customColor

    private boolean customColor
  + ### overHeadSpeech

    private boolean overHeadSpeech
  + ### showInChat

    private boolean showInChat
  + ### fromDiscord

    private boolean fromDiscord
  + ### serverAlert

    private boolean serverAlert
  + ### radioChannel

    private int radioChannel
  + ### local

    private boolean local
  + ### shouldAttractZombies

    private boolean shouldAttractZombies
  + ### serverAuthor

    private boolean serverAuthor
* Constructor Details
  -------------------

  + ### ChatMessage

    public ChatMessage([ChatBase](ChatBase.html "class in zombie.chat") chat,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### ChatMessage

    public ChatMessage([ChatBase](ChatBase.html "class in zombie.chat") chat,
    [LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") datetime,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
* Method Details
  --------------

  + ### isShouldAttractZombies

    public boolean isShouldAttractZombies()
  + ### setShouldAttractZombies

    public void setShouldAttractZombies(boolean shouldAttractZombies)
  + ### isLocal

    public boolean isLocal()
  + ### setLocal

    public void setLocal(boolean local)
  + ### getTextWithReplacedParentheses

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextWithReplacedParentheses()
  + ### setScrambledText

    public void setScrambledText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### getRadioChannel

    public int getRadioChannel()
  + ### setRadioChannel

    public void setRadioChannel(int radioChannel)
  + ### isServerAuthor

    public boolean isServerAuthor()
  + ### setServerAuthor

    public void setServerAuthor(boolean serverAuthor)
  + ### isFromDiscord

    public boolean isFromDiscord()
  + ### makeFromDiscord

    public void makeFromDiscord()
  + ### isOverHeadSpeech

    public boolean isOverHeadSpeech()
  + ### setOverHeadSpeech

    public void setOverHeadSpeech(boolean overHeadSpeech)
  + ### isShowInChat

    public boolean isShowInChat()
  + ### setShowInChat

    public void setShowInChat(boolean showInChat)
  + ### getDatetime

    public [LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") getDatetime()
  + ### getDatetimeStr

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDatetimeStr()
  + ### setDatetime

    public void setDatetime([LocalDateTime](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/time/LocalDateTime.html "class or interface in java.time") datetime)
  + ### isShowAuthor

    public boolean isShowAuthor()
  + ### getAuthor

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAuthor()
  + ### setAuthor

    public void setAuthor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author)
  + ### getChat

    public [ChatBase](ChatBase.html "class in zombie.chat") getChat()
  + ### getChatID

    public int getChatID()
  + ### getText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getText()
  + ### setText

    public void setText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### getTextWithPrefix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextWithPrefix()
  + ### isScramble

    public boolean isScramble()
  + ### getCustomTag

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomTag()
  + ### setCustomTag

    public void setCustomTag([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customTag)
  + ### getTextColor

    public [Color](../core/Color.html "class in zombie.core") getTextColor()
  + ### setTextColor

    public void setTextColor([Color](../core/Color.html "class in zombie.core") textColor)
  + ### isCustomColor

    public boolean isCustomColor()
  + ### pack

    public void pack(zombie.core.network.ByteBufferWriter b)
  + ### clone

    public [ChatMessage](ChatMessage.html "class in zombie.chat") clone()

    Overrides:
    :   `clone` in class `Object`
  + ### isServerAlert

    public boolean isServerAlert()
  + ### setServerAlert

    public void setServerAlert(boolean serverAlert)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`