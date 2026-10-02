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
3. [JoypadButtonBinding](CharacterJoypadButtonBinding.JoypadButtonBinding.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [binding](#binding)
6. [Constructor Details](#constructor-detail)
   1. [JoypadButtonBinding(JoypadButton)](#%3Cinit%3E(zombie.input.JoypadButton))
7. [Method Details](#method-detail)
   1. [isDown(int)](#isDown(int))
   2. [getButton()](#getButton())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CharacterJoypadButtonBinding.JoypadButtonBinding
======================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.CharacterJoypadButtonBinding.JoypadButtonBinding

All Implemented Interfaces:
:   `CharacterJoypadButtonBinding.IsDownBinding`

Enclosing class:
:   `CharacterJoypadButtonBinding`

---

public static class CharacterJoypadButtonBinding.JoypadButtonBinding
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html "interface in zombie.characters")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final JoypadButton`

  `binding`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `JoypadButtonBinding(JoypadButton binding)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `JoypadButton`

  `getButton()`

  `boolean`

  `isDown(int joypadBind)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [CharacterJoypadButtonBinding.IsDownBinding](CharacterJoypadButtonBinding.IsDownBinding.html#method-summary "interface in zombie.characters")

  `getAxis1d, getAxis2d, getMax, getMin`

* Field Details
  -------------

  + ### binding

    private final [JoypadButton](../input/JoypadButton.html "enum class in zombie.input") binding
* Constructor Details
  -------------------

  + ### JoypadButtonBinding

    public JoypadButtonBinding([JoypadButton](../input/JoypadButton.html "enum class in zombie.input") binding)
* Method Details
  --------------

  + ### isDown

    public boolean isDown(int joypadBind)

    Specified by:
    :   `isDown` in interface `CharacterJoypadButtonBinding.IsDownBinding`
  + ### getButton

    public [JoypadButton](../input/JoypadButton.html "enum class in zombie.input") getButton()

    Specified by:
    :   `getButton` in interface `CharacterJoypadButtonBinding.IsDownBinding`