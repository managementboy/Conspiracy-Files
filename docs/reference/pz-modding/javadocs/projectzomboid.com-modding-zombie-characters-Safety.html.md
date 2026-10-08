[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [Safety](Safety.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [enabled](#enabled)
   2. [last](#last)
   3. [cooldown](#cooldown)
   4. [toggle](#toggle)
   5. [character](#character)
6. [Constructor Details](#constructor-detail)
   1. [Safety()](#%3Cinit%3E())
   2. [Safety(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
7. [Method Details](#method-detail)
   1. [copyFrom(Safety)](#copyFrom(zombie.characters.Safety))
   2. [getCharacter()](#getCharacter())
   3. [isEnabled()](#isEnabled())
   4. [setEnabled(boolean)](#setEnabled(boolean))
   5. [isLast()](#isLast())
   6. [setLast(boolean)](#setLast(boolean))
   7. [getCooldown()](#getCooldown())
   8. [setCooldown(float)](#setCooldown(float))
   9. [getToggle()](#getToggle())
   10. [setToggle(float)](#setToggle(float))
   11. [isToggleAllowed()](#isToggleAllowed())
   12. [toggleSafety()](#toggleSafety())
   13. [load(ByteBufferReader, int)](#load(zombie.core.network.ByteBufferReader,int))
   14. [save(ByteBufferWriter)](#save(zombie.core.network.ByteBufferWriter))
   15. [getDescription()](#getDescription())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Safety
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.Safety

---

public class Safety
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected IsoGameCharacter`

  `character`

  `protected float`

  `cooldown`

  `protected boolean`

  `enabled`

  `protected boolean`

  `last`

  `protected float`

  `toggle`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Safety()`

  `Safety(IsoGameCharacter character)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `copyFrom(Safety other)`

  `Object`

  `getCharacter()`

  `float`

  `getCooldown()`

  `String`

  `getDescription()`

  `float`

  `getToggle()`

  `boolean`

  `isEnabled()`

  `boolean`

  `isLast()`

  `boolean`

  `isToggleAllowed()`

  `void`

  `load(zombie.core.network.ByteBufferReader input,
  int worldVersion)`

  `void`

  `save(zombie.core.network.ByteBufferWriter output)`

  `void`

  `setCooldown(float cooldown)`

  `void`

  `setEnabled(boolean enabled)`

  `void`

  `setLast(boolean last)`

  `void`

  `setToggle(float toggle)`

  `void`

  `toggleSafety()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### enabled

    protected boolean enabled
  + ### last

    protected boolean last
  + ### cooldown

    protected float cooldown
  + ### toggle

    protected float toggle
  + ### character

    protected [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") character
* Constructor Details
  -------------------

  + ### Safety

    public Safety()
  + ### Safety

    public Safety([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") character)
* Method Details
  --------------

  + ### copyFrom

    public void copyFrom([Safety](Safety.html "class in zombie.characters") other)
  + ### getCharacter

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getCharacter()
  + ### isEnabled

    public boolean isEnabled()
  + ### setEnabled

    public void setEnabled(boolean enabled)
  + ### isLast

    public boolean isLast()
  + ### setLast

    public void setLast(boolean last)
  + ### getCooldown

    public float getCooldown()
  + ### setCooldown

    public void setCooldown(float cooldown)
  + ### getToggle

    public float getToggle()
  + ### setToggle

    public void setToggle(float toggle)
  + ### isToggleAllowed

    public boolean isToggleAllowed()
  + ### toggleSafety

    public void toggleSafety()
  + ### load

    public void load(zombie.core.network.ByteBufferReader input,
    int worldVersion)
  + ### save

    public void save(zombie.core.network.ByteBufferWriter output)
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()