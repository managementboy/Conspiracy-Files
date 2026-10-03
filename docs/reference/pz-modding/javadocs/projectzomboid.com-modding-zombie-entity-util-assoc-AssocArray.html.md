[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.util.assoc](package-summary.html)
2. [AssocArray](AssocArray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [DEFAULT\_CAPACITY](#DEFAULT_CAPACITY)
   2. [EMPTY\_ELEMENTDATA](#EMPTY_ELEMENTDATA)
   3. [DEFAULTCAPACITY\_EMPTY\_ELEMENTDATA](#DEFAULTCAPACITY_EMPTY_ELEMENTDATA)
   4. [elementData](#elementData)
   5. [size](#size)
   6. [modCount](#modCount)
6. [Constructor Details](#constructor-detail)
   1. [AssocArray(int)](#%3Cinit%3E(int))
   2. [AssocArray()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [trimToSize()](#trimToSize())
   2. [ensureCapacity(int)](#ensureCapacity(int))
   3. [grow(int)](#grow(int))
   4. [grow()](#grow())
   5. [getBackingSize()](#getBackingSize())
   6. [size()](#size())
   7. [realSize()](#realSize())
   8. [realKeyIndex(int)](#realKeyIndex(int))
   9. [realValueIndex(int)](#realValueIndex(int))
   10. [isEmpty()](#isEmpty())
   11. [containsKey(K)](#containsKey(K))
   12. [containsValue(V)](#containsValue(V))
   13. [indexOfKey(K)](#indexOfKey(K))
   14. [indexOfValue(V)](#indexOfValue(V))
   15. [indexOfRange(Object, int, int, int)](#indexOfRange(java.lang.Object,int,int,int))
   16. [lastIndexOfKey(K)](#lastIndexOfKey(K))
   17. [lastIndexOfValue(V)](#lastIndexOfValue(V))
   18. [lastIndexOfRange(Object, int, int, int)](#lastIndexOfRange(java.lang.Object,int,int,int))
   19. [keyData(int)](#keyData(int))
   20. [valueData(int)](#valueData(int))
   21. [valueAt(Object[], int)](#valueAt(java.lang.Object%5B%5D,int))
   22. [keyAt(Object[], int)](#keyAt(java.lang.Object%5B%5D,int))
   23. [getKey(int)](#getKey(int))
   24. [getValue(int)](#getValue(int))
   25. [set(K, V)](#set(K,V))
   26. [setInternal(int, V)](#setInternal(int,V))
   27. [put(K, V)](#put(K,V))
   28. [get(K)](#get(K))
   29. [add(K, V, Object[], int)](#add(K,V,java.lang.Object%5B%5D,int))
   30. [add(K, V)](#add(K,V))
   31. [add(int, K, V)](#add(int,K,V))
   32. [removeIndex(int)](#removeIndex(int))
   33. [equals(Object)](#equals(java.lang.Object))
   34. [checkForComodification(int)](#checkForComodification(int))
   35. [hashCode()](#hashCode())
   36. [hashCodeRange(int, int)](#hashCodeRange(int,int))
   37. [remove(K)](#remove(K))
   38. [fastRemove(Object[], int)](#fastRemove(java.lang.Object%5B%5D,int))
   39. [clear()](#clear())
   40. [putAll(AssocArray)](#putAll(zombie.entity.util.assoc.AssocArray))
   41. [addAll(AssocArray)](#addAll(zombie.entity.util.assoc.AssocArray))
   42. [setAll(AssocArray)](#setAll(zombie.entity.util.assoc.AssocArray))
   43. [rangeCheckForAdd(int)](#rangeCheckForAdd(int))
   44. [outOfBoundsMsg(int)](#outOfBoundsMsg(int))
   45. [outOfBoundsMsg(int, int)](#outOfBoundsMsg(int,int))
   46. [forEach(BiConsumer)](#forEach(java.util.function.BiConsumer))
   47. [debugPrint()](#debugPrint())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AssocArray<K,V>
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.util.assoc.AssocArray<K,V>

Direct Known Subclasses:
:   `AssocEnumArray`

---

public class AssocArray<K,V>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

List/Map that stores Key/Values in a single backed Array.
Class is a modified version of ArrayList with limited functionality,
combined with a few 'Map' and custom methods.
Iterators are not present, but the list can be iterated as you would an array (for i=0;iinvalid input: '<'size;i++)
However forEach can optionally be used.
NOTE: AssocArray requires keys as well as values to be NonNull.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final int`

  `DEFAULT_CAPACITY`

  `private static final Object[]`

  `DEFAULTCAPACITY_EMPTY_ELEMENTDATA`

  Shared empty array instance used for default sized empty instances.

  `(package private) Object[]`

  `elementData`

  The array buffer into which the elements of the AssocArray are stored.

  `private static final Object[]`

  `EMPTY_ELEMENTDATA`

  Shared empty array instance used for empty instances.

  `protected int`

  `modCount`

  `private int`

  `size`

  The size of the AssocArray (the number of elements it contains).
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AssocArray()`

  Constructs an empty list with an initial capacity of ten.

  `AssocArray(int initialCapacity)`

  Constructs an empty list with the specified initial capacity.
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(int frontIndex,
  K k,
  V v)`

  Inserts the specified key value pair at the specified position in this
  list.

  `boolean`

  `add(K k,
  V v)`

  Appends the specified key value pair to the end of this list.

  `private void`

  `add(K k,
  V v,
  Object[] elementData,
  int s)`

  This helper method split out from add(K, V) to keep method
  bytecode size under 35 (the -XX:MaxInlineSize default value),
  which helps when add(K, V) is called in a C1-compiled loop.

  `void`

  `addAll(AssocArray<K,V> other)`

  Attempts to add all key value pairs from supplied AssocArray in this AssocArray
  Any non existing keys in this AssocArray are added.

  `private void`

  `checkForComodification(int expectedModCount)`

  `void`

  `clear()`

  `boolean`

  `containsKey(K o)`

  Returns `true` if this list contains the specified key.

  `boolean`

  `containsValue(V o)`

  Returns `true` if this list contains the specified value.

  `protected void`

  `debugPrint()`

  `void`

  `ensureCapacity(int minCapacity)`

  Increases the capacity of this `AssocArray` instance, if
  necessary, to ensure that it can hold at least the number of elements
  specified by the minimum capacity argument.

  `boolean`

  `equals(Object o)`

  `protected void`

  `fastRemove(Object[] es,
  int realIndex)`

  `void`

  `forEach(BiConsumer<? super K, ? super V> action)`

  `V`

  `get(K k)`

  Returns the value to which the specified key is mapped,
  or `null` if this map contains no mapping for the key.

  `protected int`

  `getBackingSize()`

  `K`

  `getKey(int frontIndex)`

  Returns the key at the specified position in this list.

  `V`

  `getValue(int frontIndex)`

  Returns the value at the specified position in this list.

  `private Object[]`

  `grow()`

  `private Object[]`

  `grow(int minCapacity)`

  Increases the capacity to ensure that it can hold at least the
  number of elements specified by the minimum capacity argument.

  `int`

  `hashCode()`

  `(package private) int`

  `hashCodeRange(int from,
  int to)`

  `int`

  `indexOfKey(K o)`

  Returns the index of the first occurrence of the specified key
  in this list, or -1 if this list does not contain the key.

  `(package private) int`

  `indexOfRange(Object o,
  int start,
  int end,
  int offset)`

  `int`

  `indexOfValue(V o)`

  Returns the index of the first occurrence of the specified value
  in this list, or -1 if this list does not contain the value.

  `boolean`

  `isEmpty()`

  Returns `true` if this list contains no elements.

  `(package private) static <E> E`

  `keyAt(Object[] es,
  int index)`

  `(package private) K`

  `keyData(int frontIndex)`

  `int`

  `lastIndexOfKey(K o)`

  Returns the index of the last occurrence of the specified key
  in this list, or -1 if this list does not contain the key.

  `(package private) int`

  `lastIndexOfRange(Object o,
  int start,
  int end,
  int offset)`

  `int`

  `lastIndexOfValue(V o)`

  Returns the index of the last occurrence of the specified value
  in this list, or -1 if this list does not contain the value.

  `private String`

  `outOfBoundsMsg(int fontIndex)`

  `private static String`

  `outOfBoundsMsg(int fromIndex,
  int toIndex)`

  `V`

  `put(K k,
  V v)`

  Associates the specified value with the specified key in this list.

  `void`

  `putAll(AssocArray<K,V> other)`

  Puts all key value pairs from supplied AssocArray in this AssocArray
  Any non existing keys in this AssocArray are added.

  `private void`

  `rangeCheckForAdd(int frontIndex)`

  `protected int`

  `realKeyIndex(int index)`

  `protected int`

  `realSize()`

  `protected int`

  `realValueIndex(int index)`

  `V`

  `remove(K o)`

  Removes the first occurrence of the specified key value pair from this list,
  if it is present.

  `V`

  `removeIndex(int frontIndex)`

  Removes the key value pair at the specified position in this list.

  `V`

  `set(K k,
  V v)`

  Replaces the value at the specified key position in this list with
  the specified value.

  `void`

  `setAll(AssocArray<K,V> other)`

  Attempts to set all key value pairs from supplied AssocArray in this AssocArray
  Any non existing keys in this AssocArray are ignored.

  `private V`

  `setInternal(int frontIndex,
  V v)`

  `int`

  `size()`

  Returns the number of key value pairs in this list.

  `void`

  `trimToSize()`

  Trims the capacity of this `AssocArray` instance to be the
  list's current size.

  `(package private) static <E> E`

  `valueAt(Object[] es,
  int index)`

  `(package private) V`

  `valueData(int frontIndex)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DEFAULT\_CAPACITY

    private static final int DEFAULT\_CAPACITY

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.util.assoc.AssocArray.DEFAULT_CAPACITY)
  + ### EMPTY\_ELEMENTDATA

    private static final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] EMPTY\_ELEMENTDATA

    Shared empty array instance used for empty instances.
  + ### DEFAULTCAPACITY\_EMPTY\_ELEMENTDATA

    private static final [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] DEFAULTCAPACITY\_EMPTY\_ELEMENTDATA

    Shared empty array instance used for default sized empty instances. We
    distinguish this from EMPTY\_ELEMENTDATA to know how much to inflate when
    first element is added.
  + ### elementData

    transient [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] elementData

    The array buffer into which the elements of the AssocArray are stored.
    The capacity of the AssocArray is the length of this array buffer. Any
    empty AssocArray with elementData == DEFAULTCAPACITY\_EMPTY\_ELEMENTDATA
    will be expanded to DEFAULT\_CAPACITY when the first element is added.
  + ### size

    private int size

    The size of the AssocArray (the number of elements it contains).
  + ### modCount

    protected transient int modCount
* Constructor Details
  -------------------

  + ### AssocArray

    public AssocArray(int initialCapacity)

    Constructs an empty list with the specified initial capacity.

    Parameters:
    :   `initialCapacity` - the initial capacity of the list

    Throws:
    :   `IllegalArgumentException` - if the specified initial capacity
        is negative
  + ### AssocArray

    public AssocArray()

    Constructs an empty list with an initial capacity of ten.
* Method Details
  --------------

  + ### trimToSize

    public void trimToSize()

    Trims the capacity of this `AssocArray` instance to be the
    list's current size. An application can use this operation to minimize
    the storage of an `AssocArray` instance.
  + ### ensureCapacity

    public void ensureCapacity(int minCapacity)

    Increases the capacity of this `AssocArray` instance, if
    necessary, to ensure that it can hold at least the number of elements
    specified by the minimum capacity argument.

    Parameters:
    :   `minCapacity` - the desired minimum capacity
  + ### grow

    private [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] grow(int minCapacity)

    Increases the capacity to ensure that it can hold at least the
    number of elements specified by the minimum capacity argument.

    Parameters:
    :   `minCapacity` - the desired minimum capacity

    Throws:
    :   `OutOfMemoryError` - if minCapacity is less than zero
  + ### grow

    private [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] grow()
  + ### getBackingSize

    protected int getBackingSize()
  + ### size

    public int size()

    Returns the number of key value pairs in this list.

    Returns:
    :   the number of key value pairs in this list
  + ### realSize

    protected int realSize()
  + ### realKeyIndex

    protected int realKeyIndex(int index)
  + ### realValueIndex

    protected int realValueIndex(int index)
  + ### isEmpty

    public boolean isEmpty()

    Returns `true` if this list contains no elements.

    Returns:
    :   `true` if this list contains no elements
  + ### containsKey

    public boolean containsKey([K](#type-param-K "type parameter in AssocArray") o)

    Returns `true` if this list contains the specified key.
    More formally, returns `true` if and only if this list contains
    at least one key `e` such that
    `Objects.equals(o, e)`.

    Parameters:
    :   `o` - key whose presence in this list is to be tested

    Returns:
    :   `true` if this list contains the specified element
  + ### containsValue

    public boolean containsValue([V](#type-param-V "type parameter in AssocArray") o)

    Returns `true` if this list contains the specified value.
    More formally, returns `true` if and only if this list contains
    at least one value`e` such that
    `Objects.equals(o, e)`.

    Parameters:
    :   `o` - value whose presence in this list is to be tested

    Returns:
    :   `true` if this list contains the specified element
  + ### indexOfKey

    public int indexOfKey([K](#type-param-K "type parameter in AssocArray") o)

    Returns the index of the first occurrence of the specified key
    in this list, or -1 if this list does not contain the key.
    More formally, returns the lowest index `i` such that
    `Objects.equals(o, get(i))`,
    or -1 if there is no such index.
  + ### indexOfValue

    public int indexOfValue([V](#type-param-V "type parameter in AssocArray") o)

    Returns the index of the first occurrence of the specified value
    in this list, or -1 if this list does not contain the value.
    More formally, returns the lowest index `i` such that
    `Objects.equals(o, get(i))`,
    or -1 if there is no such index.
  + ### indexOfRange

    int indexOfRange([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    int start,
    int end,
    int offset)
  + ### lastIndexOfKey

    public int lastIndexOfKey([K](#type-param-K "type parameter in AssocArray") o)

    Returns the index of the last occurrence of the specified key
    in this list, or -1 if this list does not contain the key.
    More formally, returns the highest index `i` such that
    `Objects.equals(o, get(i))`,
    or -1 if there is no such index.
  + ### lastIndexOfValue

    public int lastIndexOfValue([V](#type-param-V "type parameter in AssocArray") o)

    Returns the index of the last occurrence of the specified value
    in this list, or -1 if this list does not contain the value.
    More formally, returns the highest index `i` such that
    `Objects.equals(o, get(i))`,
    or -1 if there is no such index.
  + ### lastIndexOfRange

    int lastIndexOfRange([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o,
    int start,
    int end,
    int offset)
  + ### keyData

    [K](#type-param-K "type parameter in AssocArray") keyData(int frontIndex)
  + ### valueData

    [V](#type-param-V "type parameter in AssocArray") valueData(int frontIndex)
  + ### valueAt

    static <E> E valueAt([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] es,
    int index)
  + ### keyAt

    static <E> E keyAt([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] es,
    int index)
  + ### getKey

    public [K](#type-param-K "type parameter in AssocArray") getKey(int frontIndex)

    Returns the key at the specified position in this list.

    Parameters:
    :   `frontIndex` - index of the key to return

    Returns:
    :   the key at the specified position in this list
  + ### getValue

    public [V](#type-param-V "type parameter in AssocArray") getValue(int frontIndex)

    Returns the value at the specified position in this list.

    Parameters:
    :   `frontIndex` - index of the value to return

    Returns:
    :   the value at the specified position in this list
  + ### set

    public [V](#type-param-V "type parameter in AssocArray") set([K](#type-param-K "type parameter in AssocArray") k,
    [V](#type-param-V "type parameter in AssocArray") v)

    Replaces the value at the specified key position in this list with
    the specified value.

    Parameters:
    :   `k` - key of the value to replace
    :   `v` - value to be stored at the specified key

    Returns:
    :   the value previously at the specified position
  + ### setInternal

    private [V](#type-param-V "type parameter in AssocArray") setInternal(int frontIndex,
    [V](#type-param-V "type parameter in AssocArray") v)
  + ### put

    public [V](#type-param-V "type parameter in AssocArray") put([K](#type-param-K "type parameter in AssocArray") k,
    [V](#type-param-V "type parameter in AssocArray") v)

    Associates the specified value with the specified key in this list.
    If the list previously contained a mapping for the key, the old
    value is replaced.

    Parameters:
    :   `k` - key with which the specified value is to be associated
    :   `v` - value to be associated with the specified key

    Returns:
    :   the previous value associated with `key`, or
        `null` if there was no mapping for `key`.
        (A `null` return can also indicate that the map
        previously associated `null` with `key`.)
  + ### get

    public [V](#type-param-V "type parameter in AssocArray") get([K](#type-param-K "type parameter in AssocArray") k)

    Returns the value to which the specified key is mapped,
    or `null` if this map contains no mapping for the key.

    More formally, if this map contains a mapping from a key
    `k` to a value `v` such that `(key==null ? k==null :
    key.equals(k))`, then this method returns `v`; otherwise
    it returns `null`. (There can be at most one such mapping.)

    A return value of `null` does not *necessarily*
    indicate that the map contains no mapping for the key; it's also
    possible that the map explicitly maps the key to `null`.
    The [`containsKey`](#containsKey(K)) operation may be used to
    distinguish these two cases.

    See Also:
    :   - [`put(Object, Object)`](#put(K,V))
  + ### add

    private void add([K](#type-param-K "type parameter in AssocArray") k,
    [V](#type-param-V "type parameter in AssocArray") v,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] elementData,
    int s)

    This helper method split out from add(K, V) to keep method
    bytecode size under 35 (the -XX:MaxInlineSize default value),
    which helps when add(K, V) is called in a C1-compiled loop.
  + ### add

    public boolean add([K](#type-param-K "type parameter in AssocArray") k,
    [V](#type-param-V "type parameter in AssocArray") v)

    Appends the specified key value pair to the end of this list.

    Parameters:
    :   `k` - key to append
    :   `v` - value to append

    Returns:
    :   `true` (as specified by [`Collection.add(E)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html#add(E) "class or interface in java.util"))
  + ### add

    public void add(int frontIndex,
    [K](#type-param-K "type parameter in AssocArray") k,
    [V](#type-param-V "type parameter in AssocArray") v)

    Inserts the specified key value pair at the specified position in this
    list. Shifts the key value pairs currently at that position (if any) and
    any subsequent key value pairs to the right (adds one to their indices).

    Parameters:
    :   `frontIndex` - index at which the specified element is to be inserted
    :   `k` - key to be inserted
    :   `v` - value to be inserted
  + ### removeIndex

    public [V](#type-param-V "type parameter in AssocArray") removeIndex(int frontIndex)

    Removes the key value pair at the specified position in this list.
    Shifts any subsequent key value pairs to the left (subtracts one from their
    indices).

    Parameters:
    :   `frontIndex` - the index of the key to be removed

    Returns:
    :   the value that was removed from the list
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Overrides:
    :   `equals` in class `Object`
  + ### checkForComodification

    private void checkForComodification(int expectedModCount)
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### hashCodeRange

    int hashCodeRange(int from,
    int to)
  + ### remove

    public [V](#type-param-V "type parameter in AssocArray") remove([K](#type-param-K "type parameter in AssocArray") o)

    Removes the first occurrence of the specified key value pair from this list,
    if it is present. If the list does not contain the key, it is
    unchanged. More formally, removes the key with the lowest index
    `i` such that
    `Objects.equals(o, get(i))`
    (if such an key exists). Returns `value` if this list
    contained the specified key (or equivalently, if this list
    changed as a result of the call).

    Parameters:
    :   `o` - key to be removed from this list, if present

    Returns:
    :   `value` if this list contained the specified element
  + ### fastRemove

    protected void fastRemove([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] es,
    int realIndex)
  + ### clear

    public void clear()
  + ### putAll

    public void putAll([AssocArray](AssocArray.html "class in zombie.entity.util.assoc")<[K](#type-param-K "type parameter in AssocArray"),[V](#type-param-V "type parameter in AssocArray")> other)

    Puts all key value pairs from supplied AssocArray in this AssocArray
    Any non existing keys in this AssocArray are added.
    Keys existing in this AssocArray have their value overridden by value of supplied AssocArray.
  + ### addAll

    public void addAll([AssocArray](AssocArray.html "class in zombie.entity.util.assoc")<[K](#type-param-K "type parameter in AssocArray"),[V](#type-param-V "type parameter in AssocArray")> other)

    Attempts to add all key value pairs from supplied AssocArray in this AssocArray
    Any non existing keys in this AssocArray are added.
    Keys existing in this AssocArray will not be overridden and keep their original value.
  + ### setAll

    public void setAll([AssocArray](AssocArray.html "class in zombie.entity.util.assoc")<[K](#type-param-K "type parameter in AssocArray"),[V](#type-param-V "type parameter in AssocArray")> other)

    Attempts to set all key value pairs from supplied AssocArray in this AssocArray
    Any non existing keys in this AssocArray are ignored.
    Keys existing in this AssocArray have their value overridden by value of supplied AssocArray.
  + ### rangeCheckForAdd

    private void rangeCheckForAdd(int frontIndex)
  + ### outOfBoundsMsg

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outOfBoundsMsg(int fontIndex)
  + ### outOfBoundsMsg

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outOfBoundsMsg(int fromIndex,
    int toIndex)
  + ### forEach

    public void forEach([BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<? super [K](#type-param-K "type parameter in AssocArray"), ? super [V](#type-param-V "type parameter in AssocArray")> action)
  + ### debugPrint

    protected void debugPrint()