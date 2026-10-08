[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [FluidSample](FluidSample.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [fluids](#fluids)
   3. [sealed](#sealed)
   4. [amount](#amount)
6. [Constructor Details](#constructor-detail)
   1. [FluidSample()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Alloc()](#Alloc())
   2. [Release(FluidSample)](#Release(zombie.entity.components.fluids.FluidSample))
   3. [release()](#release())
   4. [reset()](#reset())
   5. [clear()](#clear())
   6. [addFluid(FluidInstance)](#addFluid(zombie.entity.components.fluids.FluidInstance))
   7. [seal()](#seal())
   8. [copy()](#copy())
   9. [isEmpty()](#isEmpty())
   10. [isPureFluid()](#isPureFluid())
   11. [getAmount()](#getAmount())
   12. [size()](#size())
   13. [getPercentage(int)](#getPercentage(int))
   14. [getFluid(int)](#getFluid(int))
   15. [getFluidInstance(int)](#getFluidInstance(int))
   16. [getFluidInstance(Fluid)](#getFluidInstance(zombie.entity.components.fluids.Fluid))
   17. [getPrimaryFluid()](#getPrimaryFluid())
   18. [getColor()](#getColor())
   19. [scaleToAmount(float)](#scaleToAmount(float))
   20. [combine(FluidSample, FluidSample)](#combine(zombie.entity.components.fluids.FluidSample,zombie.entity.components.fluids.FluidSample))
   21. [combineWith(FluidSample)](#combineWith(zombie.entity.components.fluids.FluidSample))
   22. [Save(FluidSample, ByteBuffer)](#Save(zombie.entity.components.fluids.FluidSample,java.nio.ByteBuffer))
   23. [Load(ByteBuffer, int)](#Load(java.nio.ByteBuffer,int))
   24. [Load(FluidSample, ByteBuffer, int)](#Load(zombie.entity.components.fluids.FluidSample,java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class FluidSample
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.fluids.FluidSample

---

public class FluidSample
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

Object can be used to take a sample of a fluid container's contents
containing all fluids and their percentages etc.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `amount`

  `private final ArrayList<zombie.entity.components.fluids.FluidInstance>`

  `fluids`

  `private static final ConcurrentLinkedDeque<FluidSample>`

  `pool`

  `private boolean`

  `sealed`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FluidSample()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `addFluid(zombie.entity.components.fluids.FluidInstance fluid)`

  `static FluidSample`

  `Alloc()`

  `void`

  `clear()`

  `static FluidSample`

  `combine(FluidSample a,
  FluidSample b)`

  `FluidSample`

  `combineWith(FluidSample b)`

  `FluidSample`

  `copy()`

  `float`

  `getAmount()`

  `Color`

  `getColor()`

  `Fluid`

  `getFluid(int index)`

  `zombie.entity.components.fluids.FluidInstance`

  `getFluidInstance(int index)`

  `zombie.entity.components.fluids.FluidInstance`

  `getFluidInstance(Fluid fluid)`

  `float`

  `getPercentage(int index)`

  `Fluid`

  `getPrimaryFluid()`

  `boolean`

  `isEmpty()`

  `boolean`

  `isPureFluid()`

  `static FluidSample`

  `Load(ByteBuffer input,
  int worldVersion)`

  `static FluidSample`

  `Load(FluidSample fluidSample,
  ByteBuffer input,
  int worldVersion)`

  `void`

  `release()`

  `protected static void`

  `Release(FluidSample obj)`

  `private void`

  `reset()`

  `static void`

  `Save(FluidSample fluidSample,
  ByteBuffer output)`

  `void`

  `scaleToAmount(float amount)`

  `protected FluidSample`

  `seal()`

  `int`

  `size()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    private static final [ConcurrentLinkedDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/ConcurrentLinkedDeque.html "class or interface in java.util.concurrent")<[FluidSample](FluidSample.html "class in zombie.entity.components.fluids")> pool
  + ### fluids

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.entity.components.fluids.FluidInstance> fluids
  + ### sealed

    private boolean sealed
  + ### amount

    private float amount
* Constructor Details
  -------------------

  + ### FluidSample

    private FluidSample()
* Method Details
  --------------

  + ### Alloc

    public static [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") Alloc()
  + ### Release

    protected static void Release([FluidSample](FluidSample.html "class in zombie.entity.components.fluids") obj)
  + ### release

    public void release()
  + ### reset

    private void reset()
  + ### clear

    public void clear()
  + ### addFluid

    protected void addFluid(zombie.entity.components.fluids.FluidInstance fluid)
  + ### seal

    protected [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") seal()
  + ### copy

    public [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") copy()
  + ### isEmpty

    public boolean isEmpty()
  + ### isPureFluid

    public boolean isPureFluid()
  + ### getAmount

    public float getAmount()
  + ### size

    public int size()
  + ### getPercentage

    public float getPercentage(int index)
  + ### getFluid

    public [Fluid](Fluid.html "class in zombie.entity.components.fluids") getFluid(int index)
  + ### getFluidInstance

    public zombie.entity.components.fluids.FluidInstance getFluidInstance(int index)
  + ### getFluidInstance

    public zombie.entity.components.fluids.FluidInstance getFluidInstance([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### getPrimaryFluid

    public [Fluid](Fluid.html "class in zombie.entity.components.fluids") getPrimaryFluid()
  + ### getColor

    public [Color](../../../core/Color.html "class in zombie.core") getColor()
  + ### scaleToAmount

    public void scaleToAmount(float amount)
  + ### combine

    public static [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") combine([FluidSample](FluidSample.html "class in zombie.entity.components.fluids") a,
    [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") b)
  + ### combineWith

    public [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") combineWith([FluidSample](FluidSample.html "class in zombie.entity.components.fluids") b)
  + ### Save

    public static void Save([FluidSample](FluidSample.html "class in zombie.entity.components.fluids") fluidSample,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### Load

    public static [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") Load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### Load

    public static [FluidSample](FluidSample.html "class in zombie.entity.components.fluids") Load([FluidSample](FluidSample.html "class in zombie.entity.components.fluids") fluidSample,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`