[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [FluidUtil](FluidUtil.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [UNIT\_L](#UNIT_L)
   2. [UNIT\_dL](#UNIT_dL)
   3. [UNIT\_cL](#UNIT_cL)
   4. [UNIT\_mL](#UNIT_mL)
   5. [UNIT\_dmL](#UNIT_dmL)
   6. [UNIT\_cmL](#UNIT_cmL)
   7. [UNIT\_uL](#UNIT_uL)
   8. [MIN\_UNIT](#MIN_UNIT)
   9. [MIN\_CONTAINER\_CAPACITY](#MIN_CONTAINER_CAPACITY)
   10. [df\_liter](#df_liter)
   11. [df\_liter10](#df_liter10)
   12. [df\_liter1000](#df_liter1000)
   13. [TRANSFER\_ACTION\_TIME\_PER\_LITER](#TRANSFER_ACTION_TIME_PER_LITER)
   14. [MIN\_TRANSFER\_ACTION\_TIME](#MIN_TRANSFER_ACTION_TIME)
6. [Constructor Details](#constructor-detail)
   1. [FluidUtil()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getUnitLiter()](#getUnitLiter())
   2. [getUnitDeciLiter()](#getUnitDeciLiter())
   3. [getUnitCentiLiter()](#getUnitCentiLiter())
   4. [getUnitMilliLiter()](#getUnitMilliLiter())
   5. [getUnitDeciMilliLiter()](#getUnitDeciMilliLiter())
   6. [getUnitCentiMilliLiter()](#getUnitCentiMilliLiter())
   7. [getUnitMicroLiter()](#getUnitMicroLiter())
   8. [getMinUnit()](#getMinUnit())
   9. [getMinContainerCapacity()](#getMinContainerCapacity())
   10. [getAmountFormatted(float)](#getAmountFormatted(float))
   11. [getFractionFormatted(float, float)](#getFractionFormatted(float,float))
   12. [getAmountLiter1000(float)](#getAmountLiter1000(float))
   13. [getAmountLiter10(float)](#getAmountLiter10(float))
   14. [getAmountLiter(float)](#getAmountLiter(float))
   15. [getAmountMilli(float)](#getAmountMilli(float))
   16. [roundTransfer(float)](#roundTransfer(float))
   17. [getTransferActionTimePerLiter()](#getTransferActionTimePerLiter())
   18. [getMinTransferActionTime()](#getMinTransferActionTime())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class FluidUtil
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.fluids.FluidUtil

---

public class FluidUtil
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final DecimalFormat`

  `df_liter`

  `private static final DecimalFormat`

  `df_liter10`

  `private static final DecimalFormat`

  `df_liter1000`

  `static final float`

  `MIN_CONTAINER_CAPACITY`

  `static final float`

  `MIN_TRANSFER_ACTION_TIME`

  `static final float`

  `MIN_UNIT`

  `static final float`

  `TRANSFER_ACTION_TIME_PER_LITER`

  Transfer times for actions involving fluids
  actionTime = amount \* TRANSFER\_ACTION\_TIME\_PER\_LITER

  `static final float`

  `UNIT_cL`

  `static final float`

  `UNIT_cmL`

  `static final float`

  `UNIT_dL`

  `static final float`

  `UNIT_dmL`

  `static final float`

  `UNIT_L`

  `static final float`

  `UNIT_mL`

  `static final float`

  `UNIT_uL`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FluidUtil()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static String`

  `getAmountFormatted(float amount)`

  `static String`

  `getAmountLiter(float amount)`

  `static String`

  `getAmountLiter10(float amount)`

  `static String`

  `getAmountLiter1000(float amount)`

  `static String`

  `getAmountMilli(float amount)`

  `static String`

  `getFractionFormatted(float numerator,
  float denominator)`

  `static float`

  `getMinContainerCapacity()`

  `static float`

  `getMinTransferActionTime()`

  `static float`

  `getMinUnit()`

  `static float`

  `getTransferActionTimePerLiter()`

  `static float`

  `getUnitCentiLiter()`

  `static float`

  `getUnitCentiMilliLiter()`

  `static float`

  `getUnitDeciLiter()`

  `static float`

  `getUnitDeciMilliLiter()`

  `static float`

  `getUnitLiter()`

  `static float`

  `getUnitMicroLiter()`

  `static float`

  `getUnitMilliLiter()`

  `static float`

  `roundTransfer(float amount)`

  rounds to minimal transfer amount, 10mL

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### UNIT\_L

    public static final float UNIT\_L

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.UNIT_L)
  + ### UNIT\_dL

    public static final float UNIT\_dL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.UNIT_dL)
  + ### UNIT\_cL

    public static final float UNIT\_cL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.UNIT_cL)
  + ### UNIT\_mL

    public static final float UNIT\_mL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.UNIT_mL)
  + ### UNIT\_dmL

    public static final float UNIT\_dmL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.UNIT_dmL)
  + ### UNIT\_cmL

    public static final float UNIT\_cmL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.UNIT_cmL)
  + ### UNIT\_uL

    public static final float UNIT\_uL

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.UNIT_uL)
  + ### MIN\_UNIT

    public static final float MIN\_UNIT

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.MIN_UNIT)
  + ### MIN\_CONTAINER\_CAPACITY

    public static final float MIN\_CONTAINER\_CAPACITY

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.MIN_CONTAINER_CAPACITY)
  + ### df\_liter

    private static final [DecimalFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/DecimalFormat.html "class or interface in java.text") df\_liter
  + ### df\_liter10

    private static final [DecimalFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/DecimalFormat.html "class or interface in java.text") df\_liter10
  + ### df\_liter1000

    private static final [DecimalFormat](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/text/DecimalFormat.html "class or interface in java.text") df\_liter1000
  + ### TRANSFER\_ACTION\_TIME\_PER\_LITER

    public static final float TRANSFER\_ACTION\_TIME\_PER\_LITER

    Transfer times for actions involving fluids
    actionTime = amount \* TRANSFER\_ACTION\_TIME\_PER\_LITER

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.TRANSFER_ACTION_TIME_PER_LITER)
  + ### MIN\_TRANSFER\_ACTION\_TIME

    public static final float MIN\_TRANSFER\_ACTION\_TIME

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.fluids.FluidUtil.MIN_TRANSFER_ACTION_TIME)
* Constructor Details
  -------------------

  + ### FluidUtil

    public FluidUtil()
* Method Details
  --------------

  + ### getUnitLiter

    public static float getUnitLiter()
  + ### getUnitDeciLiter

    public static float getUnitDeciLiter()
  + ### getUnitCentiLiter

    public static float getUnitCentiLiter()
  + ### getUnitMilliLiter

    public static float getUnitMilliLiter()
  + ### getUnitDeciMilliLiter

    public static float getUnitDeciMilliLiter()
  + ### getUnitCentiMilliLiter

    public static float getUnitCentiMilliLiter()
  + ### getUnitMicroLiter

    public static float getUnitMicroLiter()
  + ### getMinUnit

    public static float getMinUnit()
  + ### getMinContainerCapacity

    public static float getMinContainerCapacity()
  + ### getAmountFormatted

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAmountFormatted(float amount)
  + ### getFractionFormatted

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFractionFormatted(float numerator,
    float denominator)
  + ### getAmountLiter1000

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAmountLiter1000(float amount)
  + ### getAmountLiter10

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAmountLiter10(float amount)
  + ### getAmountLiter

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAmountLiter(float amount)
  + ### getAmountMilli

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAmountMilli(float amount)
  + ### roundTransfer

    public static float roundTransfer(float amount)

    rounds to minimal transfer amount, 10mL
  + ### getTransferActionTimePerLiter

    public static float getTransferActionTimePerLiter()
  + ### getMinTransferActionTime

    public static float getMinTransferActionTime()