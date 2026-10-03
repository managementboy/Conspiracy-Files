[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.sandbox](package-summary.html)
2. [CustomSandboxOptions](CustomSandboxOptions.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [VERSION1](#VERSION1)
   2. [VERSION](#VERSION)
   3. [instance](#instance)
   4. [options](#options)
6. [Constructor Details](#constructor-detail)
   1. [CustomSandboxOptions()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init()](#init())
   2. [Reset()](#Reset())
   3. [initInstance(SandboxOptions)](#initInstance(zombie.SandboxOptions))
   4. [readFile(String)](#readFile(java.lang.String))
   5. [parse(String)](#parse(java.lang.String))
   6. [parseOption(ScriptParser.Block)](#parseOption(zombie.scripting.ScriptParser.Block))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class CustomSandboxOptions
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.sandbox.CustomSandboxOptions

---

public final class CustomSandboxOptions
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final CustomSandboxOptions`

  `instance`

  `private final ArrayList<zombie.sandbox.CustomSandboxOption>`

  `options`

  `private static final int`

  `VERSION`

  `private static final int`

  `VERSION1`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CustomSandboxOptions()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `init()`

  `void`

  `initInstance(SandboxOptions options)`

  `private void`

  `parse(String contents)`

  `private zombie.sandbox.CustomSandboxOption`

  `parseOption(zombie.scripting.ScriptParser.Block block)`

  `private boolean`

  `readFile(String path)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### VERSION1

    private static final int VERSION1

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.sandbox.CustomSandboxOptions.VERSION1)
  + ### VERSION

    private static final int VERSION

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.sandbox.CustomSandboxOptions.VERSION)
  + ### instance

    public static final [CustomSandboxOptions](CustomSandboxOptions.html "class in zombie.sandbox") instance
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.sandbox.CustomSandboxOption> options
* Constructor Details
  -------------------

  + ### CustomSandboxOptions

    public CustomSandboxOptions()
* Method Details
  --------------

  + ### init

    public void init()
  + ### Reset

    public static void Reset()
  + ### initInstance

    public void initInstance([SandboxOptions](../SandboxOptions.html "class in zombie") options)
  + ### readFile

    private boolean readFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") path)
  + ### parse

    private void parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") contents)
  + ### parseOption

    private zombie.sandbox.CustomSandboxOption parseOption(zombie.scripting.ScriptParser.Block block)