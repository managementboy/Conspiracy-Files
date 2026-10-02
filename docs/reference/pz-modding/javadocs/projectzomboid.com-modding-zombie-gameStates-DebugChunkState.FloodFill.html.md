[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [DebugChunkState](DebugChunkState.html)
3. [FloodFill](DebugChunkState.FloodFill.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [start](#start)
   2. [FLOOD\_SIZE](#FLOOD_SIZE)
   3. [visited](#visited)
   4. [stack](#stack)
   5. [building](#building)
   6. [mover](#mover)
6. [Constructor Details](#constructor-detail)
   1. [FloodFill()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [calculate(Mover, IsoGridSquare)](#calculate(zombie.ai.astar.Mover,zombie.iso.IsoGridSquare))
   2. [shouldVisit(int, int, int, int)](#shouldVisit(int,int,int,int))
   3. [push(int, int)](#push(int,int))
   4. [pop()](#pop())
   5. [gridX(int)](#gridX(int))
   6. [gridY(int)](#gridY(int))
   7. [gridX(IsoGridSquare)](#gridX(zombie.iso.IsoGridSquare))
   8. [gridY(IsoGridSquare)](#gridY(zombie.iso.IsoGridSquare))
   9. [draw()](#draw())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DebugChunkState.FloodFill
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.DebugChunkState.FloodFill

Enclosing class:
:   `DebugChunkState`

---

private class DebugChunkState.FloodFill
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private IsoBuilding`

  `building`

  `private static final int`

  `FLOOD_SIZE`

  `private zombie.ai.astar.Mover`

  `mover`

  `private final Stack<IsoGridSquare>`

  `stack`

  `private IsoGridSquare`

  `start`

  `private final zombie.core.utils.BooleanGrid`

  `visited`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FloodFill()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `calculate(zombie.ai.astar.Mover mv,
  IsoGridSquare sq)`

  `private void`

  `draw()`

  `private int`

  `gridX(int x)`

  `private int`

  `gridX(IsoGridSquare sq)`

  `private int`

  `gridY(int y)`

  `private int`

  `gridY(IsoGridSquare sq)`

  `private IsoGridSquare`

  `pop()`

  `private boolean`

  `push(int x,
  int y)`

  `private boolean`

  `shouldVisit(int x1,
  int y1,
  int x2,
  int y2)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### start

    private [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") start
  + ### FLOOD\_SIZE

    private static final int FLOOD\_SIZE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.DebugChunkState.FloodFill.FLOOD_SIZE)
  + ### visited

    private final zombie.core.utils.BooleanGrid visited
  + ### stack

    private final [Stack](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Stack.html "class or interface in java.util")<[IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso")> stack
  + ### building

    private [IsoBuilding](../iso/areas/IsoBuilding.html "class in zombie.iso.areas") building
  + ### mover

    private zombie.ai.astar.Mover mover
* Constructor Details
  -------------------

  + ### FloodFill

    private FloodFill()
* Method Details
  --------------

  + ### calculate

    private void calculate(zombie.ai.astar.Mover mv,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### shouldVisit

    private boolean shouldVisit(int x1,
    int y1,
    int x2,
    int y2)
  + ### push

    private boolean push(int x,
    int y)
  + ### pop

    private [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") pop()
  + ### gridX

    private int gridX(int x)
  + ### gridY

    private int gridY(int y)
  + ### gridX

    private int gridX([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### gridY

    private int gridY([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### draw

    private void draw()