[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [TextManager](TextManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [font](#font)
   2. [font2](#font2)
   3. [font3](#font3)
   4. [font4](#font4)
   5. [main1](#main1)
   6. [main2](#main2)
   7. [zombiefontcredits1](#zombiefontcredits1)
   8. [zombiefontcredits2](#zombiefontcredits2)
   9. [zombienew1](#zombienew1)
   10. [zombienew2](#zombienew2)
   11. [zombienew3](#zombienew3)
   12. [zomboidDialogue](#zomboidDialogue)
   13. [codetext](#codetext)
   14. [codeSmall](#codeSmall)
   15. [codeMedium](#codeMedium)
   16. [codeLarge](#codeLarge)
   17. [debugConsole](#debugConsole)
   18. [intro](#intro)
   19. [handwritten](#handwritten)
   20. [normal](#normal)
   21. [enumToFont](#enumToFont)
   22. [sdfShader](#sdfShader)
   23. [currentCodeFont](#currentCodeFont)
   24. [instance](#instance)
   25. [todoTextList](#todoTextList)
7. [Constructor Details](#constructor-detail)
   1. [TextManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [DrawString(double, double, String)](#DrawString(double,double,java.lang.String))
   2. [DrawString(double, double, String, double, double, double, double)](#DrawString(double,double,java.lang.String,double,double,double,double))
   3. [DrawString(UIFont, double, double, double, String, double, double, double, double)](#DrawString(zombie.ui.UIFont,double,double,double,java.lang.String,double,double,double,double))
   4. [DrawString(UIFont, double, double, String, double, double, double, double)](#DrawString(zombie.ui.UIFont,double,double,java.lang.String,double,double,double,double))
   5. [DrawStringUntrimmed(UIFont, double, double, String, double, double, double, double)](#DrawStringUntrimmed(zombie.ui.UIFont,double,double,java.lang.String,double,double,double,double))
   6. [DrawStringCentre(double, double, String, double, double, double, double)](#DrawStringCentre(double,double,java.lang.String,double,double,double,double))
   7. [DrawStringCentre(UIFont, double, double, String, double, double, double, double)](#DrawStringCentre(zombie.ui.UIFont,double,double,java.lang.String,double,double,double,double))
   8. [DrawStringCentre(AngelCodeFont, double, double, String, double, double, double, double)](#DrawStringCentre(zombie.core.fonts.AngelCodeFont,double,double,java.lang.String,double,double,double,double))
   9. [DrawStringCentreDefered(UIFont, double, double, String, double, double, double, double)](#DrawStringCentreDefered(zombie.ui.UIFont,double,double,java.lang.String,double,double,double,double))
   10. [DrawTextFromGameWorld()](#DrawTextFromGameWorld())
   11. [DrawStringRight(double, double, String, double, double, double, double)](#DrawStringRight(double,double,java.lang.String,double,double,double,double))
   12. [GetDrawTextObject(String, int, boolean)](#GetDrawTextObject(java.lang.String,int,boolean))
   13. [DrawTextObject(double, double, TextDrawObject)](#DrawTextObject(double,double,zombie.ui.TextDrawObject))
   14. [DrawStringBBcode(UIFont, double, double, String, double, double, double, double)](#DrawStringBBcode(zombie.ui.UIFont,double,double,java.lang.String,double,double,double,double))
   15. [getNormalFromFontSize(int)](#getNormalFromFontSize(int))
   16. [getFontFromEnum(UIFont)](#getFontFromEnum(zombie.ui.UIFont))
   17. [getFontHeight(UIFont)](#getFontHeight(zombie.ui.UIFont))
   18. [isSdf(UIFont)](#isSdf(zombie.ui.UIFont))
   19. [getAllFonts(ArrayList)](#getAllFonts(java.util.ArrayList))
   20. [DrawStringRight(UIFont, double, double, String, double, double, double, double)](#DrawStringRight(zombie.ui.UIFont,double,double,java.lang.String,double,double,double,double))
   21. [getFontFilePath(String, String, String)](#getFontFilePath(java.lang.String,java.lang.String,java.lang.String))
   22. [Init()](#Init())
   23. [isAnyFontLoading()](#isAnyFontLoading())
   24. [isUsingNonEnglishFonts()](#isUsingNonEnglishFonts())
   25. [MeasureStringX(UIFont, String)](#MeasureStringX(zombie.ui.UIFont,java.lang.String))
   26. [CentreStringYOffset(UIFont, String)](#CentreStringYOffset(zombie.ui.UIFont,java.lang.String))
   27. [MeasureStringY(UIFont, String)](#MeasureStringY(zombie.ui.UIFont,java.lang.String))
   28. [MeasureStringYReal(UIFont, String)](#MeasureStringYReal(zombie.ui.UIFont,java.lang.String))
   29. [MeasureStringYOffset(UIFont, String)](#MeasureStringYOffset(zombie.ui.UIFont,java.lang.String))
   30. [MeasureStringY(UIFont, String, boolean, boolean)](#MeasureStringY(zombie.ui.UIFont,java.lang.String,boolean,boolean))
   31. [MeasureFont(UIFont)](#MeasureFont(zombie.ui.UIFont))
   32. [WrapText(UIFont, String, int)](#WrapText(zombie.ui.UIFont,java.lang.String,int))
   33. [WrapText(UIFont, String, int, int, String)](#WrapText(zombie.ui.UIFont,java.lang.String,int,int,java.lang.String))
   34. [getCurrentCodeFont()](#getCurrentCodeFont())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TextManager
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.TextManager

---

public final class TextManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `TextManager.DeferedTextDraw`

  `static interface`

  `TextManager.StringDrawer`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `AngelCodeFont`

  `codeLarge`

  `AngelCodeFont`

  `codeMedium`

  `AngelCodeFont`

  `codeSmall`

  `AngelCodeFont`

  `codetext`

  `UIFont`

  `currentCodeFont`

  `AngelCodeFont`

  `debugConsole`

  `final AngelCodeFont[]`

  `enumToFont`

  `AngelCodeFont`

  `font`

  `AngelCodeFont`

  `font2`

  `AngelCodeFont`

  `font3`

  `AngelCodeFont`

  `font4`

  `AngelCodeFont`

  `handwritten`

  `static final TextManager`

  `instance`

  `AngelCodeFont`

  `intro`

  `AngelCodeFont`

  `main1`

  `AngelCodeFont`

  `main2`

  `final AngelCodeFont[]`

  `normal`

  `static zombie.core.opengl.SDFShader`

  `sdfShader`

  `ArrayList<TextManager.DeferedTextDraw>`

  `todoTextList`

  `AngelCodeFont`

  `zombiefontcredits1`

  `AngelCodeFont`

  `zombiefontcredits2`

  `AngelCodeFont`

  `zombienew1`

  `AngelCodeFont`

  `zombienew2`

  `AngelCodeFont`

  `zombienew3`

  `AngelCodeFont`

  `zomboidDialogue`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TextManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `CentreStringYOffset(UIFont font,
  String str)`

  CentreStringYOffset provides an offset value to be subtracted from the Y position of the text.

  `void`

  `DrawString(double x,
  double y,
  String str)`

  `void`

  `DrawString(double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawString(UIFont font,
  double x,
  double y,
  double zoom,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawString(UIFont font,
  double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawStringBBcode(UIFont font,
  double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawStringCentre(double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawStringCentre(AngelCodeFont font,
  double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawStringCentre(UIFont font,
  double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawStringCentreDefered(UIFont font,
  double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawStringRight(double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawStringRight(UIFont font,
  double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawStringUntrimmed(UIFont font,
  double x,
  double y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `DrawTextFromGameWorld()`

  `void`

  `DrawTextObject(double x,
  double y,
  TextDrawObject td)`

  `ArrayList<UIFont>`

  `getAllFonts(ArrayList<UIFont> result)`

  `UIFont`

  `getCurrentCodeFont()`

  `TextDrawObject`

  `GetDrawTextObject(String str,
  int maxLineWidth,
  boolean restrictImages)`

  `private String`

  `getFontFilePath(String lang,
  String sizeDir,
  String fileName)`

  `AngelCodeFont`

  `getFontFromEnum(UIFont font)`

  `int`

  `getFontHeight(UIFont fontID)`

  `AngelCodeFont`

  `getNormalFromFontSize(int points)`

  `void`

  `Init()`

  `boolean`

  `isAnyFontLoading()`

  `boolean`

  `isSdf(UIFont font)`

  `boolean`

  `isUsingNonEnglishFonts()`

  `int`

  `MeasureFont(UIFont font)`

  `int`

  `MeasureStringX(UIFont font,
  String str)`

  `int`

  `MeasureStringY(UIFont font,
  String str)`

  `int`

  `MeasureStringY(UIFont font,
  String str,
  boolean returnActualHeight,
  boolean returnOffset)`

  `int`

  `MeasureStringYOffset(UIFont font,
  String str)`

  `int`

  `MeasureStringYReal(UIFont font,
  String str)`

  `String`

  `WrapText(UIFont font,
  String str,
  int maxWidth)`

  `String`

  `WrapText(UIFont font,
  String str,
  int maxWidth,
  int maxLines,
  String maxLinesSuffix)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### font

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") font
  + ### font2

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") font2
  + ### font3

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") font3
  + ### font4

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") font4
  + ### main1

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") main1
  + ### main2

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") main2
  + ### zombiefontcredits1

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") zombiefontcredits1
  + ### zombiefontcredits2

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") zombiefontcredits2
  + ### zombienew1

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") zombienew1
  + ### zombienew2

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") zombienew2
  + ### zombienew3

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") zombienew3
  + ### zomboidDialogue

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") zomboidDialogue
  + ### codetext

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") codetext
  + ### codeSmall

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") codeSmall
  + ### codeMedium

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") codeMedium
  + ### codeLarge

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") codeLarge
  + ### debugConsole

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") debugConsole
  + ### intro

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") intro
  + ### handwritten

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") handwritten
  + ### normal

    public final [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts")[] normal
  + ### enumToFont

    public final [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts")[] enumToFont
  + ### sdfShader

    public static zombie.core.opengl.SDFShader sdfShader
  + ### currentCodeFont

    public [UIFont](UIFont.html "enum class in zombie.ui") currentCodeFont
  + ### instance

    public static final [TextManager](TextManager.html "class in zombie.ui") instance
  + ### todoTextList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TextManager.DeferedTextDraw](TextManager.DeferedTextDraw.html "class in zombie.ui")> todoTextList
* Constructor Details
  -------------------

  + ### TextManager

    public TextManager()
* Method Details
  --------------

  + ### DrawString

    public void DrawString(double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### DrawString

    public void DrawString(double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### DrawString

    public void DrawString([UIFont](UIFont.html "enum class in zombie.ui") font,
    double x,
    double y,
    double zoom,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### DrawString

    public void DrawString([UIFont](UIFont.html "enum class in zombie.ui") font,
    double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### DrawStringUntrimmed

    public void DrawStringUntrimmed([UIFont](UIFont.html "enum class in zombie.ui") font,
    double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### DrawStringCentre

    public void DrawStringCentre(double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### DrawStringCentre

    public void DrawStringCentre([UIFont](UIFont.html "enum class in zombie.ui") font,
    double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### DrawStringCentre

    public void DrawStringCentre([AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") font,
    double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### DrawStringCentreDefered

    public void DrawStringCentreDefered([UIFont](UIFont.html "enum class in zombie.ui") font,
    double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### DrawTextFromGameWorld

    public void DrawTextFromGameWorld()
  + ### DrawStringRight

    public void DrawStringRight(double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### GetDrawTextObject

    public [TextDrawObject](TextDrawObject.html "class in zombie.ui") GetDrawTextObject([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    int maxLineWidth,
    boolean restrictImages)
  + ### DrawTextObject

    public void DrawTextObject(double x,
    double y,
    [TextDrawObject](TextDrawObject.html "class in zombie.ui") td)
  + ### DrawStringBBcode

    public void DrawStringBBcode([UIFont](UIFont.html "enum class in zombie.ui") font,
    double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### getNormalFromFontSize

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") getNormalFromFontSize(int points)
  + ### getFontFromEnum

    public [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") getFontFromEnum([UIFont](UIFont.html "enum class in zombie.ui") font)
  + ### getFontHeight

    public int getFontHeight([UIFont](UIFont.html "enum class in zombie.ui") fontID)
  + ### isSdf

    public boolean isSdf([UIFont](UIFont.html "enum class in zombie.ui") font)
  + ### getAllFonts

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UIFont](UIFont.html "enum class in zombie.ui")> getAllFonts([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UIFont](UIFont.html "enum class in zombie.ui")> result)
  + ### DrawStringRight

    public void DrawStringRight([UIFont](UIFont.html "enum class in zombie.ui") font,
    double x,
    double y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### getFontFilePath

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFontFilePath([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lang,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sizeDir,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### Init

    public void Init()
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io")

    Throws:
    :   `FileNotFoundException`
  + ### isAnyFontLoading

    public boolean isAnyFontLoading()
  + ### isUsingNonEnglishFonts

    public boolean isUsingNonEnglishFonts()
  + ### MeasureStringX

    public int MeasureStringX([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### CentreStringYOffset

    public int CentreStringYOffset([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)

    CentreStringYOffset provides an offset value to be subtracted from the Y position of the text.
    It centres it based on the font height, so additional offsets are required for
    elements taller than the font size.
  + ### MeasureStringY

    public int MeasureStringY([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### MeasureStringYReal

    public int MeasureStringYReal([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### MeasureStringYOffset

    public int MeasureStringYOffset([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### MeasureStringY

    public int MeasureStringY([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    boolean returnActualHeight,
    boolean returnOffset)
  + ### MeasureFont

    public int MeasureFont([UIFont](UIFont.html "enum class in zombie.ui") font)
  + ### WrapText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") WrapText([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    int maxWidth)
  + ### WrapText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") WrapText([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    int maxWidth,
    int maxLines,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") maxLinesSuffix)
  + ### getCurrentCodeFont

    public [UIFont](UIFont.html "enum class in zombie.ui") getCurrentCodeFont()