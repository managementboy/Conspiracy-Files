[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [GameLoadingState](GameLoadingState.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [QUICK\_TIP\_MAX\_TIMER](#QUICK_TIP_MAX_TIMER)
   2. [loader](#loader)
   3. [newGame](#newGame)
   4. [startTime](#startTime)
   5. [worldVersionError](#worldVersionError)
   6. [unexpectedError](#unexpectedError)
   7. [gameLoadingString](#gameLoadingString)
   8. [playerWrongIP](#playerWrongIP)
   9. [showedUI](#showedUI)
   10. [showedClickToSkip](#showedClickToSkip)
   11. [mapDownloadFailed](#mapDownloadFailed)
   12. [playerCreated](#playerCreated)
   13. [done](#done)
   14. [convertingWorld](#convertingWorld)
   15. [convertingFileCount](#convertingFileCount)
   16. [convertingFileMax](#convertingFileMax)
   17. [waitForAssetLoadingToFinish1](#waitForAssetLoadingToFinish1)
   18. [waitForAssetLoadingToFinish2](#waitForAssetLoadingToFinish2)
   19. [assetLock1](#assetLock1)
   20. [assetLock2](#assetLock2)
   21. [time](#time)
   22. [forceDone](#forceDone)
   23. [text](#text)
   24. [width](#width)
   25. [screenFader](#screenFader)
   26. [animatedTexture](#animatedTexture)
   27. [progressFadeStartMs](#progressFadeStartMs)
   28. [stage](#stage)
   29. [totalTime](#totalTime)
   30. [loadingDotTick](#loadingDotTick)
   31. [loadingDot](#loadingDot)
   32. [clickToSkipAlpha](#clickToSkipAlpha)
   33. [clickToSkipFadeIn](#clickToSkipFadeIn)
   34. [quickTipsTimer](#quickTipsTimer)
   35. [quickTipsText](#quickTipsText)
   36. [quickTipsList](#quickTipsList)
   37. [quickTipsListJoke](#quickTipsListJoke)
   38. [BOTTOM\_SCREEN](#BOTTOM_SCREEN)
6. [Constructor Details](#constructor-detail)
   1. [GameLoadingState()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [enter()](#enter())
   2. [SendDone()](#SendDone())
   3. [Done()](#Done())
   4. [redirectState()](#redirectState())
   5. [exit()](#exit())
   6. [render()](#render())
   7. [doQuickTips()](#doQuickTips())
   8. [getNewQuickTip()](#getNewQuickTip())
   9. [loadQuickTipList()](#loadQuickTipList())
   10. [renderProgressIndicator()](#renderProgressIndicator())
   11. [update()](#update())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameLoadingState
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.gameStates.GameLoadingState

---

public final class GameLoadingState
extends zombie.gameStates.GameState

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private AnimatedTexture`

  `animatedTexture`

  `private final Object`

  `assetLock1`

  `private final Object`

  `assetLock2`

  `private static final int`

  `BOTTOM_SCREEN`

  `private float`

  `clickToSkipAlpha`

  `private boolean`

  `clickToSkipFadeIn`

  `static int`

  `convertingFileCount`

  `static int`

  `convertingFileMax`

  `static boolean`

  `convertingWorld`

  `private static boolean`

  `done`

  `private boolean`

  `forceDone`

  `static String`

  `gameLoadingString`

  `static Thread`

  `loader`

  `private String`

  `loadingDot`

  `private float`

  `loadingDotTick`

  `static boolean`

  `mapDownloadFailed`

  `private static boolean`

  `newGame`

  `private static boolean`

  `playerCreated`

  `static boolean`

  `playerWrongIP`

  `private long`

  `progressFadeStartMs`

  `static final int`

  `QUICK_TIP_MAX_TIMER`

  `private List<String>`

  `quickTipsList`

  `private List<String>`

  `quickTipsListJoke`

  `private String`

  `quickTipsText`

  `private float`

  `quickTipsTimer`

  `private static final zombie.ui.ScreenFader`

  `screenFader`

  `private static boolean`

  `showedClickToSkip`

  `private static boolean`

  `showedUI`

  `private int`

  `stage`

  `private static long`

  `startTime`

  `private String`

  `text`

  `private float`

  `time`

  `private final float`

  `totalTime`

  `private static boolean`

  `unexpectedError`

  `private boolean`

  `waitForAssetLoadingToFinish1`

  `private boolean`

  `waitForAssetLoadingToFinish2`

  `private float`

  `width`

  `static boolean`

  `worldVersionError`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameLoadingState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `Done()`

  `private void`

  `doQuickTips()`

  `void`

  `enter()`

  `void`

  `exit()`

  `private String`

  `getNewQuickTip()`

  `private void`

  `loadQuickTipList()`

  `zombie.gameStates.GameState`

  `redirectState()`

  `void`

  `render()`

  `private void`

  `renderProgressIndicator()`

  `static void`

  `SendDone()`

  `zombie.gameStates.GameStateMachine.StateAction`

  `update()`

  ### Methods inherited from class zombie.gameStates.GameState

  `reenter, yield`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### QUICK\_TIP\_MAX\_TIMER

    public static final int QUICK\_TIP\_MAX\_TIMER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.GameLoadingState.QUICK_TIP_MAX_TIMER)
  + ### loader

    public static [Thread](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Thread.html "class or interface in java.lang") loader
  + ### newGame

    private static boolean newGame
  + ### startTime

    private static long startTime
  + ### worldVersionError

    public static boolean worldVersionError
  + ### unexpectedError

    private static boolean unexpectedError
  + ### gameLoadingString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gameLoadingString
  + ### playerWrongIP

    public static boolean playerWrongIP
  + ### showedUI

    private static boolean showedUI
  + ### showedClickToSkip

    private static boolean showedClickToSkip
  + ### mapDownloadFailed

    public static boolean mapDownloadFailed
  + ### playerCreated

    private static boolean playerCreated
  + ### done

    private static boolean done
  + ### convertingWorld

    public static boolean convertingWorld
  + ### convertingFileCount

    public static int convertingFileCount
  + ### convertingFileMax

    public static int convertingFileMax
  + ### waitForAssetLoadingToFinish1

    private volatile boolean waitForAssetLoadingToFinish1
  + ### waitForAssetLoadingToFinish2

    private volatile boolean waitForAssetLoadingToFinish2
  + ### assetLock1

    private final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") assetLock1
  + ### assetLock2

    private final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") assetLock2
  + ### time

    private float time
  + ### forceDone

    private boolean forceDone
  + ### text

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text
  + ### width

    private float width
  + ### screenFader

    private static final zombie.ui.ScreenFader screenFader
  + ### animatedTexture

    private [AnimatedTexture](../core/textures/AnimatedTexture.html "class in zombie.core.textures") animatedTexture
  + ### progressFadeStartMs

    private long progressFadeStartMs
  + ### stage

    private int stage
  + ### totalTime

    private final float totalTime

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.GameLoadingState.totalTime)
  + ### loadingDotTick

    private float loadingDotTick
  + ### loadingDot

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") loadingDot
  + ### clickToSkipAlpha

    private float clickToSkipAlpha
  + ### clickToSkipFadeIn

    private boolean clickToSkipFadeIn
  + ### quickTipsTimer

    private float quickTipsTimer
  + ### quickTipsText

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") quickTipsText
  + ### quickTipsList

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> quickTipsList
  + ### quickTipsListJoke

    private [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> quickTipsListJoke
  + ### BOTTOM\_SCREEN

    private static final int BOTTOM\_SCREEN

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.GameLoadingState.BOTTOM_SCREEN)
* Constructor Details
  -------------------

  + ### GameLoadingState

    public GameLoadingState()
* Method Details
  --------------

  + ### enter

    public void enter()

    Overrides:
    :   `enter` in class `zombie.gameStates.GameState`
  + ### SendDone

    public static void SendDone()
  + ### Done

    public static void Done()
  + ### redirectState

    public zombie.gameStates.GameState redirectState()

    Overrides:
    :   `redirectState` in class `zombie.gameStates.GameState`
  + ### exit

    public void exit()

    Overrides:
    :   `exit` in class `zombie.gameStates.GameState`
  + ### render

    public void render()

    Overrides:
    :   `render` in class `zombie.gameStates.GameState`
  + ### doQuickTips

    private void doQuickTips()
  + ### getNewQuickTip

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNewQuickTip()
  + ### loadQuickTipList

    private void loadQuickTipList()
  + ### renderProgressIndicator

    private void renderProgressIndicator()
  + ### update

    public zombie.gameStates.GameStateMachine.StateAction update()

    Overrides:
    :   `update` in class `zombie.gameStates.GameState`