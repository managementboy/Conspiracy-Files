[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.media](package-summary.html)
2. [RecordedMedia](RecordedMedia.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [disableLineLearning](#disableLineLearning)
   2. [SPAWN\_COMMON](#SPAWN_COMMON)
   3. [SPAWN\_RARE](#SPAWN_RARE)
   4. [SPAWN\_EXCEPTIONAL](#SPAWN_EXCEPTIONAL)
   5. [VERSION1](#VERSION1)
   6. [VERSION2](#VERSION2)
   7. [VERSION](#VERSION)
   8. [SAVE\_FILE](#SAVE_FILE)
   9. [indexes](#indexes)
   10. [indexesFromServer](#indexesFromServer)
   11. [mediaDataMap](#mediaDataMap)
   12. [categorizedMap](#categorizedMap)
   13. [categories](#categories)
   14. [legacyListenedLines](#legacyListenedLines)
   15. [homeVhsSpawned](#homeVhsSpawned)
   16. [retailVhsSpawnTable](#retailVhsSpawnTable)
   17. [retailCdSpawnTable](#retailCdSpawnTable)
   18. [requiresSaving](#requiresSaving)
7. [Constructor Details](#constructor-detail)
   1. [RecordedMedia()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [init()](#init())
   2. [getMediaTypeForCategory(String)](#getMediaTypeForCategory(java.lang.String))
   3. [getCategories()](#getCategories())
   4. [getAllMediaForType(byte)](#getAllMediaForType(byte))
   5. [getAllMediaForCategory(String)](#getAllMediaForCategory(java.lang.String))
   6. [register(String, String, String, int)](#register(java.lang.String,java.lang.String,java.lang.String,int))
   7. [getMediaDataFromIndex(short)](#getMediaDataFromIndex(short))
   8. [getIndexForMediaData(MediaData)](#getIndexForMediaData(zombie.radio.media.MediaData))
   9. [getMediaData(String)](#getMediaData(java.lang.String))
   10. [getRandomFromCategory(String)](#getRandomFromCategory(java.lang.String))
   11. [load()](#load())
   12. [save()](#save())
   13. [toAscii(String)](#toAscii(java.lang.String))
   14. [hasListenedToLine(IsoPlayer, String)](#hasListenedToLine(zombie.characters.IsoPlayer,java.lang.String))
   15. [hasListenedToAll(IsoPlayer, MediaData)](#hasListenedToAll(zombie.characters.IsoPlayer,zombie.radio.media.MediaData))
   16. [sendRequestData(ByteBuffer)](#sendRequestData(java.nio.ByteBuffer))
   17. [receiveRequestData(ByteBufferReader)](#receiveRequestData(zombie.core.network.ByteBufferReader))
   18. [handleLegacyListenedLines(IsoPlayer)](#handleLegacyListenedLines(zombie.characters.IsoPlayer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RecordedMedia
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.media.RecordedMedia

---

public class RecordedMedia
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `RecordedMedia.MediaNameSorter`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<String>`

  `categories`

  `private final Map<String, ArrayList<MediaData>>`

  `categorizedMap`

  `static boolean`

  `disableLineLearning`

  `private final HashSet<Short>`

  `homeVhsSpawned`

  `private final ArrayList<String>`

  `indexes`

  `private static final ArrayList<String>`

  `indexesFromServer`

  `private final ArrayList<String>`

  `legacyListenedLines`

  `private final Map<String, MediaData>`

  `mediaDataMap`

  `private boolean`

  `requiresSaving`

  `private final Map<Integer, ArrayList<MediaData>>`

  `retailCdSpawnTable`

  `private final Map<Integer, ArrayList<MediaData>>`

  `retailVhsSpawnTable`

  `static final String`

  `SAVE_FILE`

  `private static final int`

  `SPAWN_COMMON`

  `private static final int`

  `SPAWN_EXCEPTIONAL`

  `private static final int`

  `SPAWN_RARE`

  `static final int`

  `VERSION`

  `static final int`

  `VERSION1`

  `static final int`

  `VERSION2`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RecordedMedia()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ArrayList<MediaData>`

  `getAllMediaForCategory(String category)`

  `ArrayList<MediaData>`

  `getAllMediaForType(byte type)`

  `ArrayList<String>`

  `getCategories()`

  `short`

  `getIndexForMediaData(MediaData data)`

  `MediaData`

  `getMediaData(String id)`

  `MediaData`

  `getMediaDataFromIndex(short index)`

  `static byte`

  `getMediaTypeForCategory(String category)`

  `MediaData`

  `getRandomFromCategory(String cat)`

  `void`

  `handleLegacyListenedLines(IsoPlayer player)`

  `boolean`

  `hasListenedToAll(IsoPlayer player,
  MediaData mediaData)`

  `boolean`

  `hasListenedToLine(IsoPlayer player,
  String guid)`

  `void`

  `init()`

  `void`

  `load()`

  `static void`

  `receiveRequestData(zombie.core.network.ByteBufferReader bb)`

  `MediaData`

  `register(String category,
  String id,
  String itemDisplayName,
  int spawning)`

  `void`

  `save()`

  `void`

  `sendRequestData(ByteBuffer bb)`

  `static String`

  `toAscii(String string)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### disableLineLearning

    public static boolean disableLineLearning
  + ### SPAWN\_COMMON

    private static final int SPAWN\_COMMON

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.media.RecordedMedia.SPAWN_COMMON)
  + ### SPAWN\_RARE

    private static final int SPAWN\_RARE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.media.RecordedMedia.SPAWN_RARE)
  + ### SPAWN\_EXCEPTIONAL

    private static final int SPAWN\_EXCEPTIONAL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.media.RecordedMedia.SPAWN_EXCEPTIONAL)
  + ### VERSION1

    public static final int VERSION1

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.media.RecordedMedia.VERSION1)
  + ### VERSION2

    public static final int VERSION2

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.media.RecordedMedia.VERSION2)
  + ### VERSION

    public static final int VERSION

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.media.RecordedMedia.VERSION)
  + ### SAVE\_FILE

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") SAVE\_FILE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.media.RecordedMedia.SAVE_FILE)
  + ### indexes

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> indexes
  + ### indexesFromServer

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> indexesFromServer
  + ### mediaDataMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [MediaData](MediaData.html "class in zombie.radio.media")> mediaDataMap
  + ### categorizedMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MediaData](MediaData.html "class in zombie.radio.media")>> categorizedMap
  + ### categories

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> categories
  + ### legacyListenedLines

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> legacyListenedLines
  + ### homeVhsSpawned

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang")> homeVhsSpawned
  + ### retailVhsSpawnTable

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MediaData](MediaData.html "class in zombie.radio.media")>> retailVhsSpawnTable
  + ### retailCdSpawnTable

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MediaData](MediaData.html "class in zombie.radio.media")>> retailCdSpawnTable
  + ### requiresSaving

    private boolean requiresSaving
* Constructor Details
  -------------------

  + ### RecordedMedia

    public RecordedMedia()
* Method Details
  --------------

  + ### init

    public void init()
  + ### getMediaTypeForCategory

    public static byte getMediaTypeForCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getCategories

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getCategories()
  + ### getAllMediaForType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MediaData](MediaData.html "class in zombie.radio.media")> getAllMediaForType(byte type)
  + ### getAllMediaForCategory

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MediaData](MediaData.html "class in zombie.radio.media")> getAllMediaForCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### register

    public [MediaData](MediaData.html "class in zombie.radio.media") register([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemDisplayName,
    int spawning)
  + ### getMediaDataFromIndex

    public [MediaData](MediaData.html "class in zombie.radio.media") getMediaDataFromIndex(short index)
  + ### getIndexForMediaData

    public short getIndexForMediaData([MediaData](MediaData.html "class in zombie.radio.media") data)
  + ### getMediaData

    public [MediaData](MediaData.html "class in zombie.radio.media") getMediaData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getRandomFromCategory

    public [MediaData](MediaData.html "class in zombie.radio.media") getRandomFromCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cat)
  + ### load

    public void load()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save()
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### toAscii

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toAscii([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)
  + ### hasListenedToLine

    public boolean hasListenedToLine([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid)
  + ### hasListenedToAll

    public boolean hasListenedToAll([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    [MediaData](MediaData.html "class in zombie.radio.media") mediaData)
  + ### sendRequestData

    public void sendRequestData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") bb)
  + ### receiveRequestData

    public static void receiveRequestData(zombie.core.network.ByteBufferReader bb)
  + ### handleLegacyListenedLines

    public void handleLegacyListenedLines([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)