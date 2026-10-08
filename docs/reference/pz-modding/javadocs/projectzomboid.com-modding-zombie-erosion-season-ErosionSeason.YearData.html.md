[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.erosion.season](package-summary.html)
2. [ErosionSeason](ErosionSeason.html)
3. [YearData](ErosionSeason.YearData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [year](#year)
   2. [winSols](#winSols)
   3. [sumSols](#sumSols)
   4. [winSolsUnx](#winSolsUnx)
   5. [sumSolsUnx](#sumSolsUnx)
   6. [hottestDay](#hottestDay)
   7. [coldestDay](#coldestDay)
   8. [hottestDayUnx](#hottestDayUnx)
   9. [coldestDayUnx](#coldestDayUnx)
   10. [winterS](#winterS)
   11. [winterE](#winterE)
   12. [winterStartDay](#winterStartDay)
   13. [winterEndDay](#winterEndDay)
   14. [winterStartDayUnx](#winterStartDayUnx)
   15. [winterEndDayUnx](#winterEndDayUnx)
   16. [summerS](#summerS)
   17. [summerE](#summerE)
   18. [summerStartDay](#summerStartDay)
   19. [summerEndDay](#summerEndDay)
   20. [summerStartDayUnx](#summerStartDayUnx)
   21. [summerEndDayUnx](#summerEndDayUnx)
   22. [lastSummerStr](#lastSummerStr)
   23. [lastWinterStr](#lastWinterStr)
   24. [summerStr](#summerStr)
   25. [winterStr](#winterStr)
   26. [nextSummerStr](#nextSummerStr)
   27. [nextWinterStr](#nextWinterStr)
6. [Constructor Details](#constructor-detail)
   1. [YearData()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ErosionSeason.YearData
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.erosion.season.ErosionSeason.YearData

Enclosing class:
:   `ErosionSeason`

---

private static class ErosionSeason.YearData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `GregorianCalendar`

  `coldestDay`

  `long`

  `coldestDayUnx`

  `GregorianCalendar`

  `hottestDay`

  `long`

  `hottestDayUnx`

  `float`

  `lastSummerStr`

  `float`

  `lastWinterStr`

  `float`

  `nextSummerStr`

  `float`

  `nextWinterStr`

  `float`

  `summerE`

  `GregorianCalendar`

  `summerEndDay`

  `long`

  `summerEndDayUnx`

  `float`

  `summerS`

  `GregorianCalendar`

  `summerStartDay`

  `long`

  `summerStartDayUnx`

  `float`

  `summerStr`

  `GregorianCalendar`

  `sumSols`

  `long`

  `sumSolsUnx`

  `GregorianCalendar`

  `winSols`

  `long`

  `winSolsUnx`

  `float`

  `winterE`

  `GregorianCalendar`

  `winterEndDay`

  `long`

  `winterEndDayUnx`

  `float`

  `winterS`

  `GregorianCalendar`

  `winterStartDay`

  `long`

  `winterStartDayUnx`

  `float`

  `winterStr`

  `int`

  `year`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `YearData()`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### year

    public int year
  + ### winSols

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") winSols
  + ### sumSols

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") sumSols
  + ### winSolsUnx

    public long winSolsUnx
  + ### sumSolsUnx

    public long sumSolsUnx
  + ### hottestDay

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") hottestDay
  + ### coldestDay

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") coldestDay
  + ### hottestDayUnx

    public long hottestDayUnx
  + ### coldestDayUnx

    public long coldestDayUnx
  + ### winterS

    public float winterS
  + ### winterE

    public float winterE
  + ### winterStartDay

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") winterStartDay
  + ### winterEndDay

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") winterEndDay
  + ### winterStartDayUnx

    public long winterStartDayUnx
  + ### winterEndDayUnx

    public long winterEndDayUnx
  + ### summerS

    public float summerS
  + ### summerE

    public float summerE
  + ### summerStartDay

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") summerStartDay
  + ### summerEndDay

    public [GregorianCalendar](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/GregorianCalendar.html "class or interface in java.util") summerEndDay
  + ### summerStartDayUnx

    public long summerStartDayUnx
  + ### summerEndDayUnx

    public long summerEndDayUnx
  + ### lastSummerStr

    public float lastSummerStr
  + ### lastWinterStr

    public float lastWinterStr
  + ### summerStr

    public float summerStr
  + ### winterStr

    public float winterStr
  + ### nextSummerStr

    public float nextSummerStr
  + ### nextWinterStr

    public float nextWinterStr
* Constructor Details
  -------------------

  + ### YearData

    private YearData()