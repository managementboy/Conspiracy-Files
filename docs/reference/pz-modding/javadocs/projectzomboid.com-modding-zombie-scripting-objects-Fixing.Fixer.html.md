[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [Fixing](Fixing.html)
3. [Fixer](Fixing.Fixer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fixerName](#fixerName)
   2. [skills](#skills)
   3. [numberOfUse](#numberOfUse)
6. [Constructor Details](#constructor-detail)
   1. [Fixer(String, LinkedList, int)](#%3Cinit%3E(java.lang.String,java.util.LinkedList,int))
7. [Method Details](#method-detail)
   1. [getFixerName()](#getFixerName())
   2. [getFixerSkills()](#getFixerSkills())
   3. [getNumberOfUse()](#getNumberOfUse())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Fixing.Fixer
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.Fixing.Fixer

Enclosing class:
:   `Fixing`

---

public static final class Fixing.Fixer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final String`

  `fixerName`

  `private final int`

  `numberOfUse`

  `private final LinkedList<Fixing.FixerSkill>`

  `skills`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Fixer(String name,
  LinkedList<Fixing.FixerSkill> skills,
  int numberOfUse)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getFixerName()`

  `LinkedList<Fixing.FixerSkill>`

  `getFixerSkills()`

  `int`

  `getNumberOfUse()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fixerName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fixerName
  + ### skills

    private final [LinkedList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedList.html "class or interface in java.util")<[Fixing.FixerSkill](Fixing.FixerSkill.html "class in zombie.scripting.objects")> skills
  + ### numberOfUse

    private final int numberOfUse
* Constructor Details
  -------------------

  + ### Fixer

    public Fixer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [LinkedList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedList.html "class or interface in java.util")<[Fixing.FixerSkill](Fixing.FixerSkill.html "class in zombie.scripting.objects")> skills,
    int numberOfUse)
* Method Details
  --------------

  + ### getFixerName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFixerName()
  + ### getFixerSkills

    public [LinkedList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedList.html "class or interface in java.util")<[Fixing.FixerSkill](Fixing.FixerSkill.html "class in zombie.scripting.objects")> getFixerSkills()
  + ### getNumberOfUse

    public int getNumberOfUse()