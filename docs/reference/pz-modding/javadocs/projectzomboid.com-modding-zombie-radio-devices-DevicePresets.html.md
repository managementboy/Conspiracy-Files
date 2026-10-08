[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.devices](package-summary.html)
2. [DevicePresets](DevicePresets.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [maxPresets](#maxPresets)
   2. [presets](#presets)
6. [Constructor Details](#constructor-detail)
   1. [DevicePresets()](#%3Cinit%3E())
   2. [DevicePresets(DevicePresets)](#%3Cinit%3E(zombie.radio.devices.DevicePresets))
7. [Method Details](#method-detail)
   1. [getPresetsLua()](#getPresetsLua())
   2. [getPresets()](#getPresets())
   3. [setPresets(ArrayList)](#setPresets(java.util.ArrayList))
   4. [getMaxPresets()](#getMaxPresets())
   5. [setMaxPresets(int)](#setMaxPresets(int))
   6. [addPreset(String, int)](#addPreset(java.lang.String,int))
   7. [removePreset(int)](#removePreset(int))
   8. [getPresetName(int)](#getPresetName(int))
   9. [getPresetFreq(int)](#getPresetFreq(int))
   10. [setPresetName(int, String)](#setPresetName(int,java.lang.String))
   11. [setPresetFreq(int, int)](#setPresetFreq(int,int))
   12. [setPreset(int, String, int)](#setPreset(int,java.lang.String,int))
   13. [clearPresets()](#clearPresets())
   14. [save(ByteBuffer, boolean)](#save(java.nio.ByteBuffer,boolean))
   15. [load(ByteBuffer, int, boolean)](#load(java.nio.ByteBuffer,int,boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class DevicePresets
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.devices.DevicePresets

---

public final class DevicePresets
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

Turrubo

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `maxPresets`

  `private ArrayList<PresetEntry>`

  `presets`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DevicePresets()`

  `DevicePresets(DevicePresets other)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addPreset(String name,
  int frequency)`

  `void`

  `clearPresets()`

  `int`

  `getMaxPresets()`

  `int`

  `getPresetFreq(int id)`

  `String`

  `getPresetName(int id)`

  `ArrayList<PresetEntry>`

  `getPresets()`

  `se.krka.kahlua.vm.KahluaTable`

  `getPresetsLua()`

  `void`

  `load(ByteBuffer input,
  int worldVersion,
  boolean net)`

  `void`

  `removePreset(int id)`

  `void`

  `save(ByteBuffer output,
  boolean net)`

  `void`

  `setMaxPresets(int m)`

  `void`

  `setPreset(int id,
  String name,
  int frequency)`

  `void`

  `setPresetFreq(int id,
  int frequency)`

  `void`

  `setPresetName(int id,
  String name)`

  `void`

  `setPresets(ArrayList<PresetEntry> p)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### maxPresets

    private int maxPresets
  + ### presets

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PresetEntry](PresetEntry.html "class in zombie.radio.devices")> presets
* Constructor Details
  -------------------

  + ### DevicePresets

    public DevicePresets()
  + ### DevicePresets

    public DevicePresets([DevicePresets](DevicePresets.html "class in zombie.radio.devices") other)
* Method Details
  --------------

  + ### getPresetsLua

    public se.krka.kahlua.vm.KahluaTable getPresetsLua()
  + ### getPresets

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PresetEntry](PresetEntry.html "class in zombie.radio.devices")> getPresets()
  + ### setPresets

    public void setPresets([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[PresetEntry](PresetEntry.html "class in zombie.radio.devices")> p)
  + ### getMaxPresets

    public int getMaxPresets()
  + ### setMaxPresets

    public void setMaxPresets(int m)
  + ### addPreset

    public void addPreset([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int frequency)
  + ### removePreset

    public void removePreset(int id)
  + ### getPresetName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPresetName(int id)
  + ### getPresetFreq

    public int getPresetFreq(int id)
  + ### setPresetName

    public void setPresetName(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### setPresetFreq

    public void setPresetFreq(int id,
    int frequency)
  + ### setPreset

    public void setPreset(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int frequency)
  + ### clearPresets

    public void clearPresets()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    boolean net)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`