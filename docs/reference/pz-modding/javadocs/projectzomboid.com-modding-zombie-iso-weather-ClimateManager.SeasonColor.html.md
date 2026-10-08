[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateManager](ClimateManager.html)
3. [SeasonColor](ClimateManager.SeasonColor.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [WARM](#WARM)
   2. [NORMAL](#NORMAL)
   3. [CLOUDY](#CLOUDY)
   4. [SUMMER](#SUMMER)
   5. [FALL](#FALL)
   6. [WINTER](#WINTER)
   7. [SPRING](#SPRING)
   8. [finalCol](#finalCol)
   9. [tempCol](#tempCol)
   10. [colors](#colors)
   11. [ignoreNormal](#ignoreNormal)
6. [Constructor Details](#constructor-detail)
   1. [SeasonColor()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setIgnoreNormal(boolean)](#setIgnoreNormal(boolean))
   2. [getColor(int, int)](#getColor(int,int))
   3. [setColorInterior(int, int, float, float, float, float)](#setColorInterior(int,int,float,float,float,float))
   4. [setColorExterior(int, int, float, float, float, float)](#setColorExterior(int,int,float,float,float,float))
   5. [update(float, float, int, int)](#update(float,float,int,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateManager.SeasonColor
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateManager.SeasonColor

Enclosing class:
:   `ClimateManager`

---

protected static class ClimateManager.SeasonColor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final int`

  `CLOUDY`

  `private final ClimateColorInfo[][]`

  `colors`

  `static final int`

  `FALL`

  `private final ClimateColorInfo`

  `finalCol`

  `private boolean`

  `ignoreNormal`

  `static final int`

  `NORMAL`

  `static final int`

  `SPRING`

  `static final int`

  `SUMMER`

  `private final ClimateColorInfo[]`

  `tempCol`

  `static final int`

  `WARM`

  `static final int`

  `WINTER`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SeasonColor()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ClimateColorInfo`

  `getColor(int temperature,
  int season)`

  `void`

  `setColorExterior(int temperature,
  int season,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `setColorInterior(int temperature,
  int season,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `setIgnoreNormal(boolean b)`

  `ClimateColorInfo`

  `update(float temperatureLerp,
  float seasonLerp,
  int seasonFrom,
  int seasonTo)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### WARM

    public static final int WARM

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.SeasonColor.WARM)
  + ### NORMAL

    public static final int NORMAL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.SeasonColor.NORMAL)
  + ### CLOUDY

    public static final int CLOUDY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.SeasonColor.CLOUDY)
  + ### SUMMER

    public static final int SUMMER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.SeasonColor.SUMMER)
  + ### FALL

    public static final int FALL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.SeasonColor.FALL)
  + ### WINTER

    public static final int WINTER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.SeasonColor.WINTER)
  + ### SPRING

    public static final int SPRING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.ClimateManager.SeasonColor.SPRING)
  + ### finalCol

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") finalCol
  + ### tempCol

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather")[] tempCol
  + ### colors

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather")[][] colors
  + ### ignoreNormal

    private boolean ignoreNormal
* Constructor Details
  -------------------

  + ### SeasonColor

    public SeasonColor()
* Method Details
  --------------

  + ### setIgnoreNormal

    public void setIgnoreNormal(boolean b)
  + ### getColor

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getColor(int temperature,
    int season)
  + ### setColorInterior

    public void setColorInterior(int temperature,
    int season,
    float r,
    float g,
    float b,
    float a)
  + ### setColorExterior

    public void setColorExterior(int temperature,
    int season,
    float r,
    float g,
    float b,
    float a)
  + ### update

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") update(float temperatureLerp,
    float seasonLerp,
    int seasonFrom,
    int seasonTo)