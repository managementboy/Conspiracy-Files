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
3. [IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [isDown(int)](#isDown(int))
   2. [getButton()](#getButton())
   3. [getAxis1d()](#getAxis1d())
   4. [getAxis2d()](#getAxis2d())
   5. [getMin()](#getMin())
   6. [getMax()](#getMax())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Interface CharacterJoypadButtonBinding.IsDownBinding
====================================================

All Known Implementing Classes:
:   `CharacterJoypadButtonBinding.Axis1dMinMaxBinding, CharacterJoypadButtonBinding.Axis2dMinMaxBinding, CharacterJoypadButtonBinding.JoypadButtonBinding`

Enclosing class:
:   `CharacterJoypadButtonBinding`

---

public static interface CharacterJoypadButtonBinding.IsDownBinding

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsDefault Methods

  Modifier and Type

  Method

  Description

  `default JoypadAxis1d`

  `getAxis1d()`

  `default JoypadAxis2d`

  `getAxis2d()`

  `default JoypadButton`

  `getButton()`

  `default float`

  `getMax()`

  `default float`

  `getMin()`

  `boolean`

  `isDown(int joypadBind)`

* Method Details
  --------------

  + ### isDown

    boolean isDown(int joypadBind)
  + ### getButton

    default [JoypadButton](../input/JoypadButton.html "enum class in zombie.input") getButton()
  + ### getAxis1d

    default [JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") getAxis1d()
  + ### getAxis2d

    default [JoypadAxis2d](../input/JoypadAxis2d.html "enum class in zombie.input") getAxis2d()
  + ### getMin

    default float getMin()
  + ### getMax

    default float getMax()