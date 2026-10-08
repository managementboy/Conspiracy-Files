[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.debug](package-summary.html)
2. [EntityDebugTest](EntityDebugTest.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [entityDebugTests](#entityDebugTests)
   2. [B\_BUILD\_PIPES](#B_BUILD_PIPES)
   3. [B\_BUILD\_WIRES](#B_BUILD_WIRES)
   4. [tilePipeEastWest](#tilePipeEastWest)
   5. [tilePipeNorthSouth](#tilePipeNorthSouth)
   6. [tileWireEastWest](#tileWireEastWest)
   7. [tileWireNorthSouth](#tileWireNorthSouth)
7. [Constructor Details](#constructor-detail)
   1. [EntityDebugTest()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [CreateTest(EntityDebugTestType, IsoGridSquare)](#CreateTest(zombie.entity.debug.EntityDebugTestType,zombie.iso.IsoGridSquare))
   2. [Update()](#Update())
   3. [Reset()](#Reset())
   4. [create(IsoGridSquare)](#create(zombie.iso.IsoGridSquare))
   5. [update()](#update())
   6. [createEntity(IsoGridSquare, String)](#createEntity(zombie.iso.IsoGridSquare,java.lang.String))
   7. [createDummyObject(IsoGridSquare, String)](#createDummyObject(zombie.iso.IsoGridSquare,java.lang.String))
   8. [createPipes(IsoGridSquare, IsoDirections, int, boolean)](#createPipes(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections,int,boolean))
   9. [createWires(IsoGridSquare, IsoDirections, int, boolean)](#createWires(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections,int,boolean))
   10. [createUtility(IsoGridSquare, IsoDirections, int, boolean, String, String)](#createUtility(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections,int,boolean,java.lang.String,java.lang.String))
   11. [isObjectConnected(IsoObject, IsoDirections, boolean)](#isObjectConnected(zombie.iso.IsoObject,zombie.iso.IsoDirections,boolean))
   12. [squareContainsSprite(IsoGridSquare, String)](#squareContainsSprite(zombie.iso.IsoGridSquare,java.lang.String))
   13. [isRunning(IsoObject)](#isRunning(zombie.iso.IsoObject))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class EntityDebugTest
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.debug.EntityDebugTest

Direct Known Subclasses:
:   `EntityDebugTest.BaseTest`

---

public abstract class EntityDebugTest
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `EntityDebugTest.BaseTest`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final boolean`

  `B_BUILD_PIPES`

  `private static final boolean`

  `B_BUILD_WIRES`

  `private static final ArrayList<EntityDebugTest>`

  `entityDebugTests`

  `private static final String`

  `tilePipeEastWest`

  `private static final String`

  `tilePipeNorthSouth`

  `private static final String`

  `tileWireEastWest`

  `private static final String`

  `tileWireNorthSouth`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `EntityDebugTest()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `abstract void`

  `create(IsoGridSquare square)`

  `protected IsoObject`

  `createDummyObject(IsoGridSquare square,
  String spriteName)`

  `protected IsoObject`

  `createEntity(IsoGridSquare square,
  String scriptName)`

  `protected IsoGridSquare`

  `createPipes(IsoGridSquare square,
  IsoDirections dir,
  int tileCnt,
  boolean doBuild)`

  `static void`

  `CreateTest(EntityDebugTestType type,
  IsoGridSquare square)`

  `protected IsoGridSquare`

  `createUtility(IsoGridSquare square,
  IsoDirections dir,
  int tileCnt,
  boolean doBuild,
  String north,
  String east)`

  `protected IsoGridSquare`

  `createWires(IsoGridSquare square,
  IsoDirections dir,
  int tileCnt,
  boolean doBuild)`

  `protected boolean`

  `isObjectConnected(IsoObject object,
  IsoDirections dir,
  boolean isWires)`

  `protected boolean`

  `isRunning(IsoObject object)`

  `static void`

  `Reset()`

  `protected boolean`

  `squareContainsSprite(IsoGridSquare square,
  String testSprite)`

  `abstract void`

  `update()`

  `static void`

  `Update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### entityDebugTests

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[EntityDebugTest](EntityDebugTest.html "class in zombie.entity.debug")> entityDebugTests
  + ### B\_BUILD\_PIPES

    private static final boolean B\_BUILD\_PIPES

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.entity.debug.EntityDebugTest.B_BUILD_PIPES)
  + ### B\_BUILD\_WIRES

    private static final boolean B\_BUILD\_WIRES

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.entity.debug.EntityDebugTest.B_BUILD_WIRES)
  + ### tilePipeEastWest

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilePipeEastWest

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.entity.debug.EntityDebugTest.tilePipeEastWest)
  + ### tilePipeNorthSouth

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tilePipeNorthSouth

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.entity.debug.EntityDebugTest.tilePipeNorthSouth)
  + ### tileWireEastWest

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileWireEastWest

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.entity.debug.EntityDebugTest.tileWireEastWest)
  + ### tileWireNorthSouth

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tileWireNorthSouth

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.entity.debug.EntityDebugTest.tileWireNorthSouth)
* Constructor Details
  -------------------

  + ### EntityDebugTest

    public EntityDebugTest()
* Method Details
  --------------

  + ### CreateTest

    public static void CreateTest([EntityDebugTestType](EntityDebugTestType.html "enum class in zombie.entity.debug") type,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### Update

    public static void Update()
  + ### Reset

    public static void Reset()
  + ### create

    public abstract void create([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### update

    public abstract void update()
  + ### createEntity

    protected [IsoObject](../../iso/IsoObject.html "class in zombie.iso") createEntity([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName)
  + ### createDummyObject

    protected [IsoObject](../../iso/IsoObject.html "class in zombie.iso") createDummyObject([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### createPipes

    protected [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") createPipes([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") dir,
    int tileCnt,
    boolean doBuild)
  + ### createWires

    protected [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") createWires([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") dir,
    int tileCnt,
    boolean doBuild)
  + ### createUtility

    protected [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") createUtility([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") dir,
    int tileCnt,
    boolean doBuild,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") north,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") east)
  + ### isObjectConnected

    protected boolean isObjectConnected([IsoObject](../../iso/IsoObject.html "class in zombie.iso") object,
    [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") dir,
    boolean isWires)
  + ### squareContainsSprite

    protected boolean squareContainsSprite([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") testSprite)
  + ### isRunning

    protected boolean isRunning([IsoObject](../../iso/IsoObject.html "class in zombie.iso") object)