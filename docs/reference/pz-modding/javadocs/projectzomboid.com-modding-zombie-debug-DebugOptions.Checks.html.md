[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.debug](package-summary.html)
2. [DebugOptions](DebugOptions.html)
3. [Checks](DebugOptions.Checks.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [boundShader](#boundShader)
   2. [boundTextures](#boundTextures)
   3. [luaOwnerThread](#luaOwnerThread)
   4. [objectPoolContains](#objectPoolContains)
   5. [slowLuaEvents](#slowLuaEvents)
6. [Constructor Details](#constructor-detail)
   1. [Checks()](#%3Cinit%3E())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DebugOptions.Checks
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.debug.options.OptionGroup

zombie.debug.DebugOptions.Checks

All Implemented Interfaces:
:   `zombie.debug.options.IDebugOption, zombie.debug.options.IDebugOptionGroup`

Enclosing class:
:   `DebugOptions`

---

public static final class DebugOptions.Checks
extends zombie.debug.options.OptionGroup

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final BooleanDebugOption`

  `boundShader`

  `final BooleanDebugOption`

  `boundTextures`

  `final BooleanDebugOption`

  `luaOwnerThread`

  `final BooleanDebugOption`

  `objectPoolContains`

  `final BooleanDebugOption`

  `slowLuaEvents`

  ### Fields inherited from class zombie.debug.options.OptionGroup

  `group`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Checks()`
* Method Summary
  --------------

  ### Methods inherited from class zombie.debug.options.OptionGroup

  `addChild, getChildren, getCombinedName, getGroupName, getName, getParent, onChildAdded, onDescendantAdded, onFullPathChanged, removeChild, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.debug.options.IDebugOptionGroup

  `getCombinedName, newDebugOnlyOption, newOption, newOptionGroup`

* Field Details
  -------------

  + ### boundShader

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") boundShader
  + ### boundTextures

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") boundTextures
  + ### luaOwnerThread

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") luaOwnerThread
  + ### objectPoolContains

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") objectPoolContains
  + ### slowLuaEvents

    public final [BooleanDebugOption](BooleanDebugOption.html "class in zombie.debug") slowLuaEvents
* Constructor Details
  -------------------

  + ### Checks

    public Checks()