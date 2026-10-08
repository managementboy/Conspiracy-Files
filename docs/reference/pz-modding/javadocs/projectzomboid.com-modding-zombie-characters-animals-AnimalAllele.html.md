[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [AnimalAllele](AnimalAllele.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [currentValue](#currentValue)
   3. [trueRatioValue](#trueRatioValue)
   4. [dominant](#dominant)
   5. [used](#used)
   6. [geneticDisorder](#geneticDisorder)
6. [Constructor Details](#constructor-detail)
   1. [AnimalAllele()](#%3Cinit%3E())
   2. [AnimalAllele(AnimalAllele)](#%3Cinit%3E(zombie.characters.animals.AnimalAllele))
7. [Method Details](#method-detail)
   1. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   2. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))
   3. [getName()](#getName())
   4. [getCurrentValue()](#getCurrentValue())
   5. [setCurrentValue(float)](#setCurrentValue(float))
   6. [getTrueRatioValue()](#getTrueRatioValue())
   7. [setTrueRatioValue(float)](#setTrueRatioValue(float))
   8. [isDominant()](#isDominant())
   9. [setDominant(boolean)](#setDominant(boolean))
   10. [setUsed(boolean)](#setUsed(boolean))
   11. [isUsed()](#isUsed())
   12. [getGeneticDisorder()](#getGeneticDisorder())
   13. [setGeneticDisorder(String)](#setGeneticDisorder(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AnimalAllele
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.AnimalAllele

---

public class AnimalAllele
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

This is one gene of an animal, this is what gonna get manipulated

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `currentValue`

  `boolean`

  `dominant`

  `String`

  `geneticDisorder`

  `String`

  `name`

  `float`

  `trueRatioValue`

  `boolean`

  `used`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalAllele()`

  `AnimalAllele(AnimalAllele allele)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getCurrentValue()`

  `String`

  `getGeneticDisorder()`

  `String`

  `getName()`

  `float`

  `getTrueRatioValue()`

  `boolean`

  `isDominant()`

  `boolean`

  `isUsed()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean isDebugSave)`

  `void`

  `save(ByteBuffer output,
  boolean isDebugSave)`

  `void`

  `setCurrentValue(float newValue)`

  `void`

  `setDominant(boolean dom)`

  `void`

  `setGeneticDisorder(String gd)`

  `void`

  `setTrueRatioValue(float newValue)`

  `void`

  `setUsed(boolean used)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### currentValue

    public float currentValue
  + ### trueRatioValue

    public float trueRatioValue
  + ### dominant

    public boolean dominant
  + ### used

    public boolean used
  + ### geneticDisorder

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") geneticDisorder
* Constructor Details
  -------------------

  + ### AnimalAllele

    public AnimalAllele()
  + ### AnimalAllele

    public AnimalAllele([AnimalAllele](AnimalAllele.html "class in zombie.characters.animals") allele)
* Method Details
  --------------

  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean isDebugSave)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getCurrentValue

    public float getCurrentValue()
  + ### setCurrentValue

    public void setCurrentValue(float newValue)
  + ### getTrueRatioValue

    public float getTrueRatioValue()
  + ### setTrueRatioValue

    public void setTrueRatioValue(float newValue)
  + ### isDominant

    public boolean isDominant()
  + ### setDominant

    public void setDominant(boolean dom)
  + ### setUsed

    public void setUsed(boolean used)
  + ### isUsed

    public boolean isUsed()
  + ### getGeneticDisorder

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGeneticDisorder()
  + ### setGeneticDisorder

    public void setGeneticDisorder([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gd)