[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.fluids](package-summary.html)
2. [FluidContainerScript](FluidContainerScript.html)
3. [FluidScript](FluidContainerScript.FluidScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fluidType](#fluidType)
   2. [percentage](#percentage)
   3. [customColor](#customColor)
   4. [fluid](#fluid)
6. [Constructor Details](#constructor-detail)
   1. [FluidScript(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getFluidType()](#getFluidType())
   2. [getFluid()](#getFluid())
   3. [setPercentage(float)](#setPercentage(float))
   4. [getPercentage()](#getPercentage())
   5. [getCustomColor()](#getCustomColor())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class FluidContainerScript.FluidScript
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.entity.components.fluids.FluidContainerScript.FluidScript

Enclosing class:
:   `FluidContainerScript`

---

public static class FluidContainerScript.FluidScript
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private Color`

  `customColor`

  `private Fluid`

  `fluid`

  `private final String`

  `fluidType`

  `private float`

  `percentage`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FluidScript(String fluidType)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Color`

  `getCustomColor()`

  `Fluid`

  `getFluid()`

  `String`

  `getFluidType()`

  `float`

  `getPercentage()`

  `protected void`

  `setPercentage(float f)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fluidType

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidType
  + ### percentage

    private float percentage
  + ### customColor

    private [Color](../../../../core/Color.html "class in zombie.core") customColor
  + ### fluid

    private [Fluid](../../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids") fluid
* Constructor Details
  -------------------

  + ### FluidScript

    private FluidScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidType)
* Method Details
  --------------

  + ### getFluidType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFluidType()
  + ### getFluid

    public [Fluid](../../../../entity/components/fluids/Fluid.html "class in zombie.entity.components.fluids") getFluid()
  + ### setPercentage

    protected void setPercentage(float f)
  + ### getPercentage

    public float getPercentage()
  + ### getCustomColor

    public [Color](../../../../core/Color.html "class in zombie.core") getCustomColor()