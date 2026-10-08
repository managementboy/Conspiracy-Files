[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.population](package-summary.html)
2. [VoiceStyles](VoiceStyles.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [styles](#styles)
   2. [instance](#instance)
6. [Constructor Details](#constructor-detail)
   1. [VoiceStyles()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init()](#init())
   2. [Reset()](#Reset())
   3. [Parse(String)](#Parse(java.lang.String))
   4. [parse(String)](#parse(java.lang.String))
   5. [FindStyle(String)](#FindStyle(java.lang.String))
   6. [getInstance()](#getInstance())
   7. [getAllStyles()](#getAllStyles())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class VoiceStyles
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.population.VoiceStyles

---

public class VoiceStyles
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static VoiceStyles`

  `instance`

  `final ArrayList<VoiceStyle>`

  `styles`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VoiceStyles()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `VoiceStyle`

  `FindStyle(String name)`

  `ArrayList<VoiceStyle>`

  `getAllStyles()`

  `VoiceStyles`

  `getInstance()`

  `static void`

  `init()`

  `static VoiceStyles`

  `parse(String filename)`

  `static VoiceStyles`

  `Parse(String filename)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### styles

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VoiceStyle](VoiceStyle.html "class in zombie.core.skinnedmodel.population")> styles
  + ### instance

    public static [VoiceStyles](VoiceStyles.html "class in zombie.core.skinnedmodel.population") instance
* Constructor Details
  -------------------

  + ### VoiceStyles

    public VoiceStyles()
* Method Details
  --------------

  + ### init

    public static void init()
  + ### Reset

    public static void Reset()
  + ### Parse

    public static [VoiceStyles](VoiceStyles.html "class in zombie.core.skinnedmodel.population") Parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### parse

    public static [VoiceStyles](VoiceStyles.html "class in zombie.core.skinnedmodel.population") parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
    throws javax.xml.bind.JAXBException,
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `javax.xml.bind.JAXBException`
    :   `IOException`
  + ### FindStyle

    public [VoiceStyle](VoiceStyle.html "class in zombie.core.skinnedmodel.population") FindStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getInstance

    public [VoiceStyles](VoiceStyles.html "class in zombie.core.skinnedmodel.population") getInstance()
  + ### getAllStyles

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[VoiceStyle](VoiceStyle.html "class in zombie.core.skinnedmodel.population")> getAllStyles()