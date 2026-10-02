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
3. [ParameterMoodle](ParameterMoodles.ParameterMoodle.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [parameterName](#parameterName)
   2. [moodleType](#moodleType)
   3. [parameterDescription](#parameterDescription)
   4. [currentValue](#currentValue)
6. [Constructor Details](#constructor-detail)
   1. [ParameterMoodle(String, MoodleType)](#%3Cinit%3E(java.lang.String,zombie.scripting.objects.MoodleType))
7. [Method Details](#method-detail)
   1. [calculateCurrentValue(IsoGameCharacter)](#calculateCurrentValue(zombie.characters.IsoGameCharacter))
   2. [setCurrentValue(BaseCharacterSoundEmitter, long, float)](#setCurrentValue(zombie.characters.BaseCharacterSoundEmitter,long,float))
   3. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ParameterMoodles.ParameterMoodle
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.parameters.ParameterMoodles.ParameterMoodle

Enclosing class:
:   `ParameterMoodles`

---

private static final class ParameterMoodles.ParameterMoodle
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `currentValue`

  `(package private) final MoodleType`

  `moodleType`

  `(package private) fmod.fmod.FMOD_STUDIO_PARAMETER_DESCRIPTION`

  `parameterDescription`

  `(package private) final String`

  `parameterName`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ParameterMoodle(String parameterName,
  MoodleType moodleType)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) float`

  `calculateCurrentValue(IsoGameCharacter character)`

  `(package private) void`

  `reset()`

  `(package private) void`

  `setCurrentValue(BaseCharacterSoundEmitter emitter,
  long eventInstance,
  float value)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### parameterName

    final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName
  + ### moodleType

    final [MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType
  + ### parameterDescription

    fmod.fmod.FMOD\_STUDIO\_PARAMETER\_DESCRIPTION parameterDescription
  + ### currentValue

    float currentValue
* Constructor Details
  -------------------

  + ### ParameterMoodle

    ParameterMoodle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName,
    [MoodleType](../../scripting/objects/MoodleType.html "class in zombie.scripting.objects") moodleType)
* Method Details
  --------------

  + ### calculateCurrentValue

    float calculateCurrentValue([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### setCurrentValue

    void setCurrentValue([BaseCharacterSoundEmitter](../../characters/BaseCharacterSoundEmitter.html "class in zombie.characters") emitter,
    long eventInstance,
    float value)
  + ### reset

    void reset()