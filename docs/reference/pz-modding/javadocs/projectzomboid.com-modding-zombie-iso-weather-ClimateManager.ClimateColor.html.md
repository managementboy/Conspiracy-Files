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
3. [ClimateColor](ClimateManager.ClimateColor.html)

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
   5. [interpolate](#interpolate)
   6. [isModded](#isModded)
   7. [moddedValue](#moddedValue)
   8. [modInterpolate](#modInterpolate)
   9. [isAdminOverride](#isAdminOverride)
   10. [adminValue](#adminValue)
   11. [id](#id)
   12. [name](#name)
6. [Constructor Details](#constructor-detail)
   1. [ClimateColor()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(int, String)](#init(int,java.lang.String))
   2. [getID()](#getID())
   3. [getName()](#getName())
   4. [getInternalValue()](#getInternalValue())
   5. [getOverride()](#getOverride())
   6. [getOverrideInterpolate()](#getOverrideInterpolate())
   7. [setOverride(ClimateColorInfo, float)](#setOverride(zombie.iso.weather.ClimateColorInfo,float))
   8. [setOverride(ByteBufferReader, float)](#setOverride(zombie.core.network.ByteBufferReader,float))
   9. [setEnableOverride(boolean)](#setEnableOverride(boolean))
   10. [isEnableOverride()](#isEnableOverride())
   11. [setEnableAdmin(boolean)](#setEnableAdmin(boolean))
   12. [isEnableAdmin()](#isEnableAdmin())
   13. [setAdminValue(float, float, float, float, float, float, float, float)](#setAdminValue(float,float,float,float,float,float,float,float))
   14. [setAdminValueExterior(float, float, float, float)](#setAdminValueExterior(float,float,float,float))
   15. [setAdminValueInterior(float, float, float, float)](#setAdminValueInterior(float,float,float,float))
   16. [setAdminValue(ClimateColorInfo)](#setAdminValue(zombie.iso.weather.ClimateColorInfo))
   17. [getAdminValue()](#getAdminValue())
   18. [setEnableModded(boolean)](#setEnableModded(boolean))
   19. [setModdedValue(ClimateColorInfo)](#setModdedValue(zombie.iso.weather.ClimateColorInfo))
   20. [getModdedValue()](#getModdedValue())
   21. [setModdedInterpolate(float)](#setModdedInterpolate(float))
   22. [setFinalValue(ClimateColorInfo)](#setFinalValue(zombie.iso.weather.ClimateColorInfo))
   23. [getFinalValue()](#getFinalValue())
   24. [calculate()](#calculate())
   25. [writeAdmin(ByteBufferWriter)](#writeAdmin(zombie.core.network.ByteBufferWriter))
   26. [readAdmin(ByteBufferReader)](#readAdmin(zombie.core.network.ByteBufferReader))
   27. [saveAdmin(DataOutputStream)](#saveAdmin(java.io.DataOutputStream))
   28. [loadAdmin(DataInputStream, int)](#loadAdmin(java.io.DataInputStream,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateManager.ClimateColor
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateManager.ClimateColor

Enclosing class:
:   `ClimateManager`

---

public static class ClimateManager.ClimateColor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ClimateColorInfo`

  `adminValue`

  `protected ClimateColorInfo`

  `finalValue`

  `private int`

  `id`

  `protected ClimateColorInfo`

  `internalValue`

  `protected float`

  `interpolate`

  `private boolean`

  `isAdminOverride`

  `private boolean`

  `isModded`

  `protected boolean`

  `isOverride`

  `private final ClimateColorInfo`

  `moddedValue`

  `private float`

  `modInterpolate`

  `private String`

  `name`

  `protected ClimateColorInfo`

  `override`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClimateColor()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `calculate()`

  `ClimateColorInfo`

  `getAdminValue()`

  `ClimateColorInfo`

  `getFinalValue()`

  `int`

  `getID()`

  `ClimateColorInfo`

  `getInternalValue()`

  `ClimateColorInfo`

  `getModdedValue()`

  `String`

  `getName()`

  `ClimateColorInfo`

  `getOverride()`

  `float`

  `getOverrideInterpolate()`

  `ClimateManager.ClimateColor`

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

  `setAdminValue(float r,
  float g,
  float b,
  float a,
  float r1,
  float g1,
  float b1,
  float a1)`

  `void`

  `setAdminValue(ClimateColorInfo targ)`

  `void`

  `setAdminValueExterior(float r,
  float g,
  float b,
  float a)`

  `void`

  `setAdminValueInterior(float r,
  float g,
  float b,
  float a)`

  `void`

  `setEnableAdmin(boolean b)`

  `void`

  `setEnableModded(boolean b)`

  `void`

  `setEnableOverride(boolean b)`

  `void`

  `setFinalValue(ClimateColorInfo targ)`

  `void`

  `setModdedInterpolate(float f)`

  `void`

  `setModdedValue(ClimateColorInfo targ)`

  `void`

  `setOverride(zombie.core.network.ByteBufferReader input,
  float interp)`

  `void`

  `setOverride(ClimateColorInfo targ,
  float inter)`

  `private void`

  `writeAdmin(zombie.core.network.ByteBufferWriter output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### internalValue

    protected [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") internalValue
  + ### finalValue

    protected [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") finalValue
  + ### isOverride

    protected boolean isOverride
  + ### override

    protected [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") override
  + ### interpolate

    protected float interpolate
  + ### isModded

    private boolean isModded
  + ### moddedValue

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") moddedValue
  + ### modInterpolate

    private float modInterpolate
  + ### isAdminOverride

    private boolean isAdminOverride
  + ### adminValue

    private final [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") adminValue
  + ### id

    private int id
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
* Constructor Details
  -------------------

  + ### ClimateColor

    public ClimateColor()
* Method Details
  --------------

  + ### init

    public [ClimateManager.ClimateColor](ClimateManager.ClimateColor.html "class in zombie.iso.weather") init(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getID

    public int getID()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getInternalValue

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getInternalValue()
  + ### getOverride

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getOverride()
  + ### getOverrideInterpolate

    public float getOverrideInterpolate()
  + ### setOverride

    public void setOverride([ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") targ,
    float inter)
  + ### setOverride

    public void setOverride(zombie.core.network.ByteBufferReader input,
    float interp)
  + ### setEnableOverride

    public void setEnableOverride(boolean b)
  + ### isEnableOverride

    public boolean isEnableOverride()
  + ### setEnableAdmin

    public void setEnableAdmin(boolean b)
  + ### isEnableAdmin

    public boolean isEnableAdmin()
  + ### setAdminValue

    public void setAdminValue(float r,
    float g,
    float b,
    float a,
    float r1,
    float g1,
    float b1,
    float a1)
  + ### setAdminValueExterior

    public void setAdminValueExterior(float r,
    float g,
    float b,
    float a)
  + ### setAdminValueInterior

    public void setAdminValueInterior(float r,
    float g,
    float b,
    float a)
  + ### setAdminValue

    public void setAdminValue([ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") targ)
  + ### getAdminValue

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getAdminValue()
  + ### setEnableModded

    public void setEnableModded(boolean b)
  + ### setModdedValue

    public void setModdedValue([ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") targ)
  + ### getModdedValue

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getModdedValue()
  + ### setModdedInterpolate

    public void setModdedInterpolate(float f)
  + ### setFinalValue

    public void setFinalValue([ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") targ)
  + ### getFinalValue

    public [ClimateColorInfo](ClimateColorInfo.html "class in zombie.iso.weather") getFinalValue()
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