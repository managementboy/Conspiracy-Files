[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [GameWindow](GameWindow.html)
3. [StringUTF](GameWindow.StringUTF.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [chars](#chars)
   2. [byteBuffer](#byteBuffer)
   3. [charBuffer](#charBuffer)
   4. [ce](#ce)
   5. [cd](#cd)
6. [Constructor Details](#constructor-detail)
   1. [StringUTF()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [encode(String)](#encode(java.lang.String))
   2. [decode(int)](#decode(int))
   3. [getEncodedBytes(String)](#getEncodedBytes(java.lang.String))
   4. [save(ByteBuffer, String)](#save(java.nio.ByteBuffer,java.lang.String))
   5. [load(ByteBuffer)](#load(java.nio.ByteBuffer))

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class GameWindow.StringUTF
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.GameWindow.StringUTF

Enclosing class:
:   `GameWindow`

---

private static class GameWindow.StringUTF
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private ByteBuffer`

  `byteBuffer`

  `private CharsetDecoder`

  `cd`

  `private CharsetEncoder`

  `ce`

  `private CharBuffer`

  `charBuffer`

  `private char[]`

  `chars`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `StringUTF()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private String`

  `decode(int numBytes)`

  `private int`

  `encode(String str)`

  `(package private) ByteBuffer`

  `getEncodedBytes(String str)`

  `(package private) String`

  `load(ByteBuffer in)`

  `(package private) void`

  `save(ByteBuffer out,
  String str)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### chars

    private char[] chars
  + ### byteBuffer

    private [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") byteBuffer
  + ### charBuffer

    private [CharBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/CharBuffer.html "class or interface in java.nio") charBuffer
  + ### ce

    private [CharsetEncoder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/charset/CharsetEncoder.html "class or interface in java.nio.charset") ce
  + ### cd

    private [CharsetDecoder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/charset/CharsetDecoder.html "class or interface in java.nio.charset") cd
* Constructor Details
  -------------------

  + ### StringUTF

    private StringUTF()
* Method Details
  --------------

  + ### encode

    private int encode([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### decode

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") decode(int numBytes)
  + ### getEncodedBytes

    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") getEncodedBytes([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### save

    void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") out,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### load

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") in)