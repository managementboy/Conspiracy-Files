[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.CharacterTimedActions](package-summary.html)
2. [LuaTimedActionNew](LuaTimedActionNew.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [table](#table)
   2. [useCustomRemoteTimedActionSync](#useCustomRemoteTimedActionSync)
   3. [transactionId](#transactionId)
   4. [started](#started)
   5. [keys](#keys)
6. [Constructor Details](#constructor-detail)
   1. [LuaTimedActionNew(KahluaTable, IsoGameCharacter)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable,zombie.characters.IsoGameCharacter))
7. [Method Details](#method-detail)
   1. [waitToStart()](#waitToStart())
   2. [update()](#update())
   3. [valid()](#valid())
   4. [interruptWaitToStart()](#interruptWaitToStart())
   5. [start()](#start())
   6. [stop()](#stop())
   7. [perform()](#perform())
   8. [complete()](#complete())
   9. [Failed(Mover)](#Failed(zombie.ai.astar.Mover))
   10. [Succeeded(Path, Mover)](#Succeeded(zombie.ai.astar.Path,zombie.ai.astar.Mover))
   11. [Pathfind(IsoGameCharacter, int, int, int)](#Pathfind(zombie.characters.IsoGameCharacter,int,int,int))
   12. [getName()](#getName())
   13. [setCurrentTime(float)](#setCurrentTime(float))
   14. [getTime()](#getTime())
   15. [setCustomRemoteTimedActionSync(boolean)](#setCustomRemoteTimedActionSync(boolean))
   16. [setTime(int)](#setTime(int))
   17. [OnAnimEvent(AnimEvent)](#OnAnimEvent(zombie.core.skinnedmodel.advancedanimation.AnimEvent))
   18. [getDeltaModifiers(MoveDeltaModifiers)](#getDeltaModifiers(zombie.characters.MoveDeltaModifiers))
   19. [getMetaType()](#getMetaType())
   20. [replaceObjectInTable(Object, Object)](#replaceObjectInTable(java.lang.Object,java.lang.Object))
   21. [getTable()](#getTable())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class LuaTimedActionNew
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.CharacterTimedActions.BaseAction

zombie.characters.CharacterTimedActions.LuaTimedActionNew

All Implemented Interfaces:
:   `zombie.ai.astar.IPathfinder`

---

public final class LuaTimedActionNew
extends zombie.characters.CharacterTimedActions.BaseAction
implements zombie.ai.astar.IPathfinder

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<Object>`

  `keys`

  `(package private) boolean`

  `started`

  `(package private) se.krka.kahlua.vm.KahluaTable`

  `table`

  `(package private) byte`

  `transactionId`

  `(package private) boolean`

  `useCustomRemoteTimedActionSync`

  ### Fields inherited from class zombie.characters.CharacterTimedActions.BaseAction

  `allowedWhileDraggingCorpses, animVariables, blockMovementEtc, caloriesModifier, chr, currentTime, delta, forceComplete, forceProgressBar, forceStop, lastTime, loopAction, maxTime, overrideAnimation, overrideHandModels, pathfinding, prevLastTime, soundEffect, stopOnAim, stopOnRun, stopOnWalk, useProgressBar, waitForFinished`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `LuaTimedActionNew(se.krka.kahlua.vm.KahluaTable table,
  IsoGameCharacter chr)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `complete()`

  `void`

  `Failed(zombie.ai.astar.Mover mover)`

  `void`

  `getDeltaModifiers(MoveDeltaModifiers modifiers)`

  `String`

  `getMetaType()`

  `String`

  `getName()`

  `se.krka.kahlua.vm.KahluaTable`

  `getTable()`

  `int`

  `getTime()`

  `void`

  `interruptWaitToStart()`

  `void`

  `OnAnimEvent(zombie.core.skinnedmodel.advancedanimation.AnimEvent event)`

  `void`

  `Pathfind(IsoGameCharacter chr,
  int x,
  int y,
  int z)`

  `void`

  `perform()`

  `void`

  `replaceObjectInTable(Object oldObj,
  Object newObj)`

  `void`

  `setCurrentTime(float time)`

  `void`

  `setCustomRemoteTimedActionSync(boolean customRemoteTimedActionSync)`

  `void`

  `setTime(int maxTime)`

  `void`

  `start()`

  `void`

  `stop()`

  `void`

  `Succeeded(zombie.ai.astar.Path path,
  zombie.ai.astar.Mover mover)`

  `void`

  `update()`

  `boolean`

  `valid()`

  `void`

  `waitToStart()`

  ### Methods inherited from class zombie.characters.CharacterTimedActions.BaseAction

  `finished, forceComplete, forceStop, getCurrentTime, getJobDelta, getPrimaryHandItem, getPrimaryHandMdl, getSecondaryHandItem, getSecondaryHandMdl, hasStalled, isAllowedWhileDraggingCorpses, isForceComplete, isPathfinding, isStarted, overrideWeaponType, PlayLoopedSoundTillComplete, reset, resetJobDelta, restoreWeaponType, setActionAnim, setActionAnim, setAllowedWhileDraggingCorpses, setAnimVariable, setAnimVariable, setBlockMovementEtc, setJobDelta, setLoopedAction, setOverrideAnimation, setOverrideHandModels, setOverrideHandModels, setOverrideHandModelsObject, setOverrideHandModelsString, setOverrideHandModelsString, setPathfinding, setUseProgressBar, setWaitForFinished, stopTimedActionAnim`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### table

    se.krka.kahlua.vm.KahluaTable table
  + ### useCustomRemoteTimedActionSync

    boolean useCustomRemoteTimedActionSync
  + ### transactionId

    byte transactionId
  + ### started

    boolean started
  + ### keys

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> keys
* Constructor Details
  -------------------

  + ### LuaTimedActionNew

    public LuaTimedActionNew(se.krka.kahlua.vm.KahluaTable table,
    [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr)
* Method Details
  --------------

  + ### waitToStart

    public void waitToStart()

    Overrides:
    :   `waitToStart` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### update

    public void update()

    Overrides:
    :   `update` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### valid

    public boolean valid()

    Overrides:
    :   `valid` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### interruptWaitToStart

    public void interruptWaitToStart()

    Overrides:
    :   `interruptWaitToStart` in class `zombie.characters.CharacterTimedActions.BaseAction`
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
  + ### complete

    public void complete()

    Overrides:
    :   `complete` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### Failed

    public void Failed(zombie.ai.astar.Mover mover)

    Specified by:
    :   `Failed` in interface `zombie.ai.astar.IPathfinder`
  + ### Succeeded

    public void Succeeded(zombie.ai.astar.Path path,
    zombie.ai.astar.Mover mover)

    Specified by:
    :   `Succeeded` in interface `zombie.ai.astar.IPathfinder`
  + ### Pathfind

    public void Pathfind([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") chr,
    int x,
    int y,
    int z)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()

    Specified by:
    :   `getName` in interface `zombie.ai.astar.IPathfinder`
  + ### setCurrentTime

    public void setCurrentTime(float time)
  + ### getTime

    public int getTime()
  + ### setCustomRemoteTimedActionSync

    public void setCustomRemoteTimedActionSync(boolean customRemoteTimedActionSync)
  + ### setTime

    public void setTime(int maxTime)
  + ### OnAnimEvent

    public void OnAnimEvent(zombie.core.skinnedmodel.advancedanimation.AnimEvent event)

    Overrides:
    :   `OnAnimEvent` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### getDeltaModifiers

    public void getDeltaModifiers([MoveDeltaModifiers](../MoveDeltaModifiers.html "class in zombie.characters") modifiers)

    Overrides:
    :   `getDeltaModifiers` in class `zombie.characters.CharacterTimedActions.BaseAction`
  + ### getMetaType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMetaType()
  + ### replaceObjectInTable

    public void replaceObjectInTable([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") oldObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") newObj)
  + ### getTable

    public se.krka.kahlua.vm.KahluaTable getTable()