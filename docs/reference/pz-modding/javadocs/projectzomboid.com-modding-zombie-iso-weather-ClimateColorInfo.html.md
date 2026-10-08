[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateColorInfo](ClimateColorInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [interior](#interior)
   2. [exterior](#exterior)
   3. [writer](#writer)
6. [Constructor Details](#constructor-detail)
   1. [ClimateColorInfo()](#%3Cinit%3E())
   2. [ClimateColorInfo(float, float, float, float)](#%3Cinit%3E(float,float,float,float))
   3. [ClimateColorInfo(float, float, float, float, float, float, float, float)](#%3Cinit%3E(float,float,float,float,float,float,float,float))
7. [Method Details](#method-detail)
   1. [setInterior(Color)](#setInterior(zombie.core.Color))
   2. [setInterior(float, float, float, float)](#setInterior(float,float,float,float))
   3. [getInterior()](#getInterior())
   4. [setExterior(Color)](#setExterior(zombie.core.Color))
   5. [setExterior(float, float, float, float)](#setExterior(float,float,float,float))
   6. [getExterior()](#getExterior())
   7. [setTo(ClimateColorInfo)](#setTo(zombie.iso.weather.ClimateColorInfo))
   8. [interp(ClimateColorInfo, float, ClimateColorInfo)](#interp(zombie.iso.weather.ClimateColorInfo,float,zombie.iso.weather.ClimateColorInfo))
   9. [scale(float)](#scale(float))
   10. [interp(ClimateColorInfo, ClimateColorInfo, float, ClimateColorInfo)](#interp(zombie.iso.weather.ClimateColorInfo,zombie.iso.weather.ClimateColorInfo,float,zombie.iso.weather.ClimateColorInfo))
   11. [write(ByteBufferWriter)](#write(zombie.core.network.ByteBufferWriter))
   12. [read(ByteBufferReader)](#read(zombie.core.network.ByteBufferReader))
   13. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   14. [load(DataInputStream, int)](#load(java.io.DataInputStream,int))
   15. [writeColorInfoConfig()](#writeColorInfoConfig())
   16. [writeSeasonColor(int, ClimateColorInfo, String, String, String)](#writeSeasonColor(int,zombie.iso.weather.ClimateColorInfo,java.lang.String,java.lang.String,java.lang.String))
   17. [writeColor(int, ClimateColorInfo)](#writeColor(int,zombie.iso.weather.ClimateColorInfo))
   18. [write(int, String)](#write(int,java.lang.String))
   19. [write(String)](#write(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateColorInfo
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateColorInfo

---

public class ClimateColorInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

A pair of colors for global light interior and exterior, the alpha of the colors is blend intensity.
When outside the shader is used to apply global light, when inside a room its using a different method (using the weather mask) to do the coloring of outside parts.
This requires separate balancing of colors as using one and the same for both methods doesn't always look right.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Color`

  `exterior`

  `private final Color`

  `interior`

  `private static BufferedWriter`

  `writer`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClimateColorInfo()`

  `ClimateColorInfo(float r,
  float g,
  float b,
  float a)`

  `ClimateColorInfo(float r,
  float g,
  float b,
  float a,
  float r2,
  float g2,
  float b2,
  float a2)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Color`

  `getExterior()`

  `Color`

  `getInterior()`

  `ClimateColorInfo`

  `interp(ClimateColorInfo to,
  float t,
  ClimateColorInfo result)`

  `static ClimateColorInfo`

  `interp(ClimateColorInfo source,
  ClimateColorInfo target,
  float t,
  ClimateColorInfo resultColorInfo)`

  `void`

  `load(DataInputStream input,
  int worldVersion)`

  `void`

  `read(zombie.core.network.ByteBufferReader input)`

  `void`

  `save(DataOutputStream output)`

  `void`

  `scale(float val)`

  `void`

  `setExterior(float r,
  float g,
  float b,
  float a)`

  `void`

  `setExterior(Color other)`

  `void`

  `setInterior(float r,
  float g,
  float b,
  float a)`

  `void`

  `setInterior(Color other)`

  `void`

  `setTo(ClimateColorInfo other)`

  `private static void`

  `write(int tabsTimes,
  String s)`

  `private static void`

  `write(String s)`

  `void`

  `write(zombie.core.network.ByteBufferWriter output)`

  `private static void`

  `writeColor(int tabs,
  ClimateColorInfo ci)`

  `static boolean`

  `writeColorInfoConfig()`

  `private static void`

  `writeSeasonColor(int tabs,
  ClimateColorInfo ci,
  String seg,
  String seas,
  String temp)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### interior

    private final [Color](../../core/Color.html "class in zombie.core") interior
  + ### exterior

    private final [Color](../../core/Color.html "class in zombie.core") exterior
  + ### writer

    private static [BufferedWriter](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/BufferedWriter.html "class or interface in java.io") writer
* Constructor Details
  -------------------

  + ### ClimateColorInfo

    public ClimateColorInfo()
  + ### ClimateColorInfo

    public ClimateColorInfo(float r,
    float g,
    float b,
    float a)
  + ### ClimateColorInfo

    public ClimateColorInfo(float r,
    float g,
    float b,
    float a,
    float r2,
    float g2,
    float b2,
    float a2)
* Method Details
  --------------

  + ### setInterior

    public void setInterior([Color](../../core/Color.html "class in zombie.core") other)
  + ### setInterior

    public void setInterior(float r,
    float g,
    float b,
    float a)
  + ### getInterior

    public [Color](../../core/Color.html "class in zombie.core") getInterior()
  + ### setExterior

    public void setExterior([Color](../../core/Color.html "class in zombie.core") other)
  + ### setExterior

    public void setExterior(float r,
    float g,
    float b,
    float a)
  + ### getExterior

    public [Color](../../core/Color.html "class in zombie.core") getExterior()
  + ### setTo

    public void setTo([ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") other)
  + ### interp

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") interp([ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") to,
    float t,
    [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") result)
  + ### scale

    public void scale(float val)
  + ### interp

    public static [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") interp([ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") source,
    [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") target,
    float t,
    [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") resultColorInfo)
  + ### write

    public void write(zombie.core.network.ByteBufferWriter output)
  + ### read

    public void read(zombie.core.network.ByteBufferReader input)
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### writeColorInfoConfig

    public static boolean writeColorInfoConfig()
  + ### writeSeasonColor

    private static void writeSeasonColor(int tabs,
    [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") ci,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") seg,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") seas,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") temp)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### writeColor

    private static void writeColor(int tabs,
    [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") ci)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### write

    private static void write(int tabsTimes,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### write

    private static void write([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`