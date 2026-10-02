[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.util.assoc](package-summary.html)
2. [AssocEnumArray](AssocEnumArray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [keys](#keys)
6. [Constructor Details](#constructor-detail)
   1. [AssocEnumArray(Class)](#%3Cinit%3E(java.lang.Class))
   2. [AssocEnumArray(Class, int)](#%3Cinit%3E(java.lang.Class,int))
7. [Method Details](#method-detail)
   1. [equalsKeys(AssocEnumArray)](#equalsKeys(zombie.entity.util.assoc.AssocEnumArray))
   2. [keys()](#keys())
   3. [containsKey(K)](#containsKey(K))
   4. [put(K, V)](#put(K,V))
   5. [add(K, V)](#add(K,V))
   6. [add(int, K, V)](#add(int,K,V))
   7. [removeIndex(int)](#removeIndex(int))
   8. [equals(Object)](#equals(java.lang.Object))
   9. [remove(K)](#remove(K))
   10. [clear()](#clear())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AssocEnumArray<K extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<K>, V>
================================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.util.assoc.AssocArray](AssocArray.html "class in zombie.entity.util.assoc")<K,V>

zombie.entity.util.assoc.AssocEnumArray<K,V>

---

public class AssocEnumArray<K extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<K>, V>
extends [AssocArray](AssocArray.html "class in zombie.entity.util.assoc")<K,V>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final EnumSet<K>`

  `keys`

  ### Fields inherited from class [AssocArray](AssocArray.html#field-summary "class in zombie.entity.util.assoc")

  `elementData, modCount`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AssocEnumArray(Class<K> enumType)`

  `AssocEnumArray(Class<K> enumType,
  int initialCapacity)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

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

  `void`

  `clear()`

  `boolean`

  `containsKey(K o)`

  Returns `true` if this list contains the specified key.

  `boolean`

  `equals(Object o)`

  `boolean`

  `equalsKeys(AssocEnumArray<K,V> other)`

  `Iterator<K>`

  `keys()`

  `V`

  `put(K k,
  V v)`

  Associates the specified value with the specified key in this list.

  `V`

  `remove(K o)`

  Removes the first occurrence of the specified key value pair from this list,
  if it is present.

  `V`

  `removeIndex(int frontIndex)`

  Removes the key value pair at the specified position in this list.

  ### Methods inherited from class [AssocArray](AssocArray.html#method-summary "class in zombie.entity.util.assoc")

  `addAll, containsValue, debugPrint, ensureCapacity, fastRemove, forEach, get, getBackingSize, getKey, getValue, hashCode, hashCodeRange, indexOfKey, indexOfRange, indexOfValue, isEmpty, keyAt, keyData, lastIndexOfKey, lastIndexOfRange, lastIndexOfValue, putAll, realKeyIndex, realSize, realValueIndex, set, setAll, size, trimToSize, valueAt, valueData`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### keys

    private final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[K](#type-param-K "type parameter in AssocEnumArray") extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[K](#type-param-K "type parameter in AssocEnumArray")>> keys
* Constructor Details
  -------------------

  + ### AssocEnumArray

    public AssocEnumArray([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<[K](#type-param-K "type parameter in AssocEnumArray")> enumType)
  + ### AssocEnumArray

    public AssocEnumArray([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<[K](#type-param-K "type parameter in AssocEnumArray")> enumType,
    int initialCapacity)
* Method Details
  --------------

  + ### equalsKeys

    public boolean equalsKeys([AssocEnumArray](AssocEnumArray.html "class in zombie.entity.util.assoc")<[K](#type-param-K "type parameter in AssocEnumArray"),[V](#type-param-V "type parameter in AssocEnumArray")> other)
  + ### keys

    public [Iterator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Iterator.html "class or interface in java.util")<[K](#type-param-K "type parameter in AssocEnumArray")> keys()
  + ### containsKey

    public boolean containsKey([K](#type-param-K "type parameter in AssocEnumArray") o)

    Description copied from class: `AssocArray`

    Returns `true` if this list contains the specified key.
    More formally, returns `true` if and only if this list contains
    at least one key `e` such that
    `Objects.equals(o, e)`.

    Overrides:
    :   `containsKey` in class `AssocArray<K extends Enum<K>, V>`

    Parameters:
    :   `o` - key whose presence in this list is to be tested

    Returns:
    :   `true` if this list contains the specified element
  + ### put

    public [V](#type-param-V "type parameter in AssocEnumArray") put([K](#type-param-K "type parameter in AssocEnumArray") k,
    [V](#type-param-V "type parameter in AssocEnumArray") v)

    Description copied from class: `AssocArray`

    Associates the specified value with the specified key in this list.
    If the list previously contained a mapping for the key, the old
    value is replaced.

    Overrides:
    :   `put` in class `AssocArray<K extends Enum<K>, V>`

    Parameters:
    :   `k` - key with which the specified value is to be associated
    :   `v` - value to be associated with the specified key

    Returns:
    :   the previous value associated with `key`, or
        `null` if there was no mapping for `key`.
        (A `null` return can also indicate that the map
        previously associated `null` with `key`.)
  + ### add

    public boolean add([K](#type-param-K "type parameter in AssocEnumArray") k,
    [V](#type-param-V "type parameter in AssocEnumArray") v)

    Description copied from class: `AssocArray`

    Appends the specified key value pair to the end of this list.

    Overrides:
    :   `add` in class `AssocArray<K extends Enum<K>, V>`

    Parameters:
    :   `k` - key to append
    :   `v` - value to append

    Returns:
    :   `true` (as specified by [`Collection.add(E)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html#add(E) "class or interface in java.util"))
  + ### add

    public void add(int frontIndex,
    [K](#type-param-K "type parameter in AssocEnumArray") k,
    [V](#type-param-V "type parameter in AssocEnumArray") v)

    Description copied from class: `AssocArray`

    Inserts the specified key value pair at the specified position in this
    list. Shifts the key value pairs currently at that position (if any) and
    any subsequent key value pairs to the right (adds one to their indices).

    Overrides:
    :   `add` in class `AssocArray<K extends Enum<K>, V>`

    Parameters:
    :   `frontIndex` - index at which the specified element is to be inserted
    :   `k` - key to be inserted
    :   `v` - value to be inserted
  + ### removeIndex

    public [V](#type-param-V "type parameter in AssocEnumArray") removeIndex(int frontIndex)

    Description copied from class: `AssocArray`

    Removes the key value pair at the specified position in this list.
    Shifts any subsequent key value pairs to the left (subtracts one from their
    indices).

    Overrides:
    :   `removeIndex` in class `AssocArray<K extends Enum<K>, V>`

    Parameters:
    :   `frontIndex` - the index of the key to be removed

    Returns:
    :   the value that was removed from the list
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Overrides:
    :   `equals` in class `AssocArray<K extends Enum<K>, V>`
  + ### remove

    public [V](#type-param-V "type parameter in AssocEnumArray") remove([K](#type-param-K "type parameter in AssocEnumArray") o)

    Description copied from class: `AssocArray`

    Removes the first occurrence of the specified key value pair from this list,
    if it is present. If the list does not contain the key, it is
    unchanged. More formally, removes the key with the lowest index
    `i` such that
    `Objects.equals(o, get(i))`
    (if such an key exists). Returns `value` if this list
    contained the specified key (or equivalently, if this list
    changed as a result of the call).

    Overrides:
    :   `remove` in class `AssocArray<K extends Enum<K>, V>`

    Parameters:
    :   `o` - key to be removed from this list, if present

    Returns:
    :   `value` if this list contained the specified element
  + ### clear

    public void clear()

    Overrides:
    :   `clear` in class `AssocArray<K extends Enum<K>, V>`