[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.devices](package-summary.html)
2. [PresetEntry](PresetEntry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [frequency](#frequency)
6. [Constructor Details](#constructor-detail)
   1. [PresetEntry()](#%3Cinit%3E())
   2. [PresetEntry(PresetEntry)](#%3Cinit%3E(zombie.radio.devices.PresetEntry))
   3. [PresetEntry(String, int)](#%3Cinit%3E(java.lang.String,int))
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [setName(String)](#setName(java.lang.String))
   3. [getFrequency()](#getFrequency())
   4. [setFrequency(int)](#setFrequency(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PresetEntry
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.devices.PresetEntry

---

public final class PresetEntry
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `frequency`

  `private String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PresetEntry()`

  `PresetEntry(String n,
  int f)`

  `PresetEntry(PresetEntry other)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getFrequency()`

  `String`

  `getName()`

  `void`

  `setFrequency(int f)`

  `void`

  `setName(String n)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### frequency

    private int frequency
* Constructor Details
  -------------------

  + ### PresetEntry

    public PresetEntry()
  + ### PresetEntry

    public PresetEntry([PresetEntry](PresetEntry.html "class in zombie.radio.devices") other)
  + ### PresetEntry

    public PresetEntry([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n,
    int f)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") n)
  + ### getFrequency

    public int getFrequency()
  + ### setFrequency

    public void setFrequency(int f)