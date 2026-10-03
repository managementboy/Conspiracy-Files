[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [ObjectRenderEffects](ObjectRenderEffects.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [ENABLED](#ENABLED)
   2. [pool](#pool)
   3. [x1](#x1)
   4. [y1](#y1)
   5. [x2](#x2)
   6. [y2](#y2)
   7. [x3](#x3)
   8. [y3](#y3)
   9. [x4](#x4)
   10. [y4](#y4)
   11. [tx1](#tx1)
   12. [ty1](#ty1)
   13. [tx2](#tx2)
   14. [ty2](#ty2)
   15. [tx3](#tx3)
   16. [ty3](#ty3)
   17. [tx4](#tx4)
   18. [ty4](#ty4)
   19. [lx1](#lx1)
   20. [ly1](#ly1)
   21. [lx2](#lx2)
   22. [ly2](#ly2)
   23. [lx3](#lx3)
   24. [ly3](#ly3)
   25. [lx4](#lx4)
   26. [ly4](#ly4)
   27. [maxX](#maxX)
   28. [maxY](#maxY)
   29. [curTime](#curTime)
   30. [maxTime](#maxTime)
   31. [totalTime](#totalTime)
   32. [totalMaxTime](#totalMaxTime)
   33. [type](#type)
   34. [parent](#parent)
   35. [finish](#finish)
   36. [isTree](#isTree)
   37. [isBig](#isBig)
   38. [gust](#gust)
   39. [windType](#windType)
   40. [T\_MOD](#T_MOD)
   41. [windCount](#windCount)
   42. [windCountTree](#windCountTree)
   43. [EFFECTS\_COUNT](#EFFECTS_COUNT)
   44. [TYPE\_COUNT](#TYPE_COUNT)
   45. [WIND\_EFFECTS](#WIND_EFFECTS)
   46. [WIND\_EFFECTS\_TREES](#WIND_EFFECTS_TREES)
   47. [DYNAMIC\_EFFECTS](#DYNAMIC_EFFECTS)
   48. [randomRustle](#randomRustle)
   49. [randomRustleTime](#randomRustleTime)
   50. [randomRustleTotalTime](#randomRustleTotalTime)
   51. [randomRustleTarget](#randomRustleTarget)
   52. [randomRustleType](#randomRustleType)
6. [Constructor Details](#constructor-detail)
   1. [ObjectRenderEffects()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [alloc()](#alloc())
   2. [release(ObjectRenderEffects)](#release(zombie.iso.objects.ObjectRenderEffects))
   3. [reset()](#reset())
   4. [getNew(IsoObject, RenderEffectType, boolean)](#getNew(zombie.iso.IsoObject,zombie.iso.objects.RenderEffectType,boolean))
   5. [getNew(IsoObject, RenderEffectType, boolean, boolean)](#getNew(zombie.iso.IsoObject,zombie.iso.objects.RenderEffectType,boolean,boolean))
   6. [getNextWindEffect(int, boolean)](#getNextWindEffect(int,boolean))
   7. [init()](#init())
   8. [update()](#update())
   9. [update(float, float)](#update(float,float))
   10. [updateOLD(float, float)](#updateOLD(float,float))
   11. [lerpAll(float)](#lerpAll(float))
   12. [swapTargetToLast()](#swapTargetToLast())
   13. [copyMainFromOther(ObjectRenderEffects)](#copyMainFromOther(zombie.iso.objects.ObjectRenderEffects))
   14. [add(ObjectRenderEffects)](#add(zombie.iso.objects.ObjectRenderEffects))
   15. [updateStatic()](#updateStatic())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ObjectRenderEffects
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.objects.ObjectRenderEffects

---

public class ObjectRenderEffects
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `curTime`

  `private static final ArrayList<ObjectRenderEffects>`

  `DYNAMIC_EFFECTS`

  `private static final int`

  `EFFECTS_COUNT`

  `static final boolean`

  `ENABLED`

  `private boolean`

  `finish`

  `private boolean`

  `gust`

  `private boolean`

  `isBig`

  `private boolean`

  `isTree`

  `private double`

  `lx1`

  `private double`

  `lx2`

  `private double`

  `lx3`

  `private double`

  `lx4`

  `private double`

  `ly1`

  `private double`

  `ly2`

  `private double`

  `ly3`

  `private double`

  `ly4`

  `private float`

  `maxTime`

  `private double`

  `maxX`

  `private double`

  `maxY`

  `private IsoObject`

  `parent`

  `private static final ArrayDeque<ObjectRenderEffects>`

  `pool`

  `private static ObjectRenderEffects`

  `randomRustle`

  `private static int`

  `randomRustleTarget`

  `private static float`

  `randomRustleTime`

  `private static float`

  `randomRustleTotalTime`

  `private static int`

  `randomRustleType`

  `private static final float`

  `T_MOD`

  `private float`

  `totalMaxTime`

  `private float`

  `totalTime`

  `private double`

  `tx1`

  `private double`

  `tx2`

  `private double`

  `tx3`

  `private double`

  `tx4`

  `private double`

  `ty1`

  `private double`

  `ty2`

  `private double`

  `ty3`

  `private double`

  `ty4`

  `private zombie.iso.objects.RenderEffectType`

  `type`

  `private static final int`

  `TYPE_COUNT`

  `private static final ObjectRenderEffects[][]`

  `WIND_EFFECTS`

  `private static final ObjectRenderEffects[][]`

  `WIND_EFFECTS_TREES`

  `private static int`

  `windCount`

  `private static int`

  `windCountTree`

  `private int`

  `windType`

  `double`

  `x1`

  `double`

  `x2`

  `double`

  `x3`

  `double`

  `x4`

  `double`

  `y1`

  `double`

  `y2`

  `double`

  `y3`

  `double`

  `y4`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ObjectRenderEffects()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `add(ObjectRenderEffects other)`

  `static ObjectRenderEffects`

  `alloc()`

  `void`

  `copyMainFromOther(ObjectRenderEffects other)`

  `static ObjectRenderEffects`

  `getNew(IsoObject parent,
  zombie.iso.objects.RenderEffectType t,
  boolean reuseEqualType)`

  `static ObjectRenderEffects`

  `getNew(IsoObject parent,
  zombie.iso.objects.RenderEffectType t,
  boolean reuseEqualType,
  boolean dontAdd)`

  `static ObjectRenderEffects`

  `getNextWindEffect(int windType,
  boolean isTreeLike)`

  `static void`

  `init()`

  `private void`

  `lerpAll(float t)`

  `static void`

  `release(ObjectRenderEffects o)`

  `private ObjectRenderEffects`

  `reset()`

  `private void`

  `swapTargetToLast()`

  `boolean`

  `update()`

  `private void`

  `update(float wind,
  float angle)`

  `private void`

  `updateOLD(float wind,
  float angle)`

  `static void`

  `updateStatic()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### ENABLED

    public static final boolean ENABLED

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.ObjectRenderEffects.ENABLED)
  + ### pool

    private static final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects")> pool
  + ### x1

    public double x1
  + ### y1

    public double y1
  + ### x2

    public double x2
  + ### y2

    public double y2
  + ### x3

    public double x3
  + ### y3

    public double y3
  + ### x4

    public double x4
  + ### y4

    public double y4
  + ### tx1

    private double tx1
  + ### ty1

    private double ty1
  + ### tx2

    private double tx2
  + ### ty2

    private double ty2
  + ### tx3

    private double tx3
  + ### ty3

    private double ty3
  + ### tx4

    private double tx4
  + ### ty4

    private double ty4
  + ### lx1

    private double lx1
  + ### ly1

    private double ly1
  + ### lx2

    private double lx2
  + ### ly2

    private double ly2
  + ### lx3

    private double lx3
  + ### ly3

    private double ly3
  + ### lx4

    private double lx4
  + ### ly4

    private double ly4
  + ### maxX

    private double maxX
  + ### maxY

    private double maxY
  + ### curTime

    private float curTime
  + ### maxTime

    private float maxTime
  + ### totalTime

    private float totalTime
  + ### totalMaxTime

    private float totalMaxTime
  + ### type

    private zombie.iso.objects.RenderEffectType type
  + ### parent

    private [IsoObject](../IsoObject.html "class in zombie.iso") parent
  + ### finish

    private boolean finish
  + ### isTree

    private boolean isTree
  + ### isBig

    private boolean isBig
  + ### gust

    private boolean gust
  + ### windType

    private int windType
  + ### T\_MOD

    private static final float T\_MOD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.ObjectRenderEffects.T_MOD)
  + ### windCount

    private static int windCount
  + ### windCountTree

    private static int windCountTree
  + ### EFFECTS\_COUNT

    private static final int EFFECTS\_COUNT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.ObjectRenderEffects.EFFECTS_COUNT)
  + ### TYPE\_COUNT

    private static final int TYPE\_COUNT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.objects.ObjectRenderEffects.TYPE_COUNT)
  + ### WIND\_EFFECTS

    private static final [ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects")[][] WIND\_EFFECTS
  + ### WIND\_EFFECTS\_TREES

    private static final [ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects")[][] WIND\_EFFECTS\_TREES
  + ### DYNAMIC\_EFFECTS

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects")> DYNAMIC\_EFFECTS
  + ### randomRustle

    private static [ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects") randomRustle
  + ### randomRustleTime

    private static float randomRustleTime
  + ### randomRustleTotalTime

    private static float randomRustleTotalTime
  + ### randomRustleTarget

    private static int randomRustleTarget
  + ### randomRustleType

    private static int randomRustleType
* Constructor Details
  -------------------

  + ### ObjectRenderEffects

    private ObjectRenderEffects()
* Method Details
  --------------

  + ### alloc

    public static [ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects") alloc()
  + ### release

    public static void release([ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects") o)
  + ### reset

    private [ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects") reset()
  + ### getNew

    public static [ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects") getNew([IsoObject](../IsoObject.html "class in zombie.iso") parent,
    zombie.iso.objects.RenderEffectType t,
    boolean reuseEqualType)
  + ### getNew

    public static [ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects") getNew([IsoObject](../IsoObject.html "class in zombie.iso") parent,
    zombie.iso.objects.RenderEffectType t,
    boolean reuseEqualType,
    boolean dontAdd)
  + ### getNextWindEffect

    public static [ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects") getNextWindEffect(int windType,
    boolean isTreeLike)
  + ### init

    public static void init()
  + ### update

    public boolean update()
  + ### update

    private void update(float wind,
    float angle)
  + ### updateOLD

    private void updateOLD(float wind,
    float angle)
  + ### lerpAll

    private void lerpAll(float t)
  + ### swapTargetToLast

    private void swapTargetToLast()
  + ### copyMainFromOther

    public void copyMainFromOther([ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects") other)
  + ### add

    public void add([ObjectRenderEffects](ObjectRenderEffects.html "class in zombie.iso.objects") other)
  + ### updateStatic

    public static void updateStatic()