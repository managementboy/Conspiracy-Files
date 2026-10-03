[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.profanity.locales](package-summary.html)
2. [Locale](Locale.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [storeVowelsAmount](#storeVowelsAmount)
   3. [phoneticRules](#phoneticRules)
   4. [phonizers](#phonizers)
   5. [filterWords](#filterWords)
   6. [filterWordsRaw](#filterWordsRaw)
   7. [filterContains](#filterContains)
   8. [whitelistWords](#whitelistWords)
   9. [pattern](#pattern)
   10. [preProcessLeet](#preProcessLeet)
   11. [preProcessDoubles](#preProcessDoubles)
   12. [preProcessVowels](#preProcessVowels)
6. [Constructor Details](#constructor-detail)
   1. [Locale(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [getPhoneticRules()](#getPhoneticRules())
   3. [getFilterWordsCount()](#getFilterWordsCount())
   4. [Init()](#Init())
   5. [addWhiteListWord(String)](#addWhiteListWord(java.lang.String))
   6. [removeWhiteListWord(String)](#removeWhiteListWord(java.lang.String))
   7. [isWhiteListedWord(String)](#isWhiteListedWord(java.lang.String))
   8. [addFilterWord(String)](#addFilterWord(java.lang.String))
   9. [removeFilterWord(String)](#removeFilterWord(java.lang.String))
   10. [addFilterContains(String)](#addFilterContains(java.lang.String))
   11. [removeFilterContains(String)](#removeFilterContains(java.lang.String))
   12. [addFilterRawWord(String)](#addFilterRawWord(java.lang.String))
   13. [removeFilterWordRaw(String)](#removeFilterWordRaw(java.lang.String))
   14. [repeatString(int, char)](#repeatString(int,char))
   15. [containsIgnoreCase(String, String)](#containsIgnoreCase(java.lang.String,java.lang.String))
   16. [filterWord(String)](#filterWord(java.lang.String))
   17. [filterWord(String, boolean)](#filterWord(java.lang.String,boolean))
   18. [validateWord(String, boolean)](#validateWord(java.lang.String,boolean))
   19. [returnMatchSetForWord(String)](#returnMatchSetForWord(java.lang.String))
   20. [returnPhonizedWord(String)](#returnPhonizedWord(java.lang.String))
   21. [phonizeWord(String)](#phonizeWord(java.lang.String))
   22. [preProcessWord(String)](#preProcessWord(java.lang.String))
   23. [addPhonizer(Phonizer)](#addPhonizer(zombie.profanity.Phonizer))
   24. [finalizeData()](#finalizeData())
   25. [loadFilterWords()](#loadFilterWords())
   26. [loadFilterContains()](#loadFilterContains())
   27. [loadWhiteListWords()](#loadWhiteListWords())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Locale
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.profanity.locales.Locale

---

public abstract class Locale
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected List<String>`

  `filterContains`

  `protected Map<String,String>`

  `filterWords`

  `protected List<String>`

  `filterWordsRaw`

  `protected String`

  `id`

  `protected Pattern`

  `pattern`

  `protected String`

  `phoneticRules`

  `protected Map<String, zombie.profanity.Phonizer>`

  `phonizers`

  `private final Pattern`

  `preProcessDoubles`

  `private final Pattern`

  `preProcessLeet`

  `private final Pattern`

  `preProcessVowels`

  `protected int`

  `storeVowelsAmount`

  `protected ArrayList<String>`

  `whitelistWords`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `Locale(String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addFilterContains(String str)`

  `void`

  `addFilterRawWord(String word)`

  `void`

  `addFilterWord(String word)`

  `protected void`

  `addPhonizer(zombie.profanity.Phonizer p)`

  `void`

  `addWhiteListWord(String word)`

  `protected boolean`

  `containsIgnoreCase(String str,
  String searchStr)`

  `String`

  `filterWord(String str)`

  `String`

  `filterWord(String str,
  boolean includeContaining)`

  `protected void`

  `finalizeData()`

  `int`

  `getFilterWordsCount()`

  `String`

  `getID()`

  `String`

  `getPhoneticRules()`

  `protected abstract void`

  `Init()`

  `boolean`

  `isWhiteListedWord(String str)`

  `protected void`

  `loadFilterContains()`

  `protected void`

  `loadFilterWords()`

  `protected void`

  `loadWhiteListWords()`

  `protected String`

  `phonizeWord(String word)`

  `private String`

  `preProcessWord(String word)`

  `void`

  `removeFilterContains(String str)`

  `void`

  `removeFilterWord(String word)`

  `void`

  `removeFilterWordRaw(String word)`

  `void`

  `removeWhiteListWord(String word)`

  `protected String`

  `repeatString(int n,
  char c)`

  `String`

  `returnMatchSetForWord(String str)`

  `String`

  `returnPhonizedWord(String str)`

  `String`

  `validateWord(String str,
  boolean includeContaining)`

  Checks word for bad filters and returns a string identifying the problem.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### storeVowelsAmount

    protected int storeVowelsAmount
  + ### phoneticRules

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") phoneticRules
  + ### phonizers

    protected [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.profanity.Phonizer> phonizers
  + ### filterWords

    protected [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> filterWords
  + ### filterWordsRaw

    protected [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> filterWordsRaw
  + ### filterContains

    protected [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> filterContains
  + ### whitelistWords

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> whitelistWords
  + ### pattern

    protected [Pattern](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/regex/Pattern.html "class or interface in java.util.regex") pattern
  + ### preProcessLeet

    private final [Pattern](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/regex/Pattern.html "class or interface in java.util.regex") preProcessLeet
  + ### preProcessDoubles

    private final [Pattern](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/regex/Pattern.html "class or interface in java.util.regex") preProcessDoubles
  + ### preProcessVowels

    private final [Pattern](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/regex/Pattern.html "class or interface in java.util.regex") preProcessVowels
* Constructor Details
  -------------------

  + ### Locale

    protected Locale([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### getID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getID()
  + ### getPhoneticRules

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPhoneticRules()
  + ### getFilterWordsCount

    public int getFilterWordsCount()
  + ### Init

    protected abstract void Init()
  + ### addWhiteListWord

    public void addWhiteListWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### removeWhiteListWord

    public void removeWhiteListWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### isWhiteListedWord

    public boolean isWhiteListedWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### addFilterWord

    public void addFilterWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### removeFilterWord

    public void removeFilterWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### addFilterContains

    public void addFilterContains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### removeFilterContains

    public void removeFilterContains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### addFilterRawWord

    public void addFilterRawWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### removeFilterWordRaw

    public void removeFilterWordRaw([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### repeatString

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") repeatString(int n,
    char c)
  + ### containsIgnoreCase

    protected boolean containsIgnoreCase([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") searchStr)
  + ### filterWord

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### filterWord

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    boolean includeContaining)
  + ### validateWord

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") validateWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    boolean includeContaining)

    Checks word for bad filters and returns a string identifying the problem.
    Returns null if there is no problem.
  + ### returnMatchSetForWord

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") returnMatchSetForWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### returnPhonizedWord

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") returnPhonizedWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### phonizeWord

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") phonizeWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### preProcessWord

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") preProcessWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### addPhonizer

    protected void addPhonizer(zombie.profanity.Phonizer p)
  + ### finalizeData

    protected void finalizeData()
  + ### loadFilterWords

    protected void loadFilterWords()
  + ### loadFilterContains

    protected void loadFilterContains()
  + ### loadWhiteListWords

    protected void loadWhiteListWords()