[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [TileOverlays](TileOverlays.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [overlayMap](#overlayMap)
   3. [overlayNameToUnderlyingName](#overlayNameToUnderlyingName)
   4. [tempEntries](#tempEntries)
7. [Constructor Details](#constructor-detail)
   1. [TileOverlays()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [addOverlays(KahluaTableImpl)](#addOverlays(se.krka.kahlua.j2se.KahluaTableImpl))
   2. [hasOverlays(IsoObject)](#hasOverlays(zombie.iso.IsoObject))
   3. [getUnderlyingSpriteNames(String)](#getUnderlyingSpriteNames(java.lang.String))
   4. [updateTileOverlaySprite(IsoObject)](#updateTileOverlaySprite(zombie.iso.IsoObject))
   5. [hasObjectOnTop(IsoObject)](#hasObjectOnTop(zombie.iso.IsoObject))
   6. [fixTableTopOverlays(IsoGridSquare)](#fixTableTopOverlays(zombie.iso.IsoGridSquare))
   7. [removeTableTopOverlays(IsoObject)](#removeTableTopOverlays(zombie.iso.IsoObject))
   8. [tryRemoveAttachedSprite(ArrayList, String)](#tryRemoveAttachedSprite(java.util.ArrayList,java.lang.String))
   9. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileOverlays
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.TileOverlays

---

public class TileOverlays
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `TileOverlays.TileOverlay`

  `private static final class`

  `TileOverlays.TileOverlayEntry`

  `private static final class`

  `TileOverlays.TileOverlayUsage`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final TileOverlays`

  `instance`

  `private final gnu.trove.map.hash.THashMap<String, TileOverlays.TileOverlay>`

  `overlayMap`

  `private final HashMap<String, ArrayList<String>>`

  `overlayNameToUnderlyingName`

  `private final ArrayList<TileOverlays.TileOverlayEntry>`

  `tempEntries`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TileOverlays()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addOverlays(se.krka.kahlua.j2se.KahluaTableImpl overlayMap)`

  `void`

  `fixTableTopOverlays(IsoGridSquare square)`

  `ArrayList<String>`

  `getUnderlyingSpriteNames(String overlayName)`

  `private boolean`

  `hasObjectOnTop(IsoObject obj)`

  `boolean`

  `hasOverlays(IsoObject obj)`

  `private void`

  `removeTableTopOverlays(IsoObject obj)`

  `void`

  `Reset()`

  `private void`

  `tryRemoveAttachedSprite(ArrayList<IsoSpriteInstance> sprites,
  String spriteName)`

  `void`

  `updateTileOverlaySprite(IsoObject obj)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [TileOverlays](TileOverlays.html "class in zombie.iso") instance
  + ### overlayMap

    private final gnu.trove.map.hash.THashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [TileOverlays.TileOverlay](TileOverlays.TileOverlay.html "class in zombie.iso")> overlayMap
  + ### overlayNameToUnderlyingName

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> overlayNameToUnderlyingName
  + ### tempEntries

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[TileOverlays.TileOverlayEntry](TileOverlays.TileOverlayEntry.html "class in zombie.iso")> tempEntries
* Constructor Details
  -------------------

  + ### TileOverlays

    public TileOverlays()
* Method Details
  --------------

  + ### addOverlays

    public void addOverlays(se.krka.kahlua.j2se.KahluaTableImpl overlayMap)
  + ### hasOverlays

    public boolean hasOverlays([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### getUnderlyingSpriteNames

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getUnderlyingSpriteNames([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overlayName)
  + ### updateTileOverlaySprite

    public void updateTileOverlaySprite([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### hasObjectOnTop

    private boolean hasObjectOnTop([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### fixTableTopOverlays

    public void fixTableTopOverlays([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### removeTableTopOverlays

    private void removeTableTopOverlays([IsoObject](IsoObject.html "class in zombie.iso") obj)
  + ### tryRemoveAttachedSprite

    private void tryRemoveAttachedSprite([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite")> sprites,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### Reset

    public void Reset()