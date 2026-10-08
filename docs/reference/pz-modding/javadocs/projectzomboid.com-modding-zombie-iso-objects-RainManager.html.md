[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [RainManager](RainManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [isRaining](#isRaining)
   2. [numActiveRainSplashes](#numActiveRainSplashes)
   3. [numActiveRaindrops](#numActiveRaindrops)
   4. [maxRainSplashObjects](#maxRainSplashObjects)
   5. [maxRaindropObjects](#maxRaindropObjects)
   6. [rainSplashAnimDelay](#rainSplashAnimDelay)
   7. [addNewSplashesDelay](#addNewSplashesDelay)
   8. [addNewSplashesTimer](#addNewSplashesTimer)
   9. [raindropGravity](#raindropGravity)
   10. [gravModMin](#gravModMin)
   11. [gravModMax](#gravModMax)
   12. [raindropStartDistance](#raindropStartDistance)
   13. [playerLocation](#playerLocation)
   14. [playerOldLocation](#playerOldLocation)
   15. [playerMoved](#playerMoved)
   16. [rainRadius](#rainRadius)
   17. [rainAmbient](#rainAmbient)
   18. [thunderAmbient](#thunderAmbient)
   19. [rainSplashTintMod](#rainSplashTintMod)
   20. [raindropTintMod](#raindropTintMod)
   21. [darkRaindropTintMod](#darkRaindropTintMod)
   22. [rainSplashStack](#rainSplashStack)
   23. [raindropStack](#raindropStack)
   24. [rainSplashReuseStack](#rainSplashReuseStack)
   25. [raindropReuseStack](#raindropReuseStack)
   26. [rainChangeTimer](#rainChangeTimer)
   27. [rainChangeRate](#rainChangeRate)
   28. [RainChangeRateMin](#RainChangeRateMin)
   29. [RainChangeRateMax](#RainChangeRateMax)
   30. [rainIntensity](#rainIntensity)
   31. [rainDesiredIntensity](#rainDesiredIntensity)
   32. [randRain](#randRain)
   33. [randRainMin](#randRainMin)
   34. [randRainMax](#randRainMax)
   35. [stopRain](#stopRain)
   36. [outsideAmbient](#outsideAmbient)
   37. [outsideNightAmbient](#outsideNightAmbient)
   38. [adjustedRainSplashTintMod](#adjustedRainSplashTintMod)
6. [Constructor Details](#constructor-detail)
   1. [RainManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [AddRaindrop(IsoRaindrop)](#AddRaindrop(zombie.iso.objects.IsoRaindrop))
   3. [AddRainSplash(IsoRainSplash)](#AddRainSplash(zombie.iso.objects.IsoRainSplash))
   4. [AddSplashes()](#AddSplashes())
   5. [RemoveRaindrop(IsoRaindrop)](#RemoveRaindrop(zombie.iso.objects.IsoRaindrop))
   6. [RemoveRainSplash(IsoRainSplash)](#RemoveRainSplash(zombie.iso.objects.IsoRainSplash))
   7. [SetPlayerLocation(int, IsoGridSquare)](#SetPlayerLocation(int,zombie.iso.IsoGridSquare))
   8. [isRaining()](#isRaining())
   9. [stopRaining()](#stopRaining())
   10. [startRaining()](#startRaining())
   11. [StartRaindrop(IsoCell, IsoGridSquare, boolean)](#StartRaindrop(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,boolean))
   12. [StartRainSplash(IsoCell, IsoGridSquare, boolean)](#StartRainSplash(zombie.iso.IsoCell,zombie.iso.IsoGridSquare,boolean))
   13. [Update()](#Update())
   14. [UpdateServer()](#UpdateServer())
   15. [setRandRainMax(int)](#setRandRainMax(int))
   16. [setRandRainMin(int)](#setRandRainMin(int))
   17. [inBounds(IsoGridSquare)](#inBounds(zombie.iso.IsoGridSquare))
   18. [RemoveAllOn(IsoGridSquare)](#RemoveAllOn(zombie.iso.IsoGridSquare))
   19. [getRainIntensity()](#getRainIntensity())
   20. [removeAll()](#removeAll())
   21. [interruptSleep(IsoPlayer)](#interruptSleep(zombie.characters.IsoPlayer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RainManager
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.objects.RainManager

---

public class RainManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static int`

  `addNewSplashesDelay`

  `static int`

  `addNewSplashesTimer`

  `(package private) static ColorInfo`

  `adjustedRainSplashTintMod`

  `static ColorInfo`

  `darkRaindropTintMod`

  `static float`

  `gravModMax`

  `static float`

  `gravModMin`

  `private static boolean`

  `isRaining`

  `static int`

  `maxRaindropObjects`

  `static int`

  `maxRainSplashObjects`

  `static int`

  `numActiveRaindrops`

  `static int`

  `numActiveRainSplashes`

  `(package private) static fmod.fmod.Audio`

  `outsideAmbient`

  `(package private) static fmod.fmod.Audio`

  `outsideNightAmbient`

  `static IsoGridSquare[]`

  `playerLocation`

  `static boolean`

  `playerMoved`

  `static IsoGridSquare[]`

  `playerOldLocation`

  `static fmod.fmod.Audio`

  `rainAmbient`

  `private static float`

  `rainChangeRate`

  `private static final float`

  `RainChangeRateMax`

  `private static final float`

  `RainChangeRateMin`

  `private static float`

  `rainChangeTimer`

  `static float`

  `rainDesiredIntensity`

  `static float`

  `raindropGravity`

  `static Stack<zombie.iso.objects.IsoRaindrop>`

  `raindropReuseStack`

  `static ArrayList<zombie.iso.objects.IsoRaindrop>`

  `raindropStack`

  `static float`

  `raindropStartDistance`

  `static ColorInfo`

  `raindropTintMod`

  `static float`

  `rainIntensity`

  `static int`

  `rainRadius`

  `static float`

  `rainSplashAnimDelay`

  `static Stack<zombie.iso.objects.IsoRainSplash>`

  `rainSplashReuseStack`

  `static ArrayList<zombie.iso.objects.IsoRainSplash>`

  `rainSplashStack`

  `static ColorInfo`

  `rainSplashTintMod`

  `private static int`

  `randRain`

  `static int`

  `randRainMax`

  `static int`

  `randRainMin`

  `private static boolean`

  `stopRain`

  `static fmod.fmod.Audio`

  `thunderAmbient`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RainManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `AddRaindrop(zombie.iso.objects.IsoRaindrop newRaindrop)`

  `static void`

  `AddRainSplash(zombie.iso.objects.IsoRainSplash newRainSplash)`

  `static void`

  `AddSplashes()`

  `static float`

  `getRainIntensity()`

  `static boolean`

  `inBounds(IsoGridSquare sq)`

  `private static boolean`

  `interruptSleep(IsoPlayer ply)`

  `static Boolean`

  `isRaining()`

  `private static void`

  `removeAll()`

  `static void`

  `RemoveAllOn(IsoGridSquare sq)`

  `static void`

  `RemoveRaindrop(zombie.iso.objects.IsoRaindrop dyingRaindrop)`

  `static void`

  `RemoveRainSplash(zombie.iso.objects.IsoRainSplash dyingRainSplash)`

  `static void`

  `reset()`

  `static void`

  `SetPlayerLocation(int playerIndex,
  IsoGridSquare playerCurrentSquare)`

  `static void`

  `setRandRainMax(int pRandRainMax)`

  `static void`

  `setRandRainMin(int pRandRainMin)`

  `static void`

  `StartRaindrop(IsoCell cell,
  IsoGridSquare gridSquare,
  boolean canSee)`

  `static void`

  `startRaining()`

  `static void`

  `StartRainSplash(IsoCell cell,
  IsoGridSquare gridSquare,
  boolean canSee)`

  `static void`

  `stopRaining()`

  `static void`

  `Update()`

  `static void`

  `UpdateServer()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### isRaining

    private static boolean isRaining
  + ### numActiveRainSplashes

    public static int numActiveRainSplashes
  + ### numActiveRaindrops

    public static int numActiveRaindrops
  + ### maxRainSplashObjects

    public static int maxRainSplashObjects
  + ### maxRaindropObjects

    public static int maxRaindropObjects
  + ### rainSplashAnimDelay

    public static float rainSplashAnimDelay
  + ### addNewSplashesDelay

    public static int addNewSplashesDelay
  + ### addNewSplashesTimer

    public static int addNewSplashesTimer
  + ### raindropGravity

    public static float raindropGravity
  + ### gravModMin

    public static float gravModMin
  + ### gravModMax

    public static float gravModMax
  + ### raindropStartDistance

    public static float raindropStartDistance
  + ### playerLocation

    public static [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")[] playerLocation
  + ### playerOldLocation

    public static [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")[] playerOldLocation
  + ### playerMoved

    public static boolean playerMoved
  + ### rainRadius

    public static int rainRadius
  + ### rainAmbient

    public static fmod.fmod.Audio rainAmbient
  + ### thunderAmbient

    public static fmod.fmod.Audio thunderAmbient
  + ### rainSplashTintMod

    public static [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") rainSplashTintMod
  + ### raindropTintMod

    public static [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") raindropTintMod
  + ### darkRaindropTintMod

    public static [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") darkRaindropTintMod
  + ### rainSplashStack

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.objects.IsoRainSplash> rainSplashStack
  + ### raindropStack

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.iso.objects.IsoRaindrop> raindropStack
  + ### rainSplashReuseStack

    public static [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<zombie.iso.objects.IsoRainSplash> rainSplashReuseStack
  + ### raindropReuseStack

    public static [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<zombie.iso.objects.IsoRaindrop> raindropReuseStack
  + ### rainChangeTimer

    private static float rainChangeTimer
  + ### rainChangeRate

    private static float rainChangeRate
  + ### RainChangeRateMin

    private static final float RainChangeRateMin

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.RainManager.RainChangeRateMin)
  + ### RainChangeRateMax

    private static final float RainChangeRateMax

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.RainManager.RainChangeRateMax)
  + ### rainIntensity

    public static float rainIntensity
  + ### rainDesiredIntensity

    public static float rainDesiredIntensity
  + ### randRain

    private static int randRain
  + ### randRainMin

    public static int randRainMin
  + ### randRainMax

    public static int randRainMax
  + ### stopRain

    private static boolean stopRain
  + ### outsideAmbient

    static fmod.fmod.Audio outsideAmbient
  + ### outsideNightAmbient

    static fmod.fmod.Audio outsideNightAmbient
  + ### adjustedRainSplashTintMod

    static [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") adjustedRainSplashTintMod
* Constructor Details
  -------------------

  + ### RainManager

    public RainManager()
* Method Details
  --------------

  + ### reset

    public static void reset()
  + ### AddRaindrop

    public static void AddRaindrop(zombie.iso.objects.IsoRaindrop newRaindrop)
  + ### AddRainSplash

    public static void AddRainSplash(zombie.iso.objects.IsoRainSplash newRainSplash)
  + ### AddSplashes

    public static void AddSplashes()
  + ### RemoveRaindrop

    public static void RemoveRaindrop(zombie.iso.objects.IsoRaindrop dyingRaindrop)
  + ### RemoveRainSplash

    public static void RemoveRainSplash(zombie.iso.objects.IsoRainSplash dyingRainSplash)
  + ### SetPlayerLocation

    public static void SetPlayerLocation(int playerIndex,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") playerCurrentSquare)
  + ### isRaining

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isRaining()
  + ### stopRaining

    public static void stopRaining()
  + ### startRaining

    public static void startRaining()
  + ### StartRaindrop

    public static void StartRaindrop([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean canSee)
  + ### StartRainSplash

    public static void StartRainSplash([IsoCell](../IsoCell.html "class in zombie.iso") cell,
    [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") gridSquare,
    boolean canSee)
  + ### Update

    public static void Update()
  + ### UpdateServer

    public static void UpdateServer()
  + ### setRandRainMax

    public static void setRandRainMax(int pRandRainMax)
  + ### setRandRainMin

    public static void setRandRainMin(int pRandRainMin)
  + ### inBounds

    public static boolean inBounds([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### RemoveAllOn

    public static void RemoveAllOn([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### getRainIntensity

    public static float getRainIntensity()
  + ### removeAll

    private static void removeAll()
  + ### interruptSleep

    private static boolean interruptSleep([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") ply)