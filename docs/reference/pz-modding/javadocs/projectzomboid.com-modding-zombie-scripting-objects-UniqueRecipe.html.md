[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [UniqueRecipe](UniqueRecipe.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [baseRecipe](#baseRecipe)
   3. [items](#items)
   4. [hungerBonus](#hungerBonus)
   5. [hapinessBonus](#hapinessBonus)
   6. [boredomBonus](#boredomBonus)
6. [Constructor Details](#constructor-detail)
   1. [UniqueRecipe(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   2. [Load(String, String[])](#Load(java.lang.String,java.lang.String%5B%5D))
   3. [getName()](#getName())
   4. [setName(String)](#setName(java.lang.String))
   5. [getBaseRecipe()](#getBaseRecipe())
   6. [setBaseRecipe(String)](#setBaseRecipe(java.lang.String))
   7. [getHungerBonus()](#getHungerBonus())
   8. [setHungerBonus(int)](#setHungerBonus(int))
   9. [getHapinessBonus()](#getHapinessBonus())
   10. [setHapinessBonus(int)](#setHapinessBonus(int))
   11. [getItems()](#getItems())
   12. [getBoredomBonus()](#getBoredomBonus())
   13. [setBoredomBonus(int)](#setBoredomBonus(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class UniqueRecipe
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.UniqueRecipe

---

public final class UniqueRecipe
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `baseRecipe`

  `private int`

  `boredomBonus`

  `private int`

  `hapinessBonus`

  `private int`

  `hungerBonus`

  `private final ArrayList<String>`

  `items`

  `private String`

  `name`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UniqueRecipe(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getBaseRecipe()`

  `int`

  `getBoredomBonus()`

  `int`

  `getHapinessBonus()`

  `int`

  `getHungerBonus()`

  `ArrayList<String>`

  `getItems()`

  `String`

  `getName()`

  `void`

  `Load(String name,
  String token)`

  `void`

  `Load(String name,
  String[] strArray)`

  `void`

  `setBaseRecipe(String baseRecipe)`

  `void`

  `setBoredomBonus(int boredomBonus)`

  `void`

  `setHapinessBonus(int hapinessBonus)`

  `void`

  `setHungerBonus(int hungerBonus)`

  `void`

  `setName(String name)`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### baseRecipe

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") baseRecipe
  + ### items

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> items
  + ### hungerBonus

    private int hungerBonus
  + ### hapinessBonus

    private int hapinessBonus
  + ### boredomBonus

    private int boredomBonus
* Constructor Details
  -------------------

  + ### UniqueRecipe

    public UniqueRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") token)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] strArray)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getBaseRecipe

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBaseRecipe()
  + ### setBaseRecipe

    public void setBaseRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") baseRecipe)
  + ### getHungerBonus

    public int getHungerBonus()
  + ### setHungerBonus

    public void setHungerBonus(int hungerBonus)
  + ### getHapinessBonus

    public int getHapinessBonus()
  + ### setHapinessBonus

    public void setHapinessBonus(int hapinessBonus)
  + ### getItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getItems()
  + ### getBoredomBonus

    public int getBoredomBonus()
  + ### setBoredomBonus

    public void setBoredomBonus(int boredomBonus)