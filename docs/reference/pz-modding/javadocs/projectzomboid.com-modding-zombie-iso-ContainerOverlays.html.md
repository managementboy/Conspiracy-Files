[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [ContainerOverlays](ContainerOverlays.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [tempEntries](#tempEntries)
   3. [overlayMap](#overlayMap)
   4. [overlayNameToUnderlyingName](#overlayNameToUnderlyingName)
7. [Constructor Details](#constructor-detail)
   1. [ContainerOverlays()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [parseContainerOverlayMapV0(KahluaTableImpl)](#parseContainerOverlayMapV0(se.krka.kahlua.j2se.KahluaTableImpl))
   2. [parseContainerOverlayMapV1(KahluaTableImpl)](#parseContainerOverlayMapV1(se.krka.kahlua.j2se.KahluaTableImpl))
   3. [addOverlays(KahluaTableImpl)](#addOverlays(se.krka.kahlua.j2se.KahluaTableImpl))
   4. [hasOverlays(IsoObject)](#hasOverlays(zombie.iso.IsoObject))
   5. [getUnderlyingSpriteNames(String)](#getUnderlyingSpriteNames(java.lang.String))
   6. [updateContainerOverlaySprite(IsoObject)](#updateContainerOverlaySprite(zombie.iso.IsoObject))
   7. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ContainerOverlays
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.ContainerOverlays

---

public class ContainerOverlays
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `ContainerOverlays.ContainerOverlay`

  `private static final class`

  `ContainerOverlays.ContainerOverlayEntry`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final ContainerOverlays`

  `instance`

  `private final gnu.trove.map.hash.THashMap<String, ContainerOverlays.ContainerOverlay>`

  `overlayMap`

  `private final HashMap<String, ArrayList<String>>`

  `overlayNameToUnderlyingName`

  `private static final ArrayList<ContainerOverlays.ContainerOverlayEntry>`

  `tempEntries`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ContainerOverlays()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addOverlays(se.krka.kahlua.j2se.KahluaTableImpl overlayMap)`

  `ArrayList<String>`

  `getUnderlyingSpriteNames(String overlayName)`

  `boolean`

  `hasOverlays(IsoObject obj)`

  `private void`

  `parseContainerOverlayMapV0(se.krka.kahlua.j2se.KahluaTableImpl overlayMapTable)`

  `private void`

  `parseContainerOverlayMapV1(se.krka.kahlua.j2se.KahluaTableImpl overlaysTable)`

  `void`

  `Reset()`

  `void`

  `updateContainerOverlaySprite(IsoObject obj)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [ContainerOverlays](ContainerOverlays.html "class in zombie.iso") instance
  + ### tempEntries

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ContainerOverlays.ContainerOverlayEntry](ContainerOverlays.ContainerOverlayEntry.html "class in zombie.iso")> tempEntries
  + ### overlayMap

    private final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ContainerOverlays.ContainerOverlay](ContainerOverlays.ContainerOverlay.html "class in zombie.iso")> overlayMap
  + ### overlayNameToUnderlyingName

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> overlayNameToUnderlyingName
* Constructor Details
  -------------------

  + ### ContainerOverlays

    public ContainerOverlays()
* Method Details
  --------------

  + ### parseContainerOverlayMapV0

    private void parseContainerOverlayMapV0(se.krka.kahlua.j2se.KahluaTableImpl overlayMapTable)
  + ### parseContainerOverlayMapV1

    private void parseContainerOverlayMapV1(se.krka.kahlua.j2se.KahluaTableImpl overlaysTable)
  + ### addOverlays

    public void addOverlays(se.krka.kahlua.j2se.KahluaTableImpl overlayMap)
  + ### hasOverlays

    public boolean hasOverlays([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### getUnderlyingSpriteNames

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getUnderlyingSpriteNames([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overlayName)
  + ### updateContainerOverlaySprite

    public void updateContainerOverlaySprite([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### Reset

    public void Reset()