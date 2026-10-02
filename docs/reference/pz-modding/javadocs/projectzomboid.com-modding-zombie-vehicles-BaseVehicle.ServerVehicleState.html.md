[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [BaseVehicle](BaseVehicle.html)
3. [ServerVehicleState](BaseVehicle.ServerVehicleState.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [z](#z)
   4. [orient](#orient)
   5. [flags](#flags)
   6. [netPlayerAuthorization](#netPlayerAuthorization)
   7. [netPlayerId](#netPlayerId)
6. [Constructor Details](#constructor-detail)
   1. [ServerVehicleState()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setAuthorization(BaseVehicle)](#setAuthorization(zombie.vehicles.BaseVehicle))
   2. [shouldSend(BaseVehicle)](#shouldSend(zombie.vehicles.BaseVehicle))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseVehicle.ServerVehicleState
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.BaseVehicle.ServerVehicleState

Enclosing class:
:   `BaseVehicle`

---

public static final class BaseVehicle.ServerVehicleState
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `short`

  `flags`

  `BaseVehicle.Authorization`

  `netPlayerAuthorization`

  `short`

  `netPlayerId`

  `org.joml.Quaternionf`

  `orient`

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

  `ServerVehicleState()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `setAuthorization(BaseVehicle vehicle)`

  `boolean`

  `shouldSend(BaseVehicle vehicle)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x

    public float x
  + ### y

    public float y
  + ### z

    public float z
  + ### orient

    public org.joml.Quaternionf orient
  + ### flags

    public short flags
  + ### netPlayerAuthorization

    public [BaseVehicle.Authorization](BaseVehicle.Authorization.html "enum class in zombie.vehicles") netPlayerAuthorization
  + ### netPlayerId

    public short netPlayerId
* Constructor Details
  -------------------

  + ### ServerVehicleState

    public ServerVehicleState()
* Method Details
  --------------

  + ### setAuthorization

    public void setAuthorization([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicle)
  + ### shouldSend

    public boolean shouldSend([BaseVehicle](BaseVehicle.html "class in zombie.vehicles") vehicle)