[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [CharacterInputBindingSet](CharacterInputBindingSet.html)
3. [ButtonAxis1dBinding](CharacterInputBindingSet.ButtonAxis1dBinding.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [binding](#binding)
   2. [axis](#axis)
   3. [min](#min)
   4. [max](#max)
6. [Constructor Details](#constructor-detail)
   1. [ButtonAxis1dBinding()](#%3Cinit%3E())
   2. [ButtonAxis1dBinding(CharacterJoypadButtonBinding, JoypadAxis1d, float, float)](#%3Cinit%3E(zombie.characters.CharacterJoypadButtonBinding,zombie.input.JoypadAxis1d,float,float))
7. [Method Details](#method-detail)
   1. [apply()](#apply())
   2. [isValid()](#isValid())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CharacterInputBindingSet.ButtonAxis1dBinding
==================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.CharacterInputBindingSetEntry](CharacterInputBindingSetEntry.html "class in zombie.characters")

zombie.characters.CharacterInputBindingSet.ButtonAxis1dBinding

Enclosing class:
:   `CharacterInputBindingSet`

---

public static class CharacterInputBindingSet.ButtonAxis1dBinding
extends [CharacterInputBindingSetEntry](CharacterInputBindingSetEntry.html "class in zombie.characters")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `JoypadAxis1d`

  `axis`

  `CharacterJoypadButtonBinding`

  `binding`

  `float`

  `max`

  `float`

  `min`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ButtonAxis1dBinding()`

  `ButtonAxis1dBinding(CharacterJoypadButtonBinding binding,
  JoypadAxis1d axis,
  float min,
  float max)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `apply()`

  `boolean`

  `isValid()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### binding

    public [CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") binding
  + ### axis

    public [JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") axis
  + ### min

    public float min
  + ### max

    public float max
* Constructor Details
  -------------------

  + ### ButtonAxis1dBinding

    public ButtonAxis1dBinding()
  + ### ButtonAxis1dBinding

    public ButtonAxis1dBinding([CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") binding,
    [JoypadAxis1d](../input/JoypadAxis1d.html "enum class in zombie.input") axis,
    float min,
    float max)
* Method Details
  --------------

  + ### apply

    public void apply()

    Specified by:
    :   `apply` in class `CharacterInputBindingSetEntry`
  + ### isValid

    public boolean isValid()

    Specified by:
    :   `isValid` in class `CharacterInputBindingSetEntry`