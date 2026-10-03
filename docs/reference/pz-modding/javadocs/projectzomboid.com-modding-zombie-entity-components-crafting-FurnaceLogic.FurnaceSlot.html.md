[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [FurnaceLogic](FurnaceLogic.html)
3. [FurnaceSlot](FurnaceLogic.FurnaceSlot.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [index](#index)
   2. [currentRecipe](#currentRecipe)
   3. [elapsedTime](#elapsedTime)
   4. [inputResourceId](#inputResourceId)
   5. [outputResourceId](#outputResourceId)
6. [Constructor Details](#constructor-detail)
   1. [FurnaceSlot()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getIndex()](#getIndex())
   2. [getCurrentRecipe()](#getCurrentRecipe())
   3. [getElapsedTime()](#getElapsedTime())
   4. [setElapsedTime(int)](#setElapsedTime(int))
   5. [getInputResourceID()](#getInputResourceID())
   6. [getOutputResourceID()](#getOutputResourceID())
   7. [reset()](#reset())
   8. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   9. [clearRecipe()](#clearRecipe())
   10. [initialize(String, String)](#initialize(java.lang.String,java.lang.String))
   11. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   12. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class FurnaceLogic.FurnaceSlot
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.FurnaceLogic.FurnaceSlot

Enclosing class:
:   `FurnaceLogic`

---

public static class FurnaceLogic.FurnaceSlot
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private CraftRecipe`

  `currentRecipe`

  `private int`

  `elapsedTime`

  `private int`

  `index`

  `private String`

  `inputResourceId`

  `private String`

  `outputResourceId`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FurnaceSlot()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `clearRecipe()`

  `CraftRecipe`

  `getCurrentRecipe()`

  `int`

  `getElapsedTime()`

  `int`

  `getIndex()`

  `String`

  `getInputResourceID()`

  `String`

  `getOutputResourceID()`

  `protected void`

  `initialize(String inputResourceID,
  String outputResourceID)`

  `private void`

  `load(ByteBuffer input,
  int worldVersion)`

  `private void`

  `reset()`

  `private void`

  `save(ByteBuffer output)`

  `protected void`

  `setElapsedTime(int time)`

  `protected void`

  `setRecipe(CraftRecipe recipe)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### index

    private int index
  + ### currentRecipe

    private [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") currentRecipe
  + ### elapsedTime

    private int elapsedTime
  + ### inputResourceId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inputResourceId
  + ### outputResourceId

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outputResourceId
* Constructor Details
  -------------------

  + ### FurnaceSlot

    public FurnaceSlot()
* Method Details
  --------------

  + ### getIndex

    public int getIndex()
  + ### getCurrentRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getCurrentRecipe()
  + ### getElapsedTime

    public int getElapsedTime()
  + ### setElapsedTime

    protected void setElapsedTime(int time)
  + ### getInputResourceID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInputResourceID()
  + ### getOutputResourceID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOutputResourceID()
  + ### reset

    private void reset()
  + ### setRecipe

    protected void setRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### clearRecipe

    protected void clearRecipe()
  + ### initialize

    protected void initialize([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inputResourceID,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outputResourceID)
  + ### save

    private void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    private void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`