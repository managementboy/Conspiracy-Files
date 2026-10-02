[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [GameVersion](GameVersion.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [major](#major)
   2. [minor](#minor)
   3. [suffix](#suffix)
   4. [string](#string)
6. [Constructor Details](#constructor-detail)
   1. [GameVersion(int, int, String)](#%3Cinit%3E(int,int,java.lang.String))
7. [Method Details](#method-detail)
   1. [getMajor()](#getMajor())
   2. [getMinor()](#getMinor())
   3. [getSuffix()](#getSuffix())
   4. [getInt()](#getInt())
   5. [isGreaterThan(GameVersion)](#isGreaterThan(zombie.core.GameVersion))
   6. [isGreaterThanOrEqualTo(GameVersion)](#isGreaterThanOrEqualTo(zombie.core.GameVersion))
   7. [isLessThan(GameVersion)](#isLessThan(zombie.core.GameVersion))
   8. [isLessThanOrEqualTo(GameVersion)](#isLessThanOrEqualTo(zombie.core.GameVersion))
   9. [equals(Object)](#equals(java.lang.Object))
   10. [toString()](#toString())
   11. [parse(String)](#parse(java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameVersion
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.GameVersion

---

public final class GameVersion
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `major`

  `private final int`

  `minor`

  `private final String`

  `string`

  `private final String`

  `suffix`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameVersion(int major,
  int minor,
  String suffix)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `equals(Object obj)`

  `int`

  `getInt()`

  `int`

  `getMajor()`

  `int`

  `getMinor()`

  `String`

  `getSuffix()`

  `boolean`

  `isGreaterThan(GameVersion rhs)`

  `boolean`

  `isGreaterThanOrEqualTo(GameVersion rhs)`

  `boolean`

  `isLessThan(GameVersion rhs)`

  `boolean`

  `isLessThanOrEqualTo(GameVersion rhs)`

  `static GameVersion`

  `parse(String str)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### major

    private final int major
  + ### minor

    private final int minor
  + ### suffix

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix
  + ### string

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string
* Constructor Details
  -------------------

  + ### GameVersion

    public GameVersion(int major,
    int minor,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") suffix)
* Method Details
  --------------

  + ### getMajor

    public int getMajor()
  + ### getMinor

    public int getMinor()
  + ### getSuffix

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSuffix()
  + ### getInt

    public int getInt()
  + ### isGreaterThan

    public boolean isGreaterThan([GameVersion](GameVersion.html "class in zombie.core") rhs)
  + ### isGreaterThanOrEqualTo

    public boolean isGreaterThanOrEqualTo([GameVersion](GameVersion.html "class in zombie.core") rhs)
  + ### isLessThan

    public boolean isLessThan([GameVersion](GameVersion.html "class in zombie.core") rhs)
  + ### isLessThanOrEqualTo

    public boolean isLessThanOrEqualTo([GameVersion](GameVersion.html "class in zombie.core") rhs)
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj)

    Overrides:
    :   `equals` in class `Object`
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### parse

    public static [GameVersion](GameVersion.html "class in zombie.core") parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)