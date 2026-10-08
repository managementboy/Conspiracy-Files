[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ai](package-summary.html)
2. [MapKnowledge](MapKnowledge.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [knownBlockedEdges](#knownBlockedEdges)
6. [Constructor Details](#constructor-detail)
   1. [MapKnowledge()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getKnownBlockedEdges()](#getKnownBlockedEdges())
   2. [getKnownBlockedEdges(int, int, int)](#getKnownBlockedEdges(int,int,int))
   3. [createKnownBlockedEdges(int, int, int)](#createKnownBlockedEdges(int,int,int))
   4. [getOrCreateKnownBlockedEdges(int, int, int)](#getOrCreateKnownBlockedEdges(int,int,int))
   5. [releaseIfEmpty(KnownBlockedEdges)](#releaseIfEmpty(zombie.ai.KnownBlockedEdges))
   6. [setKnownBlockedEdgeW(int, int, int, boolean)](#setKnownBlockedEdgeW(int,int,int,boolean))
   7. [setKnownBlockedEdgeN(int, int, int, boolean)](#setKnownBlockedEdgeN(int,int,int,boolean))
   8. [setKnownBlockedDoor(IsoDoor, boolean)](#setKnownBlockedDoor(zombie.iso.objects.IsoDoor,boolean))
   9. [setKnownBlockedDoor(IsoThumpable, boolean)](#setKnownBlockedDoor(zombie.iso.objects.IsoThumpable,boolean))
   10. [setKnownBlockedWindow(IsoWindow, boolean)](#setKnownBlockedWindow(zombie.iso.objects.IsoWindow,boolean))
   11. [setKnownBlockedWindowFrame(IsoWindowFrame, boolean)](#setKnownBlockedWindowFrame(zombie.iso.objects.IsoWindowFrame,boolean))
   12. [forget()](#forget())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MapKnowledge
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ai.MapKnowledge

---

public final class MapKnowledge
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<zombie.ai.KnownBlockedEdges>`

  `knownBlockedEdges`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MapKnowledge()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private zombie.ai.KnownBlockedEdges`

  `createKnownBlockedEdges(int x,
  int y,
  int z)`

  `void`

  `forget()`

  `ArrayList<zombie.ai.KnownBlockedEdges>`

  `getKnownBlockedEdges()`

  `zombie.ai.KnownBlockedEdges`

  `getKnownBlockedEdges(int x,
  int y,
  int z)`

  `zombie.ai.KnownBlockedEdges`

  `getOrCreateKnownBlockedEdges(int x,
  int y,
  int z)`

  `private void`

  `releaseIfEmpty(zombie.ai.KnownBlockedEdges kbe)`

  `void`

  `setKnownBlockedDoor(IsoDoor object,
  boolean blocked)`

  `void`

  `setKnownBlockedDoor(IsoThumpable object,
  boolean blocked)`

  `void`

  `setKnownBlockedEdgeN(int x,
  int y,
  int z,
  boolean blocked)`

  `void`

  `setKnownBlockedEdgeW(int x,
  int y,
  int z,
  boolean blocked)`

  `void`

  `setKnownBlockedWindow(IsoWindow object,
  boolean blocked)`

  `void`

  `setKnownBlockedWindowFrame(IsoWindowFrame object,
  boolean blocked)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### knownBlockedEdges

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ai.KnownBlockedEdges> knownBlockedEdges
* Constructor Details
  -------------------

  + ### MapKnowledge

    public MapKnowledge()
* Method Details
  --------------

  + ### getKnownBlockedEdges

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ai.KnownBlockedEdges> getKnownBlockedEdges()
  + ### getKnownBlockedEdges

    public zombie.ai.KnownBlockedEdges getKnownBlockedEdges(int x,
    int y,
    int z)
  + ### createKnownBlockedEdges

    private zombie.ai.KnownBlockedEdges createKnownBlockedEdges(int x,
    int y,
    int z)
  + ### getOrCreateKnownBlockedEdges

    public zombie.ai.KnownBlockedEdges getOrCreateKnownBlockedEdges(int x,
    int y,
    int z)
  + ### releaseIfEmpty

    private void releaseIfEmpty(zombie.ai.KnownBlockedEdges kbe)
  + ### setKnownBlockedEdgeW

    public void setKnownBlockedEdgeW(int x,
    int y,
    int z,
    boolean blocked)
  + ### setKnownBlockedEdgeN

    public void setKnownBlockedEdgeN(int x,
    int y,
    int z,
    boolean blocked)
  + ### setKnownBlockedDoor

    public void setKnownBlockedDoor([IsoDoor](../iso/objects/IsoDoor.html "class in zombie.iso.objects") object,
    boolean blocked)
  + ### setKnownBlockedDoor

    public void setKnownBlockedDoor([IsoThumpable](../iso/objects/IsoThumpable.html "class in zombie.iso.objects") object,
    boolean blocked)
  + ### setKnownBlockedWindow

    public void setKnownBlockedWindow([IsoWindow](../iso/objects/IsoWindow.html "class in zombie.iso.objects") object,
    boolean blocked)
  + ### setKnownBlockedWindowFrame

    public void setKnownBlockedWindowFrame([IsoWindowFrame](../iso/objects/IsoWindowFrame.html "class in zombie.iso.objects") object,
    boolean blocked)
  + ### forget

    public void forget()