[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.fonts](package-summary.html)
2. [AngelCodeFont](AngelCodeFont.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [DISPLAY\_LIST\_CACHE\_SIZE](#DISPLAY_LIST_CACHE_SIZE)
   2. [MAX\_CHAR](#MAX_CHAR)
   3. [baseDisplayListId](#baseDisplayListId)
   4. [chars](#chars)
   5. [displayListCaching](#displayListCaching)
   6. [eldestDisplayList](#eldestDisplayList)
   7. [eldestDisplayListId](#eldestDisplayListId)
   8. [displayLists](#displayLists)
   9. [fontImage](#fontImage)
   10. [lineHeight](#lineHeight)
   11. [pages](#pages)
   12. [fntFile](#fntFile)
   13. [sdf](#sdf)
   14. [xoff](#xoff)
   15. [yoff](#yoff)
   16. [curCol](#curCol)
   17. [curR](#curR)
   18. [curG](#curG)
   19. [curB](#curB)
   20. [curA](#curA)
   21. [scale](#scale)
   22. [data](#data)
7. [Constructor Details](#constructor-detail)
   1. [AngelCodeFont(String, Texture)](#%3Cinit%3E(java.lang.String,zombie.core.textures.Texture))
   2. [AngelCodeFont(String, String)](#%3Cinit%3E(java.lang.String,java.lang.String))
8. [Method Details](#method-detail)
   1. [drawString(float, float, String)](#drawString(float,float,java.lang.String))
   2. [drawString(float, float, String, Color)](#drawString(float,float,java.lang.String,zombie.core.Color))
   3. [drawString(float, float, String, float, float, float, float)](#drawString(float,float,java.lang.String,float,float,float,float))
   4. [drawString(float, float, float, String, float, float, float, float)](#drawString(float,float,float,java.lang.String,float,float,float,float))
   5. [drawString(float, float, String, Color, int, int)](#drawString(float,float,java.lang.String,zombie.core.Color,int,int))
   6. [drawString(float, float, String, float, float, float, float, int, int)](#drawString(float,float,java.lang.String,float,float,float,float,int,int))
   7. [drawString(float, float, float, String, float, float, float, float, int, int)](#drawString(float,float,float,java.lang.String,float,float,float,float,int,int))
   8. [getHeight(String)](#getHeight(java.lang.String))
   9. [getHeight(String, boolean, boolean)](#getHeight(java.lang.String,boolean,boolean))
   10. [getLineHeight()](#getLineHeight())
   11. [getWidth(String)](#getWidth(java.lang.String))
   12. [getWidth(String, boolean)](#getWidth(java.lang.String,boolean))
   13. [getWidth(String, int, int)](#getWidth(java.lang.String,int,int))
   14. [getWidth(String, int, int, boolean)](#getWidth(java.lang.String,int,int,boolean))
   15. [getYOffset(String)](#getYOffset(java.lang.String))
   16. [parseChar(String)](#parseChar(java.lang.String))
   17. [parseFnt(InputStream)](#parseFnt(java.io.InputStream))
   18. [render(String, int, int)](#render(java.lang.String,int,int))
   19. [onStateChanged(Asset.State, Asset.State, Asset)](#onStateChanged(zombie.asset.Asset.State,zombie.asset.Asset.State,zombie.asset.Asset))
   20. [isLoading()](#isLoading())
   21. [isSdf()](#isSdf())
   22. [setSdf(boolean)](#setSdf(boolean))
   23. [destroy()](#destroy())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AngelCodeFont
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.fonts.AngelCodeFont

All Implemented Interfaces:
:   `zombie.asset.AssetStateObserver, zombie.core.fonts.Font`

---

public final class AngelCodeFont
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.core.fonts.Font, zombie.asset.AssetStateObserver

A font implementation that will parse BMFont format font files. The font files can be output
by Hiero, which is included with Slick, and also the AngelCode font tool available at:

<http://www.angelcode.com/products/bmfont/>

This implementation copes with both the font display and kerning information
allowing nicer looking paragraphs of text. Note that this utility only
supports the text BMFont format definition file.

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `class`

  `AngelCodeFont.CharDef`

  `static final class`

  `AngelCodeFont.CharDefTexture`

  `private static class`

  `AngelCodeFont.DisplayList`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `baseDisplayListId`

  The first display list ID

  `AngelCodeFont.CharDef[]`

  `chars`

  The characters building up the font

  `static float`

  `curA`

  `static float`

  `curB`

  `static Color`

  `curCol`

  `static float`

  `curG`

  `static float`

  `curR`

  `private static char[]`

  `data`

  Render based on immediate rendering

  `private static final int`

  `DISPLAY_LIST_CACHE_SIZE`

  The line cache size, this is how many lines we can render before starting
  to regenerate lists

  `private boolean`

  `displayListCaching`

  True if this font should use display list caching

  `private final LinkedHashMap<String, AngelCodeFont.DisplayList>`

  `displayLists`

  The display list cache for rendered lines

  `private AngelCodeFont.DisplayList`

  `eldestDisplayList`

  The eldest display list

  `private int`

  `eldestDisplayListId`

  The eldest display list ID

  `private File`

  `fntFile`

  `private Texture`

  `fontImage`

  The image containing the bitmap font

  `private int`

  `lineHeight`

  The height of a line

  `private static final int`

  `MAX_CHAR`

  The highest character that AngelCodeFont will support.

  `private final HashMap<Short,Texture>`

  `pages`

  `private static float`

  `scale`

  `private boolean`

  `sdf`

  `static int`

  `xoff`

  `static int`

  `yoff`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AngelCodeFont(String fntFile,
  String imgFile)`

  Create a new font based on a font definition from AngelCode's tool and
  the font image generated from the tool.

  `AngelCodeFont(String fntFile,
  Texture image)`

  Create a new font based on a font definition from AngelCode's tool and
  the font image generated from the tool.
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `destroy()`

  `void`

  `drawString(float x,
  float y,
  float scale,
  String text,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `drawString(float x,
  float y,
  float scale,
  String text,
  float r,
  float g,
  float b,
  float a,
  int startIndex,
  int endIndex)`

  `void`

  `drawString(float x,
  float y,
  String text)`

  Draw a string to the screen

  `void`

  `drawString(float x,
  float y,
  String text,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `drawString(float x,
  float y,
  String text,
  float r,
  float g,
  float b,
  float a,
  int startIndex,
  int endIndex)`

  `void`

  `drawString(float x,
  float y,
  String text,
  Color col)`

  Draw a string to the screen

  `void`

  `drawString(float x,
  float y,
  String text,
  Color col,
  int startIndex,
  int endIndex)`

  Draw part of a string to the screen.

  `int`

  `getHeight(String text)`

  get the height of the given string

  `int`

  `getHeight(String text,
  boolean returnActualHeight,
  boolean returnOffset)`

  `int`

  `getLineHeight()`

  get the maximum height of any line drawn by this font

  `int`

  `getWidth(String text)`

  get the width of the given string

  `int`

  `getWidth(String text,
  boolean xAdvance)`

  `int`

  `getWidth(String text,
  int start,
  int end)`

  `int`

  `getWidth(String text,
  int start,
  int end,
  boolean xadvance)`

  `int`

  `getYOffset(String text)`

  Returns the distance from the y drawing location to the top most pixel of the specified text.

  `boolean`

  `isLoading()`

  `boolean`

  `isSdf()`

  `void`

  `onStateChanged(zombie.asset.Asset.State oldState,
  zombie.asset.Asset.State newState,
  zombie.asset.Asset asset)`

  `private AngelCodeFont.CharDef`

  `parseChar(String line)`

  Parse a single character line from the definition

  `private void`

  `parseFnt(InputStream fntFile)`

  Parse the font definition file

  `private void`

  `render(String text,
  int start,
  int end)`

  `void`

  `setSdf(boolean b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DISPLAY\_LIST\_CACHE\_SIZE

    private static final int DISPLAY\_LIST\_CACHE\_SIZE

    The line cache size, this is how many lines we can render before starting
    to regenerate lists

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.fonts.AngelCodeFont.DISPLAY_LIST_CACHE_SIZE)
  + ### MAX\_CHAR

    private static final int MAX\_CHAR

    The highest character that AngelCodeFont will support.

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.core.fonts.AngelCodeFont.MAX_CHAR)
  + ### baseDisplayListId

    private int baseDisplayListId

    The first display list ID
  + ### chars

    public [AngelCodeFont.CharDef](AngelCodeFont.CharDef.html "class in zombie.core.fonts")[] chars

    The characters building up the font
  + ### displayListCaching

    private boolean displayListCaching

    True if this font should use display list caching
  + ### eldestDisplayList

    private [AngelCodeFont.DisplayList](AngelCodeFont.DisplayList.html "class in zombie.core.fonts") eldestDisplayList

    The eldest display list
  + ### eldestDisplayListId

    private int eldestDisplayListId

    The eldest display list ID
  + ### displayLists

    private final [LinkedHashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedHashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AngelCodeFont.DisplayList](AngelCodeFont.DisplayList.html "class in zombie.core.fonts")> displayLists

    The display list cache for rendered lines
  + ### fontImage

    private [Texture](../textures/Texture.html "class in zombie.core.textures") fontImage

    The image containing the bitmap font
  + ### lineHeight

    private int lineHeight

    The height of a line
  + ### pages

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Short](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Short.html "class or interface in java.lang"),[Texture](../textures/Texture.html "class in zombie.core.textures")> pages
  + ### fntFile

    private [File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") fntFile
  + ### sdf

    private boolean sdf
  + ### xoff

    public static int xoff
  + ### yoff

    public static int yoff
  + ### curCol

    public static [Color](../Color.html "class in zombie.core") curCol
  + ### curR

    public static float curR
  + ### curG

    public static float curG
  + ### curB

    public static float curB
  + ### curA

    public static float curA
  + ### scale

    private static float scale
  + ### data

    private static char[] data

    Render based on immediate rendering
* Constructor Details
  -------------------

  + ### AngelCodeFont

    public AngelCodeFont([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fntFile,
    [Texture](../textures/Texture.html "class in zombie.core.textures") image)
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io")

    Create a new font based on a font definition from AngelCode's tool and
    the font image generated from the tool.

    Parameters:
    :   `fntFile` - The location of the font defnition file
    :   `image` - The image to use for the font
  + ### AngelCodeFont

    public AngelCodeFont([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fntFile,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") imgFile)
    throws [FileNotFoundException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/FileNotFoundException.html "class or interface in java.io")

    Create a new font based on a font definition from AngelCode's tool and
    the font image generated from the tool.

    Parameters:
    :   `fntFile` - The location of the font defnition file
    :   `imgFile` - The location of the font image
* Method Details
  --------------

  + ### drawString

    public void drawString(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)

    Description copied from interface: `zombie.core.fonts.Font`

    Draw a string to the screen

    Specified by:
    :   `drawString` in interface `zombie.core.fonts.Font`

    Parameters:
    :   `x` - The x location at which to draw the string
    :   `y` - The y location at which to draw the string
    :   `text` - The text to be displayed
  + ### drawString

    public void drawString(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [Color](../Color.html "class in zombie.core") col)

    Description copied from interface: `zombie.core.fonts.Font`

    Draw a string to the screen

    Specified by:
    :   `drawString` in interface `zombie.core.fonts.Font`

    Parameters:
    :   `x` - The x location at which to draw the string
    :   `y` - The y location at which to draw the string
    :   `text` - The text to be displayed
    :   `col` - The colour to draw with
  + ### drawString

    public void drawString(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    float r,
    float g,
    float b,
    float a)
  + ### drawString

    public void drawString(float x,
    float y,
    float scale,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    float r,
    float g,
    float b,
    float a)
  + ### drawString

    public void drawString(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    [Color](../Color.html "class in zombie.core") col,
    int startIndex,
    int endIndex)

    Description copied from interface: `zombie.core.fonts.Font`

    Draw part of a string to the screen. Note that this will
    still position the text as though it's part of the bigger string.

    Specified by:
    :   `drawString` in interface `zombie.core.fonts.Font`

    Parameters:
    :   `x` - The x location at which to draw the string
    :   `y` - The y location at which to draw the string
    :   `text` - The text to be displayed
    :   `col` - The colour to draw with
    :   `startIndex` - The index of the first character to draw
    :   `endIndex` - The index of the last character from the string to draw
  + ### drawString

    public void drawString(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    float r,
    float g,
    float b,
    float a,
    int startIndex,
    int endIndex)
  + ### drawString

    public void drawString(float x,
    float y,
    float scale,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    float r,
    float g,
    float b,
    float a,
    int startIndex,
    int endIndex)
  + ### getHeight

    public int getHeight([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)

    Description copied from interface: `zombie.core.fonts.Font`

    get the height of the given string

    Specified by:
    :   `getHeight` in interface `zombie.core.fonts.Font`

    Parameters:
    :   `text` - The string to obtain the rendered with of

    Returns:
    :   The width of the given string

    See Also:
    :   - invalid reference

          ```
          org.newdawn.slick.Font#getHeight(String)
          ```
  + ### getHeight

    public int getHeight([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    boolean returnActualHeight,
    boolean returnOffset)
  + ### getLineHeight

    public int getLineHeight()

    Description copied from interface: `zombie.core.fonts.Font`

    get the maximum height of any line drawn by this font

    Specified by:
    :   `getLineHeight` in interface `zombie.core.fonts.Font`

    Returns:
    :   The maxium height of any line drawn by this font

    See Also:
    :   - invalid reference

          ```
          org.newdawn.slick.Font#getLineHeight()
          ```
  + ### getWidth

    public int getWidth([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)

    Description copied from interface: `zombie.core.fonts.Font`

    get the width of the given string

    Specified by:
    :   `getWidth` in interface `zombie.core.fonts.Font`

    Parameters:
    :   `text` - The string to obtain the rendered with of

    Returns:
    :   The width of the given string
  + ### getWidth

    public int getWidth([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    boolean xAdvance)

    Specified by:
    :   `getWidth` in interface `zombie.core.fonts.Font`
  + ### getWidth

    public int getWidth([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    int start,
    int end)

    Specified by:
    :   `getWidth` in interface `zombie.core.fonts.Font`
  + ### getWidth

    public int getWidth([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    int start,
    int end,
    boolean xadvance)

    Specified by:
    :   `getWidth` in interface `zombie.core.fonts.Font`

    See Also:
    :   - invalid reference

          ```
          org.newdawn.slick.Font#getWidth(String)
          ```
  + ### getYOffset

    public int getYOffset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)

    Returns the distance from the y drawing location to the top most pixel of the specified text.

    Parameters:
    :   `text` - The text that is to be tested

    Returns:
    :   The yoffset from the y draw location at which text will start
  + ### parseChar

    private [AngelCodeFont.CharDef](AngelCodeFont.CharDef.html "class in zombie.core.fonts") parseChar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)

    Parse a single character line from the definition

    Parameters:
    :   `line` - The line to be parsed

    Returns:
    :   The character definition from the line
  + ### parseFnt

    private void parseFnt([InputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/InputStream.html "class or interface in java.io") fntFile)

    Parse the font definition file

    Parameters:
    :   `fntFile` - The stream from which the font file can be read
  + ### render

    private void render([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text,
    int start,
    int end)
  + ### onStateChanged

    public void onStateChanged(zombie.asset.Asset.State oldState,
    zombie.asset.Asset.State newState,
    zombie.asset.Asset asset)

    Specified by:
    :   `onStateChanged` in interface `zombie.asset.AssetStateObserver`
  + ### isLoading

    public boolean isLoading()
  + ### isSdf

    public boolean isSdf()
  + ### setSdf

    public void setSdf(boolean b)
  + ### destroy

    public void destroy()