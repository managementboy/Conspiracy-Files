[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [org.lwjglx.input](package-summary.html)
2. [Mouse](Mouse.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [grabbed](#grabbed)
   2. [lastX](#lastX)
   3. [lastY](#lastY)
   4. [latestX](#latestX)
   5. [latestY](#latestY)
   6. [x](#x)
   7. [y](#y)
   8. [queue](#queue)
   9. [buttonEvents](#buttonEvents)
   10. [buttonEventStates](#buttonEventStates)
   11. [xEvents](#xEvents)
   12. [yEvents](#yEvents)
   13. [lastxEvents](#lastxEvents)
   14. [lastyEvents](#lastyEvents)
   15. [nanoTimeEvents](#nanoTimeEvents)
   16. [clipPostionToDisplay](#clipPostionToDisplay)
   17. [scrollxpos](#scrollxpos)
   18. [scrollypos](#scrollypos)
6. [Constructor Details](#constructor-detail)
   1. [Mouse()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addMoveEvent(double, double)](#addMoveEvent(double,double))
   2. [addButtonEvent(int, boolean)](#addButtonEvent(int,boolean))
   3. [poll()](#poll())
   4. [create()](#create())
   5. [isCreated()](#isCreated())
   6. [setGrabbed(boolean)](#setGrabbed(boolean))
   7. [isGrabbed()](#isGrabbed())
   8. [isButtonDown(int)](#isButtonDown(int))
   9. [next()](#next())
   10. [getEventX()](#getEventX())
   11. [getEventY()](#getEventY())
   12. [getEventDX()](#getEventDX())
   13. [getEventDY()](#getEventDY())
   14. [getEventNanoseconds()](#getEventNanoseconds())
   15. [getEventButton()](#getEventButton())
   16. [getEventButtonState()](#getEventButtonState())
   17. [getEventDWheel()](#getEventDWheel())
   18. [getX()](#getX())
   19. [getY()](#getY())
   20. [getDX()](#getDX())
   21. [getDY()](#getDY())
   22. [getDWheel()](#getDWheel())
   23. [getButtonCount()](#getButtonCount())
   24. [setClipMouseCoordinatesToWindow(boolean)](#setClipMouseCoordinatesToWindow(boolean))
   25. [setCursorPosition(int, int)](#setCursorPosition(int,int))
   26. [setNativeCursor(Cursor)](#setNativeCursor(org.lwjglx.input.Cursor))
   27. [destroy()](#destroy())
   28. [updateCursor()](#updateCursor())
   29. [setDWheel(double, double)](#setDWheel(double,double))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Mouse
===========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

org.lwjglx.input.Mouse

---

public class Mouse
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final int[]`

  `buttonEvents`

  `private static final boolean[]`

  `buttonEventStates`

  `private static boolean`

  `clipPostionToDisplay`

  `private static boolean`

  `grabbed`

  `private static int`

  `lastX`

  `private static final int[]`

  `lastxEvents`

  `private static int`

  `lastY`

  `private static final int[]`

  `lastyEvents`

  `private static int`

  `latestX`

  `private static int`

  `latestY`

  `private static final long[]`

  `nanoTimeEvents`

  `private static final org.lwjglx.input.EventQueue`

  `queue`

  `(package private) static double`

  `scrollxpos`

  `(package private) static double`

  `scrollypos`

  `private static int`

  `x`

  `private static final int[]`

  `xEvents`

  `private static int`

  `y`

  `private static final int[]`

  `yEvents`
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

  `static void`

  `addButtonEvent(int button,
  boolean pressed)`

  `static void`

  `addMoveEvent(double mouseX,
  double mouseY)`

  `static void`

  `create()`

  `static void`

  `destroy()`

  `static int`

  `getButtonCount()`

  `static int`

  `getDWheel()`

  `static int`

  `getDX()`

  `static int`

  `getDY()`

  `static int`

  `getEventButton()`

  `static boolean`

  `getEventButtonState()`

  `static int`

  `getEventDWheel()`

  `static int`

  `getEventDX()`

  `static int`

  `getEventDY()`

  `static long`

  `getEventNanoseconds()`

  `static int`

  `getEventX()`

  `static int`

  `getEventY()`

  `static int`

  `getX()`

  `static int`

  `getY()`

  `static boolean`

  `isButtonDown(int button)`

  `static boolean`

  `isCreated()`

  `static boolean`

  `isGrabbed()`

  `static boolean`

  `next()`

  `static void`

  `poll()`

  `static void`

  `setClipMouseCoordinatesToWindow(boolean clip)`

  `static void`

  `setCursorPosition(int new_x,
  int new_y)`

  `static void`

  `setDWheel(double xpos,
  double ypos)`

  `static void`

  `setGrabbed(boolean grab)`

  `static org.lwjglx.input.Cursor`

  `setNativeCursor(org.lwjglx.input.Cursor cursor)`

  `static void`

  `updateCursor()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### grabbed

    private static boolean grabbed
  + ### lastX

    private static int lastX
  + ### lastY

    private static int lastY
  + ### latestX

    private static int latestX
  + ### latestY

    private static int latestY
  + ### x

    private static int x
  + ### y

    private static int y
  + ### queue

    private static final org.lwjglx.input.EventQueue queue
  + ### buttonEvents

    private static final int[] buttonEvents
  + ### buttonEventStates

    private static final boolean[] buttonEventStates
  + ### xEvents

    private static final int[] xEvents
  + ### yEvents

    private static final int[] yEvents
  + ### lastxEvents

    private static final int[] lastxEvents
  + ### lastyEvents

    private static final int[] lastyEvents
  + ### nanoTimeEvents

    private static final long[] nanoTimeEvents
  + ### clipPostionToDisplay

    private static boolean clipPostionToDisplay
  + ### scrollxpos

    static double scrollxpos
  + ### scrollypos

    static double scrollypos
* Constructor Details
  -------------------

  + ### Mouse

    public Mouse()
* Method Details
  --------------

  + ### addMoveEvent

    public static void addMoveEvent(double mouseX,
    double mouseY)
  + ### addButtonEvent

    public static void addButtonEvent(int button,
    boolean pressed)
  + ### poll

    public static void poll()
  + ### create

    public static void create()
    throws org.lwjglx.LWJGLException

    Throws:
    :   `org.lwjglx.LWJGLException`
  + ### isCreated

    public static boolean isCreated()
  + ### setGrabbed

    public static void setGrabbed(boolean grab)
  + ### isGrabbed

    public static boolean isGrabbed()
  + ### isButtonDown

    public static boolean isButtonDown(int button)
  + ### next

    public static boolean next()
  + ### getEventX

    public static int getEventX()
  + ### getEventY

    public static int getEventY()
  + ### getEventDX

    public static int getEventDX()
  + ### getEventDY

    public static int getEventDY()
  + ### getEventNanoseconds

    public static long getEventNanoseconds()
  + ### getEventButton

    public static int getEventButton()
  + ### getEventButtonState

    public static boolean getEventButtonState()
  + ### getEventDWheel

    public static int getEventDWheel()
  + ### getX

    public static int getX()
  + ### getY

    public static int getY()
  + ### getDX

    public static int getDX()
  + ### getDY

    public static int getDY()
  + ### getDWheel

    public static int getDWheel()
  + ### getButtonCount

    public static int getButtonCount()
  + ### setClipMouseCoordinatesToWindow

    public static void setClipMouseCoordinatesToWindow(boolean clip)
  + ### setCursorPosition

    public static void setCursorPosition(int new\_x,
    int new\_y)
  + ### setNativeCursor

    public static org.lwjglx.input.Cursor setNativeCursor(org.lwjglx.input.Cursor cursor)
    throws org.lwjglx.LWJGLException

    Throws:
    :   `org.lwjglx.LWJGLException`
  + ### destroy

    public static void destroy()
  + ### updateCursor

    public static void updateCursor()
  + ### setDWheel

    public static void setDWheel(double xpos,
    double ypos)