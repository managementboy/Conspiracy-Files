[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [TextDrawObject](TextDrawObject.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [validImages](#validImages)
   2. [validFonts](#validFonts)
   3. [lines](#lines)
   4. [width](#width)
   5. [height](#height)
   6. [maxCharsLine](#maxCharsLine)
   7. [defaultFontEnum](#defaultFontEnum)
   8. [defaultFont](#defaultFont)
   9. [original](#original)
   10. [unformatted](#unformatted)
   11. [currentLine](#currentLine)
   12. [currentElement](#currentElement)
   13. [hasOpened](#hasOpened)
   14. [drawBackground](#drawBackground)
   15. [allowImages](#allowImages)
   16. [allowChatIcons](#allowChatIcons)
   17. [allowColors](#allowColors)
   18. [allowFonts](#allowFonts)
   19. [allowBbcode](#allowBbcode)
   20. [allowAnyImage](#allowAnyImage)
   21. [allowLineBreaks](#allowLineBreaks)
   22. [equalizeLineHeights](#equalizeLineHeights)
   23. [enabled](#enabled)
   24. [visibleRadius](#visibleRadius)
   25. [scrambleVal](#scrambleVal)
   26. [outlineR](#outlineR)
   27. [outlineG](#outlineG)
   28. [outlineB](#outlineB)
   29. [outlineA](#outlineA)
   30. [defaultR](#defaultR)
   31. [defaultG](#defaultG)
   32. [defaultB](#defaultB)
   33. [defaultA](#defaultA)
   34. [hearRange](#hearRange)
   35. [internalClock](#internalClock)
   36. [customTag](#customTag)
   37. [customImageMaxDim](#customImageMaxDim)
   38. [defaultHorz](#defaultHorz)
   39. [drawMode](#drawMode)
   40. [renderBatch](#renderBatch)
   41. [renderBatchPool](#renderBatchPool)
   42. [elemText](#elemText)
7. [Constructor Details](#constructor-detail)
   1. [TextDrawObject()](#%3Cinit%3E())
   2. [TextDrawObject(int, int, int, boolean)](#%3Cinit%3E(int,int,int,boolean))
   3. [TextDrawObject(int, int, int, boolean, boolean, boolean, boolean, boolean, boolean)](#%3Cinit%3E(int,int,int,boolean,boolean,boolean,boolean,boolean,boolean))
8. [Method Details](#method-detail)
   1. [setEnabled(boolean)](#setEnabled(boolean))
   2. [getEnabled()](#getEnabled())
   3. [setVisibleRadius(int)](#setVisibleRadius(int))
   4. [getVisibleRadius()](#getVisibleRadius())
   5. [setDrawBackground(boolean)](#setDrawBackground(boolean))
   6. [setAllowImages(boolean)](#setAllowImages(boolean))
   7. [setAllowChatIcons(boolean)](#setAllowChatIcons(boolean))
   8. [setAllowColors(boolean)](#setAllowColors(boolean))
   9. [setAllowFonts(boolean)](#setAllowFonts(boolean))
   10. [setAllowBBcode(boolean)](#setAllowBBcode(boolean))
   11. [setAllowAnyImage(boolean)](#setAllowAnyImage(boolean))
   12. [setAllowLineBreaks(boolean)](#setAllowLineBreaks(boolean))
   13. [setEqualizeLineHeights(boolean)](#setEqualizeLineHeights(boolean))
   14. [setSettings(boolean, boolean, boolean, boolean, boolean, boolean)](#setSettings(boolean,boolean,boolean,boolean,boolean,boolean))
   15. [setCustomTag(String)](#setCustomTag(java.lang.String))
   16. [getCustomTag()](#getCustomTag())
   17. [setValidImages(String[])](#setValidImages(java.lang.String%5B%5D))
   18. [setValidFonts(String[])](#setValidFonts(java.lang.String%5B%5D))
   19. [setMaxCharsPerLine(int)](#setMaxCharsPerLine(int))
   20. [setCustomImageMaxDimensions(int)](#setCustomImageMaxDimensions(int))
   21. [setOutlineColors(int, int, int)](#setOutlineColors(int,int,int))
   22. [setOutlineColors(int, int, int, int)](#setOutlineColors(int,int,int,int))
   23. [setOutlineColors(float, float, float)](#setOutlineColors(float,float,float))
   24. [setOutlineColors(float, float, float, float)](#setOutlineColors(float,float,float,float))
   25. [setDefaultColors(int, int, int)](#setDefaultColors(int,int,int))
   26. [setDefaultColors(int, int, int, int)](#setDefaultColors(int,int,int,int))
   27. [setDefaultColors(float, float, float)](#setDefaultColors(float,float,float))
   28. [setDefaultColors(float, float, float, float)](#setDefaultColors(float,float,float,float))
   29. [setHorizontalAlign(String)](#setHorizontalAlign(java.lang.String))
   30. [setHorizontalAlign(TextDrawHorizontal)](#setHorizontalAlign(zombie.ui.TextDrawHorizontal))
   31. [getHorizontalAlign()](#getHorizontalAlign())
   32. [getOriginal()](#getOriginal())
   33. [getUnformatted()](#getUnformatted())
   34. [getWidth()](#getWidth())
   35. [getHeight()](#getHeight())
   36. [getDefaultFontEnum()](#getDefaultFontEnum())
   37. [isNullOrZeroLength()](#isNullOrZeroLength())
   38. [getInternalClock()](#getInternalClock())
   39. [setInternalTickClock(float)](#setInternalTickClock(float))
   40. [updateInternalTickClock()](#updateInternalTickClock())
   41. [updateInternalTickClock(float)](#updateInternalTickClock(float))
   42. [setScrambleVal(float)](#setScrambleVal(float))
   43. [getScrambleVal()](#getScrambleVal())
   44. [setHearRange(int)](#setHearRange(int))
   45. [getHearRange()](#getHearRange())
   46. [isValidFont(String)](#isValidFont(java.lang.String))
   47. [isValidImage(String)](#isValidImage(java.lang.String))
   48. [tryColorInt(String)](#tryColorInt(java.lang.String))
   49. [readTagValue(char[], int)](#readTagValue(char%5B%5D,int))
   50. [Clear()](#Clear())
   51. [reset()](#reset())
   52. [addNewLine()](#addNewLine())
   53. [addText(String)](#addText(java.lang.String))
   54. [addWord(String)](#addWord(java.lang.String))
   55. [addNewElement()](#addNewElement())
   56. [readTag(char[], int, String)](#readTag(char%5B%5D,int,java.lang.String))
   57. [setDefaultFont(UIFont)](#setDefaultFont(zombie.ui.UIFont))
   58. [setDefaultFontInternal(UIFont)](#setDefaultFontInternal(zombie.ui.UIFont))
   59. [ReadString(String)](#ReadString(java.lang.String))
   60. [ReadString(String, int)](#ReadString(java.lang.String,int))
   61. [ReadString(UIFont, String, int)](#ReadString(zombie.ui.UIFont,java.lang.String,int))
   62. [calculateDimensions()](#calculateDimensions())
   63. [Draw(double, double)](#Draw(double,double))
   64. [Draw(double, double, boolean)](#Draw(double,double,boolean))
   65. [Draw(double, double, boolean, float)](#Draw(double,double,boolean,float))
   66. [Draw(double, double, double, double, double, double, boolean)](#Draw(double,double,double,double,double,double,boolean))
   67. [Draw(TextDrawHorizontal, double, double, double, double, double, double, boolean)](#Draw(zombie.ui.TextDrawHorizontal,double,double,double,double,double,double,boolean))
   68. [AddBatchedDraw(double, double)](#AddBatchedDraw(double,double))
   69. [AddBatchedDraw(double, double, boolean)](#AddBatchedDraw(double,double,boolean))
   70. [AddBatchedDraw(double, double, boolean, float)](#AddBatchedDraw(double,double,boolean,float))
   71. [AddBatchedDraw(double, double, double, double, double, double, boolean)](#AddBatchedDraw(double,double,double,double,double,double,boolean))
   72. [AddBatchedDraw(TextDrawHorizontal, double, double, double, double, double, double, boolean)](#AddBatchedDraw(zombie.ui.TextDrawHorizontal,double,double,double,double,double,double,boolean))
   73. [RenderBatch(int)](#RenderBatch(int))
   74. [NoRender(int)](#NoRender(int))
   75. [DrawRaw(TextDrawHorizontal, double, double, float, float, float, float, boolean)](#DrawRaw(zombie.ui.TextDrawHorizontal,double,double,float,float,float,float,boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TextDrawObject
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.TextDrawObject

---

public final class TextDrawObject
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `TextDrawObject.DrawElement`

  `private static final class`

  `TextDrawObject.DrawLine`

  `private static final class`

  `TextDrawObject.RenderBatch`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `allowAnyImage`

  `private boolean`

  `allowBbcode`

  `private boolean`

  `allowChatIcons`

  `private boolean`

  `allowColors`

  `private boolean`

  `allowFonts`

  `private boolean`

  `allowImages`

  `private boolean`

  `allowLineBreaks`

  `private TextDrawObject.DrawElement`

  `currentElement`

  `private TextDrawObject.DrawLine`

  `currentLine`

  `private int`

  `customImageMaxDim`

  `private String`

  `customTag`

  `private float`

  `defaultA`

  `private float`

  `defaultB`

  `private AngelCodeFont`

  `defaultFont`

  `private UIFont`

  `defaultFontEnum`

  `private float`

  `defaultG`

  `private zombie.ui.TextDrawHorizontal`

  `defaultHorz`

  `private float`

  `defaultR`

  `private boolean`

  `drawBackground`

  `private final int`

  `drawMode`

  `private String`

  `elemText`

  `private boolean`

  `enabled`

  `private boolean`

  `equalizeLineHeights`

  `private boolean`

  `hasOpened`

  `private int`

  `hearRange`

  `private int`

  `height`

  `private float`

  `internalClock`

  `private final ArrayList<TextDrawObject.DrawLine>`

  `lines`

  `private int`

  `maxCharsLine`

  `private String`

  `original`

  `private float`

  `outlineA`

  `private float`

  `outlineB`

  `private float`

  `outlineG`

  `private float`

  `outlineR`

  `private static final ArrayList<TextDrawObject.RenderBatch>`

  `renderBatch`

  `private static final ArrayDeque<TextDrawObject.RenderBatch>`

  `renderBatchPool`

  `private float`

  `scrambleVal`

  `private String`

  `unformatted`

  `private String[]`

  `validFonts`

  `private String[]`

  `validImages`

  `private int`

  `visibleRadius`

  `private int`

  `width`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TextDrawObject()`

  `TextDrawObject(int r,
  int g,
  int b,
  boolean allowBbcode)`

  `TextDrawObject(int r,
  int g,
  int b,
  boolean allowBbcode,
  boolean allowImages,
  boolean allowChatIcons,
  boolean allowColors,
  boolean allowFonts,
  boolean equalizeLineHeights)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddBatchedDraw(double x,
  double y)`

  `void`

  `AddBatchedDraw(double x,
  double y,
  boolean drawOutlines)`

  `void`

  `AddBatchedDraw(double x,
  double y,
  boolean drawOutlines,
  float alpha)`

  `void`

  `AddBatchedDraw(double x,
  double y,
  double r,
  double g,
  double b,
  double a,
  boolean drawOutlines)`

  `void`

  `AddBatchedDraw(zombie.ui.TextDrawHorizontal horz,
  double x,
  double y,
  double r,
  double g,
  double b,
  double a,
  boolean drawOutlines)`

  `private void`

  `addNewElement()`

  `private void`

  `addNewLine()`

  `private void`

  `addText(String word)`

  `private void`

  `addWord(String word)`

  `void`

  `calculateDimensions()`

  `void`

  `Clear()`

  `void`

  `Draw(double x,
  double y)`

  `void`

  `Draw(double x,
  double y,
  boolean drawOutlines)`

  `void`

  `Draw(double x,
  double y,
  boolean drawOutlines,
  float alpha)`

  `void`

  `Draw(double x,
  double y,
  double r,
  double g,
  double b,
  double a,
  boolean drawOutlines)`

  `void`

  `Draw(zombie.ui.TextDrawHorizontal horz,
  double x,
  double y,
  double r,
  double g,
  double b,
  double a,
  boolean drawOutlines)`

  `void`

  `DrawRaw(zombie.ui.TextDrawHorizontal horz,
  double x,
  double y,
  float r,
  float g,
  float b,
  float a,
  boolean drawOutlines)`

  `String`

  `getCustomTag()`

  `UIFont`

  `getDefaultFontEnum()`

  `boolean`

  `getEnabled()`

  `int`

  `getHearRange()`

  `int`

  `getHeight()`

  `zombie.ui.TextDrawHorizontal`

  `getHorizontalAlign()`

  `float`

  `getInternalClock()`

  `String`

  `getOriginal()`

  `float`

  `getScrambleVal()`

  `String`

  `getUnformatted()`

  `int`

  `getVisibleRadius()`

  `int`

  `getWidth()`

  `boolean`

  `isNullOrZeroLength()`

  `private boolean`

  `isValidFont(String fnt)`

  `private boolean`

  `isValidImage(String img)`

  `static void`

  `NoRender(int playerNum)`

  `void`

  `ReadString(String str)`

  `void`

  `ReadString(String str,
  int maxLineWidth)`

  `void`

  `ReadString(UIFont font,
  String str,
  int maxLineWidth)`

  `private int`

  `readTag(char[] chars,
  int pos,
  String tag)`

  `private String`

  `readTagValue(char[] chars,
  int pos)`

  `static void`

  `RenderBatch(int playerNum)`

  `private void`

  `reset()`

  `void`

  `setAllowAnyImage(boolean allowAnyImage)`

  `void`

  `setAllowBBcode(boolean allowBbcode)`

  `void`

  `setAllowChatIcons(boolean allowChatIcons)`

  `void`

  `setAllowColors(boolean allowColors)`

  `void`

  `setAllowFonts(boolean allowFonts)`

  `void`

  `setAllowImages(boolean allowImages)`

  `void`

  `setAllowLineBreaks(boolean allowLineBreaks)`

  `void`

  `setCustomImageMaxDimensions(int dim)`

  `void`

  `setCustomTag(String tag)`

  `void`

  `setDefaultColors(float r,
  float g,
  float b)`

  `void`

  `setDefaultColors(float r,
  float g,
  float b,
  float a)`

  `void`

  `setDefaultColors(int r,
  int g,
  int b)`

  `void`

  `setDefaultColors(int r,
  int g,
  int b,
  int a)`

  `void`

  `setDefaultFont(UIFont f)`

  `private void`

  `setDefaultFontInternal(UIFont f)`

  `void`

  `setDrawBackground(boolean draw)`

  `void`

  `setEnabled(boolean enabled)`

  `void`

  `setEqualizeLineHeights(boolean equalizeLineHeights)`

  `void`

  `setHearRange(int range)`

  `void`

  `setHorizontalAlign(String horz)`

  `void`

  `setHorizontalAlign(zombie.ui.TextDrawHorizontal horz)`

  `void`

  `setInternalTickClock(float ticks)`

  `void`

  `setMaxCharsPerLine(int charsperline)`

  `void`

  `setOutlineColors(float r,
  float g,
  float b)`

  `void`

  `setOutlineColors(float r,
  float g,
  float b,
  float a)`

  `void`

  `setOutlineColors(int r,
  int g,
  int b)`

  `void`

  `setOutlineColors(int r,
  int g,
  int b,
  int a)`

  `void`

  `setScrambleVal(float value)`

  `void`

  `setSettings(boolean allowBBcode,
  boolean allowImages,
  boolean allowChatIcons,
  boolean allowColors,
  boolean allowFonts,
  boolean equalizeLineHeights)`

  `void`

  `setValidFonts(String[] list)`

  `void`

  `setValidImages(String[] list)`

  `void`

  `setVisibleRadius(int radius)`

  `private int`

  `tryColorInt(String str)`

  `float`

  `updateInternalTickClock()`

  `float`

  `updateInternalTickClock(float delta)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### validImages

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] validImages
  + ### validFonts

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] validFonts
  + ### lines

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TextDrawObject.DrawLine](TextDrawObject.DrawLine.html "class in zombie.ui")> lines
  + ### width

    private int width
  + ### height

    private int height
  + ### maxCharsLine

    private int maxCharsLine
  + ### defaultFontEnum

    private [UIFont](UIFont.html "enum class in zombie.ui") defaultFontEnum
  + ### defaultFont

    private [AngelCodeFont](../core/fonts/AngelCodeFont.html "class in zombie.core.fonts") defaultFont
  + ### original

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") original
  + ### unformatted

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") unformatted
  + ### currentLine

    private [TextDrawObject.DrawLine](TextDrawObject.DrawLine.html "class in zombie.ui") currentLine
  + ### currentElement

    private [TextDrawObject.DrawElement](TextDrawObject.DrawElement.html "class in zombie.ui") currentElement
  + ### hasOpened

    private boolean hasOpened
  + ### drawBackground

    private boolean drawBackground
  + ### allowImages

    private boolean allowImages
  + ### allowChatIcons

    private boolean allowChatIcons
  + ### allowColors

    private boolean allowColors
  + ### allowFonts

    private boolean allowFonts
  + ### allowBbcode

    private boolean allowBbcode
  + ### allowAnyImage

    private boolean allowAnyImage
  + ### allowLineBreaks

    private boolean allowLineBreaks
  + ### equalizeLineHeights

    private boolean equalizeLineHeights
  + ### enabled

    private boolean enabled
  + ### visibleRadius

    private int visibleRadius
  + ### scrambleVal

    private float scrambleVal
  + ### outlineR

    private float outlineR
  + ### outlineG

    private float outlineG
  + ### outlineB

    private float outlineB
  + ### outlineA

    private float outlineA
  + ### defaultR

    private float defaultR
  + ### defaultG

    private float defaultG
  + ### defaultB

    private float defaultB
  + ### defaultA

    private float defaultA
  + ### hearRange

    private int hearRange
  + ### internalClock

    private float internalClock
  + ### customTag

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") customTag
  + ### customImageMaxDim

    private int customImageMaxDim
  + ### defaultHorz

    private zombie.ui.TextDrawHorizontal defaultHorz
  + ### drawMode

    private final int drawMode

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.ui.TextDrawObject.drawMode)
  + ### renderBatch

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TextDrawObject.RenderBatch](TextDrawObject.RenderBatch.html "class in zombie.ui")> renderBatch
  + ### renderBatchPool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[TextDrawObject.RenderBatch](TextDrawObject.RenderBatch.html "class in zombie.ui")> renderBatchPool
  + ### elemText

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") elemText
* Constructor Details
  -------------------

  + ### TextDrawObject

    public TextDrawObject()
  + ### TextDrawObject

    public TextDrawObject(int r,
    int g,
    int b,
    boolean allowBbcode)
  + ### TextDrawObject

    public TextDrawObject(int r,
    int g,
    int b,
    boolean allowBbcode,
    boolean allowImages,
    boolean allowChatIcons,
    boolean allowColors,
    boolean allowFonts,
    boolean equalizeLineHeights)
* Method Details
  --------------

  + ### setEnabled

    public void setEnabled(boolean enabled)
  + ### getEnabled

    public boolean getEnabled()
  + ### setVisibleRadius

    public void setVisibleRadius(int radius)
  + ### getVisibleRadius

    public int getVisibleRadius()
  + ### setDrawBackground

    public void setDrawBackground(boolean draw)
  + ### setAllowImages

    public void setAllowImages(boolean allowImages)
  + ### setAllowChatIcons

    public void setAllowChatIcons(boolean allowChatIcons)
  + ### setAllowColors

    public void setAllowColors(boolean allowColors)
  + ### setAllowFonts

    public void setAllowFonts(boolean allowFonts)
  + ### setAllowBBcode

    public void setAllowBBcode(boolean allowBbcode)
  + ### setAllowAnyImage

    public void setAllowAnyImage(boolean allowAnyImage)
  + ### setAllowLineBreaks

    public void setAllowLineBreaks(boolean allowLineBreaks)
  + ### setEqualizeLineHeights

    public void setEqualizeLineHeights(boolean equalizeLineHeights)
  + ### setSettings

    public void setSettings(boolean allowBBcode,
    boolean allowImages,
    boolean allowChatIcons,
    boolean allowColors,
    boolean allowFonts,
    boolean equalizeLineHeights)
  + ### setCustomTag

    public void setCustomTag([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### getCustomTag

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomTag()
  + ### setValidImages

    public void setValidImages([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] list)
  + ### setValidFonts

    public void setValidFonts([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] list)
  + ### setMaxCharsPerLine

    public void setMaxCharsPerLine(int charsperline)
  + ### setCustomImageMaxDimensions

    public void setCustomImageMaxDimensions(int dim)
  + ### setOutlineColors

    public void setOutlineColors(int r,
    int g,
    int b)
  + ### setOutlineColors

    public void setOutlineColors(int r,
    int g,
    int b,
    int a)
  + ### setOutlineColors

    public void setOutlineColors(float r,
    float g,
    float b)
  + ### setOutlineColors

    public void setOutlineColors(float r,
    float g,
    float b,
    float a)
  + ### setDefaultColors

    public void setDefaultColors(int r,
    int g,
    int b)
  + ### setDefaultColors

    public void setDefaultColors(int r,
    int g,
    int b,
    int a)
  + ### setDefaultColors

    public void setDefaultColors(float r,
    float g,
    float b)
  + ### setDefaultColors

    public void setDefaultColors(float r,
    float g,
    float b,
    float a)
  + ### setHorizontalAlign

    public void setHorizontalAlign([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") horz)
  + ### setHorizontalAlign

    public void setHorizontalAlign(zombie.ui.TextDrawHorizontal horz)
  + ### getHorizontalAlign

    public zombie.ui.TextDrawHorizontal getHorizontalAlign()
  + ### getOriginal

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOriginal()
  + ### getUnformatted

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUnformatted()
  + ### getWidth

    public int getWidth()
  + ### getHeight

    public int getHeight()
  + ### getDefaultFontEnum

    public [UIFont](UIFont.html "enum class in zombie.ui") getDefaultFontEnum()
  + ### isNullOrZeroLength

    public boolean isNullOrZeroLength()
  + ### getInternalClock

    public float getInternalClock()
  + ### setInternalTickClock

    public void setInternalTickClock(float ticks)
  + ### updateInternalTickClock

    public float updateInternalTickClock()
  + ### updateInternalTickClock

    public float updateInternalTickClock(float delta)
  + ### setScrambleVal

    public void setScrambleVal(float value)
  + ### getScrambleVal

    public float getScrambleVal()
  + ### setHearRange

    public void setHearRange(int range)
  + ### getHearRange

    public int getHearRange()
  + ### isValidFont

    private boolean isValidFont([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fnt)
  + ### isValidImage

    private boolean isValidImage([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") img)
  + ### tryColorInt

    private int tryColorInt([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### readTagValue

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") readTagValue(char[] chars,
    int pos)
  + ### Clear

    public void Clear()
  + ### reset

    private void reset()
  + ### addNewLine

    private void addNewLine()
  + ### addText

    private void addText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### addWord

    private void addWord([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") word)
  + ### addNewElement

    private void addNewElement()
  + ### readTag

    private int readTag(char[] chars,
    int pos,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag)
  + ### setDefaultFont

    public void setDefaultFont([UIFont](UIFont.html "enum class in zombie.ui") f)
  + ### setDefaultFontInternal

    private void setDefaultFontInternal([UIFont](UIFont.html "enum class in zombie.ui") f)
  + ### ReadString

    public void ReadString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### ReadString

    public void ReadString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    int maxLineWidth)
  + ### ReadString

    public void ReadString([UIFont](UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    int maxLineWidth)
  + ### calculateDimensions

    public void calculateDimensions()
  + ### Draw

    public void Draw(double x,
    double y)
  + ### Draw

    public void Draw(double x,
    double y,
    boolean drawOutlines)
  + ### Draw

    public void Draw(double x,
    double y,
    boolean drawOutlines,
    float alpha)
  + ### Draw

    public void Draw(double x,
    double y,
    double r,
    double g,
    double b,
    double a,
    boolean drawOutlines)
  + ### Draw

    public void Draw(zombie.ui.TextDrawHorizontal horz,
    double x,
    double y,
    double r,
    double g,
    double b,
    double a,
    boolean drawOutlines)
  + ### AddBatchedDraw

    public void AddBatchedDraw(double x,
    double y)
  + ### AddBatchedDraw

    public void AddBatchedDraw(double x,
    double y,
    boolean drawOutlines)
  + ### AddBatchedDraw

    public void AddBatchedDraw(double x,
    double y,
    boolean drawOutlines,
    float alpha)
  + ### AddBatchedDraw

    public void AddBatchedDraw(double x,
    double y,
    double r,
    double g,
    double b,
    double a,
    boolean drawOutlines)
  + ### AddBatchedDraw

    public void AddBatchedDraw(zombie.ui.TextDrawHorizontal horz,
    double x,
    double y,
    double r,
    double g,
    double b,
    double a,
    boolean drawOutlines)
  + ### RenderBatch

    public static void RenderBatch(int playerNum)
  + ### NoRender

    public static void NoRender(int playerNum)
  + ### DrawRaw

    public void DrawRaw(zombie.ui.TextDrawHorizontal horz,
    double x,
    double y,
    float r,
    float g,
    float b,
    float a,
    boolean drawOutlines)