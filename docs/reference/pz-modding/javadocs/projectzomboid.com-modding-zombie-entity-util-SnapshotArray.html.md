[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.util](package-summary.html)
2. [SnapshotArray](SnapshotArray.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [snapshot](#snapshot)
   2. [recycled](#recycled)
   3. [snapshots](#snapshots)
7. [Constructor Details](#constructor-detail)
   1. [SnapshotArray()](#%3Cinit%3E())
   2. [SnapshotArray(Array)](#%3Cinit%3E(zombie.entity.util.Array))
   3. [SnapshotArray(boolean, int, Class)](#%3Cinit%3E(boolean,int,java.lang.Class))
   4. [SnapshotArray(boolean, int)](#%3Cinit%3E(boolean,int))
   5. [SnapshotArray(boolean, T[], int, int)](#%3Cinit%3E(boolean,T%5B%5D,int,int))
   6. [SnapshotArray(Class)](#%3Cinit%3E(java.lang.Class))
   7. [SnapshotArray(int)](#%3Cinit%3E(int))
   8. [SnapshotArray(T[])](#%3Cinit%3E(T%5B%5D))
8. [Method Details](#method-detail)
   1. [begin()](#begin())
   2. [end()](#end())
   3. [modified()](#modified())
   4. [set(int, T)](#set(int,T))
   5. [insert(int, T)](#insert(int,T))
   6. [insertRange(int, int)](#insertRange(int,int))
   7. [swap(int, int)](#swap(int,int))
   8. [removeValue(T, boolean)](#removeValue(T,boolean))
   9. [removeIndex(int)](#removeIndex(int))
   10. [removeRange(int, int)](#removeRange(int,int))
   11. [removeAll(Array, boolean)](#removeAll(zombie.entity.util.Array,boolean))
   12. [pop()](#pop())
   13. [clear()](#clear())
   14. [sort()](#sort())
   15. [sort(Comparator)](#sort(java.util.Comparator))
   16. [reverse()](#reverse())
   17. [shuffle()](#shuffle())
   18. [truncate(int)](#truncate(int))
   19. [setSize(int)](#setSize(int))
   20. [with(T...)](#with(T...))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SnapshotArray<T>
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.util.Array](Array.html "class in zombie.entity.util")<T>

zombie.entity.util.SnapshotArray<T>

All Implemented Interfaces:
:   `Iterable<T>`

---

public class SnapshotArray<T>
extends [Array](Array.html "class in zombie.entity.util")<T>

An array that allows modification during iteration. Guarantees that array entries provided by [`begin()`](#begin()) between indexes
0 and [`Array.size`](Array.html#size) at the time begin was called will not be modified until [`end()`](#end()) is called. If modification of the
SnapshotArray occurs between begin/end, the backing array is copied prior to the modification, ensuring that the backing array
that was returned by [`begin()`](#begin()) is unaffected. To avoid allocation, an attempt is made to reuse any extra array created
as a result of this copy on subsequent copies.

Note that SnapshotArray is not for thread safety, only for modification during iteration.

It is suggested iteration be done in this specific way:

```
SnapshotArray array = new SnapshotArray();
// ...
Object[] items = array.begin();
for (int i = 0, n = array.size; i < n; i++) {
 Item item = (Item)items[i];
 // ...
}
array.end();
```

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Array](Array.html#nested-class-summary "class in zombie.entity.util")

  `Array.ArrayIterable<T>, Array.ArrayIterator<T>`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private T[]`

  `recycled`

  `private T[]`

  `snapshot`

  `private int`

  `snapshots`

  ### Fields inherited from class [Array](Array.html#field-summary "class in zombie.entity.util")

  `items, ordered, size`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SnapshotArray()`

  `SnapshotArray(boolean ordered,
  int capacity)`

  `SnapshotArray(boolean ordered,
  int capacity,
  Class<?> arrayType)`

  `SnapshotArray(boolean ordered,
  T[] array,
  int startIndex,
  int count)`

  `SnapshotArray(int capacity)`

  `SnapshotArray(Class<?> arrayType)`

  `SnapshotArray(T[] array)`

  `SnapshotArray(Array<T> array)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `T[]`

  `begin()`

  Returns the backing array, which is guaranteed to not be modified before [`end()`](#end()).

  `void`

  `clear()`

  `void`

  `end()`

  Releases the guarantee that the array returned by [`begin()`](#begin()) won't be modified.

  `void`

  `insert(int index,
  T value)`

  `void`

  `insertRange(int index,
  int count)`

  Inserts the specified number of items at the specified index.

  `private void`

  `modified()`

  `T`

  `pop()`

  Removes and returns the last item.

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

  `removeValue(T value,
  boolean identity)`

  Removes the first instance of the specified value in the array.

  `void`

  `reverse()`

  `void`

  `set(int index,
  T value)`

  `T[]`

  `setSize(int newSize)`

  Sets the array size, leaving any values beyond the current size null.

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

  `void`

  `truncate(int newSize)`

  Reduces the size of the array to the specified size.

  `static <T> SnapshotArray<T>`

  `with(T... array)`

  ### Methods inherited from class [Array](Array.html#method-summary "class in zombie.entity.util")

  `add, add, add, add, addAll, addAll, addAll, addAll, contains, containsAll, containsAny, ensureCapacity, equals, equalsIdentity, first, get, hashCode, indexOf, isEmpty, iterator, lastIndexOf, notEmpty, of, of, peek, random, resize, select, selectRanked, selectRankedIndex, shrink, toArray, toArray, toString, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [Iterable](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Iterable.html#method-summary "class or interface in java.lang")

  `forEach, spliterator`

* Field Details
  -------------

  + ### snapshot

    private [T](#type-param-T "type parameter in SnapshotArray")[] snapshot
  + ### recycled

    private [T](#type-param-T "type parameter in SnapshotArray")[] recycled
  + ### snapshots

    private int snapshots
* Constructor Details
  -------------------

  + ### SnapshotArray

    public SnapshotArray()
  + ### SnapshotArray

    public SnapshotArray([Array](Array.html "class in zombie.entity.util")<[T](#type-param-T "type parameter in SnapshotArray")> array)
  + ### SnapshotArray

    public SnapshotArray(boolean ordered,
    int capacity,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> arrayType)
  + ### SnapshotArray

    public SnapshotArray(boolean ordered,
    int capacity)
  + ### SnapshotArray

    public SnapshotArray(boolean ordered,
    [T](#type-param-T "type parameter in SnapshotArray")[] array,
    int startIndex,
    int count)
  + ### SnapshotArray

    public SnapshotArray([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> arrayType)
  + ### SnapshotArray

    public SnapshotArray(int capacity)
  + ### SnapshotArray

    public SnapshotArray([T](#type-param-T "type parameter in SnapshotArray")[] array)
* Method Details
  --------------

  + ### begin

    public [T](#type-param-T "type parameter in SnapshotArray")[] begin()

    Returns the backing array, which is guaranteed to not be modified before [`end()`](#end()).
  + ### end

    public void end()

    Releases the guarantee that the array returned by [`begin()`](#begin()) won't be modified.
  + ### modified

    private void modified()
  + ### set

    public void set(int index,
    [T](#type-param-T "type parameter in SnapshotArray") value)

    Overrides:
    :   `set` in class `Array<T>`
  + ### insert

    public void insert(int index,
    [T](#type-param-T "type parameter in SnapshotArray") value)

    Overrides:
    :   `insert` in class `Array<T>`
  + ### insertRange

    public void insertRange(int index,
    int count)

    Description copied from class: `Array`

    Inserts the specified number of items at the specified index. The new items will have values equal to the values at those
    indices before the insertion.

    Overrides:
    :   `insertRange` in class `Array<T>`
  + ### swap

    public void swap(int first,
    int second)

    Overrides:
    :   `swap` in class `Array<T>`
  + ### removeValue

    public boolean removeValue([T](#type-param-T "type parameter in SnapshotArray") value,
    boolean identity)

    Description copied from class: `Array`

    Removes the first instance of the specified value in the array.

    Overrides:
    :   `removeValue` in class `Array<T>`

    Parameters:
    :   `value` - May be null.
    :   `identity` - If true, == comparison will be used. If false, .equals() comparison will be used.

    Returns:
    :   true if value was found and removed, false otherwise
  + ### removeIndex

    public [T](#type-param-T "type parameter in SnapshotArray") removeIndex(int index)

    Description copied from class: `Array`

    Removes and returns the item at the specified index.

    Overrides:
    :   `removeIndex` in class `Array<T>`
  + ### removeRange

    public void removeRange(int start,
    int end)

    Description copied from class: `Array`

    Removes the items between the specified indices, inclusive.

    Overrides:
    :   `removeRange` in class `Array<T>`
  + ### removeAll

    public boolean removeAll([Array](Array.html "class in zombie.entity.util")<? extends [T](#type-param-T "type parameter in SnapshotArray")> array,
    boolean identity)

    Description copied from class: `Array`

    Removes from this array all of elements contained in the specified array.

    Overrides:
    :   `removeAll` in class `Array<T>`

    Parameters:
    :   `identity` - True to use ==, false to use .equals().

    Returns:
    :   true if this array was modified.
  + ### pop

    public [T](#type-param-T "type parameter in SnapshotArray") pop()

    Description copied from class: `Array`

    Removes and returns the last item.

    Overrides:
    :   `pop` in class `Array<T>`
  + ### clear

    public void clear()

    Overrides:
    :   `clear` in class `Array<T>`
  + ### sort

    public void sort()

    Description copied from class: `Array`

    Sorts this array. The array elements must implement [`Comparable`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Comparable.html "class or interface in java.lang"). This method is not thread safe (uses
    `Sort.instance()`).

    Overrides:
    :   `sort` in class `Array<T>`
  + ### sort

    public void sort([Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<? super [T](#type-param-T "type parameter in SnapshotArray")> comparator)

    Description copied from class: `Array`

    Sorts the array. This method is not thread safe (uses `Sort.instance()`).

    Overrides:
    :   `sort` in class `Array<T>`
  + ### reverse

    public void reverse()

    Overrides:
    :   `reverse` in class `Array<T>`
  + ### shuffle

    public void shuffle()

    Overrides:
    :   `shuffle` in class `Array<T>`
  + ### truncate

    public void truncate(int newSize)

    Description copied from class: `Array`

    Reduces the size of the array to the specified size. If the array is already smaller than the specified size, no action is
    taken.

    Overrides:
    :   `truncate` in class `Array<T>`
  + ### setSize

    public [T](#type-param-T "type parameter in SnapshotArray")[] setSize(int newSize)

    Description copied from class: `Array`

    Sets the array size, leaving any values beyond the current size null.

    Overrides:
    :   `setSize` in class `Array<T>`

    Returns:
    :   [`Array.items`](Array.html#items)
  + ### with

    public static <T> [SnapshotArray](SnapshotArray.html "class in zombie.entity.util")<T> with(T... array)