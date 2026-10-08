[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.radio.StorySounds](package-summary.html)
2. [SLSoundManager](SLSoundManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [enabled](#enabled)
   2. [debug](#debug)
   3. [luaDebug](#luaDebug)
   4. [emitter](#emitter)
   5. [instance](#instance)
   6. [state](#state)
   7. [storySounds](#storySounds)
   8. [nextTick](#nextTick)
   9. [borderCenterX](#borderCenterX)
   10. [borderCenterY](#borderCenterY)
   11. [borderRadiusMin](#borderRadiusMin)
   12. [borderRadiusMax](#borderRadiusMax)
   13. [borderScale](#borderScale)
6. [Constructor Details](#constructor-detail)
   1. [SLSoundManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [getDebug()](#getDebug())
   3. [getLuaDebug()](#getLuaDebug())
   4. [getStorySounds()](#getStorySounds())
   5. [print(String)](#print(java.lang.String))
   6. [init()](#init())
   7. [loadSounds()](#loadSounds())
   8. [addStorySound(StorySound)](#addStorySound(zombie.radio.StorySounds.StorySound))
   9. [updateKeys()](#updateKeys())
   10. [update(int, int, int)](#update(int,int,int))
   11. [thunderTest()](#thunderTest())
   12. [render()](#render())
   13. [renderDebug()](#renderDebug())
   14. [renderLine(UIFont, String, int, int)](#renderLine(zombie.ui.UIFont,java.lang.String,int,int))
   15. [getRandomBorderPosition()](#getRandomBorderPosition())
   16. [getRandomBorderRange()](#getRandomBorderRange())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class SLSoundManager
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.StorySounds.SLSoundManager

---

public final class SLSoundManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final float`

  `borderCenterX`

  `private final float`

  `borderCenterY`

  `private final float`

  `borderRadiusMax`

  `private final float`

  `borderRadiusMin`

  `private final float`

  `borderScale`

  `static boolean`

  `debug`

  `static zombie.radio.StorySounds.StoryEmitter`

  `emitter`

  `static boolean`

  `enabled`

  `private static SLSoundManager`

  `instance`

  `static boolean`

  `luaDebug`

  `private int`

  `nextTick`

  `private final HashMap<Integer,Boolean>`

  `state`

  `private final ArrayList<StorySound>`

  `storySounds`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SLSoundManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addStorySound(StorySound storySound)`

  `boolean`

  `getDebug()`

  `static SLSoundManager`

  `getInstance()`

  `boolean`

  `getLuaDebug()`

  `Vector2`

  `getRandomBorderPosition()`

  `float`

  `getRandomBorderRange()`

  `ArrayList<StorySound>`

  `getStorySounds()`

  `void`

  `init()`

  `void`

  `loadSounds()`

  `void`

  `print(String line)`

  `void`

  `render()`

  `void`

  `renderDebug()`

  `private void`

  `renderLine(UIFont font,
  String line,
  int x,
  int y)`

  `void`

  `thunderTest()`

  `void`

  `update(int storylineDay,
  int hour,
  int min)`

  `void`

  `updateKeys()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### enabled

    public static boolean enabled
  + ### debug

    public static boolean debug
  + ### luaDebug

    public static boolean luaDebug
  + ### emitter

    public static zombie.radio.StorySounds.StoryEmitter emitter
  + ### instance

    private static [SLSoundManager](SLSoundManager.html "class in zombie.radio.StorySounds") instance
  + ### state

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang")> state
  + ### storySounds

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[StorySound](StorySound.html "class in zombie.radio.StorySounds")> storySounds
  + ### nextTick

    private int nextTick
  + ### borderCenterX

    private final float borderCenterX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.StorySounds.SLSoundManager.borderCenterX)
  + ### borderCenterY

    private final float borderCenterY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.StorySounds.SLSoundManager.borderCenterY)
  + ### borderRadiusMin

    private final float borderRadiusMin

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.StorySounds.SLSoundManager.borderRadiusMin)
  + ### borderRadiusMax

    private final float borderRadiusMax

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.StorySounds.SLSoundManager.borderRadiusMax)
  + ### borderScale

    private final float borderScale

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.radio.StorySounds.SLSoundManager.borderScale)
* Constructor Details
  -------------------

  + ### SLSoundManager

    private SLSoundManager()
* Method Details
  --------------

  + ### getInstance

    public static [SLSoundManager](SLSoundManager.html "class in zombie.radio.StorySounds") getInstance()
  + ### getDebug

    public boolean getDebug()
  + ### getLuaDebug

    public boolean getLuaDebug()
  + ### getStorySounds

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[StorySound](StorySound.html "class in zombie.radio.StorySounds")> getStorySounds()
  + ### print

    public void print([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)
  + ### init

    public void init()
  + ### loadSounds

    public void loadSounds()
  + ### addStorySound

    private void addStorySound([StorySound](StorySound.html "class in zombie.radio.StorySounds") storySound)
  + ### updateKeys

    public void updateKeys()
  + ### update

    public void update(int storylineDay,
    int hour,
    int min)
  + ### thunderTest

    public void thunderTest()
  + ### render

    public void render()
  + ### renderDebug

    public void renderDebug()
  + ### renderLine

    private void renderLine([UIFont](../../ui/UIFont.html "enum class in zombie.ui") font,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    int x,
    int y)
  + ### getRandomBorderPosition

    public [Vector2](../../iso/Vector2.html "class in zombie.iso") getRandomBorderPosition()
  + ### getRandomBorderRange

    public float getRandomBorderRange()