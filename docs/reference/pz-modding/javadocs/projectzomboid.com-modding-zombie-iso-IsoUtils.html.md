[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoUtils](IsoUtils.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [IsoUtils()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [clamp(float, float, float)](#clamp(float,float,float))
   2. [lerp(float, float, float)](#lerp(float,float,float))
   3. [smoothstep(float, float, float)](#smoothstep(float,float,float))
   4. [DistanceTo(float, float, float, float)](#DistanceTo(float,float,float,float))
   5. [DistanceTo2D(float, float, float, float)](#DistanceTo2D(float,float,float,float))
   6. [DistanceTo(float, float, float, float, float, float)](#DistanceTo(float,float,float,float,float,float))
   7. [DistanceToSquared(float, float, float, float, float, float)](#DistanceToSquared(float,float,float,float,float,float))
   8. [DistanceToSquared(float, float, float, float)](#DistanceToSquared(float,float,float,float))
   9. [DistanceManhatten(float, float, float, float)](#DistanceManhatten(float,float,float,float))
   10. [DistanceManhatten(float, float, float, float, float, float)](#DistanceManhatten(float,float,float,float,float,float))
   11. [DistanceManhattenSquare(float, float, float, float)](#DistanceManhattenSquare(float,float,float,float))
   12. [XToIso(float, float, float)](#XToIso(float,float,float))
   13. [XToIso(int, float, float, float)](#XToIso(int,float,float,float))
   14. [XToIsoTrue(float, float, int)](#XToIsoTrue(float,float,int))
   15. [XToScreen(float, float, float, int)](#XToScreen(float,float,float,int))
   16. [XToScreenInt(int, int, int, int)](#XToScreenInt(int,int,int,int))
   17. [YToScreenExact(float, float, float, int)](#YToScreenExact(float,float,float,int))
   18. [XToScreenExact(float, float, float, int)](#XToScreenExact(float,float,float,int))
   19. [YToIso(float, float, float)](#YToIso(float,float,float))
   20. [YToIso(int, float, float, float)](#YToIso(int,float,float,float))
   21. [YToScreen(float, float, float, int)](#YToScreen(float,float,float,int))
   22. [YToScreenInt(int, int, int, int)](#YToScreenInt(int,int,int,int))
   23. [isSimilarDirection(IsoGameCharacter, float, float, float, float, float)](#isSimilarDirection(zombie.characters.IsoGameCharacter,float,float,float,float,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoUtils
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoUtils

---

public final class IsoUtils
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoUtils()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static float`

  `clamp(float x,
  float minVal,
  float maxVal)`

  `static float`

  `DistanceManhatten(float fromX,
  float fromY,
  float toX,
  float toY)`

  `static float`

  `DistanceManhatten(float fromX,
  float fromY,
  float toX,
  float toY,
  float fromZ,
  float toZ)`

  `static float`

  `DistanceManhattenSquare(float fromX,
  float fromY,
  float toX,
  float toY)`

  `static float`

  `DistanceTo(float fromX,
  float fromY,
  float toX,
  float toY)`

  `static float`

  `DistanceTo(float fromX,
  float fromY,
  float fromZ,
  float toX,
  float toY,
  float toZ)`

  `static float`

  `DistanceTo2D(float fromX,
  float fromY,
  float toX,
  float toY)`

  `static float`

  `DistanceToSquared(float fromX,
  float fromY,
  float toX,
  float toY)`

  `static float`

  `DistanceToSquared(float fromX,
  float fromY,
  float fromZ,
  float toX,
  float toY,
  float toZ)`

  `static boolean`

  `isSimilarDirection(IsoGameCharacter chr,
  float xA,
  float yA,
  float xB,
  float yB,
  float similar)`

  `static float`

  `lerp(float val,
  float min,
  float max)`

  `static float`

  `smoothstep(float edge0,
  float edge1,
  float x)`

  `static float`

  `XToIso(float screenX,
  float screenY,
  float floor)`

  `static float`

  `XToIso(int playerIndex,
  float screenX,
  float screenY,
  float floor)`

  `static float`

  `XToIsoTrue(float screenX,
  float screenY,
  int floor)`

  `static float`

  `XToScreen(float objectX,
  float objectY,
  float objectZ,
  int screenZ)`

  `static float`

  `XToScreenExact(float objectX,
  float objectY,
  float objectZ,
  int screenZ)`

  `static float`

  `XToScreenInt(int objectX,
  int objectY,
  int objectZ,
  int screenZ)`

  `static float`

  `YToIso(float screenX,
  float screenY,
  float floor)`

  `static float`

  `YToIso(int playerIndex,
  float screenX,
  float screenY,
  float floor)`

  `static float`

  `YToScreen(float objectX,
  float objectY,
  float objectZ,
  int screenZ)`

  `static float`

  `YToScreenExact(float objectX,
  float objectY,
  float objectZ,
  int screenZ)`

  `static float`

  `YToScreenInt(int objectX,
  int objectY,
  int objectZ,
  int screenZ)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### IsoUtils

    public IsoUtils()
* Method Details
  --------------

  + ### clamp

    public static float clamp(float x,
    float minVal,
    float maxVal)
  + ### lerp

    public static float lerp(float val,
    float min,
    float max)
  + ### smoothstep

    public static float smoothstep(float edge0,
    float edge1,
    float x)
  + ### DistanceTo

    public static float DistanceTo(float fromX,
    float fromY,
    float toX,
    float toY)
  + ### DistanceTo2D

    public static float DistanceTo2D(float fromX,
    float fromY,
    float toX,
    float toY)
  + ### DistanceTo

    public static float DistanceTo(float fromX,
    float fromY,
    float fromZ,
    float toX,
    float toY,
    float toZ)
  + ### DistanceToSquared

    public static float DistanceToSquared(float fromX,
    float fromY,
    float fromZ,
    float toX,
    float toY,
    float toZ)
  + ### DistanceToSquared

    public static float DistanceToSquared(float fromX,
    float fromY,
    float toX,
    float toY)
  + ### DistanceManhatten

    public static float DistanceManhatten(float fromX,
    float fromY,
    float toX,
    float toY)
  + ### DistanceManhatten

    public static float DistanceManhatten(float fromX,
    float fromY,
    float toX,
    float toY,
    float fromZ,
    float toZ)
  + ### DistanceManhattenSquare

    public static float DistanceManhattenSquare(float fromX,
    float fromY,
    float toX,
    float toY)
  + ### XToIso

    public static float XToIso(float screenX,
    float screenY,
    float floor)
  + ### XToIso

    public static float XToIso(int playerIndex,
    float screenX,
    float screenY,
    float floor)
  + ### XToIsoTrue

    public static float XToIsoTrue(float screenX,
    float screenY,
    int floor)
  + ### XToScreen

    public static float XToScreen(float objectX,
    float objectY,
    float objectZ,
    int screenZ)
  + ### XToScreenInt

    public static float XToScreenInt(int objectX,
    int objectY,
    int objectZ,
    int screenZ)
  + ### YToScreenExact

    public static float YToScreenExact(float objectX,
    float objectY,
    float objectZ,
    int screenZ)
  + ### XToScreenExact

    public static float XToScreenExact(float objectX,
    float objectY,
    float objectZ,
    int screenZ)
  + ### YToIso

    public static float YToIso(float screenX,
    float screenY,
    float floor)
  + ### YToIso

    public static float YToIso(int playerIndex,
    float screenX,
    float screenY,
    float floor)
  + ### YToScreen

    public static float YToScreen(float objectX,
    float objectY,
    float objectZ,
    int screenZ)
  + ### YToScreenInt

    public static float YToScreenInt(int objectX,
    int objectY,
    int objectZ,
    int screenZ)
  + ### isSimilarDirection

    public static boolean isSimilarDirection([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    float xA,
    float yA,
    float xB,
    float yB,
    float similar)