[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoLightSource](IsoLightSource.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [nextId](#nextId)
   2. [id](#id)
   3. [x](#x)
   4. [y](#y)
   5. [z](#z)
   6. [r](#r)
   7. [g](#g)
   8. [b](#b)
   9. [rJni](#rJni)
   10. [gJni](#gJni)
   11. [bJni](#bJni)
   12. [radius](#radius)
   13. [active](#active)
   14. [wasActive](#wasActive)
   15. [activeJni](#activeJni)
   16. [life](#life)
   17. [startlife](#startlife)
   18. [localToBuilding](#localToBuilding)
   19. [hydroPowered](#hydroPowered)
   20. [switches](#switches)
   21. [chunk](#chunk)
   22. [lightMap](#lightMap)
6. [Constructor Details](#constructor-detail)
   1. [IsoLightSource(int, int, int, float, float, float, int)](#%3Cinit%3E(int,int,int,float,float,float,int))
   2. [IsoLightSource(int, int, int, float, float, float, int, IsoBuilding)](#%3Cinit%3E(int,int,int,float,float,float,int,zombie.iso.areas.IsoBuilding))
   3. [IsoLightSource(int, int, int, float, float, float, int, int)](#%3Cinit%3E(int,int,int,float,float,float,int,int))
7. [Method Details](#method-detail)
   1. [update()](#update())
   2. [getX()](#getX())
   3. [setX(int)](#setX(int))
   4. [getY()](#getY())
   5. [setY(int)](#setY(int))
   6. [getZ()](#getZ())
   7. [setZ(int)](#setZ(int))
   8. [getR()](#getR())
   9. [setR(float)](#setR(float))
   10. [getG()](#getG())
   11. [setG(float)](#setG(float))
   12. [getB()](#getB())
   13. [setB(float)](#setB(float))
   14. [getRadius()](#getRadius())
   15. [setRadius(int)](#setRadius(int))
   16. [isActive()](#isActive())
   17. [setActive(boolean)](#setActive(boolean))
   18. [wasActive()](#wasActive())
   19. [setWasActive(boolean)](#setWasActive(boolean))
   20. [getSwitches()](#getSwitches())
   21. [setSwitches(ArrayList)](#setSwitches(java.util.ArrayList))
   22. [clearInfluence()](#clearInfluence())
   23. [isInBounds(int, int, int, int)](#isInBounds(int,int,int,int))
   24. [isInBounds()](#isInBounds())
   25. [isHydroPowered()](#isHydroPowered())
   26. [getLocalToBuilding()](#getLocalToBuilding())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoLightSource
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoLightSource

---

public class IsoLightSource
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `active`

  `boolean`

  `activeJni`

  `float`

  `b`

  `float`

  `bJni`

  `IsoChunk`

  `chunk`

  `float`

  `g`

  `float`

  `gJni`

  `boolean`

  `hydroPowered`

  `int`

  `id`

  `int`

  `life`

  `Object`

  `lightMap`

  `IsoBuilding`

  `localToBuilding`

  `static int`

  `nextId`

  `float`

  `r`

  `int`

  `radius`

  `float`

  `rJni`

  `int`

  `startlife`

  `ArrayList<IsoLightSwitch>`

  `switches`

  `boolean`

  `wasActive`

  `int`

  `x`

  `int`

  `y`

  `int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoLightSource(int x,
  int y,
  int z,
  float r,
  float g,
  float b,
  int radius)`

  `IsoLightSource(int x,
  int y,
  int z,
  float r,
  float g,
  float b,
  int radius,
  int life)`

  `IsoLightSource(int x,
  int y,
  int z,
  float r,
  float g,
  float b,
  int radius,
  IsoBuilding building)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `clearInfluence()`

  `float`

  `getB()`

  `float`

  `getG()`

  `IsoBuilding`

  `getLocalToBuilding()`

  `float`

  `getR()`

  `int`

  `getRadius()`

  `ArrayList<IsoLightSwitch>`

  `getSwitches()`

  `int`

  `getX()`

  `int`

  `getY()`

  `int`

  `getZ()`

  `boolean`

  `isActive()`

  `boolean`

  `isHydroPowered()`

  `boolean`

  `isInBounds()`

  `boolean`

  `isInBounds(int minX,
  int minY,
  int maxX,
  int maxY)`

  `void`

  `setActive(boolean bActive)`

  `void`

  `setB(float b)`

  `void`

  `setG(float g)`

  `void`

  `setR(float r)`

  `void`

  `setRadius(int radius)`

  `void`

  `setSwitches(ArrayList<IsoLightSwitch> switches)`

  `void`

  `setWasActive(boolean bWasActive)`

  `void`

  `setX(int x)`

  `void`

  `setY(int y)`

  `void`

  `setZ(int z)`

  `void`

  `update()`

  Deprecated.

  `boolean`

  `wasActive()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### nextId

    public static int nextId
  + ### id

    public int id
  + ### x

    public int x
  + ### y

    public int y
  + ### z

    public int z
  + ### r

    public float r
  + ### g

    public float g
  + ### b

    public float b
  + ### rJni

    public float rJni
  + ### gJni

    public float gJni
  + ### bJni

    public float bJni
  + ### radius

    public int radius
  + ### active

    public boolean active
  + ### wasActive

    public boolean wasActive
  + ### activeJni

    public boolean activeJni
  + ### life

    public int life
  + ### startlife

    public int startlife
  + ### localToBuilding

    public [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") localToBuilding
  + ### hydroPowered

    public boolean hydroPowered
  + ### switches

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoLightSwitch](objects/IsoLightSwitch.html "class in zombie.iso.objects")> switches
  + ### chunk

    public [IsoChunk](IsoChunk.html "class in zombie.iso") chunk
  + ### lightMap

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") lightMap
* Constructor Details
  -------------------

  + ### IsoLightSource

    public IsoLightSource(int x,
    int y,
    int z,
    float r,
    float g,
    float b,
    int radius)
  + ### IsoLightSource

    public IsoLightSource(int x,
    int y,
    int z,
    float r,
    float g,
    float b,
    int radius,
    [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") building)
  + ### IsoLightSource

    public IsoLightSource(int x,
    int y,
    int z,
    float r,
    float g,
    float b,
    int radius,
    int life)
* Method Details
  --------------

  + ### update

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void update()

    Deprecated.
  + ### getX

    public int getX()

    Returns:
    :   the x
  + ### setX

    public void setX(int x)

    Parameters:
    :   `x` - the x to set
  + ### getY

    public int getY()

    Returns:
    :   the y
  + ### setY

    public void setY(int y)

    Parameters:
    :   `y` - the y to set
  + ### getZ

    public int getZ()

    Returns:
    :   the z
  + ### setZ

    public void setZ(int z)

    Parameters:
    :   `z` - the z to set
  + ### getR

    public float getR()

    Returns:
    :   the r
  + ### setR

    public void setR(float r)

    Parameters:
    :   `r` - the r to set
  + ### getG

    public float getG()

    Returns:
    :   the g
  + ### setG

    public void setG(float g)

    Parameters:
    :   `g` - the g to set
  + ### getB

    public float getB()

    Returns:
    :   the b
  + ### setB

    public void setB(float b)

    Parameters:
    :   `b` - the b to set
  + ### getRadius

    public int getRadius()

    Returns:
    :   the radius
  + ### setRadius

    public void setRadius(int radius)

    Parameters:
    :   `radius` - the radius to set
  + ### isActive

    public boolean isActive()

    Returns:
    :   the bActive
  + ### setActive

    public void setActive(boolean bActive)

    Parameters:
    :   `bActive` - the bActive to set
  + ### wasActive

    public boolean wasActive()

    Returns:
    :   the bWasActive
  + ### setWasActive

    public void setWasActive(boolean bWasActive)

    Parameters:
    :   `bWasActive` - the bWasActive to set
  + ### getSwitches

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoLightSwitch](objects/IsoLightSwitch.html "class in zombie.iso.objects")> getSwitches()

    Returns:
    :   the switches
  + ### setSwitches

    public void setSwitches([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoLightSwitch](objects/IsoLightSwitch.html "class in zombie.iso.objects")> switches)

    Parameters:
    :   `switches` - the switches to set
  + ### clearInfluence

    public void clearInfluence()
  + ### isInBounds

    public boolean isInBounds(int minX,
    int minY,
    int maxX,
    int maxY)
  + ### isInBounds

    public boolean isInBounds()
  + ### isHydroPowered

    public boolean isHydroPowered()
  + ### getLocalToBuilding

    public [IsoBuilding](areas/IsoBuilding.html "class in zombie.iso.areas") getLocalToBuilding()