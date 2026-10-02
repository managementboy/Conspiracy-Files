[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [VehicleLight](VehicleLight.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [active](#active)
   2. [offset](#offset)
   3. [dist](#dist)
   4. [intensity](#intensity)
   5. [dot](#dot)
   6. [focusing](#focusing)
   7. [r](#r)
   8. [g](#g)
   9. [b](#b)
6. [Constructor Details](#constructor-detail)
   1. [VehicleLight()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getActive()](#getActive())
   2. [setActive(boolean)](#setActive(boolean))
   3. [getFocusing()](#getFocusing())
   4. [getIntensity()](#getIntensity())
   5. [getDistanization()](#getDistanization())
   6. [canFocusingUp()](#canFocusingUp())
   7. [canFocusingDown()](#canFocusingDown())
   8. [setFocusingUp()](#setFocusingUp())
   9. [setFocusingDown()](#setFocusingDown())
   10. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   11. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class VehicleLight
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.VehicleLight

---

public final class VehicleLight
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `active`

  `float`

  `b`

  `float`

  `dist`

  `float`

  `dot`

  `int`

  `focusing`

  `float`

  `g`

  `float`

  `intensity`

  `final Vector3f`

  `offset`

  `float`

  `r`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VehicleLight()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canFocusingDown()`

  Deprecated.

  `boolean`

  `canFocusingUp()`

  Deprecated.

  `boolean`

  `getActive()`

  `float`

  `getDistanization()`

  Deprecated.

  `int`

  `getFocusing()`

  Deprecated.

  `float`

  `getIntensity()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `setActive(boolean active)`

  `void`

  `setFocusingDown()`

  Deprecated.

  `void`

  `setFocusingUp()`

  Deprecated.

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### active

    public boolean active
  + ### offset

    public final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") offset
  + ### dist

    public float dist
  + ### intensity

    public float intensity
  + ### dot

    public float dot
  + ### focusing

    public int focusing
  + ### r

    public float r
  + ### g

    public float g
  + ### b

    public float b
* Constructor Details
  -------------------

  + ### VehicleLight

    public VehicleLight()
* Method Details
  --------------

  + ### getActive

    public boolean getActive()
  + ### setActive

    public void setActive(boolean active)
  + ### getFocusing

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public int getFocusing()

    Deprecated.
  + ### getIntensity

    public float getIntensity()
  + ### getDistanization

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public float getDistanization()

    Deprecated.
  + ### canFocusingUp

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean canFocusingUp()

    Deprecated.
  + ### canFocusingDown

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public boolean canFocusingDown()

    Deprecated.
  + ### setFocusingUp

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setFocusingUp()

    Deprecated.
  + ### setFocusingDown

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setFocusingDown()

    Deprecated.
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`