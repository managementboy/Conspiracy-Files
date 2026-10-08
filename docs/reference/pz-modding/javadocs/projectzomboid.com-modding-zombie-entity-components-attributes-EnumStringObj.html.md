[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [EnumStringObj](EnumStringObj.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [stringValues](#stringValues)
   2. [enumValues](#enumValues)
   3. [dirty](#dirty)
6. [Constructor Details](#constructor-detail)
   1. [EnumStringObj()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initialize(Class)](#initialize(java.lang.Class))
   2. [reset()](#reset())
   3. [getEnumValues()](#getEnumValues())
   4. [getStringValues()](#getStringValues())
   5. [equals(Object)](#equals(java.lang.Object))
   6. [toString()](#toString())
   7. [copy()](#copy())
   8. [sort()](#sort())
   9. [getSortedNames(ArrayList)](#getSortedNames(java.util.ArrayList))
   10. [size()](#size())
   11. [sizeEnums()](#sizeEnums())
   12. [sizeStrings()](#sizeStrings())
   13. [clear()](#clear())
   14. [isEmpty()](#isEmpty())
   15. [add(E)](#add(E))
   16. [add(String)](#add(java.lang.String))
   17. [remove(E)](#remove(E))
   18. [remove(String)](#remove(java.lang.String))
   19. [contains(E)](#contains(E))
   20. [contains(String)](#contains(java.lang.String))
   21. [removeAllStrings()](#removeAllStrings())
   22. [removeAllEnums()](#removeAllEnums())
   23. [addAll(boolean, EnumStringObj)](#addAll(boolean,zombie.entity.components.attributes.EnumStringObj))
   24. [addAll(EnumStringObj)](#addAll(zombie.entity.components.attributes.EnumStringObj))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class EnumStringObj<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
==============================================================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.attributes.EnumStringObj<E>

---

public class EnumStringObj<E extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<E> & zombie.entity.util.enums.IOEnum>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

Combines EnumSet and ArrayList
Can be used for Attributes such as categories or tags that also require modders to add values.
The Vanilla attribute values would be represented by an Enum implementing IOEnum which can be saved with just a Byte value.
While modders can optionally add values represented as Strings which are saved in full as String value.

The String values size may not exceed Byte.MAX\_VALUE

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `dirty`

  `private EnumSet<E>`

  `enumValues`

  `private final ArrayList<String>`

  `stringValues`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `EnumStringObj()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(E e)`

  `void`

  `add(String s)`

  `void`

  `addAll(boolean clearAll,
  EnumStringObj<E> c)`

  `void`

  `addAll(EnumStringObj<E> c)`

  `void`

  `clear()`

  `boolean`

  `contains(E o)`

  `boolean`

  `contains(String o)`

  `EnumStringObj<E>`

  `copy()`

  `boolean`

  `equals(Object o)`

  Since this class is part of an Attribute we must consider the following.

  `protected EnumSet<E>`

  `getEnumValues()`

  `void`

  `getSortedNames(ArrayList<String> list)`

  `protected ArrayList<String>`

  `getStringValues()`

  `protected void`

  `initialize(Class<E> elementType)`

  `boolean`

  `isEmpty()`

  `boolean`

  `remove(E e)`

  `boolean`

  `remove(String s)`

  `void`

  `removeAllEnums()`

  `void`

  `removeAllStrings()`

  `protected void`

  `reset()`

  `int`

  `size()`

  `int`

  `sizeEnums()`

  `int`

  `sizeStrings()`

  `private void`

  `sort()`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### stringValues

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> stringValues
  + ### enumValues

    private [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[E](#type-param-E "type parameter in EnumStringObj") extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[E](#type-param-E "type parameter in EnumStringObj")> & zombie.entity.util.enums.IOEnum> enumValues
  + ### dirty

    private boolean dirty
* Constructor Details
  -------------------

  + ### EnumStringObj

    protected EnumStringObj()
* Method Details
  --------------

  + ### initialize

    protected void initialize([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<[E](#type-param-E "type parameter in EnumStringObj")> elementType)
  + ### reset

    protected void reset()
  + ### getEnumValues

    protected [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[E](#type-param-E "type parameter in EnumStringObj")> getEnumValues()
  + ### getStringValues

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getStringValues()
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Since this class is part of an Attribute we must consider the following.
    Attributes and AttributeContainers can be part of an InventoryItem.
    InventoryItems are compressed for saving/loading in `CompressIdenticalItems`.
    During this process AttributeContainers are checked if they match between items.
    The containers compare if their attributes are equal to the attributes in another container.

    Overrides:
    :   `equals` in class `Object`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### copy

    public [EnumStringObj](EnumStringObj.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in EnumStringObj")> copy()
  + ### sort

    private void sort()
  + ### getSortedNames

    public void getSortedNames([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list)
  + ### size

    public int size()
  + ### sizeEnums

    public int sizeEnums()
  + ### sizeStrings

    public int sizeStrings()
  + ### clear

    public void clear()
  + ### isEmpty

    public boolean isEmpty()
  + ### add

    public void add([E](#type-param-E "type parameter in EnumStringObj") e)
  + ### add

    public void add([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### remove

    public boolean remove([E](#type-param-E "type parameter in EnumStringObj") e)
  + ### remove

    public boolean remove([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### contains

    public boolean contains([E](#type-param-E "type parameter in EnumStringObj") o)
  + ### contains

    public boolean contains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") o)
  + ### removeAllStrings

    public void removeAllStrings()
  + ### removeAllEnums

    public void removeAllEnums()
  + ### addAll

    public void addAll(boolean clearAll,
    [EnumStringObj](EnumStringObj.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in EnumStringObj")> c)
  + ### addAll

    public void addAll([EnumStringObj](EnumStringObj.html "class in zombie.entity.components.attributes")<[E](#type-param-E "type parameter in EnumStringObj")> c)