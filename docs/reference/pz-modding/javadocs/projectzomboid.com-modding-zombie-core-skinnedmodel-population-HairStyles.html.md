[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.population](package-summary.html)
2. [HairStyles](HairStyles.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [maleStyles](#maleStyles)
   2. [femaleStyles](#femaleStyles)
   3. [instance](#instance)
6. [Constructor Details](#constructor-detail)
   1. [HairStyles()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init()](#init())
   2. [Reset()](#Reset())
   3. [Parse(String)](#Parse(java.lang.String))
   4. [parse(String)](#parse(java.lang.String))
   5. [FindMaleStyle(String)](#FindMaleStyle(java.lang.String))
   6. [FindFemaleStyle(String)](#FindFemaleStyle(java.lang.String))
   7. [FindStyle(ArrayList, String)](#FindStyle(java.util.ArrayList,java.lang.String))
   8. [getRandomMaleStyle(String)](#getRandomMaleStyle(java.lang.String))
   9. [getRandomFemaleStyle(String)](#getRandomFemaleStyle(java.lang.String))
   10. [getAlternateForHat(HairStyle, String)](#getAlternateForHat(zombie.core.skinnedmodel.population.HairStyle,java.lang.String))
   11. [getAllMaleStyles()](#getAllMaleStyles())
   12. [getAllFemaleStyles()](#getAllFemaleStyles())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class HairStyles
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.population.HairStyles

---

public class HairStyles
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ArrayList<HairStyle>`

  `femaleStyles`

  `static HairStyles`

  `instance`

  `final ArrayList<HairStyle>`

  `maleStyles`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `HairStyles()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `HairStyle`

  `FindFemaleStyle(String name)`

  `HairStyle`

  `FindMaleStyle(String name)`

  `private HairStyle`

  `FindStyle(ArrayList<HairStyle> list,
  String name)`

  `ArrayList<HairStyle>`

  `getAllFemaleStyles()`

  `ArrayList<HairStyle>`

  `getAllMaleStyles()`

  `HairStyle`

  `getAlternateForHat(HairStyle style,
  String category)`

  `String`

  `getRandomFemaleStyle(String outfitName)`

  `String`

  `getRandomMaleStyle(String outfitName)`

  `static void`

  `init()`

  `static HairStyles`

  `parse(String filename)`

  `static HairStyles`

  `Parse(String filename)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### maleStyles

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population")> maleStyles
  + ### femaleStyles

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population")> femaleStyles
  + ### instance

    public static [HairStyles](HairStyles.html "class in zombie.core.skinnedmodel.population") instance
* Constructor Details
  -------------------

  + ### HairStyles

    public HairStyles()
* Method Details
  --------------

  + ### init

    public static void init()
  + ### Reset

    public static void Reset()
  + ### Parse

    public static [HairStyles](HairStyles.html "class in zombie.core.skinnedmodel.population") Parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### parse

    public static [HairStyles](HairStyles.html "class in zombie.core.skinnedmodel.population") parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
    throws javax.xml.bind.JAXBException,
    [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `javax.xml.bind.JAXBException`
    :   `IOException`
  + ### FindMaleStyle

    public [HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population") FindMaleStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### FindFemaleStyle

    public [HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population") FindFemaleStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### FindStyle

    private [HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population") FindStyle([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population")> list,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getRandomMaleStyle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomMaleStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName)
  + ### getRandomFemaleStyle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRandomFemaleStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName)
  + ### getAlternateForHat

    public [HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population") getAlternateForHat([HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population") style,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getAllMaleStyles

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population")> getAllMaleStyles()
  + ### getAllFemaleStyles

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[HairStyle](HairStyle.html "class in zombie.core.skinnedmodel.population")> getAllFemaleStyles()