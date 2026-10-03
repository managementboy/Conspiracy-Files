[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoPuddles](IsoPuddles.html)
3. [PuddlesFloat](IsoPuddles.PuddlesFloat.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [finalValue](#finalValue)
   2. [isAdminOverride](#isAdminOverride)
   3. [adminValue](#adminValue)
   4. [min](#min)
   5. [max](#max)
   6. [delta](#delta)
   7. [id](#id)
   8. [name](#name)
6. [Constructor Details](#constructor-detail)
   1. [PuddlesFloat()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(int, String)](#init(int,java.lang.String))
   2. [getID()](#getID())
   3. [getName()](#getName())
   4. [getMin()](#getMin())
   5. [getMax()](#getMax())
   6. [setEnableAdmin(boolean)](#setEnableAdmin(boolean))
   7. [isEnableAdmin()](#isEnableAdmin())
   8. [setAdminValue(float)](#setAdminValue(float))
   9. [getAdminValue()](#getAdminValue())
   10. [setFinalValue(float)](#setFinalValue(float))
   11. [addFinalValue(float)](#addFinalValue(float))
   12. [addFinalValueForMax(float, float)](#addFinalValueForMax(float,float))
   13. [getFinalValue()](#getFinalValue())
   14. [interpolateFinalValue(float)](#interpolateFinalValue(float))
   15. [calculate()](#calculate())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoPuddles.PuddlesFloat
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoPuddles.PuddlesFloat

Enclosing class:
:   `IsoPuddles`

---

public static class IsoPuddles.PuddlesFloat
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `adminValue`

  `private final float`

  `delta`

  `protected float`

  `finalValue`

  `private int`

  `id`

  `private boolean`

  `isAdminOverride`

  `private final float`

  `max`

  `private final float`

  `min`

  `private String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PuddlesFloat()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addFinalValue(float f)`

  `void`

  `addFinalValueForMax(float f,
  float maximum)`

  `private void`

  `calculate()`

  `float`

  `getAdminValue()`

  `float`

  `getFinalValue()`

  `int`

  `getID()`

  `float`

  `getMax()`

  `float`

  `getMin()`

  `String`

  `getName()`

  `IsoPuddles.PuddlesFloat`

  `init(int id,
  String name)`

  `void`

  `interpolateFinalValue(float f)`

  `boolean`

  `isEnableAdmin()`

  `void`

  `setAdminValue(float f)`

  `void`

  `setEnableAdmin(boolean b)`

  `void`

  `setFinalValue(float f)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### finalValue

    protected float finalValue
  + ### isAdminOverride

    private boolean isAdminOverride
  + ### adminValue

    private float adminValue
  + ### min

    private final float min

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.PuddlesFloat.min)
  + ### max

    private final float max

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.PuddlesFloat.max)
  + ### delta

    private final float delta

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.IsoPuddles.PuddlesFloat.delta)
  + ### id

    private int id
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
* Constructor Details
  -------------------

  + ### PuddlesFloat

    public PuddlesFloat()
* Method Details
  --------------

  + ### init

    public [IsoPuddles.PuddlesFloat](IsoPuddles.PuddlesFloat.html "class in zombie.iso") init(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getID

    public int getID()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getMin

    public float getMin()
  + ### getMax

    public float getMax()
  + ### setEnableAdmin

    public void setEnableAdmin(boolean b)
  + ### isEnableAdmin

    public boolean isEnableAdmin()
  + ### setAdminValue

    public void setAdminValue(float f)
  + ### getAdminValue

    public float getAdminValue()
  + ### setFinalValue

    public void setFinalValue(float f)
  + ### addFinalValue

    public void addFinalValue(float f)
  + ### addFinalValueForMax

    public void addFinalValueForMax(float f,
    float maximum)
  + ### getFinalValue

    public float getFinalValue()
  + ### interpolateFinalValue

    public void interpolateFinalValue(float f)
  + ### calculate

    private void calculate()