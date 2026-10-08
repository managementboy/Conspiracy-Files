[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.util](package-summary.html)
2. [Array](Array.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [items](#items)
   2. [size](#size)
   3. [ordered](#ordered)
   4. [iterable](#iterable)
   5. [predicateIterable](#predicateIterable)
7. [Constructor Details](#constructor-detail)
   1. [Array()](#%3Cinit%3E())
   2. [Array(int)](#%3Cinit%3E(int))
   3. [Array(boolean, int)](#%3Cinit%3E(boolean,int))
   4. [Array(boolean, int, Class)](#%3Cinit%3E(boolean,int,java.lang.Class))
   5. [Array(Class)](#%3Cinit%3E(java.lang.Class))
   6. [Array(Array)](#%3Cinit%3E(zombie.entity.util.Array))
   7. [Array(T[])](#%3Cinit%3E(T%5B%5D))
   8. [Array(boolean, T[], int, int)](#%3Cinit%3E(boolean,T%5B%5D,int,int))
8. [Method Details](#method-detail)
   1. [add(T)](#add(T))
   2. [add(T, T)](#add(T,T))
   3. [add(T, T, T)](#add(T,T,T))
   4. [add(T, T, T, T)](#add(T,T,T,T))
   5. [addAll(Array)](#addAll(zombie.entity.util.Array))
   6. [addAll(Array, int, int)](#addAll(zombie.entity.util.Array,int,int))
   7. [addAll(T...)](#addAll(T...))
   8. [addAll(T[], int, int)](#addAll(T%5B%5D,int,int))
   9. [get(int)](#get(int))
   10. [set(int, T)](#set(int,T))
   11. [insert(int, T)](#insert(int,T))
   12. [insertRange(int, int)](#insertRange(int,int))
   13. [swap(int, int)](#swap(int,int))
   14. [contains(T, boolean)](#contains(T,boolean))
   15. [containsAll(Array, boolean)](#containsAll(zombie.entity.util.Array,boolean))
   16. [containsAny(Array, boolean)](#containsAny(zombie.entity.util.Array,boolean))
   17. [indexOf(T, boolean)](#indexOf(T,boolean))
   18. [lastIndexOf(T, boolean)](#lastIndexOf(T,boolean))
   19. [removeValue(T, boolean)](#removeValue(T,boolean))
   20. [removeIndex(int)](#removeIndex(int))
   21. [removeRange(int, int)](#removeRange(int,int))
   22. [removeAll(Array, boolean)](#removeAll(zombie.entity.util.Array,boolean))
   23. [pop()](#pop())
   24. [peek()](#peek())
   25. [first()](#first())
   26. [notEmpty()](#notEmpty())
   27. [isEmpty()](#isEmpty())
   28. [clear()](#clear())
   29. [shrink()](#shrink())
   30. [ensureCapacity(int)](#ensureCapacity(int))
   31. [setSize(int)](#setSize(int))
   32. [resize(int)](#resize(int))
   33. [sort()](#sort())
   34. [sort(Comparator)](#sort(java.util.Comparator))
   35. [selectRanked(Comparator, int)](#selectRanked(java.util.Comparator,int))
   36. [selectRankedIndex(Comparator, int)](#selectRankedIndex(java.util.Comparator,int))
   37. [reverse()](#reverse())
   38. [shuffle()](#shuffle())
   39. [iterator()](#iterator())
   40. [select(Predicate)](#select(zombie.entity.util.Predicate))
   41. [truncate(int)](#truncate(int))
   42. [random()](#random())
   43. [toArray()](#toArray())
   44. [toArray(Class)](#toArray(java.lang.Class))
   45. [hashCode()](#hashCode())
   46. [equals(Object)](#equals(java.lang.Object))
   47. [equalsIdentity(Object)](#equalsIdentity(java.lang.Object))
   48. [toString()](#toString())
   49. [toString(String)](#toString(java.lang.String))
   50. [of(Class)](#of(java.lang.Class))
   51. [of(boolean, int, Class)](#of(boolean,int,java.lang.Class))
   52. [with(T...)](#with(T...))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Array<T>
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.util.Array<T>

All Implemented Interfaces:
:   `Iterable<T>`

Direct Known Subclasses:
:   `SnapshotArray`

---

public class Array<T>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html "class or interface in java.lang")<T>

A resizable, ordered or unordered array of objects. If unordered, this class avoids a memory copy when removing elements (the
last element is moved to the removed element's position).

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `Array.ArrayIterable<T>`

  `static class`

  `Array.ArrayIterator<T>`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `T[]`

  `items`

  Provides direct access to the underlying array.

  `private Array.ArrayIterable<T>`

  `iterable`

  `boolean`

  `ordered`

  `private zombie.entity.util.Predicate.PredicateIterable<T>`

  `predicateIterable`

  `int`

  `size`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Array()`

  Creates an ordered array with a capacity of 16.

  `Array(boolean ordered,
  int capacity)`

  `Array(boolean ordered,
  int capacity,
  Class<?> arrayType)`

  Creates a new array with [`items`](#items) of the specified type.

  `Array(boolean ordered,
  T[] array,
  int start,
  int count)`

  Creates a new array containing the elements in the specified array.

  `Array(int capacity)`

  Creates an ordered array with the specified capacity.

  `Array(Class<?> arrayType)`

  Creates an ordered array with [`items`](#items) of the specified type and a capacity of 16.

  `Array(T[] array)`

  Creates a new ordered array containing the elements in the specified array.

  `Array(Array<? extends T> array)`

  Creates a new array containing the elements in the specified array.
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(T value)`

  `void`

  `add(T value1,
  T value2)`

  `void`

  `add(T value1,
  T value2,
  T value3)`

  `void`

  `add(T value1,
  T value2,
  T value3,
  T value4)`

  `void`

  `addAll(T... array)`

  `void`

  `addAll(T[] array,
  int start,
  int count)`

  `void`

  `addAll(Array<? extends T> array)`

  `void`

  `addAll(Array<? extends T> array,
  int start,
  int count)`

  `void`

  `clear()`

  `boolean`

  `contains(@Nullable T value,
  boolean identity)`

  Returns true if this array contains the specified value.

  `boolean`

  `containsAll(Array<? extends T> values,
  boolean identity)`

  Returns true if this array contains all the specified values.

  `boolean`

  `containsAny(Array<? extends T> values,
  boolean identity)`

  Returns true if this array contains any the specified values.

  `T[]`

  `ensureCapacity(int additionalCapacity)`

  Increases the size of the backing array to accommodate the specified number of additional items.

  `boolean`

  `equals(Object object)`

  Returns false if either array is unordered.

  `boolean`

  `equalsIdentity(Object object)`

  Uses == for comparison of each item.

  `T`

  `first()`

  Returns the first item.

  `T`

  `get(int index)`

  `int`

  `hashCode()`

  `int`

  `indexOf(@Nullable T value,
  boolean identity)`

  Returns the index of first occurrence of value in the array, or -1 if no such value exists.

  `void`

  `insert(int index,
  T value)`

  `void`

  `insertRange(int index,
  int count)`

  Inserts the specified number of items at the specified index.

  `boolean`

  `isEmpty()`

  Returns true if the array is empty.

  `Array.ArrayIterator<T>`

  `iterator()`

  Returns an iterator for the items in the array.

  `int`

  `lastIndexOf(@Nullable T value,
  boolean identity)`

  Returns an index of last occurrence of value in array or -1 if no such value exists.

  `boolean`

  `notEmpty()`

  Returns true if the array has one or more items.

  `static <T> Array<T>`

  `of(boolean ordered,
  int capacity,
  Class<T> arrayType)`

  `static <T> Array<T>`

  `of(Class<T> arrayType)`

  `T`

  `peek()`

  Returns the last item.

  `T`

  `pop()`

  Removes and returns the last item.

  `@Nullable T`

  `random()`

  Returns a random item from the array, or null if the array is empty.

  `boolean`

  `removeAll(Array<? extends T> array,
  boolean identity)`

  Removes from this array all of elements contained in the specified array.

  `T`

  `removeIndex(int index)`

  Removes and returns the item at the specified index.

  `void`

  `removeRange(int start,
  int end)`

  Removes the items between the specified indices, inclusive.

  `boolean`

  `removeValue(@Nullable T value,
  boolean identity)`

  Removes the first instance of the specified value in the array.

  `protected T[]`

  `resize(int newSize)`

  Creates a new backing array with the specified size containing the current items.

  `void`

  `reverse()`

  `Iterable<T>`

  `select(zombie.entity.util.Predicate<T> predicate)`

  Returns an iterable for the selected items in the array.

  `T`

  `selectRanked(Comparator<T> comparator,
  int kthLowest)`

  Selects the nth-lowest element from the Array according to Comparator ranking.

  `int`

  `selectRankedIndex(Comparator<T> comparator,
  int kthLowest)`

  `void`

  `set(int index,
  T value)`

  `T[]`

  `setSize(int newSize)`

  Sets the array size, leaving any values beyond the current size null.

  `T[]`

  `shrink()`

  Reduces the size of the backing array to the size of the actual items.

  `void`

  `shuffle()`

  `void`

  `sort()`

  Sorts this array.

  `void`

  `sort(Comparator<? super T> comparator)`

  Sorts the array.

  `void`

  `swap(int first,
  int second)`

  `T[]`

  `toArray()`

  Returns the items as an array.

  `<V> V[]`

  `toArray(Class<V> type)`

  `String`

  `toString()`

  `String`

  `toString(String separator)`

  `void`

  `truncate(int newSize)`

  Reduces the size of the array to the specified size.

  `static <T> Array<T>`

  `with(T... array)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html#method-summary "class or interface in java.lang")

  `forEach, spliterator`

* Field Details
  -------------

  + ### items

    public [T](#type-param-T "type parameter in Array")[] items

    Provides direct access to the underlying array. If the Array's generic type is not Object, this field may only be accessed
    if the [`Array(boolean, int, Class)`](#%3Cinit%3E(boolean,int,java.lang.Class)) constructor was used.
  + ### size

    public int size
  + ### ordered

    public boolean ordered
  + ### iterable

    private [Array.ArrayIterable](Array.ArrayIterable.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array")> iterable
  + ### predicateIterable

    private zombie.entity.util.Predicate.PredicateIterable<[T](#type-param-T "type parameter in Array")> predicateIterable
* Constructor Details
  -------------------

  + ### Array

    public Array()

    Creates an ordered array with a capacity of 16.
  + ### Array

    public Array(int capacity)

    Creates an ordered array with the specified capacity.
  + ### Array

    public Array(boolean ordered,
    int capacity)

    Parameters:
    :   `ordered` - If false, methods that remove elements may change the order of other elements in the array, which avoids a
        memory copy.
    :   `capacity` - Any elements added beyond this will cause the backing array to be grown.
  + ### Array

    public Array(boolean ordered,
    int capacity,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> arrayType)

    Creates a new array with [`items`](#items) of the specified type.

    Parameters:
    :   `ordered` - If false, methods that remove elements may change the order of other elements in the array, which avoids a
        memory copy.
    :   `capacity` - Any elements added beyond this will cause the backing array to be grown.
  + ### Array

    public Array([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> arrayType)

    Creates an ordered array with [`items`](#items) of the specified type and a capacity of 16.
  + ### Array

    public Array([Array](Array.html "class in zombie.entity.util")<? extends [T](#type-param-T "type parameter in Array")> array)

    Creates a new array containing the elements in the specified array. The new array will have the same type of backing array
    and will be ordered if the specified array is ordered. The capacity is set to the number of elements, so any subsequent
    elements added will cause the backing array to be grown.
  + ### Array

    public Array([T](#type-param-T "type parameter in Array")[] array)

    Creates a new ordered array containing the elements in the specified array. The new array will have the same type of
    backing array. The capacity is set to the number of elements, so any subsequent elements added will cause the backing array
    to be grown.
  + ### Array

    public Array(boolean ordered,
    [T](#type-param-T "type parameter in Array")[] array,
    int start,
    int count)

    Creates a new array containing the elements in the specified array. The new array will have the same type of backing array.
    The capacity is set to the number of elements, so any subsequent elements added will cause the backing array to be grown.

    Parameters:
    :   `ordered` - If false, methods that remove elements may change the order of other elements in the array, which avoids a
        memory copy.
* Method Details
  --------------

  + ### add

    public void add([T](#type-param-T "type parameter in Array") value)
  + ### add

    public void add([T](#type-param-T "type parameter in Array") value1,
    [T](#type-param-T "type parameter in Array") value2)
  + ### add

    public void add([T](#type-param-T "type parameter in Array") value1,
    [T](#type-param-T "type parameter in Array") value2,
    [T](#type-param-T "type parameter in Array") value3)
  + ### add

    public void add([T](#type-param-T "type parameter in Array") value1,
    [T](#type-param-T "type parameter in Array") value2,
    [T](#type-param-T "type parameter in Array") value3,
    [T](#type-param-T "type parameter in Array") value4)
  + ### addAll

    public void addAll([Array](Array.html "class in zombie.entity.util")<? extends [T](#type-param-T "type parameter in Array")> array)
  + ### addAll

    public void addAll([Array](Array.html "class in zombie.entity.util")<? extends [T](#type-param-T "type parameter in Array")> array,
    int start,
    int count)
  + ### addAll

    public void addAll([T](#type-param-T "type parameter in Array")... array)
  + ### addAll

    public void addAll([T](#type-param-T "type parameter in Array")[] array,
    int start,
    int count)
  + ### get

    public [T](#type-param-T "type parameter in Array") get(int index)
  + ### set

    public void set(int index,
    [T](#type-param-T "type parameter in Array") value)
  + ### insert

    public void insert(int index,
    [T](#type-param-T "type parameter in Array") value)
  + ### insertRange

    public void insertRange(int index,
    int count)

    Inserts the specified number of items at the specified index. The new items will have values equal to the values at those
    indices before the insertion.
  + ### swap

    public void swap(int first,
    int second)
  + ### contains

    public boolean contains(@Nullable [T](#type-param-T "type parameter in Array") value,
    boolean identity)

    Returns true if this array contains the specified value.

    Parameters:
    :   `value` - May be null.
    :   `identity` - If true, == comparison will be used. If false, .equals() comparison will be used.
  + ### containsAll

    public boolean containsAll([Array](Array.html "class in zombie.entity.util")<? extends [T](#type-param-T "type parameter in Array")> values,
    boolean identity)

    Returns true if this array contains all the specified values.

    Parameters:
    :   `values` - May contains nulls.
    :   `identity` - If true, == comparison will be used. If false, .equals() comparison will be used.
  + ### containsAny

    public boolean containsAny([Array](Array.html "class in zombie.entity.util")<? extends [T](#type-param-T "type parameter in Array")> values,
    boolean identity)

    Returns true if this array contains any the specified values.

    Parameters:
    :   `values` - May contains nulls.
    :   `identity` - If true, == comparison will be used. If false, .equals() comparison will be used.
  + ### indexOf

    public int indexOf(@Nullable [T](#type-param-T "type parameter in Array") value,
    boolean identity)

    Returns the index of first occurrence of value in the array, or -1 if no such value exists.

    Parameters:
    :   `value` - May be null.
    :   `identity` - If true, == comparison will be used. If false, .equals() comparison will be used.

    Returns:
    :   An index of first occurrence of value in array or -1 if no such value exists
  + ### lastIndexOf

    public int lastIndexOf(@Nullable [T](#type-param-T "type parameter in Array") value,
    boolean identity)

    Returns an index of last occurrence of value in array or -1 if no such value exists. Search is started from the end of an
    array.

    Parameters:
    :   `value` - May be null.
    :   `identity` - If true, == comparison will be used. If false, .equals() comparison will be used.

    Returns:
    :   An index of last occurrence of value in array or -1 if no such value exists
  + ### removeValue

    public boolean removeValue(@Nullable [T](#type-param-T "type parameter in Array") value,
    boolean identity)

    Removes the first instance of the specified value in the array.

    Parameters:
    :   `value` - May be null.
    :   `identity` - If true, == comparison will be used. If false, .equals() comparison will be used.

    Returns:
    :   true if value was found and removed, false otherwise
  + ### removeIndex

    public [T](#type-param-T "type parameter in Array") removeIndex(int index)

    Removes and returns the item at the specified index.
  + ### removeRange

    public void removeRange(int start,
    int end)

    Removes the items between the specified indices, inclusive.
  + ### removeAll

    public boolean removeAll([Array](Array.html "class in zombie.entity.util")<? extends [T](#type-param-T "type parameter in Array")> array,
    boolean identity)

    Removes from this array all of elements contained in the specified array.

    Parameters:
    :   `identity` - True to use ==, false to use .equals().

    Returns:
    :   true if this array was modified.
  + ### pop

    public [T](#type-param-T "type parameter in Array") pop()

    Removes and returns the last item.
  + ### peek

    public [T](#type-param-T "type parameter in Array") peek()

    Returns the last item.
  + ### first

    public [T](#type-param-T "type parameter in Array") first()

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

    public [T](#type-param-T "type parameter in Array")[] shrink()

    Reduces the size of the backing array to the size of the actual items. This is useful to release memory when many items
    have been removed, or if it is known that more items will not be added.

    Returns:
    :   [`items`](#items)
  + ### ensureCapacity

    public [T](#type-param-T "type parameter in Array")[] ensureCapacity(int additionalCapacity)

    Increases the size of the backing array to accommodate the specified number of additional items. Useful before adding many
    items to avoid multiple backing array resizes.

    Returns:
    :   [`items`](#items)
  + ### setSize

    public [T](#type-param-T "type parameter in Array")[] setSize(int newSize)

    Sets the array size, leaving any values beyond the current size null.

    Returns:
    :   [`items`](#items)
  + ### resize

    protected [T](#type-param-T "type parameter in Array")[] resize(int newSize)

    Creates a new backing array with the specified size containing the current items.
  + ### sort

    public void sort()

    Sorts this array. The array elements must implement [`Comparable`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Comparable.html "class or interface in java.lang"). This method is not thread safe (uses
    `Sort.instance()`).
  + ### sort

    public void sort([Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<? super [T](#type-param-T "type parameter in Array")> comparator)

    Sorts the array. This method is not thread safe (uses `Sort.instance()`).
  + ### selectRanked

    public [T](#type-param-T "type parameter in Array") selectRanked([Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[T](#type-param-T "type parameter in Array")> comparator,
    int kthLowest)

    Selects the nth-lowest element from the Array according to Comparator ranking. This might partially sort the Array. The
    array must have a size greater than 0, or a [`RuntimeException`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/RuntimeException.html "class or interface in java.lang") will be thrown.

    Parameters:
    :   `comparator` - used for comparison
    :   `kthLowest` - rank of desired object according to comparison, n is based on ordinal numbers, not array indices. for min
        value use 1, for max value use size of array, using 0 results in runtime exception.

    Returns:
    :   the value of the Nth lowest ranked object.

    See Also:
    :   - `Select`
  + ### selectRankedIndex

    public int selectRankedIndex([Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[T](#type-param-T "type parameter in Array")> comparator,
    int kthLowest)

    Parameters:
    :   `comparator` - used for comparison
    :   `kthLowest` - rank of desired object according to comparison, n is based on ordinal numbers, not array indices. for min
        value use 1, for max value use size of array, using 0 results in runtime exception.

    Returns:
    :   the index of the Nth lowest ranked object.

    See Also:
    :   - [`selectRanked(Comparator, int)`](#selectRanked(java.util.Comparator,int))
  + ### reverse

    public void reverse()
  + ### shuffle

    public void shuffle()
  + ### iterator

    public [Array.ArrayIterator](Array.ArrayIterator.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in Array")> iterator()

    Returns an iterator for the items in the array. Remove is supported.

    If `Collections.allocateIterators` is false, the same iterator instance is returned each time this method is called.
    Use the [`Array.ArrayIterator`](Array.ArrayIterator.html "class in zombie.entity.util") constructor for nested or multithreaded iteration.

    Specified by:
    :   `iterator` in interface `Iterable<T>`
  + ### select

    public [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html "class or interface in java.lang")<[T](#type-param-T "type parameter in Array")> select(zombie.entity.util.Predicate<[T](#type-param-T "type parameter in Array")> predicate)

    Returns an iterable for the selected items in the array. Remove is supported, but not between hasNext() and next().

    If `Collections.allocateIterators` is false, the same iterable instance is returned each time this method is called.
    Use the `Predicate.PredicateIterable` constructor for nested or multithreaded iteration.
  + ### truncate

    public void truncate(int newSize)

    Reduces the size of the array to the specified size. If the array is already smaller than the specified size, no action is
    taken.
  + ### random

    public @Nullable [T](#type-param-T "type parameter in Array") random()

    Returns a random item from the array, or null if the array is empty.
  + ### toArray

    public [T](#type-param-T "type parameter in Array")[] toArray()

    Returns the items as an array. Note the array is typed, so the [`Array(Class)`](#%3Cinit%3E(java.lang.Class)) constructor must have been used.
    Otherwise use [`toArray(Class)`](#toArray(java.lang.Class)) to specify the array type.
  + ### toArray

    public <V> V[] toArray([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<V> type)
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") object)

    Returns false if either array is unordered.

    Overrides:
    :   `equals` in class `Object`
  + ### equalsIdentity

    public boolean equalsIdentity([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") object)

    Uses == for comparison of each item. Returns false if either array is unordered.
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") separator)
  + ### of

    public static <T> [Array](Array.html "class in zombie.entity.util")<T> of([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<T> arrayType)

    See Also:
    :   - [`Array(Class)`](#%3Cinit%3E(java.lang.Class))
  + ### of

    public static <T> [Array](Array.html "class in zombie.entity.util")<T> of(boolean ordered,
    int capacity,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<T> arrayType)

    See Also:
    :   - [`Array(boolean, int, Class)`](#%3Cinit%3E(boolean,int,java.lang.Class))
  + ### with

    public static <T> [Array](Array.html "class in zombie.entity.util")<T> with(T... array)

    See Also:
    :   - [`Array(Object[])`](#%3Cinit%3E(T%5B%5D))