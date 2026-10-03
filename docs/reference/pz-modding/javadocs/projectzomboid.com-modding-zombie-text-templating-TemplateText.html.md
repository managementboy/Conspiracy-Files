[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.text.templating](package-summary.html)
2. [TemplateText](TemplateText.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [builder](#builder)
   2. [m\_random](#m_random)
6. [Constructor Details](#constructor-detail)
   1. [TemplateText()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [CreateBlanc()](#CreateBlanc())
   2. [CreateCopy()](#CreateCopy())
   3. [Build(String)](#Build(java.lang.String))
   4. [Build(String, IReplaceProvider)](#Build(java.lang.String,zombie.text.templating.IReplaceProvider))
   5. [Build(String, KahluaTableImpl)](#Build(java.lang.String,se.krka.kahlua.j2se.KahluaTableImpl))
   6. [RegisterKey(String, KahluaTableImpl)](#RegisterKey(java.lang.String,se.krka.kahlua.j2se.KahluaTableImpl))
   7. [RegisterKey(String, IReplace)](#RegisterKey(java.lang.String,zombie.text.templating.IReplace))
   8. [Initialize()](#Initialize())
   9. [Reset()](#Reset())
   10. [RandNext(float, float)](#RandNext(float,float))
   11. [RandNext(float)](#RandNext(float))
   12. [RandNext(int, int)](#RandNext(int,int))
   13. [RandNext(int)](#RandNext(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class TemplateText
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.text.templating.TemplateText

---

public class TemplateText
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final zombie.text.templating.ITemplateBuilder`

  `builder`

  `private static final Random`

  `m_random`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TemplateText()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static String`

  `Build(String input)`

  `static String`

  `Build(String input,
  se.krka.kahlua.j2se.KahluaTableImpl table)`

  `static String`

  `Build(String input,
  zombie.text.templating.IReplaceProvider replaceProvider)`

  `static zombie.text.templating.ITemplateBuilder`

  `CreateBlanc()`

  `static zombie.text.templating.ITemplateBuilder`

  `CreateCopy()`

  `static void`

  `Initialize()`

  `static float`

  `RandNext(float bound)`

  `static float`

  `RandNext(float min,
  float max)`

  `static int`

  `RandNext(int bound)`

  `static int`

  `RandNext(int min,
  int max)`

  `static void`

  `RegisterKey(String key,
  se.krka.kahlua.j2se.KahluaTableImpl table)`

  `static void`

  `RegisterKey(String key,
  zombie.text.templating.IReplace replace)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### builder

    private static final zombie.text.templating.ITemplateBuilder builder
  + ### m\_random

    private static final [Random](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Random.html "class or interface in java.util") m\_random
* Constructor Details
  -------------------

  + ### TemplateText

    public TemplateText()
* Method Details
  --------------

  + ### CreateBlanc

    public static zombie.text.templating.ITemplateBuilder CreateBlanc()
  + ### CreateCopy

    public static zombie.text.templating.ITemplateBuilder CreateCopy()
  + ### Build

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Build([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input)
  + ### Build

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Build([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input,
    zombie.text.templating.IReplaceProvider replaceProvider)
  + ### Build

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") Build([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input,
    se.krka.kahlua.j2se.KahluaTableImpl table)
  + ### RegisterKey

    public static void RegisterKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    se.krka.kahlua.j2se.KahluaTableImpl table)
  + ### RegisterKey

    public static void RegisterKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.text.templating.IReplace replace)
  + ### Initialize

    public static void Initialize()
  + ### Reset

    public static void Reset()
  + ### RandNext

    public static float RandNext(float min,
    float max)
  + ### RandNext

    public static float RandNext(float bound)
  + ### RandNext

    public static int RandNext(int min,
    int max)
  + ### RandNext

    public static int RandNext(int bound)