[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoCamera](IsoCamera.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [frameState](#frameState)
   2. [cameras](#cameras)
   3. [isoCameraGameCharacter](#isoCameraGameCharacter)
   4. [TargetTileX](#TargetTileX)
   5. [targetTileY](#targetTileY)
   6. [playerOffsetX](#playerOffsetX)
   7. [playerOffsetY](#playerOffsetY)
7. [Constructor Details](#constructor-detail)
   1. [IsoCamera()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [init()](#init())
   2. [update()](#update())
   3. [updateAll()](#updateAll())
   4. [SetCharacterToFollow(IsoGameCharacter)](#SetCharacterToFollow(zombie.characters.IsoGameCharacter))
   5. [getRightClickOffX()](#getRightClickOffX())
   6. [getRightClickOffY()](#getRightClickOffY())
   7. [getOffX()](#getOffX())
   8. [getOffX(int)](#getOffX(int))
   9. [getTOffX()](#getTOffX())
   10. [setOffX(float)](#setOffX(float))
   11. [getOffY()](#getOffY())
   12. [getOffY(int)](#getOffY(int))
   13. [getTOffY()](#getTOffY())
   14. [setOffY(float)](#setOffY(float))
   15. [getLastOffX()](#getLastOffX())
   16. [setLastOffX(float)](#setLastOffX(float))
   17. [getLastOffY()](#getLastOffY())
   18. [setLastOffY(float)](#setLastOffY(float))
   19. [getCameraCharacter()](#getCameraCharacter())
   20. [getCameraCharacterZ()](#getCameraCharacterZ())
   21. [setCameraCharacter(IsoGameCharacter)](#setCameraCharacter(zombie.characters.IsoGameCharacter))
   22. [clearCameraCharacter()](#clearCameraCharacter())
   23. [getTargetTileY()](#getTargetTileY())
   24. [setTargetTileY(int)](#setTargetTileY(int))
   25. [getScreenLeft(int)](#getScreenLeft(int))
   26. [getScreenWidth(int)](#getScreenWidth(int))
   27. [getScreenTop(int)](#getScreenTop(int))
   28. [getScreenHeight(int)](#getScreenHeight(int))
   29. [getOffscreenLeft(int)](#getOffscreenLeft(int))
   30. [getOffscreenWidth(int)](#getOffscreenWidth(int))
   31. [getOffscreenTop(int)](#getOffscreenTop(int))
   32. [getOffscreenHeight(int)](#getOffscreenHeight(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoCamera
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoCamera

---

public class IsoCamera
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `IsoCamera.FrameState`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final zombie.iso.PlayerCamera[]`

  `cameras`

  `static final IsoCamera.FrameState`

  `frameState`

  `private static IsoGameCharacter`

  `isoCameraGameCharacter`

  `static int`

  `playerOffsetX`

  `static int`

  `playerOffsetY`

  `private static final int`

  `TargetTileX`

  `private static int`

  `targetTileY`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoCamera()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `clearCameraCharacter()`

  `static IsoGameCharacter`

  `getCameraCharacter()`

  `static float`

  `getCameraCharacterZ()`

  `static float`

  `getLastOffX()`

  `static float`

  `getLastOffY()`

  `static int`

  `getOffscreenHeight(int playerIndex)`

  `static int`

  `getOffscreenLeft(int playerIndex)`

  `static int`

  `getOffscreenTop(int playerIndex)`

  `static int`

  `getOffscreenWidth(int playerIndex)`

  `static float`

  `getOffX()`

  `static float`

  `getOffX(int playerIndex)`

  `static float`

  `getOffY()`

  `static float`

  `getOffY(int playerIndex)`

  `static float`

  `getRightClickOffX()`

  `static float`

  `getRightClickOffY()`

  `static int`

  `getScreenHeight(int playerIndex)`

  `static int`

  `getScreenLeft(int playerIndex)`

  `static int`

  `getScreenTop(int playerIndex)`

  `static int`

  `getScreenWidth(int playerIndex)`

  `static int`

  `getTargetTileY()`

  `static float`

  `getTOffX()`

  `static float`

  `getTOffY()`

  `static void`

  `init()`

  `static boolean`

  `setCameraCharacter(IsoGameCharacter isoGameCharacter)`

  `static void`

  `SetCharacterToFollow(IsoGameCharacter isoGameCharacter)`

  `static void`

  `setLastOffX(float aLastOffX)`

  `static void`

  `setLastOffY(float aLastOffY)`

  `static void`

  `setOffX(float aOffX)`

  `static void`

  `setOffY(float aOffY)`

  `static void`

  `setTargetTileY(int aTargetTileY)`

  `static void`

  `update()`

  `static void`

  `updateAll()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### frameState

    public static final [IsoCamera.FrameState](IsoCamera.FrameState.html "class in zombie.iso") frameState
  + ### cameras

    public static final zombie.iso.PlayerCamera[] cameras
  + ### isoCameraGameCharacter

    private static [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoCameraGameCharacter
  + ### TargetTileX

    private static final int TargetTileX

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoCamera.TargetTileX)
  + ### targetTileY

    private static int targetTileY
  + ### playerOffsetX

    public static int playerOffsetX
  + ### playerOffsetY

    public static int playerOffsetY
* Constructor Details
  -------------------

  + ### IsoCamera

    public IsoCamera()
* Method Details
  --------------

  + ### init

    public static void init()
  + ### update

    public static void update()
  + ### updateAll

    public static void updateAll()
  + ### SetCharacterToFollow

    public static void SetCharacterToFollow([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### getRightClickOffX

    public static float getRightClickOffX()
  + ### getRightClickOffY

    public static float getRightClickOffY()
  + ### getOffX

    public static float getOffX()
  + ### getOffX

    public static float getOffX(int playerIndex)
  + ### getTOffX

    public static float getTOffX()
  + ### setOffX

    public static void setOffX(float aOffX)
  + ### getOffY

    public static float getOffY()
  + ### getOffY

    public static float getOffY(int playerIndex)
  + ### getTOffY

    public static float getTOffY()
  + ### setOffY

    public static void setOffY(float aOffY)
  + ### getLastOffX

    public static float getLastOffX()
  + ### setLastOffX

    public static void setLastOffX(float aLastOffX)
  + ### getLastOffY

    public static float getLastOffY()
  + ### setLastOffY

    public static void setLastOffY(float aLastOffY)
  + ### getCameraCharacter

    public static [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getCameraCharacter()
  + ### getCameraCharacterZ

    public static float getCameraCharacterZ()
  + ### setCameraCharacter

    public static boolean setCameraCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### clearCameraCharacter

    public static void clearCameraCharacter()
  + ### getTargetTileY

    public static int getTargetTileY()
  + ### setTargetTileY

    public static void setTargetTileY(int aTargetTileY)
  + ### getScreenLeft

    public static int getScreenLeft(int playerIndex)
  + ### getScreenWidth

    public static int getScreenWidth(int playerIndex)
  + ### getScreenTop

    public static int getScreenTop(int playerIndex)
  + ### getScreenHeight

    public static int getScreenHeight(int playerIndex)
  + ### getOffscreenLeft

    public static int getOffscreenLeft(int playerIndex)
  + ### getOffscreenWidth

    public static int getOffscreenWidth(int playerIndex)
  + ### getOffscreenTop

    public static int getOffscreenTop(int playerIndex)
  + ### getOffscreenHeight

    public static int getOffscreenHeight(int playerIndex)