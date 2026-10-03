[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.scripting](package-summary.html)
2. [RadioBroadCast](RadioBroadCast.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pauseLine](#pauseLine)
   2. [lines](#lines)
   3. [id](#id)
   4. [startStamp](#startStamp)
   5. [endStamp](#endStamp)
   6. [lineCount](#lineCount)
   7. [preSegment](#preSegment)
   8. [postSegment](#postSegment)
   9. [hasDonePreSegment](#hasDonePreSegment)
   10. [hasDonePostSegment](#hasDonePostSegment)
   11. [hasDonePostPause](#hasDonePostPause)
6. [Constructor Details](#constructor-detail)
   1. [RadioBroadCast(String, int, int)](#%3Cinit%3E(java.lang.String,int,int))
7. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [getStartStamp()](#getStartStamp())
   3. [getEndStamp()](#getEndStamp())
   4. [resetLineCounter()](#resetLineCounter())
   5. [resetLineCounter(boolean)](#resetLineCounter(boolean))
   6. [setPreSegment(RadioBroadCast)](#setPreSegment(zombie.radio.scripting.RadioBroadCast))
   7. [setPostSegment(RadioBroadCast)](#setPostSegment(zombie.radio.scripting.RadioBroadCast))
   8. [getNextLine()](#getNextLine())
   9. [getNextLine(boolean)](#getNextLine(boolean))
   10. [getCurrentLineNumber()](#getCurrentLineNumber())
   11. [setCurrentLineNumber(int)](#setCurrentLineNumber(int))
   12. [getCurrentLine()](#getCurrentLine())
   13. [PeekNextLineText()](#PeekNextLineText())
   14. [AddRadioLine(RadioLine)](#AddRadioLine(zombie.radio.scripting.RadioLine))
   15. [getLines()](#getLines())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RadioBroadCast
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.scripting.RadioBroadCast

---

public final class RadioBroadCast
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final int`

  `endStamp`

  `private boolean`

  `hasDonePostPause`

  `private final boolean`

  `hasDonePostSegment`

  `private boolean`

  `hasDonePreSegment`

  `private final String`

  `id`

  `private int`

  `lineCount`

  `private final ArrayList<RadioLine>`

  `lines`

  `private static final RadioLine`

  `pauseLine`

  `private RadioBroadCast`

  `postSegment`

  `private RadioBroadCast`

  `preSegment`

  `private final int`

  `startStamp`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RadioBroadCast(String id,
  int startstamp,
  int endstamp)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddRadioLine(RadioLine radioLine)`

  `RadioLine`

  `getCurrentLine()`

  `int`

  `getCurrentLineNumber()`

  `int`

  `getEndStamp()`

  `String`

  `getID()`

  `ArrayList<RadioLine>`

  `getLines()`

  `RadioLine`

  `getNextLine()`

  `RadioLine`

  `getNextLine(boolean doChildren)`

  `int`

  `getStartStamp()`

  `String`

  `PeekNextLineText()`

  `void`

  `resetLineCounter()`

  `void`

  `resetLineCounter(boolean doChildren)`

  `void`

  `setCurrentLineNumber(int n)`

  `void`

  `setPostSegment(RadioBroadCast broadCast)`

  `void`

  `setPreSegment(RadioBroadCast broadCast)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pauseLine

    private static final [RadioLine](RadioLine.html "class in zombie.radio.scripting") pauseLine
  + ### lines

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioLine](RadioLine.html "class in zombie.radio.scripting")> lines
  + ### id

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### startStamp

    private final int startStamp
  + ### endStamp

    private final int endStamp
  + ### lineCount

    private int lineCount
  + ### preSegment

    private [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") preSegment
  + ### postSegment

    private [RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") postSegment
  + ### hasDonePreSegment

    private boolean hasDonePreSegment
  + ### hasDonePostSegment

    private final boolean hasDonePostSegment

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.scripting.RadioBroadCast.hasDonePostSegment)
  + ### hasDonePostPause

    private boolean hasDonePostPause
* Constructor Details
  -------------------

  + ### RadioBroadCast

    public RadioBroadCast([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    int startstamp,
    int endstamp)
* Method Details
  --------------

  + ### getID

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getID()
  + ### getStartStamp

    public int getStartStamp()
  + ### getEndStamp

    public int getEndStamp()
  + ### resetLineCounter

    public void resetLineCounter()
  + ### resetLineCounter

    public void resetLineCounter(boolean doChildren)
  + ### setPreSegment

    public void setPreSegment([RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") broadCast)
  + ### setPostSegment

    public void setPostSegment([RadioBroadCast](RadioBroadCast.html "class in zombie.radio.scripting") broadCast)
  + ### getNextLine

    public [RadioLine](RadioLine.html "class in zombie.radio.scripting") getNextLine()
  + ### getNextLine

    public [RadioLine](RadioLine.html "class in zombie.radio.scripting") getNextLine(boolean doChildren)
  + ### getCurrentLineNumber

    public int getCurrentLineNumber()
  + ### setCurrentLineNumber

    public void setCurrentLineNumber(int n)
  + ### getCurrentLine

    public [RadioLine](RadioLine.html "class in zombie.radio.scripting") getCurrentLine()
  + ### PeekNextLineText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") PeekNextLineText()
  + ### AddRadioLine

    public void AddRadioLine([RadioLine](RadioLine.html "class in zombie.radio.scripting") radioLine)
  + ### getLines

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioLine](RadioLine.html "class in zombie.radio.scripting")> getLines()