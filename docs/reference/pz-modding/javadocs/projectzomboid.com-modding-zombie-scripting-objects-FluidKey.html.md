[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [FluidKey](FluidKey.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [ACID](#ACID)
   3. [RUBBING\_ALCOHOL](#RUBBING_ALCOHOL)
   4. [ANIMAL\_BLOOD](#ANIMAL_BLOOD)
   5. [ANIMAL\_GREASE](#ANIMAL_GREASE)
   6. [ANIMAL\_MILK](#ANIMAL_MILK)
   7. [BEER](#BEER)
   8. [BLEACH](#BLEACH)
   9. [BLOOD](#BLOOD)
   10. [BRANDY](#BRANDY)
   11. [CARBONATED\_WATER](#CARBONATED_WATER)
   12. [CHAMPAGNE](#CHAMPAGNE)
   13. [CIDER](#CIDER)
   14. [CLEANING\_LIQUID](#CLEANING_LIQUID)
   15. [COFFEE](#COFFEE)
   16. [COFFEE\_LIQUEUR](#COFFEE_LIQUEUR)
   17. [COLA](#COLA)
   18. [COLA\_DIET](#COLA_DIET)
   19. [COLOGNE](#COLOGNE)
   20. [COW\_MILK](#COW_MILK)
   21. [CURACAO](#CURACAO)
   22. [DYE](#DYE)
   23. [GIN](#GIN)
   24. [GINGER\_ALE](#GINGER_ALE)
   25. [GRENADINE](#GRENADINE)
   26. [HAIR\_DYE](#HAIR_DYE)
   27. [HONEY](#HONEY)
   28. [JUICE\_APPLE](#JUICE_APPLE)
   29. [JUICE\_CRANBERRY](#JUICE_CRANBERRY)
   30. [JUICE\_FRUITPUNCH](#JUICE_FRUITPUNCH)
   31. [JUICE\_GRAPE](#JUICE_GRAPE)
   32. [JUICE\_LEMON](#JUICE_LEMON)
   33. [JUICE\_ORANGE](#JUICE_ORANGE)
   34. [JUICE\_TOMATO](#JUICE_TOMATO)
   35. [MEAD](#MEAD)
   36. [MILK\_CHOCOLATE](#MILK_CHOCOLATE)
   37. [PERFUME](#PERFUME)
   38. [PETROL](#PETROL)
   39. [POISON\_POTENT](#POISON_POTENT)
   40. [PORT](#PORT)
   41. [RUM](#RUM)
   42. [SCOTCH](#SCOTCH)
   43. [SECRET\_FLAVORING](#SECRET_FLAVORING)
   44. [SHEEP\_MILK](#SHEEP_MILK)
   45. [SHERRY](#SHERRY)
   46. [SIMPLE\_SYRUP](#SIMPLE_SYRUP)
   47. [SODA\_BLUEBERRY](#SODA_BLUEBERRY)
   48. [SODA\_BUBBLEGUM](#SODA_BUBBLEGUM)
   49. [SODA\_GRAPE](#SODA_GRAPE)
   50. [SODA\_LIME](#SODA_LIME)
   51. [SODA\_PINEAPPLE](#SODA_PINEAPPLE)
   52. [SODA\_POP](#SODA_POP)
   53. [SODA\_STREWBERRY](#SODA_STREWBERRY)
   54. [SPIFFO\_JUICE](#SPIFFO_JUICE)
   55. [TAINTED\_WATER](#TAINTED_WATER)
   56. [TEA](#TEA)
   57. [TEQUILA](#TEQUILA)
   58. [VERMOUTH](#VERMOUTH)
   59. [VODKA](#VODKA)
   60. [WATER](#WATER)
   61. [WHISKEY](#WHISKEY)
   62. [WINE](#WINE)
6. [Constructor Details](#constructor-detail)
   1. [FluidKey(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [hashCode()](#hashCode())
   3. [equals(Object)](#equals(java.lang.Object))
   4. [id()](#id())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Record Class FluidKey
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

zombie.scripting.objects.FluidKey

---

public record FluidKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
extends [Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final FluidKey`

  `ACID`

  `static final FluidKey`

  `ANIMAL_BLOOD`

  `static final FluidKey`

  `ANIMAL_GREASE`

  `static final FluidKey`

  `ANIMAL_MILK`

  `static final FluidKey`

  `BEER`

  `static final FluidKey`

  `BLEACH`

  `static final FluidKey`

  `BLOOD`

  `static final FluidKey`

  `BRANDY`

  `static final FluidKey`

  `CARBONATED_WATER`

  `static final FluidKey`

  `CHAMPAGNE`

  `static final FluidKey`

  `CIDER`

  `static final FluidKey`

  `CLEANING_LIQUID`

  `static final FluidKey`

  `COFFEE`

  `static final FluidKey`

  `COFFEE_LIQUEUR`

  `static final FluidKey`

  `COLA`

  `static final FluidKey`

  `COLA_DIET`

  `static final FluidKey`

  `COLOGNE`

  `static final FluidKey`

  `COW_MILK`

  `static final FluidKey`

  `CURACAO`

  `static final FluidKey`

  `DYE`

  `static final FluidKey`

  `GIN`

  `static final FluidKey`

  `GINGER_ALE`

  `static final FluidKey`

  `GRENADINE`

  `static final FluidKey`

  `HAIR_DYE`

  `static final FluidKey`

  `HONEY`

  `private final String`

  `id`

  The field for the `id` record component.

  `static final FluidKey`

  `JUICE_APPLE`

  `static final FluidKey`

  `JUICE_CRANBERRY`

  `static final FluidKey`

  `JUICE_FRUITPUNCH`

  `static final FluidKey`

  `JUICE_GRAPE`

  `static final FluidKey`

  `JUICE_LEMON`

  `static final FluidKey`

  `JUICE_ORANGE`

  `static final FluidKey`

  `JUICE_TOMATO`

  `static final FluidKey`

  `MEAD`

  `static final FluidKey`

  `MILK_CHOCOLATE`

  `static final FluidKey`

  `PERFUME`

  `static final FluidKey`

  `PETROL`

  `static final FluidKey`

  `POISON_POTENT`

  `static final FluidKey`

  `PORT`

  `static final FluidKey`

  `RUBBING_ALCOHOL`

  `static final FluidKey`

  `RUM`

  `static final FluidKey`

  `SCOTCH`

  `static final FluidKey`

  `SECRET_FLAVORING`

  `static final FluidKey`

  `SHEEP_MILK`

  `static final FluidKey`

  `SHERRY`

  `static final FluidKey`

  `SIMPLE_SYRUP`

  `static final FluidKey`

  `SODA_BLUEBERRY`

  `static final FluidKey`

  `SODA_BUBBLEGUM`

  `static final FluidKey`

  `SODA_GRAPE`

  `static final FluidKey`

  `SODA_LIME`

  `static final FluidKey`

  `SODA_PINEAPPLE`

  `static final FluidKey`

  `SODA_POP`

  `static final FluidKey`

  `SODA_STREWBERRY`

  `static final FluidKey`

  `SPIFFO_JUICE`

  `static final FluidKey`

  `TAINTED_WATER`

  `static final FluidKey`

  `TEA`

  `static final FluidKey`

  `TEQUILA`

  `static final FluidKey`

  `VERMOUTH`

  `static final FluidKey`

  `VODKA`

  `static final FluidKey`

  `WATER`

  `static final FluidKey`

  `WHISKEY`

  `static final FluidKey`

  `WINE`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FluidKey(String id)`

  Creates an instance of a `FluidKey` record class.
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `final boolean`

  `equals(Object o)`

  Indicates whether some other object is "equal to" this one.

  `final int`

  `hashCode()`

  Returns a hash code value for this object.

  `String`

  `id()`

  Returns the value of the `id` record component.

  `String`

  `toString()`

  Returns a string representation of this record class.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id

    The field for the `id` record component.
  + ### ACID

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") ACID
  + ### RUBBING\_ALCOHOL

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") RUBBING\_ALCOHOL
  + ### ANIMAL\_BLOOD

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") ANIMAL\_BLOOD
  + ### ANIMAL\_GREASE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") ANIMAL\_GREASE
  + ### ANIMAL\_MILK

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") ANIMAL\_MILK
  + ### BEER

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") BEER
  + ### BLEACH

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") BLEACH
  + ### BLOOD

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") BLOOD
  + ### BRANDY

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") BRANDY
  + ### CARBONATED\_WATER

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") CARBONATED\_WATER
  + ### CHAMPAGNE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") CHAMPAGNE
  + ### CIDER

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") CIDER
  + ### CLEANING\_LIQUID

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") CLEANING\_LIQUID
  + ### COFFEE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") COFFEE
  + ### COFFEE\_LIQUEUR

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") COFFEE\_LIQUEUR
  + ### COLA

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") COLA
  + ### COLA\_DIET

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") COLA\_DIET
  + ### COLOGNE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") COLOGNE
  + ### COW\_MILK

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") COW\_MILK
  + ### CURACAO

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") CURACAO
  + ### DYE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") DYE
  + ### GIN

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") GIN
  + ### GINGER\_ALE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") GINGER\_ALE
  + ### GRENADINE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") GRENADINE
  + ### HAIR\_DYE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") HAIR\_DYE
  + ### HONEY

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") HONEY
  + ### JUICE\_APPLE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") JUICE\_APPLE
  + ### JUICE\_CRANBERRY

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") JUICE\_CRANBERRY
  + ### JUICE\_FRUITPUNCH

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") JUICE\_FRUITPUNCH
  + ### JUICE\_GRAPE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") JUICE\_GRAPE
  + ### JUICE\_LEMON

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") JUICE\_LEMON
  + ### JUICE\_ORANGE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") JUICE\_ORANGE
  + ### JUICE\_TOMATO

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") JUICE\_TOMATO
  + ### MEAD

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") MEAD
  + ### MILK\_CHOCOLATE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") MILK\_CHOCOLATE
  + ### PERFUME

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") PERFUME
  + ### PETROL

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") PETROL
  + ### POISON\_POTENT

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") POISON\_POTENT
  + ### PORT

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") PORT
  + ### RUM

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") RUM
  + ### SCOTCH

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SCOTCH
  + ### SECRET\_FLAVORING

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SECRET\_FLAVORING
  + ### SHEEP\_MILK

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SHEEP\_MILK
  + ### SHERRY

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SHERRY
  + ### SIMPLE\_SYRUP

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SIMPLE\_SYRUP
  + ### SODA\_BLUEBERRY

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SODA\_BLUEBERRY
  + ### SODA\_BUBBLEGUM

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SODA\_BUBBLEGUM
  + ### SODA\_GRAPE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SODA\_GRAPE
  + ### SODA\_LIME

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SODA\_LIME
  + ### SODA\_PINEAPPLE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SODA\_PINEAPPLE
  + ### SODA\_POP

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SODA\_POP
  + ### SODA\_STREWBERRY

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SODA\_STREWBERRY
  + ### SPIFFO\_JUICE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") SPIFFO\_JUICE
  + ### TAINTED\_WATER

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") TAINTED\_WATER
  + ### TEA

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") TEA
  + ### TEQUILA

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") TEQUILA
  + ### VERMOUTH

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") VERMOUTH
  + ### VODKA

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") VODKA
  + ### WATER

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") WATER
  + ### WHISKEY

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") WHISKEY
  + ### WINE

    public static final [FluidKey](FluidKey.html "class in zombie.scripting.objects") WINE
* Constructor Details
  -------------------

  + ### FluidKey

    public FluidKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)

    Creates an instance of a `FluidKey` record class.

    Parameters:
    :   `id` - the value for the `id` record component
* Method Details
  --------------

  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Returns a string representation of this record class. The representation contains the name of the class, followed by the name and value of each of the record components.

    Specified by:
    :   `toString` in class `Record`

    Returns:
    :   a string representation of this object
  + ### hashCode

    public final int hashCode()

    Returns a hash code value for this object. The value is derived from the hash code of each of the record components.

    Specified by:
    :   `hashCode` in class `Record`

    Returns:
    :   a hash code value for this object
  + ### equals

    public final boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Indicates whether some other object is "equal to" this one. The objects are equal if the other object is of the same class and if all the record components are equal. All components in this record class are compared with [`Objects::equals(Object,Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Objects.html#equals(java.lang.Object,java.lang.Object) "class or interface in java.util").

    Specified by:
    :   `equals` in class `Record`

    Parameters:
    :   `o` - the object with which to compare

    Returns:
    :   `true` if this object is the same as the `o` argument; `false` otherwise.
  + ### id

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id()

    Returns the value of the `id` record component.

    Returns:
    :   the value of the `id` record component