[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.util](package-summary.html)
2. [BitSet](BitSet.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [bits](#bits)
6. [Constructor Details](#constructor-detail)
   1. [BitSet()](#%3Cinit%3E())
   2. [BitSet(int)](#%3Cinit%3E(int))
   3. [BitSet(BitSet)](#%3Cinit%3E(zombie.entity.util.BitSet))
7. [Method Details](#method-detail)
   1. [get(int)](#get(int))
   2. [getAndClear(int)](#getAndClear(int))
   3. [getAndSet(int)](#getAndSet(int))
   4. [set(int)](#set(int))
   5. [flip(int)](#flip(int))
   6. [checkCapacity(int)](#checkCapacity(int))
   7. [clear(int)](#clear(int))
   8. [clear()](#clear())
   9. [numBits()](#numBits())
   10. [length()](#length())
   11. [notEmpty()](#notEmpty())
   12. [isEmpty()](#isEmpty())
   13. [nextSetBit(int)](#nextSetBit(int))
   14. [nextClearBit(int)](#nextClearBit(int))
   15. [and(BitSet)](#and(zombie.entity.util.BitSet))
   16. [andNot(BitSet)](#andNot(zombie.entity.util.BitSet))
   17. [or(BitSet)](#or(zombie.entity.util.BitSet))
   18. [xor(BitSet)](#xor(zombie.entity.util.BitSet))
   19. [intersects(BitSet)](#intersects(zombie.entity.util.BitSet))
   20. [containsAll(BitSet)](#containsAll(zombie.entity.util.BitSet))
   21. [hashCode()](#hashCode())
   22. [equals(Object)](#equals(java.lang.Object))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class BitSet
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.util.BitSet

---

public class BitSet
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

A bitset, without size limitation, allows comparison via bitwise operators to other bitfields.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) long[]`

  `bits`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BitSet()`

  `BitSet(int nbits)`

  Creates a bit set whose initial size is large enough to explicitly represent bits with indices in the range 0 through
  nbits-1.

  `BitSet(BitSet bitsToCpy)`

  Creates a bit set from another bit set
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `and(BitSet other)`

  Performs a logical **AND** of this target bit set with the argument bit set.

  `void`

  `andNot(BitSet other)`

  Clears all of the bits in this bit set whose corresponding bit is set in the specified bit set.

  `private void`

  `checkCapacity(int len)`

  `void`

  `clear()`

  Clears the entire bitset

  `void`

  `clear(int index)`

  `boolean`

  `containsAll(BitSet other)`

  Returns true if this bit set is a super set of the specified set, i.e.

  `boolean`

  `equals(Object obj)`

  `void`

  `flip(int index)`

  `boolean`

  `get(int index)`

  `boolean`

  `getAndClear(int index)`

  Returns the bit at the given index and clears it in one go.

  `boolean`

  `getAndSet(int index)`

  Returns the bit at the given index and sets it in one go.

  `int`

  `hashCode()`

  `boolean`

  `intersects(BitSet other)`

  Returns true if the specified BitSet has any bits set to true that are also set to true in this BitSet.

  `boolean`

  `isEmpty()`

  `int`

  `length()`

  Returns the "logical size" of this bitset: the index of the highest set bit in the bitset plus one.

  `int`

  `nextClearBit(int fromIndex)`

  Returns the index of the first bit that is set to false that occurs on or after the specified starting index.

  `int`

  `nextSetBit(int fromIndex)`

  Returns the index of the first bit that is set to true that occurs on or after the specified starting index.

  `boolean`

  `notEmpty()`

  `int`

  `numBits()`

  `void`

  `or(BitSet other)`

  Performs a logical **OR** of this bit set with the bit set argument.

  `void`

  `set(int index)`

  `void`

  `xor(BitSet other)`

  Performs a logical **XOR** of this bit set with the bit set argument.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### bits

    long[] bits
* Constructor Details
  -------------------

  + ### BitSet

    public BitSet()
  + ### BitSet

    public BitSet(int nbits)

    Creates a bit set whose initial size is large enough to explicitly represent bits with indices in the range 0 through
    nbits-1.

    Parameters:
    :   `nbits` - the initial size of the bit set
  + ### BitSet

    public BitSet([BitSet](BitSet.html "class in zombie.entity.util") bitsToCpy)

    Creates a bit set from another bit set

    Parameters:
    :   `bitsToCpy` - bitset to cpy
* Method Details
  --------------

  + ### get

    public boolean get(int index)

    Parameters:
    :   `index` - the index of the bit

    Returns:
    :   whether the bit is set

    Throws:
    :   `ArrayIndexOutOfBoundsException` - if index invalid input: '<' 0
  + ### getAndClear

    public boolean getAndClear(int index)

    Returns the bit at the given index and clears it in one go.

    Parameters:
    :   `index` - the index of the bit

    Returns:
    :   whether the bit was set before invocation

    Throws:
    :   `ArrayIndexOutOfBoundsException` - if index invalid input: '<' 0
  + ### getAndSet

    public boolean getAndSet(int index)

    Returns the bit at the given index and sets it in one go.

    Parameters:
    :   `index` - the index of the bit

    Returns:
    :   whether the bit was set before invocation

    Throws:
    :   `ArrayIndexOutOfBoundsException` - if index invalid input: '<' 0
  + ### set

    public void set(int index)

    Parameters:
    :   `index` - the index of the bit to set

    Throws:
    :   `ArrayIndexOutOfBoundsException` - if index invalid input: '<' 0
  + ### flip

    public void flip(int index)

    Parameters:
    :   `index` - the index of the bit to flip
  + ### checkCapacity

    private void checkCapacity(int len)
  + ### clear

    public void clear(int index)

    Parameters:
    :   `index` - the index of the bit to clear

    Throws:
    :   `ArrayIndexOutOfBoundsException` - if index invalid input: '<' 0
  + ### clear

    public void clear()

    Clears the entire bitset
  + ### numBits

    public int numBits()

    Returns:
    :   the number of bits currently stored, **not** the highset set bit!
  + ### length

    public int length()

    Returns the "logical size" of this bitset: the index of the highest set bit in the bitset plus one. Returns zero if the
    bitset contains no set bits.

    Returns:
    :   the logical size of this bitset
  + ### notEmpty

    public boolean notEmpty()

    Returns:
    :   true if this bitset contains at least one bit set to true
  + ### isEmpty

    public boolean isEmpty()

    Returns:
    :   true if this bitset contains no bits that are set to true
  + ### nextSetBit

    public int nextSetBit(int fromIndex)

    Returns the index of the first bit that is set to true that occurs on or after the specified starting index. If no such bit
    exists then -1 is returned.
  + ### nextClearBit

    public int nextClearBit(int fromIndex)

    Returns the index of the first bit that is set to false that occurs on or after the specified starting index.
  + ### and

    public void and([BitSet](BitSet.html "class in zombie.entity.util") other)

    Performs a logical **AND** of this target bit set with the argument bit set. This bit set is modified so that each bit
    in it has the value true if and only if it both initially had the value true and the corresponding bit in the bit set
    argument also had the value true.

    Parameters:
    :   `other` - a bit set
  + ### andNot

    public void andNot([BitSet](BitSet.html "class in zombie.entity.util") other)

    Clears all of the bits in this bit set whose corresponding bit is set in the specified bit set.

    Parameters:
    :   `other` - a bit set
  + ### or

    public void or([BitSet](BitSet.html "class in zombie.entity.util") other)

    Performs a logical **OR** of this bit set with the bit set argument. This bit set is modified so that a bit in it has
    the value true if and only if it either already had the value true or the corresponding bit in the bit set argument has the
    value true.

    Parameters:
    :   `other` - a bit set
  + ### xor

    public void xor([BitSet](BitSet.html "class in zombie.entity.util") other)

    Performs a logical **XOR** of this bit set with the bit set argument. This bit set is modified so that a bit in it has
    the value true if and only if one of the following statements holds:
    - The bit initially has the value true, and the corresponding bit in the argument has the value false.
    - The bit initially has the value false, and the corresponding bit in the argument has the value true.
  + ### intersects

    public boolean intersects([BitSet](BitSet.html "class in zombie.entity.util") other)

    Returns true if the specified BitSet has any bits set to true that are also set to true in this BitSet.

    Parameters:
    :   `other` - a bit set

    Returns:
    :   boolean indicating whether this bit set intersects the specified bit set
  + ### containsAll

    public boolean containsAll([BitSet](BitSet.html "class in zombie.entity.util") other)

    Returns true if this bit set is a super set of the specified set, i.e. it has all bits set to true that are also set to
    true in the specified BitSet.

    Parameters:
    :   `other` - a bit set

    Returns:
    :   boolean indicating whether this bit set is a super set of the specified set
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj)

    Overrides:
    :   `equals` in class `Object`