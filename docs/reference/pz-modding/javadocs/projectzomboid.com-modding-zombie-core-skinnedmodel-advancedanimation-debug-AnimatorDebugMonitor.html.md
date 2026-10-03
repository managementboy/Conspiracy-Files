[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.advancedanimation.debug](package-summary.html)
2. [AnimatorDebugMonitor](AnimatorDebugMonitor.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [targetIsoGameCharacter](#targetIsoGameCharacter)
   3. [knownVariables](#knownVariables)
   4. [knownVarsDirty](#knownVarsDirty)
   5. [currentState](#currentState)
   6. [monitoredLayers](#monitoredLayers)
   7. [monitoredVariables](#monitoredVariables)
   8. [customVariables](#customVariables)
   9. [logLines](#logLines)
   10. [logLineQueue](#logLineQueue)
   11. [floatsListDirty](#floatsListDirty)
   12. [hasFilterChanges](#hasFilterChanges)
   13. [hasLogUpdates](#hasLogUpdates)
   14. [logString](#logString)
   15. [maxLogSize](#maxLogSize)
   16. [maxOutputLines](#maxOutputLines)
   17. [maxFloatCache](#maxFloatCache)
   18. [floatsOut](#floatsOut)
   19. [selectedVariable](#selectedVariable)
   20. [tickCount](#tickCount)
   21. [doTickStamps](#doTickStamps)
   22. [tickStampLength](#tickStampLength)
   23. [col\_curstate](#col_curstate)
   24. [col\_layer\_nodename](#col_layer_nodename)
   25. [col\_layer\_activated](#col_layer_activated)
   26. [col\_layer\_deactivated](#col_layer_deactivated)
   27. [col\_track\_activated](#col_track_activated)
   28. [col\_track\_deactivated](#col_track_deactivated)
   29. [col\_node\_activated](#col_node_activated)
   30. [col\_node\_deactivated](#col_node_deactivated)
   31. [col\_var\_activated](#col_var_activated)
   32. [col\_var\_changed](#col_var_changed)
   33. [col\_var\_deactivated](#col_var_deactivated)
   34. [TAG\_VAR](#TAG_VAR)
   35. [TAG\_LAYER](#TAG_LAYER)
   36. [TAG\_NODE](#TAG_NODE)
   37. [TAG\_TRACK](#TAG_TRACK)
   38. [logFlags](#logFlags)
7. [Constructor Details](#constructor-detail)
   1. [AnimatorDebugMonitor(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
8. [Method Details](#method-detail)
   1. [getTarget()](#getTarget())
   2. [setTarget(IsoGameCharacter)](#setTarget(zombie.characters.IsoGameCharacter))
   3. [initCustomVars()](#initCustomVars())
   4. [addCustomVariable(String)](#addCustomVariable(java.lang.String))
   5. [removeCustomVariable(String)](#removeCustomVariable(java.lang.String))
   6. [setFilter(int, boolean)](#setFilter(int,boolean))
   7. [getFilter(int)](#getFilter(int))
   8. [isDoTickStamps()](#isDoTickStamps())
   9. [setDoTickStamps(boolean)](#setDoTickStamps(boolean))
   10. [queueLogLine(String)](#queueLogLine(java.lang.String))
   11. [queueLogLine(String, Color)](#queueLogLine(java.lang.String,zombie.core.Color))
   12. [queueLogLine(AnimatorDebugMonitor.LogType, String, Color)](#queueLogLine(zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.LogType,java.lang.String,zombie.core.Color))
   13. [addLogLine(String)](#addLogLine(java.lang.String))
   14. [addLogLine(String, Color)](#addLogLine(java.lang.String,zombie.core.Color))
   15. [addLogLine(String, Color, boolean)](#addLogLine(java.lang.String,zombie.core.Color,boolean))
   16. [addLogLine(AnimatorDebugMonitor.LogType, String, Color)](#addLogLine(zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.LogType,java.lang.String,zombie.core.Color))
   17. [addLogLine(AnimatorDebugMonitor.LogType, String, Color, boolean)](#addLogLine(zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.LogType,java.lang.String,zombie.core.Color,boolean))
   18. [log(AnimatorDebugMonitor.MonitorLogLine)](#log(zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.MonitorLogLine))
   19. [processQueue()](#processQueue())
   20. [preUpdate()](#preUpdate())
   21. [postUpdate()](#postUpdate())
   22. [update(IsoGameCharacter, AnimLayer[])](#update(zombie.characters.IsoGameCharacter,zombie.core.skinnedmodel.advancedanimation.AnimLayer%5B%5D))
   23. [updateCurrentState(String)](#updateCurrentState(java.lang.String))
   24. [updateLayer(int, AnimLayer)](#updateLayer(int,zombie.core.skinnedmodel.advancedanimation.AnimLayer))
   25. [updateActiveNode(AnimatorDebugMonitor.MonitoredLayer, String)](#updateActiveNode(zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.MonitoredLayer,java.lang.String))
   26. [updateAnimTrack(AnimatorDebugMonitor.MonitoredLayer, String, float)](#updateAnimTrack(zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.MonitoredLayer,java.lang.String,float))
   27. [updateVariable(String, String)](#updateVariable(java.lang.String,java.lang.String))
   28. [buildLogString()](#buildLogString())
   29. [IsDirty()](#IsDirty())
   30. [getLogString()](#getLogString())
   31. [IsDirtyFloatList()](#IsDirtyFloatList())
   32. [getFloatNames()](#getFloatNames())
   33. [isKnownVarsDirty()](#isKnownVarsDirty())
   34. [getKnownVariables()](#getKnownVariables())
   35. [setSelectedVariable(String)](#setSelectedVariable(java.lang.String))
   36. [getSelectedVariable()](#getSelectedVariable())
   37. [getSelectedVariableFloat()](#getSelectedVariableFloat())
   38. [getSelectedVarMinFloat()](#getSelectedVarMinFloat())
   39. [getSelectedVarMaxFloat()](#getSelectedVarMaxFloat())
   40. [getSelectedVarFloatList()](#getSelectedVarFloatList())
   41. [registerVariable(String)](#registerVariable(java.lang.String))
   42. [ensureLayers(AnimLayer[])](#ensureLayers(zombie.core.skinnedmodel.advancedanimation.AnimLayer%5B%5D))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class AnimatorDebugMonitor
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor

---

public final class AnimatorDebugMonitor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static enum`

  `AnimatorDebugMonitor.LogType`

  `private class`

  `AnimatorDebugMonitor.MonitoredLayer`

  `private class`

  `AnimatorDebugMonitor.MonitoredNode`

  `private class`

  `AnimatorDebugMonitor.MonitoredTrack`

  `private class`

  `AnimatorDebugMonitor.MonitoredVar`

  `private class`

  `AnimatorDebugMonitor.MonitorLogLine`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Color`

  `col_curstate`

  `private static final Color`

  `col_layer_activated`

  `private static final Color`

  `col_layer_deactivated`

  `private static final Color`

  `col_layer_nodename`

  `private static final Color`

  `col_node_activated`

  `private static final Color`

  `col_node_deactivated`

  `private static final Color`

  `col_track_activated`

  `private static final Color`

  `col_track_deactivated`

  `private static final Color`

  `col_var_activated`

  `private static final Color`

  `col_var_changed`

  `private static final Color`

  `col_var_deactivated`

  `private String`

  `currentState`

  `private final ArrayList<String>`

  `customVariables`

  `private boolean`

  `doTickStamps`

  `private boolean`

  `floatsListDirty`

  `private final ArrayList<Float>`

  `floatsOut`

  `private boolean`

  `hasFilterChanges`

  `private boolean`

  `hasLogUpdates`

  `static AnimatorDebugMonitor`

  `instance`

  `private static final ArrayList<String>`

  `knownVariables`

  `private static boolean`

  `knownVarsDirty`

  `private final boolean[]`

  `logFlags`

  `private final Queue<AnimatorDebugMonitor.MonitorLogLine>`

  `logLineQueue`

  `private final LinkedList<AnimatorDebugMonitor.MonitorLogLine>`

  `logLines`

  `private String`

  `logString`

  `private static final int`

  `maxFloatCache`

  `private static final int`

  `maxLogSize`

  `private static final int`

  `maxOutputLines`

  `private AnimatorDebugMonitor.MonitoredLayer[]`

  `monitoredLayers`

  `private final HashMap<String, AnimatorDebugMonitor.MonitoredVar>`

  `monitoredVariables`

  `private AnimatorDebugMonitor.MonitoredVar`

  `selectedVariable`

  `private static final String`

  `TAG_LAYER`

  `private static final String`

  `TAG_NODE`

  `private static final String`

  `TAG_TRACK`

  `private static final String`

  `TAG_VAR`

  `private IsoGameCharacter`

  `targetIsoGameCharacter`

  `private int`

  `tickCount`

  `private static final int`

  `tickStampLength`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimatorDebugMonitor(IsoGameCharacter chr)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addCustomVariable(String var)`

  `private void`

  `addLogLine(String str)`

  `private void`

  `addLogLine(String str,
  Color col)`

  `private void`

  `addLogLine(String str,
  Color col,
  boolean queue)`

  `private void`

  `addLogLine(AnimatorDebugMonitor.LogType t,
  String str,
  Color col)`

  `private void`

  `addLogLine(AnimatorDebugMonitor.LogType t,
  String str,
  Color col,
  boolean queue)`

  `private void`

  `buildLogString()`

  `private void`

  `ensureLayers(zombie.core.skinnedmodel.advancedanimation.AnimLayer[] layers)`

  `boolean`

  `getFilter(int index)`

  `ArrayList<String>`

  `getFloatNames()`

  `static List<String>`

  `getKnownVariables()`

  `String`

  `getLogString()`

  `ArrayList<Float>`

  `getSelectedVarFloatList()`

  `String`

  `getSelectedVariable()`

  `float`

  `getSelectedVariableFloat()`

  `String`

  `getSelectedVarMaxFloat()`

  `String`

  `getSelectedVarMinFloat()`

  `IsoGameCharacter`

  `getTarget()`

  `private void`

  `initCustomVars()`

  `boolean`

  `IsDirty()`

  `boolean`

  `IsDirtyFloatList()`

  `boolean`

  `isDoTickStamps()`

  `static boolean`

  `isKnownVarsDirty()`

  `private void`

  `log(AnimatorDebugMonitor.MonitorLogLine l)`

  `private void`

  `postUpdate()`

  `private void`

  `preUpdate()`

  `private void`

  `processQueue()`

  `private void`

  `queueLogLine(String str)`

  `private void`

  `queueLogLine(String str,
  Color col)`

  `private void`

  `queueLogLine(AnimatorDebugMonitor.LogType t,
  String str,
  Color col)`

  `static void`

  `registerVariable(String key)`

  `void`

  `removeCustomVariable(String var)`

  `void`

  `setDoTickStamps(boolean doTickStamps)`

  `void`

  `setFilter(int index,
  boolean b)`

  `void`

  `setSelectedVariable(String key)`

  `void`

  `setTarget(IsoGameCharacter isoGameCharacter)`

  `void`

  `update(IsoGameCharacter chr,
  zombie.core.skinnedmodel.advancedanimation.AnimLayer[] layers)`

  `private void`

  `updateActiveNode(AnimatorDebugMonitor.MonitoredLayer l,
  String name)`

  `private void`

  `updateAnimTrack(AnimatorDebugMonitor.MonitoredLayer l,
  String name,
  float blendDelta)`

  `private void`

  `updateCurrentState(String state)`

  `private void`

  `updateLayer(int index,
  zombie.core.skinnedmodel.advancedanimation.AnimLayer layer)`

  `private void`

  `updateVariable(String key,
  String val)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static [AnimatorDebugMonitor](AnimatorDebugMonitor.html "class in zombie.core.skinnedmodel.advancedanimation.debug") instance
  + ### targetIsoGameCharacter

    private [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") targetIsoGameCharacter
  + ### knownVariables

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> knownVariables
  + ### knownVarsDirty

    private static boolean knownVarsDirty
  + ### currentState

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") currentState
  + ### monitoredLayers

    private [AnimatorDebugMonitor.MonitoredLayer](AnimatorDebugMonitor.MonitoredLayer.html "class in zombie.core.skinnedmodel.advancedanimation.debug")[] monitoredLayers
  + ### monitoredVariables

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimatorDebugMonitor.MonitoredVar](AnimatorDebugMonitor.MonitoredVar.html "class in zombie.core.skinnedmodel.advancedanimation.debug")> monitoredVariables
  + ### customVariables

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> customVariables
  + ### logLines

    private final [LinkedList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedList.html "class or interface in java.util")<[AnimatorDebugMonitor.MonitorLogLine](AnimatorDebugMonitor.MonitorLogLine.html "class in zombie.core.skinnedmodel.advancedanimation.debug")> logLines
  + ### logLineQueue

    private final [Queue](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Queue.html "class or interface in java.util")<[AnimatorDebugMonitor.MonitorLogLine](AnimatorDebugMonitor.MonitorLogLine.html "class in zombie.core.skinnedmodel.advancedanimation.debug")> logLineQueue
  + ### floatsListDirty

    private boolean floatsListDirty
  + ### hasFilterChanges

    private boolean hasFilterChanges
  + ### hasLogUpdates

    private boolean hasLogUpdates
  + ### logString

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") logString
  + ### maxLogSize

    private static final int maxLogSize

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.maxLogSize)
  + ### maxOutputLines

    private static final int maxOutputLines

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.maxOutputLines)
  + ### maxFloatCache

    private static final int maxFloatCache

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.maxFloatCache)
  + ### floatsOut

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> floatsOut
  + ### selectedVariable

    private [AnimatorDebugMonitor.MonitoredVar](AnimatorDebugMonitor.MonitoredVar.html "class in zombie.core.skinnedmodel.advancedanimation.debug") selectedVariable
  + ### tickCount

    private int tickCount
  + ### doTickStamps

    private boolean doTickStamps
  + ### tickStampLength

    private static final int tickStampLength

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.tickStampLength)
  + ### col\_curstate

    private static final [Color](../../../Color.html "class in zombie.core") col\_curstate
  + ### col\_layer\_nodename

    private static final [Color](../../../Color.html "class in zombie.core") col\_layer\_nodename
  + ### col\_layer\_activated

    private static final [Color](../../../Color.html "class in zombie.core") col\_layer\_activated
  + ### col\_layer\_deactivated

    private static final [Color](../../../Color.html "class in zombie.core") col\_layer\_deactivated
  + ### col\_track\_activated

    private static final [Color](../../../Color.html "class in zombie.core") col\_track\_activated
  + ### col\_track\_deactivated

    private static final [Color](../../../Color.html "class in zombie.core") col\_track\_deactivated
  + ### col\_node\_activated

    private static final [Color](../../../Color.html "class in zombie.core") col\_node\_activated
  + ### col\_node\_deactivated

    private static final [Color](../../../Color.html "class in zombie.core") col\_node\_deactivated
  + ### col\_var\_activated

    private static final [Color](../../../Color.html "class in zombie.core") col\_var\_activated
  + ### col\_var\_changed

    private static final [Color](../../../Color.html "class in zombie.core") col\_var\_changed
  + ### col\_var\_deactivated

    private static final [Color](../../../Color.html "class in zombie.core") col\_var\_deactivated
  + ### TAG\_VAR

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TAG\_VAR

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.TAG_VAR)
  + ### TAG\_LAYER

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TAG\_LAYER

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.TAG_LAYER)
  + ### TAG\_NODE

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TAG\_NODE

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.TAG_NODE)
  + ### TAG\_TRACK

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TAG\_TRACK

    See Also:
    :   - [Constant Field Values](../../../../../constant-values.html#zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.TAG_TRACK)
  + ### logFlags

    private final boolean[] logFlags
* Constructor Details
  -------------------

  + ### AnimatorDebugMonitor

    public AnimatorDebugMonitor([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
* Method Details
  --------------

  + ### getTarget

    public [IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") getTarget()
  + ### setTarget

    public void setTarget([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") isoGameCharacter)
  + ### initCustomVars

    private void initCustomVars()
  + ### addCustomVariable

    public void addCustomVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") var)
  + ### removeCustomVariable

    public void removeCustomVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") var)
  + ### setFilter

    public void setFilter(int index,
    boolean b)
  + ### getFilter

    public boolean getFilter(int index)
  + ### isDoTickStamps

    public boolean isDoTickStamps()
  + ### setDoTickStamps

    public void setDoTickStamps(boolean doTickStamps)
  + ### queueLogLine

    private void queueLogLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### queueLogLine

    private void queueLogLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Color](../../../Color.html "class in zombie.core") col)
  + ### queueLogLine

    private void queueLogLine([AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") t,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Color](../../../Color.html "class in zombie.core") col)
  + ### addLogLine

    private void addLogLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### addLogLine

    private void addLogLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Color](../../../Color.html "class in zombie.core") col)
  + ### addLogLine

    private void addLogLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Color](../../../Color.html "class in zombie.core") col,
    boolean queue)
  + ### addLogLine

    private void addLogLine([AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") t,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Color](../../../Color.html "class in zombie.core") col)
  + ### addLogLine

    private void addLogLine([AnimatorDebugMonitor.LogType](AnimatorDebugMonitor.LogType.html "enum class in zombie.core.skinnedmodel.advancedanimation.debug") t,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Color](../../../Color.html "class in zombie.core") col,
    boolean queue)
  + ### log

    private void log([AnimatorDebugMonitor.MonitorLogLine](AnimatorDebugMonitor.MonitorLogLine.html "class in zombie.core.skinnedmodel.advancedanimation.debug") l)
  + ### processQueue

    private void processQueue()
  + ### preUpdate

    private void preUpdate()
  + ### postUpdate

    private void postUpdate()
  + ### update

    public void update([IsoGameCharacter](../../../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    zombie.core.skinnedmodel.advancedanimation.AnimLayer[] layers)
  + ### updateCurrentState

    private void updateCurrentState([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") state)
  + ### updateLayer

    private void updateLayer(int index,
    zombie.core.skinnedmodel.advancedanimation.AnimLayer layer)
  + ### updateActiveNode

    private void updateActiveNode([AnimatorDebugMonitor.MonitoredLayer](AnimatorDebugMonitor.MonitoredLayer.html "class in zombie.core.skinnedmodel.advancedanimation.debug") l,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### updateAnimTrack

    private void updateAnimTrack([AnimatorDebugMonitor.MonitoredLayer](AnimatorDebugMonitor.MonitoredLayer.html "class in zombie.core.skinnedmodel.advancedanimation.debug") l,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    float blendDelta)
  + ### updateVariable

    private void updateVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
  + ### buildLogString

    private void buildLogString()
  + ### IsDirty

    public boolean IsDirty()
  + ### getLogString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLogString()
  + ### IsDirtyFloatList

    public boolean IsDirtyFloatList()
  + ### getFloatNames

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getFloatNames()
  + ### isKnownVarsDirty

    public static boolean isKnownVarsDirty()
  + ### getKnownVariables

    public static [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getKnownVariables()
  + ### setSelectedVariable

    public void setSelectedVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### getSelectedVariable

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSelectedVariable()
  + ### getSelectedVariableFloat

    public float getSelectedVariableFloat()
  + ### getSelectedVarMinFloat

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSelectedVarMinFloat()
  + ### getSelectedVarMaxFloat

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSelectedVarMaxFloat()
  + ### getSelectedVarFloatList

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> getSelectedVarFloatList()
  + ### registerVariable

    public static void registerVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### ensureLayers

    private void ensureLayers(zombie.core.skinnedmodel.advancedanimation.AnimLayer[] layers)