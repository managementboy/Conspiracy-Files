[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.CharacterTimedActions](package-summary.html)
2. [LuaTimedAction](LuaTimedAction.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [table](#table)
   2. [statObj](#statObj)
6. [Constructor Details](#constructor-detail)
   1. [LuaTimedAction(KahluaTable, IsoGameCharacter)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable,zombie.characters.IsoGameCharacter))
7. [Method Details](#method-detail)
   1. [update()](#update())
   2. [valid()](#valid())
   3. [start()](#start())
   4. [stop()](#stop())
   5. [perform()](#perform())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class LuaTimedAction
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.CharacterTimedActions.BaseAction

zombie.characters.CharacterTimedActions.LuaTimedAction

---

public final class LuaTimedAction
extends zombie.characters.CharacterTimedActions.BaseAction

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static Object[]`

  `statObj`

  `(package private) se.krka.kahlua.vm.KahluaTable`

  `table`

  ### Fields inherited from class zombie.characters.CharacterTimedActions.BaseAction

  `allowedWhileDraggingCorpses, animVariables, blockMovementEtc, caloriesModifier, chr, currentTime, delta, forceComplete, forceProgressBar, forceStop, lastTime, loopAction, maxTime, overrideAnimation, overrideHandModels, pathfinding, prevLastTime, soundEffect, started, stopOnAim, stopOnRun, stopOnWalk, useProgressBar, waitForFinished`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LuaTimedAction(se.krka.kahlua.vm.KahluaTable table,
  IsoGameCharacter chr)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `perform()`

  `void`

  `start()`

  `void`

  `stop()`

  `void`

  `update()`

  `boolean`

  `valid()`

  ### Methods inherited from class zombie.characters.CharacterTimedActions.BaseAction

  `complete, finished, forceComplete, forceStop, getCurrentTime, getDeltaModifiers, getJobDelta, getPrimaryHandItem, getPrimaryHandMdl, getSecondaryHandItem, getSecondaryHandMdl, hasStalled, interruptWaitToStart, isAllowedWhileDraggingCorpses, isForceComplete, isPathfinding, isStarted, OnAnimEvent, overrideWeaponType, PlayLoopedSoundTillComplete, reset, resetJobDelta, restoreWeaponType, setActionAnim, setActionAnim, setAllowedWhileDraggingCorpses, setAnimVariable, setAnimVariable, setBlockMovementEtc, setJobDelta, setLoopedAction, setOverrideAnimation, setOverrideHandModels, setOverrideHandModels, setOverrideHandModelsObject, setOverrideHandModelsString, setOverrideHandModelsString, setPathfinding, setUseProgressBar, setWaitForFinished, stopTimedActionAnim, waitToStart`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### table

    se.krka.kahlua.vm.KahluaTable table
  + ### statObj

    public static [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")[] statObj
* Constructor Details
  -------------------

  + ### LuaTimedAction

    public LuaTimedAction(se.krka.kahlua.vm.KahluaTable table,
    [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr)
* Method Details
  --------------

  + ### update

    public void update()

    Overrides:
    :   `update` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### valid

    public boolean valid()

    Overrides:
    :   `valid` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### start

    public void start()

    Overrides:
    :   `start` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### stop

    public void stop()

    Overrides:
    :   `stop` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### perform

    public void perform()

    Overrides:
    :   `perform` in class `zombie.characters.CharacterTimedActions.BaseAction`