[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.skills](package-summary.html)
2. [PerkFactory](PerkFactory.html)
3. [Perk](PerkFactory.Perk.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [index](#index)
   3. [custom](#custom)
   4. [translation](#translation)
   5. [name](#name)
   6. [passiv](#passiv)
   7. [xp1](#xp1)
   8. [xp2](#xp2)
   9. [xp3](#xp3)
   10. [xp4](#xp4)
   11. [xp5](#xp5)
   12. [xp6](#xp6)
   13. [xp7](#xp7)
   14. [xp8](#xp8)
   15. [xp9](#xp9)
   16. [xp10](#xp10)
   17. [parent](#parent)
6. [Constructor Details](#constructor-detail)
   1. [Perk(String)](#%3Cinit%3E(java.lang.String))
   2. [Perk(String, PerkFactory.Perk)](#%3Cinit%3E(java.lang.String,zombie.characters.skills.PerkFactory.Perk))
7. [Method Details](#method-detail)
   1. [getId()](#getId())
   2. [index()](#index())
   3. [setCustom()](#setCustom())
   4. [isCustom()](#isCustom())
   5. [isPassiv()](#isPassiv())
   6. [getParent()](#getParent())
   7. [getName()](#getName())
   8. [getType()](#getType())
   9. [getXp1()](#getXp1())
   10. [getXp2()](#getXp2())
   11. [getXp3()](#getXp3())
   12. [getXp4()](#getXp4())
   13. [getXp5()](#getXp5())
   14. [getXp6()](#getXp6())
   15. [getXp7()](#getXp7())
   16. [getXp8()](#getXp8())
   17. [getXp9()](#getXp9())
   18. [getXp10()](#getXp10())
   19. [getXpForLevel(int)](#getXpForLevel(int))
   20. [getTotalXpForLevel(int)](#getTotalXpForLevel(int))
   21. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PerkFactory.Perk
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.skills.PerkFactory.Perk

Enclosing class:
:   `PerkFactory`

---

public static final class PerkFactory.Perk
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `custom`

  `private final String`

  `id`

  `private int`

  `index`

  `String`

  `name`

  `PerkFactory.Perk`

  `parent`

  `boolean`

  `passiv`

  `String`

  `translation`

  `int`

  `xp1`

  `int`

  `xp10`

  `int`

  `xp2`

  `int`

  `xp3`

  `int`

  `xp4`

  `int`

  `xp5`

  `int`

  `xp6`

  `int`

  `xp7`

  `int`

  `xp8`

  `int`

  `xp9`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Perk(String id)`

  `Perk(String id,
  PerkFactory.Perk parent)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getId()`

  `String`

  `getName()`

  `PerkFactory.Perk`

  `getParent()`

  `float`

  `getTotalXpForLevel(int level)`

  `PerkFactory.Perk`

  `getType()`

  `int`

  `getXp1()`

  `int`

  `getXp10()`

  `int`

  `getXp2()`

  `int`

  `getXp3()`

  `int`

  `getXp4()`

  `int`

  `getXp5()`

  `int`

  `getXp6()`

  `int`

  `getXp7()`

  `int`

  `getXp8()`

  `int`

  `getXp9()`

  `float`

  `getXpForLevel(int level)`

  `int`

  `index()`

  `boolean`

  `isCustom()`

  `boolean`

  `isPassiv()`

  `void`

  `setCustom()`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### index

    private int index
  + ### custom

    private boolean custom
  + ### translation

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translation
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### passiv

    public boolean passiv
  + ### xp1

    public int xp1
  + ### xp2

    public int xp2
  + ### xp3

    public int xp3
  + ### xp4

    public int xp4
  + ### xp5

    public int xp5
  + ### xp6

    public int xp6
  + ### xp7

    public int xp7
  + ### xp8

    public int xp8
  + ### xp9

    public int xp9
  + ### xp10

    public int xp10
  + ### parent

    public [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") parent
* Constructor Details
  -------------------

  + ### Perk

    public Perk([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### Perk

    public Perk([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") parent)
* Method Details
  --------------

  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### index

    public int index()
  + ### setCustom

    public void setCustom()
  + ### isCustom

    public boolean isCustom()
  + ### isPassiv

    public boolean isPassiv()
  + ### getParent

    public [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") getParent()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getType

    public [PerkFactory.Perk](PerkFactory.Perk.html "class in zombie.characters.skills") getType()
  + ### getXp1

    public int getXp1()
  + ### getXp2

    public int getXp2()
  + ### getXp3

    public int getXp3()
  + ### getXp4

    public int getXp4()
  + ### getXp5

    public int getXp5()
  + ### getXp6

    public int getXp6()
  + ### getXp7

    public int getXp7()
  + ### getXp8

    public int getXp8()
  + ### getXp9

    public int getXp9()
  + ### getXp10

    public int getXp10()
  + ### getXpForLevel

    public float getXpForLevel(int level)
  + ### getTotalXpForLevel

    public float getTotalXpForLevel(int level)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`