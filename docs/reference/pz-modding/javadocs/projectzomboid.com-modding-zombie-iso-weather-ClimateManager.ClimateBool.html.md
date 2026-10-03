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
3. [ClimateBool](ClimateManager.ClimateBool.html)

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
   5. [isModded](#isModded)
   6. [moddedValue](#moddedValue)
   7. [isAdminOverride](#isAdminOverride)
   8. [adminValue](#adminValue)
   9. [id](#id)
   10. [name](#name)
6. [Constructor Details](#constructor-detail)
   1. [ClimateBool()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(int, String)](#init(int,java.lang.String))
   2. [getID()](#getID())
   3. [getName()](#getName())
   4. [getInternalValue()](#getInternalValue())
   5. [getOverride()](#getOverride())
   6. [setOverride(boolean)](#setOverride(boolean))
   7. [setEnableOverride(boolean)](#setEnableOverride(boolean))
   8. [isEnableOverride()](#isEnableOverride())
   9. [setEnableAdmin(boolean)](#setEnableAdmin(boolean))
   10. [isEnableAdmin()](#isEnableAdmin())
   11. [setAdminValue(boolean)](#setAdminValue(boolean))
   12. [getAdminValue()](#getAdminValue())
   13. [setEnableModded(boolean)](#setEnableModded(boolean))
   14. [setModdedValue(boolean)](#setModdedValue(boolean))
   15. [getModdedValue()](#getModdedValue())
   16. [setFinalValue(boolean)](#setFinalValue(boolean))
   17. [calculate()](#calculate())
   18. [writeAdmin(ByteBufferWriter)](#writeAdmin(zombie.core.network.ByteBufferWriter))
   19. [readAdmin(ByteBufferReader)](#readAdmin(zombie.core.network.ByteBufferReader))
   20. [saveAdmin(DataOutputStream)](#saveAdmin(java.io.DataOutputStream))
   21. [loadAdmin(DataInputStream, int)](#loadAdmin(java.io.DataInputStream,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ClimateManager.ClimateBool
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.weather.ClimateManager.ClimateBool

Enclosing class:
:   `ClimateManager`

---

public static class ClimateManager.ClimateBool
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `adminValue`

  `protected boolean`

  `finalValue`

  `private int`

  `id`

  `protected boolean`

  `internalValue`

  `private boolean`

  `isAdminOverride`

  `private boolean`

  `isModded`

  `protected boolean`

  `isOverride`

  `private boolean`

  `moddedValue`

  `private String`

  `name`

  `protected boolean`

  `override`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ClimateBool()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `calculate()`

  `boolean`

  `getAdminValue()`

  `int`

  `getID()`

  `boolean`

  `getInternalValue()`

  `boolean`

  `getModdedValue()`

  `String`

  `getName()`

  `boolean`

  `getOverride()`

  `ClimateManager.ClimateBool`

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

  `setAdminValue(boolean b)`

  `void`

  `setEnableAdmin(boolean b)`

  `void`

  `setEnableModded(boolean b)`

  `void`

  `setEnableOverride(boolean b)`

  `void`

  `setFinalValue(boolean b)`

  `void`

  `setModdedValue(boolean b)`

  `void`

  `setOverride(boolean b)`

  `private void`

  `writeAdmin(zombie.core.network.ByteBufferWriter output)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### internalValue

    protected boolean internalValue
  + ### finalValue

    protected boolean finalValue
  + ### isOverride

    protected boolean isOverride
  + ### override

    protected boolean override
  + ### isModded

    private boolean isModded
  + ### moddedValue

    private boolean moddedValue
  + ### isAdminOverride

    private boolean isAdminOverride
  + ### adminValue

    private boolean adminValue
  + ### id

    private int id
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
* Constructor Details
  -------------------

  + ### ClimateBool

    public ClimateBool()
* Method Details
  --------------

  + ### init

    public [ClimateManager.ClimateBool](ClimateManager.ClimateBool.html "class in zombie.iso.weather") init(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getID

    public int getID()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getInternalValue

    public boolean getInternalValue()
  + ### getOverride

    public boolean getOverride()
  + ### setOverride

    public void setOverride(boolean b)
  + ### setEnableOverride

    public void setEnableOverride(boolean b)
  + ### isEnableOverride

    public boolean isEnableOverride()
  + ### setEnableAdmin

    public void setEnableAdmin(boolean b)
  + ### isEnableAdmin

    public boolean isEnableAdmin()
  + ### setAdminValue

    public void setAdminValue(boolean b)
  + ### getAdminValue

    public boolean getAdminValue()
  + ### setEnableModded

    public void setEnableModded(boolean b)
  + ### setModdedValue

    public void setModdedValue(boolean b)
  + ### getModdedValue

    public boolean getModdedValue()
  + ### setFinalValue

    public void setFinalValue(boolean b)
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