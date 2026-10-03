[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.media](package-summary.html)
2. [MediaData](MediaData.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [id](#id)
   2. [itemDisplayName](#itemDisplayName)
   3. [title](#title)
   4. [subtitle](#subtitle)
   5. [author](#author)
   6. [extra](#extra)
   7. [index](#index)
   8. [category](#category)
   9. [spawning](#spawning)
   10. [lines](#lines)
7. [Constructor Details](#constructor-detail)
   1. [MediaData(String, String, int)](#%3Cinit%3E(java.lang.String,java.lang.String,int))
8. [Method Details](#method-detail)
   1. [addLine(String, float, float, float, String)](#addLine(java.lang.String,float,float,float,java.lang.String))
   2. [getLineCount()](#getLineCount())
   3. [getTranslatedItemDisplayName()](#getTranslatedItemDisplayName())
   4. [hasTitle()](#hasTitle())
   5. [setTitle(String)](#setTitle(java.lang.String))
   6. [getTitleEN()](#getTitleEN())
   7. [getTranslatedTitle()](#getTranslatedTitle())
   8. [hasSubTitle()](#hasSubTitle())
   9. [setSubtitle(String)](#setSubtitle(java.lang.String))
   10. [getSubtitleEN()](#getSubtitleEN())
   11. [getTranslatedSubTitle()](#getTranslatedSubTitle())
   12. [hasAuthor()](#hasAuthor())
   13. [setAuthor(String)](#setAuthor(java.lang.String))
   14. [getAuthorEN()](#getAuthorEN())
   15. [getTranslatedAuthor()](#getTranslatedAuthor())
   16. [hasExtra()](#hasExtra())
   17. [setExtra(String)](#setExtra(java.lang.String))
   18. [getExtraEN()](#getExtraEN())
   19. [getTranslatedExtra()](#getTranslatedExtra())
   20. [getId()](#getId())
   21. [getIndex()](#getIndex())
   22. [getIndexForLua()](#getIndexForLua())
   23. [setIndex(short)](#setIndex(short))
   24. [getCategory()](#getCategory())
   25. [setCategory(String)](#setCategory(java.lang.String))
   26. [getSpawning()](#getSpawning())
   27. [getMediaType()](#getMediaType())
   28. [getLine(int)](#getLine(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class MediaData
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.media.MediaData

---

public final class MediaData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `MediaData.MediaLineData`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `author`

  `private String`

  `category`

  `private String`

  `extra`

  `private final String`

  `id`

  `private short`

  `index`

  `private final String`

  `itemDisplayName`

  `private final ArrayList<MediaData.MediaLineData>`

  `lines`

  `private final int`

  `spawning`

  `private String`

  `subtitle`

  `private String`

  `title`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MediaData(String id,
  String itemDisplayName,
  int spawning)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addLine(String text,
  float r,
  float g,
  float b,
  String codes)`

  `String`

  `getAuthorEN()`

  `String`

  `getCategory()`

  `String`

  `getExtraEN()`

  `String`

  `getId()`

  `short`

  `getIndex()`

  `double`

  `getIndexForLua()`

  `MediaData.MediaLineData`

  `getLine(int index)`

  `int`

  `getLineCount()`

  `byte`

  `getMediaType()`

  `int`

  `getSpawning()`

  `String`

  `getSubtitleEN()`

  `String`

  `getTitleEN()`

  `String`

  `getTranslatedAuthor()`

  `String`

  `getTranslatedExtra()`

  `String`

  `getTranslatedItemDisplayName()`

  `String`

  `getTranslatedSubTitle()`

  `String`

  `getTranslatedTitle()`

  `boolean`

  `hasAuthor()`

  `boolean`

  `hasExtra()`

  `boolean`

  `hasSubTitle()`

  `boolean`

  `hasTitle()`

  `void`

  `setAuthor(String author)`

  `protected void`

  `setCategory(String category)`

  `void`

  `setExtra(String extra)`

  `protected void`

  `setIndex(short index)`

  `void`

  `setSubtitle(String subtitle)`

  `void`

  `setTitle(String title)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### itemDisplayName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemDisplayName
  + ### title

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title
  + ### subtitle

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subtitle
  + ### author

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author
  + ### extra

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") extra
  + ### index

    private short index
  + ### category

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category
  + ### spawning

    private final int spawning
  + ### lines

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MediaData.MediaLineData](MediaData.MediaLineData.html "class in zombie.radio.media")> lines
* Constructor Details
  -------------------

  + ### MediaData

    public MediaData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemDisplayName,
    int spawning)
* Method Details
  --------------

  + ### addLine

    public void addLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    float r,
    float g,
    float b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes)
  + ### getLineCount

    public int getLineCount()
  + ### getTranslatedItemDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedItemDisplayName()
  + ### hasTitle

    public boolean hasTitle()
  + ### setTitle

    public void setTitle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") title)
  + ### getTitleEN

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTitleEN()
  + ### getTranslatedTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedTitle()
  + ### hasSubTitle

    public boolean hasSubTitle()
  + ### setSubtitle

    public void setSubtitle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") subtitle)
  + ### getSubtitleEN

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSubtitleEN()
  + ### getTranslatedSubTitle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedSubTitle()
  + ### hasAuthor

    public boolean hasAuthor()
  + ### setAuthor

    public void setAuthor([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") author)
  + ### getAuthorEN

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAuthorEN()
  + ### getTranslatedAuthor

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedAuthor()
  + ### hasExtra

    public boolean hasExtra()
  + ### setExtra

    public void setExtra([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") extra)
  + ### getExtraEN

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getExtraEN()
  + ### getTranslatedExtra

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedExtra()
  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getIndex

    public short getIndex()
  + ### getIndexForLua

    public double getIndexForLua()
  + ### setIndex

    protected void setIndex(short index)
  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()
  + ### setCategory

    protected void setCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getSpawning

    public int getSpawning()
  + ### getMediaType

    public byte getMediaType()
  + ### getLine

    public [MediaData.MediaLineData](MediaData.MediaLineData.html "class in zombie.radio.media") getLine(int index)