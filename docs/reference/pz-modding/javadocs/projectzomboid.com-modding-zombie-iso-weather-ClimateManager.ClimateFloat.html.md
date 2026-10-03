[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.weather](package-summary.html)
2. [ClimateManager](ClimateManager.html)
3. [ClimateFloat](ClimateManager.ClimateFloat.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [internalValue](#internalValue)
   2. [finalValue](#finalValue)
   3. [isOverride](#isOverride)
   4. [override](#override)
   5. [isOverrideValue](#isOverrideValue)
   6. [overrideInternal](#overrideInternal)
   7. [interpolate](#interpolate)
   8. [isModded](#isModded)
   9. [moddedValue](#moddedValue)
   10. [modInterpolate](#modInterpolate)
   11. [isAdminOverride](#isAdminOverride)
   12. [adminValue](#adminValue)
   13. [min](#min)
   14. [max](#max)
   15. [id](#id)
   16. [name](#name)
6. [Constructor Details](#constructor-detail)
   1. [ClimateFloat()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(int, String)](#init(int,java.lang.String))
   2. [getID()](#getID())
   3. [getName()](#getName())
   4. [getMin()](#getMin())
   5. [getMax()](#getMax())
   6. [getInternalValue()](#getInternalValue())
   7. [getOverride()](#getOverride())
   8. [getOverrideInterpolate()](#getOverrideInterpolate())
   9. [setOverride(float, float)](#setOverride(float,float))
   10. [setOverrideValue(boolean)](#setOverrideValue(boolean))
   11. [setEnableOverride(boolean)](#setEnableOverride(boolean))
   12. [isEnableOverride()](#isEnableOverride())
   13. [setEnableAdmin(boolean)](#setEnableAdmin(boolean))
   14. [isEnableAdmin()](#isEnableAdmin())
   15. [setAdminValue(float)](#setAdminValue(float))
   16. [getAdminValue()](#getAdminValue())
   17. [setEnableModded(boolean)](#setEnableModded(boolean))
   18. [setModdedValue(float)](#setModdedValue(float))
   19. [getModdedValue()](#getModdedValue())
   20. [setModdedInterpolate(float)](#setModdedInterpolate(float))
   21. [setFinalValue(float)](#setFinalValue(float))
   22. [getFinalValue()](#getFinalValue())
   23. [calculate()](#calculate())
   24. [writeAdmin(ByteBufferWriter)](#writeAdmin(zombie.core.network.ByteBufferWriter))
   25. [readAdmin(ByteBufferReader)](#readAdmin(zombie.core.network.ByteBufferReader))
   26. [saveAdmin(DataOutputStream)](#saveAdmin(java.io.DataOutputStream))
   27. [loadAdmin(DataInputStream, int)](#loadAdmin(java.io.DataInputStream,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateManager.ClimateFloat
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateManager.ClimateFloat

Enclosing class:
:   `ClimateManager`

---

public static class ClimateManager.ClimateFloat
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `adminValue`

  `protected float`

  `finalValue`

  `private int`

  `id`

  `protected float`

  `internalValue`

  `protected float`

  `interpolate`

  `private boolean`

  `isAdminOverride`

  `private boolean`

  `isModded`

  `protected boolean`

  `isOverride`

  `protected boolean`

  `isOverrideValue`

  `private float`

  `max`

  `private float`

  `min`

  `private float`

  `moddedValue`

  `private float`

  `modInterpolate`

  `private String`

  `name`

  `protected float`

  `override`

  `protected float`

  `overrideInternal`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClimateFloat()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `calculate()`

  `float`

  `getAdminValue()`

  `float`

  `getFinalValue()`

  `int`

  `getID()`

  `float`

  `getInternalValue()`

  `float`

  `getMax()`

  `float`

  `getMin()`

  `float`

  `getModdedValue()`

  `String`

  `getName()`

  `float`

  `getOverride()`

  `float`

  `getOverrideInterpolate()`

  `ClimateManager.ClimateFloat`

  `init(int id,
  String name)`

  `boolean`

  `isEnableAdmin()`

  `boolean`

  `isEnableOverride()`

  `private void`

  `loadAdmin(DataInputStream input,
  int worldVersion)`

  `private void`

  `readAdmin(zombie.core.network.ByteBufferReader input)`

  `private void`

  `saveAdmin(DataOutputStream output)`

  `void`

  `setAdminValue(float f)`

  `void`

  `setEnableAdmin(boolean b)`

  `void`

  `setEnableModded(boolean b)`

  `void`

  `setEnableOverride(boolean b)`

  `void`

  `setFinalValue(float f)`

  `void`

  `setModdedInterpolate(float f)`

  `void`

  `setModdedValue(float f)`

  `void`

  `setOverride(float targ,
  float inter)`

  `void`

  `setOverrideValue(boolean overrideValue)`

  `private void`

  `writeAdmin(zombie.core.network.ByteBufferWriter output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### internalValue

    protected float internalValue
  + ### finalValue

    protected float finalValue
  + ### isOverride

    protected boolean isOverride
  + ### override

    protected float override
  + ### isOverrideValue

    protected boolean isOverrideValue
  + ### overrideInternal

    protected float overrideInternal
  + ### interpolate

    protected float interpolate
  + ### isModded

    private boolean isModded
  + ### moddedValue

    private float moddedValue
  + ### modInterpolate

    private float modInterpolate
  + ### isAdminOverride

    private boolean isAdminOverride
  + ### adminValue

    private float adminValue
  + ### min

    private float min
  + ### max

    private float max
  + ### id

    private int id
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
* Constructor Details
  -------------------

  + ### ClimateFloat

    public ClimateFloat()
* Method Details
  --------------

  + ### init

    public [ClimateManager.ClimateFloat](ClimateManager.ClimateFloat.html "class in zombie.iso.weather") init(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getID

    public int getID()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getMin

    public float getMin()
  + ### getMax

    public float getMax()
  + ### getInternalValue

    public float getInternalValue()
  + ### getOverride

    public float getOverride()
  + ### getOverrideInterpolate

    public float getOverrideInterpolate()
  + ### setOverride

    public void setOverride(float targ,
    float inter)
  + ### setOverrideValue

    public void setOverrideValue(boolean overrideValue)
  + ### setEnableOverride

    public void setEnableOverride(boolean b)
  + ### isEnableOverride

    public boolean isEnableOverride()
  + ### setEnableAdmin

    public void setEnableAdmin(boolean b)
  + ### isEnableAdmin

    public boolean isEnableAdmin()
  + ### setAdminValue

    public void setAdminValue(float f)
  + ### getAdminValue

    public float getAdminValue()
  + ### setEnableModded

    public void setEnableModded(boolean b)
  + ### setModdedValue

    public void setModdedValue(float f)
  + ### getModdedValue

    public float getModdedValue()
  + ### setModdedInterpolate

    public void setModdedInterpolate(float f)
  + ### setFinalValue

    public void setFinalValue(float f)
  + ### getFinalValue

    public float getFinalValue()
  + ### calculate

    private void calculate()
  + ### writeAdmin

    private void writeAdmin(zombie.core.network.ByteBufferWriter output)
  + ### readAdmin

    private void readAdmin(zombie.core.network.ByteBufferReader input)
  + ### saveAdmin

    private void saveAdmin([DataOutputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataOutputStream.html "class or interface in java.io") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadAdmin

    private void loadAdmin([DataInputStream](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/DataInputStream.html "class or interface in java.io") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`