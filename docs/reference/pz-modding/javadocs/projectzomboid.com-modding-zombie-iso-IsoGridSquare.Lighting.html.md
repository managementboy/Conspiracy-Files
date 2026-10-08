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
3. [Lighting](IsoGridSquare.Lighting.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [lightverts](#lightverts)
   2. [lampostTotalR](#lampostTotalR)
   3. [lampostTotalG](#lampostTotalG)
   4. [lampostTotalB](#lampostTotalB)
   5. [seen](#seen)
   6. [canSee](#canSee)
   7. [couldSee](#couldSee)
   8. [darkMulti](#darkMulti)
   9. [targetDarkMulti](#targetDarkMulti)
   10. [lightInfo](#lightInfo)
6. [Constructor Details](#constructor-detail)
   1. [Lighting()](#%3Cinit%3E())
7. [Method Details](#method-detail)
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

Class IsoGridSquare.Lighting
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoGridSquare.Lighting

All Implemented Interfaces:
:   `IsoGridSquare.ILighting`

Enclosing class:
:   `IsoGridSquare`

---

public static final class IsoGridSquare.Lighting
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [IsoGridSquare.ILighting](IsoGridSquare.ILighting.html "interface in zombie.iso")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `canSee`

  `private boolean`

  `couldSee`

  `private float`

  `darkMulti`

  `private float`

  `lampostTotalB`

  `private float`

  `lampostTotalG`

  `private float`

  `lampostTotalR`

  `private final ColorInfo`

  `lightInfo`

  `private final int[]`

  `lightverts`

  `private boolean`

  `seen`

  `private float`

  `targetDarkMulti`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Lighting()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

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

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### lightverts

    private final int[] lightverts
  + ### lampostTotalR

    private float lampostTotalR
  + ### lampostTotalG

    private float lampostTotalG
  + ### lampostTotalB

    private float lampostTotalB
  + ### seen

    private boolean seen
  + ### canSee

    private boolean canSee
  + ### couldSee

    private boolean couldSee
  + ### darkMulti

    private float darkMulti
  + ### targetDarkMulti

    private float targetDarkMulti
  + ### lightInfo

    private final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo
* Constructor Details
  -------------------

  + ### Lighting

    public Lighting()
* Method Details
  --------------

  + ### lightverts

    public int lightverts(int i)

    Specified by:
    :   `lightverts` in interface `IsoGridSquare.ILighting`
  + ### lampostTotalR

    public float lampostTotalR()

    Specified by:
    :   `lampostTotalR` in interface `IsoGridSquare.ILighting`
  + ### lampostTotalG

    public float lampostTotalG()

    Specified by:
    :   `lampostTotalG` in interface `IsoGridSquare.ILighting`
  + ### lampostTotalB

    public float lampostTotalB()

    Specified by:
    :   `lampostTotalB` in interface `IsoGridSquare.ILighting`
  + ### bSeen

    public boolean bSeen()

    Specified by:
    :   `bSeen` in interface `IsoGridSquare.ILighting`
  + ### bCanSee

    public boolean bCanSee()

    Specified by:
    :   `bCanSee` in interface `IsoGridSquare.ILighting`
  + ### bCouldSee

    public boolean bCouldSee()

    Specified by:
    :   `bCouldSee` in interface `IsoGridSquare.ILighting`
  + ### darkMulti

    public float darkMulti()

    Specified by:
    :   `darkMulti` in interface `IsoGridSquare.ILighting`
  + ### targetDarkMulti

    public float targetDarkMulti()

    Specified by:
    :   `targetDarkMulti` in interface `IsoGridSquare.ILighting`
  + ### lightInfo

    public [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") lightInfo()

    Specified by:
    :   `lightInfo` in interface `IsoGridSquare.ILighting`
  + ### lightverts

    public void lightverts(int i,
    int value)

    Specified by:
    :   `lightverts` in interface `IsoGridSquare.ILighting`
  + ### lampostTotalR

    public void lampostTotalR(float r)

    Specified by:
    :   `lampostTotalR` in interface `IsoGridSquare.ILighting`
  + ### lampostTotalG

    public void lampostTotalG(float g)

    Specified by:
    :   `lampostTotalG` in interface `IsoGridSquare.ILighting`
  + ### lampostTotalB

    public void lampostTotalB(float b)

    Specified by:
    :   `lampostTotalB` in interface `IsoGridSquare.ILighting`
  + ### bSeen

    public void bSeen(boolean seen)

    Specified by:
    :   `bSeen` in interface `IsoGridSquare.ILighting`
  + ### bCanSee

    public void bCanSee(boolean canSee)

    Specified by:
    :   `bCanSee` in interface `IsoGridSquare.ILighting`
  + ### bCouldSee

    public void bCouldSee(boolean couldSee)

    Specified by:
    :   `bCouldSee` in interface `IsoGridSquare.ILighting`
  + ### darkMulti

    public void darkMulti(float f)

    Specified by:
    :   `darkMulti` in interface `IsoGridSquare.ILighting`
  + ### targetDarkMulti

    public void targetDarkMulti(float f)

    Specified by:
    :   `targetDarkMulti` in interface `IsoGridSquare.ILighting`
  + ### resultLightCount

    public int resultLightCount()

    Specified by:
    :   `resultLightCount` in interface `IsoGridSquare.ILighting`
  + ### getResultLight

    public [IsoGridSquare.ResultLight](IsoGridSquare.ResultLight.html "class in zombie.iso") getResultLight(int index)

    Specified by:
    :   `getResultLight` in interface `IsoGridSquare.ILighting`
  + ### reset

    public void reset()

    Specified by:
    :   `reset` in interface `IsoGridSquare.ILighting`