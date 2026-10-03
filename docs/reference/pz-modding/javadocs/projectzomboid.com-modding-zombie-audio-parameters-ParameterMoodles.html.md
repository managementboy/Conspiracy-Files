[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.audio.parameters](package-summary.html)
2. [ParameterMoodles](ParameterMoodles.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [character](#character)
   2. [moodles](#moodles)
7. [Constructor Details](#constructor-detail)
   1. [ParameterMoodles(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
8. [Method Details](#method-detail)
   1. [addMoodle(String, MoodleType)](#addMoodle(java.lang.String,zombie.scripting.objects.MoodleType))
   2. [update(long)](#update(long))
   3. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ParameterMoodles
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.parameters.ParameterMoodles

---

public final class ParameterMoodles
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `ParameterMoodles.ParameterMoodle`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final IsoGameCharacter`

  `character`

  `private final ArrayList<ParameterMoodles.ParameterMoodle>`

  `moodles`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ParameterMoodles(IsoGameCharacter character)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addMoodle(String name,
  MoodleType moodleType)`

  `void`

  `reset()`

  `void`

  `update(long eventInstance)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### character

    private final [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character
  + ### moodles

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ParameterMoodles.ParameterMoodle](ParameterMoodles.ParameterMoodle.html "class in zombie.audio.parameters")> moodles
* Constructor Details
  -------------------

  + ### ParameterMoodles

    public ParameterMoodles([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
* Method Details
  --------------

  + ### addMoodle

    private void addMoodle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
  + ### update

    public void update(long eventInstance)
  + ### reset

    public void reset()