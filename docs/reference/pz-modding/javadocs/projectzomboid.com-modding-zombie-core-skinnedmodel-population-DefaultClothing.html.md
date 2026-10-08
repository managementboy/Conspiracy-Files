[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.population](package-summary.html)
2. [DefaultClothing](DefaultClothing.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [pants](#pants)
   3. [tShirt](#tShirt)
   4. [tShirtDecal](#tShirtDecal)
   5. [vest](#vest)
   6. [dirty](#dirty)
7. [Constructor Details](#constructor-detail)
   1. [DefaultClothing()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [checkDirty()](#checkDirty())
   2. [init()](#init())
   3. [initClothing(KahluaTable, DefaultClothing.Clothing, String)](#initClothing(se.krka.kahlua.vm.KahluaTable,zombie.core.skinnedmodel.population.DefaultClothing.Clothing,java.lang.String))
   4. [tableToArrayList(KahluaTable, String, ArrayList)](#tableToArrayList(se.krka.kahlua.vm.KahluaTable,java.lang.String,java.util.ArrayList))
   5. [pickPantsHue()](#pickPantsHue())
   6. [pickPantsTexture()](#pickPantsTexture())
   7. [pickPantsTint()](#pickPantsTint())
   8. [pickTShirtTexture()](#pickTShirtTexture())
   9. [pickTShirtTint()](#pickTShirtTint())
   10. [pickTShirtDecalTexture()](#pickTShirtDecalTexture())
   11. [pickTShirtDecalTint()](#pickTShirtDecalTint())
   12. [pickVestTexture()](#pickVestTexture())
   13. [pickVestTint()](#pickVestTint())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class DefaultClothing
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.population.DefaultClothing

---

public final class DefaultClothing
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `DefaultClothing.Clothing`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `dirty`

  `static final DefaultClothing`

  `instance`

  `final DefaultClothing.Clothing`

  `pants`

  `final DefaultClothing.Clothing`

  `tShirt`

  `final DefaultClothing.Clothing`

  `tShirtDecal`

  `final DefaultClothing.Clothing`

  `vest`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DefaultClothing()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `checkDirty()`

  `private void`

  `init()`

  `private void`

  `initClothing(se.krka.kahlua.vm.KahluaTable defaults,
  DefaultClothing.Clothing clothing,
  String key)`

  `String`

  `pickPantsHue()`

  `String`

  `pickPantsTexture()`

  `String`

  `pickPantsTint()`

  `String`

  `pickTShirtDecalTexture()`

  `String`

  `pickTShirtDecalTint()`

  `String`

  `pickTShirtTexture()`

  `String`

  `pickTShirtTint()`

  `String`

  `pickVestTexture()`

  `String`

  `pickVestTint()`

  `private void`

  `tableToArrayList(se.krka.kahlua.vm.KahluaTable table,
  String key,
  ArrayList<String> list)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [DefaultClothing](DefaultClothing.html "class in zombie.core.skinnedmodel.population") instance
  + ### pants

    public final [DefaultClothing.Clothing](DefaultClothing.Clothing.html "class in zombie.core.skinnedmodel.population") pants
  + ### tShirt

    public final [DefaultClothing.Clothing](DefaultClothing.Clothing.html "class in zombie.core.skinnedmodel.population") tShirt
  + ### tShirtDecal

    public final [DefaultClothing.Clothing](DefaultClothing.Clothing.html "class in zombie.core.skinnedmodel.population") tShirtDecal
  + ### vest

    public final [DefaultClothing.Clothing](DefaultClothing.Clothing.html "class in zombie.core.skinnedmodel.population") vest
  + ### dirty

    public boolean dirty
* Constructor Details
  -------------------

  + ### DefaultClothing

    public DefaultClothing()
* Method Details
  --------------

  + ### checkDirty

    private void checkDirty()
  + ### init

    private void init()
  + ### initClothing

    private void initClothing(se.krka.kahlua.vm.KahluaTable defaults,
    [DefaultClothing.Clothing](DefaultClothing.Clothing.html "class in zombie.core.skinnedmodel.population") clothing,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### tableToArrayList

    private void tableToArrayList(se.krka.kahlua.vm.KahluaTable table,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list)
  + ### pickPantsHue

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickPantsHue()
  + ### pickPantsTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickPantsTexture()
  + ### pickPantsTint

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickPantsTint()
  + ### pickTShirtTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickTShirtTexture()
  + ### pickTShirtTint

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickTShirtTint()
  + ### pickTShirtDecalTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickTShirtDecalTexture()
  + ### pickTShirtDecalTint

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickTShirtDecalTint()
  + ### pickVestTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickVestTexture()
  + ### pickVestTint

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pickVestTint()