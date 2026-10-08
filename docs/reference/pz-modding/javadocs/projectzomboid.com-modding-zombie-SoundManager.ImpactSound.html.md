[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [SoundManager](SoundManager.html)
3. [ImpactSound](SoundManager.ImpactSound.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [soundName](#soundName)
   2. [x](#x)
   3. [y](#y)
   4. [z](#z)
   5. [startTimeMs](#startTimeMs)
6. [Constructor Details](#constructor-detail)
   1. [ImpactSound(String, int, int, int, long)](#%3Cinit%3E(java.lang.String,int,int,int,long))
7. [Method Details](#method-detail)
   1. [matches(String, int, int, int)](#matches(java.lang.String,int,int,int))

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class SoundManager.ImpactSound
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.SoundManager.ImpactSound

Enclosing class:
:   `SoundManager`

---

private static final class SoundManager.ImpactSound
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) String`

  `soundName`

  `(package private) long`

  `startTimeMs`

  `(package private) int`

  `x`

  `(package private) int`

  `y`

  `(package private) int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ImpactSound(String soundName,
  int x,
  int y,
  int z,
  long startTimeMs)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) boolean`

  `matches(String soundName,
  int x,
  int y,
  int z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### soundName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName
  + ### x

    int x
  + ### y

    int y
  + ### z

    int z
  + ### startTimeMs

    long startTimeMs
* Constructor Details
  -------------------

  + ### ImpactSound

    ImpactSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName,
    int x,
    int y,
    int z,
    long startTimeMs)
* Method Details
  --------------

  + ### matches

    boolean matches([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") soundName,
    int x,
    int y,
    int z)