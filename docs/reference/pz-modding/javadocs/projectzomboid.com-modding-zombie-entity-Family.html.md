[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.entity](package-summary.html)
2. [Family](Family.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [families](#families)
   2. [familyIndex](#familyIndex)
   3. [builder](#builder)
   4. [zeroBits](#zeroBits)
   5. [all](#all)
   6. [one](#one)
   7. [exclude](#exclude)
   8. [index](#index)
7. [Constructor Details](#constructor-detail)
   1. [Family(BitSet, BitSet, BitSet)](#%3Cinit%3E(zombie.entity.util.BitSet,zombie.entity.util.BitSet,zombie.entity.util.BitSet))
8. [Method Details](#method-detail)
   1. [getIndex()](#getIndex())
   2. [matches(GameEntity)](#matches(zombie.entity.GameEntity))
   3. [all(ComponentType...)](#all(zombie.entity.ComponentType...))
   4. [one(ComponentType...)](#one(zombie.entity.ComponentType...))
   5. [exclude(ComponentType...)](#exclude(zombie.entity.ComponentType...))
   6. [hashCode()](#hashCode())
   7. [equals(Object)](#equals(java.lang.Object))
   8. [getFamilyHash(BitSet, BitSet, BitSet)](#getFamilyHash(zombie.entity.util.BitSet,zombie.entity.util.BitSet,zombie.entity.util.BitSet))
   9. [getBitsString(BitSet)](#getBitsString(zombie.entity.util.BitSet))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Family
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.Family

---

public class Family
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `Family.Builder`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final BitSet`

  `all`

  `private static final Family.Builder`

  `builder`

  `private final BitSet`

  `exclude`

  `private static final zombie.entity.util.ObjectMap<String,Family>`

  `families`

  `private static int`

  `familyIndex`

  `private final int`

  `index`

  `private final BitSet`

  `one`

  `private static final BitSet`

  `zeroBits`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Family(BitSet all,
  BitSet any,
  BitSet exclude)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static final Family.Builder`

  `all(ComponentType... componentTypes)`

  `boolean`

  `equals(Object obj)`

  `static final Family.Builder`

  `exclude(ComponentType... componentTypes)`

  `private static String`

  `getBitsString(BitSet bits)`

  `private static String`

  `getFamilyHash(BitSet all,
  BitSet one,
  BitSet exclude)`

  `int`

  `getIndex()`

  `int`

  `hashCode()`

  `boolean`

  `matches(GameEntity entity)`

  `static final Family.Builder`

  `one(ComponentType... componentTypes)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### families

    private static final zombie.entity.util.ObjectMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Family](Family.html "class in zombie.entity")> families
  + ### familyIndex

    private static int familyIndex
  + ### builder

    private static final [Family.Builder](Family.Builder.html "class in zombie.entity") builder
  + ### zeroBits

    private static final [BitSet](util/BitSet.html "class in zombie.entity.util") zeroBits
  + ### all

    private final [BitSet](util/BitSet.html "class in zombie.entity.util") all
  + ### one

    private final [BitSet](util/BitSet.html "class in zombie.entity.util") one
  + ### exclude

    private final [BitSet](util/BitSet.html "class in zombie.entity.util") exclude
  + ### index

    private final int index
* Constructor Details
  -------------------

  + ### Family

    private Family([BitSet](util/BitSet.html "class in zombie.entity.util") all,
    [BitSet](util/BitSet.html "class in zombie.entity.util") any,
    [BitSet](util/BitSet.html "class in zombie.entity.util") exclude)
* Method Details
  --------------

  + ### getIndex

    public int getIndex()
  + ### matches

    public boolean matches([GameEntity](GameEntity.html "class in zombie.entity") entity)
  + ### all

    public static final [Family.Builder](Family.Builder.html "class in zombie.entity") all([ComponentType](ComponentType.html "enum class in zombie.entity")... componentTypes)
  + ### one

    public static final [Family.Builder](Family.Builder.html "class in zombie.entity") one([ComponentType](ComponentType.html "enum class in zombie.entity")... componentTypes)
  + ### exclude

    public static final [Family.Builder](Family.Builder.html "class in zombie.entity") exclude([ComponentType](ComponentType.html "enum class in zombie.entity")... componentTypes)
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj)

    Overrides:
    :   `equals` in class `Object`
  + ### getFamilyHash

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFamilyHash([BitSet](util/BitSet.html "class in zombie.entity.util") all,
    [BitSet](util/BitSet.html "class in zombie.entity.util") one,
    [BitSet](util/BitSet.html "class in zombie.entity.util") exclude)
  + ### getBitsString

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBitsString([BitSet](util/BitSet.html "class in zombie.entity.util") bits)