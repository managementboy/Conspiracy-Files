[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [fmod.fmod](package-summary.html)
2. [FMODSoundBank](FMODSoundBank.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [voiceMap](#voiceMap)
   2. [footstepMap](#footstepMap)
6. [Constructor Details](#constructor-detail)
   1. [FMODSoundBank()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [check(String)](#check(java.lang.String))
   2. [addVoice(String, String, float)](#addVoice(java.lang.String,java.lang.String,float))
   3. [addFootstep(String, String, String, String, String)](#addFootstep(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String))
   4. [getVoice(String)](#getVoice(java.lang.String))
   5. [getFootstep(String)](#getFootstep(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FMODSoundBank
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.BaseSoundBank

fmod.fmod.FMODSoundBank

---

public class FMODSoundBank
extends zombie.audio.BaseSoundBank

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `HashMap<String, fmod.fmod.FMODFootstep>`

  `footstepMap`

  `HashMap<String, fmod.fmod.FMODVoice>`

  `voiceMap`

  ### Fields inherited from class zombie.audio.BaseSoundBank

  `instance`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FMODSoundBank()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addFootstep(String alias,
  String grass,
  String wood,
  String concrete,
  String upstairs)`

  `void`

  `addVoice(String alias,
  String sound,
  float priority)`

  `private void`

  `check(String alias)`

  `fmod.fmod.FMODFootstep`

  `getFootstep(String alias)`

  `fmod.fmod.FMODVoice`

  `getVoice(String alias)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### voiceMap

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), fmod.fmod.FMODVoice> voiceMap
  + ### footstepMap

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), fmod.fmod.FMODFootstep> footstepMap
* Constructor Details
  -------------------

  + ### FMODSoundBank

    public FMODSoundBank()
* Method Details
  --------------

  + ### check

    private void check([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)
  + ### addVoice

    public void addVoice([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound,
    float priority)

    Specified by:
    :   `addVoice` in class `zombie.audio.BaseSoundBank`
  + ### addFootstep

    public void addFootstep([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") grass,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") wood,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") concrete,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") upstairs)

    Specified by:
    :   `addFootstep` in class `zombie.audio.BaseSoundBank`
  + ### getVoice

    public fmod.fmod.FMODVoice getVoice([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)

    Specified by:
    :   `getVoice` in class `zombie.audio.BaseSoundBank`
  + ### getFootstep

    public fmod.fmod.FMODFootstep getFootstep([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)

    Specified by:
    :   `getFootstep` in class `zombie.audio.BaseSoundBank`