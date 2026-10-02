[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.input](package-summary.html)
2. [Mouse](Mouse.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [timeRightPressed](#timeRightPressed)
   4. [TIME\_RIGHT\_PRESSED\_SECONDS](#TIME_RIGHT_PRESSED_SECONDS)
   5. [BTN\_OFFSET](#BTN_OFFSET)
   6. [BTN\_0](#BTN_0)
   7. [BTN\_1](#BTN_1)
   8. [BTN\_2](#BTN_2)
   9. [BTN\_3](#BTN_3)
   10. [BTN\_4](#BTN_4)
   11. [BTN\_5](#BTN_5)
   12. [BTN\_6](#BTN_6)
   13. [BTN\_7](#BTN_7)
   14. [LMB](#LMB)
   15. [RMB](#RMB)
   16. [MMB](#MMB)
   17. [buttonDownStates](#buttonDownStates)
   18. [buttonPrevStates](#buttonPrevStates)
   19. [lastActivity](#lastActivity)
   20. [wheelDelta](#wheelDelta)
   21. [s\_mouseStateCache](#s_mouseStateCache)
   22. [uiCaptured](#uiCaptured)
   23. [blankCursor](#blankCursor)
   24. [defaultCursor](#defaultCursor)
   25. [isCursorVisible](#isCursorVisible)
   26. [mouseCursorTexture](#mouseCursorTexture)
6. [Constructor Details](#constructor-detail)
   1. [Mouse()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getWheelState()](#getWheelState())
   2. [getButtonCount()](#getButtonCount())
   3. [getXA()](#getXA())
   4. [getYA()](#getYA())
   5. [getX()](#getX())
   6. [getY()](#getY())
   7. [isButtonKey(int)](#isButtonKey(int))
   8. [isButtonDown(int)](#isButtonDown(int))
   9. [wasButtonDown(int)](#wasButtonDown(int))
   10. [isButtonPressed(int)](#isButtonPressed(int))
   11. [isButtonReleased(int)](#isButtonReleased(int))
   12. [UIBlockButtonDown(int)](#UIBlockButtonDown(int))
   13. [isButtonDownUICheck(int)](#isButtonDownUICheck(int))
   14. [isRightDelay()](#isRightDelay())
   15. [isLeftDown()](#isLeftDown())
   16. [isLeftPressed()](#isLeftPressed())
   17. [isLeftReleased()](#isLeftReleased())
   18. [isLeftUp()](#isLeftUp())
   19. [isMiddleDown()](#isMiddleDown())
   20. [isMiddlePressed()](#isMiddlePressed())
   21. [isMiddleReleased()](#isMiddleReleased())
   22. [isMiddleUp()](#isMiddleUp())
   23. [isRightDown()](#isRightDown())
   24. [isRightPressed()](#isRightPressed())
   25. [isRightReleased()](#isRightReleased())
   26. [isRightUp()](#isRightUp())
   27. [update()](#update())
   28. [poll()](#poll())
   29. [setXY(int, int)](#setXY(int,int))
   30. [loadCursor(String)](#loadCursor(java.lang.String))
   31. [initCustomCursor()](#initCustomCursor())
   32. [setCursorVisible(boolean)](#setCursorVisible(boolean))
   33. [isCursorVisible()](#isCursorVisible())
   34. [renderCursorTexture()](#renderCursorTexture())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Mouse
===========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.input.Mouse

---

public final class Mouse
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) static org.lwjglx.input.Cursor`

  `blankCursor`

  `static final int`

  `BTN_0`

  `static final int`

  `BTN_1`

  `static final int`

  `BTN_2`

  `static final int`

  `BTN_3`

  `static final int`

  `BTN_4`

  `static final int`

  `BTN_5`

  `static final int`

  `BTN_6`

  `static final int`

  `BTN_7`

  `static final int`

  `BTN_OFFSET`

  `static boolean[]`

  `buttonDownStates`

  `static boolean[]`

  `buttonPrevStates`

  `(package private) static org.lwjglx.input.Cursor`

  `defaultCursor`

  `private static boolean`

  `isCursorVisible`

  `static long`

  `lastActivity`

  `static final int`

  `LMB`

  `static final int`

  `MMB`

  `private static Texture`

  `mouseCursorTexture`

  `static final int`

  `RMB`

  `private static final zombie.input.MouseStateCache`

  `s_mouseStateCache`

  `private static final float`

  `TIME_RIGHT_PRESSED_SECONDS`

  `private static float`

  `timeRightPressed`

  `static boolean[]`

  `uiCaptured`

  `static int`

  `wheelDelta`

  `protected static int`

  `x`

  `protected static int`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Mouse()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static int`

  `getButtonCount()`

  `static int`

  `getWheelState()`

  `static int`

  `getX()`

  `static int`

  `getXA()`

  `static int`

  `getY()`

  `static int`

  `getYA()`

  `static void`

  `initCustomCursor()`

  `static boolean`

  `isButtonDown(int number)`

  `static boolean`

  `isButtonDownUICheck(int number)`

  `static boolean`

  `isButtonKey(int key)`

  `static boolean`

  `isButtonPressed(int number)`

  `static boolean`

  `isButtonReleased(int number)`

  `static boolean`

  `isCursorVisible()`

  `static boolean`

  `isLeftDown()`

  `static boolean`

  `isLeftPressed()`

  `static boolean`

  `isLeftReleased()`

  `static boolean`

  `isLeftUp()`

  `static boolean`

  `isMiddleDown()`

  `static boolean`

  `isMiddlePressed()`

  `static boolean`

  `isMiddleReleased()`

  `static boolean`

  `isMiddleUp()`

  `static boolean`

  `isRightDelay()`

  Checks the delay timer for input actions bound to RMB.

  `static boolean`

  `isRightDown()`

  `static boolean`

  `isRightPressed()`

  `static boolean`

  `isRightReleased()`

  `static boolean`

  `isRightUp()`

  `static org.lwjglx.input.Cursor`

  `loadCursor(String filename)`

  `static void`

  `poll()`

  `static void`

  `renderCursorTexture()`

  `static void`

  `setCursorVisible(boolean bVisible)`

  `static void`

  `setXY(int x,
  int y)`

  `static void`

  `UIBlockButtonDown(int number)`

  `static void`

  `update()`

  `static boolean`

  `wasButtonDown(int number)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    protected static int x
  + ### y

    protected static int y
  + ### timeRightPressed

    private static float timeRightPressed
  + ### TIME\_RIGHT\_PRESSED\_SECONDS

    private static final float TIME\_RIGHT\_PRESSED\_SECONDS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.TIME_RIGHT_PRESSED_SECONDS)
  + ### BTN\_OFFSET

    public static final int BTN\_OFFSET

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.BTN_OFFSET)
  + ### BTN\_0

    public static final int BTN\_0

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.BTN_0)
  + ### BTN\_1

    public static final int BTN\_1

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.BTN_1)
  + ### BTN\_2

    public static final int BTN\_2

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.BTN_2)
  + ### BTN\_3

    public static final int BTN\_3

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.BTN_3)
  + ### BTN\_4

    public static final int BTN\_4

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.BTN_4)
  + ### BTN\_5

    public static final int BTN\_5

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.BTN_5)
  + ### BTN\_6

    public static final int BTN\_6

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.BTN_6)
  + ### BTN\_7

    public static final int BTN\_7

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.BTN_7)
  + ### LMB

    public static final int LMB

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.LMB)
  + ### RMB

    public static final int RMB

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.RMB)
  + ### MMB

    public static final int MMB

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.input.Mouse.MMB)
  + ### buttonDownStates

    public static boolean[] buttonDownStates
  + ### buttonPrevStates

    public static boolean[] buttonPrevStates
  + ### lastActivity

    public static long lastActivity
  + ### wheelDelta

    public static int wheelDelta
  + ### s\_mouseStateCache

    private static final zombie.input.MouseStateCache s\_mouseStateCache
  + ### uiCaptured

    public static boolean[] uiCaptured
  + ### blankCursor

    static org.lwjglx.input.Cursor blankCursor
  + ### defaultCursor

    static org.lwjglx.input.Cursor defaultCursor
  + ### isCursorVisible

    private static boolean isCursorVisible
  + ### mouseCursorTexture

    private static [Texture](../core/textures/Texture.html "class in zombie.core.textures") mouseCursorTexture
* Constructor Details
  -------------------

  + ### Mouse

    public Mouse()
* Method Details
  --------------

  + ### getWheelState

    public static int getWheelState()
  + ### getButtonCount

    public static int getButtonCount()
  + ### getXA

    public static int getXA()
  + ### getYA

    public static int getYA()
  + ### getX

    public static int getX()
  + ### getY

    public static int getY()
  + ### isButtonKey

    public static boolean isButtonKey(int key)
  + ### isButtonDown

    public static boolean isButtonDown(int number)
  + ### wasButtonDown

    public static boolean wasButtonDown(int number)
  + ### isButtonPressed

    public static boolean isButtonPressed(int number)
  + ### isButtonReleased

    public static boolean isButtonReleased(int number)
  + ### UIBlockButtonDown

    public static void UIBlockButtonDown(int number)
  + ### isButtonDownUICheck

    public static boolean isButtonDownUICheck(int number)
  + ### isRightDelay

    public static boolean isRightDelay()

    Checks the delay timer for input actions bound to RMB.
    These actions need to be delayed, or they occur the same time as right click context menus
    which will get triggered unintentionally when trying to bring up a menu.
    as such, events and methods checking mouse buttons route through here when its RMB.

    Returns:
    :   true if time has passed and RMB is still down
  + ### isLeftDown

    public static boolean isLeftDown()
  + ### isLeftPressed

    public static boolean isLeftPressed()
  + ### isLeftReleased

    public static boolean isLeftReleased()
  + ### isLeftUp

    public static boolean isLeftUp()
  + ### isMiddleDown

    public static boolean isMiddleDown()
  + ### isMiddlePressed

    public static boolean isMiddlePressed()
  + ### isMiddleReleased

    public static boolean isMiddleReleased()
  + ### isMiddleUp

    public static boolean isMiddleUp()
  + ### isRightDown

    public static boolean isRightDown()
  + ### isRightPressed

    public static boolean isRightPressed()
  + ### isRightReleased

    public static boolean isRightReleased()
  + ### isRightUp

    public static boolean isRightUp()
  + ### update

    public static void update()
  + ### poll

    public static void poll()
  + ### setXY

    public static void setXY(int x,
    int y)
  + ### loadCursor

    public static org.lwjglx.input.Cursor loadCursor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
    throws org.lwjglx.LWJGLException

    Throws:
    :   `org.lwjglx.LWJGLException`
  + ### initCustomCursor

    public static void initCustomCursor()
  + ### setCursorVisible

    public static void setCursorVisible(boolean bVisible)
  + ### isCursorVisible

    public static boolean isCursorVisible()
  + ### renderCursorTexture

    public static void renderCursorTexture()