[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.network.chat](package-summary.html)
2. [ChatServer](ChatServer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [availableChatsID](#availableChatsID)
   3. [lastChatId](#lastChatId)
   4. [defaultChats](#defaultChats)
   5. [chats](#chats)
   6. [factionChats](#factionChats)
   7. [safehouseChats](#safehouseChats)
   8. [adminChat](#adminChat)
   9. [generalChat](#generalChat)
   10. [serverChat](#serverChat)
   11. [radioChat](#radioChat)
   12. [inited](#inited)
   13. [players](#players)
   14. [logName](#logName)
   15. [logger](#logger)
   16. [tabs](#tabs)
   17. [mainTabID](#mainTabID)
   18. [adminTabID](#adminTabID)
6. [Constructor Details](#constructor-detail)
   1. [ChatServer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [isInited()](#isInited())
   3. [init()](#init())
   4. [initPlayer(short)](#initPlayer(short))
   5. [processMessageFromPlayerPacket(ByteBufferReader, UdpConnection)](#processMessageFromPlayerPacket(zombie.core.network.ByteBufferReader,zombie.core.raknet.UdpConnection))
   6. [processPlayerStartWhisperChatPacket(ByteBufferReader)](#processPlayerStartWhisperChatPacket(zombie.core.network.ByteBufferReader))
   7. [sendPlayerNotFoundMessage(UdpConnection, String)](#sendPlayerNotFoundMessage(zombie.core.raknet.UdpConnection,java.lang.String))
   8. [unpackChatMessage(ByteBufferReader)](#unpackChatMessage(zombie.core.network.ByteBufferReader))
   9. [disconnectPlayer(short)](#disconnectPlayer(short))
   10. [closeChat(int)](#closeChat(int))
   11. [joinAdminChat(short)](#joinAdminChat(short))
   12. [leaveAdminChat(short)](#leaveAdminChat(short))
   13. [createFactionChat(String)](#createFactionChat(java.lang.String))
   14. [createSafehouseChat(String)](#createSafehouseChat(java.lang.String))
   15. [removeFactionChat(String)](#removeFactionChat(java.lang.String))
   16. [removeSafehouseChat(String)](#removeSafehouseChat(java.lang.String))
   17. [syncFactionChatMembers(String, String, ArrayList)](#syncFactionChatMembers(java.lang.String,java.lang.String,java.util.ArrayList))
   18. [syncSafehouseChatMembers(String, String, ArrayList)](#syncSafehouseChatMembers(java.lang.String,java.lang.String,java.util.ArrayList))
   19. [addMemberToSafehouseChat(String, short)](#addMemberToSafehouseChat(java.lang.String,short))
   20. [addMemberToFactionChat(String, short)](#addMemberToFactionChat(java.lang.String,short))
   21. [sendServerAlertMessageToServerChat(String, String)](#sendServerAlertMessageToServerChat(java.lang.String,java.lang.String))
   22. [sendServerAlertMessageToServerChat(String)](#sendServerAlertMessageToServerChat(java.lang.String))
   23. [createRadiostationMessage(String, int)](#createRadiostationMessage(java.lang.String,int))
   24. [sendMessageToServerChat(UdpConnection, String)](#sendMessageToServerChat(zombie.core.raknet.UdpConnection,java.lang.String))
   25. [sendMessageToServerChat(String)](#sendMessageToServerChat(java.lang.String))
   26. [sendMessageFromDiscordToGeneralChat(String, String)](#sendMessageFromDiscordToGeneralChat(java.lang.String,java.lang.String))
   27. [getNextChatID()](#getNextChatID())
   28. [sendMessage(ChatMessage)](#sendMessage(zombie.chat.ChatMessage))
   29. [sendInitPlayerChatPacket(UdpConnection)](#sendInitPlayerChatPacket(zombie.core.raknet.UdpConnection))
   30. [addDefaultChats(short)](#addDefaultChats(short))
   31. [sendMessageToAdminChat(String)](#sendMessageToAdminChat(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ChatServer
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.chat.ChatServer

---

public class ChatServer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static zombie.chat.defaultChats.AdminChat`

  `adminChat`

  `private static final String`

  `adminTabID`

  `private static final Stack<Integer>`

  `availableChatsID`

  `private static final ConcurrentHashMap<Integer,ChatBase>`

  `chats`

  `private static final HashMap<zombie.network.chat.ChatType, ChatBase>`

  `defaultChats`

  `private static final ConcurrentHashMap<String, zombie.chat.defaultChats.FactionChat>`

  `factionChats`

  `private static zombie.chat.defaultChats.GeneralChat`

  `generalChat`

  `private static boolean`

  `inited`

  `private static ChatServer`

  `instance`

  `private static int`

  `lastChatId`

  `private static ZLogger`

  `logger`

  `private static final String`

  `logName`

  `private static final String`

  `mainTabID`

  `private static final HashSet<Short>`

  `players`

  `private static zombie.chat.defaultChats.RadioChat`

  `radioChat`

  `private static final ConcurrentHashMap<String, zombie.chat.defaultChats.SafehouseChat>`

  `safehouseChats`

  `private static zombie.chat.defaultChats.ServerChat`

  `serverChat`

  `private static final HashMap<String, zombie.chat.ChatTab>`

  `tabs`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ChatServer()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addDefaultChats(short playerID)`

  `private void`

  `addMemberToFactionChat(String factionName,
  short playerID)`

  `private void`

  `addMemberToSafehouseChat(String safehouseID,
  short playerID)`

  `private void`

  `closeChat(int chatID)`

  `zombie.chat.defaultChats.FactionChat`

  `createFactionChat(String name)`

  `ChatMessage`

  `createRadiostationMessage(String text,
  int radioChannel)`

  `zombie.chat.defaultChats.SafehouseChat`

  `createSafehouseChat(String safehouseID)`

  `void`

  `disconnectPlayer(short playerID)`

  `static ChatServer`

  `getInstance()`

  `private int`

  `getNextChatID()`

  `void`

  `init()`

  `void`

  `initPlayer(short playerID)`

  `static boolean`

  `isInited()`

  `void`

  `joinAdminChat(short playerID)`

  `void`

  `leaveAdminChat(short playerID)`

  `void`

  `processMessageFromPlayerPacket(zombie.core.network.ByteBufferReader bb,
  zombie.core.raknet.UdpConnection connection)`

  `void`

  `processPlayerStartWhisperChatPacket(zombie.core.network.ByteBufferReader bb)`

  `void`

  `removeFactionChat(String factionName)`

  `void`

  `removeSafehouseChat(String safehouseName)`

  `private void`

  `sendInitPlayerChatPacket(zombie.core.raknet.UdpConnection connection)`

  `private void`

  `sendMessage(ChatMessage msg)`

  `void`

  `sendMessageFromDiscordToGeneralChat(String author,
  String msg)`

  `void`

  `sendMessageToAdminChat(String msg)`

  `void`

  `sendMessageToServerChat(String msg)`

  `void`

  `sendMessageToServerChat(zombie.core.raknet.UdpConnection connection,
  String msg)`

  `private void`

  `sendPlayerNotFoundMessage(zombie.core.raknet.UdpConnection connection,
  String destPlayerName)`

  `void`

  `sendServerAlertMessageToServerChat(String msg)`

  `void`

  `sendServerAlertMessageToServerChat(String author,
  String msg)`

  `void`

  `syncFactionChatMembers(String factionName,
  String factionOwner,
  ArrayList<String> players)`

  `void`

  `syncSafehouseChatMembers(String safehouseID,
  String safehouseOwner,
  ArrayList<String> players)`

  `ChatMessage`

  `unpackChatMessage(zombie.core.network.ByteBufferReader bb)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [ChatServer](ChatServer.html "class in zombie.network.chat") instance
  + ### availableChatsID

    private static final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> availableChatsID
  + ### lastChatId

    private static int lastChatId
  + ### defaultChats

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<zombie.network.chat.ChatType, [ChatBase](../../chat/ChatBase.html "class in zombie.chat")> defaultChats
  + ### chats

    private static final [ConcurrentHashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentHashMap.html "class or interface in java.util.concurrent")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[ChatBase](../../chat/ChatBase.html "class in zombie.chat")> chats
  + ### factionChats

    private static final [ConcurrentHashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentHashMap.html "class or interface in java.util.concurrent")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.chat.defaultChats.FactionChat> factionChats
  + ### safehouseChats

    private static final [ConcurrentHashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentHashMap.html "class or interface in java.util.concurrent")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.chat.defaultChats.SafehouseChat> safehouseChats
  + ### adminChat

    private static zombie.chat.defaultChats.AdminChat adminChat
  + ### generalChat

    private static zombie.chat.defaultChats.GeneralChat generalChat
  + ### serverChat

    private static zombie.chat.defaultChats.ServerChat serverChat
  + ### radioChat

    private static zombie.chat.defaultChats.RadioChat radioChat
  + ### inited

    private static boolean inited
  + ### players

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang")> players
  + ### logName

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logName

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.chat.ChatServer.logName)
  + ### logger

    private static [ZLogger](../../core/logger/ZLogger.html "class in zombie.core.logger") logger
  + ### tabs

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.chat.ChatTab> tabs
  + ### mainTabID

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mainTabID

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.chat.ChatServer.mainTabID)
  + ### adminTabID

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") adminTabID

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.chat.ChatServer.adminTabID)
* Constructor Details
  -------------------

  + ### ChatServer

    private ChatServer()
* Method Details
  --------------

  + ### getInstance

    public static [ChatServer](ChatServer.html "class in zombie.network.chat") getInstance()
  + ### isInited

    public static boolean isInited()
  + ### init

    public void init()
  + ### initPlayer

    public void initPlayer(short playerID)
  + ### processMessageFromPlayerPacket

    public void processMessageFromPlayerPacket(zombie.core.network.ByteBufferReader bb,
    zombie.core.raknet.UdpConnection connection)
  + ### processPlayerStartWhisperChatPacket

    public void processPlayerStartWhisperChatPacket(zombie.core.network.ByteBufferReader bb)
  + ### sendPlayerNotFoundMessage

    private void sendPlayerNotFoundMessage(zombie.core.raknet.UdpConnection connection,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") destPlayerName)
  + ### unpackChatMessage

    public [ChatMessage](../../chat/ChatMessage.html "class in zombie.chat") unpackChatMessage(zombie.core.network.ByteBufferReader bb)
  + ### disconnectPlayer

    public void disconnectPlayer(short playerID)
  + ### closeChat

    private void closeChat(int chatID)
  + ### joinAdminChat

    public void joinAdminChat(short playerID)
  + ### leaveAdminChat

    public void leaveAdminChat(short playerID)
  + ### createFactionChat

    public zombie.chat.defaultChats.FactionChat createFactionChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### createSafehouseChat

    public zombie.chat.defaultChats.SafehouseChat createSafehouseChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") safehouseID)
  + ### removeFactionChat

    public void removeFactionChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") factionName)
  + ### removeSafehouseChat

    public void removeSafehouseChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") safehouseName)
  + ### syncFactionChatMembers

    public void syncFactionChatMembers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") factionName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") factionOwner,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> players)
  + ### syncSafehouseChatMembers

    public void syncSafehouseChatMembers([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") safehouseID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") safehouseOwner,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> players)
  + ### addMemberToSafehouseChat

    private void addMemberToSafehouseChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") safehouseID,
    short playerID)
  + ### addMemberToFactionChat

    private void addMemberToFactionChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") factionName,
    short playerID)
  + ### sendServerAlertMessageToServerChat

    public void sendServerAlertMessageToServerChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### sendServerAlertMessageToServerChat

    public void sendServerAlertMessageToServerChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### createRadiostationMessage

    public [ChatMessage](../../chat/ChatMessage.html "class in zombie.chat") createRadiostationMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    int radioChannel)
  + ### sendMessageToServerChat

    public void sendMessageToServerChat(zombie.core.raknet.UdpConnection connection,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### sendMessageToServerChat

    public void sendMessageToServerChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### sendMessageFromDiscordToGeneralChat

    public void sendMessageFromDiscordToGeneralChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)
  + ### getNextChatID

    private int getNextChatID()
  + ### sendMessage

    private void sendMessage([ChatMessage](../../chat/ChatMessage.html "class in zombie.chat") msg)
  + ### sendInitPlayerChatPacket

    private void sendInitPlayerChatPacket(zombie.core.raknet.UdpConnection connection)
  + ### addDefaultChats

    private void addDefaultChats(short playerID)
  + ### sendMessageToAdminChat

    public void sendMessageToAdminChat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") msg)