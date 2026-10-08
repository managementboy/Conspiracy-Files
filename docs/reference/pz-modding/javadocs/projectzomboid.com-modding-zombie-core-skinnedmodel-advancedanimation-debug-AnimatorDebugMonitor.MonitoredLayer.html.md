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
3. [MonitoredLayer](AnimatorDebugMonitor.MonitoredLayer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [index](#index)
   2. [nodeName](#nodeName)
   3. [activeNodes](#activeNodes)
   4. [animTracks](#animTracks)
   5. [active](#active)
   6. [updated](#updated)
6. [Constructor Details](#constructor-detail)
   1. [MonitoredLayer(int)](#%3Cinit%3E(int))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class AnimatorDebugMonitor.MonitoredLayer
=========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.skinnedmodel.advancedanimation.debug.AnimatorDebugMonitor.MonitoredLayer

Enclosing class:
:   `AnimatorDebugMonitor`

---

private class AnimatorDebugMonitor.MonitoredLayer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) boolean`

  `active`

  `(package private) HashMap<String, AnimatorDebugMonitor.MonitoredNode>`

  `activeNodes`

  `(package private) HashMap<String, AnimatorDebugMonitor.MonitoredTrack>`

  `animTracks`

  `(package private) int`

  `index`

  `(package private) String`

  `nodeName`

  `(package private) boolean`

  `updated`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MonitoredLayer(int idx)`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### index

    int index
  + ### nodeName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nodeName
  + ### activeNodes

    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimatorDebugMonitor.MonitoredNode](AnimatorDebugMonitor.MonitoredNode.html "class in zombie.core.skinnedmodel.advancedanimation.debug")> activeNodes
  + ### animTracks

    [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [AnimatorDebugMonitor.MonitoredTrack](AnimatorDebugMonitor.MonitoredTrack.html "class in zombie.core.skinnedmodel.advancedanimation.debug")> animTracks
  + ### active

    boolean active
  + ### updated

    boolean updated
* Constructor Details
  -------------------

  + ### MonitoredLayer

    public MonitoredLayer(int idx)