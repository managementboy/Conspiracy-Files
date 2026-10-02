[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoObject](IsoObject.html)
3. [IsoObjectFactory](IsoObject.IsoObjectFactory.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [classId](#classId)
   2. [objectName](#objectName)
   3. [hashCode](#hashCode)
6. [Constructor Details](#constructor-detail)
   1. [IsoObjectFactory(byte, String)](#%3Cinit%3E(byte,java.lang.String))
7. [Method Details](#method-detail)
   1. [InstantiateObject(IsoCell)](#InstantiateObject(zombie.iso.IsoCell))
   2. [getClassID()](#getClassID())
   3. [getObjectName()](#getObjectName())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoObject.IsoObjectFactory
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoObject.IsoObjectFactory

Enclosing class:
:   `IsoObject`

---

public static class IsoObject.IsoObjectFactory
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final byte`

  `classId`

  `private final int`

  `hashCode`

  `private final String`

  `objectName`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoObjectFactory(byte classId,
  String objectName)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `byte`

  `getClassID()`

  `String`

  `getObjectName()`

  `protected IsoObject`

  `InstantiateObject(IsoCell cell)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### classId

    private final byte classId
  + ### objectName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName
  + ### hashCode

    private final int hashCode
* Constructor Details
  -------------------

  + ### IsoObjectFactory

    public IsoObjectFactory(byte classId,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") objectName)
* Method Details
  --------------

  + ### InstantiateObject

    protected [IsoObject](IsoObject.html "class in zombie.iso") InstantiateObject([IsoCell](IsoCell.html "class in zombie.iso") cell)
  + ### getClassID

    public byte getClassID()
  + ### getObjectName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getObjectName()