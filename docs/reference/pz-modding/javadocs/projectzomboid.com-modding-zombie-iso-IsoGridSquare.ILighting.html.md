[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoGridSquare](IsoGridSquare.html)
3. [ILighting](IsoGridSquare.ILighting.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [lightverts(int)](#lightverts(int))
   2. [lampostTotalR()](#lampostTotalR())
   3. [lampostTotalG()](#lampostTotalG())
   4. [lampostTotalB()](#lampostTotalB())
   5. [bSeen()](#bSeen())
   6. [bCanSee()](#bCanSee())
   7. [bCouldSee()](#bCouldSee())
   8. [darkMulti()](#darkMulti())
   9. [targetDarkMulti()](#targetDarkMulti())
   10. [lightInfo()](#lightInfo())
   11. [lightverts(int, int)](#lightverts(int,int))
   12. [lampostTotalR(float)](#lampostTotalR(float))
   13. [lampostTotalG(float)](#lampostTotalG(float))
   14. [lampostTotalB(float)](#lampostTotalB(float))
   15. [bSeen(boolean)](#bSeen(boolean))
   16. [bCanSee(boolean)](#bCanSee(boolean))
   17. [bCouldSee(boolean)](#bCouldSee(boolean))
   18. [darkMulti(float)](#darkMulti(float))
   19. [targetDarkMulti(float)](#targetDarkMulti(float))
   20. [resultLightCount()](#resultLightCount())
   21. [getResultLight(int)](#getResultLight(int))
   22. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Interface IsoGridSquare.ILighting
=================================

All Known Implementing Classes:
:   `IsoGridSquare.Lighting`

Enclosing class:
:   `IsoGridSquare`

---

public static interface IsoGridSquare.ILighting

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `bCanSee()`

  `void`

  `bCanSee(boolean canSee)`

  `boolean`

  `bCouldSee()`

  `void`

  `bCouldSee(boolean couldSee)`

  `boolean`

  `bSeen()`

  `void`

  `bSeen(boolean seen)`

  `float`

  `darkMulti()`

  `void`

  `darkMulti(float f)`

  `IsoGridSquare.ResultLight`

  `getResultLight(int index)`

  `float`

  `lampostTotalB()`

  `void`

  `lampostTotalB(float b)`

  `float`

  `lampostTotalG()`

  `void`

  `lampostTotalG(float g)`

  `float`

  `lampostTotalR()`

  `void`

  `lampostTotalR(float r)`

  `ColorInfo`

  `lightInfo()`

  `int`

  `lightverts(int i)`

  `void`

  `lightverts(int i,
  int value)`

  `void`

  `reset()`

  `int`

  `resultLightCount()`

  `float`

  `targetDarkMulti()`

  `void`

  `targetDarkMulti(float f)`

* Method Details
  --------------

  + ### lightverts

    int lightverts(int i)
  + ### lampostTotalR

    float lampostTotalR()
  + ### lampostTotalG

    float lampostTotalG()
  + ### lampostTotalB

    float lampostTotalB()
  + ### bSeen

    boolean bSeen()
  + ### bCanSee

    boolean bCanSee()
  + ### bCouldSee

    boolean bCouldSee()
  + ### darkMulti

    float darkMulti()
  + ### targetDarkMulti

    float targetDarkMulti()
  + ### lightInfo

    [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo()
  + ### lightverts

    void lightverts(int i,
    int value)
  + ### lampostTotalR

    void lampostTotalR(float r)
  + ### lampostTotalG

    void lampostTotalG(float g)
  + ### lampostTotalB

    void lampostTotalB(float b)
  + ### bSeen

    void bSeen(boolean seen)
  + ### bCanSee

    void bCanSee(boolean canSee)
  + ### bCouldSee

    void bCouldSee(boolean couldSee)
  + ### darkMulti

    void darkMulti(float f)
  + ### targetDarkMulti

    void targetDarkMulti(float f)
  + ### resultLightCount

    int resultLightCount()
  + ### getResultLight

    [IsoGridSquare.ResultLight](IsoGridSquare.ResultLight.html "class in zombie.iso") getResultLight(int index)
  + ### reset

    void reset()