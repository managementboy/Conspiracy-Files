[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.util.list](package-summary.html)
2. [PZConvertArray](PZConvertArray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [array](#array)
   2. [converterSt](#converterSt)
   3. [converterTs](#converterTs)
6. [Constructor Details](#constructor-detail)
   1. [PZConvertArray(S[], Function)](#%3Cinit%3E(S%5B%5D,java.util.function.Function))
   2. [PZConvertArray(S[], Function, Function)](#%3Cinit%3E(S%5B%5D,java.util.function.Function,java.util.function.Function))
7. [Method Details](#method-detail)
   1. [isReadonly()](#isReadonly())
   2. [size()](#size())
   3. [toArray()](#toArray())
   4. [toArray(R[])](#toArray(R%5B%5D))
   5. [get(int)](#get(int))
   6. [set(int, T)](#set(int,T))
   7. [setS(int, S)](#setS(int,S))
   8. [indexOf(Object)](#indexOf(java.lang.Object))
   9. [objectsEqual(Object, Object)](#objectsEqual(java.lang.Object,java.lang.Object))
   10. [contains(Object)](#contains(java.lang.Object))
   11. [forEach(Consumer)](#forEach(java.util.function.Consumer))
   12. [replaceAll(UnaryOperator)](#replaceAll(java.util.function.UnaryOperator))
   13. [sort(Comparator)](#sort(java.util.Comparator))
   14. [convertST(S)](#convertST(S))
   15. [convertTS(T)](#convertTS(T))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PZConvertArray<S,T>
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.util.AbstractCollection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractCollection.html "class or interface in java.util")<T>

[java.util.AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html "class or interface in java.util")<T>

zombie.util.list.PZConvertArray<S,T>

All Implemented Interfaces:
:   `Iterable<T>, Collection<T>, List<T>, RandomAccess, SequencedCollection<T>`

---

public final class PZConvertArray<S,T>
extends [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html "class or interface in java.util")<T>
implements [RandomAccess](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/RandomAccess.html "class or interface in java.util")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final S[]`

  `array`

  `private final Function<S,T>`

  `converterSt`

  `private final Function<T,S>`

  `converterTs`

  ### Fields inherited from class [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html#field-summary "class or interface in java.util")

  `modCount`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PZConvertArray(S[] array,
  Function<S,T> converterSt)`

  Create a read-only list converter

  `PZConvertArray(S[] array,
  Function<S,T> converterSt,
  Function<T,S> converterTs)`

  Create a read-write list converter
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `contains(Object o)`

  `private T`

  `convertST(S s)`

  `private S`

  `convertTS(T t)`

  `void`

  `forEach(Consumer<? super T> action)`

  `T`

  `get(int index)`

  `int`

  `indexOf(Object val)`

  `boolean`

  `isReadonly()`

  `private static boolean`

  `objectsEqual(Object a,
  Object b)`

  `void`

  `replaceAll(UnaryOperator<T> operator)`

  `T`

  `set(int index,
  T element)`

  `S`

  `setS(int index,
  S element)`

  `int`

  `size()`

  `void`

  `sort(Comparator<? super T> c)`

  `Object[]`

  `toArray()`

  `<R> R[]`

  `toArray(R[] result)`

  ### Methods inherited from class [AbstractList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractList.html#method-summary "class or interface in java.util")

  `add, add, addAll, clear, equals, hashCode, iterator, lastIndexOf, listIterator, listIterator, remove, removeRange, subList`

  ### Methods inherited from class [AbstractCollection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/AbstractCollection.html#method-summary "class or interface in java.util")

  `addAll, containsAll, isEmpty, remove, removeAll, retainAll, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

  ### Methods inherited from interface [Collection](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Collection.html#method-summary "class or interface in java.util")

  `parallelStream, removeIf, stream, toArray`

  ### Methods inherited from interface [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html#method-summary "class or interface in java.util")

  `addAll, addFirst, addLast, containsAll, getFirst, getLast, isEmpty, remove, removeAll, removeFirst, removeLast, retainAll, reversed, spliterator`

* Field Details
  -------------

  + ### array

    private final [S](#type-param-S "type parameter in PZConvertArray")[] array
  + ### converterSt

    private final [Function](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Function.html "class or interface in java.util.function")<[S](#type-param-S "type parameter in PZConvertArray"),[T](#type-param-T "type parameter in PZConvertArray")> converterSt
  + ### converterTs

    private final [Function](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Function.html "class or interface in java.util.function")<[T](#type-param-T "type parameter in PZConvertArray"),[S](#type-param-S "type parameter in PZConvertArray")> converterTs
* Constructor Details
  -------------------

  + ### PZConvertArray

    public PZConvertArray([S](#type-param-S "type parameter in PZConvertArray")[] array,
    [Function](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Function.html "class or interface in java.util.function")<[S](#type-param-S "type parameter in PZConvertArray"),[T](#type-param-T "type parameter in PZConvertArray")> converterSt)

    Create a read-only list converter
  + ### PZConvertArray

    public PZConvertArray([S](#type-param-S "type parameter in PZConvertArray")[] array,
    [Function](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Function.html "class or interface in java.util.function")<[S](#type-param-S "type parameter in PZConvertArray"),[T](#type-param-T "type parameter in PZConvertArray")> converterSt,
    [Function](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Function.html "class or interface in java.util.function")<[T](#type-param-T "type parameter in PZConvertArray"),[S](#type-param-S "type parameter in PZConvertArray")> converterTs)

    Create a read-write list converter
* Method Details
  --------------

  + ### isReadonly

    public boolean isReadonly()
  + ### size

    public int size()

    Specified by:
    :   `size` in interface `Collection<S>`

    Specified by:
    :   `size` in interface `List<S>`

    Specified by:
    :   `size` in class `AbstractCollection<T>`
  + ### toArray

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] toArray()

    Specified by:
    :   `toArray` in interface `Collection<S>`

    Specified by:
    :   `toArray` in interface `List<S>`

    Overrides:
    :   `toArray` in class `AbstractCollection<T>`
  + ### toArray

    public <R> R[] toArray(R[] result)

    Specified by:
    :   `toArray` in interface `Collection<S>`

    Specified by:
    :   `toArray` in interface `List<S>`

    Overrides:
    :   `toArray` in class `AbstractCollection<T>`
  + ### get

    public [T](#type-param-T "type parameter in PZConvertArray") get(int index)

    Specified by:
    :   `get` in interface `List<S>`

    Specified by:
    :   `get` in class `AbstractList<T>`
  + ### set

    public [T](#type-param-T "type parameter in PZConvertArray") set(int index,
    [T](#type-param-T "type parameter in PZConvertArray") element)

    Specified by:
    :   `set` in interface `List<S>`

    Overrides:
    :   `set` in class `AbstractList<T>`
  + ### setS

    public [S](#type-param-S "type parameter in PZConvertArray") setS(int index,
    [S](#type-param-S "type parameter in PZConvertArray") element)
  + ### indexOf

    public int indexOf([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") val)

    Specified by:
    :   `indexOf` in interface `List<S>`

    Overrides:
    :   `indexOf` in class `AbstractList<T>`
  + ### objectsEqual

    private static boolean objectsEqual([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") a,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") b)
  + ### contains

    public boolean contains([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `contains` in interface `Collection<S>`

    Specified by:
    :   `contains` in interface `List<S>`

    Overrides:
    :   `contains` in class `AbstractCollection<T>`
  + ### forEach

    public void forEach([Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<? super [T](#type-param-T "type parameter in PZConvertArray")> action)

    Specified by:
    :   `forEach` in interface `Iterable<S>`
  + ### replaceAll

    public void replaceAll([UnaryOperator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/UnaryOperator.html "class or interface in java.util.function")<[T](#type-param-T "type parameter in PZConvertArray")> operator)

    Specified by:
    :   `replaceAll` in interface `List<S>`
  + ### sort

    public void sort([Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<? super [T](#type-param-T "type parameter in PZConvertArray")> c)

    Specified by:
    :   `sort` in interface `List<S>`
  + ### convertST

    private [T](#type-param-T "type parameter in PZConvertArray") convertST([S](#type-param-S "type parameter in PZConvertArray") s)
  + ### convertTS

    private [S](#type-param-S "type parameter in PZConvertArray") convertTS([T](#type-param-T "type parameter in PZConvertArray") t)