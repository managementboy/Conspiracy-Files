[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.characters.animals.datas](package-summary.html)
2. [AnimalBreed](AnimalBreed.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [name](#name)
   2. [texture](#texture)
   3. [textureMale](#textureMale)
   4. [textureBaby](#textureBaby)
   5. [minWeightBonus](#minWeightBonus)
   6. [maxWeightBonus](#maxWeightBonus)
   7. [milkType](#milkType)
   8. [woolType](#woolType)
   9. [forcedGenes](#forcedGenes)
   10. [invIconMale](#invIconMale)
   11. [invIconFemale](#invIconFemale)
   12. [invIconBaby](#invIconBaby)
   13. [invIconMaleDead](#invIconMaleDead)
   14. [invIconFemaleDead](#invIconFemaleDead)
   15. [invIconBabyDead](#invIconBabyDead)
   16. [invIconMaleSkel](#invIconMaleSkel)
   17. [invIconFemaleSkel](#invIconFemaleSkel)
   18. [invIconBabySkel](#invIconBabySkel)
   19. [leather](#leather)
   20. [headItem](#headItem)
   21. [featherItem](#featherItem)
   22. [maxFeather](#maxFeather)
   23. [sounds](#sounds)
   24. [rottenTexture](#rottenTexture)
7. [Constructor Details](#constructor-detail)
   1. [AnimalBreed()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getMilkType()](#getMilkType())
   3. [loadForcedGenes(KahluaTableImpl)](#loadForcedGenes(se.krka.kahlua.j2se.KahluaTableImpl))
   4. [loadSounds(KahluaTableImpl)](#loadSounds(se.krka.kahlua.j2se.KahluaTableImpl))
   5. [getSound(String)](#getSound(java.lang.String))
   6. [isSoundDefined(String)](#isSoundDefined(java.lang.String))
   7. [isSoundUndefined(String)](#isSoundUndefined(java.lang.String))
   8. [getFeatherItem()](#getFeatherItem())
   9. [getWoolType()](#getWoolType())
   10. [getRottenTexture()](#getRottenTexture())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AnimalBreed
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.animals.datas.AnimalBreed

---

public class AnimalBreed
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `AnimalBreed.ForcedGenes`

  `static final class`

  `AnimalBreed.Sound`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `String`

  `featherItem`

  `HashMap<String, AnimalBreed.ForcedGenes>`

  `forcedGenes`

  `String`

  `headItem`

  `String`

  `invIconBaby`

  `String`

  `invIconBabyDead`

  `String`

  `invIconBabySkel`

  `String`

  `invIconFemale`

  `String`

  `invIconFemaleDead`

  `String`

  `invIconFemaleSkel`

  `String`

  `invIconMale`

  `String`

  `invIconMaleDead`

  `String`

  `invIconMaleSkel`

  `String`

  `leather`

  `int`

  `maxFeather`

  `int`

  `maxWeightBonus`

  `String`

  `milkType`

  `int`

  `minWeightBonus`

  `String`

  `name`

  `String`

  `rottenTexture`

  `private final HashMap<String, AnimalBreed.Sound>`

  `sounds`

  `ArrayList<String>`

  `texture`

  `String`

  `textureBaby`

  `String`

  `textureMale`

  `String`

  `woolType`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalBreed()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getFeatherItem()`

  `String`

  `getMilkType()`

  `String`

  `getName()`

  `String`

  `getRottenTexture()`

  `AnimalBreed.Sound`

  `getSound(String id)`

  `String`

  `getWoolType()`

  `boolean`

  `isSoundDefined(String id)`

  `boolean`

  `isSoundUndefined(String id)`

  `void`

  `loadForcedGenes(se.krka.kahlua.j2se.KahluaTableImpl def)`

  `void`

  `loadSounds(se.krka.kahlua.j2se.KahluaTableImpl soundsTable)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### texture

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> texture
  + ### textureMale

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureMale
  + ### textureBaby

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureBaby
  + ### minWeightBonus

    public int minWeightBonus
  + ### maxWeightBonus

    public int maxWeightBonus
  + ### milkType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") milkType
  + ### woolType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") woolType
  + ### forcedGenes

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalBreed.ForcedGenes](AnimalBreed.ForcedGenes.html "class in zombie.characters.animals.datas")> forcedGenes
  + ### invIconMale

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIconMale
  + ### invIconFemale

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIconFemale
  + ### invIconBaby

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIconBaby
  + ### invIconMaleDead

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIconMaleDead
  + ### invIconFemaleDead

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIconFemaleDead
  + ### invIconBabyDead

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIconBabyDead
  + ### invIconMaleSkel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIconMaleSkel
  + ### invIconFemaleSkel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIconFemaleSkel
  + ### invIconBabySkel

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") invIconBabySkel
  + ### leather

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") leather
  + ### headItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") headItem
  + ### featherItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") featherItem
  + ### maxFeather

    public int maxFeather
  + ### sounds

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimalBreed.Sound](AnimalBreed.Sound.html "class in zombie.characters.animals.datas")> sounds
  + ### rottenTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") rottenTexture
* Constructor Details
  -------------------

  + ### AnimalBreed

    public AnimalBreed()
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getMilkType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMilkType()
  + ### loadForcedGenes

    public void loadForcedGenes(se.krka.kahlua.j2se.KahluaTableImpl def)
  + ### loadSounds

    public void loadSounds(se.krka.kahlua.j2se.KahluaTableImpl soundsTable)
  + ### getSound

    public [AnimalBreed.Sound](AnimalBreed.Sound.html "class in zombie.characters.animals.datas") getSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### isSoundDefined

    public boolean isSoundDefined([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### isSoundUndefined

    public boolean isSoundUndefined([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getFeatherItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFeatherItem()
  + ### getWoolType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWoolType()
  + ### getRottenTexture

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRottenTexture()