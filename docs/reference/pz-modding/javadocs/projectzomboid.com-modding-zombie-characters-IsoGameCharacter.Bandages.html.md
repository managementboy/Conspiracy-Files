[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoGameCharacter](IsoGameCharacter.html)
3. [Bandages](IsoGameCharacter.Bandages.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [bandageTypeMap](#bandageTypeMap)
   2. [itemMap](#itemMap)
6. [Constructor Details](#constructor-detail)
   1. [Bandages()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getBloodBandageType(String)](#getBloodBandageType(java.lang.String))
   2. [update(IsoGameCharacter)](#update(zombie.characters.IsoGameCharacter))
   3. [addBandageModel(IsoGameCharacter, String)](#addBandageModel(zombie.characters.IsoGameCharacter,java.lang.String))
   4. [removeBandageModel(IsoGameCharacter, String)](#removeBandageModel(zombie.characters.IsoGameCharacter,java.lang.String))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGameCharacter.Bandages
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoGameCharacter.Bandages

Enclosing class:
:   `IsoGameCharacter`

---

private static final class IsoGameCharacter.Bandages
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashMap<String,String>`

  `bandageTypeMap`

  `private final gnu.trove.map.hash.THashMap<String, InventoryItem>`

  `itemMap`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Bandages()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addBandageModel(IsoGameCharacter chr,
  String type)`

  `private String`

  `getBloodBandageType(String type)`

  `private void`

  `removeBandageModel(IsoGameCharacter chr,
  String bandageType)`

  `private void`

  `update(IsoGameCharacter chr)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### bandageTypeMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> bandageTypeMap
  + ### itemMap

    private final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> itemMap
* Constructor Details
  -------------------

  + ### Bandages

    private Bandages()
* Method Details
  --------------

  + ### getBloodBandageType

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBloodBandageType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### update

    private void update([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr)
  + ### addBandageModel

    private void addBandageModel([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### removeBandageModel

    private void removeBandageModel([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bandageType)