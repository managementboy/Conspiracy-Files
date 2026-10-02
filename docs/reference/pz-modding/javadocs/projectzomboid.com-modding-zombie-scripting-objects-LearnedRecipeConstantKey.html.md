[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [LearnedRecipeConstantKey](LearnedRecipeConstantKey.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [ADVANCED\_MECHANICS](#ADVANCED_MECHANICS)
   3. [BASIC\_MECHANICS](#BASIC_MECHANICS)
   4. [GENERATOR](#GENERATOR)
   5. [HERBALIST](#HERBALIST)
   6. [INTERMEDIATE\_MECHANICS](#INTERMEDIATE_MECHANICS)
6. [Constructor Details](#constructor-detail)
   1. [LearnedRecipeConstantKey(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [hashCode()](#hashCode())
   3. [equals(Object)](#equals(java.lang.Object))
   4. [id()](#id())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Record Class LearnedRecipeConstantKey
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

zombie.scripting.objects.LearnedRecipeConstantKey

---

public record LearnedRecipeConstantKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
extends [Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final LearnedRecipeConstantKey`

  `ADVANCED_MECHANICS`

  `static final LearnedRecipeConstantKey`

  `BASIC_MECHANICS`

  `static final LearnedRecipeConstantKey`

  `GENERATOR`

  `static final LearnedRecipeConstantKey`

  `HERBALIST`

  `private final String`

  `id`

  The field for the `id` record component.

  `static final LearnedRecipeConstantKey`

  `INTERMEDIATE_MECHANICS`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LearnedRecipeConstantKey(String id)`

  Creates an instance of a `LearnedRecipeConstantKey` record class.
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `final boolean`

  `equals(Object o)`

  Indicates whether some other object is "equal to" this one.

  `final int`

  `hashCode()`

  Returns a hash code value for this object.

  `String`

  `id()`

  Returns the value of the `id` record component.

  `String`

  `toString()`

  Returns a string representation of this record class.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id

    The field for the `id` record component.
  + ### ADVANCED\_MECHANICS

    public static final [LearnedRecipeConstantKey](LearnedRecipeConstantKey.html "class in zombie.scripting.objects") ADVANCED\_MECHANICS
  + ### BASIC\_MECHANICS

    public static final [LearnedRecipeConstantKey](LearnedRecipeConstantKey.html "class in zombie.scripting.objects") BASIC\_MECHANICS
  + ### GENERATOR

    public static final [LearnedRecipeConstantKey](LearnedRecipeConstantKey.html "class in zombie.scripting.objects") GENERATOR
  + ### HERBALIST

    public static final [LearnedRecipeConstantKey](LearnedRecipeConstantKey.html "class in zombie.scripting.objects") HERBALIST
  + ### INTERMEDIATE\_MECHANICS

    public static final [LearnedRecipeConstantKey](LearnedRecipeConstantKey.html "class in zombie.scripting.objects") INTERMEDIATE\_MECHANICS
* Constructor Details
  -------------------

  + ### LearnedRecipeConstantKey

    public LearnedRecipeConstantKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)

    Creates an instance of a `LearnedRecipeConstantKey` record class.

    Parameters:
    :   `id` - the value for the `id` record component
* Method Details
  --------------

  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Returns a string representation of this record class. The representation contains the name of the class, followed by the name and value of each of the record components.

    Specified by:
    :   `toString` in class `Record`

    Returns:
    :   a string representation of this object
  + ### hashCode

    public final int hashCode()

    Returns a hash code value for this object. The value is derived from the hash code of each of the record components.

    Specified by:
    :   `hashCode` in class `Record`

    Returns:
    :   a hash code value for this object
  + ### equals

    public final boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Indicates whether some other object is "equal to" this one. The objects are equal if the other object is of the same class and if all the record components are equal. All components in this record class are compared with [`Objects::equals(Object,Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Objects.html#equals(java.lang.Object,java.lang.Object) "class or interface in java.util").

    Specified by:
    :   `equals` in class `Record`

    Parameters:
    :   `o` - the object with which to compare

    Returns:
    :   `true` if this object is the same as the `o` argument; `false` otherwise.
  + ### id

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id()

    Returns the value of the `id` record component.

    Returns:
    :   the value of the `id` record component