[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html)
3. [Axis1dMinMaxBinding](CharacterJoypadButtonBinding.Axis1dMinMaxBinding.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [binding](#binding)
   2. [min](#min)
   3. [max](#max)
6. [Constructor Details](#constructor-detail)
   1. [Axis1dMinMaxBinding(JoypadAxis1d, float, float)](#%3Cinit%3E(zombie.input.JoypadAxis1d,float,float))
7. [Method Details](#method-detail)
   1. [isDown(int)](#isDown(int))
   2. [getAxis1d()](#getAxis1d())
   3. [getMin()](#getMin())
   4. [getMax()](#getMax())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CharacterJoypadButtonBinding.Axis1dMinMaxBinding
======================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.CharacterJoypadButtonBinding.Axis1dMinMaxBinding

All Implemented Interfaces:
:   `CharacterJoypadButtonBinding.IsDownBinding`

Enclosing class:
:   `CharacterJoypadButtonBinding`

---

public static class CharacterJoypadButtonBinding.Axis1dMinMaxBinding
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html "interface in zombie.characters")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final JoypadAxis1d`

  `binding`

  `private final float`

  `max`

  `private final float`

  `min`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Axis1dMinMaxBinding(JoypadAxis1d binding,
  float min,
  float max)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `JoypadAxis1d`

  `getAxis1d()`

  `float`

  `getMax()`

  `float`

  `getMin()`

  `boolean`

  `isDown(int joypadBind)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html#method-summary "interface in zombie.characters")

  `getAxis2d, getButton`

* Field Details
  -------------

  + ### binding

    private final [JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") binding
  + ### min

    private final float min
  + ### max

    private final float max
* Constructor Details
  -------------------

  + ### Axis1dMinMaxBinding

    public Axis1dMinMaxBinding([JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") binding,
    float min,
    float max)
* Method Details
  --------------

  + ### isDown

    public boolean isDown(int joypadBind)

    Specified by:
    :   `isDown` in interface `CharacterJoypadButtonBinding.IsDownBinding`
  + ### getAxis1d

    public [JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") getAxis1d()

    Specified by:
    :   `getAxis1d` in interface `CharacterJoypadButtonBinding.IsDownBinding`
  + ### getMin

    public float getMin()

    Specified by:
    :   `getMin` in interface `CharacterJoypadButtonBinding.IsDownBinding`
  + ### getMax

    public float getMax()

    Specified by:
    :   `getMax` in interface `CharacterJoypadButtonBinding.IsDownBinding`