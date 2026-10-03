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
3. [LightInfo](IsoGameCharacter.LightInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [square](#square)
   2. [x](#x)
   3. [y](#y)
   4. [z](#z)
   5. [angleX](#angleX)
   6. [angleY](#angleY)
   7. [torches](#torches)
   8. [time](#time)
   9. [night](#night)
   10. [rmod](#rmod)
   11. [gmod](#gmod)
   12. [bmod](#bmod)
6. [Constructor Details](#constructor-detail)
   1. [LightInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initFrom(IsoGameCharacter.LightInfo)](#initFrom(zombie.characters.IsoGameCharacter.LightInfo))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGameCharacter.LightInfo
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoGameCharacter.LightInfo

Enclosing class:
:   `IsoGameCharacter`

---

public static class IsoGameCharacter.LightInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `angleX`

  `float`

  `angleY`

  `float`

  `bmod`

  `float`

  `gmod`

  `float`

  `night`

  `float`

  `rmod`

  `IsoGridSquare`

  `square`

  `long`

  `time`

  `ArrayList<IsoGameCharacter.TorchInfo>`

  `torches`

  `float`

  `x`

  `float`

  `y`

  `float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LightInfo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `initFrom(IsoGameCharacter.LightInfo other)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### square

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square
  + ### x

    public float x
  + ### y

    public float y
  + ### z

    public float z
  + ### angleX

    public float angleX
  + ### angleY

    public float angleY
  + ### torches

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGameCharacter.TorchInfo](IsoGameCharacter.TorchInfo.html "class in zombie.characters")> torches
  + ### time

    public long time
  + ### night

    public float night
  + ### rmod

    public float rmod
  + ### gmod

    public float gmod
  + ### bmod

    public float bmod
* Constructor Details
  -------------------

  + ### LightInfo

    public LightInfo()
* Method Details
  --------------

  + ### initFrom

    public void initFrom([IsoGameCharacter.LightInfo](IsoGameCharacter.LightInfo.html "class in zombie.characters") other)