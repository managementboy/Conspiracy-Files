[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [Temperature](Temperature.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [DO\_DEFAULT\_BASE](#DO_DEFAULT_BASE)
   2. [DO\_DAYLEN\_MOD](#DO_DAYLEN_MOD)
   3. [CELSIUS\_POSTFIX](#CELSIUS_POSTFIX)
   4. [FAHRENHEIT\_POSTFIX](#FAHRENHEIT_POSTFIX)
   5. [skinCelciusMin](#skinCelciusMin)
   6. [skinCelciusFavorable](#skinCelciusFavorable)
   7. [skinCelciusMax](#skinCelciusMax)
   8. [homeostasisDefault](#homeostasisDefault)
   9. [FavorableNakedTemp](#FavorableNakedTemp)
   10. [FavorableRoomTemp](#FavorableRoomTemp)
   11. [coreCelciusMin](#coreCelciusMin)
   12. [coreCelciusMax](#coreCelciusMax)
   13. [neutralZone](#neutralZone)
   14. [Hypothermia\_1](#Hypothermia_1)
   15. [Hypothermia\_2](#Hypothermia_2)
   16. [Hypothermia\_3](#Hypothermia_3)
   17. [Hypothermia\_4](#Hypothermia_4)
   18. [Hyperthermia\_1](#Hyperthermia_1)
   19. [Hyperthermia\_2](#Hyperthermia_2)
   20. [Hyperthermia\_3](#Hyperthermia_3)
   21. [Hyperthermia\_4](#Hyperthermia_4)
   22. [TrueInsulationMultiplier](#TrueInsulationMultiplier)
   23. [TrueWindresistMultiplier](#TrueWindresistMultiplier)
   24. [BodyMinTemp](#BodyMinTemp)
   25. [BodyMaxTemp](#BodyMaxTemp)
   26. [cacheTempString](#cacheTempString)
   27. [cacheTemp](#cacheTemp)
   28. [tempColor](#tempColor)
   29. [col\_0](#col_0)
   30. [col\_25](#col_25)
   31. [col\_50](#col_50)
   32. [col\_75](#col_75)
   33. [col\_100](#col_100)
6. [Constructor Details](#constructor-detail)
   1. [Temperature()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getCelsiusPostfix()](#getCelsiusPostfix())
   2. [getFahrenheitPostfix()](#getFahrenheitPostfix())
   3. [getTemperaturePostfix()](#getTemperaturePostfix())
   4. [getTemperatureString(float)](#getTemperatureString(float))
   5. [getRoundedDisplayTemperature(float)](#getRoundedDisplayTemperature(float))
   6. [CelsiusToFahrenheit(float)](#CelsiusToFahrenheit(float))
   7. [FahrenheitToCelsius(float)](#FahrenheitToCelsius(float))
   8. [WindchillCelsiusKph(float, float)](#WindchillCelsiusKph(float,float))
   9. [getTrueInsulationValue(float)](#getTrueInsulationValue(float))
   10. [getTrueWindresistanceValue(float)](#getTrueWindresistanceValue(float))
   11. [reset()](#reset())
   12. [getFractionForRealTimeRatePerMin(float)](#getFractionForRealTimeRatePerMin(float))
   13. [getValueColor(float)](#getValueColor(float))
   14. [getWindChillAmountForPlayer(IsoPlayer)](#getWindChillAmountForPlayer(zombie.characters.IsoPlayer))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Temperature
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.Temperature

---

public class Temperature
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final float`

  `BodyMaxTemp`

  `static final float`

  `BodyMinTemp`

  `private static float`

  `cacheTemp`

  `private static String`

  `cacheTempString`

  `static final String`

  `CELSIUS_POSTFIX`

  `private static final Color`

  `col_0`

  `private static final Color`

  `col_100`

  `private static final Color`

  `col_25`

  `private static final Color`

  `col_50`

  `private static final Color`

  `col_75`

  `static final float`

  `coreCelciusMax`

  `static final float`

  `coreCelciusMin`

  `static final boolean`

  `DO_DAYLEN_MOD`

  `static final boolean`

  `DO_DEFAULT_BASE`

  `static final String`

  `FAHRENHEIT_POSTFIX`

  `static final float`

  `FavorableNakedTemp`

  `static final float`

  `FavorableRoomTemp`

  `static final float`

  `homeostasisDefault`

  `static final float`

  `Hyperthermia_1`

  `static final float`

  `Hyperthermia_2`

  `static final float`

  `Hyperthermia_3`

  `static final float`

  `Hyperthermia_4`

  `static final float`

  `Hypothermia_1`

  `static final float`

  `Hypothermia_2`

  `static final float`

  `Hypothermia_3`

  `static final float`

  `Hypothermia_4`

  `static final float`

  `neutralZone`

  `static final float`

  `skinCelciusFavorable`

  `static final float`

  `skinCelciusMax`

  `static final float`

  `skinCelciusMin`

  `private static final Color`

  `tempColor`

  `static final float`

  `TrueInsulationMultiplier`

  `static final float`

  `TrueWindresistMultiplier`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Temperature()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static float`

  `CelsiusToFahrenheit(float celsius)`

  `static float`

  `FahrenheitToCelsius(float fahrenheit)`

  `static String`

  `getCelsiusPostfix()`

  `static String`

  `getFahrenheitPostfix()`

  `static float`

  `getFractionForRealTimeRatePerMin(float rate)`

  `static int`

  `getRoundedDisplayTemperature(float celsius)`

  `static String`

  `getTemperaturePostfix()`

  `static String`

  `getTemperatureString(float celsius)`

  `static float`

  `getTrueInsulationValue(float insulation)`

  `static float`

  `getTrueWindresistanceValue(float windresist)`

  `static Color`

  `getValueColor(float val)`

  `static float`

  `getWindChillAmountForPlayer(IsoPlayer player)`

  `static void`

  `reset()`

  `static float`

  `WindchillCelsiusKph(float t,
  float v)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DO\_DEFAULT\_BASE

    public static final boolean DO\_DEFAULT\_BASE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.DO_DEFAULT_BASE)
  + ### DO\_DAYLEN\_MOD

    public static final boolean DO\_DAYLEN\_MOD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.DO_DAYLEN_MOD)
  + ### CELSIUS\_POSTFIX

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") CELSIUS\_POSTFIX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.CELSIUS_POSTFIX)
  + ### FAHRENHEIT\_POSTFIX

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FAHRENHEIT\_POSTFIX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.FAHRENHEIT_POSTFIX)
  + ### skinCelciusMin

    public static final float skinCelciusMin

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.skinCelciusMin)
  + ### skinCelciusFavorable

    public static final float skinCelciusFavorable

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.skinCelciusFavorable)
  + ### skinCelciusMax

    public static final float skinCelciusMax

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.skinCelciusMax)
  + ### homeostasisDefault

    public static final float homeostasisDefault

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.homeostasisDefault)
  + ### FavorableNakedTemp

    public static final float FavorableNakedTemp

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.FavorableNakedTemp)
  + ### FavorableRoomTemp

    public static final float FavorableRoomTemp

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.FavorableRoomTemp)
  + ### coreCelciusMin

    public static final float coreCelciusMin

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.coreCelciusMin)
  + ### coreCelciusMax

    public static final float coreCelciusMax

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.coreCelciusMax)
  + ### neutralZone

    public static final float neutralZone

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.neutralZone)
  + ### Hypothermia\_1

    public static final float Hypothermia\_1

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.Hypothermia_1)
  + ### Hypothermia\_2

    public static final float Hypothermia\_2

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.Hypothermia_2)
  + ### Hypothermia\_3

    public static final float Hypothermia\_3

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.Hypothermia_3)
  + ### Hypothermia\_4

    public static final float Hypothermia\_4

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.Hypothermia_4)
  + ### Hyperthermia\_1

    public static final float Hyperthermia\_1

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.Hyperthermia_1)
  + ### Hyperthermia\_2

    public static final float Hyperthermia\_2

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.Hyperthermia_2)
  + ### Hyperthermia\_3

    public static final float Hyperthermia\_3

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.Hyperthermia_3)
  + ### Hyperthermia\_4

    public static final float Hyperthermia\_4

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.Hyperthermia_4)
  + ### TrueInsulationMultiplier

    public static final float TrueInsulationMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.TrueInsulationMultiplier)
  + ### TrueWindresistMultiplier

    public static final float TrueWindresistMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.TrueWindresistMultiplier)
  + ### BodyMinTemp

    public static final float BodyMinTemp

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.BodyMinTemp)
  + ### BodyMaxTemp

    public static final float BodyMaxTemp

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.weather.Temperature.BodyMaxTemp)
  + ### cacheTempString

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cacheTempString
  + ### cacheTemp

    private static float cacheTemp
  + ### tempColor

    private static final [Color](../../core/Color.html "class in zombie.core") tempColor
  + ### col\_0

    private static final [Color](../../core/Color.html "class in zombie.core") col\_0
  + ### col\_25

    private static final [Color](../../core/Color.html "class in zombie.core") col\_25
  + ### col\_50

    private static final [Color](../../core/Color.html "class in zombie.core") col\_50
  + ### col\_75

    private static final [Color](../../core/Color.html "class in zombie.core") col\_75
  + ### col\_100

    private static final [Color](../../core/Color.html "class in zombie.core") col\_100
* Constructor Details
  -------------------

  + ### Temperature

    public Temperature()
* Method Details
  --------------

  + ### getCelsiusPostfix

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCelsiusPostfix()
  + ### getFahrenheitPostfix

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFahrenheitPostfix()
  + ### getTemperaturePostfix

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTemperaturePostfix()
  + ### getTemperatureString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTemperatureString(float celsius)
  + ### getRoundedDisplayTemperature

    public static int getRoundedDisplayTemperature(float celsius)
  + ### CelsiusToFahrenheit

    public static float CelsiusToFahrenheit(float celsius)
  + ### FahrenheitToCelsius

    public static float FahrenheitToCelsius(float fahrenheit)
  + ### WindchillCelsiusKph

    public static float WindchillCelsiusKph(float t,
    float v)
  + ### getTrueInsulationValue

    public static float getTrueInsulationValue(float insulation)
  + ### getTrueWindresistanceValue

    public static float getTrueWindresistanceValue(float windresist)
  + ### reset

    public static void reset()
  + ### getFractionForRealTimeRatePerMin

    public static float getFractionForRealTimeRatePerMin(float rate)
  + ### getValueColor

    public static [Color](../../core/Color.html "class in zombie.core") getValueColor(float val)
  + ### getWindChillAmountForPlayer

    public static float getWindChillAmountForPlayer([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player)