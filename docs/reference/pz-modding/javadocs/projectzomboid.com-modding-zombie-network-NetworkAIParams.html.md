[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [NetworkAIParams](NetworkAIParams.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [MAX\_CONNECTIONS](#MAX_CONNECTIONS)
   2. [ZOMBIE\_UPDATE\_INFO\_BUNCH\_RATE\_MS](#ZOMBIE_UPDATE_INFO_BUNCH_RATE_MS)
   3. [CHARACTER\_UPDATE\_RATE\_MS](#CHARACTER_UPDATE_RATE_MS)
   4. [CHARACTER\_EXTRAPOLATION\_UPDATE\_INTERVAL\_MS](#CHARACTER_EXTRAPOLATION_UPDATE_INTERVAL_MS)
   5. [ZOMBIE\_ANTICIPATORY\_UPDATE\_MULTIPLIER](#ZOMBIE_ANTICIPATORY_UPDATE_MULTIPLIER)
   6. [ANIMAL\_PREDICT\_INTERVAL](#ANIMAL_PREDICT_INTERVAL)
   7. [ANIMAL\_PREDICT\_UPDATE\_LIMIT](#ANIMAL_PREDICT_UPDATE_LIMIT)
   8. [ZOMBIE\_OWNERSHIP\_INTERVAL](#ZOMBIE_OWNERSHIP_INTERVAL)
   9. [ZOMBIE\_REMOVE\_INTERVAL\_MS](#ZOMBIE_REMOVE_INTERVAL_MS)
   10. [ZOMBIE\_MAX\_UPDATE\_INTERVAL\_MS](#ZOMBIE_MAX_UPDATE_INTERVAL_MS)
   11. [ZOMBIE\_MIN\_UPDATE\_INTERVAL\_MS](#ZOMBIE_MIN_UPDATE_INTERVAL_MS)
   12. [CHARACTER\_PREDICTION\_INTERVAL\_MS](#CHARACTER_PREDICTION_INTERVAL_MS)
   13. [ZOMBIE\_TELEPORT\_PLAYER](#ZOMBIE_TELEPORT_PLAYER)
   14. [ZOMBIE\_TELEPORT\_DISTANCE\_SQ](#ZOMBIE_TELEPORT_DISTANCE_SQ)
   15. [VEHICLE\_SPEED\_CAP](#VEHICLE_SPEED_CAP)
   16. [VEHICLE\_MOVING\_MP\_PHYSIC\_UPDATE\_RATE](#VEHICLE_MOVING_MP_PHYSIC_UPDATE_RATE)
   17. [VEHICLE\_MP\_PHYSIC\_UPDATE\_RATE](#VEHICLE_MP_PHYSIC_UPDATE_RATE)
   18. [VEHICLE\_BUFFER\_DELAY\_MS](#VEHICLE_BUFFER_DELAY_MS)
   19. [VEHICLE\_BUFFER\_HISTORY\_MS](#VEHICLE_BUFFER_HISTORY_MS)
   20. [VEHICLE\_DELAY\_TUNE\_PER\_SEC](#VEHICLE_DELAY_TUNE_PER_SEC)
   21. [VEHICLE\_DELAY\_NORMALISE\_PER\_SEC](#VEHICLE_DELAY_NORMALISE_PER_SEC)
   22. [VEHICLE\_DELAY\_TUNE\_MULTIPLIXER](#VEHICLE_DELAY_TUNE_MULTIPLIXER)
   23. [VEHICLE\_HIGH\_PING\_COUNT](#VEHICLE_HIGH_PING_COUNT)
   24. [VEHICLE\_DELAY\_HIGH\_PING\_MULTIPLIXER](#VEHICLE_DELAY_HIGH_PING_MULTIPLIXER)
   25. [VEHICLE\_DELAY\_SLOWING\_DOWN\_DELAY\_MULTIPLIXER](#VEHICLE_DELAY_SLOWING_DOWN_DELAY_MULTIPLIXER)
   26. [MAX\_TOWING\_TRAILER\_DISTANCE\_SQ](#MAX_TOWING_TRAILER_DISTANCE_SQ)
   27. [MAX\_TOWING\_CAR\_DISTANCE\_SQ](#MAX_TOWING_CAR_DISTANCE_SQ)
   28. [MAX\_RECONNECT\_DISTANCE\_SQ](#MAX_RECONNECT_DISTANCE_SQ)
   29. [TOWING\_DISTANCE](#TOWING_DISTANCE)
   30. [showConnectionInfo](#showConnectionInfo)
   31. [showServerInfo](#showServerInfo)
6. [Constructor Details](#constructor-detail)
   1. [NetworkAIParams()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isShowConnectionInfo()](#isShowConnectionInfo())
   2. [setShowConnectionInfo(boolean)](#setShowConnectionInfo(boolean))
   3. [isShowServerInfo()](#isShowServerInfo())
   4. [setShowServerInfo(boolean)](#setShowServerInfo(boolean))
   5. [Init()](#Init())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class NetworkAIParams
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.NetworkAIParams

---

public class NetworkAIParams
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final int`

  `ANIMAL_PREDICT_INTERVAL`

  `static final float`

  `ANIMAL_PREDICT_UPDATE_LIMIT`

  `static final int`

  `CHARACTER_EXTRAPOLATION_UPDATE_INTERVAL_MS`

  `static final int`

  `CHARACTER_PREDICTION_INTERVAL_MS`

  `static final int`

  `CHARACTER_UPDATE_RATE_MS`

  `static final int`

  `MAX_CONNECTIONS`

  `static final float`

  `MAX_RECONNECT_DISTANCE_SQ`

  `static final float`

  `MAX_TOWING_CAR_DISTANCE_SQ`

  `static final float`

  `MAX_TOWING_TRAILER_DISTANCE_SQ`

  `private static boolean`

  `showConnectionInfo`

  `private static boolean`

  `showServerInfo`

  `static final float`

  `TOWING_DISTANCE`

  `static final int`

  `VEHICLE_BUFFER_DELAY_MS`

  `static final int`

  `VEHICLE_BUFFER_HISTORY_MS`

  `static final float`

  `VEHICLE_DELAY_HIGH_PING_MULTIPLIXER`

  `static final float`

  `VEHICLE_DELAY_NORMALISE_PER_SEC`

  `static final float`

  `VEHICLE_DELAY_SLOWING_DOWN_DELAY_MULTIPLIXER`

  `static final float`

  `VEHICLE_DELAY_TUNE_MULTIPLIXER`

  `static final float`

  `VEHICLE_DELAY_TUNE_PER_SEC`

  `static final int`

  `VEHICLE_HIGH_PING_COUNT`

  `static final int`

  `VEHICLE_MOVING_MP_PHYSIC_UPDATE_RATE`

  `static final int`

  `VEHICLE_MP_PHYSIC_UPDATE_RATE`

  `static final int`

  `VEHICLE_SPEED_CAP`

  `static final float`

  `ZOMBIE_ANTICIPATORY_UPDATE_MULTIPLIER`

  `static final int`

  `ZOMBIE_MAX_UPDATE_INTERVAL_MS`

  `static final int`

  `ZOMBIE_MIN_UPDATE_INTERVAL_MS`

  `static final int`

  `ZOMBIE_OWNERSHIP_INTERVAL`

  `static final int`

  `ZOMBIE_REMOVE_INTERVAL_MS`

  `static final int`

  `ZOMBIE_TELEPORT_DISTANCE_SQ`

  `static final int`

  `ZOMBIE_TELEPORT_PLAYER`

  `static final int`

  `ZOMBIE_UPDATE_INFO_BUNCH_RATE_MS`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `NetworkAIParams()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `Init()`

  `static boolean`

  `isShowConnectionInfo()`

  `static boolean`

  `isShowServerInfo()`

  `static void`

  `setShowConnectionInfo(boolean enabled)`

  `static void`

  `setShowServerInfo(boolean enabled)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### MAX\_CONNECTIONS

    public static final int MAX\_CONNECTIONS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.MAX_CONNECTIONS)
  + ### ZOMBIE\_UPDATE\_INFO\_BUNCH\_RATE\_MS

    public static final int ZOMBIE\_UPDATE\_INFO\_BUNCH\_RATE\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ZOMBIE_UPDATE_INFO_BUNCH_RATE_MS)
  + ### CHARACTER\_UPDATE\_RATE\_MS

    public static final int CHARACTER\_UPDATE\_RATE\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.CHARACTER_UPDATE_RATE_MS)
  + ### CHARACTER\_EXTRAPOLATION\_UPDATE\_INTERVAL\_MS

    public static final int CHARACTER\_EXTRAPOLATION\_UPDATE\_INTERVAL\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.CHARACTER_EXTRAPOLATION_UPDATE_INTERVAL_MS)
  + ### ZOMBIE\_ANTICIPATORY\_UPDATE\_MULTIPLIER

    public static final float ZOMBIE\_ANTICIPATORY\_UPDATE\_MULTIPLIER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ZOMBIE_ANTICIPATORY_UPDATE_MULTIPLIER)
  + ### ANIMAL\_PREDICT\_INTERVAL

    public static final int ANIMAL\_PREDICT\_INTERVAL

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ANIMAL_PREDICT_INTERVAL)
  + ### ANIMAL\_PREDICT\_UPDATE\_LIMIT

    public static final float ANIMAL\_PREDICT\_UPDATE\_LIMIT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ANIMAL_PREDICT_UPDATE_LIMIT)
  + ### ZOMBIE\_OWNERSHIP\_INTERVAL

    public static final int ZOMBIE\_OWNERSHIP\_INTERVAL

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ZOMBIE_OWNERSHIP_INTERVAL)
  + ### ZOMBIE\_REMOVE\_INTERVAL\_MS

    public static final int ZOMBIE\_REMOVE\_INTERVAL\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ZOMBIE_REMOVE_INTERVAL_MS)
  + ### ZOMBIE\_MAX\_UPDATE\_INTERVAL\_MS

    public static final int ZOMBIE\_MAX\_UPDATE\_INTERVAL\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ZOMBIE_MAX_UPDATE_INTERVAL_MS)
  + ### ZOMBIE\_MIN\_UPDATE\_INTERVAL\_MS

    public static final int ZOMBIE\_MIN\_UPDATE\_INTERVAL\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ZOMBIE_MIN_UPDATE_INTERVAL_MS)
  + ### CHARACTER\_PREDICTION\_INTERVAL\_MS

    public static final int CHARACTER\_PREDICTION\_INTERVAL\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.CHARACTER_PREDICTION_INTERVAL_MS)
  + ### ZOMBIE\_TELEPORT\_PLAYER

    public static final int ZOMBIE\_TELEPORT\_PLAYER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ZOMBIE_TELEPORT_PLAYER)
  + ### ZOMBIE\_TELEPORT\_DISTANCE\_SQ

    public static final int ZOMBIE\_TELEPORT\_DISTANCE\_SQ

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.ZOMBIE_TELEPORT_DISTANCE_SQ)
  + ### VEHICLE\_SPEED\_CAP

    public static final int VEHICLE\_SPEED\_CAP

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_SPEED_CAP)
  + ### VEHICLE\_MOVING\_MP\_PHYSIC\_UPDATE\_RATE

    public static final int VEHICLE\_MOVING\_MP\_PHYSIC\_UPDATE\_RATE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_MOVING_MP_PHYSIC_UPDATE_RATE)
  + ### VEHICLE\_MP\_PHYSIC\_UPDATE\_RATE

    public static final int VEHICLE\_MP\_PHYSIC\_UPDATE\_RATE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_MP_PHYSIC_UPDATE_RATE)
  + ### VEHICLE\_BUFFER\_DELAY\_MS

    public static final int VEHICLE\_BUFFER\_DELAY\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_BUFFER_DELAY_MS)
  + ### VEHICLE\_BUFFER\_HISTORY\_MS

    public static final int VEHICLE\_BUFFER\_HISTORY\_MS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_BUFFER_HISTORY_MS)
  + ### VEHICLE\_DELAY\_TUNE\_PER\_SEC

    public static final float VEHICLE\_DELAY\_TUNE\_PER\_SEC

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_DELAY_TUNE_PER_SEC)
  + ### VEHICLE\_DELAY\_NORMALISE\_PER\_SEC

    public static final float VEHICLE\_DELAY\_NORMALISE\_PER\_SEC

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_DELAY_NORMALISE_PER_SEC)
  + ### VEHICLE\_DELAY\_TUNE\_MULTIPLIXER

    public static final float VEHICLE\_DELAY\_TUNE\_MULTIPLIXER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_DELAY_TUNE_MULTIPLIXER)
  + ### VEHICLE\_HIGH\_PING\_COUNT

    public static final int VEHICLE\_HIGH\_PING\_COUNT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_HIGH_PING_COUNT)
  + ### VEHICLE\_DELAY\_HIGH\_PING\_MULTIPLIXER

    public static final float VEHICLE\_DELAY\_HIGH\_PING\_MULTIPLIXER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_DELAY_HIGH_PING_MULTIPLIXER)
  + ### VEHICLE\_DELAY\_SLOWING\_DOWN\_DELAY\_MULTIPLIXER

    public static final float VEHICLE\_DELAY\_SLOWING\_DOWN\_DELAY\_MULTIPLIXER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.VEHICLE_DELAY_SLOWING_DOWN_DELAY_MULTIPLIXER)
  + ### MAX\_TOWING\_TRAILER\_DISTANCE\_SQ

    public static final float MAX\_TOWING\_TRAILER\_DISTANCE\_SQ

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.MAX_TOWING_TRAILER_DISTANCE_SQ)
  + ### MAX\_TOWING\_CAR\_DISTANCE\_SQ

    public static final float MAX\_TOWING\_CAR\_DISTANCE\_SQ

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.MAX_TOWING_CAR_DISTANCE_SQ)
  + ### MAX\_RECONNECT\_DISTANCE\_SQ

    public static final float MAX\_RECONNECT\_DISTANCE\_SQ

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.MAX_RECONNECT_DISTANCE_SQ)
  + ### TOWING\_DISTANCE

    public static final float TOWING\_DISTANCE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.NetworkAIParams.TOWING_DISTANCE)
  + ### showConnectionInfo

    private static boolean showConnectionInfo
  + ### showServerInfo

    private static boolean showServerInfo
* Constructor Details
  -------------------

  + ### NetworkAIParams

    public NetworkAIParams()
* Method Details
  --------------

  + ### isShowConnectionInfo

    public static boolean isShowConnectionInfo()
  + ### setShowConnectionInfo

    public static void setShowConnectionInfo(boolean enabled)
  + ### isShowServerInfo

    public static boolean isShowServerInfo()
  + ### setShowServerInfo

    public static void setShowServerInfo(boolean enabled)
  + ### Init

    public static void Init()