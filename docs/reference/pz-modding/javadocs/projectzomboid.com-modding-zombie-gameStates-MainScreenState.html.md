[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [MainScreenState](MainScreenState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [VERSION](#VERSION)
   2. [ambient](#ambient)
   3. [totalScale](#totalScale)
   4. [alpha](#alpha)
   5. [alphaStep](#alphaStep)
   6. [restartDebounceClickTimer](#restartDebounceClickTimer)
   7. [elements](#elements)
   8. [targetAlpha](#targetAlpha)
   9. [lastH](#lastH)
   10. [lastW](#lastW)
   11. [logo](#logo)
   12. [screenFader](#screenFader)
   13. [videoTex](#videoTex)
   14. [MIN\_MEM\_VIDEO\_EFFECTS](#MIN_MEM_VIDEO_EFFECTS)
   15. [mainHasRan](#mainHasRan)
   16. [instance](#instance)
   17. [showLogo](#showLogo)
   18. [fadeAlpha](#fadeAlpha)
   19. [lightningTimelineMarker](#lightningTimelineMarker)
   20. [lightningTime](#lightningTime)
   21. [worldMap](#worldMap)
   22. [lightningDelta](#lightningDelta)
   23. [lightningTargetDelta](#lightningTargetDelta)
   24. [lightningFullTimer](#lightningFullTimer)
   25. [lightningCount](#lightningCount)
   26. [lightOffCount](#lightOffCount)
   27. [animatedTexture](#animatedTexture)
   28. [connectToServerState](#connectToServerState)
   29. [windowIcon1](#windowIcon1)
   30. [windowIcon2](#windowIcon2)
   31. [windowIconBB1](#windowIconBB1)
   32. [windowIconBB2](#windowIconBB2)
7. [Constructor Details](#constructor-detail)
   1. [MainScreenState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [main(String[])](#main(java.lang.String%5B%5D))
   2. [writeOutCurrentVersion()](#writeOutCurrentVersion())
   3. [onExceptionThrown\_TryDeleteOptionsFile(Throwable)](#onExceptionThrown_TryDeleteOptionsFile(java.lang.Throwable))
   4. [DrawTexture(Texture, int, int, int, int, float)](#DrawTexture(zombie.core.textures.Texture,int,int,int,int,float))
   5. [DrawTexture(Texture, int, int, int, int, Color)](#DrawTexture(zombie.core.textures.Texture,int,int,int,int,zombie.core.Color))
   6. [enter()](#enter())
   7. [getInstance()](#getInstance())
   8. [ShouldShowLogo()](#ShouldShowLogo())
   9. [exit()](#exit())
   10. [render()](#render())
   11. [preloadBackgroundTextures()](#preloadBackgroundTextures())
   12. [renderBackground()](#renderBackground())
   13. [renderVideo()](#renderVideo())
   14. [renderOriginalBackground(float)](#renderOriginalBackground(float))
   15. [renderNinePatchTextures()](#renderNinePatchTextures())
   16. [renderNinePatchTexture(String, float, float)](#renderNinePatchTexture(java.lang.String,float,float))
   17. [update()](#update())
   18. [setConnectToServerState(ConnectToServerState)](#setConnectToServerState(zombie.gameStates.ConnectToServerState))
   19. [loadIcons()](#loadIcons())
   20. [loadInstance(BufferedImage, int)](#loadInstance(java.awt.image.BufferedImage,int))
   21. [printSpecs()](#printSpecs())
   22. [wmic(String, String[])](#wmic(java.lang.String,java.lang.String%5B%5D))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MainScreenState
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.gameStates.MainScreenState

---

public final class MainScreenState
extends zombie.gameStates.GameState

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `class`

  `MainScreenState.Credit`

  `static class`

  `MainScreenState.ScreenElement`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `alpha`

  `float`

  `alphaStep`

  `static fmod.fmod.Audio`

  `ambient`

  `private AnimatedTexture`

  `animatedTexture`

  `private zombie.gameStates.ConnectToServerState`

  `connectToServerState`

  `final ArrayList<MainScreenState.ScreenElement>`

  `elements`

  `private float`

  `fadeAlpha`

  `static MainScreenState`

  `instance`

  `(package private) int`

  `lastH`

  `(package private) int`

  `lastW`

  `float`

  `lightningCount`

  `float`

  `lightningDelta`

  `float`

  `lightningFullTimer`

  `float`

  `lightningTargetDelta`

  `(package private) float`

  `lightningTime`

  `boolean`

  `lightningTimelineMarker`

  `float`

  `lightOffCount`

  `(package private) MainScreenState.ScreenElement`

  `logo`

  `private static boolean`

  `mainHasRan`

  `private static final long`

  `MIN_MEM_VIDEO_EFFECTS`

  `private int`

  `restartDebounceClickTimer`

  `private zombie.ui.ScreenFader`

  `screenFader`

  `boolean`

  `showLogo`

  `float`

  `targetAlpha`

  `static float`

  `totalScale`

  `static final String`

  `VERSION`

  `private VideoTexture`

  `videoTex`

  `private static org.lwjgl.glfw.GLFWImage`

  `windowIcon1`

  `private static org.lwjgl.glfw.GLFWImage`

  `windowIcon2`

  `private static ByteBuffer`

  `windowIconBB1`

  `private static ByteBuffer`

  `windowIconBB2`

  `zombie.worldMap.UIWorldMap`

  `worldMap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MainScreenState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `DrawTexture(Texture tex,
  int x,
  int y,
  int width,
  int height,
  float alpha)`

  `static void`

  `DrawTexture(Texture tex,
  int x,
  int y,
  int width,
  int height,
  Color col)`

  `void`

  `enter()`

  `void`

  `exit()`

  `static MainScreenState`

  `getInstance()`

  `static org.lwjgl.glfw.GLFWImage.Buffer`

  `loadIcons()`

  `private static ByteBuffer`

  `loadInstance(BufferedImage image,
  int dimension)`

  `static void`

  `main(String[] args)`

  `private static void`

  `onExceptionThrown_TryDeleteOptionsFile(Throwable thrownException)`

  `static void`

  `preloadBackgroundTextures()`

  `private static void`

  `printSpecs()`

  `void`

  `render()`

  `void`

  `renderBackground()`

  `private float`

  `renderNinePatchTexture(String path,
  float x,
  float y)`

  `private void`

  `renderNinePatchTextures()`

  `private void`

  `renderOriginalBackground(float a)`

  `private boolean`

  `renderVideo()`

  `void`

  `setConnectToServerState(zombie.gameStates.ConnectToServerState state)`

  `boolean`

  `ShouldShowLogo()`

  `zombie.gameStates.GameStateMachine.StateAction`

  `update()`

  `private static String`

  `wmic(String component,
  String[] get)`

  `private static void`

  `writeOutCurrentVersion()`

  ### Methods inherited from class zombie.gameStates.GameState

  `redirectState, reenter, yield`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### VERSION

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") VERSION

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.MainScreenState.VERSION)
  + ### ambient

    public static fmod.fmod.Audio ambient
  + ### totalScale

    public static float totalScale
  + ### alpha

    public float alpha
  + ### alphaStep

    public float alphaStep
  + ### restartDebounceClickTimer

    private int restartDebounceClickTimer
  + ### elements

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MainScreenState.ScreenElement](MainScreenState.ScreenElement.html "class in zombie.gameStates")> elements
  + ### targetAlpha

    public float targetAlpha
  + ### lastH

    int lastH
  + ### lastW

    int lastW
  + ### logo

    [MainScreenState.ScreenElement](MainScreenState.ScreenElement.html "class in zombie.gameStates") logo
  + ### screenFader

    private zombie.ui.ScreenFader screenFader
  + ### videoTex

    private [VideoTexture](../core/textures/VideoTexture.html "class in zombie.core.textures") videoTex
  + ### MIN\_MEM\_VIDEO\_EFFECTS

    private static final long MIN\_MEM\_VIDEO\_EFFECTS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.MainScreenState.MIN_MEM_VIDEO_EFFECTS)
  + ### mainHasRan

    private static boolean mainHasRan
  + ### instance

    public static [MainScreenState](MainScreenState.html "class in zombie.gameStates") instance
  + ### showLogo

    public boolean showLogo
  + ### fadeAlpha

    private float fadeAlpha
  + ### lightningTimelineMarker

    public boolean lightningTimelineMarker
  + ### lightningTime

    float lightningTime
  + ### worldMap

    public zombie.worldMap.UIWorldMap worldMap
  + ### lightningDelta

    public float lightningDelta
  + ### lightningTargetDelta

    public float lightningTargetDelta
  + ### lightningFullTimer

    public float lightningFullTimer
  + ### lightningCount

    public float lightningCount
  + ### lightOffCount

    public float lightOffCount
  + ### animatedTexture

    private [AnimatedTexture](../core/textures/AnimatedTexture.html "class in zombie.core.textures") animatedTexture
  + ### connectToServerState

    private zombie.gameStates.ConnectToServerState connectToServerState
  + ### windowIcon1

    private static org.lwjgl.glfw.GLFWImage windowIcon1
  + ### windowIcon2

    private static org.lwjgl.glfw.GLFWImage windowIcon2
  + ### windowIconBB1

    private static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") windowIconBB1
  + ### windowIconBB2

    private static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") windowIconBB2
* Constructor Details
  -------------------

  + ### MainScreenState

    public MainScreenState()
* Method Details
  --------------

  + ### main

    public static void main([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] args)
  + ### writeOutCurrentVersion

    private static void writeOutCurrentVersion()
  + ### onExceptionThrown\_TryDeleteOptionsFile

    private static void onExceptionThrown\_TryDeleteOptionsFile([Throwable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Throwable.html "class or interface in java.lang") thrownException)
  + ### DrawTexture

    public static void DrawTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    int x,
    int y,
    int width,
    int height,
    float alpha)
  + ### DrawTexture

    public static void DrawTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    int x,
    int y,
    int width,
    int height,
    [Color](../core/Color.html "class in zombie.core") col)
  + ### enter

    public void enter()

    Overrides:
    :   `enter` in class `zombie.gameStates.GameState`
  + ### getInstance

    public static [MainScreenState](MainScreenState.html "class in zombie.gameStates") getInstance()
  + ### ShouldShowLogo

    public boolean ShouldShowLogo()
  + ### exit

    public void exit()

    Overrides:
    :   `exit` in class `zombie.gameStates.GameState`
  + ### render

    public void render()

    Overrides:
    :   `render` in class `zombie.gameStates.GameState`
  + ### preloadBackgroundTextures

    public static void preloadBackgroundTextures()
  + ### renderBackground

    public void renderBackground()
  + ### renderVideo

    private boolean renderVideo()
  + ### renderOriginalBackground

    private void renderOriginalBackground(float a)
  + ### renderNinePatchTextures

    private void renderNinePatchTextures()
  + ### renderNinePatchTexture

    private float renderNinePatchTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path,
    float x,
    float y)
  + ### update

    public zombie.gameStates.GameStateMachine.StateAction update()

    Overrides:
    :   `update` in class `zombie.gameStates.GameState`
  + ### setConnectToServerState

    public void setConnectToServerState(zombie.gameStates.ConnectToServerState state)
  + ### loadIcons

    public static org.lwjgl.glfw.GLFWImage.Buffer loadIcons()
  + ### loadInstance

    private static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") loadInstance([BufferedImage](https://docs.oracle.com/en/java/javase/25/docs/api/java.desktop/java/awt/image/BufferedImage.html "class or interface in java.awt.image") image,
    int dimension)
  + ### printSpecs

    private static void printSpecs()
  + ### wmic

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wmic([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") component,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] get)