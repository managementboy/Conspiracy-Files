[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [ResourceLocation](ResourceLocation.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [DEFAULT\_NAMESPACE](#DEFAULT_NAMESPACE)
   2. [namespace](#namespace)
   3. [path](#path)
   4. [id](#id)
6. [Constructor Details](#constructor-detail)
   1. [ResourceLocation(String, String)](#%3Cinit%3E(java.lang.String,java.lang.String))
7. [Method Details](#method-detail)
   1. [of(String)](#of(java.lang.String))
   2. [getNamespace()](#getNamespace())
   3. [getPath()](#getPath())
   4. [toString()](#toString())
   5. [equals(Object)](#equals(java.lang.Object))
   6. [hashCode()](#hashCode())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ResourceLocation
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.ResourceLocation

---

public final class ResourceLocation
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final String`

  `DEFAULT_NAMESPACE`

  `private final String`

  `id`

  `private final String`

  `namespace`

  `private final String`

  `path`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ResourceLocation(String namespace,
  String path)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `equals(Object o)`

  `String`

  `getNamespace()`

  `String`

  `getPath()`

  `int`

  `hashCode()`

  `static ResourceLocation`

  `of(String id)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### DEFAULT\_NAMESPACE

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") DEFAULT\_NAMESPACE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.ResourceLocation.DEFAULT_NAMESPACE)
  + ### namespace

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") namespace
  + ### path

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path
  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
* Constructor Details
  -------------------

  + ### ResourceLocation

    public ResourceLocation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") namespace,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
* Method Details
  --------------

  + ### of

    public static [ResourceLocation](ResourceLocation.html "class in zombie.scripting.objects") of([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getNamespace

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNamespace()
  + ### getPath

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPath()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Overrides:
    :   `equals` in class `Object`
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`