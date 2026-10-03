[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [se.krka.kahlua.vm](package-summary.html)
2. [KahluaArray](KahluaArray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [metatable](#metatable)
   2. [data](#data)
   3. [len](#len)
   4. [recalculateLen](#recalculateLen)
6. [Constructor Details](#constructor-detail)
   1. [KahluaArray()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getString(String)](#getString(java.lang.String))
   2. [size()](#size())
   3. [len()](#len())
   4. [iterator()](#iterator())
   5. [isEmpty()](#isEmpty())
   6. [wipe()](#wipe())
   7. [rawget(int)](#rawget(int))
   8. [rawset(int, Object)](#rawset(int,java.lang.Object))
   9. [getKeyIndex(Object)](#getKeyIndex(java.lang.Object))
   10. [rawget(Object)](#rawget(java.lang.Object))
   11. [rawset(Object, Object)](#rawset(java.lang.Object,java.lang.Object))
   12. [next(Object)](#next(java.lang.Object))
   13. [getMetatable()](#getMetatable())
   14. [setMetatable(KahluaTable)](#setMetatable(se.krka.kahlua.vm.KahluaTable))
   15. [getJavaClass()](#getJavaClass())
   16. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   17. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   18. [save(DataOutputStream)](#save(java.io.DataOutputStream))
   19. [load(DataInputStream, int)](#load(java.io.DataInputStream,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class KahluaArray
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

se.krka.kahlua.vm.KahluaArray

All Implemented Interfaces:
:   `se.krka.kahlua.vm.KahluaTable`

---

public class KahluaArray
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements se.krka.kahlua.vm.KahluaTable

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private Object[]`

  `data`

  `private int`

  `len`

  `private se.krka.kahlua.vm.KahluaTable`

  `metatable`

  `private boolean`

  `recalculateLen`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `KahluaArray()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Class<?>`

  `getJavaClass()`

  `private int`

  `getKeyIndex(Object key)`

  `se.krka.kahlua.vm.KahluaTable`

  `getMetatable()`

  `String`

  `getString(String string)`

  `boolean`

  `isEmpty()`

  `se.krka.kahlua.vm.KahluaTableIterator`

  `iterator()`

  `int`

  `len()`

  `void`

  `load(DataInputStream input,
  int WorldVersion)`

  `void`

  `load(ByteBuffer input,
  int WorldVersion)`

  `Object`

  `next(Object key)`

  `Object`

  `rawget(int index)`

  `Object`

  `rawget(Object key)`

  `void`

  `rawset(int index,
  Object value)`

  `void`

  `rawset(Object key,
  Object value)`

  `void`

  `save(DataOutputStream output)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setMetatable(se.krka.kahlua.vm.KahluaTable metatable)`

  `int`

  `size()`

  `void`

  `wipe()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### metatable

    private se.krka.kahlua.vm.KahluaTable metatable
  + ### data

    private [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] data
  + ### len

    private int len
  + ### recalculateLen

    private boolean recalculateLen
* Constructor Details
  -------------------

  + ### KahluaArray

    public KahluaArray()
* Method Details
  --------------

  + ### getString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)

    Specified by:
    :   `getString` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### size

    public int size()

    Specified by:
    :   `size` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### len

    public int len()

    Specified by:
    :   `len` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### iterator

    public se.krka.kahlua.vm.KahluaTableIterator iterator()

    Specified by:
    :   `iterator` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### isEmpty

    public boolean isEmpty()

    Specified by:
    :   `isEmpty` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### wipe

    public void wipe()

    Specified by:
    :   `wipe` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### rawget

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") rawget(int index)

    Specified by:
    :   `rawget` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### rawset

    public void rawset(int index,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") value)

    Specified by:
    :   `rawset` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### getKeyIndex

    private int getKeyIndex([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### rawget

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") rawget([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)

    Specified by:
    :   `rawget` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### rawset

    public void rawset([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") value)

    Specified by:
    :   `rawset` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### next

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") next([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") key)
  + ### getMetatable

    public se.krka.kahlua.vm.KahluaTable getMetatable()

    Specified by:
    :   `getMetatable` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### setMetatable

    public void setMetatable(se.krka.kahlua.vm.KahluaTable metatable)

    Specified by:
    :   `setMetatable` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### getJavaClass

    public [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> getJavaClass()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    Specified by:
    :   `save` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int WorldVersion)

    Specified by:
    :   `load` in interface `se.krka.kahlua.vm.KahluaTable`
  + ### save

    public void save([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `save` in interface `se.krka.kahlua.vm.KahluaTable`

    Throws:
    :   `IOException`
  + ### load

    public void load([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input,
    int WorldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Specified by:
    :   `load` in interface `se.krka.kahlua.vm.KahluaTable`

    Throws:
    :   `IOException`