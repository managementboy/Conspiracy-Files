[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UIManager](UIManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [lastMouseX](#lastMouseX)
   2. [lastMouseY](#lastMouseY)
   3. [picked](#picked)
   4. [pickedCopy](#pickedCopy)
   5. [clock](#clock)
   6. [UI](#UI)
   7. [toolTip](#toolTip)
   8. [mouseArrow](#mouseArrow)
   9. [mouseExamine](#mouseExamine)
   10. [mouseAttack](#mouseAttack)
   11. [mouseGrab](#mouseGrab)
   12. [speedControls](#speedControls)
   13. [debugConsole](#debugConsole)
   14. [MoodleUI](#MoodleUI)
   15. [fadeBeforeUi](#fadeBeforeUi)
   16. [ProgressBar](#ProgressBar)
   17. [fadeAlpha](#fadeAlpha)
   18. [fadeInTimeMax](#fadeInTimeMax)
   19. [fadeInTime](#fadeInTime)
   20. [fadingOut](#fadingOut)
   21. [lastMouseTexture](#lastMouseTexture)
   22. [lastPicked](#lastPicked)
   23. [DoneTutorials](#DoneTutorials)
   24. [lastOffX](#lastOffX)
   25. [lastOffY](#lastOffY)
   26. [modal](#modal)
   27. [doTick](#doTick)
   28. [visibleAllUi](#visibleAllUi)
   29. [uiFbo](#uiFbo)
   30. [useUiFbo](#useUiFbo)
   31. [uiTextureContentsValid](#uiTextureContentsValid)
   32. [black](#black)
   33. [suspend](#suspend)
   34. [lastAlpha](#lastAlpha)
   35. [PickedTileLocal](#PickedTileLocal)
   36. [PickedTile](#PickedTile)
   37. [rightDownObject](#rightDownObject)
   38. [uiUpdateTimeMS](#uiUpdateTimeMS)
   39. [uiUpdateIntervalMS](#uiUpdateIntervalMS)
   40. [uiRenderTimeMS](#uiRenderTimeMS)
   41. [uiRenderIntervalMS](#uiRenderIntervalMS)
   42. [tutorialStack](#tutorialStack)
   43. [toTop](#toTop)
   44. [defaultthread](#defaultthread)
   45. [previousThread](#previousThread)
   46. [toRemove](#toRemove)
   47. [toAdd](#toAdd)
   48. [wheel](#wheel)
   49. [lastwheel](#lastwheel)
   50. [debugUI](#debugUI)
   51. [showLuaDebuggerOnError](#showLuaDebuggerOnError)
   52. [luaDebuggerAction](#luaDebuggerAction)
   53. [sync](#sync)
   54. [showPausedMessage](#showPausedMessage)
   55. [playerInventoryUI](#playerInventoryUI)
   56. [playerLootUI](#playerLootUI)
   57. [playerInventoryTooltip](#playerInventoryTooltip)
   58. [playerLootTooltip](#playerLootTooltip)
   59. [playerFadeInfo](#playerFadeInfo)
   60. [playerBlinkInfo](#playerBlinkInfo)
   61. [rendering](#rendering)
   62. [updating](#updating)
   63. [DEBUGGER\_FPS](#DEBUGGER_FPS)
7. [Constructor Details](#constructor-detail)
   1. [UIManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [AddUI(UIElementInterface)](#AddUI(zombie.ui.UIElementInterface))
   2. [RemoveElement(UIElementInterface)](#RemoveElement(zombie.ui.UIElementInterface))
   3. [clearArrays()](#clearArrays())
   4. [closeContainers()](#closeContainers())
   5. [CloseContainers()](#CloseContainers())
   6. [DrawTexture(Texture, double, double)](#DrawTexture(zombie.core.textures.Texture,double,double))
   7. [DrawTexture(Texture, double, double, double, double, double)](#DrawTexture(zombie.core.textures.Texture,double,double,double,double,double))
   8. [FadeIn(double)](#FadeIn(double))
   9. [FadeOut(double)](#FadeOut(double))
   10. [CreateFBO(int, int)](#CreateFBO(int,int))
   11. [createTexture(float, float, boolean)](#createTexture(float,float,boolean))
   12. [init()](#init())
   13. [render()](#render())
   14. [renderFadeOverlay()](#renderFadeOverlay())
   15. [resize()](#resize())
   16. [getTileFromMouse(double, double, double)](#getTileFromMouse(double,double,double))
   17. [isOverElement(UIElementInterface, int, int)](#isOverElement(zombie.ui.UIElementInterface,int,int))
   18. [update()](#update())
   19. [updateMouseButtons(int, int)](#updateMouseButtons(int,int))
   20. [updateMouseMove(int, int, boolean)](#updateMouseMove(int,int,boolean))
   21. [updateUIElements()](#updateUIElements())
   22. [checkPicked()](#checkPicked())
   23. [handleZoomKeys()](#handleZoomKeys())
   24. [getLastMouseX()](#getLastMouseX())
   25. [setLastMouseX(double)](#setLastMouseX(double))
   26. [getLastMouseY()](#getLastMouseY())
   27. [setLastMouseY(double)](#setLastMouseY(double))
   28. [getPicked()](#getPicked())
   29. [setPicked(IsoObjectPicker.ClickObject)](#setPicked(zombie.iso.IsoObjectPicker.ClickObject))
   30. [getClock()](#getClock())
   31. [setClock(Clock)](#setClock(zombie.ui.Clock))
   32. [getUI()](#getUI())
   33. [setUI(ArrayList)](#setUI(java.util.ArrayList))
   34. [getToolTip()](#getToolTip())
   35. [setToolTip(ObjectTooltip)](#setToolTip(zombie.ui.ObjectTooltip))
   36. [getMouseArrow()](#getMouseArrow())
   37. [setMouseArrow(Texture)](#setMouseArrow(zombie.core.textures.Texture))
   38. [getMouseExamine()](#getMouseExamine())
   39. [setMouseExamine(Texture)](#setMouseExamine(zombie.core.textures.Texture))
   40. [getMouseAttack()](#getMouseAttack())
   41. [setMouseAttack(Texture)](#setMouseAttack(zombie.core.textures.Texture))
   42. [getMouseGrab()](#getMouseGrab())
   43. [setMouseGrab(Texture)](#setMouseGrab(zombie.core.textures.Texture))
   44. [getSpeedControls()](#getSpeedControls())
   45. [setSpeedControls(SpeedControls)](#setSpeedControls(zombie.ui.SpeedControls))
   46. [getDebugConsole()](#getDebugConsole())
   47. [setDebugConsole(UIDebugConsole)](#setDebugConsole(zombie.ui.UIDebugConsole))
   48. [getMoodleUI(double)](#getMoodleUI(double))
   49. [setMoodleUI(double, MoodlesUI)](#setMoodleUI(double,zombie.ui.MoodlesUI))
   50. [isbFadeBeforeUI()](#isbFadeBeforeUI())
   51. [setbFadeBeforeUI(boolean)](#setbFadeBeforeUI(boolean))
   52. [getProgressBar(double)](#getProgressBar(double))
   53. [setProgressBar(double, ActionProgressBar)](#setProgressBar(double,zombie.ui.ActionProgressBar))
   54. [getFadeAlpha()](#getFadeAlpha())
   55. [setFadeAlpha(double)](#setFadeAlpha(double))
   56. [getFadeInTimeMax()](#getFadeInTimeMax())
   57. [setFadeInTimeMax(double)](#setFadeInTimeMax(double))
   58. [getFadeInTime()](#getFadeInTime())
   59. [setFadeInTime(double)](#setFadeInTime(double))
   60. [isFadingOut()](#isFadingOut())
   61. [setFadingOut(boolean)](#setFadingOut(boolean))
   62. [getLastMouseTexture()](#getLastMouseTexture())
   63. [setLastMouseTexture(Texture)](#setLastMouseTexture(zombie.core.textures.Texture))
   64. [getLastPicked()](#getLastPicked())
   65. [setLastPicked(IsoObject)](#setLastPicked(zombie.iso.IsoObject))
   66. [getDoneTutorials()](#getDoneTutorials())
   67. [setDoneTutorials(ArrayList)](#setDoneTutorials(java.util.ArrayList))
   68. [getLastOffX()](#getLastOffX())
   69. [setLastOffX(float)](#setLastOffX(float))
   70. [getLastOffY()](#getLastOffY())
   71. [setLastOffY(float)](#setLastOffY(float))
   72. [getModal()](#getModal())
   73. [setModal(ModalDialog)](#setModal(zombie.ui.ModalDialog))
   74. [getBlack()](#getBlack())
   75. [setBlack(Texture)](#setBlack(zombie.core.textures.Texture))
   76. [getLastAlpha()](#getLastAlpha())
   77. [setLastAlpha(float)](#setLastAlpha(float))
   78. [getPickedTileLocal()](#getPickedTileLocal())
   79. [setPickedTileLocal(Vector2)](#setPickedTileLocal(zombie.iso.Vector2))
   80. [getPickedTile()](#getPickedTile())
   81. [setPickedTile(Vector2)](#setPickedTile(zombie.iso.Vector2))
   82. [getRightDownObject()](#getRightDownObject())
   83. [setRightDownObject(IsoObject)](#setRightDownObject(zombie.iso.IsoObject))
   84. [pushToTop(UIElementInterface)](#pushToTop(zombie.ui.UIElementInterface))
   85. [isShowPausedMessage()](#isShowPausedMessage())
   86. [setShowPausedMessage(boolean)](#setShowPausedMessage(boolean))
   87. [setShowLuaDebuggerOnError(boolean)](#setShowLuaDebuggerOnError(boolean))
   88. [isShowLuaDebuggerOnError()](#isShowLuaDebuggerOnError())
   89. [debugBreakpoint(String, long)](#debugBreakpoint(java.lang.String,long))
   90. [executeGame(ArrayList, boolean, int)](#executeGame(java.util.ArrayList,boolean,int))
   91. [getDefaultThread()](#getDefaultThread())
   92. [getDoubleClickInterval()](#getDoubleClickInterval())
   93. [getDoubleClickDist()](#getDoubleClickDist())
   94. [isDoubleClick(double, double, double, double, double)](#isDoubleClick(double,double,double,double,double))
   95. [updateTooltip(double, double)](#updateTooltip(double,double))
   96. [setPlayerInventory(int, UIElementInterface, UIElementInterface)](#setPlayerInventory(int,zombie.ui.UIElementInterface,zombie.ui.UIElementInterface))
   97. [setPlayerInventoryTooltip(int, UIElementInterface, UIElementInterface)](#setPlayerInventoryTooltip(int,zombie.ui.UIElementInterface,zombie.ui.UIElementInterface))
   98. [isMouseOverInventory()](#isMouseOverInventory())
   99. [updateBeforeFadeOut()](#updateBeforeFadeOut())
   100. [setVisibleAllUI(boolean)](#setVisibleAllUI(boolean))
   101. [setFadeBeforeUI(int, boolean)](#setFadeBeforeUI(int,boolean))
   102. [getFadeAlpha(double)](#getFadeAlpha(double))
   103. [setFadeTime(double, double)](#setFadeTime(double,double))
   104. [FadeIn(double, double)](#FadeIn(double,double))
   105. [FadeOut(double, double)](#FadeOut(double,double))
   106. [isFBOActive()](#isFBOActive())
   107. [getMillisSinceLastUpdate()](#getMillisSinceLastUpdate())
   108. [getSecondsSinceLastUpdate()](#getSecondsSinceLastUpdate())
   109. [getMillisSinceLastRender()](#getMillisSinceLastRender())
   110. [getSecondsSinceLastRender()](#getSecondsSinceLastRender())
   111. [onKeyPress(int)](#onKeyPress(int))
   112. [onKeyRepeat(int)](#onKeyRepeat(int))
   113. [onKeyRelease(int)](#onKeyRelease(int))
   114. [isForceCursorVisible()](#isForceCursorVisible())
   115. [tableget(KahluaTable, Object)](#tableget(se.krka.kahlua.vm.KahluaTable,java.lang.Object))
   116. [getBlinkAlpha(int)](#getBlinkAlpha(int))
   117. [getSyncedIconIndex(int, int)](#getSyncedIconIndex(int,int))
   118. [resetSyncedIconIndex(int)](#resetSyncedIconIndex(int))
   119. [isRendering()](#isRendering())
   120. [isUpdating()](#isUpdating())
   121. [isModalVisible()](#isModalVisible())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UIManager
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.UIManager

---

public final class UIManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static class`

  `UIManager.BlinkInfo`

  `private static class`

  `UIManager.FadeInfo`

  `(package private) static class`

  `UIManager.Sync`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static Texture`

  `black`

  `static Clock`

  `clock`

  `static UIDebugConsole`

  `debugConsole`

  `static final int`

  `DEBUGGER_FPS`

  `(package private) static final ArrayList<zombie.ui.UIElementInterface>`

  `debugUI`

  `static se.krka.kahlua.vm.KahluaThread`

  `defaultthread`

  `static final ArrayList<String>`

  `DoneTutorials`

  `static boolean`

  `doTick`

  `static float`

  `fadeAlpha`

  `static boolean`

  `fadeBeforeUi`

  `static int`

  `fadeInTime`

  `static int`

  `fadeInTimeMax`

  `static boolean`

  `fadingOut`

  `static float`

  `lastAlpha`

  `static Texture`

  `lastMouseTexture`

  `static int`

  `lastMouseX`

  `static int`

  `lastMouseY`

  `static float`

  `lastOffX`

  `static float`

  `lastOffY`

  `static IsoObject`

  `lastPicked`

  `(package private) static int`

  `lastwheel`

  `static String`

  `luaDebuggerAction`

  `static ModalDialog`

  `modal`

  `static final MoodlesUI[]`

  `MoodleUI`

  `static Texture`

  `mouseArrow`

  `static Texture`

  `mouseAttack`

  `static Texture`

  `mouseExamine`

  `static Texture`

  `mouseGrab`

  `static IsoObjectPicker.ClickObject`

  `picked`

  `private static final IsoObjectPicker.ClickObject`

  `pickedCopy`

  `static final Vector2`

  `PickedTile`

  `static final Vector2`

  `PickedTileLocal`

  `private static final UIManager.BlinkInfo[]`

  `playerBlinkInfo`

  `private static final UIManager.FadeInfo[]`

  `playerFadeInfo`

  `private static zombie.ui.UIElementInterface`

  `playerInventoryTooltip`

  `private static zombie.ui.UIElementInterface`

  `playerInventoryUI`

  `private static zombie.ui.UIElementInterface`

  `playerLootTooltip`

  `private static zombie.ui.UIElementInterface`

  `playerLootUI`

  `static se.krka.kahlua.vm.KahluaThread`

  `previousThread`

  `static final ActionProgressBar[]`

  `ProgressBar`

  `private static boolean`

  `rendering`

  `static IsoObject`

  `rightDownObject`

  `(package private) static boolean`

  `showLuaDebuggerOnError`

  `private static boolean`

  `showPausedMessage`

  `static SpeedControls`

  `speedControls`

  `static boolean`

  `suspend`

  `(package private) static final UIManager.Sync`

  `sync`

  `(package private) static final ArrayList<zombie.ui.UIElementInterface>`

  `toAdd`

  `static ObjectTooltip`

  `toolTip`

  `(package private) static final ArrayList<zombie.ui.UIElementInterface>`

  `toRemove`

  `static final ArrayList<zombie.ui.UIElementInterface>`

  `toTop`

  `private static final ArrayList<zombie.ui.UIElementInterface>`

  `tutorialStack`

  `static final ArrayList<zombie.ui.UIElementInterface>`

  `UI`

  `static zombie.core.textures.TextureFBO`

  `uiFbo`

  `static long`

  `uiRenderIntervalMS`

  `static long`

  `uiRenderTimeMS`

  `static boolean`

  `uiTextureContentsValid`

  `static long`

  `uiUpdateIntervalMS`

  `static long`

  `uiUpdateTimeMS`

  `private static boolean`

  `updating`

  `static boolean`

  `useUiFbo`

  `static boolean`

  `visibleAllUi`

  `(package private) static int`

  `wheel`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UIManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `AddUI(zombie.ui.UIElementInterface el)`

  `private static boolean`

  `checkPicked()`

  `static void`

  `clearArrays()`

  `static void`

  `closeContainers()`

  `static void`

  `CloseContainers()`

  `static void`

  `CreateFBO(int width,
  int height)`

  `static zombie.core.textures.TextureFBO`

  `createTexture(float x,
  float y,
  boolean test)`

  `static void`

  `debugBreakpoint(String filename,
  long pc)`

  `static void`

  `DrawTexture(Texture tex,
  double x,
  double y)`

  `static void`

  `DrawTexture(Texture tex,
  double x,
  double y,
  double width,
  double height,
  double alpha)`

  `private static void`

  `executeGame(ArrayList<zombie.ui.UIElementInterface> oldUI,
  boolean bOldSuspend,
  int frameStage)`

  `static void`

  `FadeIn(double seconds)`

  `static void`

  `FadeIn(double playerIndex,
  double seconds)`

  `static void`

  `FadeOut(double seconds)`

  `static void`

  `FadeOut(double playerIndex,
  double seconds)`

  `static Texture`

  `getBlack()`

  `static float`

  `getBlinkAlpha(int playerIndex)`

  `static Clock`

  `getClock()`

  `static UIDebugConsole`

  `getDebugConsole()`

  `static se.krka.kahlua.vm.KahluaThread`

  `getDefaultThread()`

  `static ArrayList<String>`

  `getDoneTutorials()`

  `static Double`

  `getDoubleClickDist()`

  `static Double`

  `getDoubleClickInterval()`

  `static Double`

  `getFadeAlpha()`

  `static float`

  `getFadeAlpha(double playerIndex)`

  `static Double`

  `getFadeInTime()`

  `static Double`

  `getFadeInTimeMax()`

  `static float`

  `getLastAlpha()`

  `static Texture`

  `getLastMouseTexture()`

  `static Double`

  `getLastMouseX()`

  `static Double`

  `getLastMouseY()`

  `static float`

  `getLastOffX()`

  `static float`

  `getLastOffY()`

  `static IsoObject`

  `getLastPicked()`

  `static double`

  `getMillisSinceLastRender()`

  `static double`

  `getMillisSinceLastUpdate()`

  `static ModalDialog`

  `getModal()`

  `static MoodlesUI`

  `getMoodleUI(double index)`

  `static Texture`

  `getMouseArrow()`

  `static Texture`

  `getMouseAttack()`

  `static Texture`

  `getMouseExamine()`

  `static Texture`

  `getMouseGrab()`

  `static IsoObjectPicker.ClickObject`

  `getPicked()`

  `static Vector2`

  `getPickedTile()`

  `static Vector2`

  `getPickedTileLocal()`

  `static ActionProgressBar`

  `getProgressBar(double index)`

  `static IsoObject`

  `getRightDownObject()`

  `static double`

  `getSecondsSinceLastRender()`

  `static double`

  `getSecondsSinceLastUpdate()`

  `static SpeedControls`

  `getSpeedControls()`

  `static int`

  `getSyncedIconIndex(int playerIndex,
  int maxIndex)`

  `static Vector2`

  `getTileFromMouse(double mx,
  double my,
  double z)`

  `static ObjectTooltip`

  `getToolTip()`

  `static ArrayList<zombie.ui.UIElementInterface>`

  `getUI()`

  `private static void`

  `handleZoomKeys()`

  `static void`

  `init()`

  `static boolean`

  `isbFadeBeforeUI()`

  `static Boolean`

  `isDoubleClick(double x1,
  double y1,
  double x2,
  double y2,
  double clickTime)`

  `static Boolean`

  `isFadingOut()`

  `static boolean`

  `isFBOActive()`

  `static boolean`

  `isForceCursorVisible()`

  `static boolean`

  `isModalVisible()`

  `static boolean`

  `isMouseOverInventory()`

  `private static int`

  `isOverElement(zombie.ui.UIElementInterface ui,
  int mx,
  int my)`

  `static boolean`

  `isRendering()`

  `static boolean`

  `isShowLuaDebuggerOnError()`

  `static boolean`

  `isShowPausedMessage()`

  `static boolean`

  `isUpdating()`

  `static boolean`

  `onKeyPress(int key)`

  `static boolean`

  `onKeyRelease(int key)`

  `static boolean`

  `onKeyRepeat(int key)`

  `(package private) static void`

  `pushToTop(zombie.ui.UIElementInterface aThis)`

  `static void`

  `RemoveElement(zombie.ui.UIElementInterface el)`

  `static void`

  `render()`

  `static void`

  `renderFadeOverlay()`

  `static int`

  `resetSyncedIconIndex(int playerIndex)`

  `static void`

  `resize()`

  `static void`

  `setbFadeBeforeUI(boolean abFadeBeforeUI)`

  `static void`

  `setBlack(Texture aBlack)`

  `static void`

  `setClock(Clock aClock)`

  `static void`

  `setDebugConsole(UIDebugConsole aDebugConsole)`

  `static void`

  `setDoneTutorials(ArrayList<String> aDoneTutorials)`

  `static void`

  `setFadeAlpha(double aFadeAlpha)`

  `static void`

  `setFadeBeforeUI(int playerIndex,
  boolean bFadeBeforeUI)`

  `static void`

  `setFadeInTime(double aFadeInTime)`

  `static void`

  `setFadeInTimeMax(double aFadeInTimeMax)`

  `static void`

  `setFadeTime(double playerIndex,
  double fadeTime)`

  `static void`

  `setFadingOut(boolean aFadingOut)`

  `static void`

  `setLastAlpha(float aLastAlpha)`

  `static void`

  `setLastMouseTexture(Texture aLastMouseTexture)`

  `static void`

  `setLastMouseX(double aLastMouseX)`

  `static void`

  `setLastMouseY(double aLastMouseY)`

  `static void`

  `setLastOffX(float aLastOffX)`

  `static void`

  `setLastOffY(float aLastOffY)`

  `static void`

  `setLastPicked(IsoObject aLastPicked)`

  `static void`

  `setModal(ModalDialog aModal)`

  `static void`

  `setMoodleUI(double index,
  MoodlesUI aMoodleUI)`

  `static void`

  `setMouseArrow(Texture aMouseArrow)`

  `static void`

  `setMouseAttack(Texture aMouseAttack)`

  `static void`

  `setMouseExamine(Texture aMouseExamine)`

  `static void`

  `setMouseGrab(Texture aMouseGrab)`

  `static void`

  `setPicked(IsoObjectPicker.ClickObject aPicked)`

  `static void`

  `setPickedTile(Vector2 aPickedTile)`

  `static void`

  `setPickedTileLocal(Vector2 aPickedTileLocal)`

  `static void`

  `setPlayerInventory(int playerIndex,
  zombie.ui.UIElementInterface inventory,
  zombie.ui.UIElementInterface loot)`

  `static void`

  `setPlayerInventoryTooltip(int playerIndex,
  zombie.ui.UIElementInterface inventory,
  zombie.ui.UIElementInterface loot)`

  `static void`

  `setProgressBar(double index,
  ActionProgressBar aProgressBar)`

  `static void`

  `setRightDownObject(IsoObject aRightDownObject)`

  `static void`

  `setShowLuaDebuggerOnError(boolean show)`

  `static void`

  `setShowPausedMessage(boolean showPausedMessage)`

  `static void`

  `setSpeedControls(SpeedControls aSpeedControls)`

  `static void`

  `setToolTip(ObjectTooltip aToolTip)`

  `static void`

  `setUI(ArrayList<zombie.ui.UIElementInterface> aUI)`

  `static void`

  `setVisibleAllUI(boolean visible)`

  `static Object`

  `tableget(se.krka.kahlua.vm.KahluaTable table,
  Object key)`

  `static void`

  `update()`

  `static void`

  `updateBeforeFadeOut()`

  `private static int`

  `updateMouseButtons(int mx,
  int my)`

  `private static boolean`

  `updateMouseMove(int mx,
  int my,
  boolean consumedMove)`

  `protected static void`

  `updateTooltip(double mx,
  double my)`

  `private static void`

  `updateUIElements()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### lastMouseX

    public static int lastMouseX
  + ### lastMouseY

    public static int lastMouseY
  + ### picked

    public static [IsoObjectPicker.ClickObject](../iso/IsoObjectPicker.ClickObject.html "class in zombie.iso") picked
  + ### pickedCopy

    private static final [IsoObjectPicker.ClickObject](../iso/IsoObjectPicker.ClickObject.html "class in zombie.iso") pickedCopy
  + ### clock

    public static [Clock](Clock.html "class in zombie.ui") clock
  + ### UI

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> UI
  + ### toolTip

    public static [ObjectTooltip](ObjectTooltip.html "class in zombie.ui") toolTip
  + ### mouseArrow

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") mouseArrow
  + ### mouseExamine

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") mouseExamine
  + ### mouseAttack

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") mouseAttack
  + ### mouseGrab

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") mouseGrab
  + ### speedControls

    public static [SpeedControls](SpeedControls.html "class in zombie.ui") speedControls
  + ### debugConsole

    public static [UIDebugConsole](UIDebugConsole.html "class in zombie.ui") debugConsole
  + ### MoodleUI

    public static final [MoodlesUI](MoodlesUI.html "class in zombie.ui")[] MoodleUI
  + ### fadeBeforeUi

    public static boolean fadeBeforeUi
  + ### ProgressBar

    public static final [ActionProgressBar](ActionProgressBar.html "class in zombie.ui")[] ProgressBar
  + ### fadeAlpha

    public static float fadeAlpha
  + ### fadeInTimeMax

    public static int fadeInTimeMax
  + ### fadeInTime

    public static int fadeInTime
  + ### fadingOut

    public static boolean fadingOut
  + ### lastMouseTexture

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") lastMouseTexture
  + ### lastPicked

    public static [IsoObject](../iso/IsoObject.html "class in zombie.iso") lastPicked
  + ### DoneTutorials

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> DoneTutorials
  + ### lastOffX

    public static float lastOffX
  + ### lastOffY

    public static float lastOffY
  + ### modal

    public static [ModalDialog](ModalDialog.html "class in zombie.ui") modal
  + ### doTick

    public static boolean doTick
  + ### visibleAllUi

    public static boolean visibleAllUi
  + ### uiFbo

    public static zombie.core.textures.TextureFBO uiFbo
  + ### useUiFbo

    public static boolean useUiFbo
  + ### uiTextureContentsValid

    public static boolean uiTextureContentsValid
  + ### black

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") black
  + ### suspend

    public static boolean suspend
  + ### lastAlpha

    public static float lastAlpha
  + ### PickedTileLocal

    public static final [Vector2](../iso/Vector2.html "class in zombie.iso") PickedTileLocal
  + ### PickedTile

    public static final [Vector2](../iso/Vector2.html "class in zombie.iso") PickedTile
  + ### rightDownObject

    public static [IsoObject](../iso/IsoObject.html "class in zombie.iso") rightDownObject
  + ### uiUpdateTimeMS

    public static long uiUpdateTimeMS
  + ### uiUpdateIntervalMS

    public static long uiUpdateIntervalMS
  + ### uiRenderTimeMS

    public static long uiRenderTimeMS
  + ### uiRenderIntervalMS

    public static long uiRenderIntervalMS
  + ### tutorialStack

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> tutorialStack
  + ### toTop

    public static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> toTop
  + ### defaultthread

    public static se.krka.kahlua.vm.KahluaThread defaultthread
  + ### previousThread

    public static se.krka.kahlua.vm.KahluaThread previousThread
  + ### toRemove

    static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> toRemove
  + ### toAdd

    static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> toAdd
  + ### wheel

    static int wheel
  + ### lastwheel

    static int lastwheel
  + ### debugUI

    static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> debugUI
  + ### showLuaDebuggerOnError

    static boolean showLuaDebuggerOnError
  + ### luaDebuggerAction

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaDebuggerAction
  + ### sync

    static final [UIManager.Sync](UIManager.Sync.html "class in zombie.ui") sync
  + ### showPausedMessage

    private static boolean showPausedMessage
  + ### playerInventoryUI

    private static zombie.ui.UIElementInterface playerInventoryUI
  + ### playerLootUI

    private static zombie.ui.UIElementInterface playerLootUI
  + ### playerInventoryTooltip

    private static zombie.ui.UIElementInterface playerInventoryTooltip
  + ### playerLootTooltip

    private static zombie.ui.UIElementInterface playerLootTooltip
  + ### playerFadeInfo

    private static final [UIManager.FadeInfo](UIManager.FadeInfo.html "class in zombie.ui")[] playerFadeInfo
  + ### playerBlinkInfo

    private static final [UIManager.BlinkInfo](UIManager.BlinkInfo.html "class in zombie.ui")[] playerBlinkInfo
  + ### rendering

    private static boolean rendering
  + ### updating

    private static boolean updating
  + ### DEBUGGER\_FPS

    public static final int DEBUGGER\_FPS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.UIManager.DEBUGGER_FPS)
* Constructor Details
  -------------------

  + ### UIManager

    public UIManager()
* Method Details
  --------------

  + ### AddUI

    public static void AddUI(zombie.ui.UIElementInterface el)
  + ### RemoveElement

    public static void RemoveElement(zombie.ui.UIElementInterface el)
  + ### clearArrays

    public static void clearArrays()
  + ### closeContainers

    public static void closeContainers()
  + ### CloseContainers

    public static void CloseContainers()
  + ### DrawTexture

    public static void DrawTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y)
  + ### DrawTexture

    public static void DrawTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    double x,
    double y,
    double width,
    double height,
    double alpha)
  + ### FadeIn

    public static void FadeIn(double seconds)
  + ### FadeOut

    public static void FadeOut(double seconds)
  + ### CreateFBO

    public static void CreateFBO(int width,
    int height)
  + ### createTexture

    public static zombie.core.textures.TextureFBO createTexture(float x,
    float y,
    boolean test)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### init

    public static void init()
  + ### render

    public static void render()
  + ### renderFadeOverlay

    public static void renderFadeOverlay()
  + ### resize

    public static void resize()
  + ### getTileFromMouse

    public static [Vector2](../iso/Vector2.html "class in zombie.iso") getTileFromMouse(double mx,
    double my,
    double z)
  + ### isOverElement

    private static int isOverElement(zombie.ui.UIElementInterface ui,
    int mx,
    int my)
  + ### update

    public static void update()
  + ### updateMouseButtons

    private static int updateMouseButtons(int mx,
    int my)
  + ### updateMouseMove

    private static boolean updateMouseMove(int mx,
    int my,
    boolean consumedMove)
  + ### updateUIElements

    private static void updateUIElements()
  + ### checkPicked

    private static boolean checkPicked()
  + ### handleZoomKeys

    private static void handleZoomKeys()
  + ### getLastMouseX

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getLastMouseX()
  + ### setLastMouseX

    public static void setLastMouseX(double aLastMouseX)
  + ### getLastMouseY

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getLastMouseY()
  + ### setLastMouseY

    public static void setLastMouseY(double aLastMouseY)
  + ### getPicked

    public static [IsoObjectPicker.ClickObject](../iso/IsoObjectPicker.ClickObject.html "class in zombie.iso") getPicked()
  + ### setPicked

    public static void setPicked([IsoObjectPicker.ClickObject](../iso/IsoObjectPicker.ClickObject.html "class in zombie.iso") aPicked)
  + ### getClock

    public static [Clock](Clock.html "class in zombie.ui") getClock()
  + ### setClock

    public static void setClock([Clock](Clock.html "class in zombie.ui") aClock)
  + ### getUI

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> getUI()
  + ### setUI

    public static void setUI([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> aUI)
  + ### getToolTip

    public static [ObjectTooltip](ObjectTooltip.html "class in zombie.ui") getToolTip()
  + ### setToolTip

    public static void setToolTip([ObjectTooltip](ObjectTooltip.html "class in zombie.ui") aToolTip)
  + ### getMouseArrow

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getMouseArrow()
  + ### setMouseArrow

    public static void setMouseArrow([Texture](../core/textures/Texture.html "class in zombie.core.textures") aMouseArrow)
  + ### getMouseExamine

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getMouseExamine()
  + ### setMouseExamine

    public static void setMouseExamine([Texture](../core/textures/Texture.html "class in zombie.core.textures") aMouseExamine)
  + ### getMouseAttack

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getMouseAttack()
  + ### setMouseAttack

    public static void setMouseAttack([Texture](../core/textures/Texture.html "class in zombie.core.textures") aMouseAttack)
  + ### getMouseGrab

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getMouseGrab()
  + ### setMouseGrab

    public static void setMouseGrab([Texture](../core/textures/Texture.html "class in zombie.core.textures") aMouseGrab)
  + ### getSpeedControls

    public static [SpeedControls](SpeedControls.html "class in zombie.ui") getSpeedControls()
  + ### setSpeedControls

    public static void setSpeedControls([SpeedControls](SpeedControls.html "class in zombie.ui") aSpeedControls)
  + ### getDebugConsole

    public static [UIDebugConsole](UIDebugConsole.html "class in zombie.ui") getDebugConsole()
  + ### setDebugConsole

    public static void setDebugConsole([UIDebugConsole](UIDebugConsole.html "class in zombie.ui") aDebugConsole)
  + ### getMoodleUI

    public static [MoodlesUI](MoodlesUI.html "class in zombie.ui") getMoodleUI(double index)
  + ### setMoodleUI

    public static void setMoodleUI(double index,
    [MoodlesUI](MoodlesUI.html "class in zombie.ui") aMoodleUI)
  + ### isbFadeBeforeUI

    public static boolean isbFadeBeforeUI()
  + ### setbFadeBeforeUI

    public static void setbFadeBeforeUI(boolean abFadeBeforeUI)
  + ### getProgressBar

    public static [ActionProgressBar](ActionProgressBar.html "class in zombie.ui") getProgressBar(double index)
  + ### setProgressBar

    public static void setProgressBar(double index,
    [ActionProgressBar](ActionProgressBar.html "class in zombie.ui") aProgressBar)
  + ### getFadeAlpha

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getFadeAlpha()
  + ### setFadeAlpha

    public static void setFadeAlpha(double aFadeAlpha)
  + ### getFadeInTimeMax

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getFadeInTimeMax()
  + ### setFadeInTimeMax

    public static void setFadeInTimeMax(double aFadeInTimeMax)
  + ### getFadeInTime

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getFadeInTime()
  + ### setFadeInTime

    public static void setFadeInTime(double aFadeInTime)
  + ### isFadingOut

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isFadingOut()
  + ### setFadingOut

    public static void setFadingOut(boolean aFadingOut)
  + ### getLastMouseTexture

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getLastMouseTexture()
  + ### setLastMouseTexture

    public static void setLastMouseTexture([Texture](../core/textures/Texture.html "class in zombie.core.textures") aLastMouseTexture)
  + ### getLastPicked

    public static [IsoObject](../iso/IsoObject.html "class in zombie.iso") getLastPicked()
  + ### setLastPicked

    public static void setLastPicked([IsoObject](../iso/IsoObject.html "class in zombie.iso") aLastPicked)
  + ### getDoneTutorials

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getDoneTutorials()
  + ### setDoneTutorials

    public static void setDoneTutorials([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> aDoneTutorials)
  + ### getLastOffX

    public static float getLastOffX()
  + ### setLastOffX

    public static void setLastOffX(float aLastOffX)
  + ### getLastOffY

    public static float getLastOffY()
  + ### setLastOffY

    public static void setLastOffY(float aLastOffY)
  + ### getModal

    public static [ModalDialog](ModalDialog.html "class in zombie.ui") getModal()
  + ### setModal

    public static void setModal([ModalDialog](ModalDialog.html "class in zombie.ui") aModal)
  + ### getBlack

    public static [Texture](../core/textures/Texture.html "class in zombie.core.textures") getBlack()
  + ### setBlack

    public static void setBlack([Texture](../core/textures/Texture.html "class in zombie.core.textures") aBlack)
  + ### getLastAlpha

    public static float getLastAlpha()
  + ### setLastAlpha

    public static void setLastAlpha(float aLastAlpha)
  + ### getPickedTileLocal

    public static [Vector2](../iso/Vector2.html "class in zombie.iso") getPickedTileLocal()
  + ### setPickedTileLocal

    public static void setPickedTileLocal([Vector2](../iso/Vector2.html "class in zombie.iso") aPickedTileLocal)
  + ### getPickedTile

    public static [Vector2](../iso/Vector2.html "class in zombie.iso") getPickedTile()
  + ### setPickedTile

    public static void setPickedTile([Vector2](../iso/Vector2.html "class in zombie.iso") aPickedTile)
  + ### getRightDownObject

    public static [IsoObject](../iso/IsoObject.html "class in zombie.iso") getRightDownObject()
  + ### setRightDownObject

    public static void setRightDownObject([IsoObject](../iso/IsoObject.html "class in zombie.iso") aRightDownObject)
  + ### pushToTop

    static void pushToTop(zombie.ui.UIElementInterface aThis)
  + ### isShowPausedMessage

    public static boolean isShowPausedMessage()
  + ### setShowPausedMessage

    public static void setShowPausedMessage(boolean showPausedMessage)
  + ### setShowLuaDebuggerOnError

    public static void setShowLuaDebuggerOnError(boolean show)
  + ### isShowLuaDebuggerOnError

    public static boolean isShowLuaDebuggerOnError()
  + ### debugBreakpoint

    public static void debugBreakpoint([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename,
    long pc)
  + ### executeGame

    private static void executeGame([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> oldUI,
    boolean bOldSuspend,
    int frameStage)
  + ### getDefaultThread

    public static se.krka.kahlua.vm.KahluaThread getDefaultThread()
  + ### getDoubleClickInterval

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getDoubleClickInterval()
  + ### getDoubleClickDist

    public static [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getDoubleClickDist()
  + ### isDoubleClick

    public static [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") isDoubleClick(double x1,
    double y1,
    double x2,
    double y2,
    double clickTime)
  + ### updateTooltip

    protected static void updateTooltip(double mx,
    double my)
  + ### setPlayerInventory

    public static void setPlayerInventory(int playerIndex,
    zombie.ui.UIElementInterface inventory,
    zombie.ui.UIElementInterface loot)
  + ### setPlayerInventoryTooltip

    public static void setPlayerInventoryTooltip(int playerIndex,
    zombie.ui.UIElementInterface inventory,
    zombie.ui.UIElementInterface loot)
  + ### isMouseOverInventory

    public static boolean isMouseOverInventory()
  + ### updateBeforeFadeOut

    public static void updateBeforeFadeOut()
  + ### setVisibleAllUI

    public static void setVisibleAllUI(boolean visible)
  + ### setFadeBeforeUI

    public static void setFadeBeforeUI(int playerIndex,
    boolean bFadeBeforeUI)
  + ### getFadeAlpha

    public static float getFadeAlpha(double playerIndex)
  + ### setFadeTime

    public static void setFadeTime(double playerIndex,
    double fadeTime)
  + ### FadeIn

    public static void FadeIn(double playerIndex,
    double seconds)
  + ### FadeOut

    public static void FadeOut(double playerIndex,
    double seconds)
  + ### isFBOActive

    public static boolean isFBOActive()
  + ### getMillisSinceLastUpdate

    public static double getMillisSinceLastUpdate()
  + ### getSecondsSinceLastUpdate

    public static double getSecondsSinceLastUpdate()
  + ### getMillisSinceLastRender

    public static double getMillisSinceLastRender()
  + ### getSecondsSinceLastRender

    public static double getSecondsSinceLastRender()
  + ### onKeyPress

    public static boolean onKeyPress(int key)
  + ### onKeyRepeat

    public static boolean onKeyRepeat(int key)
  + ### onKeyRelease

    public static boolean onKeyRelease(int key)
  + ### isForceCursorVisible

    public static boolean isForceCursorVisible()
  + ### tableget

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") tableget(se.krka.kahlua.vm.KahluaTable table,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### getBlinkAlpha

    public static float getBlinkAlpha(int playerIndex)
  + ### getSyncedIconIndex

    public static int getSyncedIconIndex(int playerIndex,
    int maxIndex)
  + ### resetSyncedIconIndex

    public static int resetSyncedIconIndex(int playerIndex)
  + ### isRendering

    public static boolean isRendering()
  + ### isUpdating

    public static boolean isUpdating()
  + ### isModalVisible

    public static boolean isModalVisible()