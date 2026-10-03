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
3. [ButtonBinding](CharacterInputBindingSet.ButtonBinding.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [binding](#binding)
   2. [button](#button)
6. [Constructor Details](#constructor-detail)
   1. [ButtonBinding()](#%3Cinit%3E())
   2. [ButtonBinding(CharacterJoypadButtonBinding, JoypadButton)](#%3Cinit%3E(zombie.characters.CharacterJoypadButtonBinding,zombie.input.JoypadButton))
7. [Method Details](#method-detail)
   1. [apply()](#apply())
   2. [isValid()](#isValid())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CharacterInputBindingSet.ButtonBinding
============================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.CharacterInputBindingSetEntry](CharacterInputBindingSetEntry.html "class in zombie.characters")

zombie.characters.CharacterInputBindingSet.ButtonBinding

Enclosing class:
:   `CharacterInputBindingSet`

---

public static class CharacterInputBindingSet.ButtonBinding
extends [CharacterInputBindingSetEntry](CharacterInputBindingSetEntry.html "class in zombie.characters")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `CharacterJoypadButtonBinding`

  `binding`

  `JoypadButton`

  `button`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ButtonBinding()`

  `ButtonBinding(CharacterJoypadButtonBinding binding,
  JoypadButton button)`
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
  + ### button

    public [JoypadButton](../input/JoypadButton.html "enum class in zombie.input") button
* Constructor Details
  -------------------

  + ### ButtonBinding

    public ButtonBinding()
  + ### ButtonBinding

    public ButtonBinding([CharacterJoypadButtonBinding](CharacterJoypadButtonBinding.html "enum class in zombie.characters") binding,
    [JoypadButton](../input/JoypadButton.html "enum class in zombie.input") button)
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