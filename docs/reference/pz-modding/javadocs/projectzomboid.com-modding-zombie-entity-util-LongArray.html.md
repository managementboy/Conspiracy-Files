[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.util](package-summary.html)
2. [LongArray](LongArray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [items](#items)
   2. [size](#size)
   3. [ordered](#ordered)
6. [Constructor Details](#constructor-detail)
   1. [LongArray()](#%3Cinit%3E())
   2. [LongArray(int)](#%3Cinit%3E(int))
   3. [LongArray(boolean, int)](#%3Cinit%3E(boolean,int))
   4. [LongArray(LongArray)](#%3Cinit%3E(zombie.entity.util.LongArray))
   5. [LongArray(long[])](#%3Cinit%3E(long%5B%5D))
   6. [LongArray(boolean, long[], int, int)](#%3Cinit%3E(boolean,long%5B%5D,int,int))
7. [Method Details](#method-detail)
   1. [add(long)](#add(long))
   2. [add(long, long)](#add(long,long))
   3. [add(long, long, long)](#add(long,long,long))
   4. [add(long, long, long, long)](#add(long,long,long,long))
   5. [addAll(LongArray)](#addAll(zombie.entity.util.LongArray))
   6. [addAll(LongArray, int, int)](#addAll(zombie.entity.util.LongArray,int,int))
   7. [addAll(long...)](#addAll(long...))
   8. [addAll(long[], int, int)](#addAll(long%5B%5D,int,int))
   9. [get(int)](#get(int))
   10. [set(int, long)](#set(int,long))
   11. [incr(int, long)](#incr(int,long))
   12. [incr(long)](#incr(long))
   13. [mul(int, long)](#mul(int,long))
   14. [mul(long)](#mul(long))
   15. [insert(int, long)](#insert(int,long))
   16. [insertRange(int, int)](#insertRange(int,int))
   17. [swap(int, int)](#swap(int,int))
   18. [contains(long)](#contains(long))
   19. [indexOf(long)](#indexOf(long))
   20. [lastIndexOf(char)](#lastIndexOf(char))
   21. [removeValue(long)](#removeValue(long))
   22. [removeIndex(int)](#removeIndex(int))
   23. [removeRange(int, int)](#removeRange(int,int))
   24. [removeAll(LongArray)](#removeAll(zombie.entity.util.LongArray))
   25. [pop()](#pop())
   26. [peek()](#peek())
   27. [first()](#first())
   28. [notEmpty()](#notEmpty())
   29. [isEmpty()](#isEmpty())
   30. [clear()](#clear())
   31. [shrink()](#shrink())
   32. [ensureCapacity(int)](#ensureCapacity(int))
   33. [setSize(int)](#setSize(int))
   34. [resize(int)](#resize(int))
   35. [sort()](#sort())
   36. [reverse()](#reverse())
   37. [shuffle()](#shuffle())
   38. [truncate(int)](#truncate(int))
   39. [random()](#random())
   40. [toArray()](#toArray())
   41. [hashCode()](#hashCode())
   42. [equals(Object)](#equals(java.lang.Object))
   43. [toString()](#toString())
   44. [toString(String)](#toString(java.lang.String))
   45. [with(long...)](#with(long...))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class LongArray
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.util.LongArray

---

public class LongArray
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

A resizable, ordered or unordered long array. Avoids the boxing that occurs with ArrayList. If unordered, this class
avoids a memory copy when removing elements (the last element is moved to the removed element's position).

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `long[]`

  `items`

  `boolean`

  `ordered`

  `int`

  `size`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LongArray()`

  Creates an ordered array with a capacity of 16.

  `LongArray(boolean ordered,
  int capacity)`

  `LongArray(boolean ordered,
  long[] array,
  int startIndex,
  int count)`

  Creates a new array containing the elements in the specified array.

  `LongArray(int capacity)`

  Creates an ordered array with the specified capacity.

  `LongArray(long[] array)`

  Creates a new ordered array containing the elements in the specified array.

  `LongArray(LongArray array)`

  Creates a new array containing the elements in the specific array.
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(long value)`

  `void`

  `add(long value1,
  long value2)`

  `void`

  `add(long value1,
  long value2,
  long value3)`

  `void`

  `add(long value1,
  long value2,
  long value3,
  long value4)`

  `void`

  `addAll(long... array)`

  `void`

  `addAll(long[] array,
  int offset,
  int length)`

  `void`

  `addAll(LongArray array)`

  `void`

  `addAll(LongArray array,
  int offset,
  int length)`

  `void`

  `clear()`

  `boolean`

  `contains(long value)`

  `long[]`

  `ensureCapacity(int additionalCapacity)`

  Increases the size of the backing array to accommodate the specified number of additional items.

  `boolean`

  `equals(Object object)`

  `long`

  `first()`

  Returns the first item.

  `long`

  `get(int index)`

  `int`

  `hashCode()`

  `void`

  `incr(int index,
  long value)`

  `void`

  `incr(long value)`

  `int`

  `indexOf(long value)`

  `void`

  `insert(int index,
  long value)`

  `void`

  `insertRange(int index,
  int count)`

  Inserts the specified number of items at the specified index.

  `boolean`

  `isEmpty()`

  Returns true if the array is empty.

  `int`

  `lastIndexOf(char value)`

  `void`

  `mul(int index,
  long value)`

  `void`

  `mul(long value)`

  `boolean`

  `notEmpty()`

  Returns true if the array has one or more items.

  `long`

  `peek()`

  Returns the last item.

  `long`

  `pop()`

  Removes and returns the last item.

  `long`

  `random()`

  Returns a random item from the array, or zero if the array is empty.

  `boolean`

  `removeAll(LongArray array)`

  Removes from this array all of elements contained in the specified array.

  `long`

  `removeIndex(int index)`

  Removes and returns the item at the specified index.

  `void`

  `removeRange(int start,
  int end)`

  Removes the items between the specified indices, inclusive.

  `boolean`

  `removeValue(long value)`

  `protected long[]`

  `resize(int newSize)`

  `void`

  `reverse()`

  `void`

  `set(int index,
  long value)`

  `long[]`

  `setSize(int newSize)`

  Sets the array size, leaving any values beyond the current size undefined.

  `long[]`

  `shrink()`

  Reduces the size of the backing array to the size of the actual items.

  `void`

  `shuffle()`

  `void`

  `sort()`

  `void`

  `swap(int first,
  int second)`

  `long[]`

  `toArray()`

  `String`

  `toString()`

  `String`

  `toString(String separator)`

  `void`

  `truncate(int newSize)`

  Reduces the size of the array to the specified size.

  `static LongArray`

  `with(long... array)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### items

    public long[] items
  + ### size

    public int size
  + ### ordered

    public boolean ordered
* Constructor Details
  -------------------

  + ### LongArray

    public LongArray()

    Creates an ordered array with a capacity of 16.
  + ### LongArray

    public LongArray(int capacity)

    Creates an ordered array with the specified capacity.
  + ### LongArray

    public LongArray(boolean ordered,
    int capacity)

    Parameters:
    :   `ordered` - If false, methods that remove elements may change the order of other elements in the array, which avoids a
        memory copy.
    :   `capacity` - Any elements added beyond this will cause the backing array to be grown.
  + ### LongArray

    public LongArray([LongArray](LongArray.html "class in zombie.entity.util") array)

    Creates a new array containing the elements in the specific array. The new array will be ordered if the specific array is
    ordered. The capacity is set to the number of elements, so any subsequent elements added will cause the backing array to be
    grown.
  + ### LongArray

    public LongArray(long[] array)

    Creates a new ordered array containing the elements in the specified array. The capacity is set to the number of elements,
    so any subsequent elements added will cause the backing array to be grown.
  + ### LongArray

    public LongArray(boolean ordered,
    long[] array,
    int startIndex,
    int count)

    Creates a new array containing the elements in the specified array. The capacity is set to the number of elements, so any
    subsequent elements added will cause the backing array to be grown.

    Parameters:
    :   `ordered` - If false, methods that remove elements may change the order of other elements in the array, which avoids a
        memory copy.
* Method Details
  --------------

  + ### add

    public void add(long value)
  + ### add

    public void add(long value1,
    long value2)
  + ### add

    public void add(long value1,
    long value2,
    long value3)
  + ### add

    public void add(long value1,
    long value2,
    long value3,
    long value4)
  + ### addAll

    public void addAll([LongArray](LongArray.html "class in zombie.entity.util") array)
  + ### addAll

    public void addAll([LongArray](LongArray.html "class in zombie.entity.util") array,
    int offset,
    int length)
  + ### addAll

    public void addAll(long... array)
  + ### addAll

    public void addAll(long[] array,
    int offset,
    int length)
  + ### get

    public long get(int index)
  + ### set

    public void set(int index,
    long value)
  + ### incr

    public void incr(int index,
    long value)
  + ### incr

    public void incr(long value)
  + ### mul

    public void mul(int index,
    long value)
  + ### mul

    public void mul(long value)
  + ### insert

    public void insert(int index,
    long value)
  + ### insertRange

    public void insertRange(int index,
    int count)

    Inserts the specified number of items at the specified index. The new items will have values equal to the values at those
    indices before the insertion.
  + ### swap

    public void swap(int first,
    int second)
  + ### contains

    public boolean contains(long value)
  + ### indexOf

    public int indexOf(long value)
  + ### lastIndexOf

    public int lastIndexOf(char value)
  + ### removeValue

    public boolean removeValue(long value)
  + ### removeIndex

    public long removeIndex(int index)

    Removes and returns the item at the specified index.
  + ### removeRange

    public void removeRange(int start,
    int end)

    Removes the items between the specified indices, inclusive.
  + ### removeAll

    public boolean removeAll([LongArray](LongArray.html "class in zombie.entity.util") array)

    Removes from this array all of elements contained in the specified array.

    Returns:
    :   true if this array was modified.
  + ### pop

    public long pop()

    Removes and returns the last item.
  + ### peek

    public long peek()

    Returns the last item.
  + ### first

    public long first()

    Returns the first item.
  + ### notEmpty

    public boolean notEmpty()

    Returns true if the array has one or more items.
  + ### isEmpty

    public boolean isEmpty()

    Returns true if the array is empty.
  + ### clear

    public void clear()
  + ### shrink

    public long[] shrink()

    Reduces the size of the backing array to the size of the actual items. This is useful to release memory when many items
    have been removed, or if it is known that more items will not be added.

    Returns:
    :   [`items`](#items)
  + ### ensureCapacity

    public long[] ensureCapacity(int additionalCapacity)

    Increases the size of the backing array to accommodate the specified number of additional items. Useful before adding many
    items to avoid multiple backing array resizes.

    Returns:
    :   [`items`](#items)
  + ### setSize

    public long[] setSize(int newSize)

    Sets the array size, leaving any values beyond the current size undefined.

    Returns:
    :   [`items`](#items)
  + ### resize

    protected long[] resize(int newSize)
  + ### sort

    public void sort()
  + ### reverse

    public void reverse()
  + ### shuffle

    public void shuffle()
  + ### truncate

    public void truncate(int newSize)

    Reduces the size of the array to the specified size. If the array is already smaller than the specified size, no action is
    taken.
  + ### random

    public long random()

    Returns a random item from the array, or zero if the array is empty.
  + ### toArray

    public long[] toArray()
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") object)

    Overrides:
    :   `equals` in class `Object`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator)
  + ### with

    public static [LongArray](LongArray.html "class in zombie.entity.util") with(long... array)

    See Also:
    :   - [`LongArray(long[])`](#%3Cinit%3E(long%5B%5D))