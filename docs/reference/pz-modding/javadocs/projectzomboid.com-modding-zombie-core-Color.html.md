[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [Color](Color.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [serialVersionUID](#serialVersionUID)
   2. [transparent](#transparent)
   3. [white](#white)
   4. [yellow](#yellow)
   5. [red](#red)
   6. [purple](#purple)
   7. [blue](#blue)
   8. [green](#green)
   9. [black](#black)
   10. [gray](#gray)
   11. [cyan](#cyan)
   12. [darkGray](#darkGray)
   13. [lightGray](#lightGray)
   14. [pink](#pink)
   15. [orange](#orange)
   16. [magenta](#magenta)
   17. [darkGreen](#darkGreen)
   18. [lightGreen](#lightGreen)
   19. [a](#a)
   20. [b](#b)
   21. [g](#g)
   22. [r](#r)
6. [Constructor Details](#constructor-detail)
   1. [Color()](#%3Cinit%3E())
   2. [Color(Color)](#%3Cinit%3E(zombie.core.Color))
   3. [Color(float, float, float)](#%3Cinit%3E(float,float,float))
   4. [Color(float, float, float, float)](#%3Cinit%3E(float,float,float,float))
   5. [Color(Color, Color, float)](#%3Cinit%3E(zombie.core.Color,zombie.core.Color,float))
   6. [Color(int, int, int)](#%3Cinit%3E(int,int,int))
   7. [Color(int, int, int, int)](#%3Cinit%3E(int,int,int,int))
   8. [Color(int)](#%3Cinit%3E(int))
7. [Method Details](#method-detail)
   1. [getR()](#getR())
   2. [getG()](#getG())
   3. [getB()](#getB())
   4. [setColor(Color, Color, float)](#setColor(zombie.core.Color,zombie.core.Color,float))
   5. [fromColor(int)](#fromColor(int))
   6. [setABGR(int)](#setABGR(int))
   7. [abgrToColor(int, Color)](#abgrToColor(int,zombie.core.Color))
   8. [colorToABGR(Color)](#colorToABGR(zombie.core.Color))
   9. [colorToABGR(ColorInfo)](#colorToABGR(zombie.core.textures.ColorInfo))
   10. [colorToABGR(float, float, float, float)](#colorToABGR(float,float,float,float))
   11. [multiplyABGR(int, int)](#multiplyABGR(int,int))
   12. [multiplyBGR(int, int)](#multiplyBGR(int,int))
   13. [blendBGR(int, int)](#blendBGR(int,int))
   14. [blendABGR(int, int)](#blendABGR(int,int))
   15. [tintABGR(int, int)](#tintABGR(int,int))
   16. [lerpABGR(int, int, float)](#lerpABGR(int,int,float))
   17. [getAlphaChannelFromABGR(int)](#getAlphaChannelFromABGR(int))
   18. [getBlueChannelFromABGR(int)](#getBlueChannelFromABGR(int))
   19. [getGreenChannelFromABGR(int)](#getGreenChannelFromABGR(int))
   20. [getRedChannelFromABGR(int)](#getRedChannelFromABGR(int))
   21. [setAlphaChannelToABGR(int, float)](#setAlphaChannelToABGR(int,float))
   22. [setBlueChannelToABGR(int, float)](#setBlueChannelToABGR(int,float))
   23. [setGreenChannelToABGR(int, float)](#setGreenChannelToABGR(int,float))
   24. [setRedChannelToABGR(int, float)](#setRedChannelToABGR(int,float))
   25. [random()](#random())
   26. [decode(String)](#decode(java.lang.String))
   27. [add(Color)](#add(zombie.core.Color))
   28. [addToCopy(Color)](#addToCopy(zombie.core.Color))
   29. [brighter()](#brighter())
   30. [brighter(float)](#brighter(float))
   31. [darker()](#darker())
   32. [darker(float)](#darker(float))
   33. [equals(Object)](#equals(java.lang.Object))
   34. [equalBytes(Color)](#equalBytes(zombie.core.Color))
   35. [set(Color)](#set(zombie.core.Color))
   36. [set(float, float, float)](#set(float,float,float))
   37. [set(float, float, float, float)](#set(float,float,float,float))
   38. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   39. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   40. [getAlpha()](#getAlpha())
   41. [getAlphaFloat()](#getAlphaFloat())
   42. [getRedFloat()](#getRedFloat())
   43. [getGreenFloat()](#getGreenFloat())
   44. [getBlueFloat()](#getBlueFloat())
   45. [getAlphaByte()](#getAlphaByte())
   46. [getBlue()](#getBlue())
   47. [getBlueByte()](#getBlueByte())
   48. [getGreen()](#getGreen())
   49. [getGreenByte()](#getGreenByte())
   50. [getRed()](#getRed())
   51. [getRedByte()](#getRedByte())
   52. [hashCode()](#hashCode())
   53. [multiply(Color)](#multiply(zombie.core.Color))
   54. [scale(float)](#scale(float))
   55. [scaleCopy(float)](#scaleCopy(float))
   56. [toString()](#toString())
   57. [interp(Color, float, Color)](#interp(zombie.core.Color,float,zombie.core.Color))
   58. [changeHSBValue(float, float, float)](#changeHSBValue(float,float,float))
   59. [HSBtoRGB(float, float, float, Color)](#HSBtoRGB(float,float,float,zombie.core.Color))
   60. [HSBtoRGB(float, float, float)](#HSBtoRGB(float,float,float))
   61. [saveCompactNoAlpha(ByteBuffer)](#saveCompactNoAlpha(java.nio.ByteBuffer))
   62. [loadCompactNoAlpha(ByteBuffer)](#loadCompactNoAlpha(java.nio.ByteBuffer))
   63. [saveCompact(ByteBuffer)](#saveCompact(java.nio.ByteBuffer))
   64. [loadCompact(ByteBuffer)](#loadCompact(java.nio.ByteBuffer))
   65. [saveCompact(ByteBuffer, boolean)](#saveCompact(java.nio.ByteBuffer,boolean))
   66. [loadCompact(ByteBuffer, boolean)](#loadCompact(java.nio.ByteBuffer,boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Color
===========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.Color

All Implemented Interfaces:
:   `Serializable`

---

public final class Color
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Serializable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/Serializable.html "class or interface in java.io")

See Also:
:   * [Serialized Form](../../serialized-form.html#zombie.core.Color)

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `a`

  `float`

  `b`

  `static final Color`

  `black`

  `static final Color`

  `blue`

  `static final Color`

  `cyan`

  `static final Color`

  `darkGray`

  `static final Color`

  `darkGreen`

  `float`

  `g`

  `static final Color`

  `gray`

  `static final Color`

  `green`

  `static final Color`

  `lightGray`

  `static final Color`

  `lightGreen`

  `static final Color`

  `magenta`

  `static final Color`

  `orange`

  `static final Color`

  `pink`

  `static final Color`

  `purple`

  `float`

  `r`

  `static final Color`

  `red`

  `private static final long`

  `serialVersionUID`

  `static final Color`

  `transparent`

  `static final Color`

  `white`

  `static final Color`

  `yellow`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Color()`

  `Color(float r,
  float g,
  float b)`

  `Color(float r,
  float g,
  float b,
  float a)`

  `Color(int value)`

  `Color(int r,
  int g,
  int b)`

  `Color(int r,
  int g,
  int b,
  int a)`

  `Color(Color color)`

  `Color(Color colorA,
  Color colorB,
  float delta)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `static Color`

  `abgrToColor(int valueABGR,
  Color result)`

  `void`

  `add(Color c)`

  `Color`

  `addToCopy(Color c)`

  `static int`

  `blendABGR(int valueABGR,
  int targetABGR)`

  `static int`

  `blendBGR(int valueABGR,
  int targetABGR)`

  `Color`

  `brighter()`

  `Color`

  `brighter(float scale)`

  `void`

  `changeHSBValue(float hFactor,
  float sFactor,
  float bFactor)`

  `static int`

  `colorToABGR(float r,
  float g,
  float b,
  float a)`

  `static int`

  `colorToABGR(Color val)`

  `static int`

  `colorToABGR(ColorInfo val)`

  `Color`

  `darker()`

  `Color`

  `darker(float scale)`

  `static Color`

  `decode(String nm)`

  `boolean`

  `equalBytes(Color other)`

  `boolean`

  `equals(Object other)`

  `void`

  `fromColor(int valueABGR)`

  Deprecated.

  `int`

  `getAlpha()`

  `int`

  `getAlphaByte()`

  `static float`

  `getAlphaChannelFromABGR(int valueABGR)`

  `float`

  `getAlphaFloat()`

  `float`

  `getB()`

  `int`

  `getBlue()`

  `int`

  `getBlueByte()`

  get the blue byte component of this colour

  `static float`

  `getBlueChannelFromABGR(int valueABGR)`

  `float`

  `getBlueFloat()`

  `float`

  `getG()`

  `int`

  `getGreen()`

  `int`

  `getGreenByte()`

  `static float`

  `getGreenChannelFromABGR(int valueABGR)`

  `float`

  `getGreenFloat()`

  `float`

  `getR()`

  `int`

  `getRed()`

  `int`

  `getRedByte()`

  `static float`

  `getRedChannelFromABGR(int valueABGR)`

  `float`

  `getRedFloat()`

  `int`

  `hashCode()`

  `static Color`

  `HSBtoRGB(float hue,
  float saturation,
  float brightness)`

  `static Color`

  `HSBtoRGB(float hue,
  float saturation,
  float brightness,
  Color result)`

  `void`

  `interp(Color to,
  float delta,
  Color dest)`

  `static int`

  `lerpABGR(int colA,
  int colB,
  float alpha)`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `loadCompact(ByteBuffer input)`

  `private void`

  `loadCompact(ByteBuffer input,
  boolean loadAlpha)`

  `void`

  `loadCompactNoAlpha(ByteBuffer input)`

  `Color`

  `multiply(Color c)`

  `static int`

  `multiplyABGR(int valueABGR,
  int multiplierABGR)`

  `static int`

  `multiplyBGR(int valueABGR,
  int multiplierABGR)`

  `static Color`

  `random()`

  `void`

  `save(ByteBuffer output)`

  `void`

  `saveCompact(ByteBuffer output)`

  `private void`

  `saveCompact(ByteBuffer output,
  boolean saveAlpha)`

  `void`

  `saveCompactNoAlpha(ByteBuffer output)`

  `Color`

  `scale(float value)`

  `Color`

  `scaleCopy(float value)`

  `Color`

  `set(float r,
  float g,
  float b)`

  `Color`

  `set(float r,
  float g,
  float b,
  float a)`

  `Color`

  `set(Color other)`

  `void`

  `setABGR(int valueABGR)`

  `static int`

  `setAlphaChannelToABGR(int valueABGR,
  float a)`

  `static int`

  `setBlueChannelToABGR(int valueABGR,
  float b)`

  `void`

  `setColor(Color colorA,
  Color colorB,
  float delta)`

  `static int`

  `setGreenChannelToABGR(int valueABGR,
  float g)`

  `static int`

  `setRedChannelToABGR(int valueABGR,
  float r)`

  `static int`

  `tintABGR(int targetABGR,
  int tintABGR)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### serialVersionUID

    private static final long serialVersionUID

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.core.Color.serialVersionUID)
  + ### transparent

    public static final [Color](Color.html "class in zombie.core") transparent
  + ### white

    public static final [Color](Color.html "class in zombie.core") white
  + ### yellow

    public static final [Color](Color.html "class in zombie.core") yellow
  + ### red

    public static final [Color](Color.html "class in zombie.core") red
  + ### purple

    public static final [Color](Color.html "class in zombie.core") purple
  + ### blue

    public static final [Color](Color.html "class in zombie.core") blue
  + ### green

    public static final [Color](Color.html "class in zombie.core") green
  + ### black

    public static final [Color](Color.html "class in zombie.core") black
  + ### gray

    public static final [Color](Color.html "class in zombie.core") gray
  + ### cyan

    public static final [Color](Color.html "class in zombie.core") cyan
  + ### darkGray

    public static final [Color](Color.html "class in zombie.core") darkGray
  + ### lightGray

    public static final [Color](Color.html "class in zombie.core") lightGray
  + ### pink

    public static final [Color](Color.html "class in zombie.core") pink
  + ### orange

    public static final [Color](Color.html "class in zombie.core") orange
  + ### magenta

    public static final [Color](Color.html "class in zombie.core") magenta
  + ### darkGreen

    public static final [Color](Color.html "class in zombie.core") darkGreen
  + ### lightGreen

    public static final [Color](Color.html "class in zombie.core") lightGreen
  + ### a

    public float a
  + ### b

    public float b
  + ### g

    public float g
  + ### r

    public float r
* Constructor Details
  -------------------

  + ### Color

    public Color()
  + ### Color

    public Color([Color](Color.html "class in zombie.core") color)
  + ### Color

    public Color(float r,
    float g,
    float b)
  + ### Color

    public Color(float r,
    float g,
    float b,
    float a)
  + ### Color

    public Color([Color](Color.html "class in zombie.core") colorA,
    [Color](Color.html "class in zombie.core") colorB,
    float delta)
  + ### Color

    public Color(int r,
    int g,
    int b)
  + ### Color

    public Color(int r,
    int g,
    int b,
    int a)
  + ### Color

    public Color(int value)
* Method Details
  --------------

  + ### getR

    public float getR()
  + ### getG

    public float getG()
  + ### getB

    public float getB()
  + ### setColor

    public void setColor([Color](Color.html "class in zombie.core") colorA,
    [Color](Color.html "class in zombie.core") colorB,
    float delta)
  + ### fromColor

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void fromColor(int valueABGR)

    Deprecated.
  + ### setABGR

    public void setABGR(int valueABGR)
  + ### abgrToColor

    public static [Color](Color.html "class in zombie.core") abgrToColor(int valueABGR,
    [Color](Color.html "class in zombie.core") result)
  + ### colorToABGR

    public static int colorToABGR([Color](Color.html "class in zombie.core") val)
  + ### colorToABGR

    public static int colorToABGR([ColorInfo](textures/ColorInfo.html "class in zombie.core.textures") val)
  + ### colorToABGR

    public static int colorToABGR(float r,
    float g,
    float b,
    float a)
  + ### multiplyABGR

    public static int multiplyABGR(int valueABGR,
    int multiplierABGR)
  + ### multiplyBGR

    public static int multiplyBGR(int valueABGR,
    int multiplierABGR)
  + ### blendBGR

    public static int blendBGR(int valueABGR,
    int targetABGR)
  + ### blendABGR

    public static int blendABGR(int valueABGR,
    int targetABGR)
  + ### tintABGR

    public static int tintABGR(int targetABGR,
    int tintABGR)
  + ### lerpABGR

    public static int lerpABGR(int colA,
    int colB,
    float alpha)
  + ### getAlphaChannelFromABGR

    public static float getAlphaChannelFromABGR(int valueABGR)
  + ### getBlueChannelFromABGR

    public static float getBlueChannelFromABGR(int valueABGR)
  + ### getGreenChannelFromABGR

    public static float getGreenChannelFromABGR(int valueABGR)
  + ### getRedChannelFromABGR

    public static float getRedChannelFromABGR(int valueABGR)
  + ### setAlphaChannelToABGR

    public static int setAlphaChannelToABGR(int valueABGR,
    float a)
  + ### setBlueChannelToABGR

    public static int setBlueChannelToABGR(int valueABGR,
    float b)
  + ### setGreenChannelToABGR

    public static int setGreenChannelToABGR(int valueABGR,
    float g)
  + ### setRedChannelToABGR

    public static int setRedChannelToABGR(int valueABGR,
    float r)
  + ### random

    public static [Color](Color.html "class in zombie.core") random()
  + ### decode

    public static [Color](Color.html "class in zombie.core") decode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nm)
  + ### add

    public void add([Color](Color.html "class in zombie.core") c)
  + ### addToCopy

    public [Color](Color.html "class in zombie.core") addToCopy([Color](Color.html "class in zombie.core") c)
  + ### brighter

    public [Color](Color.html "class in zombie.core") brighter()
  + ### brighter

    public [Color](Color.html "class in zombie.core") brighter(float scale)
  + ### darker

    public [Color](Color.html "class in zombie.core") darker()
  + ### darker

    public [Color](Color.html "class in zombie.core") darker(float scale)
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") other)

    Overrides:
    :   `equals` in class `Object`
  + ### equalBytes

    public boolean equalBytes([Color](Color.html "class in zombie.core") other)
  + ### set

    public [Color](Color.html "class in zombie.core") set([Color](Color.html "class in zombie.core") other)
  + ### set

    public [Color](Color.html "class in zombie.core") set(float r,
    float g,
    float b)
  + ### set

    public [Color](Color.html "class in zombie.core") set(float r,
    float g,
    float b,
    float a)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### getAlpha

    public int getAlpha()
  + ### getAlphaFloat

    public float getAlphaFloat()
  + ### getRedFloat

    public float getRedFloat()
  + ### getGreenFloat

    public float getGreenFloat()
  + ### getBlueFloat

    public float getBlueFloat()
  + ### getAlphaByte

    public int getAlphaByte()
  + ### getBlue

    public int getBlue()
  + ### getBlueByte

    public int getBlueByte()

    get the blue byte component of this colour

    Returns:
    :   The blue component (range 0-255)
  + ### getGreen

    public int getGreen()
  + ### getGreenByte

    public int getGreenByte()
  + ### getRed

    public int getRed()
  + ### getRedByte

    public int getRedByte()
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### multiply

    public [Color](Color.html "class in zombie.core") multiply([Color](Color.html "class in zombie.core") c)
  + ### scale

    public [Color](Color.html "class in zombie.core") scale(float value)
  + ### scaleCopy

    public [Color](Color.html "class in zombie.core") scaleCopy(float value)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### interp

    public void interp([Color](Color.html "class in zombie.core") to,
    float delta,
    [Color](Color.html "class in zombie.core") dest)
  + ### changeHSBValue

    public void changeHSBValue(float hFactor,
    float sFactor,
    float bFactor)
  + ### HSBtoRGB

    public static [Color](Color.html "class in zombie.core") HSBtoRGB(float hue,
    float saturation,
    float brightness,
    [Color](Color.html "class in zombie.core") result)
  + ### HSBtoRGB

    public static [Color](Color.html "class in zombie.core") HSBtoRGB(float hue,
    float saturation,
    float brightness)
  + ### saveCompactNoAlpha

    public void saveCompactNoAlpha([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadCompactNoAlpha

    public void loadCompactNoAlpha([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### saveCompact

    public void saveCompact([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadCompact

    public void loadCompact([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### saveCompact

    private void saveCompact([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean saveAlpha)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadCompact

    private void loadCompact([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    boolean loadAlpha)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`