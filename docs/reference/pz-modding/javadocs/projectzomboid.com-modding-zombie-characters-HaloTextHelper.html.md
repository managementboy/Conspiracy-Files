[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [HaloTextHelper](HaloTextHelper.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [COLOR\_WHITE](#COLOR_WHITE)
   2. [COLOR\_GREEN](#COLOR_GREEN)
   3. [COLOR\_RED](#COLOR_RED)
   4. [queuedLines](#queuedLines)
   5. [currentLines](#currentLines)
   6. [ignoreOverheadCheckOnce](#ignoreOverheadCheckOnce)
7. [Constructor Details](#constructor-detail)
   1. [HaloTextHelper()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getColorWhite()](#getColorWhite())
   2. [getColorGreen()](#getColorGreen())
   3. [getColorRed()](#getColorRed())
   4. [forceNextAddText()](#forceNextAddText())
   5. [addTextWithArrow(IsoPlayer, String, String, boolean, HaloTextHelper.ColorRGB)](#addTextWithArrow(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,boolean,zombie.characters.HaloTextHelper.ColorRGB))
   6. [addTextWithArrow(IsoPlayer, String, String, boolean, int, int, int)](#addTextWithArrow(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,boolean,int,int,int))
   7. [addTextWithArrow(IsoPlayer, String, String, boolean, HaloTextHelper.ColorRGB, HaloTextHelper.ColorRGB)](#addTextWithArrow(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,boolean,zombie.characters.HaloTextHelper.ColorRGB,zombie.characters.HaloTextHelper.ColorRGB))
   8. [addTextWithArrow(IsoPlayer, String, String, boolean, int, int, int, int, int, int)](#addTextWithArrow(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,boolean,int,int,int,int,int,int))
   9. [addTextWithArrow(IsoPlayer, String, boolean, HaloTextHelper.ColorRGB)](#addTextWithArrow(zombie.characters.IsoPlayer,java.lang.String,boolean,zombie.characters.HaloTextHelper.ColorRGB))
   10. [addTextWithArrow(IsoPlayer, String, boolean, int, int, int)](#addTextWithArrow(zombie.characters.IsoPlayer,java.lang.String,boolean,int,int,int))
   11. [addTextWithArrow(IsoPlayer, String, boolean, HaloTextHelper.ColorRGB, HaloTextHelper.ColorRGB)](#addTextWithArrow(zombie.characters.IsoPlayer,java.lang.String,boolean,zombie.characters.HaloTextHelper.ColorRGB,zombie.characters.HaloTextHelper.ColorRGB))
   12. [addTextWithArrow(IsoPlayer, String, boolean, int, int, int, int, int, int)](#addTextWithArrow(zombie.characters.IsoPlayer,java.lang.String,boolean,int,int,int,int,int,int))
   13. [addText(IsoPlayer, String, String, HaloTextHelper.ColorRGB)](#addText(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,zombie.characters.HaloTextHelper.ColorRGB))
   14. [addText(IsoPlayer, String, String, int, int, int)](#addText(zombie.characters.IsoPlayer,java.lang.String,java.lang.String,int,int,int))
   15. [getGoodColor()](#getGoodColor())
   16. [getBadColor()](#getBadColor())
   17. [addGoodText(IsoPlayer, String)](#addGoodText(zombie.characters.IsoPlayer,java.lang.String))
   18. [addGoodText(IsoPlayer, String, String)](#addGoodText(zombie.characters.IsoPlayer,java.lang.String,java.lang.String))
   19. [addBadText(IsoPlayer, String)](#addBadText(zombie.characters.IsoPlayer,java.lang.String))
   20. [addBadText(IsoPlayer, String, String)](#addBadText(zombie.characters.IsoPlayer,java.lang.String,java.lang.String))
   21. [addText(IsoPlayer, String)](#addText(zombie.characters.IsoPlayer,java.lang.String))
   22. [addText(IsoPlayer, String, String)](#addText(zombie.characters.IsoPlayer,java.lang.String,java.lang.String))
   23. [overheadContains(int, String)](#overheadContains(int,java.lang.String))
   24. [update()](#update())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class HaloTextHelper
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.HaloTextHelper

---

public class HaloTextHelper
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `HaloTextHelper.ColorRGB`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final HaloTextHelper.ColorRGB`

  `COLOR_GREEN`

  `static final HaloTextHelper.ColorRGB`

  `COLOR_RED`

  `static final HaloTextHelper.ColorRGB`

  `COLOR_WHITE`

  `private static final String[]`

  `currentLines`

  `private static boolean`

  `ignoreOverheadCheckOnce`

  `private static final String[]`

  `queuedLines`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `HaloTextHelper()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addBadText(IsoPlayer player,
  String text)`

  `static void`

  `addBadText(IsoPlayer player,
  String text,
  String separator)`

  `static void`

  `addGoodText(IsoPlayer player,
  String text)`

  `static void`

  `addGoodText(IsoPlayer player,
  String text,
  String separator)`

  `static void`

  `addText(IsoPlayer player,
  String text)`

  `static void`

  `addText(IsoPlayer player,
  String text,
  String separator)`

  `static void`

  `addText(IsoPlayer player,
  String text,
  String separator,
  int r,
  int g,
  int b)`

  `static void`

  `addText(IsoPlayer player,
  String text,
  String seperator,
  HaloTextHelper.ColorRGB color)`

  `static void`

  `addTextWithArrow(IsoPlayer player,
  String text,
  boolean arrowIsUp,
  int r,
  int g,
  int b)`

  `static void`

  `addTextWithArrow(IsoPlayer player,
  String text,
  boolean arrowIsUp,
  int r,
  int g,
  int b,
  int aR,
  int aG,
  int aB)`

  `static void`

  `addTextWithArrow(IsoPlayer player,
  String text,
  boolean arrowIsUp,
  HaloTextHelper.ColorRGB color)`

  `static void`

  `addTextWithArrow(IsoPlayer player,
  String text,
  boolean arrowIsUp,
  HaloTextHelper.ColorRGB color,
  HaloTextHelper.ColorRGB arrowColor)`

  `static void`

  `addTextWithArrow(IsoPlayer player,
  String text,
  String separator,
  boolean arrowIsUp,
  int r,
  int g,
  int b)`

  `static void`

  `addTextWithArrow(IsoPlayer player,
  String text,
  String separator,
  boolean arrowIsUp,
  int r,
  int g,
  int b,
  int aR,
  int aG,
  int aB)`

  `static void`

  `addTextWithArrow(IsoPlayer player,
  String text,
  String separator,
  boolean arrowIsUp,
  HaloTextHelper.ColorRGB color)`

  `static void`

  `addTextWithArrow(IsoPlayer player,
  String text,
  String separator,
  boolean arrowIsUp,
  HaloTextHelper.ColorRGB color,
  HaloTextHelper.ColorRGB arrowColor)`

  `static void`

  `forceNextAddText()`

  `static HaloTextHelper.ColorRGB`

  `getBadColor()`

  `static HaloTextHelper.ColorRGB`

  `getColorGreen()`

  `static HaloTextHelper.ColorRGB`

  `getColorRed()`

  `static HaloTextHelper.ColorRGB`

  `getColorWhite()`

  `static HaloTextHelper.ColorRGB`

  `getGoodColor()`

  `private static boolean`

  `overheadContains(int num,
  String text)`

  `static void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### COLOR\_WHITE

    public static final [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") COLOR\_WHITE
  + ### COLOR\_GREEN

    public static final [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") COLOR\_GREEN
  + ### COLOR\_RED

    public static final [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") COLOR\_RED
  + ### queuedLines

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] queuedLines
  + ### currentLines

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] currentLines
  + ### ignoreOverheadCheckOnce

    private static boolean ignoreOverheadCheckOnce
* Constructor Details
  -------------------

  + ### HaloTextHelper

    public HaloTextHelper()
* Method Details
  --------------

  + ### getColorWhite

    public static [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") getColorWhite()
  + ### getColorGreen

    public static [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") getColorGreen()
  + ### getColorRed

    public static [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") getColorRed()
  + ### forceNextAddText

    public static void forceNextAddText()
  + ### addTextWithArrow

    public static void addTextWithArrow([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator,
    boolean arrowIsUp,
    [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") color)
  + ### addTextWithArrow

    public static void addTextWithArrow([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator,
    boolean arrowIsUp,
    int r,
    int g,
    int b)
  + ### addTextWithArrow

    public static void addTextWithArrow([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator,
    boolean arrowIsUp,
    [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") color,
    [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") arrowColor)
  + ### addTextWithArrow

    public static void addTextWithArrow([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator,
    boolean arrowIsUp,
    int r,
    int g,
    int b,
    int aR,
    int aG,
    int aB)
  + ### addTextWithArrow

    public static void addTextWithArrow([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    boolean arrowIsUp,
    [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") color)
  + ### addTextWithArrow

    public static void addTextWithArrow([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    boolean arrowIsUp,
    int r,
    int g,
    int b)
  + ### addTextWithArrow

    public static void addTextWithArrow([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    boolean arrowIsUp,
    [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") color,
    [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") arrowColor)
  + ### addTextWithArrow

    public static void addTextWithArrow([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    boolean arrowIsUp,
    int r,
    int g,
    int b,
    int aR,
    int aG,
    int aB)
  + ### addText

    public static void addText([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") seperator,
    [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") color)
  + ### addText

    public static void addText([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator,
    int r,
    int g,
    int b)
  + ### getGoodColor

    public static [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") getGoodColor()
  + ### getBadColor

    public static [HaloTextHelper.ColorRGB](HaloTextHelper.ColorRGB.html "class in zombie.characters") getBadColor()
  + ### addGoodText

    public static void addGoodText([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### addGoodText

    public static void addGoodText([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator)
  + ### addBadText

    public static void addBadText([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### addBadText

    public static void addBadText([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator)
  + ### addText

    public static void addText([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### addText

    public static void addText([IsoPlayer](IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator)
  + ### overheadContains

    private static boolean overheadContains(int num,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### update

    public static void update()