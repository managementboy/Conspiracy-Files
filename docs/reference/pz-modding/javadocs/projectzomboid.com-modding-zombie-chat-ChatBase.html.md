[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.chat](package-summary.html)
2. [ChatBase](ChatBase.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [ID\_NOT\_SET](#ID_NOT_SET)
   2. [id](#id)
   3. [titleId](#titleId)
   4. [type](#type)
   5. [settings](#settings)
   6. [customSettings](#customSettings)
   7. [chatTab](#chatTab)
   8. [translatedTitle](#translatedTitle)
   9. [members](#members)
   10. [justAddedMembers](#justAddedMembers)
   11. [justRemovedMembers](#justRemovedMembers)
   12. [messages](#messages)
   13. [serverConnection](#serverConnection)
   14. [mode](#mode)
   15. [chatOwner](#chatOwner)
   16. [memberLock](#memberLock)
6. [Constructor Details](#constructor-detail)
   1. [ChatBase(ChatType)](#%3Cinit%3E(zombie.network.chat.ChatType))
   2. [ChatBase(ByteBufferReader, ChatType, ChatTab, IsoPlayer)](#%3Cinit%3E(zombie.core.network.ByteBufferReader,zombie.network.chat.ChatType,zombie.chat.ChatTab,zombie.characters.IsoPlayer))
   3. [ChatBase(int, ChatType, ChatTab)](#%3Cinit%3E(int,zombie.network.chat.ChatType,zombie.chat.ChatTab))
7. [Method Details](#method-detail)
   1. [isEnabled()](#isEnabled())
   2. [getChatOwnerName()](#getChatOwnerName())
   3. [getChatOwner()](#getChatOwner())
   4. [getMode()](#getMode())
   5. [getType()](#getType())
   6. [getID()](#getID())
   7. [getTitleID()](#getTitleID())
   8. [getColor()](#getColor())
   9. [getTabID()](#getTabID())
   10. [getRange()](#getRange())
   11. [isSendingToRadio()](#isSendingToRadio())
   12. [getZombieAttractionRange()](#getZombieAttractionRange())
   13. [setSettings(ChatSettings)](#setSettings(zombie.chat.ChatSettings))
   14. [setFontSize(String)](#setFontSize(java.lang.String))
   15. [setShowTimestamp(boolean)](#setShowTimestamp(boolean))
   16. [setShowTitle(boolean)](#setShowTitle(boolean))
   17. [isCustomSettings()](#isCustomSettings())
   18. [isAllowImages()](#isAllowImages())
   19. [isAllowChatIcons()](#isAllowChatIcons())
   20. [isAllowColors()](#isAllowColors())
   21. [isAllowFonts()](#isAllowFonts())
   22. [isAllowBBcode()](#isAllowBBcode())
   23. [isEqualizeLineHeights()](#isEqualizeLineHeights())
   24. [isShowAuthor()](#isShowAuthor())
   25. [isShowTimestamp()](#isShowTimestamp())
   26. [isShowTitle()](#isShowTitle())
   27. [getFontSize()](#getFontSize())
   28. [getTitle()](#getTitle())
   29. [close()](#close())
   30. [packChat(ByteBufferWriter)](#packChat(zombie.core.network.ByteBufferWriter))
   31. [unpackMessage(ByteBufferReader)](#unpackMessage(zombie.core.network.ByteBufferReader))
   32. [packMessage(ByteBufferWriter, ChatMessage)](#packMessage(zombie.core.network.ByteBufferWriter,zombie.chat.ChatMessage))
   33. [createMessage(String)](#createMessage(java.lang.String))
   34. [createMessage(String, String)](#createMessage(java.lang.String,java.lang.String))
   35. [createServerMessage(String)](#createServerMessage(java.lang.String))
   36. [showMessage(String, String)](#showMessage(java.lang.String,java.lang.String))
   37. [showMessage(ChatMessage)](#showMessage(zombie.chat.ChatMessage))
   38. [getMessageTextWithPrefix(ChatMessage)](#getMessageTextWithPrefix(zombie.chat.ChatMessage))
   39. [sendMessageToChatMembers(ChatMessage)](#sendMessageToChatMembers(zombie.chat.ChatMessage))
   40. [sendMessageToChatMembers(ServerChatMessage)](#sendMessageToChatMembers(zombie.chat.ServerChatMessage))
   41. [sendMessageToPlayer(UdpConnection, ChatMessage)](#sendMessageToPlayer(zombie.core.raknet.UdpConnection,zombie.chat.ChatMessage))
   42. [sendMessageToPlayer(short, ChatMessage)](#sendMessageToPlayer(short,zombie.chat.ChatMessage))
   43. [getMessagePrefix(ChatMessage)](#getMessagePrefix(zombie.chat.ChatMessage))
   44. [getColorTag()](#getColorTag())
   45. [getColorTag(Color)](#getColorTag(zombie.core.Color))
   46. [getFontSizeTag()](#getFontSizeTag())
   47. [getChatSettingsTags()](#getChatSettingsTags())
   48. [addMember(short)](#addMember(short))
   49. [leaveMember(Short)](#leaveMember(java.lang.Short))
   50. [hasMember(Short)](#hasMember(java.lang.Short))
   51. [removeMember(Short)](#removeMember(java.lang.Short))
   52. [syncMembersByUsernames(ArrayList)](#syncMembersByUsernames(java.util.ArrayList))
   53. [getJustAddedMembers()](#getJustAddedMembers())
   54. [getJustRemovedMembers()](#getJustRemovedMembers())
   55. [syncMembers(ArrayList)](#syncMembers(java.util.ArrayList))
   56. [sendPlayerJoinChatPacket(UdpConnection)](#sendPlayerJoinChatPacket(zombie.core.raknet.UdpConnection))
   57. [sendPlayerLeaveChatPacket(short)](#sendPlayerLeaveChatPacket(short))
   58. [sendPlayerLeaveChatPacket(UdpConnection)](#sendPlayerLeaveChatPacket(zombie.core.raknet.UdpConnection))
   59. [sendToServer(ChatMessage, DeviceData)](#sendToServer(zombie.chat.ChatMessage,zombie.radio.devices.DeviceData))
   60. [sendChatMessageToPlayer(UdpConnection, ChatMessage)](#sendChatMessageToPlayer(zombie.core.raknet.UdpConnection,zombie.chat.ChatMessage))
   61. [sendChatMessageFromPlayer(UdpConnection, ChatMessage)](#sendChatMessageFromPlayer(zombie.core.raknet.UdpConnection,zombie.chat.ChatMessage))
   62. [hasChatTab()](#hasChatTab())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ChatBase
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.chat.ChatBase

---

public abstract class ChatBase
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private IsoPlayer`

  `chatOwner`

  `private zombie.chat.ChatTab`

  `chatTab`

  `private boolean`

  `customSettings`

  `private int`

  `id`

  `private static final int`

  `ID_NOT_SET`

  `private final ArrayList<Short>`

  `justAddedMembers`

  `private final ArrayList<Short>`

  `justRemovedMembers`

  `private final Lock`

  `memberLock`

  `protected final ArrayList<Short>`

  `members`

  `protected final ArrayList<ChatMessage>`

  `messages`

  `private zombie.chat.ChatMode`

  `mode`

  `private zombie.core.raknet.UdpConnection`

  `serverConnection`

  `private zombie.chat.ChatSettings`

  `settings`

  `private final String`

  `titleId`

  `private String`

  `translatedTitle`

  `private final zombie.network.chat.ChatType`

  `type`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `ChatBase(int id,
  zombie.network.chat.ChatType type,
  zombie.chat.ChatTab tab)`

  Should be called only on server side of chat system

  `ChatBase(zombie.core.network.ByteBufferReader bb,
  zombie.network.chat.ChatType type,
  zombie.chat.ChatTab tab,
  IsoPlayer owner)`

  Should called only on client side of chat system

  `protected`

  `ChatBase(zombie.network.chat.ChatType type)`

  Base constructor and constructor for single player
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addMember(short playerID)`

  `void`

  `close()`

  `ChatMessage`

  `createMessage(String text)`

  Message creator.

  `private ChatMessage`

  `createMessage(String author,
  String text)`

  `ServerChatMessage`

  `createServerMessage(String text)`

  `protected IsoPlayer`

  `getChatOwner()`

  `protected String`

  `getChatOwnerName()`

  `protected String`

  `getChatSettingsTags()`

  `Color`

  `getColor()`

  `protected String`

  `getColorTag()`

  `protected String`

  `getColorTag(Color color)`

  `protected String`

  `getFontSize()`

  `protected String`

  `getFontSizeTag()`

  `int`

  `getID()`

  `ArrayList<Short>`

  `getJustAddedMembers()`

  `ArrayList<Short>`

  `getJustRemovedMembers()`

  `String`

  `getMessagePrefix(ChatMessage msg)`

  `String`

  `getMessageTextWithPrefix(ChatMessage msg)`

  `zombie.chat.ChatMode`

  `getMode()`

  `float`

  `getRange()`

  `short`

  `getTabID()`

  `protected String`

  `getTitle()`

  `String`

  `getTitleID()`

  `zombie.network.chat.ChatType`

  `getType()`

  `float`

  `getZombieAttractionRange()`

  `protected boolean`

  `hasChatTab()`

  `private boolean`

  `hasMember(Short playerID)`

  `protected boolean`

  `isAllowBBcode()`

  `protected boolean`

  `isAllowChatIcons()`

  `protected boolean`

  `isAllowColors()`

  `protected boolean`

  `isAllowFonts()`

  `protected boolean`

  `isAllowImages()`

  `protected boolean`

  `isCustomSettings()`

  `boolean`

  `isEnabled()`

  `protected boolean`

  `isEqualizeLineHeights()`

  `boolean`

  `isSendingToRadio()`

  `protected boolean`

  `isShowAuthor()`

  `protected boolean`

  `isShowTimestamp()`

  `protected boolean`

  `isShowTitle()`

  `void`

  `leaveMember(Short playerID)`

  `protected void`

  `packChat(zombie.core.network.ByteBufferWriter b)`

  `void`

  `packMessage(zombie.core.network.ByteBufferWriter b,
  ChatMessage msg)`

  `void`

  `removeMember(Short playerID)`

  `private void`

  `sendChatMessageFromPlayer(zombie.core.raknet.UdpConnection connection,
  ChatMessage msg)`

  `private void`

  `sendChatMessageToPlayer(zombie.core.raknet.UdpConnection connection,
  ChatMessage msg)`

  `void`

  `sendMessageToChatMembers(ChatMessage msg)`

  `void`

  `sendMessageToChatMembers(ServerChatMessage msg)`

  `void`

  `sendMessageToPlayer(short playerID,
  ChatMessage msg)`

  `void`

  `sendMessageToPlayer(zombie.core.raknet.UdpConnection connection,
  ChatMessage msg)`

  `void`

  `sendPlayerJoinChatPacket(zombie.core.raknet.UdpConnection playerConnection)`

  `void`

  `sendPlayerLeaveChatPacket(short playerID)`

  `void`

  `sendPlayerLeaveChatPacket(zombie.core.raknet.UdpConnection connection)`

  `void`

  `sendToServer(ChatMessage msg,
  DeviceData deviceData)`

  `void`

  `setFontSize(String fontSize)`

  `void`

  `setSettings(zombie.chat.ChatSettings settings)`

  `void`

  `setShowTimestamp(boolean showTimestamp)`

  `void`

  `setShowTitle(boolean showTitle)`

  `void`

  `showMessage(String text,
  String author)`

  `void`

  `showMessage(ChatMessage msg)`

  `private void`

  `syncMembers(ArrayList<Short> actualMembers)`

  `void`

  `syncMembersByUsernames(ArrayList<String> players)`

  `ChatMessage`

  `unpackMessage(zombie.core.network.ByteBufferReader bb)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### ID\_NOT\_SET

    private static final int ID\_NOT\_SET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.chat.ChatBase.ID_NOT_SET)
  + ### id

    private int id
  + ### titleId

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") titleId
  + ### type

    private final zombie.network.chat.ChatType type
  + ### settings

    private zombie.chat.ChatSettings settings
  + ### customSettings

    private boolean customSettings
  + ### chatTab

    private zombie.chat.ChatTab chatTab
  + ### translatedTitle

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translatedTitle
  + ### members

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang")> members
  + ### justAddedMembers

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang")> justAddedMembers
  + ### justRemovedMembers

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang")> justRemovedMembers
  + ### messages

    protected final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ChatMessage](ChatMessage.html "class in zombie.chat")> messages
  + ### serverConnection

    private zombie.core.raknet.UdpConnection serverConnection
  + ### mode

    private zombie.chat.ChatMode mode
  + ### chatOwner

    private [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") chatOwner
  + ### memberLock

    private final [Lock](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/locks/Lock.html "class or interface in java.util.concurrent.locks") memberLock
* Constructor Details
  -------------------

  + ### ChatBase

    protected ChatBase(zombie.network.chat.ChatType type)

    Base constructor and constructor for single player

    Parameters:
    :   `type` - meta information about chat. Many parameters depends on that
  + ### ChatBase

    public ChatBase(zombie.core.network.ByteBufferReader bb,
    zombie.network.chat.ChatType type,
    zombie.chat.ChatTab tab,
    [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") owner)

    Should called only on client side of chat system

    Parameters:
    :   `bb` - package from server that describe how chat should look and work
    :   `type` - meta information about chat. Many parameters depends on that
    :   `tab` - tab where chat should show their info
    :   `owner` - actual player instance
  + ### ChatBase

    public ChatBase(int id,
    zombie.network.chat.ChatType type,
    zombie.chat.ChatTab tab)

    Should be called only on server side of chat system

    Parameters:
    :   `id` - unique id of chat. It will be used to identify chat in client-server communication
    :   `type` - meta information about chat. Many parameters depends on that
    :   `tab` - this tab will transferred to clients when it will connecting
* Method Details
  --------------

  + ### isEnabled

    public boolean isEnabled()
  + ### getChatOwnerName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getChatOwnerName()
  + ### getChatOwner

    protected [IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") getChatOwner()
  + ### getMode

    public zombie.chat.ChatMode getMode()
  + ### getType

    public zombie.network.chat.ChatType getType()
  + ### getID

    public int getID()
  + ### getTitleID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitleID()
  + ### getColor

    public [Color](../core/Color.html "class in zombie.core") getColor()
  + ### getTabID

    public short getTabID()
  + ### getRange

    public float getRange()
  + ### isSendingToRadio

    public boolean isSendingToRadio()
  + ### getZombieAttractionRange

    public float getZombieAttractionRange()
  + ### setSettings

    public void setSettings(zombie.chat.ChatSettings settings)
  + ### setFontSize

    public void setFontSize([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fontSize)
  + ### setShowTimestamp

    public void setShowTimestamp(boolean showTimestamp)
  + ### setShowTitle

    public void setShowTitle(boolean showTitle)
  + ### isCustomSettings

    protected boolean isCustomSettings()
  + ### isAllowImages

    protected boolean isAllowImages()
  + ### isAllowChatIcons

    protected boolean isAllowChatIcons()
  + ### isAllowColors

    protected boolean isAllowColors()
  + ### isAllowFonts

    protected boolean isAllowFonts()
  + ### isAllowBBcode

    protected boolean isAllowBBcode()
  + ### isEqualizeLineHeights

    protected boolean isEqualizeLineHeights()
  + ### isShowAuthor

    protected boolean isShowAuthor()
  + ### isShowTimestamp

    protected boolean isShowTimestamp()
  + ### isShowTitle

    protected boolean isShowTitle()
  + ### getFontSize

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFontSize()
  + ### getTitle

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitle()
  + ### close

    public void close()
  + ### packChat

    protected void packChat(zombie.core.network.ByteBufferWriter b)
  + ### unpackMessage

    public [ChatMessage](ChatMessage.html "class in zombie.chat") unpackMessage(zombie.core.network.ByteBufferReader bb)
  + ### packMessage

    public void packMessage(zombie.core.network.ByteBufferWriter b,
    [ChatMessage](ChatMessage.html "class in zombie.chat") msg)
  + ### createMessage

    public [ChatMessage](ChatMessage.html "class in zombie.chat") createMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)

    Message creator. Every chat know how to create its own message

    Parameters:
    :   `text` - text of the message

    Returns:
    :   corresponding object to message
  + ### createMessage

    private [ChatMessage](ChatMessage.html "class in zombie.chat") createMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### createServerMessage

    public [ServerChatMessage](ServerChatMessage.html "class in zombie.chat") createServerMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### showMessage

    public void showMessage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author)
  + ### showMessage

    public void showMessage([ChatMessage](ChatMessage.html "class in zombie.chat") msg)
  + ### getMessageTextWithPrefix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMessageTextWithPrefix([ChatMessage](ChatMessage.html "class in zombie.chat") msg)
  + ### sendMessageToChatMembers

    public void sendMessageToChatMembers([ChatMessage](ChatMessage.html "class in zombie.chat") msg)
  + ### sendMessageToChatMembers

    public void sendMessageToChatMembers([ServerChatMessage](ServerChatMessage.html "class in zombie.chat") msg)
  + ### sendMessageToPlayer

    public void sendMessageToPlayer(zombie.core.raknet.UdpConnection connection,
    [ChatMessage](ChatMessage.html "class in zombie.chat") msg)
  + ### sendMessageToPlayer

    public void sendMessageToPlayer(short playerID,
    [ChatMessage](ChatMessage.html "class in zombie.chat") msg)
  + ### getMessagePrefix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMessagePrefix([ChatMessage](ChatMessage.html "class in zombie.chat") msg)
  + ### getColorTag

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getColorTag()
  + ### getColorTag

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getColorTag([Color](../core/Color.html "class in zombie.core") color)
  + ### getFontSizeTag

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFontSizeTag()
  + ### getChatSettingsTags

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getChatSettingsTags()
  + ### addMember

    public void addMember(short playerID)
  + ### leaveMember

    public void leaveMember([Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang") playerID)
  + ### hasMember

    private boolean hasMember([Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang") playerID)
  + ### removeMember

    public void removeMember([Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang") playerID)
  + ### syncMembersByUsernames

    public void syncMembersByUsernames([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> players)
  + ### getJustAddedMembers

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang")> getJustAddedMembers()
  + ### getJustRemovedMembers

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang")> getJustRemovedMembers()
  + ### syncMembers

    private void syncMembers([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang")> actualMembers)
  + ### sendPlayerJoinChatPacket

    public void sendPlayerJoinChatPacket(zombie.core.raknet.UdpConnection playerConnection)
  + ### sendPlayerLeaveChatPacket

    public void sendPlayerLeaveChatPacket(short playerID)
  + ### sendPlayerLeaveChatPacket

    public void sendPlayerLeaveChatPacket(zombie.core.raknet.UdpConnection connection)
  + ### sendToServer

    public void sendToServer([ChatMessage](ChatMessage.html "class in zombie.chat") msg,
    [DeviceData](../radio/devices/DeviceData.html "class in zombie.radio.devices") deviceData)
  + ### sendChatMessageToPlayer

    private void sendChatMessageToPlayer(zombie.core.raknet.UdpConnection connection,
    [ChatMessage](ChatMessage.html "class in zombie.chat") msg)
  + ### sendChatMessageFromPlayer

    private void sendChatMessageFromPlayer(zombie.core.raknet.UdpConnection connection,
    [ChatMessage](ChatMessage.html "class in zombie.chat") msg)
  + ### hasChatTab

    protected boolean hasChatTab()