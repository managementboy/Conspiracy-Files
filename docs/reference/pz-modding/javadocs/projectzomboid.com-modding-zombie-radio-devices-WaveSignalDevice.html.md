[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.devices](package-summary.html)
2. [WaveSignalDevice](WaveSignalDevice.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [getDeviceData()](#getDeviceData())
   2. [setDeviceData(DeviceData)](#setDeviceData(zombie.radio.devices.DeviceData))
   3. [getDelta()](#getDelta())
   4. [setDelta(float)](#setDelta(float))
   5. [getSquare()](#getSquare())
   6. [getX()](#getX())
   7. [getY()](#getY())
   8. [getZ()](#getZ())
   9. [AddDeviceText(String, float, float, float, String, String, int)](#AddDeviceText(java.lang.String,float,float,float,java.lang.String,java.lang.String,int))
   10. [HasPlayerInRange()](#HasPlayerInRange())
   11. [AddDeviceText(IsoPlayer, String, float, float, float, String, String, int)](#AddDeviceText(zombie.characters.IsoPlayer,java.lang.String,float,float,float,java.lang.String,java.lang.String,int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Interface WaveSignalDevice
==========================

All Known Implementing Classes:
:   `IsoRadio, IsoTelevision, IsoWaveSignal, Radio, VehiclePart`

---

public interface WaveSignalDevice

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsDefault Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddDeviceText(String line,
  float r,
  float g,
  float b,
  String guid,
  String codes,
  int distance)`

  `default void`

  `AddDeviceText(IsoPlayer player,
  String line,
  float r,
  float g,
  float b,
  String guid,
  String codes,
  int distance)`

  `float`

  `getDelta()`

  `DeviceData`

  `getDeviceData()`

  `IsoGridSquare`

  `getSquare()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `boolean`

  `HasPlayerInRange()`

  `void`

  `setDelta(float d)`

  `void`

  `setDeviceData(DeviceData data)`

* Method Details
  --------------

  + ### getDeviceData

    [DeviceData](DeviceData.html "class in zombie.radio.devices") getDeviceData()
  + ### setDeviceData

    void setDeviceData([DeviceData](DeviceData.html "class in zombie.radio.devices") data)
  + ### getDelta

    float getDelta()
  + ### setDelta

    void setDelta(float d)
  + ### getSquare

    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getSquare()
  + ### getX

    float getX()
  + ### getY

    float getY()
  + ### getZ

    float getZ()
  + ### AddDeviceText

    void AddDeviceText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    int distance)
  + ### HasPlayerInRange

    boolean HasPlayerInRange()
  + ### AddDeviceText

    default void AddDeviceText([IsoPlayer](../../characters/IsoPlayer.html "class in zombie.characters") player,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    float r,
    float g,
    float b,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") codes,
    int distance)