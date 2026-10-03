[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [Core](Core.html)
3. [KeyBinding](Core.KeyBinding.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [keyValue](#keyValue)
   3. [altKey](#altKey)
   4. [shift](#shift)
   5. [ctrl](#ctrl)
   6. [alt](#alt)
6. [Constructor Details](#constructor-detail)
   1. [KeyBinding(String, int, int, boolean, boolean, boolean)](#%3Cinit%3E(java.lang.String,int,int,boolean,boolean,boolean))
7. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [hashCode()](#hashCode())
   3. [equals(Object)](#equals(java.lang.Object))
   4. [name()](#name())
   5. [keyValue()](#keyValue())
   6. [altKey()](#altKey())
   7. [shift()](#shift())
   8. [ctrl()](#ctrl())
   9. [alt()](#alt())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Record Class Core.KeyBinding
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

zombie.core.Core.KeyBinding

Enclosing class:
:   `Core`

---

public static record Core.KeyBinding([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name, int keyValue, int altKey, boolean shift, boolean ctrl, boolean alt)
extends [Record](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Record.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final boolean`

  `alt`

  The field for the `alt` record component.

  `private final int`

  `altKey`

  The field for the `altKey` record component.

  `private final boolean`

  `ctrl`

  The field for the `ctrl` record component.

  `private final int`

  `keyValue`

  The field for the `keyValue` record component.

  `private final String`

  `name`

  The field for the `name` record component.

  `private final boolean`

  `shift`

  The field for the `shift` record component.
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `KeyBinding(String name,
  int keyValue,
  int altKey,
  boolean shift,
  boolean ctrl,
  boolean alt)`

  Creates an instance of a `KeyBinding` record class.
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `alt()`

  Returns the value of the `alt` record component.

  `int`

  `altKey()`

  Returns the value of the `altKey` record component.

  `boolean`

  `ctrl()`

  Returns the value of the `ctrl` record component.

  `final boolean`

  `equals(Object o)`

  Indicates whether some other object is "equal to" this one.

  `final int`

  `hashCode()`

  Returns a hash code value for this object.

  `int`

  `keyValue()`

  Returns the value of the `keyValue` record component.

  `String`

  `name()`

  Returns the value of the `name` record component.

  `boolean`

  `shift()`

  Returns the value of the `shift` record component.

  `final String`

  `toString()`

  Returns a string representation of this record class.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name

    The field for the `name` record component.
  + ### keyValue

    private final int keyValue

    The field for the `keyValue` record component.
  + ### altKey

    private final int altKey

    The field for the `altKey` record component.
  + ### shift

    private final boolean shift

    The field for the `shift` record component.
  + ### ctrl

    private final boolean ctrl

    The field for the `ctrl` record component.
  + ### alt

    private final boolean alt

    The field for the `alt` record component.
* Constructor Details
  -------------------

  + ### KeyBinding

    public KeyBinding([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int keyValue,
    int altKey,
    boolean shift,
    boolean ctrl,
    boolean alt)

    Creates an instance of a `KeyBinding` record class.

    Parameters:
    :   `name` - the value for the `name` record component
    :   `keyValue` - the value for the `keyValue` record component
    :   `altKey` - the value for the `altKey` record component
    :   `shift` - the value for the `shift` record component
    :   `ctrl` - the value for the `ctrl` record component
    :   `alt` - the value for the `alt` record component
* Method Details
  --------------

  + ### toString

    public final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Returns a string representation of this record class. The representation contains the name of the class, followed by the name and value of each of the record components.

    Specified by:
    :   `toString` in class `Record`

    Returns:
    :   a string representation of this object
  + ### hashCode

    public final int hashCode()

    Returns a hash code value for this object. The value is derived from the hash code of each of the record components.

    Specified by:
    :   `hashCode` in class `Record`

    Returns:
    :   a hash code value for this object
  + ### equals

    public final boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Indicates whether some other object is "equal to" this one. The objects are equal if the other object is of the same class and if all the record components are equal. Reference components are compared with [`Objects::equals(Object,Object)`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Objects.html#equals(java.lang.Object,java.lang.Object) "class or interface in java.util"); primitive components are compared with the `compare` method from their corresponding wrapper classes.

    Specified by:
    :   `equals` in class `Record`

    Parameters:
    :   `o` - the object with which to compare

    Returns:
    :   `true` if this object is the same as the `o` argument; `false` otherwise.
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name()

    Returns the value of the `name` record component.

    Returns:
    :   the value of the `name` record component
  + ### keyValue

    public int keyValue()

    Returns the value of the `keyValue` record component.

    Returns:
    :   the value of the `keyValue` record component
  + ### altKey

    public int altKey()

    Returns the value of the `altKey` record component.

    Returns:
    :   the value of the `altKey` record component
  + ### shift

    public boolean shift()

    Returns the value of the `shift` record component.

    Returns:
    :   the value of the `shift` record component
  + ### ctrl

    public boolean ctrl()

    Returns the value of the `ctrl` record component.

    Returns:
    :   the value of the `ctrl` record component
  + ### alt

    public boolean alt()

    Returns the value of the `alt` record component.

    Returns:
    :   the value of the `alt` record component