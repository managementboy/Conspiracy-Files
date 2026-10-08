[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.Lua](package-summary.html)
2. [LuaManager](LuaManager.html)
3. [Exposer](LuaManager.Exposer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [exposed](#exposed)
6. [Constructor Details](#constructor-detail)
   1. [Exposer(KahluaConverterManager, Platform, KahluaTable)](#%3Cinit%3E(se.krka.kahlua.converter.KahluaConverterManager,se.krka.kahlua.vm.Platform,se.krka.kahlua.vm.KahluaTable))
7. [Method Details](#method-detail)
   1. [exposeAll()](#exposeAll())
   2. [setExposed(Class)](#setExposed(java.lang.Class))
   3. [shouldExpose(Class)](#shouldExpose(java.lang.Class))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class LuaManager.Exposer
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

se.krka.kahlua.integration.expose.LuaJavaClassExposer

zombie.Lua.LuaManager.Exposer

Enclosing class:
:   `LuaManager`

---

public static final class LuaManager.Exposer
extends se.krka.kahlua.integration.expose.LuaJavaClassExposer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashSet<Class<?>>`

  `exposed`

  ### Fields inherited from class se.krka.kahlua.integration.expose.LuaJavaClassExposer

  `typeMap`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Exposer(se.krka.kahlua.converter.KahluaConverterManager manager,
  se.krka.kahlua.vm.Platform platform,
  se.krka.kahlua.vm.KahluaTable environment)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `exposeAll()`

  `void`

  `setExposed(Class<?> clazz)`

  `boolean`

  `shouldExpose(Class<?> clazz)`

  ### Methods inherited from class se.krka.kahlua.integration.expose.LuaJavaClassExposer

  `destroy, exposeGlobalClassFunction, exposeGlobalClassFunction, exposeGlobalFunctions, exposeGlobalObjectFunction, exposeGlobalObjectFunction, exposeLikeJava, exposeLikeJava, exposeLikeJavaRecursively, exposeMethod, exposeMethod, getClassDebugInformation, getDefinition, isDisallowed, isExposed`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### exposed

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?>> exposed
* Constructor Details
  -------------------

  + ### Exposer

    public Exposer(se.krka.kahlua.converter.KahluaConverterManager manager,
    se.krka.kahlua.vm.Platform platform,
    se.krka.kahlua.vm.KahluaTable environment)
* Method Details
  --------------

  + ### exposeAll

    public void exposeAll()
  + ### setExposed

    public void setExposed([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> clazz)
  + ### shouldExpose

    public boolean shouldExpose([Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<?> clazz)

    Overrides:
    :   `shouldExpose` in class `se.krka.kahlua.integration.expose.LuaJavaClassExposer`