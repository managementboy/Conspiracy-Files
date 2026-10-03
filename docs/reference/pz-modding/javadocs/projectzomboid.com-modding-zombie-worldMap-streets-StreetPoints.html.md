[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.worldMap.streets](package-summary.html)
2. [StreetPoints](StreetPoints.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [minX](#minX)
   2. [minY](#minY)
   3. [maxX](#maxX)
   4. [maxY](#maxY)
6. [Constructor Details](#constructor-detail)
   1. [StreetPoints()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [numPoints()](#numPoints())
   2. [add(float, float)](#add(float,float))
   3. [getX(int)](#getX(int))
   4. [getY(int)](#getY(int))
   5. [getMinX()](#getMinX())
   6. [getMinY()](#getMinY())
   7. [getMaxX()](#getMaxX())
   8. [getMaxY()](#getMaxY())
   9. [invalidateBounds()](#invalidateBounds())
   10. [calculateBoundIfNeeded()](#calculateBoundIfNeeded())
   11. [calculateBounds()](#calculateBounds())
   12. [isClockwise()](#isClockwise())
   13. [setReverse(StreetPoints)](#setReverse(zombie.worldMap.streets.StreetPoints))
   14. [calculateLength(UIWorldMap)](#calculateLength(zombie.worldMap.UIWorldMap))
   15. [calculateLength()](#calculateLength())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class StreetPoints
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

gnu.trove.list.array.TFloatArrayList

zombie.worldMap.streets.StreetPoints

All Implemented Interfaces:
:   `gnu.trove.list.TFloatList, gnu.trove.TFloatCollection, Externalizable, Serializable`

---

public final class StreetPoints
extends gnu.trove.list.array.TFloatArrayList

See Also:
:   * [Serialized Form](../../../serialized-form.html#zombie.worldMap.streets.StreetPoints)

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `maxX`

  `(package private) float`

  `maxY`

  `(package private) float`

  `minX`

  `(package private) float`

  `minY`

  ### Fields inherited from class gnu.trove.list.array.TFloatArrayList

  `_data, _pos, DEFAULT_CAPACITY, no_entry_value`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `StreetPoints()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(float x,
  float y)`

  `void`

  `calculateBoundIfNeeded()`

  `void`

  `calculateBounds()`

  `float`

  `calculateLength()`

  `float`

  `calculateLength(zombie.worldMap.UIWorldMap ui)`

  `float`

  `getMaxX()`

  `float`

  `getMaxY()`

  `float`

  `getMinX()`

  `float`

  `getMinY()`

  `float`

  `getX(int index)`

  `float`

  `getY(int index)`

  `void`

  `invalidateBounds()`

  `boolean`

  `isClockwise()`

  `int`

  `numPoints()`

  `void`

  `setReverse(StreetPoints dest)`

  ### Methods inherited from class gnu.trove.list.array.TFloatArrayList

  `add, add, add, addAll, addAll, addAll, binarySearch, binarySearch, clear, clear, contains, containsAll, containsAll, containsAll, ensureCapacity, equals, fill, fill, forEach, forEachDescending, get, getNoEntryValue, getQuick, grep, hashCode, indexOf, indexOf, insert, insert, insert, inverseGrep, isEmpty, iterator, lastIndexOf, lastIndexOf, max, min, readExternal, remove, remove, removeAll, removeAll, removeAll, removeAt, replace, reset, resetQuick, retainAll, retainAll, retainAll, reverse, reverse, set, set, set, setQuick, shuffle, size, sort, sort, subList, sum, toArray, toArray, toArray, toArray, toArray, toString, transformValues, trimToSize, wrap, wrap, writeExternal`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### minX

    float minX
  + ### minY

    float minY
  + ### maxX

    float maxX
  + ### maxY

    float maxY
* Constructor Details
  -------------------

  + ### StreetPoints

    public StreetPoints()
* Method Details
  --------------

  + ### numPoints

    public int numPoints()
  + ### add

    public void add(float x,
    float y)
  + ### getX

    public float getX(int index)
  + ### getY

    public float getY(int index)
  + ### getMinX

    public float getMinX()
  + ### getMinY

    public float getMinY()
  + ### getMaxX

    public float getMaxX()
  + ### getMaxY

    public float getMaxY()
  + ### invalidateBounds

    public void invalidateBounds()
  + ### calculateBoundIfNeeded

    public void calculateBoundIfNeeded()
  + ### calculateBounds

    public void calculateBounds()
  + ### isClockwise

    public boolean isClockwise()
  + ### setReverse

    public void setReverse([StreetPoints](StreetPoints.html "class in zombie.worldMap.streets") dest)
  + ### calculateLength

    public float calculateLength(zombie.worldMap.UIWorldMap ui)
  + ### calculateLength

    public float calculateLength()